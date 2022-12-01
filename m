Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05265C4321E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Dec 2022 22:10:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbiLAWKx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 17:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbiLAWKv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 17:10:51 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C7C33D90B
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 14:10:50 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id d185so3056884vsd.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 14:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rf84obAKN/8ruolDjM0pM28OtudVnfPduob08XaAHeM=;
        b=C5A/tE+OvI+/icvXdhe39VigA0TTbTY4PJd9mnXEXbnfkr0SrvZc1sS0BhKGJ9tFbH
         VrlF6IzPg1aqf/aWu55hvBF9KZc12XIGaiyBaaWM8tzg9pEnKuCYLKsOWIO9iIRoq6fN
         h+9U6WOdvTl4++/BjtWYxzFMTOs+g5fd6qJ/zeLOaxZ5HqfmU3EFndAxTDwLIhOvufRg
         lz9HYLOosZUavj+NWHAmwUBmjsPobyVqbSeR7xoIPkhsfX+u6FQFeFXf4lUXDXHETkX+
         aOg84lpe1797MkZHvW3Z/yK8LBKC0vRON342vgsQ0hEFEvXwFpzRCnmNE0JkU96V1fXe
         hHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rf84obAKN/8ruolDjM0pM28OtudVnfPduob08XaAHeM=;
        b=ht2OeG0dQjSh8d/dHcaPWZL9/tRwq918PbZJIPgzF4BrXSCgyl7IoHe8lDUxTXFTMa
         ece2vEW++XoD2iRY04Gyx/eKBHJtY5ntj4vVJ2rMEj+1eNK2k8WUCe38otVj8bxax3No
         CdNWVvD2ZZKUAxUvn6gTtCg5X418961C/gaEpTLYGtM/kZxH+UdU8IrtfjD8PfuyItsn
         DQkdDW1jSHd/ywn4bY8YqaXDjIZbDBPASUSbFCUDpIhTRvdcygbj+AJ0hh0hGD7dFDHj
         yfbRw8sh+13ddjhwZuvUrxxTU49ID4LEfMEzb2LMDvI7fDM5WAQN/adYDI2st4OBKmnz
         lvOg==
X-Gm-Message-State: ANoB5pnJs0q8uAccecFpFBWBVttS1gyC8pzJuvScWfYco9SIUuBJb6i/
        1s/zMKfC/RQRG1gH2/V3iaHxmRB8aBg8vFmAISzXCQ==
X-Google-Smtp-Source: AA0mqf7+zcrz2gPmzIkscfmr5SMSSgOcjkv+7kg2SOfHpFg5FBWFgEZt95ZGmuZG032Oshqx0NMxe3bwoGr4Onh742g=
X-Received: by 2002:a05:6102:cd1:b0:3aa:1bff:a8a5 with SMTP id
 g17-20020a0561020cd100b003aa1bffa8a5mr39103278vst.67.1669932649473; Thu, 01
 Dec 2022 14:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20221130020328.1009347-1-almasrymina@google.com> <20221201213202.ycdaymwojd5plyrk@google.com>
In-Reply-To: <20221201213202.ycdaymwojd5plyrk@google.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Thu, 1 Dec 2022 14:10:37 -0800
Message-ID: <CAHS8izOn3Kr8vqxHYxEoGVoCXKmysRKNsvXpJ2EumxDU6JfSDQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2] mm: Add nodes= arg to memory.reclaim
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Huang Ying <ying.huang@intel.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, weixugc@google.com,
        gthelen@google.com, fvdl@google.com, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 1, 2022 at 1:32 PM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Tue, Nov 29, 2022 at 06:03:27PM -0800, Mina Almasry wrote:
> [...]
> > diff --git a/mm/vmscan.c b/mm/vmscan.c
> > index 7b8e8e43806b..23fc5b523764 100644
> > --- a/mm/vmscan.c
> > +++ b/mm/vmscan.c
> > @@ -6735,7 +6735,8 @@ unsigned long mem_cgroup_shrink_node(struct mem_cgroup *memcg,
> >  unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
> >                                          unsigned long nr_pages,
> >                                          gfp_t gfp_mask,
> > -                                        unsigned int reclaim_options)
> > +                                        unsigned int reclaim_options,
> > +                                        nodemask_t nodemask)
>
> Can you please make this parameter a nodemask_t* and pass NULL instead
> of NODE_MASK_ALL?

Thank you very much for the review. I sure can in the next version. To
be honest I thought about that and made the parameter nodemask_t
because I thought the call sites would be more readable. I.e. this:

    try_to_free_mem_cgroup_pages(memcg, 1, GFP_KERNEL,
MEMCG_RECLAIM_MAY_SWAP,  NODE_MASK_ALL);

Would be more readable than this:

    try_to_free_mem_cgroup_pages(memcg, 1, GFP_KERNEL,
MEMCG_RECLAIM_MAY_SWAP,  NULL);

But the tradeoff is that the callers need include/linux/nodemask.h.
But yes I can fix in the next version.
