Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 258A4C7619A
	for <linux-doc@archiver.kernel.org>; Wed,  5 Apr 2023 21:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbjDEVJm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Apr 2023 17:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234331AbjDEVJe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Apr 2023 17:09:34 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1718684
        for <linux-doc@vger.kernel.org>; Wed,  5 Apr 2023 14:09:22 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id bt19so24575368pfb.3
        for <linux-doc@vger.kernel.org>; Wed, 05 Apr 2023 14:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680728960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6MLGKvl/FzbLKzi4k20FGuOr9OHamYGW4v4bUuCe4Pw=;
        b=n28dxYvaxPfq5JUzsQqU6kb+bImfDaBPK4ACVIjk36q9wbwO2Ix5OhdxzRqVx+gjh7
         vPGDsy2Z/CkVDlg0sacBgvwyhP7Cr0CdN6fmm+V+cxa8+RtEgXZfvRyRNCKyvdMkH3IG
         AZIFu3+14yJXDRgL1cAXUeLDtssdqJhhsK3uUP9LNJOKnlmtgEbiGDaecgZ2kxcyuk+W
         ieFXO/j1UfguA8IRQyx5S+9eNafvz99yFQpPT34J9xYi+XPsnNySq6lG7R9Y+uCWDb48
         YGdH1N2wSkTT52iPU+n1BLdHUrV7R+KBKxYE48TbebgWoPnGhsUXfQZtwsoUmHH5p6Uh
         UXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680728960;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MLGKvl/FzbLKzi4k20FGuOr9OHamYGW4v4bUuCe4Pw=;
        b=PRocul+K5RDQyfkMWkeU9jhzm4w/CQLfAUjddUqzx5cPe1g2Yg2jTadlsXTiKVCT4L
         V7yBXl5aaPekqX2ImkrcgvbZMYTp28P+w4CPoaXskAJ9mI9dFx2LeDjWFedaQ1W+MO6j
         f32n7TWJyCC7zdZpvGtwFBhmXFPYjqVVX2x0fEGAlRswgIn93fGyp/W+WLhy8HTsRj/K
         MDum8CXtsY0xTk0oMdRrudtY8pxw5YCs8q/mSZcJZOnHDOXskmTfSbjtO/E9yQj4+Wtw
         M+hoYPnDEDaYKfTwDfHbe1eK87eZc3pmQGWuULnyFRo659zabAFmY81gcSZlzv2Rpk2+
         /wGQ==
X-Gm-Message-State: AAQBX9c+k4DXufWBWWL1uR+EudmZFrgdFTVx3c111XJi9ySYI574clFB
        1Wt+7kc+GcE/bFwnKYVhmQSlmfG917RwTmL97ji/MA==
X-Google-Smtp-Source: AKy350b0IUXlBzjwLLr6SEpK1cx38ABlr+yVbGlA9Wc0dSXUg0uG5eQHWSVFl7t3uBAdQCZoYdM8DgcCcOXiLa8I580=
X-Received: by 2002:a65:430c:0:b0:514:3d3d:da5a with SMTP id
 j12-20020a65430c000000b005143d3dda5amr427665pgq.3.1680728960348; Wed, 05 Apr
 2023 14:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230330224348.1006691-1-davidai@google.com> <20230405080548.GW4253@hirez.programming.kicks-ass.net>
In-Reply-To: <20230405080548.GW4253@hirez.programming.kicks-ass.net>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 5 Apr 2023 14:08:43 -0700
Message-ID: <CAGETcx-qgKeUQ60VhvW+hYUY-sMh-wX1G8zSwJUFpJ-u7aU6aA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] Improve VM DVFS and task placement behavior
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     David Dai <davidai@google.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oliver.upton@linux.dev>,
        James Morse <james.morse@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Valentin Schneider <vschneid@redhat.com>,
        kernel-team@android.com, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 5, 2023 at 1:06=E2=80=AFAM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Thu, Mar 30, 2023 at 03:43:35PM -0700, David Dai wrote:
> > Hi,
> >
> > This patch series is a continuation of the talk Saravana gave at LPC 20=
22
> > titled "CPUfreq/sched and VM guest workload problems" [1][2][3]. The gi=
st
> > of the talk is that workloads running in a guest VM get terrible task
> > placement and DVFS behavior when compared to running the same workload =
in
> > the host. Effectively, no EAS for threads inside VMs. This would make p=
ower
> > and performance terrible just by running the workload in a VM even if w=
e
> > assume there is zero virtualization overhead.
> >
> > We have been iterating over different options for communicating between
> > guest and host, ways of applying the information coming from the
> > guest/host, etc to figure out the best performance and power improvemen=
ts
> > we could get.
> >
> > The patch series in its current state is NOT meant for landing in the
> > upstream kernel. We are sending this patch series to share the current
> > progress and data we have so far. The patch series is meant to be easy =
to
> > cherry-pick and test on various devices to see what performance and pow=
er
> > benefits this might give for others.
> >
> > With this series, a workload running in a VM gets the same task placeme=
nt
> > and DVFS treatment as it would when running in the host.
> >
> > As expected, we see significant performance improvement and better
> > performance/power ratio. If anyone else wants to try this out for your =
VM
> > workloads and report findings, that'd be very much appreciated.
> >
> > The idea is to improve VM CPUfreq/sched behavior by:
> > - Having guest kernel to do accurate load tracking by taking host CPU
> >   arch/type and frequency into account.
> > - Sharing vCPU run queue utilization information with the host so that =
the
> >   host can do proper frequency scaling and task placement on the host s=
ide.
>
> So, not having actually been send many of the patches I've no idea what
> you've done... Please, eradicate this ridiculous idea of sending random
> people a random subset of a patch series. Either send all of it or none,
> this is a bloody nuisance.

Sorry, that was our intention, but had a scripting error. It's been fixed.

I have a script to use with git send-email's --to-cmd and --cc-cmd
option. It uses get_maintainers.pl to figure out who to email, but it
gets trickier for a patch series that spans maintainer trees.

v2 and later will have everyone get all the patches.

> Having said that; my biggest worry is that you're making scheduler
> internals into an ABI. I would hate for this paravirt interface to tie
> us down.

The only 2 pieces of information shared between host/guest are:

1. Host CPU frequency -- this isn't really scheduler internals and
will map nicely to a virtual cpufreq driver.

2. A vCPU util value between 0 - 1024 where 1024 corresponds to the
highest performance point across all CPUs (taking freq, arch, etc into
consideration). Yes, this currently matches how the run queue util is
tracked, but we can document the interface as "percentage of max
performance capability", but representing it as 0 - 1024 instead of
0-100. That way, even if the scheduler changes how it tracks util in
the future, we can still keep this interface between guest/host and
map it appropriately on the host end.

In either case, we could even have a Windows guest where they might
track vCPU utilization differently and still have this work with the
Linux host with this interface.

Does that sound reasonable to you?

Another option is to convert (2) into a "CPU frequency" request (but
without latching it to values in the CPUfreq table) but it'll add some
unnecessary math (with division) on the guest and host end. But I'd
rather keep it as 0-1024 unless you really want this 2nd option.

-Saravana
