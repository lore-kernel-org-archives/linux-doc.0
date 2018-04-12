Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E4C77DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 19:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753072AbeDLTNG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 15:13:06 -0400
Received: from merlin.infradead.org ([205.233.59.134]:32768 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753063AbeDLTNF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 15:13:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=SqtPu57Ed2MBcx+aJ581nTJK64gNNPOHS+2wVNDRAIk=; b=vinbE4QhVyPXlt/JUbqu7cxly
        HLIfgjv7TG1FfKCbdlIwjrKA/EBUlNJHhdWVzJZ2PVeuzTOpriHfPDVWoy0pqdIVxuyIxjw3hh0JA
        ck8eetTduO85FFybIJ0tIbEz4z8FC/lHZb4DW6/LXhjvxDh7VAIJxDOBXcDrsPLgbPM42Wp3ffmW5
        3HNyP/6doVS2Rsv17Ke8yS8gJKFDpFlbiSDoWMpoQFD5tygFs8zfepz48U5LHa5b7HHhBmQReH+jT
        gllQPDX4ko+X1hTm2dWxn0JJX3rCXY57G5v3bzcSbLsCNbbvHc3FTNWygK48p0GNHnpuOiqEIL69F
        l5Q/dUTLQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f6heL-0005l9-Cj; Thu, 12 Apr 2018 19:12:49 +0000
Received: by worktop (Postfix, from userid 1000)
        id 0A6E06E079F; Thu, 12 Apr 2018 21:13:19 +0200 (CEST)
Date:   Thu, 12 Apr 2018 21:13:18 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Patrick Bellasi <patrick.bellasi@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Joel Fernandes <joelaf@google.com>,
        Steve Muckle <smuckle@google.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Morten Rasmussen <morten.rasmussen@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, Paul Turner <pjt@google.com>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] sched/fair: add support to tune PELT ramp/decay timings
Message-ID: <20180412191318.GA7129@worktop.programming.kicks-ass.net>
References: <20180409165134.707-1-patrick.bellasi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180409165134.707-1-patrick.bellasi@arm.com>
User-Agent: Mutt/1.5.22.1 (2013-10-16)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 09, 2018 at 05:51:34PM +0100, Patrick Bellasi wrote:
> The PELT half-life is the time [ms] required by the PELT signal to build
> up a 50% load/utilization, starting from zero. This time is currently
> hardcoded to be 32ms, a value which seems to make sense for most of the
> workloads.
> 
> However, 32ms has been verified to be too long for certain classes of
> workloads. For example, in the mobile space many tasks affecting the
> user-experience run with a 16ms or 8ms cadence, since they need to match
> the common 60Hz or 120Hz refresh rate of the graphics pipeline.
> This contributed so fare to the idea that "PELT is too slow" to properly
> track the utilization of interactive mobile workloads, especially
> compared to alternative load tracking solutions which provides a
> better representation of tasks demand in the range of 10-20ms.

Initially the 32 was chosen to more or less correspond to the effective
scheduling period (sysctl_sched_latency based). The thinking was that if
you pick a PELT window shorter than the period, the result becomes
unstable due to not all tasks getting an equal go at things.

(of course, stuffing enough tasks on a rq will break this, but at that
point you have worse problems to deal with)

Should we retain this? Esp. with the lower end (8ms) I worry we'll see
more of those effects.


> Fortunately, since the integration of the utilization estimation
> support in mainline kernel:
> 
>    commit 7f65ea42eb00 ("sched/fair: Add util_est on top of PELT")
> 
> a fast decay time is no longer an issue for tasks utilization estimation.
> Although estimated utilization does not slow down the decay of blocked
> utilization on idle CPUs, for mobile workloads this seems not to be a
> major concern compared to the benefits in interactivity responsiveness.

By picking a smaller PELT window, the util_est window shrinks
correspondingly; is that intentional or do we want to modify
UTIL_EST_WEIGHT_SHIFT to negate the PELT window changes?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
