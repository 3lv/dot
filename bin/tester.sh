#!/usr/bin/bash

FILE="main.cpp"
BRUTE="brute.cpp"
GENERATOR="generator.cpp"
TESTNR="10"

green=$(tput setaf 34)
red=$(tput setaf 196)
blue=$(tput setaf 33)
reset=$(tput sgr0)

while [[ $# -gt 0 ]]; do
case $1 in
	-f|--file)
		FILE="$2"
		shift
		shift
		;;
	-b|--brute)
		BRUTE="$2"
		shift
		shift
		;;
	-g|--generator)
		GENERATOR="$2"
		shift
		shift
		;;
	-n|--number)
		TESTNR="$2"
		shift
		shift
		;;
esac
done

g++ -o main $FILE
g++ -o brute $BRUTE
g++ -o generator $GENERATOR

for (( i=1; i <= $TESTNR; i++ ))
do
	./generator > input
	./main < input > output
	./brute < input > correct
	if diff --ignore-space-change output correct > /dev/null; then
		echo "${blue}test ${i}${reset}: ${green}CORRECT${reset}"
	else
		wrong=1
		echo "${blue}test ${i}${reset}: ${red}INCORRECT${reset}"
	fi
	if [[ wrong -eq 1 ]]; then
		break
	fi
done

if [[ wrong -eq 1 ]]; then
	echo "${blue}input:${reset}"
	cat input
	echo ""
	echo "${red}output:${reset}"
	cat output
	echo ""
	echo "${green}correct output:${reset}"
	cat correct
	echo ""
fi
