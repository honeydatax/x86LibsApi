const savemem =64
dim n as integer
dim f as integer
dim mems as byte ptr 
dim sub1 as sub

color 15,5
cls
f=freefile()
open "file.api" for binary as f
n=lof(f)
print n
mems=allocate(n+savemem)
get #f, *mems ,n
close f
sub1=mems
sub1()
deallocate(mems)
