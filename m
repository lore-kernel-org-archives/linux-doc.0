Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF62C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 13 Dec 2022 07:49:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbiLMHtM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Dec 2022 02:49:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234244AbiLMHtL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Dec 2022 02:49:11 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8194A13D67
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 23:49:10 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id jn7so14757463plb.13
        for <linux-doc@vger.kernel.org>; Mon, 12 Dec 2022 23:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl3Yao6mN2AiSPWnXX8BOx2+Ij0ONLiwggaARdAt/rY=;
        b=BF6k7/wCZJJeVxACOt4nifXw3+9QOrchqEkwguMyLH9KMLyKBzoTjrJOHvJn6OgLKJ
         B6qpK9Ui9Qomqp1FshqQPWe713zL2W3CbZ4e3iNV6mDsT8lzwwm33pwMNluRWMNv+63/
         KcN6ZybzVkfi+Vj4164zGqEhyhYQdzUJn7df3ZS3uyqbHxQO+ix6+v2oQl1FLlYm61jq
         QVHrjItXSh2K+Xpvh/LMFNjjElVXq119hLWpnRPYD2Kx8NzbqmOJpThq2wfnHfv/147X
         jLKB7EdtKMtLd9B6/SCHmMskYvAP8IHxZj59dCtpSX53oJgfuGzHHUsvkuZM/MsH7LH1
         EZWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl3Yao6mN2AiSPWnXX8BOx2+Ij0ONLiwggaARdAt/rY=;
        b=Tkng8NnCwns5vHZacv4O4mS0HfXjFmqM4OVnRyovIkuyu6LnP720xhhXj0bCdPWQOj
         Dsz6lYaao4wS9ZIjcxSsFmdO2e5OngzUcUW2LtwMq7+eYzV4LA9n7SMD9w8yRUg+6J1P
         tM7uTBuFTGyHl7RRfTsdexYgWUR+Ebvt97tDF8cFzt4qS2ncS4f3+BRnBivLCO/Hp+Ps
         R+UOI/z15SkgbhVw1HBJo6c2E60uSmOqhuYfgdR2bqAERwjB+BJ/xjuRW1JmkBz6sqaJ
         ItxCg39lX9RONqDFeQiyfDNlwQtYsiImpafiF6qwgzlxofv8q9xRLi13ynj0InmWRLbT
         gobQ==
X-Gm-Message-State: ANoB5pmQ0u2KNcBRlyf9tthn+l3xkk9fdhLZxTpwJ5BheT5kiNjFls/8
        +CXwAO1wDlJNi9a5Sa2SmfzaguBsBzA2QIxnLfFScA==
X-Google-Smtp-Source: AA0mqf5/FDPvLYc/mxAtrbLrcnbPofqKLabduN34kSKBzNK6U2S3XMzJH70onUnjgE/t15YXkH/N083y3c/M+TEQY6I=
X-Received: by 2002:a17:90a:8b06:b0:219:41ef:a812 with SMTP id
 y6-20020a17090a8b0600b0021941efa812mr233907pjn.153.1670917749693; Mon, 12 Dec
 2022 23:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20221202223533.1785418-1-almasrymina@google.com>
 <Y5bsmpCyeryu3Zz1@dhcp22.suse.cz> <CAHS8izM-XdLgFrQ1k13X-4YrK=JGayRXV_G3c3Qh4NLKP7cH_g@mail.gmail.com>
 <87k02volwe.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87k02volwe.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Wei Xu <weixugc@google.com>
Date:   Mon, 12 Dec 2022 23:48:57 -0800
Message-ID: <CAAPL-u-cvVuhMJa48zEzFf_e3Gsttq4J7KFm=rva=E++m2zBLQ@mail.gmail.com>
Subject: Re: [PATCH v3] mm: Add nodes= arg to memory.reclaim
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Mina Almasry <almasrymina@google.com>,
        Michal Hocko <mhocko@suse.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 12, 2022 at 10:32 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Mon, Dec 12, 2022 at 12:55 AM Michal Hocko <mhocko@suse.com> wrote:
> >>
> >> On Fri 02-12-22 14:35:31, Mina Almasry wrote:
> >> > The nodes= arg instructs the kernel to only scan the given nodes for
> >> > proactive reclaim. For example use cases, consider a 2 tier memory system:
> >> >
> >> > nodes 0,1 -> top tier
> >> > nodes 2,3 -> second tier
> >> >
> >> > $ echo "1m nodes=0" > memory.reclaim
> >> >
> >> > This instructs the kernel to attempt to reclaim 1m memory from node 0.
> >> > Since node 0 is a top tier node, demotion will be attempted first. This
> >> > is useful to direct proactive reclaim to specific nodes that are under
> >> > pressure.
> >> >
> >> > $ echo "1m nodes=2,3" > memory.reclaim
> >> >
> >> > This instructs the kernel to attempt to reclaim 1m memory in the second tier,
> >> > since this tier of memory has no demotion targets the memory will be
> >> > reclaimed.
> >> >
> >> > $ echo "1m nodes=0,1" > memory.reclaim
> >> >
> >> > Instructs the kernel to reclaim memory from the top tier nodes, which can
> >> > be desirable according to the userspace policy if there is pressure on
> >> > the top tiers. Since these nodes have demotion targets, the kernel will
> >> > attempt demotion first.
> >> >
> >> > Since commit 3f1509c57b1b ("Revert "mm/vmscan: never demote for memcg
> >> > reclaim""), the proactive reclaim interface memory.reclaim does both
> >> > reclaim and demotion. Reclaim and demotion incur different latency costs
> >> > to the jobs in the cgroup. Demoted memory would still be addressable
> >> > by the userspace at a higher latency, but reclaimed memory would need to
> >> > incur a pagefault.
> >> >
> >> > The 'nodes' arg is useful to allow the userspace to control demotion
> >> > and reclaim independently according to its policy: if the memory.reclaim
> >> > is called on a node with demotion targets, it will attempt demotion first;
> >> > if it is called on a node without demotion targets, it will only attempt
> >> > reclaim.
> >> >
> >> > Acked-by: Michal Hocko <mhocko@suse.com>
> >> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >>
> >> After discussion in [1] I have realized that I haven't really thought
> >> through all the consequences of this patch and therefore I am retracting
> >> my ack here. I am not nacking the patch at this statge but I also think
> >> this shouldn't be merged now and we should really consider all the
> >> consequences.
> >>
> >> Let me summarize my main concerns here as well. The proposed
> >> implementation doesn't apply the provided nodemask to the whole reclaim
> >> process. This means that demotion can happen outside of the mask so the
> >> the user request cannot really control demotion targets and that limits
> >> the interface should there be any need for a finer grained control in
> >> the future (see an example in [2]).
> >> Another problem is that this can limit future reclaim extensions because
> >> of existing assumptions of the interface [3] - specify only top-tier
> >> node to force the aging without actually reclaiming any charges and
> >> (ab)use the interface only for aging on multi-tier system. A change to
> >> the reclaim to not demote in some cases could break this usecase.
> >>
> >
> > I think this is correct. My use case is to request from the kernel to
> > do demotion without reclaim in the cgroup, and the reason for that is
> > stated in the commit message:
> >
> > "Reclaim and demotion incur different latency costs to the jobs in the
> > cgroup. Demoted memory would still be addressable by the userspace at
> > a higher latency, but reclaimed memory would need to incur a
> > pagefault."
> >
> > For jobs of some latency tiers, we would like to trigger proactive
> > demotion (which incurs relatively low latency on the job), but not
> > trigger proactive reclaim (which incurs a pagefault). I initially had
> > proposed a separate interface for this, but Johannes directed me to
> > this interface instead in [1]. In the same email Johannes also tells
> > me that meta's reclaim stack relies on memory.reclaim triggering
> > demotion, so it seems that I'm not the first to take a dependency on
> > this. Additionally in [2] Johannes also says it would be great if in
> > the long term reclaim policy and demotion policy do not diverge.
> >
> > [1] https://lore.kernel.org/linux-mm/Y35fw2JSAeAddONg@cmpxchg.org/
> > [2] https://lore.kernel.org/linux-mm/Y36fIGFCFKiocAd6@cmpxchg.org/
>
> After these discussion, I think the solution maybe use different
> interfaces for "proactive demote" and "proactive reclaim".  That is,
> reconsider "memory.demote".  In this way, we will always uncharge the
> cgroup for "memory.reclaim".  This avoid the possible confusion there.
> And, because demotion is considered aging, we don't need to disable
> demotion for "memory.reclaim", just don't count it.

+1 on memory.demote.

> Best Regards,
> Huang, Ying
>
