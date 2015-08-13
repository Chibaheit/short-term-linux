/******************************
* Author: Chiba(HUANG HUANG)  *
******************************/

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include <sys/types.h>
#include <sys/wait.h>
typedef struct Path {
    char path[100];
    char** arguments;
    struct Path *next;
} list;

extern list *head;
extern list *argHead;

char **shortArray(char *str[],int);
void printPath();
void addPath(char* str);
void addPath2(char* str,char **);
void printPath2();
int countSpace(char * str);
void getCurrentPath();
char *substring(char* ,int,int);
void help();
void initPath();
void clear();
char *dir();
void returnMod(char* str);
void revOrder(char *strp[],int);
