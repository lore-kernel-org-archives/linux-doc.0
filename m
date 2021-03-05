Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E954C433E6
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 09:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE5BE64DD1
	for <linux-doc@archiver.kernel.org>; Fri,  5 Mar 2021 09:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbhCEJQy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Mar 2021 04:16:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCEJQY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Mar 2021 04:16:24 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40AF1C06175F
        for <linux-doc@vger.kernel.org>; Fri,  5 Mar 2021 01:16:22 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id m9so1580744edd.5
        for <linux-doc@vger.kernel.org>; Fri, 05 Mar 2021 01:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIBDWNNi8cOFiM8+evn3aAlmPQp0YRKNZPxj0/XqUWQ=;
        b=u4Jyn3Q8Pea4kIqitbrUxq9fdmX4drucuJlXzg8S7ph189frPo2kVhUymrtzX5OdAR
         aAqHuyC22KmTKQUB/uHq6J2eeMU+s/E5bg87cjyv76PXYyxdQ0G7SJ3puqj6TBkwME7y
         6EpZRyomx+Bc6A7vI4NUJeHN5rDeHXCbqJmS4xnDiJqZIeTJEY1cI+XrTvR7pypf7cnj
         pNyFdrZrjjszeNDLuG9alPKk+c1tjMEfzjfhSqYvsaTC/RxuzjiKvQNq/lrfDqlAkQNT
         jGyXKCLuEDbv0EQwlWUbZicRiYnh8fvsF/tLy2s3Hy9Y0tlf+MusWoVKJx7A9tjFrgoC
         JNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIBDWNNi8cOFiM8+evn3aAlmPQp0YRKNZPxj0/XqUWQ=;
        b=k7CBklrXZKqtHvgxLrk5D840KPr6WcAcAcf4B2PRsK2FjcVJiho7ZnZNomOa/5/WYh
         qfZXwdMexPU99C2HJe2eCGEuLV2bfYkKM8irrqYpMmfJWaGQNZdJIMoI9LFisa6QuMWE
         nbdlRpJUaT/4iGZGkUcR6t1VFIuQuX8f2Qy1Kxoo0nzH6vtino1hhsWMd0R8eP5Scp9j
         8uJsKHn+dRiGcocsMry2eJfsYRy5YrPKDRuZAqsgb2160EKpsc+PjuXNuEyhtZ79yRI5
         TS+21GLizJmtSNRISiC5OIhqdpgW36h1Dikd2nzsmouwiIDLSDBtdhTduFTjc/9U617g
         pC7Q==
X-Gm-Message-State: AOAM530B584LwE5Fwu/N130cchFoeolS7M3OLCUXEvtwl5KFgOEC+FDj
        hV9syu6MOsYDUpUQHlRc/bS2ByNwGL+EktNTa2pIXQ==
X-Google-Smtp-Source: ABdhPJzzmY/G5skM6ldbcpzc8Wq/WaJKmtsBErdrGkLrINycrkkGQm9shCbuidqUqILRCJUAQDgPCiqP7P86geeDyIA=
X-Received: by 2002:a05:6402:17d6:: with SMTP id s22mr8257787edy.232.1614935780916;
 Fri, 05 Mar 2021 01:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20210304102452.21726-1-brgl@bgdev.pl> <20210304102452.21726-9-brgl@bgdev.pl>
 <CAMuHMdXRK5=w1-Z=EbM60Sf2bLY1EiVaxbZjMP+XyQ3g7nBpZw@mail.gmail.com>
 <YEHs3CxWnusWklME@kroah.com> <CAMRc=MddDb+nakgEM+Xeqm=rMMkkWO2EDekD36EoPJashYP88w@mail.gmail.com>
 <YEHyDUQ3V7Pl6+TU@kroah.com>
In-Reply-To: <YEHyDUQ3V7Pl6+TU@kroah.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 5 Mar 2021 10:16:10 +0100
Message-ID: <CAMRc=Md7FeQAd4Syh685+jyZAq2QStBNoo0ACQxrSB=4N6d3dg@mail.gmail.com>
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

On Fri, Mar 5, 2021 at 9:55 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 05, 2021 at 09:45:41AM +0100, Bartosz Golaszewski wrote:
> > On Fri, Mar 5, 2021 at 9:34 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, Mar 05, 2021 at 09:18:30AM +0100, Geert Uytterhoeven wrote:
> > > > CC Greg
> > > >
> > > > On Thu, Mar 4, 2021 at 11:30 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > > >
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > > > Export the symbol for device_is_bound() so that we can use it in gpio-sim
> > > > > to check if the simulated GPIO chip is bound before fetching its driver
> > > > > data from configfs callbacks in order to retrieve the name of the GPIO
> > > > > chip device.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > ---
> > > > >  drivers/base/dd.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > > > index 9179825ff646..c62c02e3490a 100644
> > > > > --- a/drivers/base/dd.c
> > > > > +++ b/drivers/base/dd.c
> > > > > @@ -353,6 +353,7 @@ bool device_is_bound(struct device *dev)
> > > > >  {
> > > > >         return dev->p && klist_node_attached(&dev->p->knode_driver);
> > > > >  }
> > > > > +EXPORT_SYMBOL_GPL(device_is_bound);
> > >
> > > No.  Please no.  Why is this needed?  Feels like someone is doing
> > > something really wrong...
> > >
> > > NACK.
> > >
> >
> > I should have Cc'ed you the entire series, my bad.
> >
> > This is the patch that uses this change - it's a new, improved testing
> > module for GPIO using configfs & sysfs as you (I think) suggested a
> > while ago:
> >
> > https://lkml.org/lkml/2021/3/4/355
> >
> > The story goes like this: committing the configfs item registers a
> > platform device.
>
> Ick, no, stop there, that's not a "real" device, please do not abuse
> platform devices like that, you all know I hate this :(
>
> Use the virtbus code instead perhaps?
>

I have no idea what virtbus is and grepping for it only returns three
hits in: ./drivers/pci/iov.c and it's a function argument.

If it stands for virtual bus then for sure it sounds like the right
thing but I need to find more info on this.

> > As far as I understand - there's no guarantee that
> > the device will be bound to a driver before the commit callback (or
> > more specifically platform_device_register_full() in this case)
> > returns so the user may try to retrieve the name of the device
> > immediately (normally user-space should wait for the associated uevent
> > but nobody can force that) by doing:
> >
> > mv /sys/kernel/config/gpio-sim/pending/foo /sys/kernel/config/gpio-sim/live/
> > cat /sys/kernel/config/gpio-sim/live/foo/dev_name
> >
> > If the device is not bound at this point, we'll have a crash in the
> > kernel as opposed to just returning -ENODEV.
>
> How will the kernel crash?  What has created the dev_name sysfs file
> before it is possible to be read from?  That feels like the root
> problem.
>

It's not sysfs - it's in configfs. Each chip has a read-only configfs
attribute that returns the name of the device - I don't really have a
better idea to map the configfs items to devices that committing
creates.

> > Please advise on how to handle it without device_is_bound().
>
> Please do not create sysfs files before they can be read from :)
>

Don't worry, I don't.

Bartosz
