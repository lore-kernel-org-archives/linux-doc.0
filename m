Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 033287D071
	for <lwn-linux-doc@archive.lwn.net>; Thu, 19 Jul 2018 13:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731625AbeGSOiC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 19 Jul 2018 10:38:02 -0400
Received: from merlin.infradead.org ([205.233.59.134]:38738 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730433AbeGSOiC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jul 2018 10:38:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=knconBZjf3pP0Q8+N2eKVc87U+1NaPR4TA9wiezBgO4=; b=stj1ws77G++GvZtkY5v5lPt88
        YQjEbfRAQ7X+rS9vRxYH47FVukq5q/a/RmKv5pRG0sR24RYvmHs0yanTQroB3guDwkoljmhGGjLKX
        aT1wsykQARkiLaEcr1YBjIiErV0v4jtq3+LvDaFXaKLdWHsIQ1z2KuzMRqTbUtRKxkoDqfaqMKFdj
        5k4eBVuEeEv4OdZ0QrRrOQ+UiIHKqz3GbDTb5stLt1sOYQhxfePCOSj4qd6tKg68uw7sB1+yG0sL4
        2kePc2VeM67ur4ZkH0MPMFbQdlIoHlkBKnw4sjNKZAx/ayFG+s9tK8/4qTlTP3j6WxaExugUmtXCA
        6P7FmlBXQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fg9O2-0003fV-Qc; Thu, 19 Jul 2018 13:54:31 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 969FD20289330; Thu, 19 Jul 2018 15:54:29 +0200 (CEST)
Date:   Thu, 19 Jul 2018 15:54:29 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v11 9/9] cpuset: Allow reporting of sched domain
 generation info
Message-ID: <20180719135429.GF2494@hirez.programming.kicks-ass.net>
References: <1529825440-9574-1-git-send-email-longman@redhat.com>
 <1529825440-9574-10-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529825440-9574-10-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jun 24, 2018 at 03:30:40PM +0800, Waiman Long wrote:
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
>  kernel/cgroup/cpuset.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
> index 07a5575..62b7e61 100644
> --- a/kernel/cgroup/cpuset.c
> +++ b/kernel/cgroup/cpuset.c
> @@ -836,6 +836,23 @@ static int generate_sched_domains(cpumask_var_t **domains,
>  	return ndoms;
>  }
>  
> +#ifdef CONFIG_DEBUG_KERNEL
> +static inline void debug_print_domains(cpumask_var_t *doms, int ndoms)
> +{
> +	int i;
> +	char buf[200];
> +	char *ptr, *end = buf + sizeof(buf) - 1;
> +
> +	for (i = 0, ptr = buf, *end = '\0'; i < ndoms; i++)
> +		ptr += snprintf(ptr, end - ptr, "dom%d=%*pbl ", i,
> +				cpumask_pr_args(doms[i]));
> +
> +	pr_debug("Generated %d domains: %s\n", ndoms, buf);
> +}
> +#else
> +static inline void debug_print_domains(cpumask_var_t *doms, int ndoms) { }
> +#endif

I still hate this patch.. it prints information already available in
sched_debug and has that rediculous on-stack buffer.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
