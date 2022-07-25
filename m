Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48A34C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 16:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiGYQwX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 12:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234845AbiGYQwW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 12:52:22 -0400
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com [IPv6:2607:f8b0:4864:20::f33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E2411D0CD
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:52:19 -0700 (PDT)
Received: by mail-qv1-xf33.google.com with SMTP id t7so8837861qvz.6
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 09:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j0BaZSzqD5eIgwyip/HS4aDnwW9Jp806htc77k2W+9I=;
        b=YrRC8+DcvcJ+j3/daDEZUkXI7wwrYxc1PEjLb5WJCKV4hOP1uHTC/ifMwxGxMiDkfx
         /A82VqK1LTw9pVhvRXWQeyXrrPJ2ZvCuG5iWP7cY8NmWkKUfWofwwTglQWitP4sLRpre
         NB5VpzmQIT0yR8C+q/8SpRe6N4qEXuOmhz9/zyJDdIRw6IQfETk2K2RZNRdauaalnISk
         ecXU6u6eJyO8O/HQW59YX4MJEK3q8L7+iGwgT+B0Xfmvz2s9vSCXiUlMoZjDizM7CmZj
         Pva3rt58bJXcA2sOVprKVekCrokJioAdbUfKQmHTFPMiKttfucAsODDHed2z6c5VspUe
         9oNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j0BaZSzqD5eIgwyip/HS4aDnwW9Jp806htc77k2W+9I=;
        b=7Npyv6YzDvEVhI8seCVW1BwX68LDmH0wQ4tAx5va9o+zyRn9nSkGBp2P6SwrxqX8Kb
         EJvu+8qnsXfHfq2uLdjDsVnQH5b4cNP6AHiPNIy+n5eOtps9tlX/Esx1KmEEavRhWUBu
         lp4j/A3X2JNLQdVajClBTEqozawqwHnu0YB8HR+hbU2XGP4t7bM82YEKYydVcxvqieyV
         Sa1XvSmBiIlIBQoFAbPvxI0afSkQGpjbQumpr1bHypZds6clbYQz4K+qAyzlXojAKfxN
         d4/MYaFhNZyjaKss+KbvKtU5D+b8sIq12RcYfoiRNTWzieKiOexon69s2d5Se/NkKlSi
         CMHg==
X-Gm-Message-State: AJIora8sXCQkozhXhfRE172E98yx1yNUV/Ogsig40hE+HXJGnbWBnZSq
        +Z2V6OeqPD2w6d3i1d+yoYdn/g==
X-Google-Smtp-Source: AGRyM1uv3LFH6aM79vzCkplcfzTZ3m25YJ7ns1XG6o8aG/GGTPTrtN6PwrSDI9Hn7ptl4H/XTiIloQ==
X-Received: by 2002:ad4:5de4:0:b0:474:2384:a0e9 with SMTP id jn4-20020ad45de4000000b004742384a0e9mr11516834qvb.79.1658767938522;
        Mon, 25 Jul 2022 09:52:18 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id u20-20020ac858d4000000b00304f3e320f2sm7915678qta.4.2022.07.25.09.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 09:52:18 -0700 (PDT)
Date:   Mon, 25 Jul 2022 12:52:17 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 8/9] sched/psi: add kernel cmdline parameter
 psi_inner_cgroup
Message-ID: <Yt7KQc0nnOypB2b2@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-9-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-9-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:38PM +0800, Chengming Zhou wrote:
> PSI accounts stalls for each cgroup separately and aggregates it
> at each level of the hierarchy. This may case non-negligible overhead
> for some workloads when under deep level of the hierarchy.
> 
> commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
> make PSI to skip per-cgroup stall accounting, only account system-wide
> to avoid this each level overhead.
> 
> For our use case, we also want leaf cgroup PSI accounted for userspace
> adjustment on that cgroup, apart from only system-wide management.

I hear the overhead argument. But skipping accounting in intermediate
levels is a bit odd and unprecedented in the cgroup interface. Once we
do this, it's conceivable people would like to do the same thing for
other stats and accounting, like for instance memory.stat.

Tejun, what are your thoughts on this?
