Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B25CC2D0E4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 06:18:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E08ED246AD
	for <linux-doc@archiver.kernel.org>; Thu, 19 Nov 2020 06:18:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="SlQ9yXcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgKSGSB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Nov 2020 01:18:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725799AbgKSGSB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Nov 2020 01:18:01 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CF5C0613D4
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 22:18:01 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id w6so3473809pfu.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2020 22:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7pQ2zj7Jlr1PXAZIscOwv68xrKkz77uBgfi3u8q3/iE=;
        b=SlQ9yXcPGWcqpNgsvUA5elpHwLWom+AQYZiYOdSgGaRs4scyCqq6tE/AKEJ5uZ5b81
         lF/hyH+57tlZdv2coRV+X45arqUqjkR0aAKl7EvCtUTrgZP+Uzms/5sBiY3pTURzH+NC
         6Jq2WJzC83rdSI2D2P+t4I2rC91XAWEmdYYGuaTMprvtZR9RngYuSZDfDBvCIalkaajC
         YNIP91xlct/SLzjaBBdRAp3jZjyj7Tb1pv7IN8kaOASxqS7Gh8Z/TBedIdlo1Q/pY6JQ
         cWKq1j2A4i2DOxMN3dAlM7OXOublT36ylMrsTYwjHxLJk5ZpCUi0cAvL165vdMl/2bDy
         oXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7pQ2zj7Jlr1PXAZIscOwv68xrKkz77uBgfi3u8q3/iE=;
        b=oEXPgeUiP/Sg3G1cQFXAttYBiMacLB1+4M3LnPE1Xuxoqs4s5XjN+VJpTf5nI2U5Aw
         ZxRzckHXNA+mXM1SAvyPvSSH4PqcW+TELLZ9ufHkqipZHPz1XD30xKOy1z3uA0DfBlbG
         46CzTHO8CIlkZZYv5BydlY3bIaQL13wOfTI9E6F1197PrBd5Ynu9p3DKGlEccIWcIson
         2dUCIXmo21h9t+9Ezi0PBtJlWaMzXqaNK3wna0Raf65YiI3v8/0eB7RaiOyA+QeKiGPt
         8McI9EpcuAMmJWf86EZs5d3raBndq0KTzf8PNM1owgQtDTWIs4d+JHVV9okFwVKLL9ok
         6REQ==
X-Gm-Message-State: AOAM5302ZBVW65whfMvUWAAL1GKlOF+Xr0P147DV2ivZOuuZ/N2G3dLf
        t84rGDeCqpyPw2oDI6xYSKr0dHSUDP8tp2JbNcfm3Q==
X-Google-Smtp-Source: ABdhPJzMCPjAh/2kqnjwOxyzOIsWkWSrhvfMsYkNgJM3IRKRm7eO5+zvHPlxtMjOwCYAaHDaqSWr4Tkcrzo6Lbmbiss=
X-Received: by 2002:a17:90b:88b:: with SMTP id bj11mr2853956pjb.229.1605766680507;
 Wed, 18 Nov 2020 22:18:00 -0800 (PST)
MIME-Version: 1.0
References: <20201113105952.11638-1-songmuchun@bytedance.com>
 <20201113105952.11638-6-songmuchun@bytedance.com> <20201117150604.GA15679@linux>
In-Reply-To: <20201117150604.GA15679@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 19 Nov 2020 14:17:21 +0800
Message-ID: <CAMZfGtW=Oyaoooow9_i+R1LkvGpcFoUjBxYzGqBZsOa-t-sFsg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4 05/21] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
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

On Tue, Nov 17, 2020 at 11:06 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Fri, Nov 13, 2020 at 06:59:36PM +0800, Muchun Song wrote:
> > +#define page_huge_pte(page)          ((page)->pmd_huge_pte)
>
> Seems you do not need this one anymore.
>
> > +void vmemmap_pgtable_free(struct page *page)
> > +{
> > +     struct page *pte_page, *t_page;
> > +
> > +     list_for_each_entry_safe(pte_page, t_page, &page->lru, lru) {
> > +             list_del(&pte_page->lru);
> > +             pte_free_kernel(&init_mm, page_to_virt(pte_page));
> > +     }
> > +}
> > +
> > +int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
> > +{
> > +     unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
> > +
> > +     /* Store preallocated pages on huge page lru list */
> > +     INIT_LIST_HEAD(&page->lru);
> > +
> > +     while (nr--) {
> > +             pte_t *pte_p;
> > +
> > +             pte_p = pte_alloc_one_kernel(&init_mm);
> > +             if (!pte_p)
> > +                     goto out;
> > +             list_add(&virt_to_page(pte_p)->lru, &page->lru);
> > +     }
>
> Definetely this looks better and easier to handle.
> Btw, did you explore Matthew's hint about instead of allocating a new page,
> using one of the ones you are going to free to store the ptes?
> I am not sure whether it is feasible at all though.

Hi Oscar and Matthew,

I have started an investigation about this. Finally, I think that it
may not be feasible. If we use a vmemmap page frame as a
page table when we split the PMD table firstly, in this stage,
we need to set 512 pte entry to the vmemmap page frame. If
someone reads the tail struct page struct of the HugeTLB,
it can get the arbitrary value (I am not sure it actually exists,
maybe the memory compaction module can do this). So on
the safe side, I think that allocating a new page is a good
choice.

Thanks.

>
>
> > --- a/mm/hugetlb_vmemmap.h
> > +++ b/mm/hugetlb_vmemmap.h
> > @@ -9,12 +9,24 @@
> >  #ifndef _LINUX_HUGETLB_VMEMMAP_H
> >  #define _LINUX_HUGETLB_VMEMMAP_H
> >  #include <linux/hugetlb.h>
> > +#include <linux/mm.h>
>
> why do we need this here?
>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
