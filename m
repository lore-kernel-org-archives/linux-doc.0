Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6FE4C4338F
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:48:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BFF7F61019
	for <linux-doc@archiver.kernel.org>; Wed, 11 Aug 2021 18:48:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhHKSst (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 11 Aug 2021 14:48:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhHKSst (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Aug 2021 14:48:49 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27284C0613D5
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 11:48:25 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id x12so1667553qvo.12
        for <linux-doc@vger.kernel.org>; Wed, 11 Aug 2021 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QXzKXvFp1VaOu436UKEuohFjo8wrYLVba4+cewsAvpA=;
        b=u100rSlqWXrGMEJnMlU3PRU56IUsCPjCokscAfgDNwK+higO44digKOiRDj5BQSPpM
         ZS58RGwL7C8iNB60vAmnsqFazlSEsmtXaQOBkf+X74GwqjHkEbSNLAWQsAcs5V5kRRqI
         JUid3RalT/VT5LESVj2bhx3WcKdSyKkKPt4UKRPSqi8r8ju/snUnvUjNtIQfCg0uhTMp
         TCXMz0SZZynSwM7sKSGAfkAOZqT/FUwkuG5zT4IaShb7FRMwq2tts3yTsBsu+zx0T6q3
         XXZycBqy9JAk5jNE2JK+C5crsaJP4+nxLDWo32qzl2i7pk7LsFUOet4dY9Z6jjSBUYm+
         u0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QXzKXvFp1VaOu436UKEuohFjo8wrYLVba4+cewsAvpA=;
        b=ObL1UrCefn0XmOye3AeHPEG4AR3XDqyjqYiUXenXI1V2thbFM7yOxN1n9I5y8B7T/0
         xCptU1WHQ5PZIz+3NwW6Pp92GfWOiAs5+x2jkSJGss/X3GnRrcRWWAxHVyP7p/JwGw0P
         EBwEgxFsJaNuHfKfWB/2KktLzTACNIJSGTOv9f/28X5CWZUMb6Z55dmyUC+6ho69V4D/
         LpYMdMMa8S6xuUzJXqVzHkM2ixkPjn3KPiMdpjHBn15EqAG/fXLKOyw/LIsXZ2TmYEvy
         aUvindOV5k1KiqCreavB8jxoJ4Zuj1ecuyaKKhxIqplG6WKM1lnEixpNUoLEdlL83DTK
         nVUA==
X-Gm-Message-State: AOAM533zKD/3Tpycj2bT+sbMaorXMSZZsJh33cPOeEVIi2xN2PJCJNFz
        L70la+/7t+XyTkbzaqbQUlxJHA==
X-Google-Smtp-Source: ABdhPJyWn4X+uyzoMtbmfnwzp3LCwRx5aYuUQZj4R2Ml+aXeDMIkWiyWJn4gv55p1ioBHtAUt/EsXw==
X-Received: by 2002:a0c:e84a:: with SMTP id l10mr55172qvo.3.1628707704201;
        Wed, 11 Aug 2021 11:48:24 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:d9fa])
        by smtp.gmail.com with ESMTPSA id u3sm8098767qke.95.2021.08.11.11.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:48:23 -0700 (PDT)
Date:   Wed, 11 Aug 2021 14:48:21 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] cgroup/cpuset: Enable memory migration for cpuset v2
Message-ID: <YRQbdTgprUJyuis7@cmpxchg.org>
References: <20210811163035.1977-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811163035.1977-1-longman@redhat.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 11, 2021 at 12:30:35PM -0400, Waiman Long wrote:
> When a user changes cpuset.cpus, each task in a v2 cpuset will be moved
> to one of the new cpus if it is not there already. For memory, however,
> they won't be migrated to the new nodes when cpuset.mems changes. This is
> an inconsistency in behavior.
> 
> In cpuset v1, there is a memory_migrate control file to enable such
> behavior by setting the CS_MEMORY_MIGRATE flag. Make it the default
> for cpuset v2 so that we have a consistent set of behavior for both
> cpus and memory.
> 
> There is certainly a cost to make memory migration the default, but it
> is a one time cost that shouldn't really matter as long as cpuset.mems
> isn't changed frequenty.  Update the cgroup-v2.rst file to document the
> new behavior and recommend against changing cpuset.mems frequently.
> 
> Since there won't be any concurrent access to the newly allocated cpuset
> structure in cpuset_css_alloc(), we can use the cheaper non-atomic
> __set_bit() instead of the more expensive atomic set_bit().
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 6 ++++++
>  kernel/cgroup/cpuset.c                  | 6 +++++-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 5c7377b5bd3e..47c832ad1322 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2056,6 +2056,12 @@ Cpuset Interface Files
>  	The value of "cpuset.mems" stays constant until the next update
>  	and won't be affected by any memory nodes hotplug events.
>  
> +	Setting a non-empty value to "cpuset.mems" causes memory of
> +	tasks within the cgroup to be migrated to the designated nodes if
> +	they are currently using memory outside of the designated nodes.
> +	There is a cost for this migration.  So "cpuset.mems" shouldn't
> +	be changed frequently.

The migration skips over pages that are (temporarily) off the LRU for
reclaim, compaction etc. so it can leave random pages behind.

In practice it's probably fine, but it probably makes sense to say
it's advisable to set this config once before the workload launches
for best results, and not rely too much on changing things around
post-hoc, due to cost you pointed out but also due to reliability.

Otherwise no objection from me.
