Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E89C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 02:45:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3BA8206B7
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 02:45:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="TFqZS2R0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726159AbgIPCpl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 22:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726079AbgIPCpk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 22:45:40 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB990C06174A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 19:45:40 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id s14so794029pju.1
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 19:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MjF3+x9EzhdvpwkfgHNm6fCxJhsYfijrbsp5nTW4btk=;
        b=TFqZS2R0m222F1PpstUQjgnssD8KBxBq2UnQoK3XNMEmgo0GqrqYy3UNc2QomqCL9Q
         Rjq/gjGSG4To7GIWcl0a2bVvh9mfyPtGSbVCIhOhQtD7UcCj5bFs1QwTUi91XMCGn0ot
         XzIM3CObSqg+igz1rE6hW7FGStNFpCaJ95bvJsBc0BVGPusEXNuPKZPE1HQcpsJ4W4kV
         b1ZhDwshZNkc33IR9x+8x2ofAPlhCCpraHAybRO0zIULfY95TxBEeIMexHPn2sg8s8Kb
         oGmo4RnB9ACv51S04r6v+rrx1nHJO2xn496ATeQGorVZKphQgOUu4i8FMsSmOvot/8dF
         QoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MjF3+x9EzhdvpwkfgHNm6fCxJhsYfijrbsp5nTW4btk=;
        b=twboQXGIh8eIbEgaf7+MaTdUZiV/Lyi1xBdOZ2DM0xKCPOh4YC5Qfg3wLMsQHHf19n
         KfBPkYUDSsXmX79ozYh48JDy9ZMju+sOyIUsVqIoDq0ch6xYqQSq+UtwDGcb/Tz1Q/pV
         hJm2rYQ167G8zONPquExznz+NAcBHP3PG/4RbQtwvrcxPXVz3S0srzHp5v4o4LxMnSjU
         RIGVJn4hE6LuZ0be6X4Ralv2USIRgSpb8b2FXJqP8pPTe3aJde+HVzkKenCeg/TPQmig
         hMD3z+TPRfv9PuLu5PBFt25zc0k4TC+gZcN3YiCIZSZnqPszYs6RR84VCI7X6vId8GVf
         fBgA==
X-Gm-Message-State: AOAM531INVO60acyW2ZgXoNKSuBGj1Ny39v07U+pbt20s0YgSYTlDfn+
        7o0nMkw3C6N8BfzQCkR8SXCBtApSlJwVlxKix8v+2Q==
X-Google-Smtp-Source: ABdhPJwQUmoHrkkKHxHWVxGeTnBYi6Mtj+lxHnZr+5S36ywWnha+P6KyFwM7kKSQXksZzvU9GeSjckV2Af7XxXPxkl0=
X-Received: by 2002:a17:902:aa4b:b029:d0:cbe1:e739 with SMTP id
 c11-20020a170902aa4bb02900d0cbe1e739mr22798393plr.20.1600224339980; Tue, 15
 Sep 2020 19:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125947.26204-1-songmuchun@bytedance.com>
 <20200915143241.GH5449@casper.infradead.org> <CAMZfGtW0PqU6SLihLABA8rU+FuBqm8NksDW=EkLXy1RZfYeDGA@mail.gmail.com>
 <20200915154213.GI5449@casper.infradead.org> <CAMZfGtVTjopGgFv4xCDcF1+iGeRva_ypH4EQWcDUFBdsfqhQbA@mail.gmail.com>
 <20200915173948.GK5449@casper.infradead.org> <CAMZfGtW3S8kGJwff6oH14QWPXKTuQEAGdYwcLRUZxuJ7q8s7sA@mail.gmail.com>
 <20200915181530.GL5449@casper.infradead.org>
In-Reply-To: <20200915181530.GL5449@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 16 Sep 2020 10:45:04 +0800
Message-ID: <CAMZfGtX1T6K5d=z6vPXtwnsDE70uEVRi9a3rADiXrdHr8_ri9Q@mail.gmail.com>
Subject: Re: [External] Re: [RFC PATCH 00/24] mm/hugetlb: Free some vmemmap
 pages of hugetlb page
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
        anshuman.khandual@arm.com, jroedel@suse.de, almasrymina@google.com,
        David Rientjes <rientjes@google.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 16, 2020 at 2:15 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Sep 16, 2020 at 02:03:15AM +0800, Muchun Song wrote:
> > On Wed, Sep 16, 2020 at 1:39 AM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Wed, Sep 16, 2020 at 01:32:46AM +0800, Muchun Song wrote:
> > > > On Tue, Sep 15, 2020 at 11:42 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > > >
> > > > > On Tue, Sep 15, 2020 at 11:28:01PM +0800, Muchun Song wrote:
> > > > > > On Tue, Sep 15, 2020 at 10:32 PM Matthew Wilcox <willy@infradead.org> wrote:
> > > > > > >
> > > > > > > On Tue, Sep 15, 2020 at 08:59:23PM +0800, Muchun Song wrote:
> > > > > > > > This patch series will free some vmemmap pages(struct page structures)
> > > > > > > > associated with each hugetlbpage when preallocated to save memory.
> > > > > > >
> > > > > > > It would be lovely to be able to do this.  Unfortunately, it's completely
> > > > > > > impossible right now.  Consider, for example, get_user_pages() called
> > > > > > > on the fifth page of a hugetlb page.
> > > > > >
> > > > > > Can you elaborate on the problem? Thanks so much.
> > > > >
> > > > > OK, let's say you want to do a 2kB I/O to offset 0x5000 of a 2MB page
> > > > > on a 4kB base page system.  Today, that results in a bio_vec containing
> > > > > {head+5, 0, 0x800}.  Then we call page_to_phys() on that (head+5) struct
> > > > > page to get the physical address of the I/O, and we turn it into a struct
> > > > > scatterlist, which similarly has a reference to the page (head+5).
> > > >
> > > > As I know, in this case, the get_user_pages() will get a reference
> > > > to the head page (head+0) before returning such that the hugetlb
> > > > page can not be freed. Although get_user_pages() returns the
> > > > page (head+5) and the scatterlist has a reference to the page
> > > > (head+5), this patch series can handle this situation. I can not
> > > > figure out where the problem is. What I missed? Thanks.
> > >
> > > You freed pages 4-511 from the vmemmap so they could be used for
> > > something else.  Page 5 isn't there any more.  So if you return head+5,
> > > then when we complete the I/O, we'll look for the compound_head() of
> > > head+5 and we won't find head.
> >
> > We do not free pages 4-511 from the vmemmap. Actually, we only
> > free pages 128-511 from the vmemmap.
> >
> > The 512 struct pages occupy 8 pages of physical memory. We only
> > free 6 physical page frames to the buddy. But we will create a new
> > mapping just like below. The virtual address of the freed pages will
> > remap to the second page frame. So the second page frame is
> > reused.
>
> Oh!  I get what you're doing now.
>
> For the vmemmap case, you free the last N-2 physical pages but map the
> second physical page multiple times.  So for the 512 pages case, we
> see pages:
>
> abcdefgh | ijklmnop | ijklmnop | ijklmnop | ijklmnop | ijklmnop | ijklmnop ...

Yeah, great. You are right.

>
> Huh.  I think that might work, except for PageHWPoison.  I'll go back
> to your patch series and look at that some more.
>

The PageHWPoison also is considered in the patch series. Looking
forward to your suggestions. Thanks.


-- 
Yours,
Muchun
