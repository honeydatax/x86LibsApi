public const savemem =97
public function syscalls cdecl(r0 as integer,r1 as integer,r2 as integer,r3 as integer)as integer
	print r0
	print r1
	print r2
	print r3
	print "system call ver 1.0"
	return r3
end function
public function on_runs(files as string,ax as integer,bx as integer,cx as integer,dx as integer)as integer
	dim syscallss as function (as integer,as integer,as integer,as integer)as integer
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
	deallocate(mems)
	return nn
end function

dim dx as integer
print on_runs (command(1),10,20,30,dx)
system()
