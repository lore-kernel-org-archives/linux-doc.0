Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F4BC4321E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Dec 2022 21:32:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiLAVcV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Dec 2022 16:32:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231169AbiLAVcH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Dec 2022 16:32:07 -0500
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38B57ABA2C
        for <linux-doc@vger.kernel.org>; Thu,  1 Dec 2022 13:32:06 -0800 (PST)
Received: by mail-pg1-x549.google.com with SMTP id e37-20020a635025000000b00476bfca5d31so2732477pgb.21
        for <linux-doc@vger.kernel.org>; Thu, 01 Dec 2022 13:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IfDx/vZZhAqgLTBVAtZpOgxT3AMIFtwt/yJ9iwINIG4=;
        b=sbHSU0xyULWPTLXrm4btl81eBH5mc9EKqlCz8FBmg/OKAGvwye48d3zFEn0riuTVz+
         WI135Ntn79yhQRfKeyZF9J31eWKZKbKfBPuZ6/IMFzXeE7bgaaa2yAN6MEz3rn9BS3KN
         pNq4oLUFZmBCza5DExDhCrhY1gEBUmnnwuPGqI06j6cwAnmA9q0TDNzZ1mv8sSTIT1dN
         i7JlGJQmI3F0FeNp58IYU82p1+DN2kCgMsZWLPZ80EgvnJx/a3yI/cpU52DcBwD9efhB
         EZCOpNyNvSM5cmzqGWy8U39bvl1fJXnh98h4aU96DBsH01M0Va7s9KdyfDWD8Tiyn9Ie
         bEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IfDx/vZZhAqgLTBVAtZpOgxT3AMIFtwt/yJ9iwINIG4=;
        b=BuZgHrBauOsDW5HMMj7hXtuopdrvPjlX/DtCr2nXSP902yq7fKdWJnm+4+Ai1x7pP6
         GShtAbLm/eG89VGAP1njpck3IppuwWyINNL3sQMLjxZoEk3MG3FelW6jJVOFdMz9GMgL
         fiEmI8g+HC9AhHkISUpyKzyv6FK0hF2t/qrxpNYjb2+i6gBE5H7USC2d6jyS785RYWwS
         9M1aQ34maLHPya3YMKLzJzxHXcr/n8Evh+MrxZ7cee/bBm1gF0Us/mRtX8IXoVIyWdII
         60WaNHqyuVoV0Kul3f7F4/dvriEYtcAoQLfT5Cwy4nQxIGCQuiLctz8ALt7+x3hRqLxY
         Bz1Q==
X-Gm-Message-State: ANoB5plpuGusmrKWHArEL8aJ16INdSxasUteb6zu40kEKw/Ica/lPz4A
        tttQRSoSEoun8y+iOjEvf5d3wRy3PeBJEQ==
X-Google-Smtp-Source: AA0mqf6pgLZ9Fc+K/9bMs2AxM/jvaK3js6zpoUDFS4IqiABOk/6WhwnwrmgPz87CaWY8z9dGCinxzJhJXRwT3w==
X-Received: from shakeelb.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:262e])
 (user=shakeelb job=sendgmr) by 2002:a17:902:efd6:b0:189:94e6:6a8e with SMTP
 id ja22-20020a170902efd600b0018994e66a8emr18501696plb.72.1669930325681; Thu,
 01 Dec 2022 13:32:05 -0800 (PST)
Date:   Thu, 1 Dec 2022 21:32:02 +0000
In-Reply-To: <20221130020328.1009347-1-almasrymina@google.com>
Mime-Version: 1.0
References: <20221130020328.1009347-1-almasrymina@google.com>
Message-ID: <20221201213202.ycdaymwojd5plyrk@google.com>
Subject: Re: [RFC PATCH v2] mm: Add nodes= arg to memory.reclaim
From:   Shakeel Butt <shakeelb@google.com>
To:     Mina Almasry <almasrymina@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 29, 2022 at 06:03:27PM -0800, Mina Almasry wrote:
[...]
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 7b8e8e43806b..23fc5b523764 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -6735,7 +6735,8 @@ unsigned long mem_cgroup_shrink_node(struct mem_cgroup *memcg,
>  unsigned long try_to_free_mem_cgroup_pages(struct mem_cgroup *memcg,
>  					   unsigned long nr_pages,
>  					   gfp_t gfp_mask,
> -					   unsigned int reclaim_options)
> +					   unsigned int reclaim_options,
> +					   nodemask_t nodemask)

Can you please make this parameter a nodemask_t* and pass NULL instead
of NODE_MASK_ALL?
