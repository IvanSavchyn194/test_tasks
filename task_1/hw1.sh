#!/bin/bash

#var
in1=$1
in2=$2
var=$#
#==========Check_Root===========
root_check(){
if [ $(id -u) -ne 0 ]; then
	echo "$(tput setaf 1)Please use ROOT user"
  exit
fi
}
root_check
#==========Check_Input_User=========
user_check(){
if ! id "$in1"&>/dev/noll; then
        echo "$(tput setaf 1)Input corect user"
 exit
fi
}
user_check
#==========Check_Input_Var==============
var_check(){
if [ $var -ne 2  ]; then
	echo "$(tput setaf 1)Please inpyt USER and DIR"
 exit
 elif [ !  -d $in2 ]; then
	echo "$(tput setaf 1)wrong directory PATH or NAME"
 exit
fi
}
var_check

chown -R $1:$1 $2
echo "Done!!!"
