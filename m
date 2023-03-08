Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C79EC678D5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Mar 2023 15:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjCHPkb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Mar 2023 10:40:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbjCHPjq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Mar 2023 10:39:46 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E854F92BEB
        for <linux-doc@vger.kernel.org>; Wed,  8 Mar 2023 07:39:18 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id r4so10662285ila.2
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 07:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678289958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zkx3xtqKCDYXOxdN4Nx1W/zI7X05RfhDHBMGQHMHjP0=;
        b=CwsVzw1PzNwHy45ywIXHt1iuprAc4kanABAz22HWod+D3QAEOvO/KHkrem68g4jdzi
         TJCxe+Ov8NRYgV88ylIrcNcQ14E9jUfI00j64s2S1HPaw3yitw7pJBVT2cyfkn5Spjig
         Zq0pJQ7gxrSZXtaPdQWISpfXZLarLRtPcwVac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zkx3xtqKCDYXOxdN4Nx1W/zI7X05RfhDHBMGQHMHjP0=;
        b=pbRhpmDIsFl1J4fkRSJhRmvdkwjHlsYeB/aRTG7OxwHqSRXYiROGOk407gi2QE0u4E
         MYncF+awPQWYY9PNboerxoFc8C23y6Qo2hb1HGhW7zhJnKvOVIrIKaxi4EfbFemmIb/m
         3rASwjttyFy2U6pLVg0aZCi1nkolvC3M4bnJ66qVtrqrXu94lTXPfyHaGDq+jEvhZI4A
         Cq/MZtiL9hiabtu7YiV1VXjSuNWgBew7tB07WKuoYjstayMj6xLW8fcgoh2DHVMWNjGt
         b1HnPVzXOs34dtxVfaMhXQ0Ce8KLan18Hg7HzRZ4r7haMCU0v4EdZoSmJAehFAFqwMO3
         ZLzw==
X-Gm-Message-State: AO0yUKUs3c7GDbFnfsCobAw+3TOE+Tyix6SJleF+PQQo7ZmZ6woJsRF6
        JFA06uMSHzgn87YBOvmnA2Dp3u4A4lqe5WIp8yQ=
X-Google-Smtp-Source: AK7set9jOx4NVrrZs/yYMtU6k5vfdYTr94oelEuiFpPqVo1t1C+78VPS5RukURdZ92k1W00J62w2ow==
X-Received: by 2002:a92:1a43:0:b0:315:51c3:2ad9 with SMTP id z3-20020a921a43000000b0031551c32ad9mr1369214ill.21.1678289957675;
        Wed, 08 Mar 2023 07:39:17 -0800 (PST)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id y8-20020a02bb08000000b003c4e65fd6dfsm5089891jan.176.2023.03.08.07.39.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 07:39:17 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id e11so6926950ioe.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Mar 2023 07:39:16 -0800 (PST)
X-Received: by 2002:a6b:6a0a:0:b0:745:b287:c281 with SMTP id
 x10-20020a6b6a0a000000b00745b287c281mr8499438iog.2.1678289956406; Wed, 08 Mar
 2023 07:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20230224070506.4157738-1-saravanak@google.com>
 <20230224070506.4157738-2-saravanak@google.com> <CAD=FV=XQnLpD1P8sRBcizTMjCQyHTjaiNvjcPdgyZc5JCzvOtw@mail.gmail.com>
 <CAGETcx9aRPEU3pW4Dtn_pp5c7dKd7ZhyyKWF6XnfLp+aCxo=OA@mail.gmail.com>
In-Reply-To: <CAGETcx9aRPEU3pW4Dtn_pp5c7dKd7ZhyyKWF6XnfLp+aCxo=OA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 8 Mar 2023 07:39:03 -0800
X-Gmail-Original-Message-ID: <CAD=FV=W=EJ1LCDeKzHJ_X+nEtoqf8OzO1sqKFKOay5gSbUPjpQ@mail.gmail.com>
Message-ID: <CAD=FV=W=EJ1LCDeKzHJ_X+nEtoqf8OzO1sqKFKOay5gSbUPjpQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] driver core: Add fw_devlink.sync_state command
 line param
To:     Saravana Kannan <saravanak@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>, kernel-team@android.com,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Fri, Mar 3, 2023 at 4:53=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> > IMO better would be to say something like when sync_state=3Dstrict that
> > you'll just leave resources in a high power state
>
> But this statement is not true either. Just because a device driver
> has a sync_state() doesn't mean the device was left in a powered on
> state by the bootloader.

Though I guess it's theoretically possible that a device using
sync_state will leave resources in a _lower_ power state until
sync_state is reached, I'm skeptical if that actually happens. Can you
point to any examples? The sync state docs
"sysfs-devices-state_synced" actually document that the common case is
when the bootloader left a resource enabled and we won't disable the
resource until sync_state is reached. That's almost certainly a higher
power state.

