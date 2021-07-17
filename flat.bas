public const savemem =97
public sub syscalls cdecl()
	print "system call ver 1.0"
end sub
public function connects(ax as integer,bx as integer,cx as integer,dx as integer)as integer
	dim mems as byte ptr
	dim syscallss as sub 
	dim n as integer
	dim f as integer
	dim sub1 as function(as integer,as integer,as integer,as integer)as integer
	dim ddx as integer

	color 15,5
	cls
	f=freefile()
	open "file.api" for binary as f
	n=lof(f)
	mems=allocate(n+savemem)
	get #f,1,*mems,n
	close f
	
	sub1=cast(function(as integer,as integer,as integer,as integer)as integer,mems)
	syscallss=procptr(syscalls)
	ddx=cast(integer,syscallss)
	n=sub1(ax,bx,cx,ddx)
	print n
	deallocate(mems)
	system()
	return ddx
end function

dim dx as integer
connects 10,20,0,dx 
