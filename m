Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9358FC4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 12:33:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 584B823B26
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 12:33:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgLJMdX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Dec 2020 07:33:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbgLJMdX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Dec 2020 07:33:23 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D73C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 04:32:43 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id 131so3920739pfb.9
        for <linux-doc@vger.kernel.org>; Thu, 10 Dec 2020 04:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l2j9oJVLdw2ETVRjvlsUKZFYNsqLIEckkbStxyUbG4c=;
        b=Cf6GkzyVICZ2r+cphcXwh9MH72pN7NwUnmwu484SPDfOCSkIX7b16iRZS+XGbb0J9V
         ogHDXhnYLhGBT0lXSBZjMp/7JnxpPxncVqbvvGDSe2Yt7XZPb2/XdTar+rZ9E2dmC9gS
         fQH4+CLKK5F3vRAi+ixzmAIpBewwZZwKxPJom1P5o15wG7DUVUire3Az2R1rppKXtouM
         GO8fBMD+6tkECDO2+6w4HSxn705fER+7axAKl50N1I9U/c55lRj8rxuNS49h74n9EQiK
         KSQGY4SiMnuQb5zYN2yW3RKKa8RykPQTPPDWNy/ULPShCy1tFlsEejugZK4buXEFHUjh
         PReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l2j9oJVLdw2ETVRjvlsUKZFYNsqLIEckkbStxyUbG4c=;
        b=QCfD5AgcqY2W2GWQxEVsFOYCDlBCyruGJrHIWTRASy46vXeW7asK66kPWQYjbtBamH
         9wqM3T/dLsAZLdWx0iDjR8p/ryPX2+qDMPVl7MAPeRi1a7lH9cv2yD/tnrF4TTZ72gJS
         SRmjwDk/zlXiXauoIyMlRC7c70bXL13ufZfYZ5YFGD0PSA53DZ55aM/EvB6WqwiJlLdu
         uzIvc7sw+E8/qbGKGuZz1/tNvi2kYzw8jOS3Mn7/XTNPOz+sgvwfZtxTouwRCBEgjzNk
         os0OnfWRZ7ihLqFAUb2br7GIvqv3NLmyvYSGhlee9Iwn0zYPa02QNi8oaAyp3Hw0+ZXy
         zo+w==
X-Gm-Message-State: AOAM532ahwzeT9KGCkVxqWj91i+klrohfDPVqkw6A4KA9/1oCRPozvfk
        QtDhYuT/ULRdlIKndTNFL8eDYL0+MWTqW0MDpDEQQg==
X-Google-Smtp-Source: ABdhPJzruP2FzeZRwPR6zyDb+MGWrPcKVuHVSHRiDqmTukJKyZeQtXXgwD7GQB8j4xgwJLtaqxztDYOUwhGdTqMth70=
X-Received: by 2002:aa7:8105:0:b029:18e:c8d9:2c24 with SMTP id
 b5-20020aa781050000b029018ec8d92c24mr6569040pfi.49.1607603562910; Thu, 10 Dec
 2020 04:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20201210035526.38938-1-songmuchun@bytedance.com>
 <20201210035526.38938-11-songmuchun@bytedance.com> <20201210101526.GA4525@localhost.localdomain>
In-Reply-To: <20201210101526.GA4525@localhost.localdomain>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 10 Dec 2020 20:32:06 +0800
Message-ID: <CAMZfGtWEE3rCBxXVb9bE_siByOuii19NVq1-Y2+EKe0-OSb2vg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 10/12] mm/hugetlb: Introduce
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

On Thu, Dec 10, 2020 at 7:40 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Dec 10, 2020 at 11:55:24AM +0800, Muchun Song wrote:
> > +void __init hugetlb_vmemmap_init(struct hstate *h)
> > +{
> > +     unsigned int nr_pages = pages_per_huge_page(h);
> > +     unsigned int vmemmap_pages;
> > +
> > +     /* We cannot optimize if a "struct page" crosses page boundaries. */
> > +     if (!is_power_of_2(sizeof(struct page)))
> > +             return;
> > +
> > +     if (!hugetlb_free_vmemmap_enabled)
> > +             return;
>
> I think it would make sense to squash the last patch and this one.
> As per the last patch, if "struct page" is not power of 2,
> early_hugetlb_free_vmemmap_param() does not set
> hugetlb_free_vmemmap_enabled, so the "!is_power_of_2" check from above
> would become useless here.
> We know that in order for hugetlb_free_vmemmap_enabled to become true,
> the is_power_of_2 must have succeed early on when calling the early_
> function.

Yeah, you are right. But if is_power_of_2 returns false. The compiler
can optimize this function to null. If we remove the check, it prevents
the compiler from optimizing the code of hugetlb_vmemmap_init().
So I think leaving it here makes sense. Right?

>
> --
> Oscar Salvador
> SUSE L3



-- 
Yours,
Muchun
