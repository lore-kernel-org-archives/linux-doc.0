Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 394107D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 21:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbeGKVRD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 17:17:03 -0400
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33404 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389147AbeGKVRC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 17:17:02 -0400
Received: by mail-oi0-f66.google.com with SMTP id l10-v6so5177501oii.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Jul 2018 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jx87YraUcIHdT3OsK3qx7PdpgrM2z++7IeOUm35AtmI=;
        b=ZaUFoxLGR53reri6A7z19pESQnLR3ST1C3eOXHHVNRgLWMxg+EzDC4mmrHJ7uT5ybO
         325vx4Sd83SZeS8Pr2UjVLHuNKDDXSmVIOyPAcVRshv8VETSckPr3BU+8K3ucIEqGOF/
         +laEHNpGsAfY1mFP8yXxsMNd02D0ypw9Je/YEaMufMhfdhQEnusPdFI1XuIUkmFYOY05
         2yj5I8a7v+fz1k7uo35Vsts4ebFR05XHP4roTUt/9fZNVrSdybHSyIMPsdgm/3K54Reu
         /lzYjAqTejzNo72Dr2HcEjkpbWqAposgnerU0WGEw4/+Be8A3/X2e4LPHt0KrUQOu4F8
         5g+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jx87YraUcIHdT3OsK3qx7PdpgrM2z++7IeOUm35AtmI=;
        b=U3a71nQ+P/75K0+aHvgIecnIJ0YTNomUY+Hh3hrgpndKwhAzP90vTEyVxvyKxFD/Pc
         14fN35P7Nij4Jk6D+WMEi0ZOvWlG7XC6xFiiRXdSyyf4MsKl80fOkDIa2tiAOKrDuMqc
         uo774jDyKCy0QXdt6EXL/CuiuOFfAriSSfD2lN7gLj5zBgH4vLsu8IrY6zgqrpmPo64M
         DHjBB/FTpqmzY6GLKAzckRRcdGyNmIAnMBu8fLq7SUzE4EZ2sQBa0TXhaijZqYywSaqi
         RIrXUyZ1Wl0CeZPaE6zKtPnm9HpscYF8CDrh9Bqp+EW9nYfz3ugj8ipD3uG8Fe7xQZgu
         cZHQ==
X-Gm-Message-State: AOUpUlGeoIq1FpTrj+KEYp0fC6iV+MB2l4LPLUYj3wnCXNJdq/uh7ur+
        ktzAY9eWZcg3qdPCaP38Jl1In10dtQKvgCZCmV6XQw==
X-Google-Smtp-Source: AAOMgpdZ22gBw7zvzaBq5r4Eg/Ox1pBR61K+FS1ql0LEnuejuchMneVsunEZnAxiRPeU+yBpa33YJW1jzhhJpXbbqRo=
X-Received: by 2002:aca:c42:: with SMTP id i2-v6mr274522oiy.219.1531343449017;
 Wed, 11 Jul 2018 14:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <20180710222639.8241-1-yu-cheng.yu@intel.com> <20180710222639.8241-18-yu-cheng.yu@intel.com>
In-Reply-To: <20180710222639.8241-18-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 11 Jul 2018 14:10:22 -0700
Message-ID: <CAG48ez1ytOfQyNZMNPFp7XqKcpd7_aRai9G5s7rx0V=8ZG+r2A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 17/27] x86/cet/shstk: User-mode shadow stack support
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
> This patch adds basic shadow stack enabling/disabling routines.
> A task's shadow stack is allocated from memory with VM_SHSTK
> flag set and read-only protection.  The shadow stack is
> allocated to a fixed size.
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
[...]
> diff --git a/arch/x86/kernel/cet.c b/arch/x86/kernel/cet.c
> new file mode 100644
> index 000000000000..96bf69db7da7
> --- /dev/null
> +++ b/arch/x86/kernel/cet.c
[...]
> +static unsigned long shstk_mmap(unsigned long addr, unsigned long len)
> +{
> +       struct mm_struct *mm = current->mm;
> +       unsigned long populate;
> +
> +       down_write(&mm->mmap_sem);
> +       addr = do_mmap(NULL, addr, len, PROT_READ,
> +                      MAP_ANONYMOUS | MAP_PRIVATE, VM_SHSTK,
> +                      0, &populate, NULL);
> +       up_write(&mm->mmap_sem);
> +
> +       if (populate)
> +               mm_populate(addr, populate);
> +
> +       return addr;
> +}

How does this interact with UFFDIO_REGISTER?

Is there an explicit design decision on whether FOLL_FORCE should be
able to write to shadow stacks? I'm guessing the answer is "yes,
FOLL_FORCE should be able to write to shadow stacks"? It might make
sense to add documentation for this.

Should the kernel enforce that two shadow stacks must have a guard
page between them so that they can not be directly adjacent, so that
if you have too much recursion, you can't end up corrupting an
adjacent shadow stack?

> +int cet_setup_shstk(void)
> +{
> +       unsigned long addr, size;
> +
> +       if (!cpu_feature_enabled(X86_FEATURE_SHSTK))
> +               return -EOPNOTSUPP;
> +
> +       size = in_ia32_syscall() ? SHSTK_SIZE_32:SHSTK_SIZE_64;
> +       addr = shstk_mmap(0, size);
> +
> +       /*
> +        * Return actual error from do_mmap().
> +        */
> +       if (addr >= TASK_SIZE_MAX)
> +               return addr;
> +
> +       set_shstk_ptr(addr + size - sizeof(u64));
> +       current->thread.cet.shstk_base = addr;
> +       current->thread.cet.shstk_size = size;
> +       current->thread.cet.shstk_enabled = 1;
> +       return 0;
> +}
[...]
> +void cet_disable_free_shstk(struct task_struct *tsk)
> +{
> +       if (!cpu_feature_enabled(X86_FEATURE_SHSTK) ||
> +           !tsk->thread.cet.shstk_enabled)
> +               return;
> +
> +       if (tsk == current)
> +               cet_disable_shstk();
> +
> +       /*
> +        * Free only when tsk is current or shares mm
> +        * with current but has its own shstk.
> +        */
> +       if (tsk->mm && (tsk->mm == current->mm) &&
> +           (tsk->thread.cet.shstk_base)) {
> +               vm_munmap(tsk->thread.cet.shstk_base,
> +                         tsk->thread.cet.shstk_size);
> +               tsk->thread.cet.shstk_base = 0;
> +               tsk->thread.cet.shstk_size = 0;
> +       }
> +
> +       tsk->thread.cet.shstk_enabled = 0;
> +}
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
