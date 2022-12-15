Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64282C4167B
	for <linux-doc@archiver.kernel.org>; Thu, 15 Dec 2022 17:58:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiLOR63 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Dec 2022 12:58:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbiLOR62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Dec 2022 12:58:28 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1588C37F85
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 09:58:26 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id g1so137660pfk.2
        for <linux-doc@vger.kernel.org>; Thu, 15 Dec 2022 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrLrz3poxKOCnQD8TmgmuF/CjpfAGceNT3pwtG5IIEQ=;
        b=PET1DCooVL0kLbhn/8bSBAdFnwVrPTsoQd5R+haAv60Ba3BgXQC9F5wPJCmOuDo1/y
         HqQroLJDPOU+aKkqy9uO5TR3NfAGuvRw9Am/ZVIh+SjA5mdcPeWfQnNkTKzu938s0glG
         2pp6g0J2FVanwrsAmGw3U6h4P0y8YiHRprWgw/Oy8W0XUXUXRaWD9Wxp4PsR7D+TK6C2
         XnFHsyfK0Unw8U9Qgt180/gCVnru5B3v0WjtsK1JFZ6Pkp5lefNHQMkV4BquSFTfyyJx
         zKILeZPe/7Ypfucspvi4rh99RzTf8HCRm4SpoR0EnSV3J2VN1y/o1YKKYmdvaigIpA2s
         ehRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrLrz3poxKOCnQD8TmgmuF/CjpfAGceNT3pwtG5IIEQ=;
        b=0h+n3rS7yO8M2h/hEAtdxipoMTOuh3jpZy04cxNu6m7aCftpG4YNvI6bYJMHwKmwxB
         2OBMNyg1Sy1KSIwtSdzM61OmUZP5gom/9w0r3WBFmo1XvtEanm8CXwJSqaaE6rQNq2Ve
         mq2yckqO1oXjkt/7DXyBVsMsuvnb1x1HNqB5eoj0EhEdBWlfxN8AmKIu5qGhf2fbRApT
         2rnNb+vzpWqkxgUMCOaM+aiOD7VvqgKMuDLbSeSKPlfmh8Ql6C4nU0eDBkrwCur6Pi2z
         F+K2+0pJEeqRGT/bwjzQbVy0VAT0q+DnApxJBXD/dLTKcgKmwcNBdLjIBi88882HytdP
         DqOg==
X-Gm-Message-State: ANoB5pluTAwfBHKuEXeawjOCsFgiqBziVIyaaXES07wbpqCKqK5pYqdS
        W8fHwhr/xaxUzC+8dRbVIX5xLceeW2IFrrUG6Yv5TQ==
X-Google-Smtp-Source: AA0mqf6ZFym1byapTv5pA4J3s1CK6k09g1l0JvSBqYhJKUAc/XNV4jJYWpEV7NmvhQZFGV45sgwG7cFtxkoZAFrpGMA=
X-Received: by 2002:a63:1c22:0:b0:478:c543:89d3 with SMTP id
 c34-20020a631c22000000b00478c54389d3mr15665867pgc.184.1671127105299; Thu, 15
 Dec 2022 09:58:25 -0800 (PST)
MIME-Version: 1.0
References: <20221202223533.1785418-1-almasrymina@google.com>
 <Y5bsmpCyeryu3Zz1@dhcp22.suse.cz> <CAHS8izM-XdLgFrQ1k13X-4YrK=JGayRXV_G3c3Qh4NLKP7cH_g@mail.gmail.com>
 <87k02volwe.fsf@yhuang6-desk2.ccr.corp.intel.com> <Y5h+gHBneexFQcR3@cmpxchg.org>
 <Y5iGJ/9PMmSCwqLj@dhcp22.suse.cz> <CAHS8izOuT_-p-N1xPApi+BPJQ+P--2YVSUeiWBROGvGinN0vcg@mail.gmail.com>
 <Y5mkJL6I5Zlc1k97@dhcp22.suse.cz>
In-Reply-To: <Y5mkJL6I5Zlc1k97@dhcp22.suse.cz>
From:   Wei Xu <weixugc@google.com>
Date:   Thu, 15 Dec 2022 09:58:12 -0800
Message-ID: <CAAPL-u_KFTScyd1hxDGb-nHf6hW5_pCsh5a0NDZCr5v5AGq88A@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add nodes= arg to memory.reclaim
To:     Michal Hocko <mhocko@suse.com>
Cc:     Mina Almasry <almasrymina@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        "Huang, Ying" <ying.huang@intel.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeelb@google.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Yosry Ahmed <yosryahmed@google.com>, fvdl@google.com,
        bagasdotme@gmail.com, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Dec 14, 2022 at 2:23 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Tue 13-12-22 11:29:45, Mina Almasry wrote:
