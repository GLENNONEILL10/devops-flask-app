
conway: main.o conway.o
	gcc -o conway main.o conway.o

main.o: main.c conway.h
	gcc -c -o main.o main.c

conway.0: conway.c conway.h
	gcc -c -o conway.o conway.c

clean:
	rm -f *.0 conway

install: conway
	cp conway $(HOME)/.local/bin/

