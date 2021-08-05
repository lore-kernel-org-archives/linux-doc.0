Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C7E9C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 16:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6FD361050
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 16:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbhHEQhy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 12:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbhHEQhy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 12:37:54 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB1D2C061765
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 09:37:39 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m10-20020a17090a34cab0290176b52c60ddso10839001pjf.4
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 09:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++KaK3sXKFcfH87I/TzZgK45NFVsqzYW8QlI/XBfyMY=;
        b=zBPK9WHgCgGdHHQE1HOeQnwkErOz91g2zGgnQO1E2JHkb5vIy9L12GCtg1yfW04Vb2
         +WwaUt8WVw6BuR4Pd5e+f6i2Ysxxcr23qoszN9Axjy4n7nNGW4UJdZh3FoOgw4WXgUs1
         kIXA547mO0y/lqz6Fb3IGe8J+k9Zx+0UT7QyzwuCC9dlwLsCAHhVCf5xrjWeZlKnnA+M
         ZRKCL1hP//Lle2YMFoNszMMeABeRaDvf8XbwM284nEZYYETN86rRgUAaP/9uUfoL5wwK
         w6G2uFBOsiZ188UqEvdUzHaWxfnZovDSiznRyOFXRlR+TRqOwLpxdiZ4sEV6AUhyN1tz
         UUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++KaK3sXKFcfH87I/TzZgK45NFVsqzYW8QlI/XBfyMY=;
        b=PUMHyfthy542Ib4umIr5eFfgavNejteoPvR3rAfYrcRr7J739fjMl61qtKJ/grxJm8
         2V2LNBdYqZAzP2y0/11hNf1AJZFivYjSK7FQHkB4MQC1IG98m6v+GvvjT9MWYt0xOm87
         2LCo8nEQFcreTqsi5bylvUB5/Meu/weiMF5zL/oX3hWwJYO0GIGpF6mMQRVFFNuUWkhz
         /CjPSUzTZ6mHdBZUjfLLl1HsK8H4VTVSkjfhJc8aM4ZFQuLi8WedegS47VgCYIPrErUR
         iGuDgj5v6ImeP3aqlDcAtU5gLlosjjL8AHt0iULjPXFUntlDov3U2igZLWHPWhZbDwBl
         ju2w==
X-Gm-Message-State: AOAM532jbKbdgt2heClm6RZWfWfDW8IAbtTSRKUbCo9v+60bcLIF/B3x
        kpnVO2WUlzP3VMsapr4wNpyRyZSJX3I5N7gG9c2dzA==
X-Google-Smtp-Source: ABdhPJyGMFMklte0QuM1qBMWyYlPDXrDxIqPpWPOizk9DcQ2N/pZ9heKgCOitQFFDH4V0H/PHS09ZhJZxHldOHEUz2I=
X-Received: by 2002:a63:3c7:: with SMTP id 190mr783412pgd.240.1628181459424;
 Thu, 05 Aug 2021 09:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210804174322.2898409-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <YQrqhYEL64CSLRTy@kroah.com> <f2b1d564-8174-f8e9-9fee-12e938c6d846@linux.intel.com>
 <YQuYCePPZEmVbkfc@kroah.com> <YQuZdVuaGG/Cr62y@kroah.com> <YQuaJ78y8j1UmBoz@kroah.com>
In-Reply-To: <YQuaJ78y8j1UmBoz@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Thu, 5 Aug 2021 09:37:28 -0700
Message-ID: <CAPcyv4iCBknhGyw-YjO7_Tua9Vkw_UCSHVj3prL3mVfz4nj-_g@mail.gmail.com>
Subject: Re: [PATCH v1] driver: base: Add driver filter support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 5, 2021 at 12:58 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 05, 2021 at 09:55:33AM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Aug 05, 2021 at 09:49:29AM +0200, Greg Kroah-Hartman wrote:
> > > On Wed, Aug 04, 2021 at 12:50:24PM -0700, Andi Kleen wrote:
> > > > > And what's wrong with the current method of removing drivers from
> > > > > devices that you do not want them to be bound to?  We offer that support
> > > > > for all busses now that want to do it, what driver types are you needing
> > > > > to "control" here that does not take advantage of the existing
> > > > > infrastructure that we currently have for this type of thing?
> > > >
> > > > I'm not sure what mechanism you're referring to here, but in general don't
> > > > want the drivers to initialize at all because they might get exploited in
> > > > any code that they execute.
> > >
> > > That is exactly the mechanism we have today in the kernel for all busses
> > > if they wish to take advantage of it.  We have had this for all USB
> > > drivers for well over a decade now, this is not a new feature.  Please
> > > use that instead.
> >
> > Hm, wait, maybe that didn't get merged yet, let me dig...
> >
>
> Ok, my fault, I was thinking of the generic "removable" support that
> recently got added.
>
> Both thunderbolt and USB have the idea of "authorized" devices, that is
> the logic that should be made generic and available for all busses to
> use, by moving it to the driver core, just like the "removable" logic
> got moved to the driver core recently (see 70f400d4d957 ("driver core:
> Move the "removable" attribute from USB to core")
>
> Please use that type of interface, as we already have userspace tools
> using it, and expand it for all busses in the system to use if they
> want.  Otherwise with this proposal you will end up with multiple ways
> to control the same bus type with different types of "filtering",
> ensuring a mess.

I overlooked the "authorized" attribute in usb and thunderbolt. The
collision problem makes sense. Are you open to a core "authorized"
attribute that buses like usb and thunderbolt would override in favor
of their local implementation? I.e. similar to suppress_bind_attrs:

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index daeb9b5763ae..d1780f026d1a 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -511,6 +511,10 @@ static int call_driver_probe(struct device *dev,
struct device_driver *drv)
 {
        int ret = 0;

+       if (driver_core_auth_enabled && !dev->bus->suppress_authorized_attrs &&
+           !driver_core_authorized(dev))
+               return -ENODEV;
+
        if (dev->bus->probe)
                ret = dev->bus->probe(dev);
        else if (drv->probe)
diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index a062befcb3b2..e835be9bee4f 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -323,6 +323,7 @@ struct bus_type tb_bus_type = {
        .probe = tb_service_probe,
        .remove = tb_service_remove,
        .shutdown = tb_service_shutdown,
+       .suppress_authorized_attrs = true,
 };

 static void tb_domain_release(struct device *dev)
diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
index 072968c40ade..2cf9c3cc12b4 100644
--- a/drivers/usb/core/driver.c
+++ b/drivers/usb/core/driver.c
@@ -2028,4 +2028,5 @@ struct bus_type usb_bus_type = {
        .match =        usb_device_match,
        .uevent =       usb_uevent,
        .need_parent_lock =     true,
+       .suppress_authorized_attrs = true,
 };
