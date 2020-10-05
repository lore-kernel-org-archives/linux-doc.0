Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD067C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 15:40:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84D07206DD
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 15:40:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728724AbgJEPkB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:40:01 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:44507 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbgJEPjx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 11:39:53 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1kPSac-0001Rv-SF
        for linux-doc@vger.kernel.org; Mon, 05 Oct 2020 15:39:50 +0000
Received: by mail-wr1-f69.google.com with SMTP id a2so4152872wrp.8
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 08:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mM+mXfJfYWo+rDTzms1HSoE47Buw2ePWt0ypNfOv5eA=;
        b=HvhIfGg4lXMVp7tgzHYsiy98wDJc4eQ2Hx+UA677eclGdDWnpcAiBnBa7rTXImMLN0
         2oSJojAHmC6OATwpVbuvQhICshr6lAV+ArIqxHmmtPyNkqv2VCneUBTxGMi6KApHLCol
         mnaNk/dVYS04kshRCo8fRbcKN90jMrh37B4AlYf13CzSon7Rt7FdtVpr+digWR1l+CxU
         TDN+iQUhdYYpjiA6EzPN8gd3iwSFmCp2DSewYB9SvTg2Ws2kMvyBuoUsH2tG3mWFhYzB
         17X9gDvN28JdjnIw203/PP2gzgeSgdoGONiTNq1yOV4m8CNfyCUU3S83hYVIPRjN4u9U
         tvCw==
X-Gm-Message-State: AOAM532u1AfNgFblb5eQj3sIimm8sTkIK8bh/n/FRPdH83uiwqa3bKS0
        RVZll7uxvv46sDr/fTdbtFzfPf9PWwyd94Ie/2dgAX+Ldk8nMojaDn1vCd5nQCKCQG9rZlYoG82
        JnukFw+MvRE3b0ROEG2N+KwcknAHuGCkx/GimGg==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr18239087wrp.161.1601912390435;
        Mon, 05 Oct 2020 08:39:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyR5jOPYrgRLM5RUrs8DlVxB9ydRU8TU1jx6BFSljPHmzKZvGegdovcj80QusTJb5Aun56xw==
X-Received: by 2002:adf:f6cd:: with SMTP id y13mr18239067wrp.161.1601912390139;
        Mon, 05 Oct 2020 08:39:50 -0700 (PDT)
Received: from localhost (host-79-36-133-218.retail.telecomitalia.it. [79.36.133.218])
        by smtp.gmail.com with ESMTPSA id c1sm438226wru.49.2020.10.05.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:39:49 -0700 (PDT)
Date:   Mon, 5 Oct 2020 17:39:48 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Chris Down <chris@chrisdown.name>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luigi Semenzato <semenzato@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, cgroups@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2] Opportunistic memory reclaim
Message-ID: <20201005153948.GC783944@xps-13-7390>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
 <20201005112555.GA108347@chrisdown.name>
 <20201005135130.GA850459@xps-13-7390>
 <20201005144612.GB108347@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005144612.GB108347@chrisdown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 05, 2020 at 03:46:12PM +0100, Chris Down wrote:
> Andrea Righi writes:
> > senpai is focused at estimating the ideal memory requirements without
> > affecting performance. And this covers the use case about reducing
> > memory footprint.
> > 
> > In my specific use-case (hibernation) I would let the system use as much
> > memory as possible if it's doing any activity (reclaiming memory only
> > when the kernel decides that it needs to reclaim memory) and apply a
> > more aggressive memory reclaiming policy when the system is mostly idle.
> 
> From this description, I don't see any reason why it needs to be implemented
> in kernel space. All of that information is available to userspace, and all
> of the knobs are there.
> 
> As it is I'm afraid of the "only when the system is mostly idle" comment,
> because it's usually after such periods that applications need to do large
> retrievals, and now they're going to be in slowpath (eg. periodic jobs).

True, but with memory.high there's the risk to trash some applications
badly if I'm not reacting fast at increasing memory.high.

However, something that I could definitely want to try is to move all
the memory hogs to a cgroup, set memory.high to a very small value and
then immediately set it back to 'max'. The effect should be pretty much
the same as calling shrink_all_memory(), that is what I'm doing with my
memory.swap.reclaim.

> 
> Such tradeoffs for a specific situation might be fine in userspace as a
> distribution maintainer, but codifying them in the kernel seems premature to
> me, especially for a knob which we will have to maintain forever onwards.
> 
> > I could probably implement this behavior adjusting memory.high
> > dynamically, like senpai, but I'm worried about potential sudden large
> > allocations that may require to respond faster at increasing
> > memory.high. I think the user-space triggered memory reclaim approach is
> > a safer solution from this perspective.
> 
> Have you seen Shakeel's recent "per-memcg reclaim interface" patches? I
> suspect they may help you there.

Yes, Michal pointed out to me his work, it's basically the same approach
that I'm using.

I started this work with a patch that was hibernation specific
(https://lore.kernel.org/lkml/20200601160636.148346-1-andrea.righi@canonical.com/);
this v2 was the natural evolution of my previous work and I didn't
notice that something similar has been posted in the meantime.

Anyway, I already contacted Shakeel, so we won't duplicate the efforts
in the future. :)

Thanks for your feedback!
-Andrea
