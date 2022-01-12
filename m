Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4684AC433F5
	for <linux-doc@archiver.kernel.org>; Wed, 12 Jan 2022 01:01:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347460AbiALBBg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jan 2022 20:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234143AbiALBBg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 20:01:36 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A481AC06173F
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 17:01:35 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id j1so1432407iob.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 17:01:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jNmx8g8QULTnXgWyiPIunnbTModfNMXbNul38tS9+t8=;
        b=NAulvy+CL4jLdg6in4jpNyX7o1OXHQdkwuFvwX5K7RgDZTz13OcR7WH1DzcE9KdXbA
         nS7L/OR8QQxsClaVTxzf9z85k5DGUPK7XFCezMiE+490Ascv4a0eUEOWBTuv1nDuhdEa
         PHmeQ9GVNAa+ra/y7o7UcKabUURkxZ962JH1oMlEaPb0qwqwexHFud8ogggWGV0SCDC4
         KAi0rVVB2AufTMb4+Ia2SPkN3jrhN28krE3UUjdvECd6LMIq4tvHOO61cuMaCe6V6RBr
         oL71D/7sN0O7wAfSrcaZurdbRBV7LcoPv2BEVpr10nte+y4wyG+7xGfDpqhxqv/KiPoN
         Wdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jNmx8g8QULTnXgWyiPIunnbTModfNMXbNul38tS9+t8=;
        b=BCAL7cFyHqFcNhYVAN9fnkO5zxX/9gwlaijkeIKoPZL4u400Z0U2jTNnS2EL4ZSQ4D
         gKZat4Wm4I3aFQsIdb3jsxfyP4JW4Iw06yC19kUOWDVdm+IAF9G9zW/QQsDzfkarwtxU
         I/5y/QMsKPcchQxgRDMiNBDMO4uKUX+Wmww5QLjSLbfGDfsvhVnJXR6XY2serB4JvwPY
         FdDfQltNYoQQ7Yka6nXORMEfC9dNu7E6RlfdZKzURVGAI1s0rGPUmVDFpFrMFrFwXRfw
         Y6JvbHYOPa8ox1aqff8SQrviLMKtpLZdMsVWYKck9vJgir3m5ISEuvBHt/6gl8qbeT1p
         ZakQ==
X-Gm-Message-State: AOAM5326ohTnlWy/vDcjSGcVC9HfhuATsPfaR+NF9EU5Zh2b/UPEKiF6
        OxIOMgRNY7HPvCtrBazKw6/fcQ==
X-Google-Smtp-Source: ABdhPJy6+Q9GpyROLohTnAHgRnpGuFaV485DidDlkI1AelSWNPEo/Rk4V8VZWl64qjBRxmXni7NRhA==
X-Received: by 2002:a02:cc70:: with SMTP id j16mr2271558jaq.72.1641949294228;
        Tue, 11 Jan 2022 17:01:34 -0800 (PST)
Received: from google.com ([2620:15c:183:200:b6b6:70f4:b540:6383])
        by smtp.gmail.com with ESMTPSA id s6sm6758158ild.5.2022.01.11.17.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 17:01:33 -0800 (PST)
Date:   Tue, 11 Jan 2022 18:01:29 -0700
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
Message-ID: <Yd4oaUwHkpadAKwe@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <Ydxlg5rI4ZvODQvF@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ydxlg5rI4ZvODQvF@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 05:57:39PM +0100, Michal Hocko wrote:
> On Tue 04-01-22 13:22:25, Yu Zhao wrote:
> [...]
> > +static void walk_mm(struct lruvec *lruvec, struct mm_struct *mm, struct lru_gen_mm_walk *walk)
> > +{
> > +	static const struct mm_walk_ops mm_walk_ops = {
> > +		.test_walk = should_skip_vma,
> > +		.p4d_entry = walk_pud_range,
> > +	};
> > +
> > +	int err;
> > +#ifdef CONFIG_MEMCG
> > +	struct mem_cgroup *memcg = lruvec_memcg(lruvec);
> > +#endif
> > +
> > +	walk->next_addr = FIRST_USER_ADDRESS;
> > +
> > +	do {
> > +		unsigned long start = walk->next_addr;
> > +		unsigned long end = mm->highest_vm_end;
> > +
> > +		err = -EBUSY;
> > +
> > +		rcu_read_lock();
> > +#ifdef CONFIG_MEMCG
> > +		if (memcg && atomic_read(&memcg->moving_account))
> > +			goto contended;
> > +#endif
> 
> Why do you need to check for moving_account?

This check, if succeeds, blocks memcg migration.

Our goal is to move pages between different generations of the same
lruvec (the first arg). Meanwhile, pages can also be migrated between
different memcgs (different lruvecs).

The active/inactive lru uses isolation to block memcg migration.

Generations account pages similarly to the active/inactive lru, i.e.,
each generation has nr_pages counter. However, unlike the active/
inactive lru, a page can be moved to a different generation without
getting isolated or even without being under the lru lock, as long as
the delta is eventually accounted for (which does require the lru lock
when it happens).

The generation counter in page->flags (folio->flags to be precise)
stores 0 when a page is isolated, to synchronize with isolation.
