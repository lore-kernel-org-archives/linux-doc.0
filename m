Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF23EC4332F
	for <linux-doc@archiver.kernel.org>; Tue, 13 Dec 2022 13:43:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235749AbiLMNnP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Dec 2022 08:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235768AbiLMNnC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Dec 2022 08:43:02 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B95A0D8E;
        Tue, 13 Dec 2022 05:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670938981; x=1702474981;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=XCQGGTjFZDCNegxIbrsrKbDLonWPRMS8SgLrOu3wwKk=;
  b=VZmYsUSKZjvlKomuMD689fIIhTd7j1Tw8vbxBgtYJ+6oqZ92WTB85Ffp
   EZmmiN2bzre3pupahYqFTq5ZmtgSPFnm/OJdW0shvRsfyvadYANythArN
   W1jL9ZeTStSxPaF4wACKyrY8zZj5QyEyP2tsJ25jCQhX0JV3XGfKTLJNT
   y+hlmnAXkrxkxWT3RfBFwRLtNp4X+nIn5/bxJocLPoY2irCip8HXrUJHv
   IKgCh+6028QZIC0xWxUzwoO95ZZC/EdFa+y8HS02EjL3epJiJg5AqFuwC
   HPagXXrvgxOpNS/DbLTnwKO3GdO1fsms75rzOVqBn/m+vu21ih6dUW/xg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="297810521"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="297810521"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 05:43:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="790936440"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="790936440"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 05:42:57 -0800
From:   "Huang, Ying" <ying.huang@intel.com>
To:     Michal Hocko <mhocko@suse.com>,
        Mina Almasry <almasrymina@google.com>, weixugc@google.com
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
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
Subject: Re: [PATCH v3] mm: Add nodes= arg to memory.reclaim
In-Reply-To: <Y5g9D12uEr7HpP5K@dhcp22.suse.cz> (Michal Hocko's message of
        "Tue, 13 Dec 2022 09:51:27 +0100")
References: <20221202223533.1785418-1-almasrymina@google.com>
        <Y5bsmpCyeryu3Zz1@dhcp22.suse.cz>
        <CAHS8izM-XdLgFrQ1k13X-4YrK=JGayRXV_G3c3Qh4NLKP7cH_g@mail.gmail.com>
        <87k02volwe.fsf@yhuang6-desk2.ccr.corp.intel.com>
        <Y5g9D12uEr7HpP5K@dhcp22.suse.cz>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date:   Tue, 13 Dec 2022 21:42:02 +0800
Message-ID: <87bko7h13p.fsf@yhuang6-desk2.ccr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Michal Hocko <mhocko@suse.com> writes:

> On Tue 13-12-22 14:30:57, Huang, Ying wrote:
>> Mina Almasry <almasrymina@google.com> writes:
> [...]
>> After these discussion, I think the solution maybe use different
>> interfaces for "proactive demote" and "proactive reclaim".  That is,
>> reconsider "memory.demote".  In this way, we will always uncharge the
>> cgroup for "memory.reclaim".  This avoid the possible confusion there.
>> And, because demotion is considered aging, we don't need to disable
>> demotion for "memory.reclaim", just don't count it.
>
> As already pointed out in my previous email, we should really think more
> about future requirements. Do we add memory.promote interface when there
> is a request to implement numa balancing into the userspace? Maybe yes
> but maybe the node balancing should be more generic than bound to memory
> tiering and apply to a more fine grained nodemask control.
>
> Fundamentally we already have APIs to age (MADV_COLD, MADV_FREE),
> reclaim (MADV_PAGEOUT, MADV_DONTNEED) and MADV_WILLNEED to prioritize
> (swap in, or read ahead) which are per mm/file. Their primary usability
> issue is that they are process centric and that requires a very deep
> understanding of the process mm layout so it is not really usable for a
> larger scale orchestration.
> The important part of those interfaces is that they do not talk about
> demotion because that is an implementation detail. I think we want to
> follow that model at least. From a higher level POV I believe we really
> need an interface to age&reclaim and balance memory among nodes. Are
> there more higher level usecases?

Yes.  If the high level interface can satisfy the requirements, we
should use them or define them.  But I guess Mina and Xu has some
requirements at the level of memory tiers (demotion/promotion)?

Best Regards,
Huang, Ying
