org 0x0
bits 32
main:
	mov eax,[esp+4]
	mov ebx,[esp+8]
	mov ecx,[esp+12]
	mov esi,[esp+16]
	push esi
	push ecx
	push ebx
	push eax
	call esi
	add esp,16
ret
