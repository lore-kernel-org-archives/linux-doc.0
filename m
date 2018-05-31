Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0D14E7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 09:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754188AbeEaJuA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 05:50:00 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:42468 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754092AbeEaJt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 05:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=YPwuIStifaMAixrdlInWE8+yShLKNE+jvdZoydpcXf8=; b=P5dkN8xMIoYtv0LtfaI7tr+6n
        C58w1+5p+UByAfY0aTkMuOjUMDhdqeQ1JP2k9/0aoaBTTOx6+rSYVGzjm9FPPE+KZucUSePbLUNrD
        wSVrOLdXwQG6z7+iCRrZZzU88GlFLxu642Quoax5W5lgzH6L0gJB6UBjdwStfTcqudAta6OYKVDMr
        38hSxYsEdndUDC+uyzI++KXFYD9Tzsc/X4WWIUhcYT2CkHqClxQlSIrRcNwEev/YpdDrwbEFv0OXb
        s1cDaWCKN+CyuYnHFqu85qvlWW1tvq1Cd+9Uzmjh0cjKX1x8BcYKWaJkESTbFxcMrVQ3AxNxd48sB
        C78Qu6p7Q==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOKDJ-00054x-Qn; Thu, 31 May 2018 09:49:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6450A202ACE62; Thu, 31 May 2018 11:49:43 +0200 (CEST)
Date:   Thu, 31 May 2018 11:49:43 +0200
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
Subject: Re: [PATCH v9 2/7] cpuset: Add new v2 cpuset.sched.domain_root flag
Message-ID: <20180531094943.GG12180@hirez.programming.kicks-ass.net>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-3-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527601294-3444-3-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 29, 2018 at 09:41:29AM -0400, Waiman Long wrote:
> +  cpuset.sched.domain_root
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or "1" (on).  This flag is set by the parent
> +	and is not delegatable.

What does "is not delegatable" mean?

I think you used to say "is owned by the parent", which is took to mean
file ownership is that of the parent directory (..) and not of the
current (,), which is slightly odd but works.

So if you chown a cgroup to a user, that user will not be able to change
the file of it's 'root' (will actually be the root in case of
container), but it _can_ change this file for any sub-cgroups it
creates, right?

So in that respect the feature is delegatable, a container can create
sub-partitions. It just cannot change it's 'root' partition, which is
consistent with a real root.

The only inconsistently left is then that the real root does not have
the file at all, vs a container root having it, but not accessible.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
