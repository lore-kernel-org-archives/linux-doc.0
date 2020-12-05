Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C03C4361B
	for <linux-doc@archiver.kernel.org>; Sat,  5 Dec 2020 19:33:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9B91230F9
	for <linux-doc@archiver.kernel.org>; Sat,  5 Dec 2020 19:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgLETdo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Dec 2020 14:33:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28815 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726298AbgLETdn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Dec 2020 14:33:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607196736;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ofSC9lpwG6+UCSNudemJILG6AFj0fHelQy+fBqMM60g=;
        b=cy8Jq9wSk8gQuNZXnP2wE49QhpPshTkFa4tlzcDvmvPhuws7ZKzMhI5hGkX6pZwj+mzUCe
        DXQNu1JhnlJb55XmEWUh4+dmjbz6PXe3YOl3CeJsxEADjCg4u6xScuRdK79jTsNGvHXhkl
        XZnzGa8z/gBY3wbTFU0XMWlDbgus7Bk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-8f6U_0HeMOOTAJCfwUqGQw-1; Sat, 05 Dec 2020 14:32:12 -0500
X-MC-Unique: 8f6U_0HeMOOTAJCfwUqGQw-1
Received: by mail-wm1-f72.google.com with SMTP id d16so1039326wmd.1
        for <linux-doc@vger.kernel.org>; Sat, 05 Dec 2020 11:32:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ofSC9lpwG6+UCSNudemJILG6AFj0fHelQy+fBqMM60g=;
        b=XtEZjAh4+uSg2cMkhmOXHOsHWpDultxBZ64E0xBOdjmCBORA/WLDZR62VWWsLZvY3r
         yWBBebms6YOSi3fl1Lj4HCW92WeDQrnk+d3n+eXdU3j7/bHMCvutrCgSbAkGokp6WVqJ
         Ccntib/IhEuiTGQr7aUqWB/ICLpD4mg3gJM4yhUdgTUx7lYoljLTGlGx/UGo7taySs1O
         234CsBgnteiJdJGDtByPrh4kP9NeCJk4GUTVJD7qhM8eslF0bTzTM/hciOsBjCuzQe9U
         wbNx14SvqCp00VjfK1F/KNkezNYmO8I8aMrmU48ZaMHvgv4jLCaQUJNz/qjNWa1v8wO9
         AJtA==
X-Gm-Message-State: AOAM5328fucEOXNioFN8wADtC3PBJ/PNLyh1HOUsnbwU84kuo00/MyiT
        3nqk/0oJBYbnFDSBiOymRCeEYsROkT4+tjPsKP1Q74T+IaNWLHQTPRenv7xKGhjLjQZKrCQW6zh
        U/tM6/CNXumM3m6w4d9O5
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr10659857wme.118.1607196729260;
        Sat, 05 Dec 2020 11:32:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTZFGnBU4zJ3vNUAlp7Lk23tATWWb8vX7NoCe2Rd1SBGhMQ9NKv0j2hhmXa23rEif7aIjTgQ==
X-Received: by 2002:a1c:9d85:: with SMTP id g127mr10659834wme.118.1607196729032;
        Sat, 05 Dec 2020 11:32:09 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
        by smtp.gmail.com with ESMTPSA id b14sm8512163wrq.47.2020.12.05.11.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Dec 2020 11:32:08 -0800 (PST)
