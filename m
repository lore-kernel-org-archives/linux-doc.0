Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2FF2E7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 18 Jun 2018 14:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934269AbeFROUm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 18 Jun 2018 10:20:42 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:40429 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934438AbeFROUk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jun 2018 10:20:40 -0400
Received: by mail-wm0-f66.google.com with SMTP id n5-v6so15912709wmc.5
        for <linux-doc@vger.kernel.org>; Mon, 18 Jun 2018 07:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=udMFiR+A6fu0YVugLCc1lt47GsnICt8roV0x8/yYyy0=;
        b=isFhugX2cGdJYR4vkkfMPIY4ijrkM8tkxDp4+cd3fvUT2+3hVdstlVCXEtP0MfL7DH
         jOM6ccP/yRf2uAHePaOQDr+IZbmIvrcLw9qcsZafbzS7aANeP6vNDd6yuWZQhoothbWB
         /TFRrwpv5t8/PB1m+ndCoykXzZ5bDwfurYObBMx3DnpBvYeBUrn0ssESu2AWZVb2DHJ6
         HHrdH64QopdKpaSQt1Z/zzl2rWCvmuSl+BJzkj6TGjMkMYe+HdSiZ0AuoVK9QV73Wvc2
         /+7z5wrynwoaBjrE+J2IJPAYpx2dZfgyQArdezdByc116seBIEuoLVDYrympV4pMAtVh
         k7fw==
X-Gm-Message-State: APt69E1MX5oOuh8UHO6g+wCCOe4/g7fHp/6OBRXb8QqzImOaLuQfQELO
        FRneAz6zAF0rgv01ORZgRHvVGA==
X-Google-Smtp-Source: ADUXVKI3czwOzX+EAeazELMIYomwIeKl+T6MRz2746CxsijB6m0xBZRQNLKYrzE1mZ2mIyrH4G70Yw==
X-Received: by 2002:a1c:110a:: with SMTP id 10-v6mr8049986wmr.130.1529331639589;
        Mon, 18 Jun 2018 07:20:39 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id z83-v6sm9209058wmb.8.2018.06.18.07.20.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jun 2018 07:20:38 -0700 (PDT)
Date:   Mon, 18 Jun 2018 16:20:36 +0200
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
Subject: Re: [PATCH v10 0/9] cpuset: Enable cpuset controller in default
 hierarchy
Message-ID: <20180618142036.GA13097@localhost.localdomain>
References: <1529295249-5207-1-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1529295249-5207-1-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On 18/06/18 12:13, Waiman Long wrote:
> v10:
>  - Remove the cpuset.sched.load_balance patch for now as it may not
>    be that useful.
>  - Break the large patch 2 into smaller patches to make them a bit
>    easier to review.
>  - Test and fix issues related to changing "cpuset.cpus" and cpu
>    online/offline in a domain root.
>  - Rename isolated_cpus to reserved_cpus as this cpumask holds CPUs
>    reserved for child sched domains.
>  - Rework the scheduling domain debug printing code in the last patch.
>  - Document update to the newly moved
>    Documentation/admin-guide/cgroup-v2.rst.

There seem to be two (similar but different) 6/9 in the set. Something
went wrong?

Also I can't seem to be able to create a subgroup with an isolated
domain root. I think that, when doing the following

 # mount -t cgroup2 none /sys/fs/cgroup
 # echo "+cpuset" >/sys/fs/cgroup/cgroup.subtree_control 
 # mkdir /sys/fs/cgroup/g1
 # echo 0-1 >/sys/fs/cgroup/g1/cpuset.cpus
 # echo 1 >/sys/fs/cgroup/g1/cpuset.sched.domain_root

rebuild_sched_domains_locked exits early, since
top_cpuset.effective_cpus != cpu_active_mask. (effective_cpus being 2-3
at this point since I'm testing this on a 0-3 system)

In your v9 this [1] was adding a special condition to make rebuilding of
domains happen. Was the change intentional?

Thanks,

- Juri

[1] https://marc.info/?l=linux-kernel&m=152760142531222&w=2
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
