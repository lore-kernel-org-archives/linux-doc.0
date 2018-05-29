Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FE0E7D09D
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 06:27:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754542AbeE2G1J (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 02:27:09 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:37971 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754200AbeE2G1I (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 02:27:08 -0400
Received: by mail-wr0-f193.google.com with SMTP id 94-v6so23401528wrf.5
        for <linux-doc@vger.kernel.org>; Mon, 28 May 2018 23:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pKQ0hWI53KrPZTdEO/GXkZdpZrlhv7u5lX8uymEeEZQ=;
        b=VhazMS0FumxTpI+hyqKuGz9/ed4LAoFbJhDhzXGDNB2BoJjirbYKefYlDucRhcmFmY
         9SE21XEH75NbNqQanutzn3lvS34kgCCfl5drKTIzi7Dsyl3RRvpEU2t5s7Yf9YhuiGT6
         d3Dkb4yMIrP5bNpRWV6yUsU48qU5404cvlwS612ro+IH04H2GV+r5A3Q2A1XRtjkQTgj
         TKxvaCblZnvISF8LDwyRSTv3g9iYZc67PMHL4sjVC3QINpOXIZq1r4skrH2AI1N3ECeS
         HcHgq46kxUmmGxlbopNAuhYPdV0rb731gIS2+AzBV7y3kIOoMfGrPCxZtArV01ybAUZN
         uOow==
X-Gm-Message-State: ALKqPwdAUJk9ae171ENnSbCdfS6WQ3H9PQiHFnAiQWbeKOKBFNXXkEZ+
        7PSWf3VyPDUom9aJaNyzsJi68A==
X-Google-Smtp-Source: AB8JxZqEEzHaHnod2JM3KX1lOHPPMTcaTeCJQZJ9IuVejwQfggExSejpoP9z1ydAmUUYUzuKUnzjdw==
X-Received: by 2002:adf:c08a:: with SMTP id d10-v6mr11251296wrf.268.1527575226983;
        Mon, 28 May 2018 23:27:06 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id 12-v6sm19457318wmn.27.2018.05.28.23.27.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 May 2018 23:27:06 -0700 (PDT)
Date:   Tue, 29 May 2018 08:27:03 +0200
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
Subject: Re: [PATCH v8 4/6] cpuset: Make generate_sched_domains() recognize
 isolated_cpus
Message-ID: <20180529062703.GA8985@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-5-git-send-email-longman@redhat.com>
 <20180524102837.GA3948@localhost.localdomain>
 <45d70c88-e9f5-716a-ee9a-33dc111159cc@redhat.com>
 <8e610b98-970c-a309-5821-fc8e6aca892f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e610b98-970c-a309-5821-fc8e6aca892f@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/05/18 21:24, Waiman Long wrote:
> On 05/28/2018 09:12 PM, Waiman Long wrote:
> > On 05/24/2018 06:28 AM, Juri Lelli wrote:
> >> On 17/05/18 16:55, Waiman Long wrote:
> >>
> >> [...]
> >>
> >>> @@ -849,7 +860,12 @@ static void rebuild_sched_domains_locked(void)
> >>>  	 * passing doms with offlined cpu to partition_sched_domains().
> >>>  	 * Anyways, hotplug work item will rebuild sched domains.
> >>>  	 */
> >>> -	if (!cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> >>> +	if (!top_cpuset.isolation_count &&
> >>> +	    !cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> >>> +		goto out;
> >>> +
> >>> +	if (top_cpuset.isolation_count &&
> >>> +	   !cpumask_subset(top_cpuset.effective_cpus, cpu_active_mask))
> >>>  		goto out;
> >> Do we cover the case in which hotplug removed one of the isolated cpus
> >> from cpu_active_mask?
> > Yes, you are right. That is the remnant of my original patch that allows
> > only one isolated_cpus at root. Thanks for spotting that.
> 
> I am sorry. I would like to take it back my previous comment. The code
> above looks for inconsistency in the state of the effective_cpus mask to
> find out if it is racing with a hotplug event. If it is, we can skip the
> domain generation as the hotplug event will do that too. The checks are
> still valid with the current patchset. So I don't think we need to make
> any change here.

Yes, these checks are valid, but don't we also need to check for hotplug
races w.r.t. isolated CPUs (of some other sub domain)?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
