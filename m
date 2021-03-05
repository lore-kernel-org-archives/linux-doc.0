Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38523C433DB
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 08:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10D2765016
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 08:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbhCEIqW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 03:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCEIpx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 03:45:53 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76880C061574
        for <linux-doc@vger.kernel.org>; Fri,  5 Mar 2021 00:45:53 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id dx17so1911649ejb.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 00:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5iA4x57cYD26M9mH9ZJl/HuREPakbn8+6uPhwu8dScQ=;
        b=NfLSGdKWY4SW5FR5f1IF46zHLQNEnhdkLS+i/UTCwbQJl3iejMao+y0vnNga2Rm51m
         UPhwK0pUNjGXenfpV40qgmpkqDIDWwM8PHXixt/Ix6mGuGMM0thPNB0LDKi87aqZh6hE
         xI0tOylhI5e87UfYhA7fkkP4ZGOSHgs1APTcpwVICgS67QeqmMWOg50ZFVFcsdfcIMQa
         YFeteLio3B6FM0SAoP/p/UOpn+WtV1jZ8v8fqI49wq+yMcgIoZ9mn38ZcpKf/1TDBtyi
         NTWzqTeDX7eHn2ihLG7oChALd4H/OyrOcDSldnMC3lXH7Po0IN9YqR2c/8Cf8p7JTN7i
         Qpxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5iA4x57cYD26M9mH9ZJl/HuREPakbn8+6uPhwu8dScQ=;
        b=rRrcUYSVClBSBUyo7cpKU6SNEVEtiSmZwZYPWY2hb9SfPNiSLbZQP1RccHKIsHNFSg
         0Iv8+bTypI0JKmGE4nZIk0I9P4w32bWOwd093KMMHjUKgm7no/ocwFvXHOvTuW8cW0qg
         XGtYN0cjMlot0rAnDV0P/OLKa/vU0qe5EkqDnhj6sSFLNNKePKLu+rOSzYcAkt2sDjvB
         ycQD5KhIvjf8w1M3DjZciel+1xItBzyjmGRaL29ycGDTJPuoQ5oNg6cADaShzSl9qujN
         Kz4wExXDAwA51yn2eMgtXX+IGsXTqPipSt0/YLcAdNDv4H9O4vrRbB3CB0wcKRNPSwI9
         P2/g==
X-Gm-Message-State: AOAM532MFip04v0NsNbkUDD+1hYW3cHAojkBHVsnzcWdnSH8s40Gj8Tl
        +9k4PSM5zsDf028V4WZq7q6SzYOmEyOk9cWFQRfvZg==
X-Google-Smtp-Source: ABdhPJxvKJEduCeKxilU3h+wx3QcSAC478yoM/m/H5MK1cr3jwbhYnACXxu4n/dzHr/P2a6/wAMjv9mLYiv4d555RVM=
X-Received: by 2002:a17:906:d938:: with SMTP id rn24mr1425523ejb.87.1614933952198;
 Fri, 05 Mar 2021 00:45:52 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-9-brgl@bgdev.pl>
 <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com> <YEHs3CxWnusWklME@kroah.com>
In-Reply-To: <YEHs3CxWnusWklME@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 5 Mar 2021 09:45:41 +0100
Message-ID: <CAMRc=MddDb+nakgEM+Xeqm=rMMkkWO2EDekD36EoPJashYP88w@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drivers: export device_is_bound()
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>, Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 5, 2021 at 9:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> > CC Greg
> >
> > On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > > to check if the simulated GPIO chip is bound before fetching its driver
> > > data from configfs callbacks in order to retrieve the name of the GPIO
> > > chip device.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > ---
> > >  drivers/base/dd.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > index 9179825ff646..c62c02e3490a 100644
> > > --- a/drivers/base/dd.c
> > > +++ b/drivers/base/dd.c
> > > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> > >  {
> > >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> > >  }
> > > +EXPORT_SYMBOL_GPL(device_is_bound);
>
> No.  Please no.  Why is this needed?  Feels like someone is doing
> something really wrong...
>
> NACK.
>

I should have Cc'ed you the entire series, my bad.

This is the patch that uses this change - it's a new, improved testing
module for GPIO using configfs & sysfs as you (I think) suggested a
while ago:

https://lkml.org/lkml/2021/3/4/355

The story goes like this: committing the configfs item registers a
platform device. As far as I understand - there's no guarantee that
the device will be bound to a driver before the commit callback (or
more specifically platform_device_register_full() in this case)
returns so the user may try to retrieve the name of the device
immediately (normally user-space should wait for the associated uevent
but nobody can force that) by doing:

mv /sys/kernel/config/gpio-sim/pending/foo /sys/kernel/config/gpio-sim/live/
cat /sys/kernel/config/gpio-sim/live/foo/dev_name

If the device is not bound at this point, we'll have a crash in the
kernel as opposed to just returning -ENODEV.

Please advise on how to handle it without device_is_bound().

Best Regards,
Bartosz
