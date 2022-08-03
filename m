Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7521C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 19:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238144AbiHCTWW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 15:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236148AbiHCTWU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 15:22:20 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C97313E767
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 12:22:18 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id i4so13634456qvv.7
        for <linux-doc@vger.kernel.org>; Wed, 03 Aug 2022 12:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=c0anUqpP2C7sKweDNx6tz5eeeYeeCajDunQoGL7Ybz0=;
        b=nLaoCQbdkBOJTfuCR3nvXQ6rGDdylxjmz1jZ8Tm+nJhB6uRVEzkJe9J4YvGiaLZJIB
         eWPFrU1LaDhgB2s2lw2eeu9wk/emPqRLAABUjCEPpahzxkyec1saBHzutYUk9LjwCn1W
         NDD4glL0si9CYF94gTQapu1l/uknEiTgOX1JK7P0ZfPvWAntrY41DosPltyCmtNzocQd
         u0y+VnjfLoLyPQNDeLJGLo35kTLX8U7m3Md4z4tb8wRmVQCEoDIBm+JIZRe1M2hFceis
         Nk7XsPtsik05vCUxaU21b6nk/4AzADB2kCAMEgmcUghE3x5ypb3WJtPKnhrzaNTK6OU0
         cJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=c0anUqpP2C7sKweDNx6tz5eeeYeeCajDunQoGL7Ybz0=;
        b=GjS18hhShMjOxw7N5w8PlA4yUZ9wG1j9gLioEE6HAukPVE+eEzm2/vLob0ZlGKh5d0
         UzlL/AZ+X4ds1bvfuFTM3FogJvYgCW3sgiGK41Y+jO6rY24RzC35nWTC9EacmmZSb6DZ
         q/6E4y54tH6EWUJg0mSODLdEp2K1IUT0nqvn2Na6/bcSQ2cTn0/Bp0lV/bUnEeXreu9F
         PMRZcZN586IKtK2beQXPIAUGnMyI8Qkm4bpTEbMz4Cv6QdjtI8RYTLP0JCP6DZWhRU12
         qKOUi7XpwRNZ4WrxtZpKZBWrWPySH3eq58hI9M6n0S9sZ0G0jHKdc3foS3zecIQganYb
         HwKg==
X-Gm-Message-State: ACgBeo1Wl8Clsbr9qcNLN+vjiaTpaSU9bNFal98S5eCP+vXlWLz21i+H
        PbHABD524fZEuBHITTsDDGYSkQ==
X-Google-Smtp-Source: AA6agR4TkWrYPxjKmcUZ27Y4WmzwJ9slM6j/RDvOC1vEiV2I9GNQ5PtUVSvJJX3BnrPwhRyC6MYmEQ==
X-Received: by 2002:ad4:5f0a:0:b0:474:8978:9a9f with SMTP id fo10-20020ad45f0a000000b0047489789a9fmr23754893qvb.71.1659554538002;
        Wed, 03 Aug 2022 12:22:18 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::a0f2])
        by smtp.gmail.com with ESMTPSA id bm7-20020a05620a198700b006b629f86244sm13216262qkb.50.2022.08.03.12.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Aug 2022 12:22:17 -0700 (PDT)
Date:   Wed, 3 Aug 2022 15:22:16 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Tejun Heo <tj@kernel.org>
Cc:     Chengming Zhou <zhouchengming@bytedance.com>, surenb@google.com,
        mingo@redhat.com, peterz@infradead.org, corbet@lwn.net,
        akpm@linux-foundation.org, rdunlap@infradead.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org
Subject: Re: [PATCH 8/9] sched/psi: add kernel cmdline parameter
 psi_inner_cgroup
Message-ID: <YurK6MXdJPrV2VYS@cmpxchg.org>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
 <20220721040439.2651-9-zhouchengming@bytedance.com>
 <Yt7KQc0nnOypB2b2@cmpxchg.org>
 <YuAqWprKd6NsWs7C@slm.duckdns.org>
 <5a3410d6-428d-9ad1-3e5a-01ca805ceeeb@bytedance.com>
 <Yuq3Q6Y9dRnjjcPt@slm.duckdns.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yuq3Q6Y9dRnjjcPt@slm.duckdns.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 03, 2022 at 07:58:27AM -1000, Tejun Heo wrote:
> Hello,
> 
> On Wed, Aug 03, 2022 at 08:17:22PM +0800, Chengming Zhou wrote:
> > > Assuming the above isn't wrong, if we can figure out how we can re-enable
> > > it, which is more difficult as the counters need to be resynchronized with
> > > the current state, that'd be ideal. Then, we can just allow each cgroup to
> > > enable / disable PSI reporting dynamically as they see fit.
> > 
> > This method is more fine-grained but more difficult like you said above.
> > I think it may meet most needs to disable PSI stats in intermediate cgroups?
> 
> So, I'm not necessarily against implementing something easier but we at
> least wanna get the interface right, so that if we decide to do the full
> thing later we can easily expand on the existing interface. ie. let's please
> not be too hacky. I don't think it'd be that difficult to implement
> per-cgroup disable-only operation that we can later expand to allow
> re-enabling, right?

It should be relatively straight-forward to disable and re-enable
state aggregation, time tracking, averaging on a per-cgroup level, if
we can live with losing history from while it was disabled. I.e. the
avgs will restart from 0, total= will have gaps - should be okay, IMO.

Where it gets trickier is also stopping the tracking of task counts in
a cgroup. For re-enabling afterwards, we'd have to freeze scheduler
and cgroup state and find all tasks of interest across all CPUs for
the given cgroup to recreate the counts. I'm not quite sure whether
that's feasible, and if so, whether it's worth the savings.

It might be good to benchmark the two disabling steps independently.
Maybe stopping aggregation while keeping task counts is good enough,
and we can commit to a disable/re-enable interface from the start.

Or maybe it's all in the cachelines and iteration, and stopping the
aggregation while still writing task counts isn't saving much. In that
case we'd have to look closer at reconstructing task counts, to see if
later re-enabling is actually a practical option or whether a one-off
kill switch is more realistic.

Chengming, can you experiment with disabling: record_times(), the
test_state() loop and state_mask construction, and the averaging
worker - while keeping the groupc->tasks updates?
