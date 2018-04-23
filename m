Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B82C07DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 15:57:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755993AbeDWP5Y (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 11:57:24 -0400
Received: from mail-wr0-f180.google.com ([209.85.128.180]:46997 "EHLO
        mail-wr0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756046AbeDWP4y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Apr 2018 11:56:54 -0400
Received: by mail-wr0-f180.google.com with SMTP id d1-v6so42682423wrj.13
        for <linux-doc@vger.kernel.org>; Mon, 23 Apr 2018 08:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x2OLHVXbASz4f8qEoEk3s37HQClLiaLtZtPzz7feMPg=;
        b=g8zSYkgI9Wvc+aay+dk+DkoiU7y3ajJLvxmZ9nDRy2X2JkgFDV6YUsVeUanQi4pmoL
         3Mm4+oFa1+WwpysB3CvjRTlxikmUQ9z2Wa0wyrqtRpiQ48U+6NomU9FbV5n9kLwuumaO
         CbaYGrCOiBuowa16Q2bs+ZP8EBav0YIg8vsjShlb7MCK0L3k/7ZoAzC6pxZ9uFyUT+N1
         99mwRszW8hOEwQKQGinH7hllywsuuWQiOkkSq3h9SjuDgIMJ1Es4giruqW+qLlafR+ey
         iWivL6F0sODTWFNg3EgsP5l/OkoMS1dyDqcwr6VyPEu0vE1DMUHs2AvPqJI4FuvRCTlf
         AcoA==
X-Gm-Message-State: ALQs6tCfDPW0QaGKUNtJyovTgk/jKO9ka36Gj4ArMaZ0w4a09yYDgXst
        5F7uxhV/igMMsGYsYCzmlJ6vjg==
X-Google-Smtp-Source: AIpwx4/Ymp/CLLfivQxT3Wq3VqViegHRUKrZyhf7B8y/v70yYl9DDr58rl3ae1Dqr4c4aCdr8xsGZA==
X-Received: by 2002:adf:91c6:: with SMTP id 64-v6mr18318852wri.136.1524499013481;
        Mon, 23 Apr 2018 08:56:53 -0700 (PDT)
Received: from localhost.localdomain ([151.15.228.118])
        by smtp.gmail.com with ESMTPSA id 78sm10642075wmm.19.2018.04.23.08.56.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Apr 2018 08:56:52 -0700 (PDT)
Date:   Mon, 23 Apr 2018 17:56:49 +0200
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
Subject: Re: [PATCH v7 3/5] cpuset: Add a root-only cpus.isolated v2 control
 file
Message-ID: <20180423155649.GD32341@localhost.localdomain>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524145624-23655-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1524145624-23655-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/04/18 09:47, Waiman Long wrote:

[...]

> +  cpuset.cpus.isolated
> +	A read-write multiple values file which exists on root cgroup
> +	only.
> +
> +	It lists the CPUs that have been withdrawn from the root cgroup
> +	for load balancing.  These CPUs can still be allocated to child
> +	cpusets with load balancing enabled, if necessary.
> +
> +	If a child cpuset contains only an exclusive set of CPUs that are
> +	a subset of the isolated CPUs and with load balancing enabled,
> +	these CPUs will be load balanced on a separate root domain from
> +	the one in the root cgroup.
> +
> +	Just putting the CPUs into "cpuset.cpus.isolated" will be
> +	enough to disable load balancing on those CPUs as long as they
> +	do not appear in a child cpuset with load balancing enabled.

Tasks that were on those CPUs when they got isolated will stay there
(unless forcibly moved somewhere else). They will also "automatically"
belong to default root domain (or potentially to a new root domain
created for a group using those CPUs). Both things are maybe unavoidable
(as discussed in previous versions some tasks cannot be migrated at
all), but such "side effects" should probably be documented. What do you
think?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
