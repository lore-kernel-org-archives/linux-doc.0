Return-Path: <SRS0=qRT1=DJ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE11C4363C
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:48:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31A6C208C7
	for <linux-doc@archiver.kernel.org>; Fri,  2 Oct 2020 15:48:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NOBFHu51"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387938AbgJBPsK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Oct 2020 11:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387692AbgJBPsK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Oct 2020 11:48:10 -0400
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com [IPv6:2607:f8b0:4864:20::e41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 095BDC0613D0
        for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2020 08:48:10 -0700 (PDT)
Received: by mail-vs1-xe41.google.com with SMTP id g11so842797vsp.13
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T1VBeMl6lnk6uGVYC4UMbcUFzllZv34qpogDPSQOP7M=;
        b=NOBFHu51EDHrcub6xy7AvFiSRurn1fHm20p6heYCzLvQA4DiSWLmItq04o64PqKZJL
         ON7UOtMwm7wOsHDwKznnfPF3yO5akXtBqmhN2CLd4iY6ZkbJCnZj4n4pPLQQJutstBul
         NQGnGObIukRPoeNo1cN9Buh0HQPiZDPQomocE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T1VBeMl6lnk6uGVYC4UMbcUFzllZv34qpogDPSQOP7M=;
        b=XfkPZf/aa5ecaD4BF+Y2UQ4NzN45ak3Yuna9O5littHaEKvM0Yy8U5ttv0EqiIVS+X
         F1q9PjB3OIRfL3ll01REd4S0dXLfnA4f4Yg0c+Lbb1F2zlr/nMY0nIpQF5bVhZzSoKzu
         EAXQubUNb3IfseIbc13C3t+aVx/Su0ImivFEXEk+lqI9bFrgOAR1zWI2asqJg9ngMZpD
         Z2h89YwaZ0g5bpgQ9HGpV/UdntBbbN23pseOCAIpLCrpyODavPgOnNGb07GqnSXVgrHq
         20CripeO8c0ZxDTKbc9BB07IYq3/BkF7ekzQkFHVhiS21eZtKaoZgaU1KjjQzcCh/ar3
         F48A==
X-Gm-Message-State: AOAM532VnIvFKn5Lcia/KV3xHzpwBgiEG5nvT7W4955oXJ43ChE0e5Ym
        epD0WduaUTAk8a67KS7NEmaMoCr0k2wxYw==
X-Google-Smtp-Source: ABdhPJxdwozJViic6RjMclMcHX/5upobYgJ3qmuqgPgXLOWx69rGx+pgwv4PhM7M5Iegc9OVTsRd7Q==
X-Received: by 2002:a05:6102:2f7:: with SMTP id j23mr1601632vsj.35.1601653688828;
        Fri, 02 Oct 2020 08:48:08 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id o83sm298894vko.29.2020.10.02.08.48.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2020 08:48:08 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id a16so388993vke.3
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2020 08:48:07 -0700 (PDT)
X-Received: by 2002:a1f:a905:: with SMTP id s5mr1631052vke.9.1601653687217;
 Fri, 02 Oct 2020 08:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201002114426.31277-1-lukasz.luba@arm.com> <20201002114426.31277-4-lukasz.luba@arm.com>
 <CAD=FV=UbNP5-G1z95F37Fmv8=n0JPSSwnPQO_K==WpAc4vAHWQ@mail.gmail.com> <e9b6fc5a-45d3-168d-db38-6c068da26f6b@arm.com>
In-Reply-To: <e9b6fc5a-45d3-168d-db38-6c068da26f6b@arm.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 2 Oct 2020 08:47:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xkg1zpsMW5rERbibnjrgY6opZi8Z9DUFkWebb7NHtU5w@mail.gmail.com>
Message-ID: <CAD=FV=Xkg1zpsMW5rERbibnjrgY6opZi8Z9DUFkWebb7NHtU5w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: thermal: update sustainable-power
 with abstract scale
To:     Lukasz Luba <lukasz.luba@arm.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>, linux-doc@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        amitk@kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Dietmar.Eggemann@arm.com, Quentin Perret <qperret@google.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Oct 2, 2020 at 8:13 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Doug,
>
> On 10/2/20 3:31 PM, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Oct 2, 2020 at 4:45 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
> >>
> >> Update the documentation for the binding 'sustainable-power' and allow
> >> to provide values in an abstract scale. It is required when the cooling
> >> devices use an abstract scale for their power values.
> >>
> >> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> >> ---
> >>   .../devicetree/bindings/thermal/thermal-zones.yaml  | 13 +++++++++----
> >>   1 file changed, 9 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> >> index 3ec9cc87ec50..4d8f2e37d1e6 100644
> >> --- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> >> +++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> >> @@ -99,10 +99,15 @@ patternProperties:
> >>         sustainable-power:
> >>           $ref: /schemas/types.yaml#/definitions/uint32
> >>           description:
> >> -          An estimate of the sustainable power (in mW) that this thermal zone
> >> -          can dissipate at the desired control temperature. For reference, the
> >> -          sustainable power of a 4-inch phone is typically 2000mW, while on a
> >> -          10-inch tablet is around 4500mW.
> >> +          An estimate of the sustainable power (in mW or in an abstract scale)
> >> +         that this thermal zone can dissipate at the desired control
> >> +         temperature. For reference, the sustainable power of a 4-inch phone
> >> +         is typically 2000mW, while on a 10-inch tablet is around 4500mW.
> >> +
> >> +         It is possible to express the sustainable power in an abstract
> >> +         scale. This is the case when the related cooling devices use also
> >> +         abstract scale to express their power usage. The scale must be
> >> +         consistent.
> >
> > Two thoughts:
> >
> > 1. If we're going to allow "sustainable-power" to be in abstract
> > scale, why not allow "dynamic-power-coefficient" to be in abstract
> > scale too?  I assume that the whole reason against that originally was
> > the idea of device tree purity, but if we're allowing the abstract
> > scale here then there seems no reason not to allow it for
> > "dynamic-power-coefficient".
>
> With this binding it's a bit more tricky.
> I also have to discuss a few things internally. This requirement of
> uW/MHz/V^2 makes the code easier also for potential drivers
> like GPU (which are going to register the devfreq cooling with EM).
>
> Let me think about it, but for now I would just update these bits.
> These are required to proper IPA operation, the dyn.-pow.-coef. is a
> nice to have and possible next step.

I guess the problem is that Rajendra is currently planning to remove
all the "dynamic-power-coefficient" values from device tree right now
and move them to the source code because the numbers we currently have
in the device tree _are_ in abstract scale and thus violate the
bindings.  Moving this to source code won't help us get to more real
power numbers (since it'll still be abstract scale), it'll just be
pure churn.  If we're OK with the abstract scale in general then we
should allow it everywhere and not add churn for no reason.


> > 2. Is it worth adding some type of indication of what type of units
> > "sustainable-power" is represented in?  Maybe even a made up unit so
> > that you could tell the difference between made up units in the same
> > system?  I'd envision something like:
> >
> > sustainable-power-units = "qualcomm,sc7180-bogoWatts"
> >
> > ...and on the dynamic-power-coefficient side, the same:
> >
> > dynamic-power-coefficient-units = "qualcomm,sc7180-bogoWatts"
> >
> > One could imagine someone even later (after devices are widely
> > distributed) figuring out translations between these bogoWatts numbers
> > and real Watts if someone could come up with a case where it matters.
>
> To figure this out we don't need a new binding.
> I think a simple comment in the DT would be enough for this, even e.g.:
>
> sustainable-power = <100> /* bogoWatts */

There are some important differences:

a) Your comment is gone when the device tree is compiled.  If we
actually add a string to the device tree then, in theory, we can add
conversions in code (without touching the device tree) down the road.

b) I believe there can be more than one abstract scale present in a
single device tree, at least in theory.  Adding a string allows you to
know if you're comparing apples to apples or apples to organges.


> Thank you for your comments.
> BTW, I haven't put your 'Reviewed-by' because I have added this
> sustainable-power new stuff in patch 1/3. I will grateful if you
> have a look on that.

I can if needed, but I'd kinda like to get the above resolved first
since it feels like it could have an effect on the other patches?


-Doug
