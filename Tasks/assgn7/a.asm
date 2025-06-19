	      INT    0, 32
	      SUP    0, main
	      RET    0, 0
main:
	      INT    0, 16
	      LOD    1, 12
	     LITI    0, 1
	     EQLI    0, 0
	      JPC    0, L1
	      INT    0, 12
	      LDA    0, 12
	      POP    0, 4
	     ADDR    0, printf
	      CAL    0, 0
L1:
	      LDA    1, -4
	     LITI    0, 0
	      STO    0, 1
	      RET    0, 0
	      RET    0, 0
.literal    12 "Color is green.\n"
