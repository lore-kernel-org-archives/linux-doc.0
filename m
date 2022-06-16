Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88BBBC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 03:28:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349761AbiFPD2s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jun 2022 23:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348280AbiFPD2r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jun 2022 23:28:47 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AD45930C
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 20:28:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id y6so331301pfr.13
        for <linux-doc@vger.kernel.org>; Wed, 15 Jun 2022 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=CRNEs4vWfHi/zqEAbvBSLfQhK7itq93yjJkgH9b856k=;
        b=bp+qSb4nchxuHn/5omBmyxKVlhzvIagSwgOSKahCBQ5IBwm7MxAjm1Z3AiosRh0UDu
         Y6RNcPIgWEVd0DCdN91FtMZ5kZRzvOivWSHXIbrEc+RxSEngb2aB7tZ5xlOm8AgwDN3H
         +UPJFaZZyXo3X+PfRkoD78nJjQbVRIFA4nY6+sgiBmhLjgb6/TTzDevY9H+l9Gnrr2l7
         RVlKniKqEOLr8WrSH+1boOd/MhbpTJf42HP/iqGEdNNeS+WUwJ2UBOL5td8sTv0cjBxA
         ytREFDIhmcBwNz5NayKzvxMaNa8mYtasUvdlgAl9KwFZYsiwWfBgP6N4D1qwz0ve5q4G
         hahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=CRNEs4vWfHi/zqEAbvBSLfQhK7itq93yjJkgH9b856k=;
        b=7JPAQOxG9L2/OsEpplhiSCNB+YZ16AAo47Gqj58an/5H4xC+c5f6D+OHzRlXVuXRPf
         IBh/MxHwu1akgkw0jNE6ilwPlkZJFiD4Ak7JjsoTooPxrk/h2uOOnJIfDCARkfV1I6BL
         9DJDM8Ww0zY9ssKMFbA+PCfwPyzYijK/XQhdV/aAFngrV5nb6ZWi20Ja/p16M5T+1v+g
         xZT2PYfnkbFBcwlBkl60gEBbJ3M0lcT1JMFwLdK9XpQ67hUmpxtsUQKhSOtDtCVZep/x
         dFFiycTNv4o6ZMaUCV+qIqfIQA0TGqri64KqSMr6BOtYPxDAgKfvS23R5qfmz30PzZKy
         GuPw==
X-Gm-Message-State: AJIora/c5K/g92GY/F/nlh+J3egt1Bx5Muu0cd2KFFTroBKA5wCChvxk
        BHTzX5jUrf6j3BaF872zSw9X+g==
X-Google-Smtp-Source: AGRyM1tLDwBdxT4hf66b3PKGa+22ZM0MVqNShnGS8pVZt2sGXi0o/yv1HiVpGPQjTxa4sfDPq0FJLQ==
X-Received: by 2002:a65:6b8a:0:b0:3fc:4c06:8a8d with SMTP id d10-20020a656b8a000000b003fc4c068a8dmr2661868pgw.83.1655350125598;
        Wed, 15 Jun 2022 20:28:45 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id n62-20020a622741000000b0050dc7628146sm421598pfn.32.2022.06.15.20.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 20:28:45 -0700 (PDT)
Date:   Thu, 16 Jun 2022 11:28:40 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Joao Martins <joao.m.martins@oracle.com>, mike.kravetz@oracle.com,
        david@redhat.com
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        corbet@lwn.net
Subject: Re: [PATCH 3/6] mm: hugetlb_vmemmap: introduce the name HVO
Message-ID: <YqqjaPOMyPd3aUs2@FVFYT0MHHV2J.usts.net>
References: <20220613063512.17540-1-songmuchun@bytedance.com>
 <20220613063512.17540-4-songmuchun@bytedance.com>
 <41e2d762-2c0d-b13b-d6da-6e0e0e858a84@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <41e2d762-2c0d-b13b-d6da-6e0e0e858a84@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 15, 2022 at 03:51:51PM +0100, Joao Martins wrote:
> On 6/13/22 07:35, Muchun Song wrote:
> > It it inconvenient to mention the feature of optimizing vmemmap pages associated
> > with HugeTLB pages when communicating with others since there is no specific or
> > abbreviated name for it when it is first introduced.  Let us give it a name HVO
> > (HugeTLB Vmemmap Optimization) from now.
> > 
> 
> Just thought I would throw this suggestion, even though I am probably too late.
> 

Not too late, we are still discussing the name.

> I find the term "vmemmap deduplication" more self-explanatory (at least for me)
> to refer to your technique ,and similarly s/optimize/dedup. Or vmemmap tail page
> deduplication (too verbose maybe) because really that's what this optimization is all
> about. OTOH it would slightly deviate from what maybe established now
> in hugetlb code.
>

Well, I have looked up this word "deduplication" which refers to a method of
eliminating a dataset’s redundant data.  At least I agree with you "deduplication"
is more expressive for my technique.  So I am thinking of renaming "HVO" to "HVD (
HugeTLB Vmemmap Deduplication)".  In this series (patch 6), I have renamed
hugetlb_vmemmap_alloc/free to hugetlb_vmemmmap_optimize/restore.  I am also
thinking of replacing it to:

  hugetlb_vmemmmap_deduplicate vs hugetlb_vmemmmap_duplicate.

Many other places in hugetlb_vmemmap.c use "optimize" word, maybe most of them do
not need to be changed since "deduplication" is also a __optimization__ technique.

Hi Mike and David:

What your opinion on this? I want to hear some thoughts from you.

THanks.
