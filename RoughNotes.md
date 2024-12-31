Using this as a reference:
https://www.a1k0n.net/2011/07/20/donut-math.html

basic compilation:
> On MacOS (ARM)

``` Assembly
as -o hello.o hello.S
ld -o hello hello.o -e _start
```
