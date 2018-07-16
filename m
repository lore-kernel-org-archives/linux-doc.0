Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 13F057D072
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Jul 2018 09:36:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbeGPKDG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Jul 2018 06:03:06 -0400
Received: from mx2.suse.de ([195.135.220.15]:35264 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727606AbeGPKDG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Jul 2018 06:03:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 0FF9AAD24;
        Mon, 16 Jul 2018 09:36:32 +0000 (UTC)
Date:   Mon, 16 Jul 2018 11:36:30 +0200
From:   Michal Hocko <mhocko@kernel.org>
To:     David Rientjes <rientjes@google.com>
Cc:     Roman Gushchin <guro@fb.com>, linux-mm@vger.kernel.org,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tejun Heo <tj@kernel.org>, kernel-team@fb.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v13 0/7] cgroup-aware OOM killer
Message-ID: <20180716093630.GJ17280@dhcp22.suse.cz>
References: <20171130152824.1591-1-guro@fb.com>
 <20180605114729.GB19202@dhcp22.suse.cz>
 <alpine.DEB.2.21.1807131438380.194789@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1807131438380.194789@chino.kir.corp.google.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri 13-07-18 14:59:59, David Rientjes wrote:
> On Tue, 5 Jun 2018, Michal Hocko wrote:
> 
> > 1) comparision root with tail memcgs during the OOM killer is not fair
> > because we are comparing tasks with memcgs.
> > 
> > This is true, but I do not think this matters much for workloads which
> > are going to use the feature. Why? Because the main consumers of the new
> > feature seem to be containers which really need some fairness when
> > comparing _workloads_ rather than processes. Those are unlikely to
> > contain any significant memory consumers in the root memcg. That would
> > be mostly common infrastructure.
> > 
> 
> There are users (us) who want to use the feature and not all processes are 
> attached to leaf mem cgroups.  The functionality can be provided in a 
> generally useful way that doesn't require any specific hierarchy, and I 
> implemented this in my patch series at 
> https://marc.info/?l=linux-mm&m=152175563004458&w=2.  That proposal to fix 
> *all* of my concerns with the cgroup-aware oom killer as it sits in -mm, 
> in it's entirety, only extends it so it is generally useful and does not 
> remove any functionality.  I'm not sure why we are discussing ways of 
> moving forward when that patchset has been waiting for review for almost 
> four months and, to date, I haven't seen an objection to.

Well, I didn't really get to your patches yet. The last time I've
checked I had some pretty serious concerns about the consistency of your
proposal. Those might have been fixed in the lastest version of your
patchset I haven't seen. But I still strongly suspect that you are
largerly underestimating the complexity of more generic oom policies
which you are heading to.

Considering user API failures from the past (oom_*adj fiasco for
example) suggests that we should start with smaller steps and only
provide a clear and simple API. oom_group is such a simple and
semantically consistent thing which is the reason I am OK with it much
more than your "we can be more generic" approach. I simply do not trust
we can agree on sane and consistent api in a reasonable time.

And it is quite mind boggling that a simpler approach has been basically
blocked for months because there are some concerns for workloads which
are not really asking for the feature. Sure your usecase might need to
handle root memcg differently. That is a fair point but that shouldn't
really block containers users who can use the proposed solution without
any further changes. If we ever decide to handle root memcg differently
we are free to do so because the oom selection policy is not carved in
stone by any api.
 
[...]
-- 
Michal Hocko
SUSE Labs
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
