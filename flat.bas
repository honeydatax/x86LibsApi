dim mems as byte ptr
const savemem =97
dim n as integer
dim f as integer
dim sub1 as sub
dim ax as sub

color 15,5
cls
f=freefile()
open "file.api" for binary as f
n=lof(f)
print n
mems=allocate(n+savemem)
get #f,1,*mems,n
close f
sub1=cast(sub,mems)
sub1()
deallocate(mems)

