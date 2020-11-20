Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA32EC63777
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 10:43:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D3172242A
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 10:43:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="jiRnb2Vu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbgKTKna (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 05:43:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgKTKn3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 05:43:29 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB5EC061A04
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 02:43:29 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id 34so6946978pgp.10
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 02:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQuIBxgF3nInKkS93utHCBrC42W7hV1R/eZWClqzWyY=;
        b=jiRnb2Vun3WvAKHS2DVxvEth9FjyVS5SogsErgiDU4+Q6Nsl1EGkcY74MuYVE4cdHt
         4UkhpyFGRkFL0rkcjKRRhqb2HrxSRT3UyE6BJJ/QTpKI9yRuYogR7MAQQlXKOxcrBILc
         xWvHgkwZgKZpJOiX0hqQ+dfqZOfNS2i0tGSUzlQ8eYltW413589oOzimfkKRfZRgXZbu
         ovGqzcvtMNNluYeI3x1gx4YA/2VWUdbmVMGdr3n6B6s7XvGbTV1t+yezpa9kCTest+gj
         TWKYtrUPbumihdKMfV1amAuikbAsIGwbTvMzjI1aY+Ua669lZKvVfq1+kUqq+xOYAMvx
         vu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQuIBxgF3nInKkS93utHCBrC42W7hV1R/eZWClqzWyY=;
        b=odZHIUQLCWrDr1rf+z2G1ylJMfjqLZwzFA86vdzOCf4mbaoDMoofthdHWQMG7D1tG6
         TpY3u0ntruQqyWnWXo4NALYTrRhah9yWab+zg3aQYXl9/uyR+RlYudCgRmiHA4MJZ7WK
         7hoeJyZpg1puO2+0Zj3NA3fECKLioPvVX+fwDfEohVx38K6und01GBuz9PBjUKAUlI5H
         FTSpl5ZnLJgQpxLgzQM6slodeCsoo91nPOcDI6A/E+dcVgX9zuRwrT8axLIM2FN5nd7N
         LIgsLEUWw9TLxqEwzpgHAG4c0qCycMnOZ69ihHZOfivrw1LRtAUHqt8yT0TIeixi9SK5
         Qd9w==
X-Gm-Message-State: AOAM531vxDfw65+faPG7VWtgvPZrfRGkIUbcQ8xxdS1fU4IZXVLOosb3
        R9PjX4NcdYUwuzq5fWZK6UyZqdeMQQDG8a4pWA84iA==
X-Google-Smtp-Source: ABdhPJzU2lJHp8cWhl4H5eA0FRp40MwByTZiz8vUxJJfLjqWf4fU0UXLqt245oSkK/Dg28Trz55Pdn020p1OgPAU5sw=
X-Received: by 2002:a63:fe0c:: with SMTP id p12mr16046991pgh.31.1605869009142;
 Fri, 20 Nov 2020 02:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20201120064325.34492-1-songmuchun@bytedance.com>
 <20201120064325.34492-22-songmuchun@bytedance.com> <dc77d433-b5f0-0f4a-a4e9-f888b079618a@redhat.com>
In-Reply-To: <dc77d433-b5f0-0f4a-a4e9-f888b079618a@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 20 Nov 2020 18:42:46 +0800
Message-ID: <CAMZfGtXEf01XeLhTS5_EuTTWYKKj8DzUzCQJ=zXB_3VGB3MMDw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 21/21] mm/hugetlb: Disable freeing
 vmemmap if struct page size is not power of two
To:     David Hildenbrand <david@redhat.com>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 5:16 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 20.11.20 07:43, Muchun Song wrote:
> > We only can free the unused vmemmap to the buddy system when the
> > size of struct page is a power of two.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >   mm/hugetlb_vmemmap.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index c3b3fc041903..7bb749a3eea2 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -671,7 +671,8 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
> >       unsigned int order = huge_page_order(h);
> >       unsigned int vmemmap_pages;
> >
> > -     if (hugetlb_free_vmemmap_disabled) {
> > +     if (hugetlb_free_vmemmap_disabled ||
> > +         !is_power_of_2(sizeof(struct page))) {
> >               pr_info("disable free vmemmap pages for %s\n", h->name);
> >               return;
> >       }
> >
>
> This patch should be merged into the original patch that introduced
> vmemmap freeing.

Oh, yeah. Will do.

>
> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
