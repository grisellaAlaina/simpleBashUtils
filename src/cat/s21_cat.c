#include "s21_cat.h"

int main(int argc, char **argv) {
  struct catt p = {0};
  if (argc > 1) {
    pars_arg(&p, argv, argc);
    if (p.err == 0) {
      find_doc(argc, argv, p);
    }
  }
  return 0;
}

void pars_arg(struct catt *p, char **argv, int argc) {
  int count = 1;
  while (count < argc) {
    if (argv[count][0] == '-') {
      int slen = strlen(argv[count]);
      for (int i = 1; i < slen; i++) {
        if (argv[count][0] == '-' && argv[count][1] == '-') {
          if (!strcmp("--number-nonblank", argv[count])) p->b = 1;
          if (!strcmp("--number", argv[count])) p->n = 1;
          if (!strcmp("--squeeze-blank", argv[count])) p->s = 1;
        }
        if (argv[count][0] == '-' && argv[count][1] != '-') {
          if (argv[count][i] == 'b') p->b = 1;
          if (argv[count][i] == 'e') p->e = 1;
          if (argv[count][i] == 'n') p->n = 1;
          if (argv[count][i] == 't') p->t = 1;
          if (argv[count][i] == 's') p->s = 1;
          if (argv[count][i] == 'v') p->v = 1;
          if (argv[count][i] == 'T') p->t = 1;
          if (argv[count][i] == 'E') p->s = 1;
          if (p->b == 0 && p->e == 0 && p->n == 0 && p->t == 0 && p->s == 0 &&
              p->v == 0 && p->T == 0 && p->E == 0) {
            printf(
                "cat: illegal option -- %c\nusage: cat [-benstuv] [file ...]\n",
                argv[count][i]);
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

void find_doc(int argc, char **argv, struct catt p) {
  for (int i = 1; i < argc; i++) {
    if (argv[i][0] != '-') {
      print_doc(argv[i], &p);
    }
  }
}

void print_doc(char *doc, struct catt *p) {
  FILE *fdoc = fopen(doc, "rt");
  if (fdoc != NULL) {
    int chr;
    int stringcount = 1, prevchar = '\n', endcount = 0;
    if (p->t || p->e) p->v = 1;
    if (p->b && p->n) {
      p->n = 0;
    }
    while ((chr = fgetc(fdoc)) != EOF) {
      if (p->s && chr == '\n' && prevchar == '\n') {
        endcount++;
        if (endcount > 1) {
          continue;
        }
      } else {
        endcount = 0;
      }

      if (prevchar == '\n' && ((p->b && chr != '\n') || p->n)) {
        printf("%6d\t", stringcount++);
      }

      if (p->e && chr == '\n') {
        printf("$");
      }

      if (p->t && chr == '\t') {
        chr = '^';
        putchar(chr);
        chr = 'I';
      }

      if (p->v && chr != '\n') {
        if ((chr >= 0 && chr < 9) || (chr > 10 && chr <= 31)) {
          chr += 64;
          printf("^");
        } else if (chr == 127) {
          chr -= 64;
          printf("^");
        } else if (chr > 127 && chr < 160) {
          chr -= 64;
          printf("M-^");
        }
      }
      putchar(chr);
      prevchar = chr;
    }
    if (fclose(fdoc) != 0) {
      perror("fclose error");
    }
  } else {
    printf("cat: %s: No such file or directory\n", doc);
  }
}
