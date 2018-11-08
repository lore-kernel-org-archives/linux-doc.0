Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D29B17D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 20:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbeKIGX5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Nov 2018 01:23:57 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36529 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbeKIGXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Nov 2018 01:23:53 -0500
Received: by mail-wr1-f68.google.com with SMTP id z13-v6so20318859wrs.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Nov 2018 12:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DLl2v3vIw7M0YRcW5fy9V9s5+BwSa4Xzl7tiDfa/DtQ=;
        b=OGaoTl5bZvC9kcZMZ5J7lTfdHXQQAVXjRK1OqlZwyTQ4Tb8BKh3noqY2Gre4c+qQRv
         4vDwf6ZPuvbnrgYAk/VCZmA0+gpu4vZFANsi0eUASrwFqAX+67F88Q2GietX/vqLviYZ
         gzw9dGo8JwcLXZ6SOs5YvJ2LZ5KbNUwiu85XdZa3CsbFHCrFbVb1WAIa6QM4w8JGMI5B
         W+NEEaDokByG2UaagkODirIEjmtFw9EA7IKaBf429uM0k8tjPmpa5y6Yy5b6GRM/QzfG
         2vUSnRWLcRc4z/D/9AlPUdIxpgtgEhHf7Cxmx4Gna5G1GBejneZ4n/zpFA/IQZlfYC7b
         K02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DLl2v3vIw7M0YRcW5fy9V9s5+BwSa4Xzl7tiDfa/DtQ=;
        b=foYV5K5QIZ2wSSPuZ225ESXWjK4/iulBA04sdTUMXmZ/uQtfqkppn9HNwtrvq6r5zD
         XBPMDoAMD71sZpciGgC6MNRjJEvQtn6z3EEktesFOS1Ed3+nAbvWGYDFgPXA35CZ1685
         fvQD9A5VJ1nPstMwLZMpEltpOEtwtdb0HE44tOBGSYLraayVN5C+xrLAZgGPTF/vHOuz
         tlCooMCbH4nsRDhUdeNqz8OgUGaMPLB0Fs6LASjcaH2FN8U6twg6l7tR4U9f/DTOTrZ7
         6E+dkb6uGvB2ctX+PXN/oh4Nrm5F/uKm8cffcjnlNmrw0YnDLHNkn34HAJv96camIVNa
         vlcQ==
X-Gm-Message-State: AGRZ1gIl8nHGqzPU8m8b679lyMCGizrv0WIzjBqmbW7LglhGjCDvfL5B
        L9zCrH6O/LchdTPPkUhx61S2pmLGqw+5nGef3J3aJQ==
X-Google-Smtp-Source: AJdET5cXZ+fRO+fyHIIeJUOZCeXLMkTxoTTaF1EOu4aDPs/jsY4nq5rL+OYsKpYPQowDhUPjYFok7NEMCowXy/ABi+s=
X-Received: by 2002:a5d:4450:: with SMTP id x16-v6mr5508356wrr.308.1541709999716;
 Thu, 08 Nov 2018 12:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20181011151523.27101-1-yu-cheng.yu@intel.com> <20181011151523.27101-5-yu-cheng.yu@intel.com>
In-Reply-To: <20181011151523.27101-5-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 8 Nov 2018 12:46:29 -0800
Message-ID: <CALCETrVAe8R=crVHoD5QmbN-gAW+V-Rwkwe4kQP7V7zQm9TM=Q@mail.gmail.com>
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

On Thu, Oct 11, 2018 at 8:20 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> Intel Control-flow Enforcement Technology (CET) introduces the
> following MSRs into the XSAVES system states.
>
>     IA32_U_CET (user-mode CET settings),
>     IA32_PL3_SSP (user-mode shadow stack),
>     IA32_PL0_SSP (kernel-mode shadow stack),
>     IA32_PL1_SSP (ring-1 shadow stack),
>     IA32_PL2_SSP (ring-2 shadow stack).
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/include/asm/fpu/types.h            | 22 +++++++++++++++++++++
>  arch/x86/include/asm/fpu/xstate.h           |  4 +++-
>  arch/x86/include/uapi/asm/processor-flags.h |  2 ++
>  arch/x86/kernel/fpu/xstate.c                | 10 ++++++++++
>  4 files changed, 37 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/asm/fpu/types.h b/arch/x86/include/asm/fpu/types.h
> index 202c53918ecf..e55d51d172f1 100644
> --- a/arch/x86/include/asm/fpu/types.h
> +++ b/arch/x86/include/asm/fpu/types.h
> @@ -114,6 +114,9 @@ enum xfeature {
>         XFEATURE_Hi16_ZMM,
>         XFEATURE_PT_UNIMPLEMENTED_SO_FAR,
>         XFEATURE_PKRU,
> +       XFEATURE_RESERVED,
> +       XFEATURE_SHSTK_USER,
> +       XFEATURE_SHSTK_KERNEL,
>
>         XFEATURE_MAX,
>  };
> @@ -128,6 +131,8 @@ enum xfeature {
>  #define XFEATURE_MASK_Hi16_ZMM         (1 << XFEATURE_Hi16_ZMM)
>  #define XFEATURE_MASK_PT               (1 << XFEATURE_PT_UNIMPLEMENTED_SO_FAR)
>  #define XFEATURE_MASK_PKRU             (1 << XFEATURE_PKRU)
> +#define XFEATURE_MASK_SHSTK_USER       (1 << XFEATURE_SHSTK_USER)
> +#define XFEATURE_MASK_SHSTK_KERNEL     (1 << XFEATURE_SHSTK_KERNEL)
>
>  #define XFEATURE_MASK_FPSSE            (XFEATURE_MASK_FP | XFEATURE_MASK_SSE)
>  #define XFEATURE_MASK_AVX512           (XFEATURE_MASK_OPMASK \
> @@ -229,6 +234,23 @@ struct pkru_state {
>         u32                             pad;
>  } __packed;
>
> +/*
> + * State component 11 is Control flow Enforcement user states
> + */
> +struct cet_user_state {
> +       u64 u_cet;      /* user control flow settings */
> +       u64 user_ssp;   /* user shadow stack pointer */
> +} __packed;
> +
> +/*
> + * State component 12 is Control flow Enforcement kernel states
> + */
> +struct cet_kernel_state {
> +       u64 kernel_ssp; /* kernel shadow stack */
> +       u64 pl1_ssp;    /* ring-1 shadow stack */
> +       u64 pl2_ssp;    /* ring-2 shadow stack */
> +} __packed;
> +

Why are these __packed?  It seems like it'll generate bad code for no
obvious purpose.