I would also point to one of the users of sync_state: the interconnect
framework. Take a look at commit b1d681d8d324 ("interconnect: Add sync
state support"). You can see that in icc_node_add() if we can't read
the bandwidth at bootup we end up at the max (INT_MAX). That's exactly
the case we actually hit for Qualcomm. It's not that we just avoid
touching the resources until sync state is reached--we actually max it
out.

In general, something feels a bit awkward here in defining this as
"however the bootloader left it". That concept makes sense for things
where we need to manage a handoff from the bootloader for the kernel,
but it's not the answer for all things. The bootloader's job is to
boot the system and get out of the way, not to init all resources. It
only inits resources that it cares about. That means if the bootloader
displays a splash screen then it might init resources for the display.
if it doesn't display a splash screen it might not. The kernel needs
to handle either case.

In general, the problems being solved with sync_state seem to require
resources to be left on and in high power until sync state is reached.
Today, you define that as "the state the bootloader left it in".
...but if the bootloader didn't leave it in a high power state then
you'd need to change this definition.

If you truly want to couch the verbiage, I guess I'd be OK with saying
"when sync_state=3Dstrict that you'll _LIKELY_ leave resources in a high
power state if sync_state is never reached"


> > While I don't object to this being a kernel command line flag, the
> > default should also be a Kconfig option. The kernel command line is
> > not a great place for general configuration. As we jam too much stuff
> > in the kernel command line it gets unwieldy quickly. IMO:
> >
> > * Kconfig: the right place for stuff for config options that a person
> > building the kernel might want to tweak.
> >
> > * Kernel command line: the right place for a user of a pre-built
> > kernel to tweak; also (sometimes) the right place for the bootloader
> > to pass info to the kernel; also a good place for debug options that a
> > kernel engineer might want to tweak w/out rebuilding the kernel.
> >
> > In this case it makes sense for the person building the kernel to
> > choose a default that makes sense for the hardware that their kernel
> > is targetting. It can also make sense for a user of a pre-built kernel
> > to tweak this if their hardware isn't working correctly. Thus it makes
> > sense for Kconfig to choose the default and the kernel command line to
> > override.
>
> I don't mind adding a Kconfig to select the default behavior, but
> maybe as a separate patch in the future so if there's any debate about
> that, you'll at least get this option.

I don't mind it being a separate patch, but it should be part of the
initial series.


> > Specifically, I think this warning message gets printed out after
> > we've given up waiting for devices to show up. At this point
> > -EPROBE_DEFER becomes an error that we won't retry.
>
> This is not true. We will always retry on an -EPROBE_DEFER, even after ti=
meout.

OK, so I think this is the main point of contention here, so let's get
to the bottom of it first and then we can address anything else.

I guess I'm trying to figure out what "deferred_probe_timeout" is
supposed to be about. From reading
driver_deferred_probe_check_state(), I see that the idea is that once
the timeout expires then we'll start returning -ETIMEDOUT when we used
to return -EPROBE_DEFER. I guess I mispoke then. You're correct that
-EPROBE_DEFER will still be retried. That being said, things that used
to be retired (because they returned -EPROBE_DEFER) will now become
permanent/non-retired errors (because they return -ETIMEDOUT).

My point is that if we ever actually hit that case (where we return
-ETIMEDOUT instead of -EPROBE_DEFER) we really enter a state where
it's not going to be great to load any more drivers. Once a driver
failed to probe (because it got back an -ETIMEDOUT instead of
-EPROBE_DEFER) then the user needs to manually unbind/rebind the
device to retry. That's not a good state.

So the above is the crux of my argument that once
"deferred_probe_timeout" fires that the system really isn't in good
shape to load more drivers.

So looking more carefully, I think I can understand where you're
coming from. Specifically I note that very few subsystems have "opted
in" to the deferred_probe_timeout on ToT. I can also see that recently
you made the effort to delete driver_deferred_probe_check_state(),
though those were reverted. That means that, as it stands, devices
will _probably_ not end up with the problem I describe above (unless
they depend on a subsystem that has opted-in). ...and, if your plans
come to fruition, then eventually we'll never hit it.

Where does that leave us? I guess I will step back on my assertion
that when the timeout fires that drivers can't load anymore. Certainly
the state that ToT Linux is in is confusing. "deferred_probe_timeout"
is still documented (in kernel-parameters.txt) to cause us to "give
up" waiting for dependencies. ...and it still causes a few subsystems
to give up. ...but I guess it mostly works.


> > I would perhaps also make it sound a little scarier since,
>
> I definitely don't want to make it sound scarier and get everyone to
> enable the timeout by default without actually knowing if it has a
> power impact on their system.
>
> > IMO, this
> > is a problem that really shouldn't be "shipped" if this is an embedded
> > kernel. Maybe something like:
>
> This is how it's shipped on all Android devices in the past 2 years.
> So it's not a global problem like you make it to be.

You're saying devices _shipped_ but booted up where devices never
reached sync_state? ...and that's not a power consumption problem???
I'm not saying that the sync_state concept couldn't ship, I'm saying
that if this printout shows up in boot logs that it's highly likely
there's a problem that needs to be fixed and that's causing extra
power consumption. That's why I want the printout to sound scarier.

-Doug
