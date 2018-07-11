Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CC7147D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 21:34:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732444AbeGKVkb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 17:40:31 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:46017 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387609AbeGKVkb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 17:40:31 -0400
Received: by mail-pf0-f194.google.com with SMTP id i26-v6so7795880pfo.12
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 14:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=xvkcAYA52KVnkWQ5u0hrBRpushf7GoDGYKnwRrDI2ak=;
        b=gzvLYE2meKrbFF7dwwKA3FubeAHKuqdxq9Nm24XKcskanLxHgCwgzVolH7e1KijwC3
         W9ZcBG+/wglBJPJcMEypLmnnzrvA1j7sHLyUkXocko6Qs2ymXmKWI1FxEFhG3Yk8BnMM
         ZZFoP59SgbDajxZSyFmANm30Gf2JbBws9ujKlzrKMA7WuQ5SyLI8DIx1+XuRIaMDfu+q
         iEcoBevv5OGxjVZr+n4mAA/YBhQ8KYT02uj5ZuIYxhZd1rUQ3HWjnYqK5lPA4K+uNT2u
         tkauBKhGSbRq6/D1OsX3f4WAjyOBYZLceMtOcxrSmto2Bu6I/kuVLsN3Ik8EIVBEM2eU
         Th7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=xvkcAYA52KVnkWQ5u0hrBRpushf7GoDGYKnwRrDI2ak=;
        b=c54MO21O6Yip/zPJ+6yyHUAyAal0JbUQxavYPosAe0hMC/Rf7ewjmBAKr4hC77EJmm
         lLF3Adllyt2aK+Kdo8V6/oJVYvMk58p1LoKKNE9uieOzcrY5oYDdeJlML2Ebp4Co+N64
         RFkXWDwM0nUzX1LZ77uHRAqfC5T1qpDNaNyI/udLdfGVaHDwz1v60STmAZEgOcisI1yu
         pPkJmEs/R9shZN5ZwkRaQlHCR6Pyyf7aiR1HQPegaPtsnGYBmbla9e3BWjZx7FUsxR5b
         WxtqhfJRsmkxzMBfd6hBfwfwrqWO2AjrFgwftPMsshdrVyXflJmsUJff4WtL/O1wgZOJ
         ogmw==
X-Gm-Message-State: AOUpUlEYe/mY8RP9L4hac8UgPOyrX6uBsl+0u9svaVpVgIPiO+YzpOio
        TJVCKUe3msHa4a614480hEQkjg==
X-Google-Smtp-Source: AAOMgpeBXqA9KWjiaYGzHkaqV3O0BCUSbLpd1ma3lfW9Wpn62dIZzh5DdZN8pDdw+UTzKzaXEvr9Ig==
X-Received: by 2002:a65:52cc:: with SMTP id z12-v6mr274134pgp.69.1531344853197;
        Wed, 11 Jul 2018 14:34:13 -0700 (PDT)
Received: from ?IPv6:2600:1010:b052:968:4f0:92ce:1385:5f3d? ([2600:1010:b052:968:4f0:92ce:1385:5f3d])
        by smtp.gmail.com with ESMTPSA id e82-v6sm51656936pfd.40.2018.07.11.14.34.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jul 2018 14:34:12 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 17/27] x86/cet/shstk: User-mode shadow stack support
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (15F79)
In-Reply-To: <CAG48ez1ytOfQyNZMNPFp7XqKcpd7_aRai9G5s7rx0V=8ZG+r2A@mail.gmail.com>
Date:   Wed, 11 Jul 2018 14:34:10 -0700
Cc:     yu-cheng.yu@intel.com, the arch/x86 maintainers <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, bsingharora@gmail.com,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>, hjl.tools@gmail.com,
        Jonathan Corbet <corbet@lwn.net>, keescook@chromiun.org,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        ravi.v.shankar@intel.com, vedvyas.shanbhogue@intel.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F5FEFFD-0A9A-4181-8D15-5FC323632BA6@amacapital.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-18-yu-cheng.yu@intel.com> <CAG48ez1ytOfQyNZMNPFp7XqKcpd7_aRai9G5s7rx0V=8ZG+r2A@mail.gmail.com>
To:     Jann Horn <jannh@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



