org 0x0
bits 32
main:
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov ecx,[esp+12]
	mov edi,[esp+16]
	sub esp,32
	mov [esp+4],edi
	mov eax,6
	mov ebx,640
	mov ecx,480
	mov edx,4
	push edx
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	mov edi,[esp+4]
	mov eax,9
	mov ebx,5
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	mov edi,[esp+4]
	mov eax,10
	mov ebx,0
	mov ecx,0
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	mov edi,[esp+4]
	mov eax,11
	mov ebx,640
	mov ecx,480
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
loop1:
	mov edi,[esp+4]
	mov eax,18
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
	cmp eax,27
	jnz loop1
exitss:
	mov edi,[esp+4]
	add esp,32
	mov eax,19
	call edi
ret
system_call dd 0
hello db "press esc key to exit",0
