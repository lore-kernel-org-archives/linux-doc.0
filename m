Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8B89C433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 10:04:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EF2723444
	for <linux-doc@archiver.kernel.org>; Wed,  9 Dec 2020 10:04:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729289AbgLIKEU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 05:04:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728783AbgLIKET (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 05:04:19 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8613C0613CF
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 02:03:39 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id fh13so599839pjb.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 02:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L4gIWYaJaNZduh4JA7eIlOxCXtQORUEEZY9m5DkEeWg=;
        b=l9npCqtiWi6nm8WXc9Qci3HNqajeaFHfw3ao8fKDtkmuOfyiKaVSaitH/E/JRbjrv4
         0n8xsbdnhhNokdQjHGXGu0H2xPThEITAaW8TfUEeSBwjn/7s4evUip6C2wAgVLLtQOFg
         L9v1HvMHHIK16p7/ePp2Zmv8Uc6RmNXdkslycCkxclPEBFF2DESf8spil2nEvkQ+FLBZ
         tNGk8NMaxD/LOlx381vwi9mrf07041UpOHZFzOY82UlsVLDMJGGjJNoOkZ9Do1Asz4qp
         r/h0GnWLRyTMvuaqqWZtPFKTZB++54sOygrU2zP6ESM4PVaCFZOuk+DFxp65rH7FZXSL
         AvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L4gIWYaJaNZduh4JA7eIlOxCXtQORUEEZY9m5DkEeWg=;
        b=Hfj1LFZLbsEVuX/i3ZodEeNy4SsQHeSgdcsN4qPefusDhHScdoXwZXDullgA7/Cdt1
         voy4w2y5X+mYT4xnmldi7SbgqIzlC+pWnP3Mqwt730vxcWwSalqcBjA5lD/8T97hTMro
         L4hh5U0ZRlvXsfBysr/FvG+rhvR2wWIOqpZsjUyWX+4f/w1yAr5n51EhYbgGpXMo7aCS
         RWlQxV0cGh/OPRnrbrD8Y4sfhI/8KV5ui+Sa/RKc39CUt0twaupFj8eIJTtb6yL+3Ah4
         Tr0Fz4gu44mtm586P1ULHaLM1KvbSuQXd2G3ts0Y9+mu7wwpGoMftpKAbKvpZ6kEyctv
         szwQ==
X-Gm-Message-State: AOAM530I8O+f/YTCApmk60sbdfQo1NrdW768Avq2GyIX1xvBEJG+uGQ0
        /Ju21rBr6Zvv0mAS3eOX4Lsr7S3pdIMi9Xql5+sPhA==
X-Google-Smtp-Source: ABdhPJwLeHxukD6MEvUiceVVZUfrPocdn+tRQUO6LQUONC5Tz16TBKz/PD0oEJKhT4wgjGrX/3qsMLMUQcocS3f1/hc=
X-Received: by 2002:a17:902:76c8:b029:d9:d6c3:357d with SMTP id
 j8-20020a17090276c8b02900d9d6c3357dmr1336707plt.34.1607508219309; Wed, 09 Dec
 2020 02:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20201130151838.11208-1-songmuchun@bytedance.com>
 <20201130151838.11208-7-songmuchun@bytedance.com> <ba57ea7d-709b-bf36-d48a-cc72a26012cc@redhat.com>
In-Reply-To: <ba57ea7d-709b-bf36-d48a-cc72a26012cc@redhat.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 9 Dec 2020 18:03:02 +0800
Message-ID: <CAMZfGtV5200NZXH9Z_Z9qXo5FCd9E6JOTXjQtzcF0xGi-gCuPg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v7 06/15] mm/hugetlb: Disable freeing
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

On Wed, Dec 9, 2020 at 5:57 PM David Hildenbrand <david@redhat.com> wrote:
>
> On 30.11.20 16:18, Muchun Song wrote:
> > We only can free the tail vmemmap pages of HugeTLB to the buddy allocator
> > when the size of struct page is a power of two.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  mm/hugetlb_vmemmap.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 51152e258f39..ad8fc61ea273 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -111,6 +111,11 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
> >       unsigned int nr_pages = pages_per_huge_page(h);
> >       unsigned int vmemmap_pages;
> >
> > +     if (!is_power_of_2(sizeof(struct page))) {
> > +             pr_info("disable freeing vmemmap pages for %s\n", h->name);
>
> I'd just drop that pr_info(). Users are able to observe that it's
> working (below), so they are able to identify that it's not working as well.

The below is just a pr_debug. Do you suggest converting it to pr_info?

>
> > +             return;
> > +     }
> > +
> >       vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
> >       /*
> >        * The head page and the first tail page are not to be freed to buddy
> >
>
> Please squash this patch into the enabling patch and add a comment
> instead, like
>
> /* We cannot optimize if a "struct page" crosses page boundaries. */
>

Will do. Thanks.

> --
> Thanks,
>
> David / dhildenb
>


-- 
Yours,
Muchun
