#ifndef S21_GREP_H
#define S21_GREP_H

#include <regex.h>
#include <stdio.h>
#include <string.h>

struct grepp {
  int e, i, v, c, l, n, h, o, s, err, ccount, sam, txt, zerf, vflag;
};

void test_txt(int argc, char **argv, struct grepp *p);
void check_doc(struct grepp *p, int argc, char **argv);
void pars_arg(struct grepp *p, char **argv, int argc);
#endif  // s21_grep.h