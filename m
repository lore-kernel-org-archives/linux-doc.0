Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A6BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jul 2022 15:40:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236359AbiGYPkt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jul 2022 11:40:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236206AbiGYPk2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jul 2022 11:40:28 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 155D6DF6B
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 08:39:30 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id w29so8475045qtv.9
        for <linux-doc@vger.kernel.org>; Mon, 25 Jul 2022 08:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=q49/FuKBMY9BrFSyOdYu7NQvVCe0YeST3kjmGB5Jebc=;
        b=wMOPEo2m1JQMh3dBUqFbe5lY8LxfWG6fPXGDrdqEHSFUcJzQnUAVeC8JPzpmGhU2DD
         GmRQzqNKWqmcB+MBngjymjoTYeweUR+g6pdwuePAfwXPEzLdLiMynz4Op/QbILv0syfm
         HYESZLK0KUd96OJfMXrJo2Oojn9V9tW9oSYFsL0nWQFDupHFE+TcQg0/Hopixz2m0SKx
         hx160xziE1qr/k+/8PLHtIBOBl8nfno6jLrseP8rNA3dYUIjrWBbuokl2OrwW0RiNVsw
         JyUCrWzDh4+wTOey648I7qntYsxZ0n504171R6z9X9WXMd4Gph2zaHEegJ0Tyz2T0J1t
         msFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q49/FuKBMY9BrFSyOdYu7NQvVCe0YeST3kjmGB5Jebc=;
        b=PSTfVoc2+KJwb0KyTe2l8pxAunwxPlaGa5AyiTJeGxPNPFgLTAywrsLQb3OInpmL9V
         lc0pQ/i7Ta13vHl9cevhrZ0Vx0XhajchDDWsYxDPi6TpkOUMwFmR5uOe5apg9nAGva2O
         le99EX3JECvw9kkNFJSb6ii5KPHUpwfw6xh1DjISi3+m87Z3hM2mO49zuMYE8l/Rzib4
         xAmACVwwLeu1mxgm/uelFDHrCsiDFWdBwL0HqN0cn6rLkBoboGCxj1/vDPBZe+gcGRRm
         G/yn1kcedx6mTmWGnz6SsYDb6IIHreYCyIxsprAzS+YniUji4OzZCqMxcRajINNPxPGx
         T3oQ==
X-Gm-Message-State: AJIora83ubSqaO8m0IEsL0N1nIFLaH+wxHQMCAQ2khs0YSR0Q9KKOw9a
        di+LAyWe1ipM7zCdh3ihM3ZkUA==
X-Google-Smtp-Source: AGRyM1sKiIIcwi9cZ9UgeKXgB0vfxXN8YKSlCxL36X9IFAsF+zOv6S7ypdePavJRNOhMDxq1u3esRg==
X-Received: by 2002:ac8:5d49:0:b0:31f:273a:a959 with SMTP id g9-20020ac85d49000000b0031f273aa959mr10816805qtx.409.1658763565123;
        Mon, 25 Jul 2022 08:39:25 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:994f])
        by smtp.gmail.com with ESMTPSA id a4-20020ac87204000000b0031edf8d57bfsm7562394qtp.46.2022.07.25.08.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 08:39:24 -0700 (PDT)
Date:   Mon, 25 Jul 2022 11:39:24 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Chengming Zhou <zhouchengming@bytedance.com>
Cc:     surenb@google.com, mingo@redhat.com, peterz@infradead.org,
        tj@kernel.org, corbet@lwn.net, akpm@linux-foundation.org,
        rdunlap@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org
Subject: Re: [PATCH 1/9] sched/psi: fix periodic aggregation shut off
Message-ID: <Yt65LEyN83mTGxwF@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-2-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721040439.2651-2-zhouchengming@bytedance.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 21, 2022 at 12:04:31PM +0800, Chengming Zhou wrote:
> @@ -871,13 +861,23 @@ void psi_task_switch(struct task_struct *prev, struct task_struct *next,
>  				clear |= TSK_MEMSTALL_RUNNING;
>  			if (prev->in_iowait)
>  				set |= TSK_IOWAIT;
> +
> +			/*
> +			 * Periodic aggregation shuts off if there is a period of no
> +			 * task changes, so we wake it back up if necessary. However,
> +			 * don't do this if the task change is the aggregation worker
> +			 * itself going to sleep, or we'll ping-pong forever.
> +			 */
> +			if (unlikely((prev->flags & PF_WQ_WORKER) &&
> +				     wq_worker_last_func(prev) == psi_avgs_work))
> +				wake_clock = false;
>  		}
>  
>  		psi_flags_change(prev, clear, set);
>  
>  		iter = NULL;
>  		while ((group = iterate_groups(prev, &iter)) && group != common)
> -			psi_group_change(group, cpu, clear, set, now, true);
> +			psi_group_change(group, cpu, clear, set, now, wake_clock);
>  
>  		/*
>  		 * TSK_ONCPU is handled up to the common ancestor. If we're tasked

Wait, there is another psi_group_change() below this, which handles
the clearing of TSK_RUNNING for common ancestors. We don't want to
wake those either, so it needs s/true/wake_clock/ as well.
