Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 141367D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:30:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934245AbeFGSar (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:30:47 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:46875 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933706AbeFGSaq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 14:30:46 -0400
Received: by mail-wr0-f195.google.com with SMTP id v13-v6so10830485wrp.13
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xnph+iwODaBv+j1M/71rmM3V/nDkco59DU49LbjrrVw=;
        b=lR3V+z4jD2BoN4BVdmWEVL7YujvxSHMLyMZ2l48yNJLiP7U0M3N5NeFjUyUYFpsiRL
         z+qdxNgyHzBK8xgG5eUySvyrxCN71rai6QoeYGDumkxXWxT/jMooO3xsBYaUoKgstt0m
         FG5qts4XFXCy+ots+BiJkOmeTTYhCTDvm/aZSn1SA6n8xpbfKW2za/nfAmxMHDkN4RK1
         y+PT6JpEXWeZ1FWqwdAcic2oSJnPo1BynC131R6Ics0QINzC3sI1wc9I28QscsiWDCQa
         kvhP0/+2Ne+jSp296dD8jDZsbY56yA4oUZ05uF1DQloZjs2i7qWGdd9hOzf48Aom8YgY
         n87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xnph+iwODaBv+j1M/71rmM3V/nDkco59DU49LbjrrVw=;
        b=m3CcjtyCuT2ANErbcGM6H1E/KPRQwly/m3fts1qfeF3GcqmQkDfqy5rKDIj3tsOz3a
         vJNF+CNQbJOMH+HewkN6Wnlm6AE4t+3+3vzY9E7iKBzcrAs6PMaQpZsFjxooWG0snV6M
         mEmqafAXjQwVyloEfhbr9ezGbmwHVZaBtxkzyLBZvpIYamhurGQwKYzdJSyf4RLU/la2
         eCb/+AFQxJhBGQTxRhvLLIx1SEYqofQsqyexDUjc3mUbGGHeUScAxWsm+KN6edpEJRhZ
         XVl4FSNxuveR3SdEX+xVaq4LHiYUzfAl4JZOh9/V9ksnn2dqs2xVphOGJgEO2fJUW5G1
         uKjQ==
X-Gm-Message-State: APt69E2U/OB7WBJMdGdswSl1na20qDYAmxvPcB5LVAKx+HJ9o0xGxw3x
        PzG5fAy7XekEfOFPMoJxSAbwAtVx5aikpu6Uaibq5Q==
X-Google-Smtp-Source: ADUXVKJCbxbVdrF53pAKvr0fvMZ7XV3JHcXGcM1d3Ug96hWMeyfdLGe0NdbtqoEgMFiTXlNbHbvd14A7OtklKm7FASM=
X-Received: by 2002:adf:b445:: with SMTP id v5-v6mr2511770wrd.67.1528396245554;
 Thu, 07 Jun 2018 11:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com> <20180607143807.3611-4-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-4-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@amacapital.net>
Date:   Thu, 7 Jun 2018 11:30:34 -0700
Message-ID: <CALCETrWo77RS_wOzskw5OG-LdC1S-b_NY=uPWUmPbQEnNwANgQ@mail.gmail.com>
Subject: Re: [PATCH 03/10] x86/cet: Signal handling for shadow stack
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        Dmitry Safonov <dsafonov@virtuozzo.com>,
        Cyrill Gorcunov <gorcunov@openvz.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 7, 2018 at 7:41 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> Set and restore shadow stack pointer for signals.

How does this interact with siglongjmp()?

This patch makes me extremely nervous due to the possibility of ABI
issues and CRIU breakage.

> diff --git a/arch/x86/include/uapi/asm/sigcontext.h b/arch/x86/include/uapi/asm/sigcontext.h
> index 844d60eb1882..6c8997a0156a 100644
> --- a/arch/x86/include/uapi/asm/sigcontext.h
> +++ b/arch/x86/include/uapi/asm/sigcontext.h
> @@ -230,6 +230,7 @@ struct sigcontext_32 {
>         __u32                           fpstate; /* Zero when no FPU/extended context */
>         __u32                           oldmask;
>         __u32                           cr2;
> +       __u32                           ssp;
>  };
>
>  /*
> @@ -262,6 +263,7 @@ struct sigcontext_64 {
>         __u64                           trapno;
>         __u64                           oldmask;
>         __u64                           cr2;
> +       __u64                           ssp;
>
>         /*
>          * fpstate is really (struct _fpstate *) or (struct _xstate *)
> @@ -320,6 +322,7 @@ struct sigcontext {
>         struct _fpstate __user          *fpstate;
>         __u32                           oldmask;
>         __u32                           cr2;
> +       __u32                           ssp;

Is it actually okay to modify these structures like this?  They're
part of the user ABI, and I don't know whether any user code relies on
the size being constant.

> +int cet_push_shstk(int ia32, unsigned long ssp, unsigned long val)
> +{
> +       if (val >= TASK_SIZE)
> +               return -EINVAL;

TASK_SIZE_MAX.  But I'm a bit unsure why you need this check at all.

> +int cet_restore_signal(unsigned long ssp)
> +{
> +       if (!current->thread.cet.shstk_enabled)
> +               return 0;
> +       return cet_set_shstk_ptr(ssp);
> +}

This will blow up if the shadow stack enabled state changes in a
signal handler.  Maybe we don't care.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
