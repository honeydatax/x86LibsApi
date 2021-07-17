org 0x0
bits 32
main:
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov ecx,[esp+12]
	mov edx,[esp+16]
	add eax,ebx
	push eax
	call edx
	pop eax
ret
