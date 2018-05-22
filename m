Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F3927D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 13:54:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751214AbeEVNxz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 09:53:55 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39861 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751229AbeEVNxx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 09:53:53 -0400
Received: by mail-wm0-f65.google.com with SMTP id f8-v6so33920444wmc.4
        for <linux-doc@vger.kernel.org>; Tue, 22 May 2018 06:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xlW2EEmJB3In71duW8IETr1jmg5vnf032sxB7t6mE5Q=;
        b=q2K15nMgKj/41iCLSK1lgXjDcvghjpSJSqEUCy2APCWAK6kzXT/bDinNc99C3Rm2kI
         l5JbL5IA/4e9W1L8l3p/Akn5PWQmh76W+om9huIemlisIgRuYnf27/zxYgFKnwAaPaY+
         17MFFmslDqit6O6trfzG6727pskVCqa2lmYu2XC9r5Ll64E6TBoXWAc9q41ZPxR2loAW
         PrS0Gy6vLRwHk+5I+UKffdV/oy7TEhdUqZFyojBghNaY3tni5G9PrCAB/hse/tXoQWmq
         eLvxN+fJRTdLig+JB+7PaLmsSVZRJYg3zXZ8gj2NQWBctm0lC6BONDvNVGUnDfGSEWdQ
         mPwg==
X-Gm-Message-State: ALKqPwdXKLXB7H3WI77OmfBvQQk8Tzl7vPUG7VAsUjNL/5LrKSDs4V0T
        RxFs60JHaWlmVqhsmiPUZhIkzw==
X-Google-Smtp-Source: AB8JxZpX94JIU2c3M/LNAM1G812Sd6sZtzsMRPIPQ5SBG3WyGo25xRhY2TtPug7s8yztilCG/AmkfA==
X-Received: by 2002:a1c:b943:: with SMTP id j64-v6mr1215594wmf.30.1526997232308;
        Tue, 22 May 2018 06:53:52 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id d12-v6sm10705453wre.39.2018.05.22.06.53.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 06:53:51 -0700 (PDT)
Date:   Tue, 22 May 2018 15:53:49 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v8 6/6] cpuset: Allow reporting of sched domain
 generation info
Message-ID: <20180522135349.GB31040@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-7-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526590545-3350-7-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 17/05/18 16:55, Waiman Long wrote:
> This patch enables us to report sched domain generation information.
> 
> If DYNAMIC_DEBUG is enabled, issuing the following command
> 
>   echo "file cpuset.c +p" > /sys/kernel/debug/dynamic_debug/control
> 
> and setting loglevel to 8 will allow the kernel to show what scheduling
> domain changes are being made.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index fb8aa82b..8f586e8 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -820,6 +820,12 @@ static int generate_sched_domains(cpumask_var_t **domains,
>  	}
>  	BUG_ON(nslot != ndoms);
>  
> +#ifdef CONFIG_DEBUG_KERNEL
> +	for (i = 0; i < ndoms; i++)
> +		pr_debug("generate_sched_domains dom %d: %*pbl\n", i,
> +			 cpumask_pr_args(doms[i]));
> +#endif
> +

While I'm always in favor of adding debug output, in this case I'm not
sure it's adding much to what we already print when booting with
sched_debug kernel command-line param, e.g.

--->8---
 Kernel command line: BOOT_IMAGE=/vmlinuz-4.17.0-rc5+ ... sched_debug

