Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9FA627D0DA
	for <lwn-linux-doc@archive.lwn.net>; Thu, 22 Mar 2018 08:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752739AbeCVIl1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 22 Mar 2018 04:41:27 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45341 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752643AbeCVIlY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Mar 2018 04:41:24 -0400
Received: by mail-wr0-f194.google.com with SMTP id h2so7782494wre.12
        for <linux-doc@vger.kernel.org>; Thu, 22 Mar 2018 01:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=K9eRs8oQt7ZMsTAbCeMUDvLjmiixntJZUQbxVER8Qtc=;
        b=bwyFShLQiovslpyfMK561EoTP8Y0y/WeSaBopKyI/5g1thaef91wY/NvjKdsQ1rRdI
         gUm1PK7WvzYcbuk9FpSX5VlZVcx2BBSwcJIR6/fco8l0RBQ9uiiZNGtUTEpPgD/ncoCw
         zmA+vBeo8RVgovDpH1to4Dcs26wAqpmclb/yhhz+gXAJpon6zw+eMBJ6lV1C8NbDF+iC
         WpSgZDcByckbIEedzqkQGmG1NCxHMRhhUvKBOZWcrJX8zdbgBdZWktBS8i4Gu8hQ6/pI
         /0DAttpD5ujfQ+w6Um6zzbdfDToA18HafB/Lerdc9hB+N+5dfoaEy9SMMQMouqskkdxl
         8ouA==
X-Gm-Message-State: AElRT7GwZI1Q34xyg8Q2LeWkmkJol2f24SybZFUXNuEeQfowtXdihG0N
        fIOUlOn2ww0Avs0/s/71PeSVQGG/Bwo=
X-Google-Smtp-Source: AG47ELuk6rclMq56y+g6PJGg79/kigtnzgFry1rYLlOWzqN2dPHeVxO8UMi5HX//A66wIOghuh6djA==
X-Received: by 10.223.139.68 with SMTP id v4mr19629843wra.23.1521708083417;
        Thu, 22 Mar 2018 01:41:23 -0700 (PDT)
Received: from localhost.localdomain ([151.15.242.31])
        by smtp.gmail.com with ESMTPSA id r82sm6055414wme.31.2018.03.22.01.41.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Mar 2018 01:41:22 -0700 (PDT)
Date:   Thu, 22 Mar 2018 09:41:20 +0100
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v6 2/2] cpuset: Add cpuset.sched_load_balance to v2
Message-ID: <20180322084120.GE7231@localhost.localdomain>
References: <1521649309-26690-1-git-send-email-longman@redhat.com>
 <1521649309-26690-3-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521649309-26690-3-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Waiman,

On 21/03/18 12:21, Waiman Long wrote:
> The sched_load_balance flag is needed to enable CPU isolation similar
> to what can be done with the "isolcpus" kernel boot parameter.
> 
> The sched_load_balance flag implies an implicit !cpu_exclusive as
> it doesn't make sense to have an isolated CPU being load-balanced in
> another cpuset.
> 
> For v2, this flag is hierarchical and is inherited by child cpusets. It
> is not allowed to have this flag turn off in a parent cpuset, but on
> in a child cpuset.
> 
> This flag is set by the parent and is not delegatable.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  Documentation/cgroup-v2.txt | 22 ++++++++++++++++++
>  kernel/cgroup/cpuset.c      | 56 +++++++++++++++++++++++++++++++++++++++------
>  2 files changed, 71 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/cgroup-v2.txt b/Documentation/cgroup-v2.txt
> index ed8ec66..c970bd7 100644
> --- a/Documentation/cgroup-v2.txt
> +++ b/Documentation/cgroup-v2.txt
> @@ -1514,6 +1514,28 @@ Cpuset Interface Files
>  	it is a subset of "cpuset.mems".  Its value will be affected
>  	by memory nodes hotplug events.
>  
> +  cpuset.sched_load_balance
> +	A read-write single value file which exists on non-root cgroups.
> +	The default is "1" (on), and the other possible value is "0"
> +	(off).
> +
> +	When it is on, tasks within this cpuset will be load-balanced
> +	by the kernel scheduler.  Tasks will be moved from CPUs with
> +	high load to other CPUs within the same cpuset with less load
> +	periodically.
> +
> +	When it is off, there will be no load balancing among CPUs on
> +	this cgroup.  Tasks will stay in the CPUs they are running on
> +	and will not be moved to other CPUs.
> +
> +	This flag is hierarchical and is inherited by child cpusets. It
> +	can be turned off only when the CPUs in this cpuset aren't
> +	listed in the cpuset.cpus of other sibling cgroups, and all
> +	the child cpusets, if present, have this flag turned off.
> +
> +	Once it is off, it cannot be turned back on as long as the
> +	parent cgroup still has this flag in the off state.
> +

I'm afraid that this will not work for SCHED_DEADLINE (at least for how
it is implemented today). As you can see in Documentation [1] the only
way a user has to perform partitioned/clustered scheduling is to create
subset of exclusive cpusets and then assign deadline tasks to them. The
other thing to take into account here is that a root_domain is created
for each exclusive set and we use such root_domain to keep information
about admitted bandwidth and speed up load balancing decisions (there is
a max heap tracking deadlines of active tasks on each root_domain).

Now, AFAIR distinct root_domain(s) are created when parent group has
sched_load_balance disabled and cpus_exclusive set (in cgroup v1 that
is). So, what we normally do is create, say, cpus_exclusive groups for
the different clusters and then disable sched_load_balance at root level
(so that each cluster gets its own root_domain). Also,
sched_load_balance is enabled in children groups (as load balancing
inside clusters is what we actually needed :).

IIUC your proposal this will not be permitted with cgroup v2 because
sched_load_balance won't be present at root level and children groups
won't be able to set sched_load_balance back to 1 if that was set to 0
in some parent. Is that true?

Look, the way things work today is most probably not perfect (just to
say one thing, we need to disable load balancing for all classes at root
level just because DEADLINE wants to set restricted affinities to his
tasks :/) and we could probably think on how to change how this all
work. So, let's first see if IIUC what you are proposing (and its
implications). :)

Best,

- Juri

[1] https://elixir.bootlin.com/linux/v4.16-rc6/source/Documentation/scheduler/sched-deadline.txt#L640
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
