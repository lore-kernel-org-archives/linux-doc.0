Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B760BC2BB40
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 08:36:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71FE62388B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 08:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbgLQIgG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 03:36:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbgLQIgF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 03:36:05 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1E8C0617B0
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 00:35:25 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id c12so18554596pfo.10
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 00:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UD8UiYZqJIf2Kb/S80auNAb6silZRJyxZE/TFtnTm+A=;
        b=tWxbf1ddK/nCiLVHjiT+LH4sjGyxYjLBASs/MS6lEDwMw+v+jqcQVQjocFVkVnq+oe
         FxvthimPCcDfeWT/HMW5GLkxqb20ihPfuCipQ1amnIjrd8H/wfmABZPlc+RbkUUH0Ko6
         ae7NO2R7hd8+y/qIY2MTPBV+m14MHLmF6BSTeQVJpyJ5JlmgNmBGzxK63kQjsUk/jEAA
         7dUCa1XOB5hpkt4HPaVDx9/ae28lGVJV0Rgotjy/bB4SrfD5C+fIPghHigfNjhN01xtp
         FTGUewRDErbxGAszaGlP2X/wrxKJkaJwtQAS/tk3TqXU+i9BrRnKdZr2/8h0D1QVFk+G
         50aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UD8UiYZqJIf2Kb/S80auNAb6silZRJyxZE/TFtnTm+A=;
        b=VSy5AgkND2n7v2zXtTxw7ni3PFJHFNOZDZoqnBFoWGcy22joXi5KWjtVhHHJiIlB2L
         hZatyM159zuRJGaHLXprXHp3s50euprnrBMCe/ud/eNH825LEZkniBByY0qejCte9FPJ
         Bp/LZUyqEDnY6FjXMZkZwmh56H2NijFSG+ieqhg2ixaOgNjr8tjmKwRISJYau0VTPAsA
         H47wvmKCj3nXOiPieS44JikJCsCFBQhkBUEHcDuYLHestOWNHDVWnXpe784rIVMo9qOX
         62m9oTwrEH2L0SP+yTeuOrX49YHNRyZkPxxHLrIRj+/JLrsJL1CkJ56yJaxceGsCEv8C
         cSpQ==
X-Gm-Message-State: AOAM533J3QA3Orok7CrMVn6GfyF3ubTDaVzoKUUuy9OdLVd6kiRlbrsA
        7MMgZiX1x/SofzhIGpiOxD3l4k9HYT1km3goDXGMbA==
X-Google-Smtp-Source: ABdhPJythkfZxHytXhliHdLNrWqdzMo5Hdh1huYzcFpYuttP2PnH1eM1A0sAeWedX40e4XiWjTLCpwgmi44v+L95D3Q=
X-Received: by 2002:a63:1f21:: with SMTP id f33mr13398642pgf.31.1608194125214;
 Thu, 17 Dec 2020 00:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-10-songmuchun@bytedance.com> <20201216134354.GD29394@linux>
In-Reply-To: <20201216134354.GD29394@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 17 Dec 2020 16:34:48 +0800
Message-ID: <CAMZfGtVc8Lp+pCEw1aoEf6_yTys4GQMEqNHdgFetGyWr6V01LA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 09/11] mm/hugetlb: Introduce
 nr_free_vmemmap_pages in the struct hstate
To:     Oscar Salvador <osalvador@suse.de>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 16, 2020 at 9:44 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Sun, Dec 13, 2020 at 11:45:32PM +0800, Muchun Song wrote:
> > All the infrastructure is ready, so we introduce nr_free_vmemmap_pages
> > field in the hstate to indicate how many vmemmap pages associated with
> > a HugeTLB page that we can free to buddy allocator. And initialize it
> "can be freed to buddy allocator"
>
> > in the hugetlb_vmemmap_init(). This patch is actual enablement of the
> > feature.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
>
> With below nits addressed you can add:
>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>
> >  static int __init early_hugetlb_free_vmemmap_param(char *buf)
> >  {
> > +     /* We cannot optimize if a "struct page" crosses page boundaries. */
> > +     if (!is_power_of_2(sizeof(struct page)))
> > +             return 0;
> > +
>
> I wonder if we should report a warning in case someone wants to enable this
> feature and stuct page size it not power of 2.
> In case someone wonders why it does not work for him/her.

Agree. I think that we should add a warning message here.

>
> > +void __init hugetlb_vmemmap_init(struct hstate *h)
> > +{
> > +     unsigned int nr_pages = pages_per_huge_page(h);
> > +     unsigned int vmemmap_pages;
> > +
> > +     if (!hugetlb_free_vmemmap_enabled)
> > +             return;
> > +
> > +     vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
> > +     /*
> > +      * The head page and the first tail page are not to be freed to buddy
> > +      * system, the others page will map to the first tail page. So there
> > +      * are the remaining pages that can be freed.
> "the other pages will map to the first tail page, so they can be freed."
> > +      *
> > +      * Could RESERVE_VMEMMAP_NR be greater than @vmemmap_pages? It is true
> > +      * on some architectures (e.g. aarch64). See Documentation/arm64/
> > +      * hugetlbpage.rst for more details.
> > +      */
> > +     if (likely(vmemmap_pages > RESERVE_VMEMMAP_NR))
> > +             h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
> > +
> > +     pr_info("can free %d vmemmap pages for %s\n", h->nr_free_vmemmap_pages,
> > +             h->name);
>
> Maybe specify this is hugetlb code:
>
> pr_info("%s: blabla", __func__, ...)
> or
> pr_info("hugetlb: blalala", ...);
>
> although I am not sure whether we need that at all, or maybe just use
> pr_debug().
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
