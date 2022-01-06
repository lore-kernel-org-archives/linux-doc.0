Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC7AC433FE
	for <linux-doc@archiver.kernel.org>; Thu,  6 Jan 2022 21:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244184AbiAFVlS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Jan 2022 16:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244342AbiAFVlS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Jan 2022 16:41:18 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF12AC0611FF
        for <linux-doc@vger.kernel.org>; Thu,  6 Jan 2022 13:41:17 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id v18so3116066ilm.11
        for <linux-doc@vger.kernel.org>; Thu, 06 Jan 2022 13:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=VE61gMKhpnWZvU6qcog2kgqC/TE+2QO5LS6iHCKhdqo=;
        b=X5251x9gOvT9jJO0fIYrghZ2dmsDZAjI/XaWW0c5hgerIpNSgvl0jSew1p/PD5Wl19
         Vty9fxDz85jiNwo2PyrzeAVr0Qh4AvnoRBKBwKjqqN+gzpApKSZBr6PBW1Haplrbva6W
         fgVBMIb7yopx0RKQtKxR50gNsFKTWHXlfqc8oQFDrabFDnXtqIegt0iG6irvi38YWFd4
         cgfZmbJs9Pm7/xTPZRLe5dj3S3L3BXmcfUDx4bs89c9lfEzBCjKIC2rQMHR8y1knN7k1
         n9W9uyTNFGgs6Rt4Z59saMbeT0VmyuJ8EgZ8HHnKRgS+SJ6qUqkzzObvE1zCp+mjQO+F
         5N6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=VE61gMKhpnWZvU6qcog2kgqC/TE+2QO5LS6iHCKhdqo=;
        b=2vy8UH+p46ljMdvIS/wMiHtXr1tdP/ESm+651oYH1UMToth9QzVrAzcdN06+VzrHVe
         IMyMBqrUDB6ZTQZLaMyC+TosSfDclnWICC52o24Ro/5NyYZyj9v0Jvj+cdSBO202O+OV
         357LBqQx+sRXnhXk5/y7996cXS1s2FqMypJBffDpc6wwDBD7/RqZs0nSMG0vo24b7oXN
         QS4TLz85EwF5sqyt8IZYJ+1bYulraDtXXMWlVRfAaHOu9ddBWDXg+5LYCzyddQt/vCSk
         DUcQGmAtUhNSDZOy93wS5kfUAH3mVtc7bX1rWS1is4R8Nm0px/wjexmbyHe9ps8XYxNV
         FV1g==
X-Gm-Message-State: AOAM531CTCg9UGDlpEyNxSCMG3BfBUFk20sTlpVSJtHctIBNPJCd/lya
        UmbtDoVCOEf8agcGNadOJkR6Zg==
X-Google-Smtp-Source: ABdhPJy/UG+ITMyG2/Mn4Uwf8UspkeO6+lrYf7WWF5pbE5NdbTB0zBoFHkgaWyjBjeOtQvNFfxzAEw==
X-Received: by 2002:a05:6e02:1945:: with SMTP id x5mr2005197ilu.288.1641505277173;
        Thu, 06 Jan 2022 13:41:17 -0800 (PST)
Received: from google.com ([2620:15c:183:200:2e0a:5e5e:fac:e07b])
        by smtp.gmail.com with ESMTPSA id r1sm1688447ilo.38.2022.01.06.13.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:41:16 -0800 (PST)
Date:   Thu, 6 Jan 2022 14:41:12 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 6/9] mm: multigenerational lru: aging
Message-ID: <Yddh+APQGg8dKRgw@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <YdcU4P+XWkbDUUoO@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdcU4P+XWkbDUUoO@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 06, 2022 at 05:12:16PM +0100, Michal Hocko wrote:
> On Tue 04-01-22 13:22:25, Yu Zhao wrote:
> > +static struct lru_gen_mm_walk *alloc_mm_walk(void)
> > +{
> > +	if (!current->reclaim_state || !current->reclaim_state->mm_walk)
> > +		return kvzalloc(sizeof(struct lru_gen_mm_walk), GFP_KERNEL);
> > +
> > +	return current->reclaim_state->mm_walk;
> > +}
> > +
> > +static void free_mm_walk(struct lru_gen_mm_walk *walk)
> > +{
> > +	if (!current->reclaim_state || !current->reclaim_state->mm_walk)
> > +		kvfree(walk);
> > +}
> 
> Do I get it right that you are allocating from the reclaim context? What
> prevents this to completely deplete the memory as the reclaim context is
> PF_MEMALLOC?

Yes, and in general the same reason zram/zswap/etc. allocate memory in
the reclaim context: to make more free memory.

In this case, lru_gen_mm_walk is small (160 bytes); it's per direct
reclaimer; and direct reclaimers rarely come here, i.e., only when
kswapd can't keep up in terms of the aging, which is similar to the
condition where the inactive list is empty for the active/inactive
lru.
