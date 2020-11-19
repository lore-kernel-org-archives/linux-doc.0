Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D13C63697
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 02:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73B76246E4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 02:58:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="EfXFS93V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgKSC6I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Nov 2020 21:58:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbgKSC6I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Nov 2020 21:58:08 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4824C0617A7
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 18:58:07 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id w4so2866947pgg.13
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 18:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nMDyMKTQeFRc7yeGhXHo8zHPJWY1P6b/K25pZmIgFYk=;
        b=EfXFS93VEaptGzfoi7iQxHBA+fqlyRqA84rwc/Dhoi7kvNk2u5QrUVyxb80KKEGi1C
         JJIRX7w2Xz7F90CSAjum4I26DjDKqOhx4WwXaUg8mkQMd8r8f4MMYGmqY8Yf5XMnDUjg
         pDipGbKTkFVsWPZTeRMSM/0jR6exchpPeaGJkpeGnKQKQaDzJ4qRHsSwwnAmApe1Uwld
         PJNack2y/Y2wbnEUfJDZ3zebg8Hu/StYU8EjyBH/9g19KITMcSBSrOOobga7IucPLiag
         SRNdUL69P3fuEL5xMzXwCZVzYYe0CrJU5uCppQPlIWTkwrkn8BpmnieOepvTdYW2IRHI
         Z6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nMDyMKTQeFRc7yeGhXHo8zHPJWY1P6b/K25pZmIgFYk=;
        b=Dk1BGJy7RSlwiwIKD7924RqyjpfhdcCDTc5yK4wV0hulAKzx/Z+eLIaq8wGt8maEuz
         AVHzVtifdIaXwmGzJGY8Pln1HOoD8tQ2AnJF5ezj2an+PemCe+q6rmvSE+2eWAUaFvDJ
         K9zoquAdYxwYzzaV8lrSVUgq6p+JIZ8UWHFDh0nFlOGoMqPNZIguBRR5lQqKIjLFQrA+
         EtUbnUz8knkCygvlrDygq4+Im/L2+ATMKwYjDu4Er6lFhPDlA8/1+/xtaagZqOeADL8T
         hIt/ia25DpDz6rD7FisbLmA5LFnuudr3FomLdGWOiWMBSh9+UaJyT62INZdvQd30M4ke
         H2rA==
X-Gm-Message-State: AOAM53310kprTC1n6+3oIoSKZgSaeYijVHXiGh4ASZtw/IxhUFp01MPM
        85FhyjTluUw1jqM+qjJ0O3gyPP8A/gTHjxlHBoJ4zw==
X-Google-Smtp-Source: ABdhPJz4TyvVow/bo1K81Z+vBi5tNHWEfGc/bR90jI2nZwU8E3rePDbcio8+1u/XpwDH+CzmBWGMYqJYSsw5rLAuOnw=
X-Received: by 2002:aa7:8105:0:b029:18e:c8d9:2c24 with SMTP id
 b5-20020aa781050000b029018ec8d92c24mr7167536pfi.49.1605754686646; Wed, 18 Nov
 2020 18:58:06 -0800 (PST)
MIME-Version: 1.0
References: <20201113105952.11638-1-songmuchun@bytedance.com>
 <20201113105952.11638-4-songmuchun@bytedance.com> <697ee4b7-edcc-e3b8-676c-935ec445c05d@oracle.com>
In-Reply-To: <697ee4b7-edcc-e3b8-676c-935ec445c05d@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 19 Nov 2020 10:57:28 +0800
Message-ID: <CAMZfGtW6f-zPxT6m7vvhEaq8R9GnwZFar39NOgYTbhLPBJEq5Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 03/21] mm/hugetlb: Introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 19, 2020 at 6:39 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 11/13/20 2:59 AM, Muchun Song wrote:
> > The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
> > whether to enable the feature of freeing unused vmemmap associated
> > with HugeTLB pages. Now only support x86.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  arch/x86/mm/init_64.c |  2 +-
> >  fs/Kconfig            | 14 ++++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > index 0a45f062826e..0435bee2e172 100644
> > --- a/arch/x86/mm/init_64.c
> > +++ b/arch/x86/mm/init_64.c
> > @@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
> >
> >  static void __init register_page_bootmem_info(void)
> >  {
> > -#ifdef CONFIG_NUMA
> > +#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
> >       int i;
> >
> >       for_each_online_node(i)
> > diff --git a/fs/Kconfig b/fs/Kconfig
> > index 976e8b9033c4..67e1bc99574f 100644
> > --- a/fs/Kconfig
> > +++ b/fs/Kconfig
> > @@ -245,6 +245,20 @@ config HUGETLBFS
> >  config HUGETLB_PAGE
> >       def_bool HUGETLBFS
> >
> > +config HUGETLB_PAGE_FREE_VMEMMAP
> > +     def_bool HUGETLB_PAGE
> > +     depends on X86
> > +     depends on SPARSEMEM_VMEMMAP
> > +     depends on HAVE_BOOTMEM_INFO_NODE
> > +     help
> > +       When using SPARSEMEM_VMEMMAP, the system can save up some memory
>
> Should that read,
>
>         When using HUGETLB_PAGE_FREE_VMEMMAP, ...
>
> as the help message is for this config option.

Got it. Thanks

>
> --
> Mike Kravetz



-- 
Yours,
Muchun
