Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7790A7D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 14:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753330AbeE3OAc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 10:00:32 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45711 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752784AbeE3OAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 10:00:30 -0400
Received: by mail-wr0-f194.google.com with SMTP id w3-v6so29636264wrl.12
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 07:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6o4B/aKiSCT++xp+skqVtpMW8FA3FCDUvV6yv1CbUd0=;
        b=IsBGpRHDxbkcCKYak1gL3ehCKJKAJ4julnRESlR6nDwtJ7GwB9EA0pzfx2CD8Kn2Ps
         DoxOgVURcqr3o2e7jX7PlWUnobfiVdP9RvMLdTONBDP/C/JEZaxwO7P2t7JJA+3T0Qbu
         DQieE9capYthZMDYjaShpJ11AQN07QUJhr8KnduTxomJsoiT0DwFM7rz5MnSitsGXvYF
         OZK4MkUL5BMzgg+4hZwxcvJBEOmbNDzc4yVfLueQEg6bMyS7nn+pTutlzmU/p5kOiFTb
         MbzE4NPLZtk0LTVuYDAh+dTDL0wHeihBL+V6yahsJ/GMpBePald56WTrAjaNyLAdUd7w
         rJmg==
X-Gm-Message-State: ALKqPwf3jnoFtHFOQ/9gKigL3R4VdH/MajG5L1x+qUEtdH0XLzQWQ8wF
        eDjTrJJ2xbaTlW9iiedDwxJPIg==
X-Google-Smtp-Source: ADUXVKIniajK8YWwnRZ4dgIXKWk7pG0eH7DhSUUCmOPt2Bv+bJ++Dee1w1wWYGBhiVH5eb097ue6uA==
X-Received: by 2002:adf:e20b:: with SMTP id j11-v6mr2273032wri.205.1527688829638;
        Wed, 30 May 2018 07:00:29 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id a14-v6sm48953214wra.84.2018.05.30.07.00.28
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 07:00:29 -0700 (PDT)
Date:   Wed, 30 May 2018 16:00:21 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
Message-ID: <20180530140021.GF3320@localhost.localdomain>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527687991-1431-1-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 30/05/18 09:46, Waiman Long wrote:
> It was found that the cpuset.cpus could contain CPUs that are not listed
> in their parent's cpu list as shown by the command sequence below:
> 
>   # echo "+cpuset" >cgroup.subtree_control
>   # mkdir g1
>   # echo 0-5 >g1/cpuset.cpus
>   # mkdir g1/g11
>   # echo "+cpuset" > g1/cgroup.subtree_control
>   # echo 6-11 >g1/g11/cpuset.cpus
>   # grep -R . g1 | grep "\.cpus"
>   g1/cpuset.cpus:0-5
>   g1/cpuset.cpus.effective:0-5
>   g1/g11/cpuset.cpus:6-11
>   g1/g11/cpuset.cpus.effective:0-5
> 
> As the intersection of g11's cpus and that of g1 is empty, the effective
> cpus of g11 is just that of g1. The check in update_cpumask() is now
> corrected to make sure that cpus in a child cpus must be a subset of
> its parent's cpus. The error "write error: Invalid argument" will now
> be reported in the above case.
> 
> Reported-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Waiman Long <longman@redhat.com>

Looks like it fixes the bug.

Reviewed-and-Tested-by: Juri Lelli <juri.lelli@redhat.com>

Thanks,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
