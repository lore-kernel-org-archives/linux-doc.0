Return-Path: <SRS0=jIxK=EE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04129C4363A
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 15:40:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86E9120759
	for <linux-doc@archiver.kernel.org>; Thu, 29 Oct 2020 15:40:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="P/lP5sQL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgJ2PkM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Oct 2020 11:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728239AbgJ2PkM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Oct 2020 11:40:12 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37E06C0613CF
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 08:40:12 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id h5so1766577vsp.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2PMHyXzjLDVufRa8llaIrw5zRwzBKgxCN4FbP7BnEq4=;
        b=P/lP5sQLk86gvHr/EOl7JEAHhbrjf9ZAKB+VtrTxgzscmNq+bid4ufB7kd6fMviv/T
         UvYhLTKMfuIxZhqeFP/RG8xw8oy1+uFSZy6oG4+hhma964i/elIzVv+QKJJjRH9+h0Nf
         sasD8bU8GhS1TI9LHvOqF5glI/RA+wY8sbkhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2PMHyXzjLDVufRa8llaIrw5zRwzBKgxCN4FbP7BnEq4=;
        b=DWYGVgS399c3sUbAd8I2wS+pFv9fv/oAskOFaONaEhDNFlcB1oJIkg7T8HDca+Ezco
         94Z5HVdytZsErMl+0uin8a05kszxQIcxYzUYlJVbBLGETMvB9FCkpyYiV1n6M7bw/VIO
         ibBx9swZVE7dQAI+Z5QSIyo9AGeiWNWmcgYXdlxd3UfZdpYWybWoB6gAq+Pjvkhj8kxw
         6nhgYkd2C3T4GDVbtXo/6beSKu9PJssj0FiSxFs+bnfpl0lC1GORimqDBwAQ9avPRJ19
         r2+oiTdT1Tow3YsD0OQfO50PlNIR3/iU8/tt5cOxuMzEAcRG2mIwCg6o13n0+YpmM0O4
         Y16A==
X-Gm-Message-State: AOAM5323+P8xoyrYW/jZDZwqAlPoj1EHaOdp7pHqfgs8ZcDL2lpukLtL
        eydcfsDADaT5175H4t7Md/rkLO3kTy7J4A==
X-Google-Smtp-Source: ABdhPJx6dqF2TPlto9d+M2oerjFSvHgmIcGO32alRUqmR8eBYXkuOS+neTsOdoX+uuAtLcUpAfskUQ==
X-Received: by 2002:a67:a41:: with SMTP id 62mr2125289vsk.33.1603986010641;
        Thu, 29 Oct 2020 08:40:10 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id h24sm334815uab.8.2020.10.29.08.40.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2020 08:40:09 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id u7so1734697vsq.11
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2020 08:40:08 -0700 (PDT)
X-Received: by 2002:a67:b405:: with SMTP id x5mr3619420vsl.4.1603986008362;
 Thu, 29 Oct 2020 08:40:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201019140601.3047-1-lukasz.luba@arm.com> <CAD=FV=UYeo_rWBDRu-53Aw2OeY1NCgCuUJkocRM8xL+OCbJDug@mail.gmail.com>
 <62430cb9-eaab-b215-0eec-d35d3c625406@arm.com>
In-Reply-To: <62430cb9-eaab-b215-0eec-d35d3c625406@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 29 Oct 2020 08:39:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VA=tYzvb2-WQOJz7UGq-459R4+6xfuPQ-h-iMCKPP9vQ@mail.gmail.com>
Message-ID: <CAD=FV=VA=tYzvb2-WQOJz7UGq-459R4+6xfuPQ-h-iMCKPP9vQ@mail.gmail.com>
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

