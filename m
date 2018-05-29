Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 225167DF87
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 13:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934423AbeE2NMq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 09:12:46 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:38418 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934273AbeE2NMm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 May 2018 09:12:42 -0400
Received: by mail-wr0-f193.google.com with SMTP id 94-v6so25427417wrf.5
        for <linux-doc@vger.kernel.org>; Tue, 29 May 2018 06:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zG2NSpx09U68xnW+SLou28hA+SbbAmjOpxwlt42kit4=;
        b=JXnQmgK0ul8W+/h0T6cKObmOa5kBAc2QiSpcd/DvER1TXnVHpVzb8p7xRIkl52aeFj
         HWyW4lonFDF4ydDGOrd+BbowIOOokmH5DZxVSpHshepQn/9dCeTJnqTUP/pAxzFHkHK2
         ADomPqqXwhJt5b6KsAc0TfZniyUxfp+3k7vQ1n2UJLVyTnhGOR5+C25izXuCFP5R2RqB
         S4C1lKpf/MGp2YdoheS8dy7+iuJ7PvnxFaaiPrSDOq8z/5GhCH6BJbl2wsQ2uE0serGj
         KNWxHBLOf9Ar7952QETdV5XJFh+XX8VjmRu/C+VLAqQe9FWMPeRfnqOR78wDsOwBI/kh
         6mQw==
X-Gm-Message-State: ALKqPwfnI+9TXLLF0R00zQTb1xrDHI9kmztMy/rQCoRTSqymzn5QFnVY
        4dP/E8MxWL7h3WKWGgyLrgbsCg==
X-Google-Smtp-Source: AB8JxZoDwwlNL/7JM27UXX3ngVzYYpGVmSYhDsaDLqd7S46UUffrCfMFnU6K7wnmdudZmZRj5ia7eA==
X-Received: by 2002:adf:f74c:: with SMTP id z12-v6mr14729705wrp.165.1527599561303;
        Tue, 29 May 2018 06:12:41 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id y68-v6sm63857132wrb.91.2018.05.29.06.12.39
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 May 2018 06:12:40 -0700 (PDT)
Date:   Tue, 29 May 2018 15:12:38 +0200
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
Message-ID: <20180529131238.GE8985@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-5-git-send-email-longman@redhat.com>
 <20180524102837.GA3948@localhost.localdomain>
 <45d70c88-e9f5-716a-ee9a-33dc111159cc@redhat.com>
 <8e610b98-970c-a309-5821-fc8e6aca892f@redhat.com>
 <20180529062703.GA8985@localhost.localdomain>
 <8164a41b-3218-c618-64a6-52747344c4db@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8164a41b-3218-c618-64a6-52747344c4db@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/05/18 08:40, Waiman Long wrote:
> On 05/29/2018 02:27 AM, Juri Lelli wrote:
> > On 28/05/18 21:24, Waiman Long wrote:
> >> On 05/28/2018 09:12 PM, Waiman Long wrote:
> >>> On 05/24/2018 06:28 AM, Juri Lelli wrote:
> >>>> On 17/05/18 16:55, Waiman Long wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>> @@ -849,7 +860,12 @@ static void rebuild_sched_domains_locked(void)
> >>>>>  	 * passing doms with offlined cpu to partition_sched_domains().
> >>>>>  	 * Anyways, hotplug work item will rebuild sched domains.
> >>>>>  	 */
> >>>>> -	if (!cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> >>>>> +	if (!top_cpuset.isolation_count &&
> >>>>> +	    !cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> >>>>> +		goto out;
> >>>>> +
> >>>>> +	if (top_cpuset.isolation_count &&
> >>>>> +	   !cpumask_subset(top_cpuset.effective_cpus, cpu_active_mask))
> >>>>>  		goto out;
> >>>> Do we cover the case in which hotplug removed one of the isolated cpus
> >>>> from cpu_active_mask?
> >>> Yes, you are right. That is the remnant of my original patch that allows
> >>> only one isolated_cpus at root. Thanks for spotting that.
> >> I am sorry. I would like to take it back my previous comment. The code
> >> above looks for inconsistency in the state of the effective_cpus mask to
> >> find out if it is racing with a hotplug event. If it is, we can skip the
> >> domain generation as the hotplug event will do that too. The checks are
> >> still valid with the current patchset. So I don't think we need to make
> >> any change here.
> > Yes, these checks are valid, but don't we also need to check for hotplug
> > races w.r.t. isolated CPUs (of some other sub domain)?
> 
> It is not actually a race. Both the hotplug event and any changes to cpu
> lists or flags are serialized by the cpuset_mutex. It is just that we
> may be doing the same work twice that we are wasting cpu cycles. So we
> are doing a quick check to avoid this. The check isn't exhaustive and we
> can certainly miss some cases. Doing a more throughout check may need as
> much time as doing the sched domain generation itself and so you are
> actually wasting more CPU cycles on average as the chance of a hotplug
> event is very low.

Fair enough.

Thanks,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