[...]

 smp: Bringing up secondary CPUs ...
 x86: Booting SMP configuration:
 .... node  #0, CPUs:        #1  #2  #3  #4  #5
 .... node  #1, CPUs:    #6  #7  #8  #9 #10 #11
 smp: Brought up 2 nodes, 12 CPUs
 smpboot: Max logical packages: 2
 smpboot: Total of 12 processors activated (45636.50 BogoMIPS)
 CPU0 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 0:{ span=0 cap=1016 }, 1:{ span=1 cap=1011 }, 2:{ span=2 }, 3:{ span=3 cap=1023 }, 4:{ span=4 }, 5:{ span=5 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU1 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 1:{ span=1 cap=1011 }, 2:{ span=2 }, 3:{ span=3 cap=1023 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 cap=1016 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU2 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 2:{ span=2 }, 3:{ span=3 cap=1023 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 cap=1016 }, 1:{ span=1 cap=1011 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU3 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 3:{ span=3 cap=1023 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 cap=1016 }, 1:{ span=1 cap=1011 }, 2:{ span=2 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU4 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 cap=1016 }, 1:{ span=1 cap=1011 }, 2:{ span=2 }, 3:{ span=3 cap=1023 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU5 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 5:{ span=5 }, 0:{ span=0 cap=1016 }, 1:{ span=1 cap=1011 }, 2:{ span=2 }, 3:{ span=3 cap=1023 }, 4:{ span=4 }
   domain-1: span=0-11 level=NUMA
    groups: 0:{ span=0-5 cap=6122 }, 6:{ span=6-11 cap=6141 }
 CPU6 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 cap=1021 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 CPU7 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 7:{ span=7 }, 8:{ span=8 cap=1021 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 CPU8 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 8:{ span=8 cap=1021 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 CPU9 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 cap=1021 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 CPU10 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 cap=1021 }, 9:{ span=9 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 CPU11 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 cap=1021 }, 9:{ span=9 }, 10:{ span=10 }
   domain-1: span=0-11 level=NUMA
    groups: 6:{ span=6-11 cap=6141 }, 0:{ span=0-5 cap=6122 }
 span: 0-11 (max cpu_capacity = 1024)

[...]

 generate_sched_domains dom 0: 6-11 <-- this and the one below is what
 generate_sched_domains dom 1: 0-5      you are adding
 CPU0 attaching NULL sched-domain.
 CPU1 attaching NULL sched-domain.
 CPU2 attaching NULL sched-domain.
 CPU3 attaching NULL sched-domain.
 CPU4 attaching NULL sched-domain.
 CPU5 attaching NULL sched-domain.
 CPU6 attaching NULL sched-domain.
 CPU7 attaching NULL sched-domain.
 CPU8 attaching NULL sched-domain.
 CPU9 attaching NULL sched-domain.
 CPU10 attaching NULL sched-domain.
 CPU11 attaching NULL sched-domain.
 CPU6 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }
 CPU7 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 7:{ span=7 }, 8:{ span=8 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }
 CPU8 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 8:{ span=8 }, 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }
 CPU9 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 9:{ span=9 }, 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 }
 CPU10 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 10:{ span=10 }, 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 }, 9:{ span=9 }
 CPU11 attaching sched-domain(s):
  domain-0: span=6-11 level=MC
   groups: 11:{ span=11 }, 6:{ span=6 }, 7:{ span=7 }, 8:{ span=8 }, 9:{ span=9 }, 10:{ span=10 }
 span: 6-11 (max cpu_capacity = 1024)
 CPU0 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 0:{ span=0 }, 1:{ span=1 }, 2:{ span=2 }, 3:{ span=3 }, 4:{ span=4 }, 5:{ span=5 }
 CPU1 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 1:{ span=1 }, 2:{ span=2 }, 3:{ span=3 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 }
 CPU2 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 2:{ span=2 }, 3:{ span=3 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 }, 1:{ span=1 }
 CPU3 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 3:{ span=3 }, 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 }, 1:{ span=1 }, 2:{ span=2 }
 CPU4 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 4:{ span=4 }, 5:{ span=5 }, 0:{ span=0 }, 1:{ span=1 }, 2:{ span=2 }, 3:{ span=3 }
 CPU5 attaching sched-domain(s):
  domain-0: span=0-5 level=MC
   groups: 5:{ span=5 }, 0:{ span=0 }, 1:{ span=1 }, 2:{ span=2 }, 3:{ span=3 }, 4:{ span=4 }
 span: 0-5 (max cpu_capacity = 1024)
 --->8---

 Do you think there is still a benefit in printing out what
 generate_sched_domains does?

 Best,

 - Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
