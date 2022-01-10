Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB63C433FE
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 04:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbiAJEsF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 23:48:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230453AbiAJEsE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 23:48:04 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B737C061748
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 20:48:04 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u8so15972948iol.5
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 20:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=guDTMY1gDKbuEeHSjJBqpytUvSIpcoxzveWlee08C0k=;
        b=cLjKHl/ZssXUW2pXxDtVnoKKLcr+3KmiIUZANhNj1odZoOSUuOnEcRUk3/GzhfwX9l
         I2d55GavHG9UBfE9O7qOBDicVTSC3VgU2oQzb74lP7ThokGz0p61MCDol/m5Y5ZKu9pn
         SVpDBX5LfcNJDDUn4yyS2cdlmaI78ysmlsvuyWQzxsievAshuB6rWKX8DHp92ldMt3zY
         B4ne5V6CrxYJGLdzok22NDcHnJ888zHEEYrF3wi5/SWDuDbeFyaUPN56nH0Ld2N46MwE
         f6ZAH1f8EYlHkNc4dNQ1swga9w9EtS1u5p3L8IVZA4FMXKGSjfCsGVu19Qu2Vzzx9+vI
         LTBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=guDTMY1gDKbuEeHSjJBqpytUvSIpcoxzveWlee08C0k=;
        b=GkQ/j4tUFOu2R10ZBKRw5id6+v7TfOxfZxkFFv8Jjn3m6/kIwBa/Gs+VEphYaaYtWY
         2HFJaxpERMfAQuvoR7zBc2ji1sGXm13NAhhz8yy3s6kefGM2WVTKcj3w5Gaug/5DXBEF
         8+SMhyMn3gZ5IeeetLDFozkLfJpvVGRXXF0UZzl/f5l+t/0n5LPBJh9h5Mug6Ur4tlMN
         0kfCs5ykiQg4ES+P5PuLmc+GJLIzb7xmPxN+w+FcqF5byOzkjNNqfyi+JG0iTV2CKsQi
         SUgVw4tL+Jcq6GTum7a39yz1gfTr76Y7KQbjxiJ1DTyFaNFkeNOd9NT3VIyeKF16R3eB
         p3VQ==
X-Gm-Message-State: AOAM533vvnzC+oTbAv06INrRqUBSgmlyKy4BGHBJrIH8K23wN8RyTVr6
        aXbXy7Dac5oZzK7GDl0rlskHiw==
X-Google-Smtp-Source: ABdhPJxFUbrC0ZIhFKmqo908OFMH2pxK5vT/Vqqp8hKFWDmgoGpLXOANCv2QbMHi2EceqWLqE78zrg==
X-Received: by 2002:a05:6638:4192:: with SMTP id az18mr34204838jab.252.1641790083298;
        Sun, 09 Jan 2022 20:48:03 -0800 (PST)
Received: from google.com ([2620:15c:183:200:d17d:9fe6:6a18:f270])
        by smtp.gmail.com with ESMTPSA id h23sm1907101ila.81.2022.01.09.20.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 20:48:02 -0800 (PST)
Date:   Sun, 9 Jan 2022 21:47:57 -0700
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
Message-ID: <Ydu6fXg2FmrseQOn@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-7-yuzhao@google.com>
 <YdhR4vWdWksBALtM@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YdhR4vWdWksBALtM@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 07, 2022 at 03:44:50PM +0100, Michal Hocko wrote:
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
> > +		if (!mmap_read_trylock(mm))
> > +			goto contended;
> 
> Have you evaluated the behavior under mmap_sem contention? I mean what
> would be an effect of some mms being excluded from the walk? This path
> is called from direct reclaim and we do allocate with exclusive mmap_sem
> IIRC and the trylock can fail in a presence of pending writer if I am
> not mistaken so even the read lock holder (e.g. an allocation from the #PF)
> can bypass the walk.

You are right. Here it must be a trylock; otherwise it can deadlock.

I think there might be a misunderstanding: the aging doesn't
exclusively rely on page table walks to gather the accessed bit. It
prefers page table walks but it can also fallback to the rmap-based
function, i.e., lru_gen_look_around(), which only gathers the accessed
bit from at most 64 PTEs and therefore is less efficient. But it still
retains about 80% of the performance gains.

> Or is this considered statistically insignificant thus a theoretical
> problem?

Yes. People who work on the maple tree and SPF at Google expressed the
same concern during the design review meeting (all stakeholders on the
mailing list were also invited). So we had a counter to monitor the
contention in previous versions, i.e., MM_LOCK_CONTENTION in v4 here:
https://lore.kernel.org/lkml/20210818063107.2696454-8-yuzhao@google.com/

And we also combined this patchset with the SPF patchset to see if the
latter makes any difference. Our conclusion was the contention is
statistically insignificant to the performance under memory pressure.

This can be explained by how often we create a new generation. (We
only walk page tables when we create a new generation. And it's
similar to the low inactive condition for the active/inactive lru.)

Usually we only do so every few seconds. We'd run into problems with
other parts of the kernel, e.g., lru lock contention, i/o congestion,
etc. if we create more than a few generation every second.
