dim mems as byte ptr
const savemem =97
dim n as integer
dim f as integer
dim sub1 as function(as integer,as integer,as integer,as integer)as integer
dim ax as integer
dim bx as integer
dim cx as integer
dim dx as integer

color 15,5
cls
f=freefile()
open "file.api" for binary as f
n=lof(f)
mems=allocate(n+savemem)
get #f,1,*mems,n
close f
sub1=cast(function(as integer,as integer,as integer,as integer)as integer,mems)
ax=10
bx=20
n=sub1(ax,bx,cx,dx)
print n
deallocate(mems)

