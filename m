Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9B007D043
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 11:48:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751667AbeFELrg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 07:47:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:35917 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751625AbeFELrd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 07:47:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (charybdis-ext-too.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 975A8AE09;
        Tue,  5 Jun 2018 11:47:30 +0000 (UTC)
Date:   Tue, 5 Jun 2018 13:47:29 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     Roman Gushchin <guro@fb.com>
Cc:     linux-mm@vger.kernel.org,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        David Rientjes <rientjes@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tejun Heo <tj@kernel.org>, kernel-team@fb.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v13 0/7] cgroup-aware OOM killer
Message-ID: <20180605114729.GB19202@dhcp22.suse.cz>
References: <20171130152824.1591-1-guro@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171130152824.1591-1-guro@fb.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It seems that this is still in limbo mostly because of David's concerns.
So let me reiterate them and provide my POV once more (and the last
time) just to help Andrew make a decision:

1) comparision root with tail memcgs during the OOM killer is not fair
because we are comparing tasks with memcgs.

This is true, but I do not think this matters much for workloads which
are going to use the feature. Why? Because the main consumers of the new
feature seem to be containers which really need some fairness when
comparing _workloads_ rather than processes. Those are unlikely to
contain any significant memory consumers in the root memcg. That would
be mostly common infrastructure.

Is this is fixable? Yes, we would need to account in the root memcgs.
Why are we not doing that now? Because it has some negligible
performance overhead. Are there other ways? Yes we can approximate root
memcg memory consumption but I would rather wait for somebody seeing
that as a real problem rather than add hacks now without a strong
reason.


2) Evading the oom killer by attaching processes to child cgroups which
basically means that a task can split up the workload into smaller
memcgs to hide their real memory consumption.

Again true but not really anything new. Processes can already fork and
split up the memory consumption. Moreover it doesn't even require any
special privileges to do so unlike creating a sub memcg. Is this
fixable? Yes, untrusted workloads can setup group oom evaluation at the
delegation layer so all subgroups would be considered together.

3) Userspace has zero control over oom kill selection in leaf mem
cgroups.

Again true but this is something that needs a good evaluation to not end
up in the fiasko we have seen with oom_score*. Current users demanding
this feature can live without any prioritization so blocking the whole
feature seems unreasonable.

4) Future extensibility to be backward compatible.

David is wrong here IMHO. Any prioritization or oom selection policy
controls added in future are orthogonal to the oom_group concept added
by this patchset. Allowing memcg to be an oom entity is something that
we really want longterm. Global CGRP_GROUP_OOM is the most restrictive
semantic and softening it will be possible by a adding a new knob to
tell whether a memcg/hierarchy is a workload or a set of tasks.
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
