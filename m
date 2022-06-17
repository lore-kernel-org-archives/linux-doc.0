Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CD7CCA479
	for <linux-doc@archiver.kernel.org>; Fri, 17 Jun 2022 07:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380290AbiFQHuE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Jun 2022 03:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380024AbiFQHuE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Jun 2022 03:50:04 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3070674FB
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 00:50:02 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d5so3222822plo.12
        for <linux-doc@vger.kernel.org>; Fri, 17 Jun 2022 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/5JQEnezBo8SAr6g2AvndTomb05vaO1mzGxpKpnfNFw=;
        b=ZeTtH3DabDO7sw5h2E093njHE2+DJU4emaCoQlZUp7EeNN+4aqMW1wh+gGD4kgX9Mb
         un4tS4Jz1w73FWDZF9ZIdgVT4CjQfT+O58u4lonCUU4uDdjPPFhd/QhQSUWmU1Cfl/uH
         ARkOv26uS6Tj6rYl3rJyTDKKXbQWwSvGnysutexvWFVLvrTJdMnQ4544eG97GvJ9CpwH
         YAg9krnua2PFEENTm+SWJv1BXx7U1o/MnvzD+3uFuTubs401RvZe9elIco/tuXL9jhOh
         P2uHvQFQ2AHrJbAzOH6EFe0vMgyyXMjYYTFHYRhm9HMU2rqIB8oKHsWHamCQQI5XKdvx
         XjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/5JQEnezBo8SAr6g2AvndTomb05vaO1mzGxpKpnfNFw=;
        b=oK7Fl8R/wPresVVeJ6BjJTS0Td2ZZqXUIJiVbUEZwgedmDnT/J/fbc7/X1nBV2qPuZ
         sy6P9L4UHLNlXtagNdR4u0KRwQCFxHYreG+qjKxi0dLNHiX/X3BDobcBuWQJJ6FRXuiV
         pldi4QGNaGJEeXmxZUl/L45J76iLa5BtB4XDVTVpoo8lEYw0MjEkUQDbJDOikshBkw5J
         stfR148ATYPauaT0DCETw9Zml9zvXmGqbej/Y9R7p5zMixQwagOYiokNnWBBHhVnyNMv
         pd/bwIMgKHew+Jtv9bUGPoUfRdGnur+lHz4c8kBOfJp2fomvUitQayq0rmCNpB+rZOr/
         WHLQ==
X-Gm-Message-State: AJIora+pklCWuUhOJ7PNpd5YIX5QrFTsun+CiZ02HhDFv5EXQgshvL90
        qaSNHIGVrLoGGayNVv0z4OexIQ==
X-Google-Smtp-Source: AGRyM1ueXFqi+rj4FAeCjjkCGaS9L29wOvXRortQKXhhP6ngSuvIFI1dEyfbPgthDbo+9Iga7OUdBg==
X-Received: by 2002:a17:902:c946:b0:163:ed13:7ab1 with SMTP id i6-20020a170902c94600b00163ed137ab1mr8111674pla.36.1655452202297;
        Fri, 17 Jun 2022 00:50:02 -0700 (PDT)
Received: from localhost ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2994752pfy.128.2022.06.17.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 00:49:58 -0700 (PDT)
Date:   Fri, 17 Jun 2022 15:49:55 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Joao Martins <joao.m.martins@oracle.com>, david@redhat.com,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        corbet@lwn.net
Subject: Re: [PATCH 3/6] mm: hugetlb_vmemmap: introduce the name HVO
Message-ID: <YqwyI+MKIg1BLkfy@FVFYT0MHHV2J.usts.net>
References: <20220613063512.17540-1-songmuchun@bytedance.com>
 <20220613063512.17540-4-songmuchun@bytedance.com>
 <41e2d762-2c0d-b13b-d6da-6e0e0e858a84@oracle.com>
 <YqqjaPOMyPd3aUs2@FVFYT0MHHV2J.usts.net>
 <YquuXIaBM98oTyD9@monkey>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YquuXIaBM98oTyD9@monkey>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 16, 2022 at 03:27:40PM -0700, Mike Kravetz wrote:
> On 06/16/22 11:28, Muchun Song wrote:
> > On Wed, Jun 15, 2022 at 03:51:51PM +0100, Joao Martins wrote:
> > > On 6/13/22 07:35, Muchun Song wrote:
> > > > It it inconvenient to mention the feature of optimizing vmemmap pages associated
> > > > with HugeTLB pages when communicating with others since there is no specific or
> > > > abbreviated name for it when it is first introduced.  Let us give it a name HVO
> > > > (HugeTLB Vmemmap Optimization) from now.
> > > > 
> > > 
> > > Just thought I would throw this suggestion, even though I am probably too late.
> > > 
> > 
> > Not too late, we are still discussing the name.
> > 
> > > I find the term "vmemmap deduplication" more self-explanatory (at least for me)
> > > to refer to your technique ,and similarly s/optimize/dedup. Or vmemmap tail page
> > > deduplication (too verbose maybe) because really that's what this optimization is all
> > > about. OTOH it would slightly deviate from what maybe established now
> > > in hugetlb code.
> > >
> > 
> > Well, I have looked up this word "deduplication" which refers to a method of
> > eliminating a dataset’s redundant data.  At least I agree with you "deduplication"
> > is more expressive for my technique.  So I am thinking of renaming "HVO" to "HVD (
> > HugeTLB Vmemmap Deduplication)".  In this series (patch 6), I have renamed
> > hugetlb_vmemmap_alloc/free to hugetlb_vmemmmap_optimize/restore.  I am also
> > thinking of replacing it to:
> > 
> >   hugetlb_vmemmmap_deduplicate vs hugetlb_vmemmmap_duplicate.
> > 
> > Many other places in hugetlb_vmemmap.c use "optimize" word, maybe most of them do
> > not need to be changed since "deduplication" is also a __optimization__ technique.
> > 
> > Hi Mike and David:
> > 
> > What your opinion on this? I want to hear some thoughts from you.
> 
> I can understand Joao's preference for deduplication.  However, I can
> also understand just using the term optimization.  IMO, neither is far
> superior to the other.  It is mostly a matter of personal preference.
> 
> My preference would be to leave it as named in this series unless
> someone has a strong preference for changing.
>

All right. I'll keep the HVO name.

Thanks. 
