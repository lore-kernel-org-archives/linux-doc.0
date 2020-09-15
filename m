Return-Path: <SRS0=ug/q=CY=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196C2C43461
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3F3D21D43
	for <linux-doc@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="wJA7qJJa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgIORfq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Sep 2020 13:35:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727559AbgIORdW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Sep 2020 13:33:22 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9852AC06178A
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 10:33:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id bd2so1711607plb.7
        for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2020 10:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M8l6c/TjWYQRiXwPIxqfhPqbNDCVlwzZu6ART7sGA8U=;
        b=wJA7qJJabH1MtZuv73Nto4ArpYL8bpMpf3xBzAkp/k8HKbnVO+qNgBxVpGr0Fz0Ggd
         KUH/bdakO5dHORUiBJWUEiCC3O57yGwfrShO2YsEYl8X8n7zw4Tx3s+Cd5uEnn03KBrx
         iW+qRGl4cXUKUBcnQ3rqhtGNr7wgb44cq83D4pqDmM31tCIBVppOTUNzZ0uRaUuWN+Yd
         UvkfdyVoGzjnJ5jnEHZulu8IBOnYzM0iIZoCSFxiftDvpraX/xRihGAzgEbajBkm1CAo
         ZG+nTnkW1iTOo8PBTTwFv/WO0iuy9ZWcRS6qv6eUtgmLjjAJnAy5zwyE8a4nYq6ANJD/
         +4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M8l6c/TjWYQRiXwPIxqfhPqbNDCVlwzZu6ART7sGA8U=;
        b=rL37PzPTkWD0yKVvLTFeqAYj9dKw0pZvuW7me496LwFaTdnK+GyRrAOLE3YqDbTEEh
         KjHP4j6Ced99JxoTicT3VpGhTIZjOBV5PaQEXf1Xzt3BLS61SVboN7fxmW3YE4kH8dFq
         MTmzd4jpUM7pDyRkUo3kwOBsr8/6OBwkjyDgBUMIT8NXylOuvoU+41I7jjq2qvxTdaJQ
         V9mb9ZWWD9YY7FgCj7OJ5xbyo7fl7cLVPMbk6q3ZgUoeWuvOsUfGUclOwhqiuqj5WdcF
         0yYoPUlHnxovyqg6OOQ4eb0Ba3DUZWHN6Agn6Bpu9FECF7o35w7Wjw93P+NKxCbFHjx4
         YElg==
X-Gm-Message-State: AOAM5336Z13CHEK8cu5LjdGRhq6o18Mgjb9Ug15VT+R89NKXvlwevk0t
        ZCdHdXnHjH0e4eb5gmfwPHymGK25p+gN1eznhkrhcA==
X-Google-Smtp-Source: ABdhPJxdqveluwOFObD/Q2IeyCwgxfBsJ6CnsJl5rU2wrD26p6QqzakCfSftmjvTx3O57U4UaQflQENKIp65BvUQEN4=
X-Received: by 2002:a17:90a:fa94:: with SMTP id cu20mr388035pjb.147.1600191202144;
 Tue, 15 Sep 2020 10:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200915125947.26204-1-songmuchun@bytedance.com>
 <20200915143241.GH5449@casper.infradead.org> <CAMZfGtW0PqU6SLihLABA8rU+FuBqm8NksDW=EkLXy1RZfYeDGA@mail.gmail.com>
 <20200915154213.GI5449@casper.infradead.org>
In-Reply-To: <20200915154213.GI5449@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 16 Sep 2020 01:32:46 +0800
Message-ID: <CAMZfGtVTjopGgFv4xCDcF1+iGeRva_ypH4EQWcDUFBdsfqhQbA@mail.gmail.com>
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

On Tue, Sep 15, 2020 at 11:42 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Sep 15, 2020 at 11:28:01PM +0800, Muchun Song wrote:
> > On Tue, Sep 15, 2020 at 10:32 PM Matthew Wilcox <willy@infradead.org> wrote:
> > >
> > > On Tue, Sep 15, 2020 at 08:59:23PM +0800, Muchun Song wrote:
> > > > This patch series will free some vmemmap pages(struct page structures)
> > > > associated with each hugetlbpage when preallocated to save memory.
> > >
> > > It would be lovely to be able to do this.  Unfortunately, it's completely
> > > impossible right now.  Consider, for example, get_user_pages() called
> > > on the fifth page of a hugetlb page.
> >
> > Can you elaborate on the problem? Thanks so much.
>
> OK, let's say you want to do a 2kB I/O to offset 0x5000 of a 2MB page
> on a 4kB base page system.  Today, that results in a bio_vec containing
> {head+5, 0, 0x800}.  Then we call page_to_phys() on that (head+5) struct
> page to get the physical address of the I/O, and we turn it into a struct
> scatterlist, which similarly has a reference to the page (head+5).

As I know, in this case, the get_user_pages() will get a reference
to the head page (head+0) before returning such that the hugetlb
page can not be freed. Although get_user_pages() returns the
page (head+5) and the scatterlist has a reference to the page
(head+5), this patch series can handle this situation. I can not
figure out where the problem is. What I missed? Thanks.

>
> If you're returning page (head+1) from get_user_pages(), all the
> calculations will be wrong and you'll do DMA to the wrong address.
>
> What needs to happen is a conversion to get_user_bvecs().  That way we
> can return a bvec which is {head, 0x5000, 0x800} and the calculations
> will work.  So that's going to involve touching a lot of device drivers.
> Christoph has a start on it here:
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/gup-bvec
>
> Overlapping with that is a desire to change the biovec so that it
> only stores {phys_addr, length} rather than {page, offset, length}.
> We're also going to have to rework the scatterlist so that it doesn't
> carry a struct page either.



-- 
Yours,
Muchun
