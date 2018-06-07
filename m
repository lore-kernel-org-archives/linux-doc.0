Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EFF1A7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934639AbeFGSj2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:39:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:35510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933893AbeFGSj1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 14:39:27 -0400
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6557E2089C
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 18:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528396766;
        bh=6LEe5GSpD2TEtbiZj63Ls647kqPk+eeU1iAj9CzQjbY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b7UAeK2K9xzAJFf4bhIXufPou9uTWnE2h4VgA45mCGWrRscseNKP7AteoOwPek9UF
         7Gi0NpV6RRkTm9Qtj6R+qoGNo7iCoerA2e0MYN0DtotT4gWK+sw8LofkocZQr/y2k2
         K5iEyId7q1seMJSmsJ7TQ/ZguxtoS8Qv0wAkGAC0=
Received: by mail-wm0-f50.google.com with SMTP id 69-v6so8052230wmf.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 11:39:26 -0700 (PDT)
X-Gm-Message-State: APt69E3vvkTOtzWc6MhvvYx4nYh6IbxbRys688ntagJILlQSneTbGie1
        bWPZFSZzPg2r48AV5ASf934+4PiLMgMn6pSvwn9O4A==
X-Google-Smtp-Source: ADUXVKLUNcEsPilIv05EfKfRozFCb1vzAVIFojdaYIYFkzyID+eH/btrxAUEs3RqFVGFRHG5f/oN69xtA8nsDLSnuo4=
X-Received: by 2002:a1c:4a9d:: with SMTP id n29-v6mr2231916wmi.46.1528396764938;
 Thu, 07 Jun 2018 11:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143855.3681-1-yu-cheng.yu@intel.com> <20180607143855.3681-4-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143855.3681-4-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 11:39:12 -0700
X-Gmail-Original-Message-ID: <CALCETrWNaA4rg3Q6-OShAt7Yp9VmyvyFOQtn6cAbrKMHiggGzg@mail.gmail.com>
Message-ID: <CALCETrWNaA4rg3Q6-OShAt7Yp9VmyvyFOQtn6cAbrKMHiggGzg@mail.gmail.com>
Subject: Re: [PATCH 3/7] mm/mmap: Add IBT bitmap size to address space limit check
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
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

On Thu, Jun 7, 2018 at 7:42 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> The indirect branch tracking legacy bitmap takes a large address
> space.  This causes may_expand_vm() failure on the address limit
> check.  For a IBT-enabled task, add the bitmap size to the
> address limit.
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> ---
>  arch/x86/include/uapi/asm/resource.h | 5 +++++
>  include/uapi/asm-generic/resource.h  | 3 +++
>  mm/mmap.c                            | 8 +++++++-
>  3 files changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/arch/x86/include/uapi/asm/resource.h b/arch/x86/include/uapi/asm/resource.h
> index 04bc4db8921b..0741b2a6101a 100644
> --- a/arch/x86/include/uapi/asm/resource.h
> +++ b/arch/x86/include/uapi/asm/resource.h
> @@ -1 +1,6 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +#ifdef CONFIG_X86_INTEL_CET
> +#define rlimit_as_extra() current->thread.cet.ibt_bitmap_size
> +#endif
> +
>  #include <asm-generic/resource.h>
> diff --git a/include/uapi/asm-generic/resource.h b/include/uapi/asm-generic/resource.h
> index f12db7a0da64..8a7608a09700 100644
> --- a/include/uapi/asm-generic/resource.h
> +++ b/include/uapi/asm-generic/resource.h
> @@ -58,5 +58,8 @@
>  # define RLIM_INFINITY         (~0UL)
>  #endif
>
> +#ifndef rlimit_as_extra
> +#define rlimit_as_extra() 0
> +#endif
>
>  #endif /* _UAPI_ASM_GENERIC_RESOURCE_H */
> diff --git a/mm/mmap.c b/mm/mmap.c
> index e7d1fcb7ec58..5c07f052bed7 100644
> --- a/mm/mmap.c
> +++ b/mm/mmap.c
> @@ -3255,7 +3255,13 @@ struct vm_area_struct *copy_vma(struct vm_area_struct **vmap,
>   */
>  bool may_expand_vm(struct mm_struct *mm, vm_flags_t flags, unsigned long npages)
>  {
> -       if (mm->total_vm + npages > rlimit(RLIMIT_AS) >> PAGE_SHIFT)
> +       unsigned long as_limit = rlimit(RLIMIT_AS);
> +       unsigned long as_limit_plus = as_limit + rlimit_as_extra();
> +
> +       if (as_limit_plus > as_limit)
> +               as_limit = as_limit_plus;
> +

What happens if as_limit_plus overflows?  I guess it's probably okay here.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