Date:   Sat, 5 Dec 2020 14:32:04 -0500
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Jason Wang <jasowang@redhat.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org, stefanha@redhat.com,
        msuchanek@suse.de
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
Message-ID: <20201205142218-mutt-send-email-mst@kernel.org>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Dec 05, 2020 at 08:59:55AM +0100, Enrico Weigelt, metux IT consult wrote:
> On 04.12.20 04:35, Jason Wang wrote:
> 
> >> --- a/drivers/gpio/Kconfig
> >> +++ b/drivers/gpio/Kconfig
> >> @@ -1615,6 +1615,15 @@ config GPIO_MOCKUP
> >>         tools/testing/selftests/gpio/gpio-mockup.sh. Reference the
> >> usage in
> >>         it.
> >>   +config GPIO_VIRTIO
> >> +    tristate "VirtIO GPIO support"
> >> +    depends on VIRTIO
> > 
> > 
> > Let's use select, since there's no prompt for VIRTIO and it doesn't have
> > any dependencies.
> 
> whoops, it's not that simple:
> 
> make: Entering directory '/home/nekrad/src/apu2-dev/pkg/kernel.apu2.git'
> make[1]: Entering directory
> '/home/nekrad/src/dk/DistroKit/platform-x86_64/build-target/linux-5.8.9-build'
>   GEN     Makefile
> drivers/gpu/drm/Kconfig:74:error: recursive dependency detected!
> drivers/gpu/drm/Kconfig:74:	symbol DRM_KMS_HELPER is selected by
> DRM_VIRTIO_GPU
> drivers/gpu/drm/virtio/Kconfig:2:	symbol DRM_VIRTIO_GPU depends on VIRTIO
> drivers/virtio/Kconfig:2:	symbol VIRTIO is selected by GPIO_VIRTIO
> drivers/gpio/Kconfig:1618:	symbol GPIO_VIRTIO depends on GPIOLIB
> drivers/gpio/Kconfig:14:	symbol GPIOLIB is selected by I2C_MUX_LTC4306
> drivers/i2c/muxes/Kconfig:47:	symbol I2C_MUX_LTC4306 depends on I2C
> drivers/i2c/Kconfig:8:	symbol I2C is selected by FB_DDC
> drivers/video/fbdev/Kconfig:63:	symbol FB_DDC depends on FB
> drivers/video/fbdev/Kconfig:12:	symbol FB is selected by DRM_KMS_FB_HELPER
> drivers/gpu/drm/Kconfig:80:	symbol DRM_KMS_FB_HELPER depends on
> DRM_KMS_HELPER
> 
> Seems that we can only depend on or select some symbol - we run into
> huge trouble if thats mixed. Just changed DRM_VIRTIO_GPU to just select
> VIRIO instead of depending on it, and now it works.
> 
> I've posted another patch for fixing drivers/gpu/drm/virtio/Kconfig
> to use 'select' instead of 'depends on'.

It seems a bit of a mess, at this point I'm not entirely sure when
should drivers select VIRTIO and when depend on it.

The text near it says:

# SPDX-License-Identifier: GPL-2.0-only
config VIRTIO
        tristate
        help
          This option is selected by any driver which implements the virtio
          bus, such as CONFIG_VIRTIO_PCI, CONFIG_VIRTIO_MMIO, CONFIG_RPMSG
          or CONFIG_S390_GUEST.

Which seems clear enough and would indicate drivers for devices *behind*
the bus should not select VIRTIO and thus presumably should "depend on" it.
This is violated in virtio console and virtio fs drivers.

For console it says:

commit 9f30eb29c514589e16f2999ea070598583d1f6ec
Author: Michal Suchanek <msuchanek@suse.de>
Date:   Mon Aug 31 18:58:50 2020 +0200

    char: virtio: Select VIRTIO from VIRTIO_CONSOLE.
    
    Make it possible to have virtio console built-in when
    other virtio drivers are modular.
    
    Signed-off-by: Michal Suchanek <msuchanek@suse.de>
    Reviewed-by: Amit Shah <amit@kernel.org>
    Link: https://lore.kernel.org/r/20200831165850.26163-1-msuchanek@suse.de
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

which seems kind of bogus - why do we care about allowing a builtin
virtio console driver if the pci virtio bus driver is a module?
There won't be any devices on the bus to attach to ...

And for virtio fs it was like this from the beginning.

I am inclined to fix console and virtio fs to depend on VIRTIO:
select is harder to use correctly ...

Jason?


> -- 
> ---
> Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
> werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
> GPG/PGP-Schlüssel zu.
> ---
> Enrico Weigelt, metux IT consult
> Free software and Linux embedded engineering
> info@metux.net -- +49-151-27565287

