Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18988C64EC4
	for <linux-doc@archiver.kernel.org>; Tue, 28 Feb 2023 22:34:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbjB1WeD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Feb 2023 17:34:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjB1Wdx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Feb 2023 17:33:53 -0500
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911A8366A5
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:35 -0800 (PST)
Received: by mail-il1-x12b.google.com with SMTP id i12so7271979ila.5
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gBqlMFlT8eg3MVlu0zFPgF0WXiDAd6+AS6z3qS5hb5I=;
        b=kolb02qTh3ywULDbQkMYd1y1/RKliSHMUTeRL16doSRvrj+fNW9Bau4kPUhV17tLuo
         +DT5Iu0jcvvLKGmIUAbCE0CCNhTTqSH0FqChprSiFAMSiuJOHKf5rLmO6SUAedFgRyiB
         i2SgNm2Wc+Ne3nml01BVn+5oBom06zaSHxhxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBqlMFlT8eg3MVlu0zFPgF0WXiDAd6+AS6z3qS5hb5I=;
        b=gtdGKOCYAyk0sXAoNgYvw3mPuXYRMWDak+zpf+nHrmG57/+lM3b1FX/lZQRYNB9zRU
         mZvHc5cPOHh1wZKbTZNTylZqMpZRVB/bsgtGDvspYcZsXir4EymePqjo2jZxQGBeToZY
         L0BT9StjEQCktYedgBwLyNMX4CFRcFBwWqRRr10wblnIcW+ltHzG+OPJ5NiPazSkz+EK
         IR83RIT6NI/E06xt/5fiRi3Q9OiDWWhNkipCb5U2yjUr7BvfqoqyYzeNuUfBQt+Vf37V
         R004xSZ22LT2RiX/OBmrYtAyIRbAU9j+mytclqEh38JqcSoGWmzomUYI7nSW/WQjMR6m
         G0Tw==
X-Gm-Message-State: AO0yUKX7Ib2N64OjeVo9fGImlw46tEgI5M98hTeF5gS/CJJkq5xoyQW1
        unDyNqfE2mjcEAKX3Tri3KbLAWlJDP+ii5HG
X-Google-Smtp-Source: AK7set+Syt5YeiMdhTuQoYTK60itlN+fETnnR9kMgvWKPi2y5bWZBKp1kL9UAJfNUwy41h/ycv8wBw==
X-Received: by 2002:a05:6e02:198a:b0:316:dcfd:1b6b with SMTP id g10-20020a056e02198a00b00316dcfd1b6bmr4421004ilf.20.1677623614367;
        Tue, 28 Feb 2023 14:33:34 -0800 (PST)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com. [209.85.166.172])
        by smtp.gmail.com with ESMTPSA id a12-20020a056638004c00b003c41434babdsm3234969jap.92.2023.02.28.14.33.31
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 14:33:32 -0800 (PST)
Received: by mail-il1-f172.google.com with SMTP id y14so5219578ilv.4
        for <linux-doc@vger.kernel.org>; Tue, 28 Feb 2023 14:33:31 -0800 (PST)
X-Received: by 2002:a92:1a0d:0:b0:310:a24c:4231 with SMTP id
 a13-20020a921a0d000000b00310a24c4231mr2161049ila.6.1677623611297; Tue, 28 Feb
 2023 14:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20230224070506.4157738-1-saravanak@google.com> <20230224070506.4157738-3-saravanak@google.com>
In-Reply-To: <20230224070506.4157738-3-saravanak@google.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 28 Feb 2023 14:33:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WaWmHDX0FVH1KO7b_QDM9xxt86q60MGOtPVVvGZJ+t7A@mail.gmail.com>
Message-ID: <CAD=FV=WaWmHDX0FVH1KO7b_QDM9xxt86q60MGOtPVVvGZJ+t7A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] driver core: Make state_synced device attribute writeable
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
> If the file is written to and sync_state() hasn't been called for the
> device yet, then call sync_state() for the device independent of the
> state of its consumers.
>
> This is useful for supplier devices that have one or more consumers that
> don't have a driver but the consumers are in a state that don't use the
> resources supplied by the supplier device.
>
> This gives finer grained control than using the
> fw_devlink.sync_state=3Dtimeout kernel commandline parameter.
>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  .../ABI/testing/sysfs-devices-state_synced     |  5 +++++
>  drivers/base/base.h                            |  8 ++++++++
>  drivers/base/core.c                            |  5 +----
>  drivers/base/dd.c                              | 18 +++++++++++++++++-
>  4 files changed, 31 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-devices-state_synced b/Docum=
entation/ABI/testing/sysfs-devices-state_synced
> index 0c922d7d02fc..cc4090c9df75 100644
> --- a/Documentation/ABI/testing/sysfs-devices-state_synced
> +++ b/Documentation/ABI/testing/sysfs-devices-state_synced
> @@ -21,4 +21,9 @@ Description:
>                 at the time the kernel starts are not affected or limited=
 in
>                 any way by sync_state() callbacks.
>
> +               Writing anything to this file will force a call to the de=
vice's
> +               sync_state() function if it hasn't been called already. T=
he
> +               sync_state() call happens is independent of the state of =
the
> +               consumer devices.

Please don't just accept anything written. It doesn't take much to
check that the user wrote some known value here and then if we ever
have a reason to allow something else we don't have to break old ABIs.
Maybe "-1"?


> +
>
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 6fcd71803d35..b055eba1ec30 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -164,6 +164,14 @@ static inline int driver_match_device(struct device_=
driver *drv,
>         return drv->bus->match ? drv->bus->match(dev, drv) : 1;
>  }
>
> +static inline void dev_sync_state(struct device *dev)

IMO don't force inline. The compiler is probably smarter than you. I
could even believe that it might be more optimal for this rarely
called function to be _not_ inline if it kept the kernel smaller. I
guess that means moving it out of the header...

> +{
> +       if (dev->bus->sync_state)
> +               dev->bus->sync_state(dev);
> +       else if (dev->driver && dev->driver->sync_state)
> +               dev->driver->sync_state(dev);
> +}
> +
>  extern int driver_add_groups(struct device_driver *drv,
>                              const struct attribute_group **groups);
>  extern void driver_remove_groups(struct device_driver *drv,
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 929ec218f180..60bb3551977b 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1215,10 +1215,7 @@ static void device_links_flush_sync_list(struct li=
st_head *list,
>                 if (dev !=3D dont_lock_dev)
>                         device_lock(dev);
>
> -               if (dev->bus->sync_state)
> -                       dev->bus->sync_state(dev);
> -               else if (dev->driver && dev->driver->sync_state)
> -                       dev->driver->sync_state(dev);
> +               dev_sync_state(dev);
>
>                 if (dev !=3D dont_lock_dev)
>                         device_unlock(dev);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 84f07e0050dd..17b51573f794 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -510,6 +510,22 @@ EXPORT_SYMBOL_GPL(device_bind_driver);
>  static atomic_t probe_count =3D ATOMIC_INIT(0);
>  static DECLARE_WAIT_QUEUE_HEAD(probe_waitqueue);
>
> +static ssize_t state_synced_store(struct device *dev,
> +                                 struct device_attribute *attr,
> +                                 const char *buf, size_t count)
> +{
> +       device_lock(dev);
> +       if (!dev->state_synced) {
> +               dev->state_synced =3D true;
> +               dev_sync_state(dev);
> +       } else {
> +               count =3D -EINVAL;

count is of type "size_t", not "ssize_t". -EINVAL is signed.
