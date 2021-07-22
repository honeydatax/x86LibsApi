public const savemem =97
dim shared mems as integer ptr
dim shared xx as integer
dim shared yy as integer
dim shared cccolors as integer
dim shared ddx as integer
dim shared ddxx as integer

public sub exits()
	deallocate(mems)
	system()
end sub
public function iinkey() as integer
	dim r as integer
	r=asc(inkey())
	if r=255 then r=asc(mid(inkey(),2,1))
	return r
end function
public sub llocate(r1 as integer,r2 as integer,r3 as integer)
	locate r1,r2,r3
end sub
public sub stringdraw (byval aw as integer)
	dim aww as integer
	dim z0 as zstring ptr
	aww=ddxx+aw
	z0=cast(zstring ptr,aww)
	draw string (xx,yy),*z0,cccolors
end sub 
public sub cccircle(r1 as integer)
	circle(xx,yy),r1,cccolors
end sub
public sub ccircle(r1 as integer)
	circle(xx,yy),r1,cccolors,,,,f
end sub
public sub lline(r1 as integer,r2 as integer)
	line(xx,yy)-(xx+r1,yy+r2),cccolors
end sub
public sub rrect(r1 as integer,r2 as integer)
	line(xx,yy)-(xx+r1,yy+r2),cccolors,b
end sub
public sub sscreen(r1 as integer)
	screen r1
end sub
public sub bbox(r1 as integer,r2 as integer)
	line(xx,yy)-(xx+r1,yy+r2),cccolors,bf
end sub
public sub ssetxy(r1 as integer,r2 as integer)
	xx=r1
	yy=r2
end sub
public sub ssetcolor(r1 as integer)
	cccolors=r1
end sub
public sub ssleep(r1 as integer)
	sleep r1
end sub
public sub sscreenres(r1 as integer,r2 as integer,r3 as integer)
	screenres r1,r2,r3
end sub
public sub ccolor(r1 as integer,r2 as integer)
	color r1,r2
end sub
public sub cccolor(r1 as integer)
	color r1
end sub
public sub pprint (byval aw as integer)
	dim aww as integer
	dim z0 as zstring ptr
	aww=ddxx+aw
	z0=cast(zstring ptr,aww)
	print *z0
end sub 
public sub pcls ()
	cls
end sub 
public sub messg ()
	print "system call ver 1.0"
end sub 
public sub debugs (r0 as integer,r1 as integer,r2 as integer,r3 as integer)
	print "res:",
	print r0,
	print r1,
	print r2,
	print r3
end sub 

public function syscalls cdecl(byval r0 as integer,byval r1 as integer,byval r2 as integer,byval r3 as integer)as integer
	dim rr as integer
	if r0 = 0 then messg
	if r0 = 1 then debugs(r0,r1,r2,r3)
	if r0 = 2 then pcls()
	if r0 = 3 then pprint(r1)
	if r0 = 4 then ccolor(r1,r2)
	if r0 = 5 then cccolor(r1)
	if r0 = 6 then sscreenres(r1,r2,r3)
	if r0 = 7 then ssleep(r1)
	if r0 = 8 then sscreen(r1)
	if r0 = 9 then ssetcolor(r1)
	if r0 = 10 then ssetxy(r1,r2)
	if r0 = 11 then bbox(r1,r2)
	if r0 = 12 then rrect(r1,r2)
	if r0 = 13 then lline(r1,r2)
	if r0 = 14 then ccircle(r1)
	if r0 = 15 then cccircle(r1)
	if r0 = 16 then stringdraw(r1)
	if r0 = 17 then llocate(r1,r2,r3)
	if r0 = 18 then rr=iinkey()
	if r0 = 19 then exits()
	return rr
end function
public function on_runs(files as string,ax as integer,bx as integer,cx as integer,dx as integer)as integer
	dim syscallss as function (as integer,as integer,as integer,as integer)as integer
	dim n as integer
	dim f as integer
	dim sub1 as function(as integer,as integer,as integer,as integer)as integer
	dim nn as integer
	f=freefile()
	open files for binary as f
	n=lof(f)
	mems=allocate(n+savemem)
	if mems <> -1 then get #f,1,*mems,n
	close f

	sub1=cast(function(as integer,as integer,as integer,as integer)as integer,mems)
	ddxx=cast(integer,mems)
	syscallss=procptr(syscalls)
	ddx=cast(integer,syscallss)
	if mems<>-1 then
		nn=sub1(ax,bx,cx,ddx)
	else
		print "error:"
	end if
	deallocate(mems)
	return nn
end function

dim dx as integer
color 15,5
dx=on_runs (command(1),10,20,30,dx)
system()
