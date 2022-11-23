#include "s21_grep.h"

int main(int argc, char **argv) {
  if (argc > 2) {
    struct grepp p = {0};
    pars_arg(&p, argv, argc);
    if (p.err == 0) {
      test_txt(argc, argv, &p);
      check_doc(&p, argc, argv);
    }
  }
  return 0;
}

void test_txt(int argc, char **argv, struct grepp *p) {
  int i = 2;
  while (i < argc) {
    if (argv[i][0] != '-' && argv[i - 1][0] != '-') {
      p->txt += 1;
    }
    i++;
  }
}

void check_doc(struct grepp *p, int argc, char **argv) {
  regex_t regex;
  int txtc = 2;
  while (txtc < argc) {
    if (argv[txtc][0] != '-' && argv[txtc - 1][0] != '-') {
      FILE *txt = fopen(argv[txtc], "rt");
      if (txt == NULL && !p->s) {
        fprintf(stderr, "grep: %s: No such file or directory\n", argv[txtc]);
      }
      if (txt != NULL) {
        p->sam = 0;
        p->ccount = 0;
        int same, number = 1;
        char str[512] = {'\0'};
        int regflag = 0;
        while (fgets(str, 511, txt) != NULL) {  // gets string
          p->vflag = 0;
          p->zerf = 0;
          int f_count = 1;
          while (f_count < argc) {
            if ((argv[f_count - 1][0] == '-' || f_count == 1) &&
                argv[f_count][0] != '-') {  // gets finder
              if (p->i) regflag = REG_ICASE;
              regcomp(&regex, argv[f_count], regflag);
              same = regexec(&regex, str, 0, NULL, 0);  // find finder in string
              if (!same) {
                p->vflag = 1;
                if (!p->zerf) p->ccount++;
                p->zerf = 1;
                p->sam = 1;
              }
              if (!same && !p->v && !p->c && !p->l) {
                if (p->n && p->o == 0) {
                  if (p->txt > 1 && !p->h) printf("%s:", argv[txtc]);
                  printf("%d:", number);
                  printf("%s", str);
                } else {
                  if (p->txt > 1 && !p->h) printf("%s:", argv[txtc]);
                  if (p->o && !p->n && !p->l) printf("%s\n", argv[f_count]);
                  if (!p->o && !p->n && !p->l) printf("%s", str);
                }
                if (!p->o) f_count = argc;
              }
              regfree(&regex);
            }
            f_count++;
          }
          if (p->v && !p->vflag) {  // _______ reVerse
            f_count = argc;
            if (p->txt > 1 && !p->h) {
              printf("%s:", argv[txtc]);
            }
            printf("%s", str);
          }
          number++;
        }
        if (p->l && p->sam) {
          printf("%s\n", argv[txtc]);
        }
        if (p->c) {
          if (p->txt > 1 && !p->h) printf("%s:", argv[txtc]);
          printf("%d\n", p->ccount);
        }
        fclose(txt);
      }
    }
    txtc++;
  }
}

void pars_arg(struct grepp *p, char **argv, int argc) {
  int count = 1;
  while (count < argc) {
    if (argv[count][0] == '-') {
      for (int i = 1; i < 4; i++) {
        if (argv[count][0] == '-') {
          if (argv[count][i] == 'e') p->e = 1;
          if (argv[count][i] == 'l') p->l = 1;
          if (argv[count][i] == 'v') p->v = 1;
          if (argv[count][i] == 'i') p->i = 1;
          if (argv[count][i] == 'n') p->n = 1;
          if (argv[count][i] == 'c') p->c = 1;
          if (argv[count][i] == 'h') p->h = 1;
          if (argv[count][i] == 's') p->s = 1;
          if (argv[count][i] == 'o') p->o = 1;
          if (p->e == 0 && p->l == 0 && p->v == 0 && p->i == 0 && p->n == 0 &&
              p->c == 0 && p->h == 0 && p->s == 0 && p->o == 0) {
            printf("llegal p -- %c sosuage:", argv[count][i]);
            count = argc;
            p->err = 1;
            i = strlen(*argv);
          }
        }
      }
    }
    count++;
  }
}
