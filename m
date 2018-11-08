Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BB8747D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 21:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbeKIHA1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Nov 2018 02:00:27 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35225 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbeKIHA1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Nov 2018 02:00:27 -0500
Received: by mail-wm1-f68.google.com with SMTP id t15-v6so130608wmt.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 13:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7Fm+Swwz5U6PYgdF4xz3yvF0Ae+TVaAPPC+XBP1RMAY=;
        b=E706BHL0Td3myb4413EwEA1PhNfwbex5uMj+f31Sv1vypjDGhg3Ry8ZMpr6jUhq7JI
         Pm1oqp/XMJ7g2jwJUZXRiOH0BhwPq7WEUFskMxiV4QUb8BTVzOItGsNAwDpzbcF9LiAi
         nM/JyQif/POUtX3zV9LqpeMzmZ1MDjVF8edn/5HIez3tnVH1TSEH1JpeyqCWV1pdrkjH
         zw77zTBffvybM4PLLRgxhLjKeCNkGDhwNPamR7rFmaYJ0yL7vyQsYPWyIB9zGE/25PrV
         5DFkRkEr6rEVkBk16gvVZv6wfT84lVTypKJugSbE14Ue5T3WLoK8Yz2g60amCTLl/O/q
         +MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7Fm+Swwz5U6PYgdF4xz3yvF0Ae+TVaAPPC+XBP1RMAY=;
        b=Ed0DhSzDBGAXyDYeO+6k5ypgnQr5QDUflqu2+if4/uJTQQvzVJ+6IuL7bH0WvcLKyS
         Z8DFEAwSL6j1zZ3znyQpc8F0iE8QAt+72iPzGclCPLXnAfJZ5ZXxovwOl4E0hQMUNp8m
         Kfv59TSJsZoYsVAYFg+ahm8XH0RldtBAZTmfm+Va3rQAQLIERNlrbpgEijG86pYvtiXE
         D6Pi00az+wbmibzStA5/1EVFSVMIw7w2JySZHzYsT64XZScBlde8gZUF8QhCF6ILlSDV
         vkYg1JnFUTGofsVSaw/Wxv8He97fgCR8GOHM5buvoOHmoBMf1o3/lgH7YnBednJSsbic
         9Y+A==
X-Gm-Message-State: AGRZ1gLLkUmyh9YenbafhQbSWT7yp2MPiXWcBHSueWDmpcDAu3xdz6Yy
        oKxq6TyFWgIoZrmoxUKn9JreMfIaayh+89Fu06GHrg==
X-Google-Smtp-Source: AJdET5f3qm2+Se9JRO2uShWB+aZYI4xGcIp8Ei4ckDSNwMSVm4Vs9gfxgnH/ClkF1tgiBk+VpHdLJQOv253gUKyjBW4=
X-Received: by 2002:a1c:4b1a:: with SMTP id y26-v6mr2593259wma.82.1541712184530;
 Thu, 08 Nov 2018 13:23:04 -0800 (PST)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-5-yu-cheng.yu@intel.com>
 <CALCETrVAe8R=crVHoD5QmbN-gAW+V-Rwkwe4kQP7V7zQm9TM=Q@mail.gmail.com> <4295b8f786c10c469870a6d9725749ce75dcdaa2.camel@intel.com>
In-Reply-To: <4295b8f786c10c469870a6d9725749ce75dcdaa2.camel@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 8 Nov 2018 13:22:54 -0800
Message-ID: <CALCETrUKzXYzRrWRdi8Z7AdAF0uZW5Gs7J4s=55dszoyzc29rw@mail.gmail.com>
Subject: Re: [PATCH v5 04/27] x86/fpu/xstate: Add XSAVES system states for
 shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 8, 2018 at 1:06 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> On Thu, 2018-11-08 at 12:46 -0800, Andy Lutomirski wrote:
> > On Thu, Oct 11, 2018 at 8:20 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
> > >
> > > Intel Control-flow Enforcement Technology (CET) introduces the
> > > following MSRs into the XSAVES system states.
> > >
> > >     IA32_U_CET (user-mode CET settings),
> > >     IA32_PL3_SSP (user-mode shadow stack),
> > >     IA32_PL0_SSP (kernel-mode shadow stack),
> > >     IA32_PL1_SSP (ring-1 shadow stack),
> > >     IA32_PL2_SSP (ring-2 shadow stack).
> > >
> > > Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> > > ---
> > >  arch/x86/include/asm/fpu/types.h            | 22 +++++++++++++++++++++
> > >  arch/x86/include/asm/fpu/xstate.h           |  4 +++-
> > >  arch/x86/include/uapi/asm/processor-flags.h |  2 ++
> > >  arch/x86/kernel/fpu/xstate.c                | 10 ++++++++++
> > >  4 files changed, 37 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/include/asm/fpu/types.h
> > > b/arch/x86/include/asm/fpu/types.h
> > > index 202c53918ecf..e55d51d172f1 100644
> > > --- a/arch/x86/include/asm/fpu/types.h
> > > +++ b/arch/x86/include/asm/fpu/types.h
> > > @@ -114,6 +114,9 @@ enum xfeature {
> > >         XFEATURE_Hi16_ZMM,
> > >         XFEATURE_PT_UNIMPLEMENTED_SO_FAR,
> > >         XFEATURE_PKRU,
> > > +       XFEATURE_RESERVED,
> > > +       XFEATURE_SHSTK_USER,
> > > +       XFEATURE_SHSTK_KERNEL,
> > >
> > >         XFEATURE_MAX,
> > >  };
> > > @@ -128,6 +131,8 @@ enum xfeature {
> > >  #define XFEATURE_MASK_Hi16_ZMM         (1 << XFEATURE_Hi16_ZMM)
> > >  #define XFEATURE_MASK_PT               (1 <<
> > > XFEATURE_PT_UNIMPLEMENTED_SO_FAR)
> > >  #define XFEATURE_MASK_PKRU             (1 << XFEATURE_PKRU)
> > > +#define XFEATURE_MASK_SHSTK_USER       (1 << XFEATURE_SHSTK_USER)
> > > +#define XFEATURE_MASK_SHSTK_KERNEL     (1 << XFEATURE_SHSTK_KERNEL)
> > >
> > >  #define XFEATURE_MASK_FPSSE            (XFEATURE_MASK_FP |
> > > XFEATURE_MASK_SSE)
> > >  #define XFEATURE_MASK_AVX512           (XFEATURE_MASK_OPMASK \
> > > @@ -229,6 +234,23 @@ struct pkru_state {
> > >         u32                             pad;
> > >  } __packed;
> > >
> > > +/*
> > > + * State component 11 is Control flow Enforcement user states
> > > + */
> > > +struct cet_user_state {
> > > +       u64 u_cet;      /* user control flow settings */
> > > +       u64 user_ssp;   /* user shadow stack pointer */
> > > +} __packed;
> > > +
> > > +/*
> > > + * State component 12 is Control flow Enforcement kernel states
> > > + */
> > > +struct cet_kernel_state {
> > > +       u64 kernel_ssp; /* kernel shadow stack */
> > > +       u64 pl1_ssp;    /* ring-1 shadow stack */
> > > +       u64 pl2_ssp;    /* ring-2 shadow stack */
> > > +} __packed;
> > > +
> >
> > Why are these __packed?  It seems like it'll generate bad code for no
> > obvious purpose.
>
> That prevents any possibility that the compiler will insert padding, although in
> 64-bit kernel this should not happen to either struct.  Also all xstate
> components here are packed.
>

They both seem like bugs, perhaps.  As I understand it, __packed
removes padding, but it also forces the compiler to expect the fields
to be unaligned even if they are actually aligned.
