Return-Path: <SRS0=dOZX=D3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EFEC433DF
	for <linux-doc@archiver.kernel.org>; Tue, 20 Oct 2020 00:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3B2B22400
	for <linux-doc@archiver.kernel.org>; Tue, 20 Oct 2020 00:23:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PpeMbkQh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgJTAXd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Oct 2020 20:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726863AbgJTAXd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Oct 2020 20:23:33 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39CBC0613CE
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2020 17:23:32 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id z33so1123974qth.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2020 17:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TvgIaHB+zCRTE3U91pAvk2x32he6j0EtU+nDKoz+k7U=;
        b=PpeMbkQhz05ujwOQNQu3xw5hmxLoObi5SwbQFxn2FnIXekypEeK8pjmLw9OudD4EXa
         5eZllPJpPpSxhGySXcyub3oaO7um3h4dAIbaPXjDjlwmERqWUEO/AQ6dx+iZHdtTZbMT
         e/L/W3AV9PPYMqKqQbPRjAW0bmluBzyyEL6eA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TvgIaHB+zCRTE3U91pAvk2x32he6j0EtU+nDKoz+k7U=;
        b=SmWV9gM5kLttpk4Nd323/58uZIePdk2QwC9EMI18u+45XLR1oSrxpbv2DQ8Xjva7SS
         hQzOOPQlprJ3FySM/vwd9NedIO4amd25lt23NmygjU5+wewHMp0/P5QB9/IYAtClcTPr
         G2IXZMieGDkMHKJDml1omZUNGyFRroHqHez9e1yKlGIYs84SDuqQNkcowRiQxWWMVcQb
         klz8ax8+s87/vWXsl65dqLWYk5r2uXyq8RvaHQ8bimsKSJnl57gV019Yd9yThfBaiL1A
         BpIiu+4mijrduITo4Y7+/79WERCMM/diheQbo3u3iIKtK6RYu3fex4d7a8R0pexFDnPE
         dwuw==
X-Gm-Message-State: AOAM531MsbfY4moM88V/2l1+303CM383tx9xeYhhAVLJY7lGW/ZQ9ExF
        V4lPVA54fptsJ80e+BYBa43ieJRxxcrGzg==
X-Google-Smtp-Source: ABdhPJxNwpR4tEv+uQ3CmMRBbtVlG67C1mfzqIAlQeMgtLvPlbK082RmW3RlGSDPskDpouExsZE6vA==
X-Received: by 2002:ac8:977:: with SMTP id z52mr126788qth.132.1603153411748;
        Mon, 19 Oct 2020 17:23:31 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com. [209.85.219.177])
        by smtp.gmail.com with ESMTPSA id x5sm87637qtk.68.2020.10.19.17.23.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2020 17:23:31 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id b138so239582yba.5
        for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2020 17:23:31 -0700 (PDT)
X-Received: by 2002:a9f:31ce:: with SMTP id w14mr67335uad.104.1603152943957;
 Mon, 19 Oct 2020 17:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20201019140601.3047-1-lukasz.luba@arm.com>
In-Reply-To: <20201019140601.3047-1-lukasz.luba@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 19 Oct 2020 17:15:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UYeo_rWBDRu-53Aw2OeY1NCgCuUJkocRM8xL+OCbJDug@mail.gmail.com>
Message-ID: <CAD=FV=UYeo_rWBDRu-53Aw2OeY1NCgCuUJkocRM8xL+OCbJDug@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Clarify abstract scale usage for power values in
 Energy Model, EAS and IPA
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dietmar Eggemann <Dietmar.Eggemann@arm.com>,
        morten.rasmussen@arm.com, Quentin Perret <qperret@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Oct 19, 2020 at 7:06 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi all,
>
> The Energy Model supports power values expressed in an abstract scale.
> This has an impact on Intelligent Power Allocation (IPA) and should be
> documented properly. Kernel sub-systems like EAS, IPA and DTPM
> (new comming PowerCap framework) would use the new flag to capture
> potential miss-configuration where the devices have registered different
> power scales, thus cannot operate together.
>
> There was a discussion below v2 of this patch series, which might help
> you to get context of these changes [2].
>
> The agreed approach is to have the DT as a source of power values expressed
> always in milli-Watts and the only way to submit with abstract scale values
> is via the em_dev_register_perf_domain() API.
>
> Changes:
> v3:
> - added boolean flag to struct em_perf_domain and registration function
>   indicating if EM holds real power values in milli-Watts (suggested by
>   Daniel and aggreed with Quentin)
> - updated documentation regarding this new flag
> - dropped DT binding change for 'sustainable-power'
> - added more maintainers on CC (due to patch 1/4 touching different things)
> v2 [2]:
> - updated sustainable power section in IPA documentation
> - updated DT binding for the 'sustainable-power'
> v1 [1]:
> - simple documenation update with new 'abstract scale' in EAS, EM, IPA
>
> Regards,
> Lukasz Luba
>
> [1] https://lore.kernel.org/linux-doc/20200929121610.16060-1-lukasz.luba@arm.com/
> [2] https://lore.kernel.org/lkml/20201002114426.31277-1-lukasz.luba@arm.com/
>
> Lukasz Luba (4):
>   PM / EM: Add a flag indicating units of power values in Energy Model
>   docs: Clarify abstract scale usage for power values in Energy Model
>   PM / EM: update the comments related to power scale
>   docs: power: Update Energy Model with new flag indicating power scale
>
>  .../driver-api/thermal/power_allocator.rst    | 13 +++++++-
>  Documentation/power/energy-model.rst          | 30 +++++++++++++++----
>  Documentation/scheduler/sched-energy.rst      |  5 ++++
>  drivers/cpufreq/scmi-cpufreq.c                |  3 +-
>  drivers/opp/of.c                              |  2 +-
>  include/linux/energy_model.h                  | 20 ++++++++-----
>  kernel/power/energy_model.c                   | 26 ++++++++++++++--
>  7 files changed, 81 insertions(+), 18 deletions(-)

While I don't feel like I have enough skin in the game to make any
demands, I'm definitely not a huge fan of this series still.  I am a
fan of documenting reality, but (to me) trying to mix stuff like this
is just going to be adding needless complexity.  From where I'm
standing, it's a lot more of a pain to specify these types of numbers
in the firmware than it is to specify them in the device tree.  They
are harder to customize per board, harder to spin, and harder to
specify constraints for everything in the system (all heat generators,
all cooling devices, etc).  ...and since we already have a way to
specify this type of thing in the device tree and that's super easy
for people to do, we're going to end up with weird mixes / matches of
numbers coming from different locations and now we've got to figure
out which numbers we can use when and which to ignore.  Ick.

In my opinion the only way to allow for mixing and matching the
bogoWatts and real Watts would be to actually have units and the
ability to provide a conversion factor somewhere.  Presumably that
might give you a chance of mixing and matching if someone wants to
provide some stuff in device tree and get other stuff from the
firmware.  Heck, I guess you could even magically figure out a
conversion factor if someone provides device tree numbers for
something that was already registered in SCMI, assuming all the SCMI
numbers are consistent with each other...

-Doug



-Doug
