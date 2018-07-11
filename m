Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 913BB7D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 21:51:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390576AbeGKV6J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 17:58:09 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35033 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390572AbeGKV6J (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 17:58:09 -0400
Received: by mail-oi0-f67.google.com with SMTP id i12-v6so52086096oik.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 14:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TVRNTmRWO2wQytdTDFngybIz4dJcoC9eCZgev1fFilQ=;
        b=Kv24bkNGejoTFY6SOcx+SfP4MLgqa0d46z+gTLmMVdcvzEAApGa8/oaNamlpLZipXy
         CNPfGGsYQpaVRlQwcTrX3IO6cfTFEeaqZB/kgqIXUFnzhVt2kh+iKfrb3U/DWkQzpdHe
         PjtjIOzMd8PiIqEmMkbSxDH116Yupsqs1RIe5Z3ntQMtJXQeSNAFaJLRmRbjGPWWTgMA
         WKHfX/3a+gS1JjWrnxOvoXSRe3fGpxefL2fRyqqrl8qnkjSVZIQfKOOlVAg8SbAMd6dU
         zFMrg7AEVOpRRF2CM6mWxSPT7D0vG5xqPobrxLMDtO4kjOK60lsMTQclpjknzTSQBbj8
         nskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TVRNTmRWO2wQytdTDFngybIz4dJcoC9eCZgev1fFilQ=;
        b=En21ruy4E72ASGwzh92smuP/IEk7eUOCFRjPLsITq4rR2jep0FI2L/pKo9mnpRlBNA
         jiLEwqP2DD5pWxeP1TNPCKy96Ut8IPvr7ZMlHu5xvoI2hn6RL/vxTgAbxn1KCd8WephW
         1d9bgtd3xmp8vm3UnuZuNLnPbYrd0ESk68Y3KU5sMwItZ9Nd/rB4z5xDJINqS1/PeBVQ
         AxrXpJZyImGWDDjq3LtU0fM2PYklY3f5tszb7HN4XplmkSDrhQ3LGdg5168qPRlSnPet
         r5aISFyBrQ7pugJodMle2aRPKqG+bkP9Hv+2HlWl5srTtIUh7+fXEbI5SrNgJlmZTQUS
         vScw==
X-Gm-Message-State: AOUpUlFmjaGikcHyL/jJih55Om0v3CJlGOwSpz4ciE34E7HuhIpqNxll
        jplcq5ywIauXoB8RQGSzFzLykJsxa+7l9aEuGsGu/w==
X-Google-Smtp-Source: AAOMgpct/wgsduIHdVvpsAMLLAyrlQx7dqJJnZG3h/O/IJj0EImGRMYdzmhvpnJdodEaH/Q9o7+UZYeVW11aB4XH4x8=
X-Received: by 2002:aca:d015:: with SMTP id h21-v6mr511553oig.142.1531345907484;
 Wed, 11 Jul 2018 14:51:47 -0700 (PDT)
MIME-Version: 1.0
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-18-yu-cheng.yu@intel.com>
 <CAG48ez1ytOfQyNZMNPFp7XqKcpd7_aRai9G5s7rx0V=8ZG+r2A@mail.gmail.com> <6F5FEFFD-0A9A-4181-8D15-5FC323632BA6@amacapital.net>
In-Reply-To: <6F5FEFFD-0A9A-4181-8D15-5FC323632BA6@amacapital.net>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 11 Jul 2018 14:51:21 -0700
Message-ID: <CAG48ez1OwQMmhQfHaauo+vneywsQ_ERKr4uVcQebC=GbdqZWtA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 17/27] x86/cet/shstk: User-mode shadow stack support
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     yu-cheng.yu@intel.com, "the arch/x86 maintainers" <x86@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 11, 2018 at 2:34 PM Andy Lutomirski <luto@amacapital.net> wrote=
:
> > On Jul 11, 2018, at 2:10 PM, Jann Horn <jannh@google.com> wrote:
> >
> >> On Tue, Jul 10, 2018 at 3:31 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wr=
ote:
> >>
> >> This patch adds basic shadow stack enabling/disabling routines.
> >> A task's shadow stack is allocated from memory with VM_SHSTK
> >> flag set and read-only protection.  The shadow stack is
> >> allocated to a fixed size.
> >>
> >> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > [...]
> >> diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
> >> new file mode 100644
> >> index 000000000000..96bf69db7da7
> >> --- /dev/null
> >> +++ b/arch/x86/kernel/cet.c
> > [...]
> >> +static unsigned long shstk_mmap(unsigned long addr, unsigned long len=
)
> >> +{
> >> +       struct mm_struct *mm =3D current->mm;
> >> +       unsigned long populate;
> >> +
> >> +       down_write(&mm->mmap_sem);
> >> +       addr =3D do_mmap(NULL, addr, len, PROT_READ,
> >> +                      MAP_ANONYMOUS | MAP_PRIVATE, VM_SHSTK,
> >> +                      0, &populate, NULL);
> >> +       up_write(&mm->mmap_sem);
> >> +
> >> +       if (populate)
> >> +               mm_populate(addr, populate);
> >> +
> >> +       return addr;
> >> +}
[...]
> > Should the kernel enforce that two shadow stacks must have a guard
> > page between them so that they can not be directly adjacent, so that
> > if you have too much recursion, you can't end up corrupting an
> > adjacent shadow stack?
>
> I think the answer is a qualified =E2=80=9Cno=E2=80=9D. I would like to i=
nstead enforce a general guard page on all mmaps that don=E2=80=99t use MAP=
_FORCE. We *might* need to exempt any mmap with an address hint for compati=
bility.

I like this idea a lot.

> My commercial software has been manually adding guard pages on every sing=
le mmap done by tcmalloc for years, and it has caught a couple bugs and cos=
ts essentially nothing.
>
> Hmm. Linux should maybe add something like Windows=E2=80=99 =E2=80=9Crese=
rved=E2=80=9D virtual memory. It=E2=80=99s basically a way to ask for a VA =
range that explicitly contains nothing and can be subsequently be turned in=
to something useful with the equivalent of MAP_FORCE.

What's the benefit over creating an anonymous PROT_NONE region? That
the kernel won't have to scan through the corresponding PTEs when
tearing down the mapping?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
