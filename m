Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0F2C6379D
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 09:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 16333223B0
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 09:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="SYxcW6HI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgKTJhx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 04:37:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727123AbgKTJhw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 04:37:52 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC164C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 01:37:51 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id r18so6826468pgu.6
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 01:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Irqz9SDqUIDSV5L/8FdFdXAurDYsnyc+HWaKMTHel6Y=;
        b=SYxcW6HISIb8Awuh3nmJxgBqMNn6Q5GeMGaNN4zWGoyErVEU+AZ6B7m7JrV2+aVg/I
         qKv9JPOYAWnCAT+77ENHbA0k0suOlxx8gRsdjzajNwuUzaTKLTJVooMbRGtWd+194Fhs
         3CwBMuEyoIWueQNySRtc0S3biNBTuMrHggzoUWAFee8WLDSUVlmcpjvOHU3ma2hNKn49
         2j//Ku7/vTvBvqjgtoS3EE8Z4UzTujVrgtrGX1iCL0LyE0sM6+rYkiGPliBe1aickIOt
         fTrJTmvKQkEes7ltwtIat40s17xslYkJu7DhUKLTElLqX7NCeVbEIlMeij/RqzE1BiW9
         piiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Irqz9SDqUIDSV5L/8FdFdXAurDYsnyc+HWaKMTHel6Y=;
        b=oagidnl8vcSLuDnp43rcrLUFtLj5qD55eZQKYHkdeVBed+k40/ELm6xJZOzcK6+rmG
         q0twpx2TD5UgV6YAyL7iXxoj6VKKCQcGemWTbeGXC6qmwE5Nw2dUHVLy2VFMyqF3gLj9
         fMOzv7qoB81VPKCPpUg6Ee7GOkEPB/C2R9p3NmFsDbPELvIAGYgpqdM/UgM65P3KWO92
         or2WbSnKSIR/kIV+k5iKCmJJE0xteFPVL2FfaF87GcoAid2Lr9uaNoZ5v0XYETPdT21r
         soQprHEcGNW3CDdi18R1VnNb6XwpvQwWod3aUrOV1CKQcnSHVQY3KtGHRmB6+4naD7OH
         QNHw==
X-Gm-Message-State: AOAM530H0YKAMyaUbbsMFbfoTA7wxILOCHw98E9KgxOAculU0RjIHaMx
        wYCRpJ63D8DL4Kxv+BB+jTupZCje/Us0lF73uu9tog==
X-Google-Smtp-Source: ABdhPJw9yspq9j/qG1NKAt5aapXI1Q0GtnvJsXQ+8BEuEA6w4nEfVelDgROJG5yjDGSXPqb9X0CBLn7z1ViZeLeqFp4=
X-Received: by 2002:a17:90b:941:: with SMTP id dw1mr9250411pjb.147.1605865071332;
 Fri, 20 Nov 2020 01:37:51 -0800 (PST)
MIME-Version: 1.0
References: <20201120064325.34492-1-songmuchun@bytedance.com>
 <20201120064325.34492-12-songmuchun@bytedance.com> <20201120081123.GC3200@dhcp22.suse.cz>
 <CAMZfGtWVxCPpL7=0dfHa7_qtakmGDMLP0twWoyM=gVou=HRmEg@mail.gmail.com> <20201120092826.GL3200@dhcp22.suse.cz>
In-Reply-To: <20201120092826.GL3200@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 20 Nov 2020 17:37:09 +0800
Message-ID: <CAMZfGtVPNdykd=E2bEje0GCdZT9ksLy2BdaRZ41eRDbGQp0_rg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 11/21] mm/hugetlb: Allocate the vmemmap
 pages associated with each hugetlb page
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 5:28 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 20-11-20 16:51:59, Muchun Song wrote:
> > On Fri, Nov 20, 2020 at 4:11 PM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Fri 20-11-20 14:43:15, Muchun Song wrote:
> > > [...]
> > > > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > > > index eda7e3a0b67c..361c4174e222 100644
> > > > --- a/mm/hugetlb_vmemmap.c
> > > > +++ b/mm/hugetlb_vmemmap.c
> > > > @@ -117,6 +117,8 @@
> > > >  #define RESERVE_VMEMMAP_NR           2U
> > > >  #define RESERVE_VMEMMAP_SIZE         (RESERVE_VMEMMAP_NR << PAGE_SHIFT)
> > > >  #define TAIL_PAGE_REUSE                      -1
> > > > +#define GFP_VMEMMAP_PAGE             \
> > > > +     (GFP_KERNEL | __GFP_NOFAIL | __GFP_MEMALLOC)
> > >
> > > This is really dangerous! __GFP_MEMALLOC would allow a complete memory
> > > depletion. I am not even sure triggering the OOM killer is a reasonable
> > > behavior. It is just unexpected that shrinking a hugetlb pool can have
> > > destructive side effects. I believe it would be more reasonable to
> > > simply refuse to shrink the pool if we cannot free those pages up. This
> > > sucks as well but it isn't destructive at least.
> >
> > I find the instructions of __GFP_MEMALLOC from the kernel doc.
> >
> > %__GFP_MEMALLOC allows access to all memory. This should only be used when
> > the caller guarantees the allocation will allow more memory to be freed
> > very shortly.
> >
> > Our situation is in line with the description above. We will free a HugeTLB page
> > to the buddy allocator which is much larger than that we allocated shortly.
>
> Yes that is a part of the description. But read it in its full entirety.
>  * %__GFP_MEMALLOC allows access to all memory. This should only be used when
>  * the caller guarantees the allocation will allow more memory to be freed
>  * very shortly e.g. process exiting or swapping. Users either should
>  * be the MM or co-ordinating closely with the VM (e.g. swap over NFS).
>  * Users of this flag have to be extremely careful to not deplete the reserve
>  * completely and implement a throttling mechanism which controls the
>  * consumption of the reserve based on the amount of freed memory.
>  * Usage of a pre-allocated pool (e.g. mempool) should be always considered
>  * before using this flag.
>
> GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_HIGH

We want to free the HugeTLB page to the buddy allocator, but before that,
we need to allocate some pages as vmemmap pages, so here we cannot
handle allocation failures. I think that we should replace the
__GFP_RETRY_MAYFAIL to __GFP_NOFAIL.

GFP_KERNEL | __GFP_NOFAIL | __GFP_HIGH

This meets our needs here. Thanks.

>
> sounds like a more reasonable fit to me.
>
> --
> Michal Hocko
> SUSE Labs



-- 
Yours,
Muchun