> > On Tue, Dec 13, 2022 at 6:03 AM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Tue 13-12-22 14:30:40, Johannes Weiner wrote:
> > > > On Tue, Dec 13, 2022 at 02:30:57PM +0800, Huang, Ying wrote:
> > > [...]
> > > > > After these discussion, I think the solution maybe use different
> > > > > interfaces for "proactive demote" and "proactive reclaim".  That is,
> > > > > reconsider "memory.demote".  In this way, we will always uncharge the
> > > > > cgroup for "memory.reclaim".  This avoid the possible confusion there.
> > > > > And, because demotion is considered aging, we don't need to disable
> > > > > demotion for "memory.reclaim", just don't count it.
> > > >
> > > > Hm, so in summary:
> > > >
> > > > 1) memory.reclaim would demote and reclaim like today, but it would
> > > >    change to only count reclaimed pages against the goal.
> > > >
> > > > 2) memory.demote would only demote.
> > > >
> >
> > If the above 2 points are agreeable then yes, this sounds good to me
> > and does address our use case.
> >
> > > >    a) What if the demotion targets are full? Would it reclaim or fail?
> > > >
> >
> > Wei will chime in if he disagrees, but I think we _require_ that it
> > fails, not falls back to reclaim. The interface is asking for
> > demotion, and is called memory.demote. For such an interface to fall
> > back to reclaim would be very confusing to userspace and may trigger
> > reclaim on a high priority job that we want to shield from proactive
> > reclaim.
>
> But what should happen if the immediate demotion target is full but
> lower tiers are still usable. Should the first one demote before
> allowing to demote from the top tier?

In that case, the demotion will fall back to the lower tiers.  See
node_get_allowed_targets() and establish_demotion_targets()..

> > > > 3) Would memory.reclaim and memory.demote still need nodemasks?
> >
> > memory.demote will need a nodemask, for sure. Today the nodemask would
> > be useful if there is a specific node in the top tier that is
> > overloaded and we want to reduce the pressure by demoting. In the
> > future there will be N tiers and the nodemask says which tier to
> > demote from.
>
> OK, so what is the exact semantic of the node mask. Does it control
> where to demote from or to or both?

The nodemask argument proposed here is to control where to demote
from.   We can follow the existing kernel demotion order to select
where to demote to.  If the need to control the demotion destination
arises, another argument can be added.

> > I don't think memory.reclaim would need a nodemask anymore? At least I
> > no longer see the use for it for us.
> >
> > > >    Would
> > > >    they return -EINVAL if a) memory.reclaim gets passed only toptier
> > > >    nodes or b) memory.demote gets passed any lasttier nodes?
> > >
> >
> > Honestly it would be great if memory.reclaim can force reclaim from a
> > top tier nodes. It breaks the aginig pipeline, yes, but if the user is
> > specifically asking for that because they decided in their usecase
> > it's a good idea then the kernel should comply IMO. Not a strict
> > requirement for us. Wei will chime in if he disagrees.
>
> That would require a nodemask to say which nodes to reclaim, no? The
> default behavior should be in line with what standard memory reclaim
> does. If the demotion is a part of that process so should be
> memory.reclaim part of it. If we want to have a finer control then a
> nodemask is really a must and then the nodemaks should constrain both
> agining and reclaim.

Given that the original meaning of memory.reclaim is to free up
memory, I agree that when a nodemask is provided, the kernel should be
allowed to do both aging/demotion and reclaim.  Whether to allow
reclaim from top-tier nodes is a kernel implementation choice.  The
userspace should not depend on that.

Also, because the expectation of memory.reclaim is to free up the
specified amount of bytes, I think if a page is demoted, but both its
source and target nodes are still in the given nodemask, such a
demoted page should not be counted towards the requested bytes of
memory.reclaim. In the case that no nodemask is given (i.e. to free up
memory from all nodes), the demoted pages should never be counted in
the return value of try_to_free_mem_cgroup_pages().

Meanwhile, I'd argue that even though we want to unify demotion and
reclaim, there are still significant differences between them.
Demotion moves pages between two memory tiers, while reclaim can move
pages to a much slower tier, e.g. disk-based files or swap.  Both the
page movement latencies and the reaccess latencies can be
significantly different for demotion/reclaim.  So it is useful for the
userspace to be able to request demotion without reclaim.  A separate
interface, e.g. memory.demote, seems like a good choice for that.

> > memory.demote returning -EINVAL for lasttier nodes makes sense to me.
> >
> > > I would also add
> > > 4) Do we want to allow to control the demotion path (e.g. which node to
> > >    demote from and to) and how to achieve that?
> >
> > We care deeply about specifying which node to demote _from_. That
> > would be some node that is approaching pressure and we're looking for
> > proactive saving from. So far I haven't seen any reason to control
> > which nodes to demote _to_. The kernel deciding that based on the
> > aging pipeline and the node distances sounds good to me. Obviously
> > someone else may find that useful.
>
> Please keep in mind that the interface should be really prepared for
> future extensions so try to abstract from your immediate usecases.
>
> > > 5) Is the demotion api restricted to multi-tier systems or any numa
> > >    configuration allowed as well?
> > >
> >
> > demotion will of course not work on single tiered systems. The
> > interface may return some failure on such systems or not be available
> > at all.
>
> Is there any strong reason for that? We do not have any interface to
> control NUMA balancing from userspace. Why cannot we use the interface
> for that purpose?

A demotion interface such as memory.demote will trigger the demotion
code path in the kernel, which depends on multiple memory tiers.

I think what you are getting is a more general page migration
interface for memcg, which will need both source and target nodes as
arguments. I think this can be a great idea.  It should be able to
support our demotion use cases as well.

> --
> Michal Hocko
> SUSE Labs
