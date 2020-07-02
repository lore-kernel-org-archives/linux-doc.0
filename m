Return-Path: <SRS0=H354=AN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E27BC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 00:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05C88207E8
	for <linux-doc@archiver.kernel.org>; Thu,  2 Jul 2020 00:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WHiU+SpJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGBAV7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Jul 2020 20:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbgGBAV7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Jul 2020 20:21:59 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0594EC08C5C1
        for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2020 17:21:59 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id e22so21707065edq.8
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2020 17:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fa6bWTH4s/TqZU4oNX6mkGHJUOTpaqfW+3j0b6AYRD4=;
        b=WHiU+SpJiUn4F+h6zuS1ePRc1x7ZQucl6C2r8aDEzmzXqNmEtSISg27cJk1UG3pes0
         mWi+3+YpSgGcQnq2/JSHPP97zxQQTPM2mOoRfamSXTXlQcr46j/k88hFhlt+vwWZ+XET
         lJdxvOhIJyofF2ezWeEI81ta5hNu274gGiVZUF7mH4ZR26VzWDrehf4YhDiSlKVnpeHy
         6pWXhUZKnfB7OEsfN4F1T2jR8e0K5HcMDZRHNl8cun4+jyJ5ALzcd2D8ZxdN1eWQFUaL
         B5wQs5/wO69fR6Lm5+6csRQIr9O0tude2SEc08p7kScFCouoDQ62u0SqRyh8QFMN9LuG
         vtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fa6bWTH4s/TqZU4oNX6mkGHJUOTpaqfW+3j0b6AYRD4=;
        b=HCTf1jQrcDGwVzCW1xzHZmTDi8s9ntFDgdtY+ywCbrM29R1wgLkbJRH9iVVghjPsKr
         bwiIn82Bjh4KP4JZkpr82bPOyv2keC1cXbZcH0F08uuWAu096mKfuI4gNMy8qk6dgLlJ
         lnf7FoGrKDv04vsgHsV0hTfTC1mSS7vwyr05WO6gbCmzmM9wjlmRr2kdCbZtRcHJraHI
         wRspG6tgAXT8wIOjCUT01XVUV7tZf0D9F1DVX/giI9Lqo0Ld4xlNNpJ65j+kyC4CJR0t
         ZWDGxcLA26/LSBdOSqPQ+FJp0DUryx5Y0x3MMWpNinOiluQY6HhKe+6Ufkycl1/uDf69
         scPQ==
X-Gm-Message-State: AOAM533l6/dLcVu9ERWF6LtJgm0ZA2LTR9LI5J1bDif7vWMTNnHKzBK5
        PEgaPADRAdfg3el4TEF2ji5eCn2WojxKvtcGckWCIw==
X-Google-Smtp-Source: ABdhPJzN1xplW7gh+wNp9NBY9t+29qf3exNKivkFnX13yU01xb7HA79ASHPR5hOVTCmX5K9GOzzlF7OF1lyjgkgxQKU=
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr33053416edr.138.1593649317671;
 Wed, 01 Jul 2020 17:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200616164006.15309-1-mike.leach@linaro.org> <20200616164006.15309-5-mike.leach@linaro.org>
 <20200629174756.GA3724199@xps15> <CAJ9a7ViHMXTiXqbNPQPBBBs87XHALvh6bW+nTiysfvK2TQGRoA@mail.gmail.com>
 <ce4437ae-072b-dc2e-21ad-1390825fda43@arm.com>
In-Reply-To: <ce4437ae-072b-dc2e-21ad-1390825fda43@arm.com>
From:   Mike Leach <mike.leach@linaro.org>
Date:   Thu, 2 Jul 2020 01:21:46 +0100
Message-ID: <CAJ9a7VjzEb_7xFu2sjeCsORay5t0HKv8c4hVau9LTCdvy4=xyA@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] coresight: sysfs: Allow select default sink on
 source enable.
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Coresight ML <coresight@lists.linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Suzuki,

