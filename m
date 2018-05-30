Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 36F2A7DF8B
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 13:06:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753272AbeE3NGB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 09:06:01 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:53937 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751820AbeE3NGA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 09:06:00 -0400
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so47578163wmf.3
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 06:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=s+wGOMOwVsLdkkkRW9O1EzV7UEodCpv2M4FA2HXpkfc=;
        b=Ye4weASLGb+ahmxe/LKlfALAfc03OwZltTTPWSwW1SCgTjB7bGMId//Ud9aS4St07I
         L1XZrAuIdObNxRDb3gEzLhFl+VhYScXLVxLQiRF7QXFpyGkCJ5OnFIGaFMH5kmcgeh0a
         qixMvPEDH+LJSflm3awZqmtC6ZGaEORL7qFqDKC4jBf4j6F4xfHeaaLbTxX6X8Ss5U/z
         0+6gnd9nirqrqJJYR/WdmdxwCpyOolQeRCrHaSE6j61DPn/4iS4z1hVTTqfHrUvFNGlG
         VbjpjqELG4YxYnAFsLM2PlGhIqWES0soSE4UPCKxvlJCSt2+UVzEr8h8fUAzzh6hnHvH
         GwSw==
X-Gm-Message-State: ALKqPwdmHqY07j+Kpg7QVEZDq54S8VaxsIB5w6cIoFzr+h7UCTBMnuvs
        TwgLUT6DQNBv4D7ZnpwfeMnFfg==
X-Google-Smtp-Source: ADUXVKK/C8400AYfCS1VIwYqxvzMfytdlvnGQHjgXMFfWl1tcOqyfrsEL4DE4hd9MN+u0GdgNrTIlw==
X-Received: by 2002:a1c:aa0c:: with SMTP id t12-v6mr1521114wme.56.1527685559077;
        Wed, 30 May 2018 06:05:59 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id n18-v6sm11607441wrj.58.2018.05.30.06.05.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 06:05:58 -0700 (PDT)
Date:   Wed, 30 May 2018 15:05:55 +0200
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
Subject: Re: [PATCH v9 0/7] Enable cpuset controller in default hierarchy
Message-ID: <20180530130555.GD3320@localhost.localdomain>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <20180530101317.GB3320@localhost.localdomain>
 <d74c67ea-43c9-cabb-4303-ecff008412df@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d74c67ea-43c9-cabb-4303-ecff008412df@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 30/05/18 08:56, Waiman Long wrote:
> On 05/30/2018 06:13 AM, Juri Lelli wrote:
> > Hi,
> >
> > On 29/05/18 09:41, Waiman Long wrote:
> >> v9:
> >>  - Rename cpuset.sched.domain to cpuset.sched.domain_root to better
> >>    identify its purpose as the root of a new scheduling domain or
> >>    partition.
> >>  - Clarify in the document about the purpose of domain_root and
> >>    load_balance. Using domain_root is th only way to create new
> >>    partition.
> >>  - Fix a lockdep warning in update_isolated_cpumask() function.
> >>  - Add a new patch to eliminate call to generate_sched_domains() for
> >>    v2 when a change in cpu list does not touch a domain_root.
> > I was playing with this and ended up with the situation below:
> >
> >  g1/cgroup.controllers:cpuset
> >  g1/cgroup.events:populated 0
> >  g1/cgroup.max.depth:max
> >  g1/cgroup.max.descendants:max
> >  g1/cgroup.stat:nr_descendants 1
> >  g1/cgroup.stat:nr_dying_descendants 0
> >  g1/cgroup.subtree_control:cpuset
> >  g1/cgroup.type:domain
> >  g1/cpuset.cpus:0-5                   <---
> >  g1/cpuset.cpus.effective:0-5
> >  g1/cpuset.mems.effective:0-1
> >  g1/cpuset.sched.domain_root:1        <---
> >  g1/cpuset.sched.load_balance:1
> >  g1/cpu.stat:usage_usec 0
> >  g1/cpu.stat:user_usec 0
> >  g1/cpu.stat:system_usec 0
> >  g1/g11/cgroup.events:populated 0
> >  g1/g11/cgroup.max.descendants:max
> >  g1/g11/cpu.stat:usage_usec 0
> >  g1/g11/cpu.stat:user_usec 0
> >  g1/g11/cpu.stat:system_usec 0
> >  g1/g11/cgroup.type:domain
> >  g1/g11/cgroup.stat:nr_descendants 0
> >  g1/g11/cgroup.stat:nr_dying_descendants 0
> >  g1/g11/cpuset.cpus.effective:0-5
> >  g1/g11/cgroup.controllers:cpuset
> >  g1/g11/cpuset.sched.load_balance:1
> >  g1/g11/cpuset.mems.effective:0-1
> >  g1/g11/cpuset.cpus:6-11              <---
> >  g1/g11/cgroup.max.depth:max
> >  g1/g11/cpuset.sched.domain_root:0
> >
> > Should this be allowed? I was expecting subgroup g11 should be
> > restricted to a subset of g1's cpus.
> >
> > Best,
> >
> > - Juri
> 
> That shouldn't be allowed.The code is probably missing some checks that
> should have been done. What was the sequence of commands leading to the
> above configuration?

This is a E5-2609 v3 (12 cores) Fedora Server box (with systemd, so
first command is needed to be able to use cpuset controller with v2,
IIUC):

# umount /sys/fs/cgroup/cpuset 
# cd /sys/fs/cgroup/unified/
# echo "+cpuset" >cgroup.subtree_control 
# mkdir g1
# echo 0-5 >g1/cpuset.cpus
# echo 6-11 >init.scope/cpuset.cpus
# echo 6-11 >machine.slice/cpuset.cpus
# echo 6-11 >system.slice/cpuset.cpus
# echo 6-11 >user.slice/cpuset.cpus
# echo 1 >g1/cpuset.sched.domain_root 
# mkdir g1/g11
# echo "+cpuset" > g1/cgroup.subtree_control 
# echo 6-11 >g1/g11/cpuset.cpus
# grep -R . g1/*

That should be it. Am I doing something wrong?

Thanks,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
