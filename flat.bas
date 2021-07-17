public const savemem =97
public sub syscalls cdecl()
	print "system call ver 1.0"
end sub
public function on_runs(files as string,ax as integer,bx as integer,cx as integer,dx as integer)as integer
	dim syscallss as sub 
	dim mems as integer ptr
	dim n as integer
	dim f as integer
	dim sub1 as function(as integer,as integer,as integer,as integer)as integer
	dim ddx as integer
	dim nn as integer
	f=freefile()
	open files for binary as f
	n=lof(f)
	mems=allocate(n+savemem)
	get #f,1,*mems,n
	close f

	sub1=cast(function(as integer,as integer,as integer,as integer)as integer,mems)
	syscallss=procptr(syscalls)
	ddx=cast(integer,syscallss)
	nn=sub1(ax,bx,cx,ddx)
	print nn
	deallocate(mems)
	system()
	return nn
end function

dim dx as integer
on_runs ("file.api",10,20,0,dx)
