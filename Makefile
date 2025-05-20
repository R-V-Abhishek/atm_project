atm: atm.tab.c lex.yy.c
	gcc -o atm atm.tab.c lex.yy.c -lfl

atm.tab.c atm.tab.h: atm.y
	bison -d atm.y

lex.yy.c: atm.l atm.tab.h
	flex atm.l

clean:
	rm -f atm atm.tab.* lex.yy.c