On Wed, 1 Jul 2020 at 23:19, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> Hi Mike, Mathieu,
>
> On 07/01/2020 05:40 PM, Mike Leach wrote:
> > Hi Mathieu,
> >
> > On Mon, 29 Jun 2020 at 18:47, Mathieu Poirier
> > <mathieu.poirier@linaro.org> wrote:
> >>
> >> Hi Mike,
> >>
> >> I have applied patches 1 to 3 of this set.  Please see below for comments on
> >> this patch.
> >>
> >> On Tue, Jun 16, 2020 at 05:40:05PM +0100, Mike Leach wrote:
> >>> When enabling a trace source using sysfs, allow the CoreSight system to
> >>> auto-select a default sink if none has been enabled by the user.
> >>>
> >>> Uses the sink select algorithm that uses the default select priorities
> >>> set when sinks are registered with the system. At present this will
> >>> prefer ETR over ETB / ETF.
> >>>
> >>> Adds a new attribute 'last_sink' to source CoreSight devices. This is set
> >>> when a source is enabled using sysfs, to the sink that the device will
> >>> trace into. This applies for both user enabled and default enabled sinks.
> >>>
> >>> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> >>> ---
> >>>   drivers/hwtracing/coresight/coresight.c | 39 +++++++++++++++++++++++--
> >>>   include/linux/coresight.h               |  3 ++
> >>>   2 files changed, 40 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/hwtracing/coresight/coresight.c b/drivers/hwtracing/coresight/coresight.c
> >>> index e9c90f2de34a..db39e0b56994 100644
> >>> --- a/drivers/hwtracing/coresight/coresight.c
> >>> +++ b/drivers/hwtracing/coresight/coresight.c
> >>> @@ -934,6 +934,16 @@ static void coresight_clear_default_sink(struct coresight_device *csdev)
> >>>        }
> >>>   }
> >>>
> >>> +static void coresight_set_last_sink_name(struct coresight_device *source,
> >>> +                                      struct coresight_device *sink)
> >>> +{
> >>> +     /* remove current value and set new one if *sink not NULL */
> >>> +     kfree(source->last_sink);
> >>> +     source->last_sink = NULL;
> >>> +     if (sink)
> >>> +             source->last_sink = kstrdup(dev_name(&sink->dev), GFP_KERNEL);
> >>> +}
> >>> +
> >>>   /** coresight_validate_source - make sure a source has the right credentials
> >>>    *  @csdev:  the device structure for a source.
> >>>    *  @function:       the function this was called from.
> >>> @@ -994,8 +1004,15 @@ int coresight_enable(struct coresight_device *csdev)
> >>>         */
> >>>        sink = coresight_get_enabled_sink(false);
> >>>        if (!sink) {
> >>> -             ret = -EINVAL;
> >>> -             goto out;
> >>> +             /* look for a default sink if nothing enabled */
> >>> +             sink = coresight_find_default_sink(csdev);
> >>> +             if (!sink) {
> >>> +                     ret = -EINVAL;
> >>> +                     goto out;
> >>> +             }
> >>> +             /* mark the default as enabled */
> >>> +             sink->activated = true;
> >>> +             dev_info(&sink->dev, "Enabled default sink.");
> >>
> >> I'm very ambivalent about extending the automatic sink selection to the sysfs
> >> interface, mainly because of the new sysfs entry it requires.
> >
> > That's interesting - this was added to overcome Suzuki's objection
> > that it wasn't possible to determine which sink was in use!
>
> I personally don't prefer the auto selection for sysfs mode. And that
> was one of the arguments to support it.
>
> >
> > However, I think it is important to allow this as once we see systems
> > with many cores + many sinks, determining the correct sink to enable
> > becomes much more difficult.
> >
> > You said yourself, albeit in relation to perf, that for 1:1 systems,
> > sink selection should be implicit. This is something I completely
> > agree with, and hence the automatic selection algorithm that was
> > chosen to ensure that this is the case.
> > Is there any reason not to make the same assertion for sysfs?
> >
> > Further, this allows sysfs users to write board agnostic tests
> > (similar to the one Leo wrote for perf) - effectively all we need to
> > do to test the coresight function on a board is iterate through the
> > cpus / etms without worrying about the sink in use, then name of which
> > can be read from the etm and then data read out.
>
> The tests could use the "connections" exposed via the sysfs to figure
> out the appropriate sink for a given source.
>
> >
> > As an aside - last_sink also shows which sink was used should you
> > happen to explicitly enable two sinks in the etm path (e.g. etf &
> > etr).
> >
> >>   I find it
> >> clunky that users don't have to specify the sink to use but have to explicitly
> >> disable it after the trace session.
> >
> > Sure - but is it not just as clunky to have to figure out which sink
> > attaches to your etm in the first place? (yes there are topolgy links
> > now but this is not the most straighforward thing to use)
> > Ultimately, if you are only using sysfs, you never actually need to
> > disable the sink to read back data if you don't want to. I am not sure
> > there are many people who use both syfs and perf in the same session
> > to collect trace - and these are the ones who would need to be careful
> > about disabling the sink.
>
> The problem lies exactly there. Just like we don't know how many actual
> sysfs mode users are there, who consume the trace data and use it in a
> production environment compared to a bring up situation (verifying
> that the board topology is detected fine and the components are working
> fine), there could be users of the perf on these systems.
>

This is an issue irrespective of how the trace sink is turned on, be
it automatically or explicitly.
Given that it is possible to read the sink data without disabling the
sink - the chances are it could happen either way.

> Debugging such cases where someone forgot to disable the trace can be
> a painful process. Like I have said from the beginning, this is not
> worth the benefit that we get from this code (i.e, figuring out which
> sink is closer to a source in sysfs mode, when there is an existing
> infrastructure, i.e, "connections" already available for this).
>

Actually all connections can tell you is the number sinks available to
the etm on the path - not which would be selected by the current
priority algorithm - unless the user is willing to dig into the driver
source code and figure out the priority mechanism.

Regards

Mike

> Cheers
> Suzuki



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
