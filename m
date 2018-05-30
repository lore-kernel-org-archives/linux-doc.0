Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 67E247D085
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 10:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751767AbeE3KNY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 06:13:24 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:50419 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751311AbeE3KNV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 06:13:21 -0400
Received: by mail-wm0-f66.google.com with SMTP id t11-v6so46837467wmt.0
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 03:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mqcRbUrhn+rQzXos0FXzsNpb9d0KMqZFiUIE0Bm3pFY=;
        b=W+PB2XU4q7R2lY5qevJoA7pyDnkd8xrIHnQoVcAcDOWKFYsVj1fTW6RKmvzYgXp2pr
         s6AaJCkvMaOGGUT6wwpT0nEpKN/WCYmfC6HcZH3T742QQvKdeRnhH3O/ydNuZ0I7XJhs
         EjqqHpPNawrnhaeG2Clp9LUsNIIuAbG0UAOsUvFnt68dPmG3XJ3X59JX+pBxvulzxIu4
         gdwsRhGKyjMsYXmRzjaAVvVF2xqGwCFBOG6t5fb/K1m5JrkOBRElsA1nyBTq9UzGcNtI
         vR31KUDaA5ViARrDHTq+m6aRqHM+GspSyCmXSzjW9sJ0UR+SEokFOlgI8rjwkTZs0Js/
         1paQ==
X-Gm-Message-State: ALKqPwe4OXK3iD6M088SLClTSOJQvnocN2rXUDOk+oelRBIZM0aGaxGW
        FALOvOirQ2WEm28plH272nm8jA==
X-Google-Smtp-Source: ADUXVKKdMT4fh4NwEWe/ixqoRVokcCyMDmzs/kzISk5Pz7gzvHVPXxyVI3BM72WHEatrdT0T6sCEIw==
X-Received: by 2002:a1c:c006:: with SMTP id q6-v6mr866434wmf.107.1527675200676;
        Wed, 30 May 2018 03:13:20 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id 131-v6sm24369445wms.34.2018.05.30.03.13.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 03:13:19 -0700 (PDT)
Date:   Wed, 30 May 2018 12:13:17 +0200
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
Message-ID: <20180530101317.GB3320@localhost.localdomain>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527601294-3444-1-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 29/05/18 09:41, Waiman Long wrote:
> v9:
>  - Rename cpuset.sched.domain to cpuset.sched.domain_root to better
>    identify its purpose as the root of a new scheduling domain or
>    partition.
>  - Clarify in the document about the purpose of domain_root and
>    load_balance. Using domain_root is th only way to create new
>    partition.
>  - Fix a lockdep warning in update_isolated_cpumask() function.
>  - Add a new patch to eliminate call to generate_sched_domains() for
>    v2 when a change in cpu list does not touch a domain_root.

I was playing with this and ended up with the situation below:

 g1/cgroup.controllers:cpuset
 g1/cgroup.events:populated 0
 g1/cgroup.max.depth:max
 g1/cgroup.max.descendants:max
 g1/cgroup.stat:nr_descendants 1
 g1/cgroup.stat:nr_dying_descendants 0
 g1/cgroup.subtree_control:cpuset
 g1/cgroup.type:domain
 g1/cpuset.cpus:0-5                   <---
 g1/cpuset.cpus.effective:0-5
 g1/cpuset.mems.effective:0-1
 g1/cpuset.sched.domain_root:1        <---
 g1/cpuset.sched.load_balance:1
 g1/cpu.stat:usage_usec 0
 g1/cpu.stat:user_usec 0
 g1/cpu.stat:system_usec 0
 g1/g11/cgroup.events:populated 0
 g1/g11/cgroup.max.descendants:max
 g1/g11/cpu.stat:usage_usec 0
 g1/g11/cpu.stat:user_usec 0
 g1/g11/cpu.stat:system_usec 0
 g1/g11/cgroup.type:domain
 g1/g11/cgroup.stat:nr_descendants 0
 g1/g11/cgroup.stat:nr_dying_descendants 0
 g1/g11/cpuset.cpus.effective:0-5
 g1/g11/cgroup.controllers:cpuset
 g1/g11/cpuset.sched.load_balance:1
 g1/g11/cpuset.mems.effective:0-1
 g1/g11/cpuset.cpus:6-11              <---
 g1/g11/cgroup.max.depth:max
 g1/g11/cpuset.sched.domain_root:0

Should this be allowed? I was expecting subgroup g11 should be
restricted to a subset of g1's cpus.

Best,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
