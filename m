Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 41A007D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 22:22:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390645AbeGKW22 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 18:28:28 -0400
Received: from mail-pf0-f194.google.com ([209.85.192.194]:42498 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390563AbeGKW22 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 18:28:28 -0400
Received: by mail-pf0-f194.google.com with SMTP id l9-v6so7654772pff.9
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 15:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=NC5Wll+Ta90LWa7k3YHEONHdQo3lP6YNOAIHcaPq1+E=;
        b=HK39ME0feC6LgQfKJIWgi4Z6wlPvIKWIpfRp4JSUx3Hzcfi1qult6Fnj8EfGQyewzg
         QPR9o+s+7yVUBLuRwuglutgvxSZZ40yD6WOLbJUEmPDTwaV29ScSPAvFE++4o5F7NG8n
         ICQT6Nio9+yK0UiDM7BNLUpAwpV/u9Iea4j/SePB3F+Q8vpdG5PjyKgnPahJ0qbTUX+F
         k1tcAv6Iv09C896C0N8RxxekS6NkXa7abLHt2kKXcQdKFWVdyaV+WaFRHPAxJUaj6p0U
         y7LTgYq+dlKCcIvelXicgVmtIXL1S+ykc/1V4D+IF/1aSq1SDKNr8+IXSs7/l2OZ8ZFV
         Pa0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=NC5Wll+Ta90LWa7k3YHEONHdQo3lP6YNOAIHcaPq1+E=;
        b=rpsl/Vs/IlHsxea9wqC1C6GP4uPeunJYCF4vdDDXyJR9LRNtZrWfVExR4o9ipmft2T
         vkQ3SC+ybIXXdPncXeDPRx3UIUwwaMtTX6poC94ayFd68ULjg00/Twejd2OSpglCE+iG
         wY49TPFEnJ/16bLA9l/KyIpmcscCIKIFUr12RDVvgxIA8OIah5ZY2hQpbBYLFXSSvId5
         qNLtN7fpeieZTqKWgyhtyxh4Om5ctWLJvpu3k8QE/XfXwGPXZO89fkbYx/OQWgQpFEan
         VNZ4sbT6vH60ifCKeIxr6HFPDhE0ROIgOyAIuLnAmIYH831jkzKM52Nk4bJRRnKRWsUl
         RGfw==
X-Gm-Message-State: AOUpUlHLZPjDNqsrfG1eAz1XZUKFCDFdmpKnmOEhITS1V+jwgQHUtzBZ
        wjYZe4MUM6kdgEzXQN8eIu3d3w==
X-Google-Smtp-Source: AAOMgpfaX5+MrPU/Sam4qzUAlWGk9zylnt2U7i7gAQ6gi0Uk4P6PR30RAl/2gg2ZPApc6aNXauezrw==
X-Received: by 2002:a62:8a4f:: with SMTP id y76-v6mr396246pfd.233.1531347720835;
        Wed, 11 Jul 2018 15:22:00 -0700 (PDT)
Received: from ?IPv6:2600:1010:b052:968:4f0:92ce:1385:5f3d? ([2600:1010:b052:968:4f0:92ce:1385:5f3d])
        by smtp.gmail.com with ESMTPSA id a15-v6sm20060710pfe.32.2018.07.11.15.21.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Jul 2018 15:21:59 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC PATCH v2 17/27] x86/cet/shstk: User-mode shadow stack support
From:   Andy Lutomirski <luto@amacapital.net>
X-Mailer: iPhone Mail (15F79)
In-Reply-To: <CAG48ez1OwQMmhQfHaauo+vneywsQ_ERKr4uVcQebC=GbdqZWtA@mail.gmail.com>
Date:   Wed, 11 Jul 2018 15:21:58 -0700
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
Message-Id: <A034EC34-13E7-4AEF-BB3C-FEF14143B601@amacapital.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-18-yu-cheng.yu@intel.com> <CAG48ez1ytOfQyNZMNPFp7XqKcpd7_aRai9G5s7rx0V=8ZG+r2A@mail.gmail.com> <6F5FEFFD-0A9A-4181-8D15-5FC323632BA6@amacapital.net> <CAG48ez1OwQMmhQfHaauo+vneywsQ_ERKr4uVcQebC=GbdqZWtA@mail.gmail.com>
To:     Jann Horn <jannh@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> On Jul 11, 2018, at 2:51 PM, Jann Horn <jannh@google.com> wrote:
>=20
> On Wed, Jul 11, 2018 at 2:34 PM Andy Lutomirski <luto@amacapital.net> wrot=
e:
>>> On Jul 11, 2018, at 2:10 PM, Jann Horn <jannh@google.com> wrote:
>>>=20
>>>> On Tue, Jul 10, 2018 at 3:31 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wro=
te:
>>>>=20
>>>> This patch adds basic shadow stack enabling/disabling routines.
>>>> A task's shadow stack is allocated from memory with VM_SHSTK
>>>> flag set and read-only protection.  The shadow stack is
>>>> allocated to a fixed size.
>>>>=20
>>>> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
>>> [...]
>>>> diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
>>>> new file mode 100644
>>>> index 000000000000..96bf69db7da7
>>>> --- /dev/null
>>>> +++ b/arch/x86/kernel/cet.c
>>> [...]
>>>> +static unsigned long shstk_mmap(unsigned long addr, unsigned long len)=

>>>> +{
>>>> +       struct mm_struct *mm =3D current->mm;
>>>> +       unsigned long populate;
>>>> +
>>>> +       down_write(&mm->mmap_sem);
>>>> +       addr =3D do_mmap(NULL, addr, len, PROT_READ,
>>>> +                      MAP_ANONYMOUS | MAP_PRIVATE, VM_SHSTK,
>>>> +                      0, &populate, NULL);
>>>> +       up_write(&mm->mmap_sem);
>>>> +
>>>> +       if (populate)
>>>> +               mm_populate(addr, populate);
>>>> +
>>>> +       return addr;
>>>> +}
> [...]
>>> Should the kernel enforce that two shadow stacks must have a guard
>>> page between them so that they can not be directly adjacent, so that
>>> if you have too much recursion, you can't end up corrupting an
>>> adjacent shadow stack?
>>=20
>> I think the answer is a qualified =E2=80=9Cno=E2=80=9D. I would like to i=
nstead enforce a general guard page on all mmaps that don=E2=80=99t use MAP_=
FORCE. We *might* need to exempt any mmap with an address hint for compatibi=
lity.
>=20
> I like this idea a lot.
>=20
>> My commercial software has been manually adding guard pages on every sing=
le mmap done by tcmalloc for years, and it has caught a couple bugs and cost=
s essentially nothing.
>>=20
>> Hmm. Linux should maybe add something like Windows=E2=80=99 =E2=80=9Crese=
rved=E2=80=9D virtual memory. It=E2=80=99s basically a way to ask for a VA r=
ange that explicitly contains nothing and can be subsequently be turned into=
 something useful with the equivalent of MAP_FORCE.
>=20
> What's the benefit over creating an anonymous PROT_NONE region? That
> the kernel won't have to scan through the corresponding PTEs when
> tearing down the mapping?

Make it more obvious what=E2=80=99s happening and avoid accounting issues?  W=
hat I=E2=80=99ve actually used is MAP_NORESERVE | PROT_NONE, but I think thi=
s still counts against the VA rlimit. But maybe that=E2=80=99s actually the d=
esired behavior.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
