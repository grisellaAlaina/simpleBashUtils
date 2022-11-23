#ifndef _S21_CAT_H_
#define _S21_CAT_H_

#include <stdio.h>
#include <string.h>

struct catt {
  int b;
  int e;
  int n;
  int t;
  int s;
  int T;
  int E;
  int v;
  int err;
};

void pars_arg(struct catt *p, char **argv, int argc);
void find_doc(int argc, char **argv, struct catt p);
void print_doc(char *doc, struct catt *p);

#endif  //_S21_CAT_H_