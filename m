Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3AD1E7D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 21:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbeGKVNt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 17:13:49 -0400
Received: from mail-oi0-f67.google.com ([209.85.218.67]:34299 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732500AbeGKVNt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 17:13:49 -0400
Received: by mail-oi0-f67.google.com with SMTP id 13-v6so51884432ois.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 14:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lh8TxHl5WB9OmBO9lEWZUkFPn5o9qgsioXcJ38g1tTE=;
        b=hPqxaqXpbNK98q6ILX77YhgMEtIeMRaBAHxQfRaKS4MJWJPHeKzWnoSGaEgLBO6ZYA
         FXvWA2aoDNipGQdC1MM9vCTOWbBT+zoS49ssfKtLHJWXyzZWaziigAV6fuK+CyJjoVvD
         UJJkbdV8zPjTLBE9yZ5/TQGqhamcXEBqL35nfKHA1UNyEGdwpuVsZuMtYmmw02vwdwvY
         c5c2rR04uu+LzNo52dCw6cVGvUIkFjzrzP69iFpdORFoHCadBPU20LrXbHyoJKa7md+j
         IN3K0PnwlSw5vtxOO/pKgvx+Aq8dDPc/x/VDbiyABDPyuikjW9LDQFgGYA5fvInVfLN1
         xj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lh8TxHl5WB9OmBO9lEWZUkFPn5o9qgsioXcJ38g1tTE=;
        b=Grx1CsfFQxKcmgRZj6vb8jNqpkZWPwMZ3nqtcWwPsfRw7jpD6oPiI0uzaF8eRoCvTi
         LZvdEJCKV3pIbwKL9MLAvfrSh9U46l0IG+pwEKl1ueSdf0cy36QdITJ/l/KinWPNzEt6
         JoX31nBTlP/YcyKPvjQdcFdAekHOQWFXaatwF75Qk2FbirIcEVtVKG0PYQ1tlAu244tb
         TdR/dSTxEtd/BbwuHBp6DE5j16+IBL8nxHt4qQ6axYmB8GhKpXNW5zjaO7ypNupDhPsi
         izQLNsOFfgqyUGMfYiWWz9MsLcqCJu921AAbqEZtWuWW8tyKlRTKqCWFivlFvOiIwL5T
         bpeA==
X-Gm-Message-State: AOUpUlEflc0vWRHPisUwIIHkSie3CVkwTWq+sseIc7HzhzJNF3eGkb/d
        wNNyE9hdn+YyP/S+A06JlpBt0DhX1V3Wm7u8cz2s8Q==
X-Google-Smtp-Source: AAOMgpfBBYEQ4Y+7kVB2Nlk0mE+pKHZhYC0ZSteaZ7lLy7gdT8VD4lD9jRLmD84cSuBGuFSLenyuQI+QiSHhidCTp6U=
X-Received: by 2002:aca:c42:: with SMTP id i2-v6mr264102oiy.219.1531343256258;
 Wed, 11 Jul 2018 14:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-23-yu-cheng.yu@intel.com>
In-Reply-To: <20180710222639.8241-23-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 11 Jul 2018 14:07:09 -0700
Message-ID: <CAG48ez0h5cabNiSBkCnAoyg9LXoSd7PpuStbRpV5r67VMHocRA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 22/27] x86/cet/ibt: User-mode indirect branch
 tracking support
To:     yu-cheng.yu@intel.com
Cc:     "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>, bsingharora@gmail.com,
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
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 10, 2018 at 3:31 PM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> Add user-mode indirect branch tracking enabling/disabling
> and supporting routines.
>
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
[...]
> diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
> index 4eba7790c4e4..8bbd63e1a2ba 100644
> --- a/arch/x86/kernel/cet.c
> +++ b/arch/x86/kernel/cet.c
[...]
> +static unsigned long ibt_mmap(unsigned long addr, unsigned long len)
> +{
> +       struct mm_struct *mm = current->mm;
> +       unsigned long populate;
> +
> +       down_write(&mm->mmap_sem);
> +       addr = do_mmap(NULL, addr, len, PROT_READ | PROT_WRITE,
> +                      MAP_ANONYMOUS | MAP_PRIVATE,
> +                      VM_DONTDUMP, 0, &populate, NULL);
> +       up_write(&mm->mmap_sem);
> +
> +       if (populate)
> +               mm_populate(addr, populate);
> +
> +       return addr;
> +}

Is this thing going to stay writable? Will any process with an IBT
bitmap be able to disable protections by messing with the bitmap even
if the lock-out mode is active? If so, would it perhaps make sense to
forbid lock-out mode if an IBT bitmap is active, to make it clear that
effective lock-out is impossible in that state?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
