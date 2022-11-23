# !/bin/bash

./s21_grep -e while s21_grep.c > s21_grep.txt
grep -e while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -i while s21_grep.c > s21_grep.txt
grep -i while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -c while s21_grep.c > s21_grep.txt
grep -c while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -l while s21_grep.c > s21_grep.txt
grep -l while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -n while s21_grep.c > s21_grep.txt
grep -n while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -v while s21_grep.c > s21_grep.txt
grep -v while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e while s21_grep.c > s21_grep.txt
grep -e while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep while s21_grep.c > s21_grep.txt
grep while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep '[a-f]' s21_grep.c test.sh > s21_grep.txt
grep '[a-f]' s21_grep.c test.sh > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt


./s21_grep while s21_grep.c > s21_grep.txt
grep while s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -e while s21_grep.c test.sh -e for > s21_grep.txt
grep -e while s21_grep.c test.sh -e for > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -s while s21_gre > s21_grep.txt
grep -s while s21_gre > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -iv whilE s21_grep.c > s21_grep.txt
grep -iv whilE s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -in wHile s21_grep.c > s21_grep.txt
grep -in wHile s21_grep.c > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -ih wHile s21_grep.c test.sh> s21_grep.txt
grep -ih wHile s21_grep.c test.sh> grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt

./s21_grep -o while s21_grep.c test.sh> s21_grep.txt
grep -o while s21_grep.c test.sh > grep.txt
diff -s s21_grep.txt grep.txt
rm s21_grep.txt grep.txt


# ./s21_grep -on while s21_grep.c test.sh> s21_grep.txt
# grep -on while s21_grep.c test.sh > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt



#include "s21_grep.h"
