%{
#defineYYSTYPE_IS_DECLARED1
typedeflongYYSTYPE;
#include<stdio.h>
#include<string.h>
#include"type.h"
floatatof();
externFILE*yyin;
externchar*yytext;
externintline_no;
intpc=0;
struct{char*name;intaddr;}symbol[SYMBOL_MAX];
intdx=0;
intstack[STACK_MAX];
INSTRUCTIONcode[CODE_MAX];
float*stack_f;
int*stack_i;
char*stack_c;
intsyntax_err=0;
intsemantic_err=0;

intsearch_symbol();
intsearch_opcode();
voidput_symbol();
intget_symbol();
voidput_data();
voidprint_code();
voidprint_symbol();
intis_inst2();
voidassem2();
voidgen_code();
voidinterp();
voidassemble_error();
voiddump_statck();
voidruntime_error();
voidinitialize();
intbase();

%}

%token  NEW_LINE COLON COMMA 
	IDENTIFIER INST1 INST2 INTEGER FLOAT STRING CHAR
	GLOBAL_WORD_SYM GLOBAL_BYTE_SYM LITERAL_SYM

%%
program
	: command_list
	;
command_list
	: command
	| command_list command
command
	: NEW_LINE
	| IDENTIFIER COLON NEW_LINE	
	{ put_symbol($1,pc);}
	| INST1 INTEGER COMMA INTEGER NEW_LINE
	{ gen_code($1,$2,$4);}
	| INST2 INTEGER COMMA IDENTIFIER NEW_LINE
	{ gen_code($1,$2,get_symbol($4));}
	| directive INTEGER INTEGER NEW_LINE
	{ put_data($2,1,$3);}
	| directive INTEGER FLOAT NEW_LINE
	{ put_data($2,2,$3);}
	| directive INTEGER STRING NEW_LINE
	{ put_data($2,3,$3);}
	| GLOBAL_BYTE_SYM INTEGER INTEGER NEW_LINE
	{ put_data($2,4,$3);}
	;
directive
	: GLOBAL_WORD_SYM
	| LITERAL_SYM
	;

%%


intsearch_symbol(char*s)
{
	int i;
	for (i=dx; i>0; i--) {
	if (strcmp(symbol[i].name,s)==0) break;
	}
	return (i);

}

intget_symbol(char*s)
{
	int i;
	i=search_symbol(s);
	if (i==0) {
	i=++dx;
	symbol[i].name=s;
	symbol[i].addr=0; }
	return(i);	
}

voidput_symbol(char*s,intp)
{
	int i;
	i=search_symbol(s);
	if (i)
	if (symbol[i].addr) 
	assemble_error(2,s);
	else 
	symbol[i].addr=p;
	else {
	dx++;
	symbol[dx].name=s;
	symbol[dx].addr=p;
	}
}

voidput_data(inti,intk,char*s)
{
	int a;
	if (k==1)
	*(stack_i+i/4)= (int)s;
	else if (k==2)
	*(stack_f+i/4)=atof(s);
	else if (k==3){ 
	*(s+strlen(s)-1)=0;
	strcpy(stack_c+i,s+1);}
	else if (k==4)
	*(stack_c+i)=(int)s;
	else 
	assemble_error(100);
}

voidprint_symbol()
{
	int i;
	printf("======== symbol =========\n");
	for (i=1; i<=dx; i++) {
	printf("%4d:  %s\t%d\n",i,symbol[i].name, symbol[i].addr);
	}
}

intis_inst2(OPCODEop)
{
	if (op==JMP || op==JPC || op==JPT || op==JPCR || op==JPTR
	|| op==ADDR || op==SUP )
	return(1);
	else	
	return(0);

}

voidassem2()
{
	int i,j;
	for (i=0; i<pc; i++) 
	if (is_inst2(code[i].f)) {
	j=code[i].a;
		if (symbol[j].addr==0)
	assemble_error(1,symbol[j].name);
	else
	code[i].a=symbol[j].addr; }
}

voidgen_code(OPCODEop,intl,longa)
{
	if (pc>=CODE_MAX) 
	assemble_error(10);
	else {
	code[pc].f=op;
	code[pc].l=l;
	code[pc].a=a;
	pc++;
	}
}

char*opcode_name[]={"OP_NULL","LOD","LDX","LDXB","LDA","LITI",
	"STO","STOB","STX","STXB",
	"SUBI","SUBF","DIVI","DIVF","ADDI","ADDF","OFFSET","MULI","MULF", "MOD", 
	"LSSI","LSSF","GTRI","GTRF", "LEQI","LEQF","GEQI","GEQF","NEQI","NEQF","EQLI","EQLF",
	"NOT", "OR", "AND", "CVTI","CVTF",
	"JPC","JPCR","JMP","JPT","JPTR",
	"INT","INCI","INCF","DECI","DECF", "SUP","CAL","ADDR", 
	"RET", "MINUSI","MINUSF","LDI","LDIB","POP"} ;

intsearch_opcode(char*s)
{
	int i;
	for (i=NOP-1; i>0;i--) {
	if (strcmp(opcode_name[i],s)==0) break;
	}
	return(i);
}

voidprint_code()
{
	OPCODE op;
	int i;
	printf("========  code ==========\n");
	for (i=0; i<pc;i++){
	  printf("%4d:  %s\t%d,%d\n",i, opcode_name[code[i].f], 
	code[i].l, code[i].a);}
}

voidinitialize()
{
	stack_i=stack;
	stack_f=stack;
	stack_c=stack;
	put_symbol("printf",-1);
	put_symbol("malloc",-2);
	put_symbol("scanf",-3);
}

voidmain(intargc,char*argv[])
{
	if (argc==1){
	printf("source file not given\n");
	exit(1);}
	if (argc==2) 
	if ((yyin=fopen(argv[1],"r"))==NULL){
	printf("can not open input file: %s\n",argv[1]);
	exit(1);}
	initialize();
	yyparse();
	if (syntax_err) exit(1);
	print_symbol();
	assem2();
	if (semantic_err) exit(1);
	print_code();
	interp();

}

yyerror(char*s)
{
	syntax_err++;
	printf("syntax error at line %d: near %s\n",line_no,yytext);
	print_code();
}


voidassemble_error(inti,char*s)
{
	switch (i) {
	case 1: printf("error: undefined identifier %s\n",s);
	break;
	case 2: printf("error: duplicated identifier %s\n",s);
	break;
	case 10:printf("error: too long code size\n");
	break;
	default:printf("error: unknown\n");
	}
	semantic_err++;
}


