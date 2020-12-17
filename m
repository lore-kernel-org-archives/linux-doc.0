Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C271C2BB48
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 06:55:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0808923603
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 06:55:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgLQGz1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 01:55:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725950AbgLQGz1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 01:55:27 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD9CC061794
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 22:54:47 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id v1so3121443pjr.2
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 22:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYkx9ybV2ueAWfRQVHDx3D5vcB/QAf7LUwizku++lx4=;
        b=R0gTUZ/+FhatN0Ola7XCwP06109oq3LSjiDLx745S1G4yZuUoGIKOIdEOfFNnMrxQe
         jIu36Ii/UWnyJrMJwV8/Cb8hef91r3E4XiUWyVhOZdHJOl5WdnKDs8fwvjq2wIihNj7Y
         Rx951XBU/s4mHFmnPyHjCFleq1NoZJ+xgzlJHgnpP9RF6X/OPreeu3W+YELbsOnRgC3X
         AUrlEEHRed6m+LTcbfmVz9akeJA9Cw8r0C/iJC1Wd3K4jjIkwHQvgz1GoMPzQBj41d8U
         rmisL0fl/QSjgMo8J1g3wDk6vnaRmE7v/rxG7ZQUtxbQYK7zW7Wpgf7WTQmeJdzhvWa8
         5RmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYkx9ybV2ueAWfRQVHDx3D5vcB/QAf7LUwizku++lx4=;
        b=qBiUiBhGuX5zclrxanW19Nzv/qQHtTaXoBt7g47TO2kROBc0c2BsyPIDaNHH1Xp1sK
         OFpo1d3yBdEeSHrFsv6Q2/WSPLut0CCPsQxeZ6LY1aS/E4LbWL97eWE6sF3Q1Igd5EjE
         Rb4sgGQe5L2b2RmZWNFmeqQscvn4NaR2lcvaXCCEQnw1eazZX7MBX9XvPpVF1nuPJQdg
         xTHuAlYIeTR2CSL90151cUIWaD/2YBtIGOx+NOyCZFeaNbmjCVCVlCUgqTJPKM7KtVef
         sQu4IwCbdLvEHn3st/ubbneCng21zaDkyID3Kdg2Nq5wY3+sfqxcRCECZGWVxOD+ILCa
         QQPg==
X-Gm-Message-State: AOAM533ySXmTix0nWSeZGbBLP+YWSZl1Ar4rwUCffIwwpQEvsmL5PPLv
        3xr83V01tXBht6OC15q38rqlMbW8PX6noDTetyraYw==
X-Google-Smtp-Source: ABdhPJxIo3Bkh6if9eAbNjiecVSukBNUK6FsdvhRNKiiTT/IlqPDPu9KgseS7K+gDKV5spUiE1CR0WiMXQaInL/1jZE=
X-Received: by 2002:a17:902:8503:b029:dc:44f:62d8 with SMTP id
 bj3-20020a1709028503b02900dc044f62d8mr13771103plb.34.1608188086569; Wed, 16
 Dec 2020 22:54:46 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-4-songmuchun@bytedance.com> <5936a766-505a-eab0-42a6-59aab2585880@oracle.com>
 <20201216222549.GC3207@localhost.localdomain> <49f6a0f1-c6fa-4642-2db0-69f090e8a392@oracle.com>
In-Reply-To: <49f6a0f1-c6fa-4642-2db0-69f090e8a392@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 17 Dec 2020 14:54:10 +0800
Message-ID: <CAMZfGtXwU7LcTZw7iKFNksVTYx8Bhd=9Nct+zfNy_ibuFiF6ew@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 03/11] mm/hugetlb: Free the vmemmap
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 6:52 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 12/16/20 2:25 PM, Oscar Salvador wrote:
> > On Wed, Dec 16, 2020 at 02:08:30PM -0800, Mike Kravetz wrote:
> >>> + * vmemmap_rmap_walk - walk vmemmap page table
> >>> +
> >>> +static void vmemmap_pte_range(pmd_t *pmd, unsigned long addr,
> >>> +                         unsigned long end, struct vmemmap_rmap_walk *walk)
> >>> +{
> >>> +   pte_t *pte;
> >>> +
> >>> +   pte = pte_offset_kernel(pmd, addr);
> >>> +   do {
> >>> +           BUG_ON(pte_none(*pte));
> >>> +
> >>> +           if (!walk->reuse)
> >>> +                   walk->reuse = pte_page(pte[VMEMMAP_TAIL_PAGE_REUSE]);
> >>
> >> It may be just me, but I don't like the pte[-1] here.  It certainly does work
> >> as designed because we want to remap all pages in the range to the page before
> >> the range (at offset -1).  But, we do not really validate this 'reuse' page.
> >> There is the BUG_ON(pte_none(*pte)) as a sanity check, but we do nothing similar
> >> for pte[-1].  Based on the usage for HugeTLB pages, we can be confident that
> >> pte[-1] is actually a pte.  In discussions with Oscar, you mentioned another
> >> possible use for these routines.
> >
> > Without giving it much of a thought, I guess we could duplicate the
> > BUG_ON for the pte outside the loop, and add a new one for pte[-1].
> > Also, since walk->reuse seems to not change once it is set, we can take
> > it outside the loop? e.g:
> >
> >       pte *pte;
> >
> >       pte = pte_offset_kernel(pmd, addr);
> >       BUG_ON(pte_none(*pte));
> >       BUG_ON(pte_none(pte[VMEMMAP_TAIL_PAGE_REUSE]));
> >       walk->reuse = pte_page(pte[VMEMMAP_TAIL_PAGE_REUSE]);
> >       do {
> >               ....
> >       } while...
> >
> > Or I am not sure whether we want to keep it inside the loop in case
> > future cases change walk->reuse during the operation.
> > But to be honest, I do not think it is realistic of all future possible
> > uses of this, so I would rather keep it simple for now.
>
> I was thinking about possibly passing the 'reuse' address as another parameter
> to vmemmap_remap_reuse().  We could add this addr to the vmemmap_rmap_walk
> struct and set walk->reuse when we get to the pte for that address.  Of
> course this would imply that the addr would need to be part of the range.

Maybe adding another one parameter is unnecessary.  How about doing
this in the vmemmap_remap_reuse?

The 'reuse' address just is start + PAGE_SIZE.

void vmemmap_remap_free(unsigned long start, unsigned long size)
{
         unsigned long end = start + size;
         unsigned long reuse_addr = start + PAGE_SIZE;
         LIST_HEAD(vmemmap_pages);

         struct vmemmap_remap_walk walk = {
                  .remap_pte = vmemmap_remap_pte,
                  .vmemmap_pages = &vmemmap_pages,
                  .reuse_addr = reuse_addr.
         };

}

>
> Ideally, we would walk the page table to get to the reuse page.  My concern
> was not explicitly about adding the BUG_ON.  In more general use, *pte could
> be the first entry on a pte page.  And, then pte[-1] may not even be a pte.
>
> Again, I don't think this matters for the current HugeTLB use case.  Just a
> little concerned if code is put to use for other purposes.
> --
> Mike Kravetz



-- 
Yours,
Muchun
