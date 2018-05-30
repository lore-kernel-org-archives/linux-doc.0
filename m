Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42E8C7DF87
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 14:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753276AbeE3OSK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 10:18:10 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:37135 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752705AbeE3OSI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 10:18:08 -0400
Received: by mail-wm0-f68.google.com with SMTP id l1-v6so48157192wmb.2
        for <linux-doc@vger.kernel.org>; Wed, 30 May 2018 07:18:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+V4Rsh8pOxSsCp1mtML0Wy55agZUU0DSuhWOj4+rZXQ=;
        b=NkllEi6Uas71xsZFOOe8L4Eee41qa0hkH3CecQ3R79mpWa8R43B+SFy/Iza4uZdFtw
         xEyE5ZL3RjCQya60HViRi4HjLuGQkQcI+bSr012vhA6CVjNGYBU4HiWkB+YrBvV2tRAU
         MGmicXvGq6EAL5M1ZuzboSyGBzX+HxcQCFtLr8rcAF+77Voi91auPft8KFP+YgS6qA7G
         lsIzpcfOSERs/x6toRCMZyi+o63HYm6P43Tb8DxUdmTlgACmulERUWD1S6FEL4TZZghN
         VL/v07PPiOIn78cWlm8nhqekt0V3PVQ6cQZrJKTrjn6Ah0RhRQJltzbr9sKEqfFwj35p
         uyJA==
X-Gm-Message-State: ALKqPwe13C5RvGtZx/N4XSRKhjdnUVEwi2xjhWbCiNXlq+cpb8YGCOEV
        pwY5dv1jZRZkXl+IpTqc9E+dHw==
X-Google-Smtp-Source: ADUXVKIXWLZdzo8pC2x6TllLmzJAhLWWmeoreIIIRHuYIY5NigE/xk8PfRaope4KBD6AULzhxWQQsw==
X-Received: by 2002:a1c:8692:: with SMTP id i140-v6mr1559353wmd.11.1527689887319;
        Wed, 30 May 2018 07:18:07 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id k17-v6sm2861362wmc.23.2018.05.30.07.18.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 07:18:06 -0700 (PDT)
Date:   Wed, 30 May 2018 16:18:04 +0200
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
Subject: Re: [PATCH v9 2/7] cpuset: Add new v2 cpuset.sched.domain_root flag
Message-ID: <20180530141804.GG3320@localhost.localdomain>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-3-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527601294-3444-3-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 29/05/18 09:41, Waiman Long wrote:

[...]

> +  cpuset.sched.domain_root
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or "1" (on).  This flag is set by the parent
> +	and is not delegatable.
> +
> +	If set, it indicates that the current cgroup is the root of a
> +	new scheduling domain or partition that comprises itself and
> +	all its descendants except those that are scheduling domain
> +	roots themselves and their descendants.  The root cgroup is
> +	always a scheduling domain root.
> +
> +	There are constraints on where this flag can be set.  It can
> +	only be set in a cgroup if all the following conditions are true.
> +
> +	1) The "cpuset.cpus" is not empty and the list of CPUs are
> +	   exclusive, i.e. they are not shared by any of its siblings.
> +	2) The parent cgroup is also a scheduling domain root.
> +	3) There is no child cgroups with cpuset enabled.  This is
> +	   for eliminating corner cases that have to be handled if such
> +	   a condition is allowed.
> +
> +	Setting this flag will take the CPUs away from the effective
> +	CPUs of the parent cgroup.  Once it is set, this flag cannot
> +	be cleared if there are any child cgroups with cpuset enabled.
> +	Further changes made to "cpuset.cpus" is allowed as long as
> +	the first condition above is still true.

IIUC, with the configuration below

 cpuset.cpus.effective:6-11
 cgroup.controllers:cpuset
 cpuset.mems.effective:0-1
 cgroup.subtree_control:cpuset
 g1/cpuset.cpus.effective:0-5
 g1/cgroup.controllers:cpuset
 g1/cpuset.sched.load_balance:1
 g1/cpuset.mems.effective:0-1
 g1/cpuset.cpus:0-5
 g1/cpuset.sched.domain_root:1
 user.slice/cpuset.cpus.effective:6-11
 user.slice/cgroup.controllers:cpuset
 user.slice/cpuset.sched.load_balance:1
 user.slice/cpuset.mems.effective:0-1
 user.slice/cpuset.cpus:6-11
 user.slice/cpuset.sched.domain_root:0
 init.scope/cpuset.cpus.effective:6-11
 init.scope/cgroup.controllers:cpuset
 init.scope/cpuset.sched.load_balance:1
 init.scope/cpuset.mems.effective:0-1
 init.scope/cpuset.cpus:6-11
 init.scope/cpuset.sched.domain_root:0
 system.slice/cpuset.cpus.effective:6-11
 system.slice/cgroup.controllers:cpuset
 system.slice/cpuset.sched.load_balance:1
 system.slice/cpuset.mems.effective:0-1
 system.slice/cpuset.cpus:6-11
 system.slice/cpuset.sched.domain_root:0
 machine.slice/cpuset.cpus.effective:6-11
 machine.slice/cgroup.controllers:cpuset
 machine.slice/cpuset.sched.load_balance:1
 machine.slice/cpuset.mems.effective:0-1
 machine.slice/cpuset.cpus:6-11
 machine.slice/cpuset.sched.domain_root:0

I should be able to

 # echo 0-4 >g1/cpuset.cpus

?

It doesn't let me.

I'm not sure we actually want to allow that, but that's what would I
expect as per your text above.

Thanks,

- Juri

BTW: thanks a lot for your prompt feedback and hope it's OK if I keep
playing and asking questions. :)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
