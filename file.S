org 0x0
bits 32
main:
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov ecx,[esp+12]
	mov edi,[esp+16]
	mov eax,0
	push edi
	push ecx
	push ebx
	push eax
	call edi
	add esp,16
ret
system_call dd 0
