Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12AA8C433E0
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 09:21:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7F6E64F4A
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 09:21:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhBEJUZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 04:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhBEJRu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 04:17:50 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CADC061356
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 01:16:52 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id e12so3253239pls.4
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 01:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JKBbTXlpTBr2zkO3oY2VYzHBYqP1g9U9wb97XhjPk3c=;
        b=j7JyuYJPrQMqeqz2xvLh4JkheheodV0fbqZ+U5Nyi+WlHItSQ/S5FhNeMvX3ErJFo0
         a/uKfBqkKYGqTHCIzbz3OIxi7IAwIL/dtcEPj0yabvtrpkv+ac86EWgnu9iWMwThbY/9
         kkrEPfq+wxD2BEgUDga2Ap10+8GrkdtO8FEw4+ZOXdNiMGKXbCcKs7nKu7BbSHSMlSwW
         WSVqrtQfbeD1UOBLKhUXbi9V7gfRLUS9H/v5W/tixV7HKePviu+pHr5lINyLf8GwRVC4
         gxUFexvRlUBrJsm87ZD+E7EbrSmvltyn5C2GCAgHlgIq78Y0gsThcpTFsa2q0k3MMa2y
         3dwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JKBbTXlpTBr2zkO3oY2VYzHBYqP1g9U9wb97XhjPk3c=;
        b=hftZWyUyP4ROLbWPthuh8vN5SzkM7n5ZUBqRsk2PSqGl3WMWxnM3N/JQ0n2Fc9TBzF
         m8eRNIO2l1iWcY/V5sdFJvB/8hjJY+hUtosR56JOXqRe+68b6lGTqF9PdM9oKu3/NBYF
         R7YjLqbQbH72zK5WeRwJvoX6QGeM4miqi0JSpKjvNRR6Zr9vkaWg7nLmFOGr3NQJKYI+
         keQ7bsNCZd3zM4iLKxUekzYyDpcM1EDdIbH2q9obQb2jiVH25an3Re5PChdgkWA7W/YE
         Jw0RXkwuScPv0ZSe4JRTNrqR+waXQHo+FpulWHHvErIc28be+pfKJ+sbtO0/yBg43d93
         YVXQ==
X-Gm-Message-State: AOAM533NKYVOmOPMmMoFzG+GzEryhSd+F3XBLHuarXi60mwLJ+rBsPo1
        geCFpXmLdBpSrrrs7gXnhXY9cpnozEwFpV/IxSQh6g==
X-Google-Smtp-Source: ABdhPJxZ6G6+qg2ZmOZzWsRNHh2l3AmLgDkONGW2As0+kb3WJmj4TRcnH8wewkq5uTSX/8vKKt1X+HLNb6wSWA/XJ6M=
X-Received: by 2002:a17:90b:1096:: with SMTP id gj22mr3172401pjb.229.1612516611919;
 Fri, 05 Feb 2021 01:16:51 -0800 (PST)
MIME-Version: 1.0
References: <20210204035043.36609-1-songmuchun@bytedance.com>
 <20210204035043.36609-9-songmuchun@bytedance.com> <20210205090924.GA14537@linux>
In-Reply-To: <20210205090924.GA14537@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 5 Feb 2021 17:16:14 +0800
Message-ID: <CAMZfGtUWo9=ca9dzE1--uHYQ-9Az3cbxy6v4Kn6pcHGZ04zcfg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v14 8/8] mm: hugetlb: optimize the code
 with the help of the compiler
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
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 5, 2021 at 5:09 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Feb 04, 2021 at 11:50:43AM +0800, Muchun Song wrote:
> > We cannot optimize if a "struct page" crosses page boundaries. If
> > it is true, we can optimize the code with the help of a compiler.
> > When free_vmemmap_pages_per_hpage() returns zero, most functions are
> > optimized by the compiler.
>
> "When the "struct page size" crosses page boundaries we cannot
>  make use of this feature.
>  Let free_vmemmap_pages_per_hpage() return zero if that is the case,
>  most of the functions can be optimized away."
>
> I think the above is more clear, but just a suggestion.

OK. I will use it. Thanks for your suggestions.

>
>
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks.

>
> > ---
> >  include/linux/hugetlb.h |  3 ++-
> >  mm/hugetlb_vmemmap.c    | 13 +++++++++++++
> >  2 files changed, 15 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index 822ab2f5542a..7bfb06e16298 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -878,7 +878,8 @@ extern bool hugetlb_free_vmemmap_enabled;
> >
> >  static inline bool is_hugetlb_free_vmemmap_enabled(void)
> >  {
> > -     return hugetlb_free_vmemmap_enabled;
> > +     return hugetlb_free_vmemmap_enabled &&
> > +            is_power_of_2(sizeof(struct page));
> >  }
> >  #else
> >  static inline bool is_hugetlb_free_vmemmap_enabled(void)
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 8efad9978821..068d0e0cebc8 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -211,6 +211,12 @@ early_param("hugetlb_free_vmemmap", early_hugetlb_free_vmemmap_param);
> >   */
> >  static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
> >  {
> > +     /*
> > +      * This check aims to let the compiler help us optimize the code as
> > +      * much as possible.
> > +      */
> > +     if (!is_power_of_2(sizeof(struct page)))
> > +             return 0;
> >       return h->nr_free_vmemmap_pages;
> >  }
> >
> > @@ -280,6 +286,13 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
> >       BUILD_BUG_ON(NR_USED_SUBPAGE >=
> >                    RESERVE_VMEMMAP_SIZE / sizeof(struct page));
> >
> > +     /*
> > +      * The compiler can help us to optimize this function to null
> > +      * when the size of the struct page is not power of 2.
> > +      */
> > +     if (!is_power_of_2(sizeof(struct page)))
> > +             return;
> > +
> >       if (!hugetlb_free_vmemmap_enabled)
> >               return;
> >
> > --
> > 2.11.0
> >
> >
>
> --
> Oscar Salvador
> SUSE L3