> On Jul 11, 2018, at 2:10 PM, Jann Horn <jannh@google.com> wrote:
>=20
>> On Tue, Jul 10, 2018 at 3:31 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote=
:
>>=20
>> This patch adds basic shadow stack enabling/disabling routines.
>> A task's shadow stack is allocated from memory with VM_SHSTK
>> flag set and read-only protection.  The shadow stack is
>> allocated to a fixed size.
>>=20
>> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> [...]
>> diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
>> new file mode 100644
>> index 000000000000..96bf69db7da7
>> --- /dev/null
>> +++ b/arch/x86/kernel/cet.c
> [...]
>> +static unsigned long shstk_mmap(unsigned long addr, unsigned long len)
>> +{
>> +       struct mm_struct *mm =3D current->mm;
>> +       unsigned long populate;
>> +
>> +       down_write(&mm->mmap_sem);
>> +       addr =3D do_mmap(NULL, addr, len, PROT_READ,
>> +                      MAP_ANONYMOUS | MAP_PRIVATE, VM_SHSTK,
>> +                      0, &populate, NULL);
>> +       up_write(&mm->mmap_sem);
>> +
>> +       if (populate)
>> +               mm_populate(addr, populate);
>> +
>> +       return addr;
>> +}
>=20
> How does this interact with UFFDIO_REGISTER?
>=20
> Is there an explicit design decision on whether FOLL_FORCE should be
> able to write to shadow stacks? I'm guessing the answer is "yes,
> FOLL_FORCE should be able to write to shadow stacks"? It might make
> sense to add documentation for this.

FOLL_FORCE should be able to write them, IMO. Otherwise we=E2=80=99ll need a=
 whole new debugging API.

By the time an attacker can do FOLL_FORCE writes, the attacker can directly m=
odify *text*, and CET is useless.  We should probably audit all uses of FOLL=
_FORCE and remove as many as we can get away with.

>=20
> Should the kernel enforce that two shadow stacks must have a guard
> page between them so that they can not be directly adjacent, so that
> if you have too much recursion, you can't end up corrupting an
> adjacent shadow stack?

I think the answer is a qualified =E2=80=9Cno=E2=80=9D. I would like to inst=
ead enforce a general guard page on all mmaps that don=E2=80=99t use MAP_FOR=
CE. We *might* need to exempt any mmap with an address hint for compatibilit=
y.

My commercial software has been manually adding guard pages on every single m=
map done by tcmalloc for years, and it has caught a couple bugs and costs es=
sentially nothing.

Hmm. Linux should maybe add something like Windows=E2=80=99 =E2=80=9Creserve=
d=E2=80=9D virtual memory. It=E2=80=99s basically a way to ask for a VA rang=
e that explicitly contains nothing and can be subsequently be turned into so=
mething useful with the equivalent of MAP_FORCE.

>=20
>> +int cet_setup_shstk(void)
>> +{
>> +       unsigned long addr, size;
>> +
>> +       if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
>> +               return -EOPNOTSUPP;
>> +
>> +       size =3D in_ia32_syscall() ? SHSTK_SIZE_32:SHSTK_SIZE_64;
>> +       addr =3D shstk_mmap(0, size);
>> +
>> +       /*
>> +        * Return actual error from do_mmap().
>> +        */
>> +       if (addr >=3D TASK_SIZE_MAX)
>> +               return addr;
>> +
>> +       set_shstk_ptr(addr + size - sizeof(u64));
>> +       current->thread.cet.shstk_base =3D addr;
>> +       current->thread.cet.shstk_size =3D size;
>> +       current->thread.cet.shstk_enabled =3D 1;
>> +       return 0;
>> +}
> [...]
>> +void cet_disable_free_shstk(struct task_struct *tsk)
>> +{
>> +       if (!cpu_feature_enabled(X86_FEATURE_SHSTK) ||
>> +           !tsk->thread.cet.shstk_enabled)
>> +               return;
>> +
>> +       if (tsk =3D=3D current)
>> +               cet_disable_shstk();
>> +
>> +       /*
>> +        * Free only when tsk is current or shares mm
>> +        * with current but has its own shstk.
>> +        */
>> +       if (tsk->mm && (tsk->mm =3D=3D current->mm) &&
>> +           (tsk->thread.cet.shstk_base)) {
>> +               vm_munmap(tsk->thread.cet.shstk_base,
>> +                         tsk->thread.cet.shstk_size);
>> +               tsk->thread.cet.shstk_base =3D 0;
>> +               tsk->thread.cet.shstk_size =3D 0;
>> +       }
>> +
>> +       tsk->thread.cet.shstk_enabled =3D 0;
>> +}
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
