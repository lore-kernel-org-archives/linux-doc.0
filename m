Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFBB1C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  2 Dec 2021 10:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357000AbhLBKeq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Dec 2021 05:34:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356980AbhLBKeq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Dec 2021 05:34:46 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58354C061756
        for <linux-doc@vger.kernel.org>; Thu,  2 Dec 2021 02:31:24 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id j2so71879809ybg.9
        for <linux-doc@vger.kernel.org>; Thu, 02 Dec 2021 02:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EeNOuxvv/783k+RAGH+/mPik/avVsKKHUy8sBnxFQag=;
        b=Uf9Ac/koQG5lA8BIaiou4d4SebkzFUaX9j976OVRSNmEfk8l5FeLyI8CXevrszuhIE
         /TmCYeGsChi38/yVM3wwl9Xlwgyr7RJd+A0/tQXGLQdSAxhC6L5uBHzKfJpT9Rw6HzHh
         fju/CHQ6PH2cuGiLfYv/7OJgrdz1cR+psJ+2q4nYYvaaHjcluSNunwhd3SwuvFcICwXP
         awO3Ikme8v3JqJCeGrXjKlQVe9CWNjNPK0jukJVZMNSik7rmHkdUTm7AZUKn7Znm4rXq
         LPz1qHZ15wYtxmVJ3oglJ9TI8OrIxGhIiti/ocxUXLpnNLZRW13JUAwywCJW9F2HvHIF
         rofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EeNOuxvv/783k+RAGH+/mPik/avVsKKHUy8sBnxFQag=;
        b=pD20mYZHUUqyYC123Y1kbY6OORd+nODtQGGHwRIiAHjVKkolQPMeZ8dGZwnnQVaOy/
         xwQxJ+dLdvjLlzaG1bavmoyauKrAtgAML/4FWGWu5jtftDgl+Ackyj0XzUKBr4Ssa2nL
         EqSG026RvuvZ0exzmewysGuCsujrPz89mbgBdQRvYXDw37HaNaSZ1vdS+ehHAue9tIqN
         HzA1xGLmshabieHKNh9k74tVWWQ+HLxNUkyMzH0iWJMN7zLNxMaZCZPZTIv6nXyqozOc
         bW9LGPRA7FG1lOFkxMu/jBHYqDjRAic9/SRaF8qlK0GBXXQD79l1vG4ZvQFofNdP+zdW
         d5DQ==
X-Gm-Message-State: AOAM533a8Xykk29Ah0NoT7x8ukiLSiF3o2nsD+Gn+B0qj+rqAJM8NXD6
        xUtgirjrjtZVOZkC66BSAGv3dnn8f9qKDXEvNROY3g==
X-Google-Smtp-Source: ABdhPJz/wPDYkIWfKgdxJcGJiCqgU2TN0ErGGC3ufY3H4DRdSttYobpMoKTUb6WOd0kKlgwM5zG8VfbxG5457S6j/Kc=
X-Received: by 2002:a25:d157:: with SMTP id i84mr13825183ybg.703.1638441083325;
 Thu, 02 Dec 2021 02:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20211123214814.3756047-1-pasha.tatashin@soleen.com>
 <20211123214814.3756047-4-pasha.tatashin@soleen.com> <f81a6434-9f38-947e-02a8-9a9191285e52@kernel.org>
 <cadf2582-3004-92b9-ab5a-cb39259fa36c@kernel.org> <CA+CK2bBfcrxDyxnV+xc680AP+sJGHSpong6a+b_vvWcRsB2CcA@mail.gmail.com>
 <a0968570-a25a-a7e3-3ee5-b7275286c9d1@kernel.org> <172f894c-01ab-cd9f-3292-1ba811f7222a@kernel.org>
