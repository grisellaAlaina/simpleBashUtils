all: clean build

build: s21_grep

s21_grep:
	gcc -Wall -Werror -Wextra -std=c11 s21_grep.c -g -o s21_grep

clean:
	rm -f s21_grep

leaks: s21_grep
	leaks --atExit -- ./s21_grep -benst test_file/all_flag_tests/*

style: s21_grep
	cp ../../materials/linters/CPPLINT.cfg ./
	python3 ./../../materials/linters/cpplint.py --extensions=c *.c *.h
	rm -f CPPLINT.cfg

cppcheck: s21_grep
	cppcheck --enable=all --suppress=missingIncludeSystem . *.c *.h

checks: style cppcheck

vg:
	CK_FORK=no valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --show-reachable=no --leak-resolution=med --track-origins=yes ./s21_grep -n void -s s21_grep.c
