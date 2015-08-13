myshell: utility.o myshell.o
		gcc -o myshell utility.o myshell.o
utility.o: utility.c utility.h
		gcc -c utility.c
myshell.o: myshell.c utility.h
		gcc -c myshell.c
clean:
		rm -rf *.o myshell
