Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 75AA97D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 02:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755852AbeFZCqX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 22:46:23 -0400
Received: from mail-oi0-f68.google.com ([209.85.218.68]:36247 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755846AbeFZCqV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 22:46:21 -0400
Received: by mail-oi0-f68.google.com with SMTP id 14-v6so14537963oie.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 19:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OzBmhIJfAsVeBzxgrm8gIPWnnYbiLu0ldeO1S5DsT2E=;
        b=ofZmo0/voErzFZ3IpaK5RMnKcZRmY5BYUFmXeR2F9pDttZGjfViZE4pupYv5oPbi1I
         1TgK8pM4R9U4aaEr14d1GKOuEz1lnC64/WdCr2jCEnZHt64nLhENiF/ekX1bLxOxO4bb
         49SLBofHeVK8vAbzArMxl0vwQXdzG5YGmxA3vmoIJ1Bms3FkMGYvnBv4/btAcdq3sceK
         xA2a2x64p8xuAY7vJi0XCHzQzg2CQyOIFC45tUKHRBgzetBv4nZnaZLLiICK5xuSjHqN
         6H3yF7I21p5x8JpVeetDViSoy2US5W7AccZdwrHxW1aIT2QZJCFQOyxJytCeetvrkA8m
         UjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OzBmhIJfAsVeBzxgrm8gIPWnnYbiLu0ldeO1S5DsT2E=;
        b=WtLF6/niQ7tOnwZpxsUGuSVfY+PeLLgj341OU4OPLbGDZoP5jFRv5afYp+RJp5uITf
         KOEy1BPSmRxjRrH5kmZSWoNjK68bcZwu/TzeONhgoZmSz4o1CaoTjWFmvy4s1BdBweCT
         9bU/iQTVmSW2wI7TFCT2CSwTEsLtgL+xBctzQvllY5jvhgPsrtfZ/jB9+9xCzFcpmAm+
         3qbBD+MMUeEVwZUXiVMfWrEQwgcD2TmAaEpUysb0OtBIPwcrHqTu7Xnvl+kuzv1WL1p8
         36oJA0b8b4QL7rlfrKaLN16/OKIutyEBhu2m5rKFmuehF9glOu9DWHwVzIDCn+DTPd26
         zD0w==
X-Gm-Message-State: APt69E03Jaqd7rO3KtDSfeuDmLOkSu48qpBpX2tBiK0Rj8HcuPssnzok
        Wux8qzSs1S+F8uaFWlwlWDbfo/fUInWTEAhWqfTseA==
X-Google-Smtp-Source: AAOMgpfqIGHEjuEqfBINciovziEyeINMswDeDEVfIHTLHD8vysqSJu+hNFsjb2gEiGmi5cPlDVpD33peLPNQSqbkl2A=
X-Received: by 2002:aca:5bd5:: with SMTP id p204-v6mr8848946oib.91.1529981180502;
 Mon, 25 Jun 2018 19:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
In-Reply-To: <20180607143807.3611-1-yu-cheng.yu@intel.com>
From:   Jann Horn <jannh@google.com>
Date:   Tue, 26 Jun 2018 04:46:08 +0200
Message-ID: <CAG48ez2puLWrDDPg=ighCY+yxFoP-nN97MqVseqYabBad+eKmg@mail.gmail.com>
Subject: Re: [PATCH 00/10] Control Flow Enforcement - Part (3)
To:     yu-cheng.yu@intel.com
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, hjl.tools@gmail.com,
        vedvyas.shanbhogue@intel.com, ravi.v.shankar@intel.com,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@amacapital.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 26, 2018 at 4:45 AM Yu-cheng Yu <yu-cheng.yu@intel.com> wrote:
>
> This series introduces CET - Shadow stack
>
> At the high level, shadow stack is:
>
>         Allocated from a task's address space with vm_flags VM_SHSTK;
>         Its PTEs must be read-only and dirty;
>         Fixed sized, but the default size can be changed by sys admin.
>
> For a forked child, the shadow stack is duplicated when the next
> shadow stack access takes place.
>
> For a pthread child, a new shadow stack is allocated.
>
> The signal handler uses the same shadow stack as the main program.
>
> Yu-cheng Yu (10):
>   x86/cet: User-mode shadow stack support
>   x86/cet: Introduce WRUSS instruction
>   x86/cet: Signal handling for shadow stack
>   x86/cet: Handle thread shadow stack
>   x86/cet: ELF header parsing of Control Flow Enforcement
>   x86/cet: Add arch_prctl functions for shadow stack
>   mm: Prevent mprotect from changing shadow stack
>   mm: Prevent mremap of shadow stack
>   mm: Prevent madvise from changing shadow stack
>   mm: Prevent munmap and remap_file_pages of shadow stack

Shouldn't patches like these be CC'ed to linux-api@vger.kernel.org?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
