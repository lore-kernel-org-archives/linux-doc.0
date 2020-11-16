Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BA1C6369E
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 15:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F5AC221F9
	for <linux-doc@archiver.kernel.org>; Mon, 16 Nov 2020 15:40:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="xV7xxuxw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730781AbgKPPku (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Nov 2020 10:40:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730683AbgKPPks (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Nov 2020 10:40:48 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDBEC0613CF
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 07:40:47 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id 34so10281632pgp.10
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2020 07:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVDk25klplgFEcpkGpaROXvrHpIQaG+lE/PmD3FQfsg=;
        b=xV7xxuxw5Gq4YqNkxVYnjK/3wd86nAg3q01YVwVs772XbJqgJXRHSqrakRA81SM+IP
         s0czxMzJp8633mbm3jlO//Kd6r5mWOqzbrnwqKF2PNyeYzVa66e0nu1dz6/uU4fc3/DB
         FK4BkNhrJ6OK1MT+B+hsl51FimoMQ4b7GR52ZnDhWVLCuaJF4Pxdc2pgvc2OAjYqu6aB
         xflOGqwfbYj0qwknHmBX8yRlFXoHqnifSoctAXrEHzpM/plnui5MXafe1Wz7UbECH6fo
         KZZqo077rycOhEOextBkvm2jDXB6oCkzhXxGvvXVdV+4UbfEYDFz1P933iDi7+O5HeR3
         9h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVDk25klplgFEcpkGpaROXvrHpIQaG+lE/PmD3FQfsg=;
        b=ICqQOvmlWk+Dd70Og8A7LAGccjIvts0MGDUi3qGodjDKZH3i9lCTrilWvYiHtf0ZaB
         /sPxAZVGffDsonajK8Zc1TR1NrLBN9ITG22KNGEYdRxAgswWZhDWC4zDy1OAyIQduRVd
         5nTwnanuk6sIPfKcddNfG2SWdkVD/vPNqJy7yqVYm8LpOYhnswitD6hFsQtlV4JlO6qz
         ELGnFbh3z/BLabt6iUbZqUglXY/2AuUQ60YVhdly+ap2x4H6sEU6iGWyM84FAn8UMqGk
         kdQFgwZbQazoku4TRmnCbPaZd3Q9IS4HsGPSpHPsEw3iG/vAQHBsiYRDUdZg1HtbYZJg
         mpew==
X-Gm-Message-State: AOAM530M6qqnpVj37goP/ewlHFBp9w3bl6jZZG+spPulp8ZOQbPdPhOH
        g+6oznfeFuSjcOlPQ0j45T4xU5hg+XHdiCcF7PCB3Q==
X-Google-Smtp-Source: ABdhPJyJg96R7CKAQR03WWFb674tV+f5dzjjcC6c1Jts1Yw7rBo8IWAFN54P/yT/Pp/gxo+9R2TrcBItgVpeQEdiqeI=
X-Received: by 2002:a17:90a:8086:: with SMTP id c6mr16639456pjn.147.1605541246831;
 Mon, 16 Nov 2020 07:40:46 -0800 (PST)
MIME-Version: 1.0
References: <20201113105952.11638-1-songmuchun@bytedance.com>
 <20201113105952.11638-5-songmuchun@bytedance.com> <20201116133310.GA32129@linux>
In-Reply-To: <20201116133310.GA32129@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 16 Nov 2020 23:40:10 +0800
Message-ID: <CAMZfGtU1v+6zje_-CqrvHLSbDYkcLeVpi=29-AMieOXQE5Qokg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 04/21] mm/hugetlb: Introduce
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Nov 16, 2020 at 9:33 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Fri, Nov 13, 2020 at 06:59:35PM +0800, Muchun Song wrote:
> > If the size of HugeTLB page is 2MB, we need 512 struct page structures
> > (8 pages) to be associated with it. As far as I know, we only use the
> > first 4 struct page structures. Use of first 4 struct page structures
> > comes from HUGETLB_CGROUP_MIN_ORDER.
>
> Once you mention 2MB HugeTLB page and its specific I would also mention
> 1GB HugeTLB pages, maybe something along these lines.
> I would supress "As far as I know", we __know__ that we only use
> the first 4 struct page structures to track metadata information.

Thanks. Will do.

>
> > +/*
> > + * There are 512 struct page structures(8 pages) associated with each 2MB
> > + * hugetlb page. For tail pages, the value of compound_head is the same.
> > + * So we can reuse first page of tail page structures. We map the virtual
> > + * addresses of the remaining 6 pages of tail page structures to the first
> > + * tail page struct, and then free these 6 pages. Therefore, we need to
> > + * reserve at least 2 pages as vmemmap areas.
> > + */
> > +#define RESERVE_VMEMMAP_NR           2U
>
> Either I would include 1GB specific there as well, or I would not add
> any specifics at all and just go by saying that first two pages are used,
> and the rest can be remapped to the first page that contains the tails.

Thanks. Will do.

>
>
> > +void __init hugetlb_vmemmap_init(struct hstate *h)
> > +{
> > +     unsigned int order = huge_page_order(h);
> > +     unsigned int vmemmap_pages;
> > +
> > +     vmemmap_pages = ((1 << order) * sizeof(struct page)) >> PAGE_SHIFT;
> > +     /*
> > +      * The head page and the first tail page are not to be freed to buddy
> > +      * system, the others page will map to the first tail page. So there
> "the remaining pages" might be more clear.

Thanks.

>
> > +      * are (@vmemmap_pages - RESERVE_VMEMMAP_NR) pages can be freed.
> "that can be freed"

Thanks.

>
> > +      *
> > +      * Could RESERVE_VMEMMAP_NR be greater than @vmemmap_pages? This is
> > +      * not expected to happen unless the system is corrupted. So on the
> > +      * safe side, it is only a safety net.
> > +      */
> > +     if (likely(vmemmap_pages > RESERVE_VMEMMAP_NR))
> > +             h->nr_free_vmemmap_pages = vmemmap_pages - RESERVE_VMEMMAP_NR;
> > +     else
> > +             h->nr_free_vmemmap_pages = 0;
>
> This made think of something.
> Since struct hstate hstates is global, all the fields should be defined to 0.
> So, the following assignments in hugetlb_add_hstate:
>
>         h->nr_huge_pages = 0;
>         h->free_huge_pages = 0;
>
> should not be needed.
> Actually, we do not initialize other values like resv_huge_pages
> or surplus_huge_pages.
>
> If that is the case, the "else" could go.

Yeah, I agree with you.

>
> Mike?
>
> The changes itself look good to me.
> I think that putting all the vemmap stuff into hugetlb-vmemmap.* was
> the right choice.
>
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