In-Reply-To: <172f894c-01ab-cd9f-3292-1ba811f7222a@kernel.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 2 Dec 2021 18:30:44 +0800
Message-ID: <CAMZfGtVRUcKw_rjiype=sVYzthKYAwYavNAkyrJtkaDTxR+NHw@mail.gmail.com>
Subject: Re: [PATCH 3/3] x86: mm: add x86_64 support for page table check
To:     Jiri Slaby <jirislaby@kernel.org>
Cc:     Pasha Tatashin <pasha.tatashin@soleen.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Paul Turner <pjt@google.com>, weixugc@google.com,
        Greg Thelen <gthelen@google.com>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, masahiroy@kernel.org,
        Sami Tolvanen <samitolvanen@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        frederic@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 2, 2021 at 6:06 PM Jiri Slaby <jirislaby@kernel.org> wrote:
>
> On 02. 12. 21, 10:59, Jiri Slaby wrote:
> > On 01. 12. 21, 14:55, Pasha Tatashin wrote:
> >> On Wed, Dec 1, 2021 at 3:44 AM Jiri Slaby <jirislaby@kernel.org> wrote:
> >>>
> >>> On 01. 12. 21, 9:00, Jiri Slaby wrote:
> >>>> On 23. 11. 21, 22:48, Pasha Tatashin wrote:
> >>>>> Add page table check hooks into routines that modify user page tables.
> >>>>
> >>>> Hi,
> >>>>
> >>>> I bisected to this as this causes crashes during modules load:
> >>>
> >>> And it's not enough to unset CONFIG_PAGE_TABLE_CHECK_ENFORCED. I had to
> >>> unset CONFIG_PAGE_TABLE_CHECK completely to get rid of this.
> >>
> >> Hi,
> >>
> >> Thanks for reporting this. Seems like module load for some reasons
> >> does not like the static branches. However, I was not able to repro
> >> this. Could you please share your config and the module that you were
> >> loading?
> >
> > It's the openSUSE's -next config:
> > https://raw.githubusercontent.com/openSUSE/kernel-source/linux-next/config/x86_64/vanilla
> >
> >
> > But with CONFIG_IWLMEI=n (as that fails to link).
> >
> > One has to load i915, other modules (71 on my system) are apparently fine.
> >
> > i915 tries to patch your `page_table_check_disabled' which is defined as
> > `DEFINE_STATIC_KEY_TRUE_RO':
> >  > jump_label_add_module: key=__tracepoint_mmap_lock_released
> > (ffffffff93f36d88) mod=0000000000000000
> >  > jump_label_add_module: key=hugetlb_free_vmemmap_enabled_key
> > (ffffffff94873560) mod=0000000000000000
> >  > jump_label_add_module: key=devmap_managed_key (ffffffff94902700)
> > mod=0000000000000000
> >  > jump_label_add_module: key=page_table_check_disabled
> > (ffffffff939da760) mod=0000000000000000
> >  > BUG: unable to handle page fault for address: ffffffff939da768
>
> Provided you EXPORT page_table_check_disabled and it can be used from
> modules, it can be barely marked as RO. So the below indeed fixes the
> problem for me:

Agree. I had encountered a similar problem some months ago. In one
word, DEFINE_STATIC_KEY_TRUE_RO() and EXPORT_SYMBOL()
are mutually exclusive.

Thanks.

>
> --- a/mm/page_table_check.c
> +++ b/mm/page_table_check.c
> @@ -18,7 +18,7 @@ struct page_table_check {
>   static bool __page_table_check_enabled __initdata =
>
> IS_ENABLED(CONFIG_PAGE_TABLE_CHECK_ENFORCED);
>
> -DEFINE_STATIC_KEY_TRUE_RO(page_table_check_disabled);
> +DEFINE_STATIC_KEY_TRUE(page_table_check_disabled);
>   EXPORT_SYMBOL(page_table_check_disabled);
>
>   static int __init early_page_table_check_param(char *buf)
>
> >
> > regards,
>
>
> --
> js
> suse labs
