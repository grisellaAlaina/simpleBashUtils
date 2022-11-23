CC = gcc
CFLAGS = -Wall -Werror -Wextra -std=c11

all: build

rebuild: clean build

build: s21_cat

s21_cat:
	${CC} ${CFLAGS} s21_cat.c -o s21_cat

clean:
	rm -f s21_cat

leaks: s21_cat
	leaks --atExit -- ./s21_cat -benst test_file/all_flag_tests/*

style: s21_cat
	cp ../../materials/linters/CPPLINT.cfg ./
	python3 ./../../materials/linters/cpplint.py --extensions=c *.c *.h
	rm -f CPPLINT.cfg

cppcheck: s21_cat
	cppcheck --enable=all --suppress=missingIncludeSystem . *.c *.h

checks: style cppcheck

test: s21_cat
	bash test.sh