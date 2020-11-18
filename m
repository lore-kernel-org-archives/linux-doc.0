Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE05C5519F
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 02:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA747221FD
	for <linux-doc@archiver.kernel.org>; Wed, 18 Nov 2020 02:44:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="bbch85dd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgKRCnw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 21:43:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726397AbgKRCnw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 21:43:52 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99072C0613D4
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 18:43:50 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id m9so176707pgb.4
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 18:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cIZ+YWWP5aqalUoRio2QtJMh5XCbXXDA9kJRwC7+zv8=;
        b=bbch85ddNZ7XzpLUOYzExmTsbmLKMUrE9yX+1sYtLTuQIw8ozlyrK0AUfruD2uMB8P
         6FNZterRPoL/JxxCQOE66gZrVVt84KUGv3FnJx3SDvodbBi6iowaXhCLd2TA5DOMSGe0
         SRjy4IuV5OTslaeKmbzNIBAIPNtEt56wYcPKmVdWyiYt8CJHgfVPWHmSHxAkIWO4apO4
         qTmvP8l8gWp7CKIOdxDrhM2uWcMO4rKs9rRpPQFiEbYc0Ei/qlaJeWdKQTN6s1ppRauD
         /PioS9bT+LFuJ5NT2IoOvE18sAWFzx3ej5zoGL2Ax7RG5rNSntedlGRaoxDAHdUinMyW
         M+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cIZ+YWWP5aqalUoRio2QtJMh5XCbXXDA9kJRwC7+zv8=;
        b=ucFbTdBEChffsbmEQfAGlrln5xbWOyc0+xGyce5z2/rdSqfk6Mo0eKum1t68AeOP28
         klMm9HftgUcAE3ky/Ee7cF6RcKKa72TJrfDuS6A5NqSV39wn/NaP4BxXQre/O7Z1LTPa
         ri+QV1bLaa2bqMXnFNIdydsr/GkibRl30SOsKZZJH3fe6mhlHxeE9pA0z6y4/EZYp+qe
         yfKGOepOfJrcG3cohau52mAeA946GrSmCtWAYz9PjRXcRHpV2GH4PGKngSDk06rZptUI
         OYB1I7L2Hf/yPourCK4ke5e2UcZzEljpUh2iWgzQD3Aeh6WztWBbQpHAro+XOQrzuhZA
         HzUQ==
X-Gm-Message-State: AOAM531hzH5D+PLIy0NWzco+m/Mu50GfwGUCtJmA7hacYeKsYBWoXfzf
        9RDqQ3j1HpJUb39w2UhTl55VomP3udUqcdJavFKRhm7mBpBe6tce
X-Google-Smtp-Source: ABdhPJxGDISMqn2bIRZh7wORdl/cIXS0Q2etgc5JYSCpx/B0Jr1Wza3ya52gTSkwn/Ea57CTkeoqexeqyVXu0Ud+DQE=
X-Received: by 2002:a62:16c1:0:b029:18c:8a64:fc04 with SMTP id
 184-20020a6216c10000b029018c8a64fc04mr2397649pfw.59.1605667430141; Tue, 17
 Nov 2020 18:43:50 -0800 (PST)
MIME-Version: 1.0
References: <20201113105952.11638-1-songmuchun@bytedance.com>
 <349168819c1249d4bceea26597760b0a@hisilicon.com> <CAMZfGtUVDJ4QHYRCKnPTkgcKGJ38s2aOOktH+8Urz7oiVfimww@mail.gmail.com>
 <714ae7d701d446259ab269f14a030fe9@hisilicon.com> <CAMZfGtWNa=abZdN6HmWE1VBFHfGCbsW9D0zrN-F5zrhn6s=ErA@mail.gmail.com>
 <20201117192223.GW29991@casper.infradead.org>
In-Reply-To: <20201117192223.GW29991@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 18 Nov 2020 10:43:06 +0800
Message-ID: <CAMZfGtUsqkk1Td3YBb-Ap6M_Hg59te1uORCPLVk4QeaFt7U0cw@mail.gmail.com>
Subject: Re: [External] RE: [PATCH v4 00/21] Free some vmemmap pages of
 hugetlb page
To:     Matthew Wilcox <willy@infradead.org>
Cc:     "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>, "x86@kernel.org" <x86@kernel.org>,
        "hpa@zytor.com" <hpa@zytor.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "luto@kernel.org" <luto@kernel.org>,
        "peterz@infradead.org" <peterz@infradead.org>,
        "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "paulmck@kernel.org" <paulmck@kernel.org>,
        "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>,
        "pawan.kumar.gupta@linux.intel.com" 
        <pawan.kumar.gupta@linux.intel.com>,
        "rdunlap@infradead.org" <rdunlap@infradead.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "anshuman.khandual@arm.com" <anshuman.khandual@arm.com>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "almasrymina@google.com" <almasrymina@google.com>,
        "rientjes@google.com" <rientjes@google.com>,
        "osalvador@suse.de" <osalvador@suse.de>,
        "mhocko@suse.com" <mhocko@suse.com>,
        "duanxiongchun@bytedance.com" <duanxiongchun@bytedance.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 18, 2020 at 3:22 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Nov 18, 2020 at 12:29:07AM +0800, Muchun Song wrote:
> > > ideally, we should be able to free PageTail if we change struct page in some way.
> > > Then we will save much more for 2MB hugetlb. but it seems it is not easy.
> >
> > Now for the 2MB HugrTLB page, we only free 6 vmemmap pages.
> > But your words woke me up. Maybe we really can free 7 vmemmap
> > pages. In this case, we can see 8 of the 512 struct page structures
> > has beed set PG_head flag. If we can adjust compound_head()
> > slightly and make compound_head() return the real head struct
> > page when the parameter is the tail struct page but with PG_head
> > flag set. I will start an investigation and a test.
>
> What are you thinking?
>
> static inline struct page *compound_head(struct page *page)
> {
>         unsigned long head = READ_ONCE(page->compound_head);
>
>         if (unlikely(head & 1))
>                 return (struct page *) (head - 1);
> +       if (unlikely(page->flags & PG_head))
> +               return (struct page *)(page[1]->compound_head - 1)

Yeah, I think so too. Maybe adding an align check is better.

+         if ((test_bit(PG_head, &page->flags) &&
+              IS_ALIGNED((unsigned long)page, PAGE_SIZE))

>         return page;
> }
>
> ... because if it's that, there are code paths which also just test
> PageHead, and so we'd actually need to change PageHead to be something
> like:

Yeah, I also think that rework compound_head() and PageHead() is enough.

Thanks.

>
> static inline bool PageHead(struct page *page)
> {
>         return (page->flags & PG_head) &&
>                 (page[1]->compound_head == (unsigned long)page + 1);
> }
>
> I'm not sure if that's worth doing -- there may be other things I
> haven't thought of.



-- 
Yours,
Muchun
