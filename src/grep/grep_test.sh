#!/bin/bash

WINS=0
FAILS=0

echo "s21_grep integration test. Fails:" > log.txt

for var in -h -i -n -l -s -v -c -o
do
  TEST1="for s21_grep.c txt Makefile $var"
  echo "$TEST1"
  ./s21_grep $TEST1 > s21_grep.txt
  grep $TEST1 > grep.txt
  DIFF="$(diff -s s21_grep.txt grep.txt)"
  if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
    then
      (( WINS++ ))
    else
      echo "$TEST1" >> log.txt
      (( FAILS++ ))
  fi
  rm s21_grep.txt grep.txt

  TEST2="for s21_grep.c $var"
  echo "$TEST2"
  ./s21_grep $TEST2 > s21_grep.txt
  grep $TEST2 > grep.txt
  DIFF="$(diff -s s21_grep.txt grep.txt)"
  if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
    then
      (( WINS++ ))
    else
      echo "$TEST2" >> log.txt
      (( FAILS++ ))
  fi
  rm s21_grep.txt grep.txt

  TEST3="-e for -e int s21_grep.c txt Makefile $var"
  echo "$TEST3"
  ./s21_grep $TEST3 > s21_grep.txt
  grep $TEST3 > grep.txt
  DIFF="$(diff -s s21_grep.txt grep.txt)"
  if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
    then
      (( WINS++ ))
    else
      echo "$TEST3" >> log.txt
      (( FAILS++ ))
  fi
  rm s21_grep.txt grep.txt

  TEST4="-e for -e int s21_grep.c $var"
  echo "$TEST4"
  ./s21_grep $TEST4 > s21_grep.txt
  grep $TEST4 > grep.txt
  DIFF="$(diff -s s21_grep.txt grep.txt)"
  if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
    then
      (( WINS++ ))
    else
      echo "$TEST4" >> log.txt
      (( FAILS++ ))
  fi
  rm s21_grep.txt grep.txt

#   TEST5="-e regex -e print s21_grep.c -f pattern.txt $var"
#   echo "$TEST5"
#   ./s21_grep $TEST5 > s21_grep.txt
#   grep $TEST5 > grep.txt
#   DIFF="$(diff -s s21_grep.txt grep.txt)"
#   if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
#     then
#       (( WINS++ ))
#     else
#       echo "$TEST5" >> log.txt
#       (( FAILS++ ))
#   fi
#   rm s21_grep.txt grep.txt

#   TEST6="-e while -e void s21_grep.c Makefile -f pattern.txt $var"
#   echo "$TEST6"
#   ./s21_grep $TEST6 > s21_grep.txt
#   grep $TEST6 > grep.txt
#   DIFF="$(diff -s s21_grep.txt grep.txt)"
#   if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
#     then
#       (( WINS++ ))
#     else
#       echo "$TEST6" >> log.txt
#       (( FAILS++ ))
#   fi
#   rm s21_grep.txt grep.txt
done

for var in -v -c -l -n -h -o -i -s
do
  for var2 in -v -c -l -n -h -o -i -s
  do
    if [ $var != $var2 ]
      then
        TEST1="for s21_grep.c txt Makefile $var $var2"
        echo "$TEST1"
        ./s21_grep $TEST1 > s21_grep.txt
        grep $TEST1 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST1" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt

        TEST2="for s21_grep.c $var $var2"
        echo "$TEST2"
        ./s21_grep $TEST2 > s21_grep.txt
        grep $TEST2 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST2" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt

        TEST3="-e for -e ^int s21_grep.c txt Makefile $var $var2"
        echo "$TEST3"
        ./s21_grep $TEST3 > s21_grep.txt
        grep $TEST3 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST3" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt

        TEST4="-e for -e ^int s21_grep.c $var $var2"
        echo "$TEST4"
        ./s21_grep $TEST4 > s21_grep.txt
        grep $TEST4 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST4" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt

        TEST5="-e regex -e ^print s21_grep.c -f pattern.txt $var $var2"
        echo "$TEST5"
        ./s21_grep $TEST5 > s21_grep.txt
        grep $TEST5 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST5" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt
        
        TEST6="-e while -e void s21_grep.c Makefile -f pattern.txt $var $var2"
        echo "$TEST6"
        ./s21_grep $TEST6 > s21_grep.txt
        grep $TEST6 > grep.txt
        DIFF="$(diff -s s21_grep.txt grep.txt)"
        if [ "$DIFF" == "Files s21_grep.txt and grep.txt are identical" ]
          then
            (( WINS++ ))
          else
            echo "$TEST6" >> log.txt
            (( FAILS++ ))
        fi
        rm s21_grep.txt grep.txt
    fi
  done
done

if [ $FAILS == 0 ]
then
    echo "There's not. Everything is fine!" >> log.txt
fi


cat log.txt

echo ""
echo "win: $WINS"
echo "fail: $FAILS"
echo ""