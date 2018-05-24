Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 23D837DF90
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 10:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1032089AbeEXK2s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 06:28:48 -0400
Received: from mail-wr0-f195.google.com ([209.85.128.195]:34787 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030942AbeEXK2l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 06:28:41 -0400
Received: by mail-wr0-f195.google.com with SMTP id j1-v6so2140571wrm.1
        for <linux-doc@vger.kernel.org>; Thu, 24 May 2018 03:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rbHeWcjZ0RP4euHIjW6n/saLL/sz1+W1MAdGO3CG4Ns=;
        b=hEB04R2z79PgKDrRWKPs0D75ArWhi8OmBt85TgcwqliAbQigP/3kqeRNNzOek9Q7q/
         EV/CYhBpmpNJWSGW22jspxrNN6oGm/Qsj1v7+QIfXTqS2X2l/RFIQSZFZsc7kumyxJWT
         n3O1VfYrVjtj0WCGCG13p6bt7bUnsfIWM+INEP/d9IRRETcjo3kjb0hGZDoySYLZR++d
         XQRCGXAAeQSbljAwEeuzYpOuIRt6IZXU3MViwGq/qsOG3IRsnSw/VxGDIFdm/xTjgAJ0
         o4Wj++uAlMxU+WCQ0qLmF1MHoIBQe5mknN3TWa7GrpnSoM9wyg2kgOvoZVSWrLJrlHrv
         WPIQ==
X-Gm-Message-State: ALKqPwcjNY7kdnCRI39/zMya6UrWz29WhGV9cDj6p2S73LS9nTH2gSn4
        XG3ahJ41u80pr1f8aIlaELFOFQ==
X-Google-Smtp-Source: AB8JxZrkkrFAl9zq9QZ6rtqHUuDFKQaJ+xSnP13cMzNEs6n/F/Q7Q85toXOh2GUT2y1TKf3XOuJ0Pw==
X-Received: by 2002:adf:b89b:: with SMTP id i27-v6mr4146693wrf.163.1527157720588;
        Thu, 24 May 2018 03:28:40 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id 141-v6sm9281735wmf.35.2018.05.24.03.28.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 May 2018 03:28:39 -0700 (PDT)
Date:   Thu, 24 May 2018 12:28:37 +0200
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
Message-ID: <20180524102837.GA3948@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-5-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1526590545-3350-5-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 17/05/18 16:55, Waiman Long wrote:

[...]

> @@ -849,7 +860,12 @@ static void rebuild_sched_domains_locked(void)
>  	 * passing doms with offlined cpu to partition_sched_domains().
>  	 * Anyways, hotplug work item will rebuild sched domains.
>  	 */
> -	if (!cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> +	if (!top_cpuset.isolation_count &&
> +	    !cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
> +		goto out;
> +
> +	if (top_cpuset.isolation_count &&
> +	   !cpumask_subset(top_cpuset.effective_cpus, cpu_active_mask))
>  		goto out;

Do we cover the case in which hotplug removed one of the isolated cpus
from cpu_active_mask?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
