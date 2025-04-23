0x00007ffff7fca380 <+0>:	endbr64
0x00007ffff7fca384 <+4>:	push   rbp
0x00007ffff7fca385 <+5>:	mov    rbp,rsp
0x00007ffff7fca388 <+8>:	push   r15
0x00007ffff7fca38a <+10>:	push   r14
0x00007ffff7fca38c <+12>:	xor    r14d,r14d
0x00007ffff7fca38f <+15>:	push   r13
0x00007ffff7fca391 <+17>:	lea    r13,[rip+0x33670]        # 0x7ffff7ffda08 <_rtld_global+2568>
0x00007ffff7fca398 <+24>:	push   r12
0x00007ffff7fca39a <+26>:	push   rbx
0x00007ffff7fca39b <+27>:	sub    rsp,0x28
0x00007ffff7fca39f <+31>:	mov    DWORD PTR [rbp-0x4c],0x2
0x00007ffff7fca3a6 <+38>:	mov    rax,QWORD PTR [rip+0x33653]        # 0x7ffff7ffda00 <_rtld_global+2560>
0x00007ffff7fca3ad <+45>:	mov    r12,rax
0x00007ffff7fca3b0 <+48>:	sub    r12,0x1
0x00007ffff7fca3b4 <+52>:	js     0x7ffff7fca5d1 <_dl_fini+593>
0x00007ffff7fca3ba <+58>:	lea    rax,[rax+rax*4]
0x00007ffff7fca3be <+62>:	lea    rsi,[rip+0x32c3b]        # 0x7ffff7ffd000 <_rtld_global>
0x00007ffff7fca3c5 <+69>:	shl    rax,0x5
0x00007ffff7fca3c9 <+73>:	lea    rbx,[rsi+rax*1-0xa0]
0x00007ffff7fca3d1 <+81>:	jmp    0x7ffff7fca3f6 <_dl_fini+118>
0x00007ffff7fca3d3 <+83>:	nop    DWORD PTR [rax+rax*1+0x0]
0x00007ffff7fca3d8 <+88>:	mov    rdi,r13
0x00007ffff7fca3db <+91>:	call   QWORD PTR [rip+0x32647]        # 0x7ffff7ffca28 <___rtld_mutex_unlock>
0x00007ffff7fca3e1 <+97>:	sub    r12,0x1
0x00007ffff7fca3e5 <+101>:	sub    rbx,0xa0
0x00007ffff7fca3ec <+108>:	cmp    r12,0xffffffffffffffff
0x00007ffff7fca3f0 <+112>:	je     0x7ffff7fca5b0 <_dl_fini+560>
0x00007ffff7fca3f6 <+118>:	mov    rdi,r13
0x00007ffff7fca3f9 <+121>:	call   QWORD PTR [rip+0x32631]        # 0x7ffff7ffca30 <___rtld_mutex_lock>
0x00007ffff7fca3ff <+127>:	mov    ecx,DWORD PTR [rbx+0x8]
0x00007ffff7fca402 <+130>:	test   ecx,ecx
0x00007ffff7fca404 <+132>:	je     0x7ffff7fca3d8 <_dl_fini+88>
0x00007ffff7fca406 <+134>:	mov    rax,QWORD PTR [rbx]
0x00007ffff7fca409 <+137>:	movzx  eax,BYTE PTR [rax+0x356]
0x00007ffff7fca410 <+144>:	and    eax,0x1
0x00007ffff7fca413 <+147>:	cmp    eax,r14d
0x00007ffff7fca416 <+150>:	jne    0x7ffff7fca3d8 <_dl_fini+88>
0x00007ffff7fca418 <+152>:	mov    esi,0x2
0x00007ffff7fca41d <+157>:	mov    rdi,r12
0x00007ffff7fca420 <+160>:	mov    DWORD PTR [rbp-0x38],ecx
0x00007ffff7fca423 <+163>:	mov    QWORD PTR [rbp-0x48],rsp
0x00007ffff7fca427 <+167>:	call   0x7ffff7fdf9e0 <_dl_audit_activity_nsid>
0x00007ffff7fca42c <+172>:	mov    eax,DWORD PTR [rbp-0x38]
0x00007ffff7fca42f <+175>:	mov    rdx,rsp
0x00007ffff7fca432 <+178>:	mov    rcx,rax
0x00007ffff7fca435 <+181>:	lea    rax,[rax*8+0xf]
0x00007ffff7fca43d <+189>:	shr    rax,0x4
0x00007ffff7fca441 <+193>:	shl    rax,0x4
0x00007ffff7fca445 <+197>:	mov    rsi,rax
0x00007ffff7fca448 <+200>:	and    rsi,0xfffffffffffff000
0x00007ffff7fca44f <+207>:	sub    rdx,rsi
0x00007ffff7fca452 <+210>:	cmp    rsp,rdx
0x00007ffff7fca455 <+213>:	je     0x7ffff7fca46c <_dl_fini+236>
0x00007ffff7fca457 <+215>:	sub    rsp,0x1000
0x00007ffff7fca45e <+222>:	or     QWORD PTR [rsp+0xff8],0x0
0x00007ffff7fca467 <+231>:	cmp    rsp,rdx
0x00007ffff7fca46a <+234>:	jne    0x7ffff7fca457 <_dl_fini+215>
0x00007ffff7fca46c <+236>:	and    eax,0xfff
0x00007ffff7fca471 <+241>:	sub    rsp,rax
0x00007ffff7fca474 <+244>:	test   rax,rax
0x00007ffff7fca477 <+247>:	jne    0x7ffff7fca5e9 <_dl_fini+617>
0x00007ffff7fca47d <+253>:	mov    rax,QWORD PTR [rbx]
0x00007ffff7fca480 <+256>:	mov    r8,rsp
0x00007ffff7fca483 <+259>:	xor    r15d,r15d
0x00007ffff7fca486 <+262>:	test   rax,rax
0x00007ffff7fca489 <+265>:	jne    0x7ffff7fca499 <_dl_fini+281>
0x00007ffff7fca48b <+267>:	jmp    0x7ffff7fca4ca <_dl_fini+330>
0x00007ffff7fca48d <+269>:	nop    DWORD PTR [rax]
0x00007ffff7fca490 <+272>:	mov    rax,QWORD PTR [rax+0x18]
0x00007ffff7fca494 <+276>:	test   rax,rax
0x00007ffff7fca497 <+279>:	je     0x7ffff7fca4ca <_dl_fini+330>
0x00007ffff7fca499 <+281>:	cmp    QWORD PTR [rax+0x28],rax
0x00007ffff7fca49d <+285>:	jne    0x7ffff7fca490 <_dl_fini+272>
0x00007ffff7fca49f <+287>:	cmp    r15d,ecx
0x00007ffff7fca4a2 <+290>:	jae    0x7ffff7fca612 <_dl_fini+658>
0x00007ffff7fca4a8 <+296>:	mov    edx,r15d
0x00007ffff7fca4ab <+299>:	mov    QWORD PTR [r8+rdx*8],rax
0x00007ffff7fca4af <+303>:	mov    DWORD PTR [rax+0x424],r15d
0x00007ffff7fca4b6 <+310>:	add    r15d,0x1
0x00007ffff7fca4ba <+314>:	add    DWORD PTR [rax+0x350],0x1
0x00007ffff7fca4c1 <+321>:	mov    rax,QWORD PTR [rax+0x18]
0x00007ffff7fca4c5 <+325>:	test   rax,rax
0x00007ffff7fca4c8 <+328>:	jne    0x7ffff7fca499 <_dl_fini+281>
0x00007ffff7fca4ca <+330>:	cmp    ecx,r15d
0x00007ffff7fca4cd <+333>:	sete   al
0x00007ffff7fca4d0 <+336>:	test   r12,r12
0x00007ffff7fca4d3 <+339>:	jne    0x7ffff7fca4dd <_dl_fini+349>
0x00007ffff7fca4d5 <+341>:	test   al,al
0x00007ffff7fca4d7 <+343>:	je     0x7ffff7fca650 <_dl_fini+720>
0x00007ffff7fca4dd <+349>:	test   r12,r12
0x00007ffff7fca4e0 <+352>:	sete   dl
0x00007ffff7fca4e3 <+355>:	test   al,al
0x00007ffff7fca4e5 <+357>:	jne    0x7ffff7fca4f7 <_dl_fini+375>
0x00007ffff7fca4e7 <+359>:	test   dl,dl
0x00007ffff7fca4e9 <+361>:	jne    0x7ffff7fca4f7 <_dl_fini+375>
0x00007ffff7fca4eb <+363>:	sub    ecx,0x1
0x00007ffff7fca4ee <+366>:	cmp    ecx,r15d
0x00007ffff7fca4f1 <+369>:	jne    0x7ffff7fca631 <_dl_fini+689>
0x00007ffff7fca4f7 <+375>:	mov    rdi,r8
0x00007ffff7fca4fa <+378>:	movzx  edx,dl
0x00007ffff7fca4fd <+381>:	mov    ecx,0x1
0x00007ffff7fca502 <+386>:	mov    esi,r15d
0x00007ffff7fca505 <+389>:	mov    QWORD PTR [rbp-0x38],r8
0x00007ffff7fca509 <+393>:	call   0x7ffff7fd83a0 <_dl_sort_maps>
0x00007ffff7fca50e <+398>:	mov    rdi,r13
0x00007ffff7fca511 <+401>:	call   QWORD PTR [rip+0x32511]        # 0x7ffff7ffca28 <___rtld_mutex_unlock>
0x00007ffff7fca517 <+407>:	test   r15d,r15d
0x00007ffff7fca51a <+410>:	je     0x7ffff7fca54e <_dl_fini+462>
0x00007ffff7fca51c <+412>:	mov    r8,QWORD PTR [rbp-0x38]
0x00007ffff7fca520 <+416>:	mov    esi,r15d
0x00007ffff7fca523 <+419>:	lea    rax,[r8+rsi*8]
0x00007ffff7fca527 <+423>:	nop    WORD PTR [rax+rax*1+0x0]
0x00007ffff7fca530 <+432>:	mov    r15,QWORD PTR [r8]
0x00007ffff7fca533 <+435>:	test   BYTE PTR [r15+0x354],0x10
0x00007ffff7fca53b <+443>:	jne    0x7ffff7fca568 <_dl_fini+488>
0x00007ffff7fca53d <+445>:	add    r8,0x8
0x00007ffff7fca541 <+449>:	sub    DWORD PTR [r15+0x350],0x1
0x00007ffff7fca549 <+457>:	cmp    rax,r8
0x00007ffff7fca54c <+460>:	jne    0x7ffff7fca530 <_dl_fini+432>
0x00007ffff7fca54e <+462>:	xor    esi,esi
0x00007ffff7fca550 <+464>:	mov    rdi,r12
0x00007ffff7fca553 <+467>:	call   0x7ffff7fdf9e0 <_dl_audit_activity_nsid>
0x00007ffff7fca558 <+472>:	mov    rsp,QWORD PTR [rbp-0x48]
0x00007ffff7fca55c <+476>:	jmp    0x7ffff7fca3e1 <_dl_fini+97>
0x00007ffff7fca561 <+481>:	nop    DWORD PTR [rax+0x0]
0x00007ffff7fca568 <+488>:	mov    rdi,r15
0x00007ffff7fca56b <+491>:	mov    QWORD PTR [rbp-0x40],rax
0x00007ffff7fca56f <+495>:	mov    QWORD PTR [rbp-0x38],r8
0x00007ffff7fca573 <+499>:	call   0x7ffff7fc6090 <_dl_call_fini>
0x00007ffff7fca578 <+504>:	mov    rdi,r15
0x00007ffff7fca57b <+507>:	call   0x7ffff7fdfcd0 <_dl_audit_objclose>
0x00007ffff7fca580 <+512>:	mov    r8,QWORD PTR [rbp-0x38]
0x00007ffff7fca584 <+516>:	mov    rax,QWORD PTR [rbp-0x40]
0x00007ffff7fca588 <+520>:	sub    DWORD PTR [r15+0x350],0x1
0x00007ffff7fca590 <+528>:	add    r8,0x8
0x00007ffff7fca594 <+532>:	cmp    rax,r8
0x00007ffff7fca597 <+535>:	jne    0x7ffff7fca530 <_dl_fini+432>
0x00007ffff7fca599 <+537>:	xor    esi,esi
0x00007ffff7fca59b <+539>:	mov    rdi,r12
0x00007ffff7fca59e <+542>:	call   0x7ffff7fdf9e0 <_dl_audit_activity_nsid>
0x00007ffff7fca5a3 <+547>:	mov    rsp,QWORD PTR [rbp-0x48]
0x00007ffff7fca5a7 <+551>:	jmp    0x7ffff7fca3e1 <_dl_fini+97>
0x00007ffff7fca5ac <+556>:	nop    DWORD PTR [rax+0x0]
0x00007ffff7fca5b0 <+560>:	cmp    DWORD PTR [rbp-0x4c],0x1
0x00007ffff7fca5b4 <+564>:	je     0x7ffff7fca5d1 <_dl_fini+593>
0x00007ffff7fca5b6 <+566>:	mov    eax,DWORD PTR [rip+0x32894]        # 0x7ffff7ffce50 <_rtld_global_ro+944>
0x00007ffff7fca5bc <+572>:	mov    DWORD PTR [rbp-0x4c],0x1
0x00007ffff7fca5c3 <+579>:	mov    r14d,0x1
0x00007ffff7fca5c9 <+585>:	test   eax,eax
0x00007ffff7fca5cb <+587>:	jne    0x7ffff7fca3a6 <_dl_fini+38>
0x00007ffff7fca5d1 <+593>:	test   BYTE PTR [rip+0x324c8],0x80        # 0x7ffff7ffcaa0 <_rtld_global_ro>
0x00007ffff7fca5d8 <+600>:	jne    0x7ffff7fca5f4 <_dl_fini+628>
0x00007ffff7fca5da <+602>:	lea    rsp,[rbp-0x28]
0x00007ffff7fca5de <+606>:	pop    rbx
0x00007ffff7fca5df <+607>:	pop    r12
0x00007ffff7fca5e1 <+609>:	pop    r13
0x00007ffff7fca5e3 <+611>:	pop    r14
0x00007ffff7fca5e5 <+613>:	pop    r15
0x00007ffff7fca5e7 <+615>:	pop    rbp
0x00007ffff7fca5e8 <+616>:	ret
0x00007ffff7fca5e9 <+617>:	or     QWORD PTR [rsp+rax*1-0x8],0x0
0x00007ffff7fca5ef <+623>:	jmp    0x7ffff7fca47d <_dl_fini+253>
0x00007ffff7fca5f4 <+628>:	mov    rdx,QWORD PTR [rip+0x334a5]        # 0x7ffff7ffdaa0 <_rtld_global+2720>
0x00007ffff7fca5fb <+635>:	mov    rsi,QWORD PTR [rip+0x33496]        # 0x7ffff7ffda98 <_rtld_global+2712>
0x00007ffff7fca602 <+642>:	lea    rdi,[rip+0x2a40f]        # 0x7ffff7ff4a18
0x00007ffff7fca609 <+649>:	xor    eax,eax
0x00007ffff7fca60b <+651>:	call   0x7ffff7fd3b00 <_dl_debug_printf>
0x00007ffff7fca610 <+656>:	jmp    0x7ffff7fca5da <_dl_fini+602>
0x00007ffff7fca612 <+658>:	lea    rcx,[rip+0x2a477]        # 0x7ffff7ff4a90 <__PRETTY_FUNCTION__.0>
0x00007ffff7fca619 <+665>:	mov    edx,0x4d
0x00007ffff7fca61e <+670>:	lea    rsi,[rip+0x2874d]        # 0x7ffff7ff2d72
0x00007ffff7fca625 <+677>:	lea    rdi,[rip+0x28750]        # 0x7ffff7ff2d7c
0x00007ffff7fca62c <+684>:	call   0x7ffff7fe2370 <__GI___assert_fail>
0x00007ffff7fca631 <+689>:	lea    rcx,[rip+0x2a458]        # 0x7ffff7ff4a90 <__PRETTY_FUNCTION__.0>
0x00007ffff7fca638 <+696>:	mov    edx,0x58
0x00007ffff7fca63d <+701>:	lea    rsi,[rip+0x2872e]        # 0x7ffff7ff2d72
0x00007ffff7fca644 <+708>:	lea    rdi,[rip+0x2a395]        # 0x7ffff7ff49e0
0x00007ffff7fca64b <+715>:	call   0x7ffff7fe2370 <__GI___assert_fail>
0x00007ffff7fca650 <+720>:	lea    rcx,[rip+0x2a439]        # 0x7ffff7ff4a90 <__PRETTY_FUNCTION__.0>
0x00007ffff7fca657 <+727>:	mov    edx,0x57
0x00007ffff7fca65c <+732>:	lea    rsi,[rip+0x2870f]        # 0x7ffff7ff2d72
0x00007ffff7fca663 <+739>:	lea    rdi,[rip+0x2a34e]        # 0x7ffff7ff49b8
0x00007ffff7fca66a <+746>:	call   0x7ffff7fe2370 <__GI___assert_fail>