Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C886C64EC4
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 22:33:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjB1WdT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 17:33:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjB1WdS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 17:33:18 -0500
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C5882D56
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:17 -0800 (PST)
Received: by mail-il1-x12e.google.com with SMTP id l2so7284745ilg.7
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDZFHOktHxS/XDKrIMefDxSktOzxgIy4sJlU+F/fZDA=;
        b=XcdYgB1yBTrJ0aYQ0dsS8hFi/aaKG4F8Ds0GxVsXWTTIN6NWfXAZ4D3+9snIiGmDpk
         qcv/TZW88idkK+8CkUbjAmZ4nhvjrvug00Qh4Env3wOG1Er5byNPRO3d2+QnoNdsByVU
         I+xpXzBw+p5vYHbknDO3bqjr11W4h+GV5UIT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KDZFHOktHxS/XDKrIMefDxSktOzxgIy4sJlU+F/fZDA=;
        b=5RRGOOr6/0hrMdSWuuYoLIAmqMeNnw7TFXfkpuyboWHL12M4BZfp5hZAczN5+Z5xrM
         HxB1kj3SeKGxZG7T/Nj4LrrN28eCfs3y033t1wP96YYAyC2ZdJYoxe1To/1L+BZXUsWp
         il8HiKRjIsFCDXCpRG75XWs5HMLwx4SGYz8pyAC3aYDFb5c2GJeFXEEAt0A0TrCmv78M
         QBje6+6XWHxDcCbIxIjxFmoqOspq3aUk9IADa6mcWmLlDZotdYviYjqD8+NgBoEoVA8h
         ZzEfaT3ZSx3paztIfBsJJ+2IwgutxJNosnZ0P9L+eO/pXvE+mDQtMgGSUcrxKX0WYC9r
         ZszA==
X-Gm-Message-State: AO0yUKUxV6A/5VdkwUhqoMylZ0xQRPuWmjKVZK+Pve80zacfhj7tjY4T
        Kupyl8Y2cDwJ8GujNIcBbj6fw7zpEjczInCs
X-Google-Smtp-Source: AK7set/rM1efyK/pZo5mif7gTV4PUczbQ1xa4hjqRROl3H3Bf/CkLXROXK+uVLxQHC4/NOU3tqYVSw==
X-Received: by 2002:a92:cd83:0:b0:315:9a7e:fb03 with SMTP id r3-20020a92cd83000000b003159a7efb03mr4108750ilb.29.1677623596257;
        Tue, 28 Feb 2023 14:33:16 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id k9-20020a02ccc9000000b003c4f3850000sm3402162jaq.49.2023.02.28.14.33.13
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 14:33:14 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id 76so4665149iou.9
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:13 -0800 (PST)
X-Received: by 2002:a05:6602:151:b0:745:c41a:8f0f with SMTP id
 v17-20020a056602015100b00745c41a8f0fmr1934398iot.2.1677623593416; Tue, 28 Feb
 2023 14:33:13 -0800 (PST)
MIME-Version: 1.0
References: <20230224070506.4157738-1-saravanak@google.com> <20230224070506.4157738-2-saravanak@google.com>
In-Reply-To: <20230224070506.4157738-2-saravanak@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Feb 2023 14:33:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQnLpD1P8sRBcizTMjCQyHTjaiNvjcPdgyZc5JCzvOtw@mail.gmail.com>
Message-ID: <CAD=FV=XQnLpD1P8sRBcizTMjCQyHTjaiNvjcPdgyZc5JCzvOtw@mail.gmail.com>
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

On Thu, Feb 23, 2023 at 11:05=E2=80=AFPM Saravana Kannan <saravanak@google.=
com> wrote:
>
> When all devices that could probe have finished probing, this parameter
> controls what to do with devices that haven't yet received their
> sync_state() calls.
>
> fw_devlink.sync_state=3Dstrict is the default and the driver core will
> continue waiting on consumers to probe successfully in the future.

