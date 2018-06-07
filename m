Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C3577D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 16:27:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753835AbeFGQ0v (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 12:26:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753248AbeFGQ0u (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 7 Jun 2018 12:26:50 -0400
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com [209.85.128.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15E8E208A3
        for <linux-doc@vger.kernel.org>; Thu,  7 Jun 2018 16:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1528388810;
        bh=bAee33NTLeWiZFNKKO+RMmSCpWT9lSA5FeSOsnTXCW0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2b+T3tOg6jTQSIW7liwuPhan3ad3E+X2BGBQAE9y9EiBCelpRNxf0T8cXwWVIVdKy
         Ww26FmVm3BpGRXmhUUoUlNN1S6txFdi/LazEq3v0EP0Sfn3MY/YIj2HGvLI34y/3ut
         hjlFN5FEVNfB0N0o7TPggltRMkFAG83wwuYK7iLc=
Received: by mail-wr0-f178.google.com with SMTP id l41-v6so10488522wre.7
        for <linux-doc@vger.kernel.org>; Thu, 07 Jun 2018 09:26:50 -0700 (PDT)
X-Gm-Message-State: APt69E2y4vizd6FCjrcANGo+gBkgAccEUAHWxM5J8rh8c3SyZkkOIDKl
        jKq8FGoM/kf1pqiKfSd/1Hy3gjB0JJV3dwmsFiq8JA==
X-Google-Smtp-Source: ADUXVKKc8U/wh8Mi6sOOCTkKREJhIanAqh6HDaVwP4kiDC3xidfbGnRtmL8OlxsS7NeH0K910b4wXUOuMcfEbeJDhBw=
X-Received: by 2002:adf:b1ca:: with SMTP id r10-v6mr2153714wra.221.1528388808481;
 Thu, 07 Jun 2018 09:26:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143705.3531-1-yu-cheng.yu@intel.com> <20180607143705.3531-8-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143705.3531-8-yu-cheng.yu@intel.com>
From:   Andy Lutomirski <luto@kernel.org>
Date:   Thu, 7 Jun 2018 09:26:36 -0700
X-Gmail-Original-Message-ID: <CALCETrXA--XrVNvPM4-Cv6-E6OFd=TZ5Gw_MWePt7MtqCBBqRg@mail.gmail.com>
Message-ID: <CALCETrXA--XrVNvPM4-Cv6-E6OFd=TZ5Gw_MWePt7MtqCBBqRg@mail.gmail.com>
Subject: Re: [PATCH 7/9] x86/mm: Shadow stack page fault error checking
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

On Thu, Jun 7, 2018 at 7:40 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> If a page fault is triggered by a shadow stack access (e.g.
> call/ret) or shadow stack management instructions (e.g.
> wrussq), then bit[6] of the page fault error code is set.
>
> In access_error(), we check if a shadow stack page fault
> is within a shadow stack memory area.
>
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

> diff --git a/arch/x86/mm/fault.c b/arch/x86/mm/fault.c
> index 73bd8c95ac71..2b3b9170109c 100644
> --- a/arch/x86/mm/fault.c
> +++ b/arch/x86/mm/fault.c
> @@ -1166,6 +1166,17 @@ access_error(unsigned long error_code, struct vm_area_struct *vma)
>                                        (error_code & X86_PF_INSTR), foreign))
>                 return 1;
>
> +       /*
> +        * Verify X86_PF_SHSTK is within a shadow stack VMA.
> +        * It is always an error if there is a shadow stack
> +        * fault outside a shadow stack VMA.
> +        */
> +       if (error_code & X86_PF_SHSTK) {
> +               if (!(vma->vm_flags & VM_SHSTK))
> +                       return 1;
> +               return 0;
> +       }
> +

What, if anything, would go wrong without this change?  It seems like
it might be purely an optimization.  If so, can you mention that in
the comment?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
