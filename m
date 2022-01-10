Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4E2C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 03:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbiAJD6L (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 22:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233092AbiAJD6H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 22:58:07 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A102C061748
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 19:58:07 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id s6so15911637ioj.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 19:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KxSZiZRQdqgzdFlRO54VlTYfuoCWD/E1gz0LmgTtY38=;
        b=REoii0frtVOfZhhAxIh91rJdHCGK7bn45fqrjPAxVpQymjoFztAMtMZT0KcktH3hRh
         01aHhky4dPCdWvQTdWvrpXnUFvQ4QC+xYCMJN01V+uu5/FKRFI6gDxLvulQX6cOqZOfh
         Cjs+QR2qzbEiYQfMFE8OCh7ApgufOuAqP2NBJgz4JcskpiDNfsjADISE0VvJxpl40/li
         whaTVnRIvCvYKkjVnEHI/HmUKm1HVIQXB3m1N9DeQAcvYaTpQ3HjtMa30tqp3n2ozp4/
         CtOYHvutdoUuynzRQXPt6nKPvX52HPvW2X+QvHu7NCUOTUuWVhOGoz/0G6KEcTm4ILse
         e0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KxSZiZRQdqgzdFlRO54VlTYfuoCWD/E1gz0LmgTtY38=;
        b=cZN4gcuotfoAIYkx4Pj2rqQBu70t91YfZ3h4V8gfTXJ7mZJ7Hz/l+qT195yNKqIz5G
         QPHCDEnhfYA3n5X5TuDWW8riNm0vLUPLUj3RrZiQGfPw3y57klhltUF2cVlO7JDCTIE8
         eLN3nK+Xm2AdQwrnm88+Wlx0A2OERQ9pOLNPY6e/I1rlSeDqTeeHYiOeZebFIgNObrvu
         C3Gb5e+raFjplIi2jd0NqemSBMyHPd5mW9KQYFm3/9nS5ah+1WeUUjNDLlPm7tvkLtF4
         mrisbrUqIAliEdccZx+LxOSjY9PhmE827RlcdgVKTpVoDnN5S0cE9/riXpIeshtohcnY
         EIGQ==
X-Gm-Message-State: AOAM531ZhZoNYzUSKAvlfsqpgVYA1aCwzH5cACkce6WXu97HmJ7rfGBQ
        CFPTEjyiT0Ax047f4oyamSRtnw==
X-Google-Smtp-Source: ABdhPJz7TEYmMxMwyDgcG8hn/K2tGWPANlpL5C2Rd+UacwgE3SCcvv0POx4pvE+v0p2KoHgDYwDDKg==
X-Received: by 2002:a02:3342:: with SMTP id k2mr25038656jak.231.1641787086863;
        Sun, 09 Jan 2022 19:58:06 -0800 (PST)
Received: from google.com ([2620:15c:183:200:d17d:9fe6:6a18:f270])
        by smtp.gmail.com with ESMTPSA id d11sm3582345ilv.6.2022.01.09.19.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 19:58:06 -0800 (PST)
Date:   Sun, 9 Jan 2022 20:58:02 -0700
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
Message-ID: <Yduuyrk/AZG717Hs@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <YdcU4P+XWkbDUUoO@dhcp22.suse.cz>
 <Yddh+APQGg8dKRgw@google.com>
 <Ydf/7DDu94fMs0CG@dhcp22.suse.cz>
 <YdgBL1dRk1KmyXJS@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdgBL1dRk1KmyXJS@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 07, 2022 at 10:00:31AM +0100, Michal Hocko wrote:
> On Fri 07-01-22 09:55:09, Michal Hocko wrote:
> [...]
> > > In this case, lru_gen_mm_walk is small (160 bytes); it's per direct
> > > reclaimer; and direct reclaimers rarely come here, i.e., only when
> > > kswapd can't keep up in terms of the aging, which is similar to the
> > > condition where the inactive list is empty for the active/inactive
> > > lru.
> > 
> > Well, this is not a strong argument to be honest. Kswapd being stuck
> > and the majority of the reclaim being done in the direct reclaim
> > context is a situation I have seen many many times.
> 
> Also do not forget that memcg reclaim is effectivelly only direct
> reclaim. Not that the memcg reclaim indicates a global memory shortage
> but it can add up and race with the global reclaim as well.

I don't dispute any of the above, and I probably don't like this code
more than you do.

But let's not forget the purposes of PF_MEMALLOC, besides preventing
recursive reclaims, include letting reclaim dip into reserves so that
it can make more free memory. So I think it's acceptable if the
following conditions are met:
1. The allocation size is small.
2. The number of allocations is bounded.
3. Its failure doesn't stall reclaim.
And it'd be nice if
4. The allocation happens rarely, e.g., slow path only.

The code in question meets all of them.

1. This allocation is 160 bytes.
2. It's bounded by the number of page table walkers which, in the
   worst, is same as the number of mm_struct's.
3. Most importantly, its failure doesn't stall the aging. The aging
   will fallback to the rmap-based function lru_gen_look_around().
   But this function only gathers the accessed bit from at most 64
   PTEs, meaning it's less efficient (retains ~80% performance gains).
4. This allocation is rare, i.e., only when the aging is required,
   which is similar to the low inactive case for the active/inactive
   lru.

The bottom line is I can try various optimizations, e.g., preallocate
a few buffers for a limited number of page walkers and if this number
has been reached, fallback to the rmap-based function. But I have yet
to see evidence that calls for additional complexity.
