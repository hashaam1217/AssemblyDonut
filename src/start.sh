#!/bin/bash
rm hello
as -o hello.o test_code.s
ld -o hello hello.o -e _start
./hello
