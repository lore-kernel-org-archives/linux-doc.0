Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF0EC433F5
	for <linux-doc@archiver.kernel.org>; Sun,  3 Apr 2022 06:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiDCG62 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 3 Apr 2022 02:58:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233148AbiDCG62 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 3 Apr 2022 02:58:28 -0400
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18751381B4
        for <linux-doc@vger.kernel.org>; Sat,  2 Apr 2022 23:56:31 -0700 (PDT)
Received: by mail-io1-xd2f.google.com with SMTP id r2so7750747iod.9
        for <linux-doc@vger.kernel.org>; Sat, 02 Apr 2022 23:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZlimpDrEHgO1rzyCYuAbLljxvciHy4QdNJs4xVtrnk=;
        b=T2EKk7dyMep8/29cdvnmpJvSBhC3tVejpCx/rLNsKf9qKNg480LjqMQQCRXV1WS/ql
         IiF4bR7DYMvv35us0w7WT1RPk7OpoLdrERvZ8VyxZJqHoBllBNyHAYErlPDEkLB+DHQN
         pqmkgvAu33MWBs0sIXCOx4fkIX797PCMn7wSpeVMYSEIROsVlttHatLTe/nIo46c5Yu9
         +PI1uA1Pynxd42/t/8MA5rtp2aNcmszrbKSoR5yHjyZfvqumvyp6bSGaB3AGan996wek
         XoIdhE2QCNIGkDF/ozpMGNF1ex5zm1Zqts+fajdYUF28OEIrsXf5yYKjIK5jzzYybDaa
         3idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZlimpDrEHgO1rzyCYuAbLljxvciHy4QdNJs4xVtrnk=;
        b=jZyptuRRzCmrk9pALkTTBxHdHJnTpPPPK8HCMXdi9fdyhcUT/kiJjMMTPGDecs8aOA
         V6YwL1zLFl8x1ttf52HuRLW/aBEHBMfZAzNa7X07UDWojTAdUe2uwDz1K0Kx37Ozafpl
         pKLIhFLWwFChah01ToiTaZpEQC5yJ4TSZhtAeO//HptJuM9lBFol54b6yLguB6Ajqr8r
         u5OP4rSqQYYRM1JoE6PaPSeK5v2rtvaz+XNdAARDbC4boCBrnzU8A3Vgk7tj+Jqzkln1
         QC+IUiaK0XvfPxPTh62KK/cOIvtjQqOrYj3ifdqCtLTqJswSHJXaggtBOFsXtoYJDQ2S
         af6w==
X-Gm-Message-State: AOAM533xk+3qHwVHw2KH7nZlqwBRA3HhBGfNUhg83YerN9TSmp1dQNmE
        XtyuraBkZ3qNKBdSDX55U1DjALRSXbL8EzWUOIWQYQ==
X-Google-Smtp-Source: ABdhPJzb5mBXYffh2qbyaAwkzrHxSsPGl5iPs/oVvkZeOgVaq4/cqjWLGtERImQrJF6BNnSrg/zcLtNNEsH2s3lfa5Y=
X-Received: by 2002:a05:6602:2c52:b0:646:2488:a9a0 with SMTP id
 x18-20020a0566022c5200b006462488a9a0mr3051360iov.130.1648968990332; Sat, 02
 Apr 2022 23:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220331084151.2600229-1-yosryahmed@google.com>
 <YkcEMdsi9G5y8mX4@dhcp22.suse.cz> <CAAPL-u_i-Mp-Bo7LtP_4aJscY=1JHG_y1H_-A7N_HRAgtz+arg@mail.gmail.com>
 <87y20nzyw4.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87y20nzyw4.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Wei Xu <weixugc@google.com>
Date:   Sat, 2 Apr 2022 23:56:19 -0700
Message-ID: <CAAPL-u8wjtBRE7KZyZjoQ0eTJecnW35uEXAE3KU0M+AvL=5-ug@mail.gmail.com>
Subject: Re: [PATCH resend] memcg: introduce per-memcg reclaim interface
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Michal Hocko <mhocko@suse.com>,
        Yosry Ahmed <yosryahmed@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Rientjes <rientjes@google.com>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        Jonathan Corbet <corbet@lwn.net>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Greg Thelen <gthelen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 2, 2022 at 1:13 AM Huang, Ying <ying.huang@intel.com> wrote:
>
> Wei Xu <weixugc@google.com> writes:
>
> > On Fri, Apr 1, 2022 at 6:54 AM Michal Hocko <mhocko@suse.com> wrote:
> >>
> >> On Thu 31-03-22 08:41:51, Yosry Ahmed wrote:
> >> > From: Shakeel Butt <shakeelb@google.com>
> >> >
>
> [snip]
>
> >> > Possible Extensions:
> >> > --------------------
> >> >
> >> > - This interface can be extended with an additional parameter or flags
> >> >   to allow specifying one or more types of memory to reclaim from (e.g.
> >> >   file, anon, ..).
> >> >
> >> > - The interface can also be extended with a node mask to reclaim from
> >> >   specific nodes. This has use cases for reclaim-based demotion in memory
> >> >   tiering systens.
> >> >
> >> > - A similar per-node interface can also be added to support proactive
> >> >   reclaim and reclaim-based demotion in systems without memcg.
> >> >
> >> > For now, let's keep things simple by adding the basic functionality.
> >>
> >> Yes, I am for the simplicity and this really looks like a bare minumum
> >> interface. But it is not really clear who do you want to add flags on
> >> top of it?
> >>
> >> I am not really sure we really need a node aware interface for memcg.
> >> The global reclaim interface will likely need a different node because
> >> we do not want to make this CONFIG_MEMCG constrained.
> >
> > A nodemask argument for memory.reclaim can be useful for memory
> > tiering between NUMA nodes with different performance.  Similar to
> > proactive reclaim, it can allow a userspace daemon to drive
> > memcg-based proactive demotion via the reclaim-based demotion
> > mechanism in the kernel.
>
> I am not sure whether nodemask is a good way for demoting pages between
> different types of memory.  For example, for a system with DRAM and
> PMEM, if specifying DRAM node in nodemask means demoting to PMEM, what
> is the meaning of specifying PMEM node? reclaiming to disk?
>
> In general, I have no objection to the idea in general.  But we should
> have a clear and consistent interface.  Per my understanding the default
> memcg interface is for memory, regardless of memory types.  The memory
> reclaiming means reduce the memory usage, regardless of memory types.
> We need to either extending the semantics of memory reclaiming (to
> include memory demoting too), or add another interface for memory
> demoting.

Good point.  With the "demote pages during reclaim" patch series,
reclaim is already extended to demote pages as well.  For example,
can_reclaim_anon_pages() returns true if demotion is allowed and
shrink_page_list() can demote pages instead of reclaiming pages.

Currently, demotion is disabled for memcg reclaim, which I think can
be relaxed and also necessary for memcg-based proactive demotion.  I'd
like to suggest that we extend the semantics of memory.reclaim to
cover memory demotion as well.  A flag can be used to enable/disable
the demotion behavior.
