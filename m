Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 769517D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Nov 2018 20:46:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbeKJG2r (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 10 Nov 2018 01:28:47 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39122 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726110AbeKJG2r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Nov 2018 01:28:47 -0500
Received: by mail-pl1-f194.google.com with SMTP id b5-v6so1446707pla.6
        for <linux-doc@vger.kernel.org>; Fri, 09 Nov 2018 12:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=z3cT5Pw2wUEAlev8kV/vpVeePw6wc3P0Gr59IdrASFA=;
        b=KhVvCXqjNpgs5mO1CwaMzbw53NBMRompT5U1Pj6I5zbHgTBUqgLM8sscgGaszQWWRZ
         dvPrsWvTOeILL+13+f9XYkvLq2aKx8XtEO4hQvK20p/0RDhjOt4a1fdS26W9odSwENqu
         Fj7v6KgVTEABfsfhC5Mzrw/xv9McrSqpv1FzW9GwDE9RZyVQPRu15M/ZMVfUvACCqdX8
         GsIsT4BjfKqxnsmxlayMZDfPxMfzFCJMkddsGhmqn33c1gvltXIjlHOALJ7eKfkoGdzF
         KN5ODQVDHL+aI3P7h0nwVHkgj3YLZ++N3rCWyoKQ7gGiQgDkSSag+anJYPb2q0Hn7h+A
         1GxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=z3cT5Pw2wUEAlev8kV/vpVeePw6wc3P0Gr59IdrASFA=;
        b=Mi1r2mt8Q5j48N3mxsHS39rl3e7wXYdWit83V419FwT5gj5+bFp3jdsAYWGiGojVa2
         fdyZOjph+H89pYl2b6iDY0zyrGTAN7cnMaFqo+u6hzahluXP9rLriatHnth8fcph4eKk
         E+qRSmn6XST0WFD86qYZ5xzbcPoBhwervlykUi7STlL390fqLUVvjFiJcXTTBxmeywsF
         v85JgpQEGwJMRUyuDXnACOpjGcgOzAHZOLQfNLkqiLHIG59RpRDdq13MKwsPidzNCZd1
         sPCO7W5XN75VRDWJSlVxMtDXBwV5zH5Bv2rujLmE/d/Ox4R0FyruKteee9VTt/ewWb0H
         7/lQ==
X-Gm-Message-State: AGRZ1gIhoMSATN/uWG57SN+dCgRbgd5oQPbNSor0jMNE2GOZptCyNinq
        vFV/eXnpk88p68EgwafFyoE1nQ==
X-Google-Smtp-Source: AJdET5c93wXMOz30GcguG9OwCKrFU3Bk6Pr8dOLM53sGJJPc1lMOPeYRUFdhWDkTiq3hrigwebh1fw==
X-Received: by 2002:a17:902:6b87:: with SMTP id p7-v6mr10570515plk.282.1541796391592;
        Fri, 09 Nov 2018 12:46:31 -0800 (PST)
Received: from ?IPv6:2600:1010:b002:666:dc7a:5a83:1f2b:9078? ([2600:1010:b002:666:dc7a:5a83:1f2b:9078])
        by smtp.gmail.com with ESMTPSA id k129sm11737599pgk.29.2018.11.09.12.46.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Nov 2018 12:46:30 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: afaef01c00 ("x86/entry: Add STACKLEAK erasing the kernel stack .."): double fault: 0000 [#1]
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <CAG48ez2xSLFGjMYSYJTLwEnZoZJuXUfdoCp6_vGrywBU4SQNkQ@mail.gmail.com>
Date:   Fri, 9 Nov 2018 12:46:29 -0800
Cc:     alex.popov@linux.com, Andy Lutomirski <luto@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, lkp@01.org,
        lkp@intel.com,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-doc@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B681F10-752C-4327-9960-3987CE17A619@amacapital.net>
References: <5be58a6e.w0IbLdKsiRknTygq%lkp@intel.com> <CAG48ez2xSLFGjMYSYJTLwEnZoZJuXUfdoCp6_vGrywBU4SQNkQ@mail.gmail.com>
To:     Jann Horn <jannh@google.com>, Joerg Roedel <joro@8bytes.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Nov 9, 2018, at 12:06 PM, Jann Horn <jannh@google.com> wrote:
>=20
> +Andy, Thomas, Ingo
>=20
>> On Fri, Nov 9, 2018 at 2:24 PM kernel test robot <lkp@intel.com> wrote:
>> 0day kernel testing robot got the below dmesg and the first bad commit is=

>>=20
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master=

>>=20
>> commit afaef01c001537fa97a25092d7f54d764dc7d8c1
>> Author:     Alexander Popov <alex.popov@linux.com>
>> AuthorDate: Fri Aug 17 01:16:58 2018 +0300
>> Commit:     Kees Cook <keescook@chromium.org>
>> CommitDate: Tue Sep 4 10:35:47 2018 -0700
>>=20
>>    x86/entry: Add STACKLEAK erasing the kernel stack at the end of syscal=
ls
> [...]
>> [  127.808225] double fault: 0000 [#1]
>> [  127.808695] CPU: 0 PID: 414 Comm: trinity-main Tainted: G             =
   T 4.19.0-rc2-00001-gafaef01 #1
>> [  127.809799] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S 1.10.2-1 04/01/2014
>> [  127.810760] RIP: 0010:ftrace_ops_test+0x27/0xa0
>> [  127.811289] Code: eb 9a 90 41 54 55 49 89 f4 53 48 89 d3 48 89 fd 48 8=
1 ec b0 00 00 00 65 48 8b 04 25 28 00 00 00 48 89 84 24 a8 00 00 00 31 c0 <e=
8> 54 df ff ff 48 85 db 74 57 e8 4a df ff ff 48 8b 85 d0 00 00 00
>> [  127.813385] RSP: 0018:fffffe0000001fb8 EFLAGS: 00010046
> [...]
>> [  127.819762] CR2: fffffe0000001fa8 CR3: 000000001579a000 CR4: 000000000=
00006b0
> [...]
>> [  127.822234] Call Trace:
>> [  127.822530]  <ENTRY_TRAMPOLINE>
>> [  127.822914]  ? __ia32_sys_rseq+0x2f0/0x2f0
>> [  127.823395]  ftrace_ops_list_func+0xa5/0x1b0
>> [  127.823922]  ftrace_call+0x5/0x34
>> [  127.824318]  ? stackleak_erase+0x5/0xf0
>> [  127.824789]  ? stackleak_erase+0x43/0xf0
>> [  127.825260]  stackleak_erase+0x5/0xf0
>> [  127.825699]  syscall_return_via_sysret+0x61/0x81
>> [  127.826238] WARNING: stack recursion on stack type 4
>> [  127.826243] WARNING: can't dereference registers at (____ptrval____) f=
or ip syscall_return_via_sysret+0x61/0x81
>> [  127.826246]  </ENTRY_TRAMPOLINE>
>> [  127.828342] ---[ end trace e9f96d3f45575499 ]---
>> [  127.828911] RIP: 0010:ftrace_ops_test+0x27/0xa0
>=20
> CR2: fffffe0000001fa8, RSP: 0018:fffffe0000001fb8; this is a pagefault
> on the stack. fffffe0000000000 is CPU_ENTRY_AREA_RO_IDT;
> fffffe0000001000 is CPU_ENTRY_AREA_PER_CPU; so fffffe0000002000 is the
> page with the entry stack for cpu 0, and you overflowed from that into
> the readonly gdt at fffffe0000001000, which doubles as a guard page
> for the entry stack:
>=20
> struct cpu_entry_area {
>        char gdt[PAGE_SIZE];
>=20
>        /*
>         * The GDT is just below entry_stack and thus serves (on x86_64) as=

>         * a a read-only guard page.
>         */
>        struct entry_stack_page entry_stack_page;
> [...]
> };
>=20
> In other words: You're calling C code on the entry trampoline stack;
> this C code can call into ftrace; and the entry trampoline stack isn't
> big enough for ftrace shenanigans. I think you probably shouldn't be
> calling C code on the entry stack, but maybe one of the X86 folks has
> a different opinion?

My opinion was that, on x86_32, the entry stack ought to be fairly large so t=
hat NMIs could execute on the entry stack.  I don=E2=80=99t remember what th=
e code actually does, though.

But stackleak_erase should probably not run on the entry stack. That seems l=
ike it=E2=80=99s just asking for trouble.=
