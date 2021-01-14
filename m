Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEB8C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 10:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CD51923A50
	for <linux-doc@archiver.kernel.org>; Thu, 14 Jan 2021 10:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbhANKzy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Jan 2021 05:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726055AbhANKzx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Jan 2021 05:55:53 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8061C061575
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 02:55:11 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id 30so3525905pgr.6
        for <linux-doc@vger.kernel.org>; Thu, 14 Jan 2021 02:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BwMXHMt7GhzgcE2VNYydc3q3ayy6zmEsW948qf9k0OE=;
        b=XZONOtAXDDegjmVfiwAn9DskCEZKXL4FJwWxIA0x3CLQRYTcRAfvIy2YR/Eg6JNzBw
         1noKWDAeMBjz9R87DFFOEMpASVaDuf3MhYFq6OnQcW9lCLUGGsPRiy85RsckggMIA0r4
         eaJmjcesWQX1Iy02RpWLbufYnD0AJqa4lDemG7adypu/zu1Xs+bYthcrzaaHQ6Y88y9r
         PNAwHPkGl7wR/cOmQpeh5wGFz8KnnS6zl20j8idkDwPGejrehfxdiC0q1hPNOt9z7aKS
         MUfqlCSUO63et1m7RVXdeqhpD0R2GNugEUzaX63X+yE2zlKTosJQv0nec77fGXCxKmP8
         A65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BwMXHMt7GhzgcE2VNYydc3q3ayy6zmEsW948qf9k0OE=;
        b=JNhOQ0O53gzcR+K+rLgqwEEWDObBVl7T00EUewGwBGxvDknwqQduK4dPKgVijSBFmI
         GPuXN1WAWEmOX2FndqwS0ESi5VL7FeAIAv0WV53CS5SL91BIDz4mLgp059LKLzKZTXnu
         nKPSlZHoId+rfF039nMtScXNkiwDFQD92VNYmQndKow6DBZtka+DIlttyuofwtPKzDS5
         VG5uKuhAoUyuj/FAvU3BQZ1KNzhbqz8eLLxfnprP8nKGkeFHuORjHBhuU+jPCapcBGYH
         Zy6F1Ub7YlLMA3ZVjvJdrstyfxmw+CNEfxrp29IdkCICIjKBDUU/pHvcYjpVtYy/Cee9
         x/Kg==
X-Gm-Message-State: AOAM532/HZirSemIaSrE3cfuA1qeSCTRBBUsZ8H/LJ6AyUyp0A6Z5YH9
        5mNH3ivhBwSMuk/JAjkKun4QCrJpPU1kobpceU2YKQ==
X-Google-Smtp-Source: ABdhPJwAXaQYvHyFORw2v2RQzVwh0nIznbb7WHGX2ESFOUPhSYnlg3ysGgcXfCtYITBX4lkDn64KXJZwFtfvowMAzAo=
X-Received: by 2002:a63:480f:: with SMTP id v15mr6910119pga.341.1610621711342;
 Thu, 14 Jan 2021 02:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20210106141931.73931-1-songmuchun@bytedance.com>
 <20210106141931.73931-5-songmuchun@bytedance.com> <20210112080453.GA10895@linux>
 <CAMZfGtUqN2BZH28i9VJhRJ3VH3OGKBQ7hDUuX1-F5LcwbKk+4A@mail.gmail.com>
 <20210113092028.GB24816@linux> <a9baf18c-22c7-4946-9778-678f6bc808dc@oracle.com>
In-Reply-To: <a9baf18c-22c7-4946-9778-678f6bc808dc@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 14 Jan 2021 18:54:30 +0800
Message-ID: <CAMZfGtUhhMDCaZKeayS1+w0MvBijDZC2AiUV4z5rUFrfbXBefw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v12 04/13] mm/hugetlb: Free the vmemmap
 pages associated with each HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>,
        Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
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

On Thu, Jan 14, 2021 at 7:27 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 1/13/21 1:20 AM, Oscar Salvador wrote:
> > On Tue, Jan 12, 2021 at 07:33:33PM +0800, Muchun Song wrote:
> >>> It seems a bit odd to only pass "start" for the BUG_ON.
> >>> Also, I kind of dislike the "addr += PAGE_SIZE" in vmemmap_pte_range.
> >>>
> >>> I wonder if adding a ".remap_start_addr" would make more sense.
> >>> And adding it here with the vmemmap_remap_walk init.
> >>
> >> How about introducing a new function which aims to get the reuse
> >> page? In this case, we can drop the BUG_ON() and "addr += PAGE_SIZE"
> >> which is in vmemmap_pte_range. The vmemmap_remap_range only
> >> does the remapping.
> >
> > How would that look?
> > It might be good, dunno, but the point is, we should try to make the rules as
> > simple as possible, dropping weird assumptions.
> >
> > Callers of vmemmap_remap_free should know three things:
> >
> > - Range to be remapped
> > - Addr to remap to
> > - Current implemantion needs addr to be remap to to be part of the complete
> >   range
> >
> > right?
>
> And, current implementation needs must have remap addr be the first in the
> complete range.  This is just because of the way the page tables are walked
> for remapping.  The remap/reuse page must be found first so that the following
> pages can be remapped to it.

You are right.

>
> That implementation seems to be the 'most efficient' for hugetlb pages where
> we want vmemmap pages n+3 and beyond mapped to n+2.
>
> In a more general purpose vmemmap_remap_free implementation, the reuse/remap
> address would not necessarily need to be related to the range.  However, this
> would require a separate page table walk/validation for the reuse address
> independent of the range.  This may be what Muchun was proposing for 'a new
> function which aims to get the reuse page'.

Agree.


>
> IMO, the decision on how to implement depends on the intended use case.
> - If this is going to be hugetlb only (or perhaps generic huge page only)
>   functionality, then I am OK with an efficient implementation that has
>   some restrictions.
> - If we see this being used for more general purpose remapping, then we
>   should go with a more general purpose implementation.

I think this approach may be only suitable for generic huge page only.
So we can implement it only for huge page.

Hi Oscar,

What's your opinion about this?

>
> Again, just my opinion.
> --
> Mike Kravetz
