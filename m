Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4C3C55178
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 02:59:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 252F72151B
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 02:59:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="slH7iqOC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409908AbgJ0C7P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 22:59:15 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32935 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2409910AbgJ0C7O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 22:59:14 -0400
Received: by mail-pf1-f194.google.com with SMTP id j18so76854pfa.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2r/6wM2urus7RuK+nJNOIaHAlYFuE3iJoIvxfk3Ke04=;
        b=slH7iqOCvbuRJpOoFTcLbTGUdbV0PTNzytfn6YhKrnJ0ZvHkh9I3aom/I3EGuJ5yF/
         l4ufdqid2leBOdcUopOquocKGZ/EHVGg7Oh/tPDjjpbm8PtJL+JUG+gZi98oQPE23LoM
         eMiTj4EVGIVGcA1cuA2v/FrmwMiAnDpvBHIncBVMzS83A5FDvM1pY0RNyHw2XX6fjgkZ
         +VMqHnXIFr/ybLbdSel4j6JBIHw2l7p7LCUP2OHTl96MnRpCpQvJ8gkv3BWelgqBkUGd
         VbbO0EkBJb5JlJS6ZVz3o7sK7ugIEBSqnLL2XzVzqQrWjC3+CRwq1lRut5CCXYclcazG
         X0Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2r/6wM2urus7RuK+nJNOIaHAlYFuE3iJoIvxfk3Ke04=;
        b=mbYzOtFWT2u+qOWJV8WEztwKYa+eGqKo5ZbsD/rLRD5h4wAYh3xK5OsqBQpBiyD6c8
         YuQNnNM9zg0IL0Un9E7OQwHWJGPiW5aVeUcQLH34g0MVEE/ygMqjqReuvzDyrm73vkxS
         +3Gk286wjyISdKVW9QbeabSGh4Bo+HtL1TQt8nXwud7vU2aml2y3MamBm9ihx8rYbnn/
         +gvYdn1VSzMXKbLhS0cpRKeiOL3Avg+xXWPKQuxgAth23jlhj5hkH3XjBIYW8PYEwqaV
         hZ1sC4ALdmfLSH9lf1rUvv/kjaqn5nrL/yDbvj5xnhTvMXOheyx13RA3zHmWsU1kAmsL
         wOEA==
X-Gm-Message-State: AOAM530Nz0mSQt8l9/V2RC8BB4URx3liKSLiwe60OIzAIpTsH5HFo7Gx
        Y11Geb5WedD1tTL+LzA5uifYfk2YV5dTaCsFs3ibKA==
X-Google-Smtp-Source: ABdhPJyWYIE4OTNvD1Li2UgYskyIXudRuzoDpQ5mbVNn2nBDoaVGbFjNKzwuIOmIbtQ3Tu3mU4VqlNbMc44uum/3l/c=
X-Received: by 2002:a65:5383:: with SMTP id x3mr15962pgq.341.1603767552671;
 Mon, 26 Oct 2020 19:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20201026145114.59424-1-songmuchun@bytedance.com>
 <20201026145114.59424-8-songmuchun@bytedance.com> <20201026160142.GT20115@casper.infradead.org>
In-Reply-To: <20201026160142.GT20115@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 27 Oct 2020 10:58:36 +0800
Message-ID: <CAMZfGtX2p_M15i0pE7tTu3amPNof5PW2jJFUnXtGdGRyGydAtw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 07/19] mm/hugetlb: Free the vmemmap
 pages associated with each hugetlb page
To:     Matthew Wilcox <willy@infradead.org>
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 27, 2020 at 12:01 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Oct 26, 2020 at 10:51:02PM +0800, Muchun Song wrote:
> > +static void split_vmemmap_pmd(pmd_t *pmd, pte_t *pte_p, unsigned long addr)
> > +{
> > +     struct mm_struct *mm = &init_mm;
> > +     struct page *page;
> > +     pmd_t old_pmd, _pmd;
> > +     int i;
> > +
> > +     old_pmd = READ_ONCE(*pmd);
> > +     page = pmd_page(old_pmd);
> > +     pmd_populate_kernel(mm, &_pmd, pte_p);
> > +
> > +     for (i = 0; i < VMEMMAP_HPAGE_NR; i++, addr += PAGE_SIZE) {
> > +             pte_t entry, *pte;
> > +
> > +             entry = mk_pte(page + i, PAGE_KERNEL);
>
> I'd be happier if that were:
>
>         pgprot_t pgprot = PAGE_KERNEL;
> ...
>         for (i = 0; i < VMEMMAP_HPAGE_NR; i++, addr += PAGE_SIZE) {
>                 pte_t entry, *pte;
>
>                 entry = mk_pte(page + i, pgprot);
>                 pgprot = PAGE_KERNEL_RO;
>
> so that all subsequent tail pages are mapped read-only.
>

Good idea, do this can catch some illegal operations. Thanks.


-- 
Yours,
Muchun