This description is misleading / borderline wrong. You say that when
"sync_state=3Dstrict" that you'll wait on consumers to probe
successfully in the future. As talked about below, I think that when
the pre-existing "deferred_probe_timeout" (which you're tying into)
expires, it's unlikely that devices will probe successfully in the
future. Sure, it's possible, but in general once the
"deferred_probe_timeout" expires then the system is done waiting for
new devices to show up. While it's still _possible_ to add new
devices, you need to take care to deal with the fact that some
important devices might have already given up and also that you're
adding these new devices in strict dependency order...

IMO better would be to say something like when sync_state=3Dstrict that
you'll just leave resources in a high power state if not all devices
have shown up and the system thinks probing is done.


> This
> is the default behavior since calling sync_state() when all the
> consumers haven't probed could make some systems unusable/unstable.
>
> fw_devlink.sync_state=3Dtimeout will cause the driver core to give up
> waiting on consumers and call sync_state() on any devices that haven't
> yet received their sync_state() calls. This option is provided for
> systems that won't become unusable/unstable as they might be able to
> save power (depends on state of hardware before kernel starts) if all
> devices get their sync_state().

While I don't object to this being a kernel command line flag, the
default should also be a Kconfig option. The kernel command line is
not a great place for general configuration. As we jam too much stuff
in the kernel command line it gets unwieldy quickly. IMO:

* Kconfig: the right place for stuff for config options that a person
building the kernel might want to tweak.

* Kernel command line: the right place for a user of a pre-built
kernel to tweak; also (sometimes) the right place for the bootloader
to pass info to the kernel; also a good place for debug options that a
kernel engineer might want to tweak w/out rebuilding the kernel.

In this case it makes sense for the person building the kernel to
choose a default that makes sense for the hardware that their kernel
is targetting. It can also make sense for a user of a pre-built kernel
to tweak this if their hardware isn't working correctly. Thus it makes
sense for Kconfig to choose the default and the kernel command line to
override.


> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 12 ++++
>  drivers/base/base.h                           |  1 +
>  drivers/base/core.c                           | 58 +++++++++++++++++++
>  drivers/base/dd.c                             |  6 ++
>  4 files changed, 77 insertions(+)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentat=
ion/admin-guide/kernel-parameters.txt
> index 6cfa6e3996cf..f0bf2f40af64 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1594,6 +1594,18 @@
>                         dependencies. This only applies for fw_devlink=3D=
on|rpm.
>                         Format: <bool>
>
> +       fw_devlink.sync_state =3D

Is there a reason this is nested under "fw_devlink"? The sysfs
attribute "sync_state" that you modify in patch #2 doesn't reference
"fw_devlink" at all.


> +                       [KNL] When all devices that could probe have fini=
shed
> +                       probing, this parameter controls what to do with
> +                       devices that haven't yet received their sync_stat=
e()
> +                       calls.
> +                       Format: { strict | timeout }
> +                       strict -- Default. Continue waiting on consumers =
to
> +                               probe successfully.
> +                       timeout -- Give up waiting on consumers and call
> +                               sync_state() on any devices that haven't =
yet
> +                               received their sync_state() calls.

Some description needs to be included about how long the timeout is.
Specifically, tie it into the "deferred_probe_timeout" feature since
that's what you're using.


> +
>         gamecon.map[2|3]=3D
>                         [HW,JOY] Multisystem joystick and NES/SNES/PSX pa=
d
>                         support via parallel port (up to 5 devices per po=
rt)
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 726a12a244c0..6fcd71803d35 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -209,6 +209,7 @@ extern void device_links_no_driver(struct device *dev=
);
>  extern bool device_links_busy(struct device *dev);
>  extern void device_links_unbind_consumers(struct device *dev);
>  extern void fw_devlink_drivers_done(void);
> +extern void fw_devlink_probing_done(void);
>
>  /* device pm support */
>  void device_pm_move_to_tail(struct device *dev);
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index f9297c68214a..929ec218f180 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1727,6 +1727,26 @@ static int __init fw_devlink_strict_setup(char *ar=
g)
>  }
>  early_param("fw_devlink.strict", fw_devlink_strict_setup);
>
> +#define FW_DEVLINK_SYNC_STATE_STRICT   0
> +#define FW_DEVLINK_SYNC_STATE_TIMEOUT  1

I don't care tons, but I feel like this should be an enum, or a bool.


> +
> +static int fw_devlink_sync_state;
> +static int __init fw_devlink_sync_state_setup(char *arg)
> +{
> +       if (!arg)
> +               return -EINVAL;
> +
> +       if (strcmp(arg, "strict") =3D=3D 0) {
> +               fw_devlink_sync_state =3D FW_DEVLINK_SYNC_STATE_STRICT;
> +               return 0;
> +       } else if (strcmp(arg, "timeout") =3D=3D 0) {
> +               fw_devlink_sync_state =3D FW_DEVLINK_SYNC_STATE_TIMEOUT;
> +               return 0;
> +       }
> +       return -EINVAL;
> +}
> +early_param("fw_devlink.sync_state", fw_devlink_sync_state_setup);
> +
>  static inline u32 fw_devlink_get_flags(u8 fwlink_flags)
>  {
>         if (fwlink_flags & FWLINK_FLAG_CYCLE)
> @@ -1797,6 +1817,44 @@ void fw_devlink_drivers_done(void)
>         device_links_write_unlock();
>  }
>
> +static int fw_devlink_dev_sync_state(struct device *dev, void *data)
> +{
> +       struct device_link *link =3D to_devlink(dev);
> +       struct device *sup =3D link->supplier;
> +
> +       if (!(link->flags & DL_FLAG_MANAGED) ||
> +           link->status =3D=3D DL_STATE_ACTIVE || sup->state_synced ||
> +           !dev_has_sync_state(sup))
> +               return 0;
> +
> +       if (fw_devlink_sync_state =3D=3D FW_DEVLINK_SYNC_STATE_STRICT) {
> +               dev_warn(sup, "sync_state() pending due to %s\n",
> +                        dev_name(link->consumer));

This warning message is (IMO) an important feature of your patch. IMO
it deserves a mention in the commit message and even if (for some
reason) we decide we don't like the concept of forcing sync_state
after a timeout then we should still find a way to get this warning
message printed out. Maybe promote it to its own patch?

Specifically, I think this warning message gets printed out after
we've given up waiting for devices to show up. At this point
-EPROBE_DEFER becomes an error that we won't retry. That means that we
expect that sync state will _never_ be called in the future and that
resources will be left enabled / in a higher power state than needed.

I would perhaps also make it sound a little scarier since, IMO, this
is a problem that really shouldn't be "shipped" if this is an embedded
kernel. Maybe something like:

  sync_state pending (%s); resources left in high power state


> +               return 0;
> +       }
> +
> +       if (!list_empty(&sup->links.defer_sync))
> +               return 0;
> +
> +       dev_warn(sup, "Timed out. Calling sync_state()\n");

nit: since you aren't directly calling it after this print (you're
adding it to the queue), maybe change to "Forcing sync_state()".