On Thu, Oct 29, 2020 at 5:37 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> On 10/20/20 1:15 AM, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 19, 2020 at 7:06 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>
> >> Hi all,
> >>
> >> The Energy Model supports power values expressed in an abstract scale.
> >> This has an impact on Intelligent Power Allocation (IPA) and should be
> >> documented properly. Kernel sub-systems like EAS, IPA and DTPM
> >> (new comming PowerCap framework) would use the new flag to capture
> >> potential miss-configuration where the devices have registered different
> >> power scales, thus cannot operate together.
> >>
> >> There was a discussion below v2 of this patch series, which might help
> >> you to get context of these changes [2].
> >>
> >> The agreed approach is to have the DT as a source of power values expressed
> >> always in milli-Watts and the only way to submit with abstract scale values
> >> is via the em_dev_register_perf_domain() API.
> >>
> >> Changes:
> >> v3:
> >> - added boolean flag to struct em_perf_domain and registration function
> >>    indicating if EM holds real power values in milli-Watts (suggested by
> >>    Daniel and aggreed with Quentin)
> >> - updated documentation regarding this new flag
> >> - dropped DT binding change for 'sustainable-power'
> >> - added more maintainers on CC (due to patch 1/4 touching different things)
> >> v2 [2]:
> >> - updated sustainable power section in IPA documentation
> >> - updated DT binding for the 'sustainable-power'
> >> v1 [1]:
> >> - simple documenation update with new 'abstract scale' in EAS, EM, IPA
> >>
> >> Regards,
> >> Lukasz Luba
> >>
> >> [1] https://lore.kernel.org/linux-doc/20200929121610.16060-1-lukasz.luba@arm.com/
> >> [2] https://lore.kernel.org/lkml/20201002114426.31277-1-lukasz.luba@arm.com/
> >>
> >> Lukasz Luba (4):
> >>    PM / EM: Add a flag indicating units of power values in Energy Model
> >>    docs: Clarify abstract scale usage for power values in Energy Model
> >>    PM / EM: update the comments related to power scale
> >>    docs: power: Update Energy Model with new flag indicating power scale
> >>
> >>   .../driver-api/thermal/power_allocator.rst    | 13 +++++++-
> >>   Documentation/power/energy-model.rst          | 30 +++++++++++++++----
> >>   Documentation/scheduler/sched-energy.rst      |  5 ++++
> >>   drivers/cpufreq/scmi-cpufreq.c                |  3 +-
> >>   drivers/opp/of.c                              |  2 +-
> >>   include/linux/energy_model.h                  | 20 ++++++++-----
> >>   kernel/power/energy_model.c                   | 26 ++++++++++++++--
> >>   7 files changed, 81 insertions(+), 18 deletions(-)
> >
> > While I don't feel like I have enough skin in the game to make any
> > demands, I'm definitely not a huge fan of this series still.  I am a
> > fan of documenting reality, but (to me) trying to mix stuff like this
> > is just going to be adding needless complexity.  From where I'm
> > standing, it's a lot more of a pain to specify these types of numbers
> > in the firmware than it is to specify them in the device tree.  They
>
> When you have SCMI, you receive power values from FW directly, not using
> DT.
>
> > are harder to customize per board, harder to spin, and harder to
> > specify constraints for everything in the system (all heat generators,
> > all cooling devices, etc).  ...and since we already have a way to
> > specify this type of thing in the device tree and that's super easy
> > for people to do, we're going to end up with weird mixes / matches of
> > numbers coming from different locations and now we've got to figure
> > out which numbers we can use when and which to ignore.  Ick.
>
> This is not that bad as you described. When you have SCMI and FW
> all your perf domains should be aligned to the same scale.
> In example, you have 4 little CPU, 3 big CPUs, 1 super big CPU,
> 1 GPU, 1 DSP. For all of them the SCMI get_power callback should return
> consistent values. You don't have to specify anything else or rev-eng.
> Then a client like EAS would use those values from CPUs to estimate
> energy and this works fine. Another client: IPA, which would use
> all of them and also works fine.

I guess I'm confused.  When using SCMI and FW, are there already code
paths to get the board-specific "sustainable-power" from SCMI and FW?

I know that "sustainable-power" is not truly necessary.  IIRC some of
the code assumes that the lowest power state of all components must be
sustainable and uses that.  However, though this makes the code work,
it's far from ideal.  I don't want to accept a mediocre solution here.

In any case, I'm saying that even if "sustainable-power" can come from
firmware, it's not as ideal of a place for it to live.  Maybe my
experience on Chromebooks is different from the rest of upstream, but
it's generally quite easy to adjust the device tree for a board and
much harder to convince firmware folks to put a board-specific table
of values.


> > In my opinion the only way to allow for mixing and matching the
> > bogoWatts and real Watts would be to actually have units and the
> > ability to provide a conversion factor somewhere.  Presumably that
> > might give you a chance of mixing and matching if someone wants to
> > provide some stuff in device tree and get other stuff from the
> > firmware.  Heck, I guess you could even magically figure out a
> > conversion factor if someone provides device tree numbers for
> > something that was already registered in SCMI, assuming all the SCMI
> > numbers are consistent with each other...
>
> What you demand here is another code path, just to support revers
> engineered power values for SCMI devices, which are stored in DT.
> Then the SCMI protocol code and drivers should take them into account
> and abandon standard implementation and use these values to provide
> 'hacked' power numbers to EM. Am I right?
> It is not going to happen.

Quite honestly, all I want to be able to do is to provide a
board-specific "sustainable-power" and have it match with the
power-coefficients.  Thus:

* If device tree accepted abstract scale, we'd be done and I'd shut
up.  ...but Rob has made it quite clear that this is a no-go.

* If it was super easy to add all these values into firmware for a
board and we could totally remove these from the device tree, I'd
grumble a bit about firmware being a terrible place for this but at
least we'd have a solution and we'd be done and I'd shut up.  NOTE: I
don't know ATF terribly well, but I'd guess that this needs to go
there?  Presumably part of this is convincing firmware folks to add
this board-specific value there...

-Doug
