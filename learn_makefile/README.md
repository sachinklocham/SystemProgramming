make is a utility , which is used for automation
make utility executes commands written in Makefile .

can execute shell commands.

rule: specify target on leftside then colon(:) then it must be 1 TAB on next line not spaces then define receipie

target:
    command1
    command2
target:
    cmd1
    cmd2

 xyz:
	ls
	touch newfile.txt

abc:
	echo "This is target abc"

$ make will execute first target by default
else specify target like 
$make target2



