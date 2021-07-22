org 0x0
bits 32
main:
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov ecx,[esp+12]
	mov edi,[esp+16]
	sub esp,32
	mov [esp+4],edi
	mov eax,2
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	mov edi,[esp+4]
	mov eax,0
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	mov edi,[esp+4]
	mov eax,3
	mov ebx,hello
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
loop1:
	mov edi,[esp+4]
	mov eax,18
	mov ebx,hello
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	cmp eax,27
	jnz loop1
	add esp,32
ret
system_call dd 0
hello db "press esc key to exit",0
