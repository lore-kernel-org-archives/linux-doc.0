Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2A8CB7D043
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Jun 2018 09:52:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965727AbeFSJwI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Jun 2018 05:52:08 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:35000 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965688AbeFSJwG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jun 2018 05:52:06 -0400
Received: by mail-wr0-f193.google.com with SMTP id l10-v6so19871643wrn.2
        for <linux-doc@vger.kernel.org>; Tue, 19 Jun 2018 02:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dz8mTuvwsgnK5meC62JXAVfSSPMAUjJcUX43uqxR/b4=;
        b=QIJ9ZpdhmyqmpPQf0rpNGVojjD3kurjmM3HEfYohwTJ0RG+fljOoraVSv3BLk6b4rp
         i99fknxKrwOkqkixCnWVMXxS39b76Pvo1ufwTwE4TP4bObAwSyoWjqRIx/kM+RjIjl6w
         jBmwP+MPiRfQzaOK3ltgk0Sz12CwdA73bcVS/ZsUb9/A3emshbBWiENaotTpE+m9S2Cz
         9BwgrMRSgfs36AV2DgRV2bGqVDbqp57XCEEXFyCHpr4H62JWLBLj9soCY9LikMbk8Fy5
         6M5JP3kWB6bs/N5oBFbMl3uRNvi+e8WPgtBfXuMn26LX+0BWfOhL60aWfMCSLWltJXFx
         U0sQ==
X-Gm-Message-State: APt69E3HOPXtdLY5p0YBZ9ReqVAiIYULfhP1mrrCDC/CjNC8843RGNy7
        SC21Zwkxo8aYYQfNR+WB7dka8w==
X-Google-Smtp-Source: ADUXVKIFV4qYDhPy/3SmZxWqWqMSMz9pTHroHhIK42G6QTgcuqKDjWGL/O8mFmcoSP+LpGC9TVgvTQ==
X-Received: by 2002:adf:ea44:: with SMTP id j4-v6mr13624045wrn.224.1529401925476;
        Tue, 19 Jun 2018 02:52:05 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id v68-v6sm13853222wmd.12.2018.06.19.02.52.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jun 2018 02:52:04 -0700 (PDT)
Date:   Tue, 19 Jun 2018 11:52:02 +0200
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
Message-ID: <20180619095202.GB13617@localhost.localdomain>
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

By removing the redundant 6/9 as advised, I could test that this is
working as expected (at least by me :): https://git.io/fURIC

I played a bit with creating and modifying domain root(s), both with
legacy and default hierarchies. Looks good to me, you can add

Tested-by: Juri Lelli <juri.lelli@redhat.com>

to the series.

Best,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
