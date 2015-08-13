/******************************
* Author: Chiba(HUANG HUANG)  *
******************************/

#include "utility.h"
list *head;
list *argHead;
//function to reverse the order of a linked list
void revOrder(char *strp[], int num) {
  num--;
  int i;
  for(i = 0; i < num / 2; i++) {
    char *tmp=strp[i];
    strp[i] = strp[num - i];
    strp[num - i] = tmp;
  }
}
//function to take a part of a string
char** shortArray(char *str[], int len) {
  char** res = (char**)malloc((len + 1) * sizeof(char*));
  int i;
  for (i = 0; i < len; i++) {
    res[i] = str[i];
  }
  res[i] = (char*)0;
  return res;
}
//function to walk through a linked list and print values
void printPath() {
  list* it = head;
  while (it != NULL) {
    printf("%s:", it -> path);
    it = it->next;
  }
  printf("\n");
}
//print function for arguments list
void printPath2() {
  list* it = argHead;
  while (it != NULL) {
    printf("%s:", it -> path);
    it = it -> next;
  }
  printf("\n");
}
//function to add Path to the path list
void addPath(char *str) {
  list* next = (list*)malloc(sizeof(list));
  strncpy(next -> path, str, 100);
  next -> next = NULL;
  if (head == NULL){
    head = next;
    return;
  }
  list* it = head;
  while(it -> next != NULL){
    it = it -> next;
  }
  it -> next = next;
}
//function to add Path to the argument list
void addPath2(char *str, char **arg) {
  list* next = (list*)malloc(sizeof(list));
  strncpy(next -> path, str, 100);
  next -> arguments = arg;
  next -> next = NULL;
  if (argHead == NULL) {
    argHead = next;
    return;
  }
  list* it = argHead;
  while(it -> next != NULL){
    it = it -> next;
  }
  it -> next = next;
}
void getCurrentPath() {
  pid_t pid0 = fork();
  if (pid0 == 0) {
    char *argv2[2];
    argv2[0] = "pwd";
    argv2[1] = (char*)0;
    char *command = head->path;
    strcat(command, "pwd");
    execv(command, argv2);
  }
  wait(0);
}
void help() {
  puts("cd [-directory]");
  puts("    change to the target file, and no directory show current path");
  puts("clr");
  puts("    clear the screen");
  puts("dir [-directory]");
  puts("    show the target directory's file");
  puts("environ");
  puts("    show environmental variable");
  puts("echo");
  puts("    put some comments");
  puts("help");
  puts("    show the help detail");
  puts("quit");
  puts("    exit the shell");
}
//function to take a substring out from the previous string
char* substring(char* str, int a, int b) {
  char* ret = (char*)malloc((b - a + 2) * sizeof(char));
  int j = 0;
  int i;
  for(i = a; i <= b; i++){
    ret[j] =  str[i];
    j++;
  }
  ret[j] = '\0';
  return ret;
}
void initPath() {
  addPath("/bin/");
  addPath("/usr/bin/");
}
//function to count the number of spaces in the commands
char *dir() {
  char *ret = "ls";
  return ret;
}
int countSpace(char * str) {
  int i;
  int j = 0;
  for(i = 0; str[i] != '\0'; i++) {
    if(str[i] == ' ' && str[i - 1] != ' ' && str[i + 1] != '\n') {
      j++;
    }
  }
  return j;
}
void clear() {
  pid_t pid0 = fork();
  if (pid0 == 0) {
    char *argv2[2];
    argv2[0] = "clear";
    argv2[1] = (char*)0;
    char *command = head->path;
    strcat(command, "clear");
    execv(command, argv2);
  }
  wait(0);
}
//to modify endofline to endoffile
void returnMod(char* str){
  while(1) {
    if(*str == '\n'){
      *str = '\0';
      return;
    }
    str++;
  }
}
