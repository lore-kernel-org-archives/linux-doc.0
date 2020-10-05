Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA10CC4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B050520674
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 13:51:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJENvn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:51:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39992 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgJENvf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 09:51:35 -0400
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1kPQto-0000xJ-Pa
        for linux-doc@vger.kernel.org; Mon, 05 Oct 2020 13:51:32 +0000
Received: by mail-wm1-f71.google.com with SMTP id l15so1734277wmh.9
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 06:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bQQp2PNEq0FY7Hqco5htUGBXM0/SRgDQIUWJr9BdqaM=;
        b=TbmdPHJhZJ0gXV8yDvNIWXjqRgel1yga5HRhnJx0wC01QuItUoMDEp1MFvHnhAlP6Q
         jQZW7ejAECPhjAeB0ZQQoLr+FkIAejFjh8GrivEXhqnaVvPg6UfVJca7AIP/z2iBBcyr
         XePNrss/s1FMEkR2jBk/N4d6KN4sITGTuYA3dBy9CF72zW3aOOU0tK7nNIu4DlMZsgUY
         J59iOk+IdY/d2O24YM2PjZFOj1oIJr0a49ND+6sM5fUfqG249oMDkKkN48oscqkkqIOO
         lEQll8kbrEvgaVztI54yzoS0j85r6ITu5x1heDxknggX6+DdsuG8PNlNXrW+f/eq5+UV
         bRSg==
X-Gm-Message-State: AOAM532leKfpZ4/BftFSmeIFpniEtDjvBHoGTTAMZSXwUjiYwR4aGFQ7
        iVcyi51h7XayPqwRzWhMsmAWEzQEo+aQmxlJhNGLOlb9TsGSjAWEhaA5nv8qcSiREpA+N9PW953
        AoB0UtTcXdmoZ+MqMb6JlTDsWm5dPrMCDTuGWJg==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr17121823wmc.9.1601905892394;
        Mon, 05 Oct 2020 06:51:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwofc6USifXN7h+C0hcGmEQa4n+RfAxxI8ZWg7rnK634gMSN9Wa915TnRbfzQlf/I65n7VhQw==
X-Received: by 2002:a1c:28a:: with SMTP id 132mr17121788wmc.9.1601905892065;
        Mon, 05 Oct 2020 06:51:32 -0700 (PDT)
Received: from localhost (host-79-36-133-218.retail.telecomitalia.it. [79.36.133.218])
        by smtp.gmail.com with ESMTPSA id t202sm13779805wmt.14.2020.10.05.06.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 06:51:31 -0700 (PDT)
Date:   Mon, 5 Oct 2020 15:51:30 +0200
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
Message-ID: <20201005135130.GA850459@xps-13-7390>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
 <20201005112555.GA108347@chrisdown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201005112555.GA108347@chrisdown.name>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 05, 2020 at 12:25:55PM +0100, Chris Down wrote:
> Andrea Righi writes:
> > This feature has been successfully used to improve hibernation time of
> > cloud computing instances.
> > 
> > Certain cloud providers allow to run "spot instances": low-priority
> > instances that run when there are spare resources available and can be
> > stopped at any time to prioritize other more privileged instances [2].
> > 
> > Hibernation can be used to stop these low-priority instances nicely,
> > rather than losing state when the instance is shut down. Being able to
> > quickly stop low-priority instances can be critical to provide a better
> > quality of service in the overall cloud infrastructure [1].
> > 
> > The main bottleneck of hibernation is represented by the I/O generated
> > to write all the main memory (hibernation image) to a persistent
> > storage.
> > 
> > Opportunistic memory reclaimed can be used to reduce the size of the
> > hibernation image in advance, for example if the system is idle for a
> > certain amount of time, so if an hibernation request happens, the kernel
> > has already saved most of the memory to the swap device (caches have
> > been dropped, etc.) and hibernation can complete quickly.
> 
> Hmm, why does this need to be implemented in kernelspace? We already have
> userspace shrinkers using memory pressure information as part of PID control
> already (eg. senpai). Using memory.high and pressure information looks a lot
> easier to reason about than having to choose an absolute number ahead of
> time and hoping it works.

senpai is focused at estimating the ideal memory requirements without
affecting performance. And this covers the use case about reducing
memory footprint.

In my specific use-case (hibernation) I would let the system use as much
memory as possible if it's doing any activity (reclaiming memory only
when the kernel decides that it needs to reclaim memory) and apply a
more aggressive memory reclaiming policy when the system is mostly idle.

I could probably implement this behavior adjusting memory.high
dynamically, like senpai, but I'm worried about potential sudden large
allocations that may require to respond faster at increasing
memory.high. I think the user-space triggered memory reclaim approach is
a safer solution from this perspective.

-Andrea
