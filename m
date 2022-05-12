Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7211C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 11:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244658AbiELLYl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 07:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353317AbiELLYd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 07:24:33 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24585F27F
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 04:24:02 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id cu23-20020a17090afa9700b001d98d8e53b7so5887727pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 12 May 2022 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=MZUxzSSA16jHPMfnNIZTNFIVQ87TLhFgxWJeE4kOIcw=;
        b=NVvHhWxDmgEveY5XgTLMjhIN/WeC0dzORtcZU3yCriRugu10mhKnK39HtzfAbTtN2o
         iTVG1JQXh2n/X+jJAU4pj0uySBGDeX2s2D+lpkjOrWSfKfhn7Li5DghUPhuszF+nwR0F
         VT2gwv11WrI1YC/ZgMVbvCXz/JjHJkQBVijSWSGx+f01HGzThnuMDodZg1Zy34ZxB8Vb
         l/dz8CCbvhk1RsxOldgZRAxNnNZ9Y1JGkLSnSWPcwhvU8TWBNiL05dTLFK1VgEpig6In
         SkTeNFO2cYNJivVnR9WfdodW2GCkT4hEY/rBMOAeRJRIJlxkALKvur8dnFx7gAeqDsa5
         XGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=MZUxzSSA16jHPMfnNIZTNFIVQ87TLhFgxWJeE4kOIcw=;
        b=zWoQ9t4QBxHNY/M9UJ+RyjjhwB/paLnJbVZ0CPYRZ6jB31Kw4Osv0ZlsXGP9C94sLJ
         D0YvVQ8nHArgJsz+ZhzZJv1L2Pt0jFZR0xWTblEZfIf5tWd/N93vfTFyfRsmJ8C3+v0y
         dToXz4MI/PuD7WtPdTYcg9a9bboIafxv5mC+v9qrlNA2rNDuxI6PPAzCeAgNuo8hol3Z
         NI4thif6EIPpSEiGGnYabioa6RLYeTG0HadIBj6Ey/Mey6qIh5v5wWwclYX4l48ckpZs
         UvcT7YPKStqhLh2c824Z7N9KULuvemgu+htSOw4nuF02jvZy3qdi3x2bkzlBkE5CVkUa
         UhmA==
X-Gm-Message-State: AOAM533k5DmToMprYpXxiWAiRd79Q0iY2cr/ffSbcLP5uGl8tZ2FOBFE
        TRZdu8i7HUTwJK0iTN42HVLLuw==
X-Google-Smtp-Source: ABdhPJyBo8Ppm/uMJMgFCgqLtFjWMfuMu1xs6L5wv/MOpVS/NoFV+EHTkKVoWQCFUfvxY8GXBnDZcw==
X-Received: by 2002:a17:90a:4803:b0:1dc:b4c9:1958 with SMTP id a3-20020a17090a480300b001dcb4c91958mr10259315pjh.61.1652354642336;
        Thu, 12 May 2022 04:24:02 -0700 (PDT)
Received: from localhost ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id 23-20020aa79157000000b0050dc76281cbsm3506108pfi.165.2022.05.12.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 04:24:01 -0700 (PDT)
Date:   Thu, 12 May 2022 19:23:49 +0800
From:   Muchun Song <songmuchun@bytedance.com>
To:     David Hildenbrand <david@redhat.com>
Cc:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, masahiroy@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        duanxiongchun@bytedance.com, smuchun@gmail.com
Subject: Re: [PATCH v10 3/4] mm: hugetlb_vmemmap: use kstrtobool for
 hugetlb_vmemmap param parsing
Message-ID: <YnzuRV4LLRNykDtO@FVFYT0MHHV2J.usts.net>
References: <20220509062703.64249-1-songmuchun@bytedance.com>
 <20220509062703.64249-4-songmuchun@bytedance.com>
 <21aae898-d54d-cc4b-a11f-1bb7fddcfffa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21aae898-d54d-cc4b-a11f-1bb7fddcfffa@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 12, 2022 at 09:41:22AM +0200, David Hildenbrand wrote:
> On 09.05.22 08:27, Muchun Song wrote:
> > Use kstrtobool rather than open coding "on" and "off" parsing in
> > mm/hugetlb_vmemmap.c,  which is more powerful to handle all kinds
> > of parameters like 'Yy1Nn0' or [oO][NnFf] for "on" and "off".
> > 
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |  6 +++---
> >  mm/hugetlb_vmemmap.c                            | 10 +++++-----
> >  2 files changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 308da668bbb1..43b8385073ad 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -1703,10 +1703,10 @@
> >  			enabled.
> >  			Allows heavy hugetlb users to free up some more
> >  			memory (7 * PAGE_SIZE for each 2MB hugetlb page).
> > -			Format: { on | off (default) }
> > +			Format: { [oO][Nn]/Y/y/1 | [oO][Ff]/N/n/0 (default) }
> 
> Really? Can we make the syntax even harder to parse for human beings?! :)
> 
> Not to mention that it's partially wrong? What about "oFf" ? That would
> have to be [oO][Ff][Ff]
> 
> Honestly, "on | off" is good enough. That "oN" and friends work is just
> a "nice to have" IMHO. No need to over-complicate this description.

Got it. How about also telling users "on/1 | off/0"? Because 0 and
1 are also widely used to disable/enable a knob.

> >  
> > -			on:  enable the feature
> > -			off: disable the feature
> > +			[oO][Nn]/Y/y/1: enable the feature
> > +			[oO][Ff]/N/n/0: disable the feature
> >  
> >  			Built with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y,
> >  			the default is on.
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 6254bb2d4ae5..cc4ec752ec16 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -28,15 +28,15 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
> >  
> >  static int __init hugetlb_vmemmap_early_param(char *buf)
> >  {
> > -	if (!buf)
> > +	bool enable;
> > +
> > +	if (kstrtobool(buf, &enable))
> >  		return -EINVAL;
> >  
> > -	if (!strcmp(buf, "on"))
> > +	if (enable)
> >  		static_branch_enable(&hugetlb_optimize_vmemmap_key);
> > -	else if (!strcmp(buf, "off"))
> > -		static_branch_disable(&hugetlb_optimize_vmemmap_key);
> >  	else
> > -		return -EINVAL;
> > +		static_branch_disable(&hugetlb_optimize_vmemmap_key);
> >  
> >  	return 0;
> >  }
> 
> 
> Apart from that
> 
> Acked-by: David Hildenbrand <david@redhat.com>
>

Thanks.

> -- 
> Thanks,
> 
> David / dhildenb
> 
> 
