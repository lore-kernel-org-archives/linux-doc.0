Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE95FC5519F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 08:52:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31BFF2240A
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 08:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="N5BsUqRd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727070AbgKTIwm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 03:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725824AbgKTIwm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 03:52:42 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53972C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 00:52:42 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id d17so4521413plr.5
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 00:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zpNptVEuWzTVs1t2YZA8V1BK1+nQ/xLKMvtlTpvsiNM=;
        b=N5BsUqRdrzvSw9AHWZZyrIIthOxBDzszxZllUK77vwE59ZQelnxtVCObH/ZZK2Vw7M
         rLy1RI+ru0XDHzycpGag2P2fSftv+XPBCzQf4DRTy40YMdKx93654iCy1prysMuHfnrd
         XJYFtOgP3E7SEuxIPL3Gctaltw7yGhhyMeSvyTefv19A3WDZcpbKBVLtR7parCS5NiLG
         uNpdTmc7TiRt7y3EW/ESytrDvqpv+7dJ2rV7MbLouSFomLdR7rbO1KDMDG3cJuJI3Sf3
         skXK1rNeiKWVZZCSBhRQgDTJZW5EEN8yZ1bNVzie05HGjDQ4fZca2TSzpUU5ARswisw0
         qvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpNptVEuWzTVs1t2YZA8V1BK1+nQ/xLKMvtlTpvsiNM=;
        b=DlosvcoQZKYlBZUySskB8YRfMLih5eNTrx67YGmyBbjcxV054XItEt4B9LftScdkQJ
         aRV6quGrdPgJ0frFW1ywW554wvAmeczmYZqSv4SBu7BSlwYLCg9Qe4z8OJR5GYIbpKg1
         UmWGD762m84Y2f2bAbOKPvJe3gtYxFiJeXApEYXLykzVO2eYdwkEK/VYN9MU2XZ/Mdav
         1WfI/LhTmOUhn8J08VRpQ5DEW0nxuvD2d7oCckA2TD0p+rDeW6uYUiitYi1PBKPCsZqz
         SZxHPYxFhwP8HerELtumphqbe40X1Rhs8Dz4nzzXQP2/PMogorGyiLJ0Zp3J7L4tXFBB
         su1g==
X-Gm-Message-State: AOAM533a2lsvenAVQp6fCkWKn5pUNygxarDb+h5N4MLvkDRBhUbLJEH1
        7A29/w8N/oqpOJaTXaxehutizik2GILAIgpBxWV6gw==
X-Google-Smtp-Source: ABdhPJwlDBHCTerTRacGWw2itZ5Ez5TirD6WZf/c7BEGg462vAoZLIr8yw3+7RDjdDmEuv9EbGXEI9G5aPzAlqKWK8U=
X-Received: by 2002:a17:902:76c8:b029:d9:d6c3:357d with SMTP id
 j8-20020a17090276c8b02900d9d6c3357dmr7764836plt.34.1605862361852; Fri, 20 Nov
 2020 00:52:41 -0800 (PST)
MIME-Version: 1.0
References: <20201120064325.34492-1-songmuchun@bytedance.com>
 <20201120064325.34492-12-songmuchun@bytedance.com> <20201120081123.GC3200@dhcp22.suse.cz>
In-Reply-To: <20201120081123.GC3200@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 20 Nov 2020 16:51:59 +0800
Message-ID: <CAMZfGtWVxCPpL7=0dfHa7_qtakmGDMLP0twWoyM=gVou=HRmEg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 11/21] mm/hugetlb: Allocate the vmemmap
 pages associated with each hugetlb page
To:     Michal Hocko <mhocko@suse.com>
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
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 20, 2020 at 4:11 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Fri 20-11-20 14:43:15, Muchun Song wrote:
> [...]
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index eda7e3a0b67c..361c4174e222 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -117,6 +117,8 @@
> >  #define RESERVE_VMEMMAP_NR           2U
> >  #define RESERVE_VMEMMAP_SIZE         (RESERVE_VMEMMAP_NR << PAGE_SHIFT)
> >  #define TAIL_PAGE_REUSE                      -1
> > +#define GFP_VMEMMAP_PAGE             \
> > +     (GFP_KERNEL | __GFP_NOFAIL | __GFP_MEMALLOC)
>
> This is really dangerous! __GFP_MEMALLOC would allow a complete memory
> depletion. I am not even sure triggering the OOM killer is a reasonable
> behavior. It is just unexpected that shrinking a hugetlb pool can have
> destructive side effects. I believe it would be more reasonable to
> simply refuse to shrink the pool if we cannot free those pages up. This
> sucks as well but it isn't destructive at least.

I find the instructions of __GFP_MEMALLOC from the kernel doc.

%__GFP_MEMALLOC allows access to all memory. This should only be used when
the caller guarantees the allocation will allow more memory to be freed
very shortly.

Our situation is in line with the description above. We will free a HugeTLB page
to the buddy allocator which is much larger than that we allocated shortly.

Thanks.

> --
> Michal Hocko
> SUSE Labs



-- 
Yours,
Muchun
