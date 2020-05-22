#!/bin/sh

# simple print statements with echo
echo "hello world"
echo ""

# indeed, any command that can be run in the shell can be run in a shell file
history | grep "&&"
echo ""

# note we can set variables, and save the variable in the shell namespace
variable="Data science rocks"; echo $variable; export $variable
echo ""

# we can also take inputs from the user
echo "what is your name?"
read name
echo "How do you do, $name?"
read remark
echo "I am $remark too!"
echo ""

#and run basic loops
for i in 1 2 3 4 5
do
  echo "hello number $i"
done
