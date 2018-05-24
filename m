Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C83DE7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 14:36:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935755AbeEXOgU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 10:36:20 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45499 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935668AbeEXOgS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 10:36:18 -0400
Received: by mail-wr0-f194.google.com with SMTP id w3-v6so3541827wrl.12
        for <linux-doc@vger.kernel.org>; Thu, 24 May 2018 07:36:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IItUpvtsthIeeHOULK4ul0pCR18QTGGFSuZU81iIBwg=;
        b=EuoXFan1+0bFtsSHbUVNQf14WErhBEyauHlruuaMYu5NC5ZioWjV2nw1PvgA6QJItu
         zdhiDZ3/i7Y/jI6uNc7JYd1I4I3mE/O2tEZGaSXBeK+fq7USOUkZmASQlGbXewiNnk3i
         GpyJMzfmuKuCe19+KOysUnDg7JkZUAMXt1cIQtaYCgaadtxGoUeDl5edUrof3WZ6yZi5
         T6vmEfSaEWjbCKdt3HkBsfQhV8IauqLWpOTH/OxHMcMEoyy/RkRoPuyKptXS2aRmTCU6
         gZrE5yicrPzkfO1EuAZyqn6ef5s6XAGexxKm1Wba02VmR1kjWsgXzAEkV7Vlo5WXsjge
         y4BA==
X-Gm-Message-State: ALKqPwdG15HDiEQAGKp1+6/znJuX85JV5C61dZPz9sILShyhxxsD3Jt+
        PIcSZYHGR/Yw4VNfH7R8qqSLVA==
X-Google-Smtp-Source: AB8JxZocuL2cj/De8RI67z/b/ygQ/rdq2yiCxjHy46pJBXwkwqNkC4JUm2ROIglt2zScOtifZWyH6Q==
X-Received: by 2002:adf:c709:: with SMTP id k9-v6mr7093817wrg.65.1527172577622;
        Thu, 24 May 2018 07:36:17 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id o9-v6sm23658585wrn.74.2018.05.24.07.36.16
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 May 2018 07:36:16 -0700 (PDT)
Date:   Thu, 24 May 2018 16:36:14 +0200
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
Subject: Re: [PATCH v8 3/6] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180524143614.GC3948@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526590545-3350-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/05/18 16:55, Waiman Long wrote:

[...]

> +	A parent cgroup cannot distribute all its CPUs to child
> +	scheduling domain cgroups unless its load balancing flag is
> +	turned off.
> +
> +  cpuset.sched.load_balance
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or a non-zero value (on).  This flag is set
> +	by the parent and is not delegatable.
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
> +	The initial value of this flag is "1".	This flag is then
> +	inherited by child cgroups with cpuset enabled.  Its state
> +	can only be changed on a scheduling domain cgroup with no
> +	cpuset-enabled children.

[...]

> +	/*
> +	 * On default hierachy, a load balance flag change is only allowed
> +	 * in a scheduling domain with no child cpuset.
> +	 */
> +	if (cgroup_subsys_on_dfl(cpuset_cgrp_subsys) && balance_flag_changed &&
> +	   (!is_sched_domain(cs) || css_has_online_children(&cs->css))) {
> +		err = -EINVAL;
> +		goto out;
> +	}

The rule is actually

 - no child cpuset
 - and it must be a scheduling domain

Right?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
