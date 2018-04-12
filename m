Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A30837DE78
	for <lwn-linux-doc@archive.lwn.net>; Thu, 12 Apr 2018 20:00:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753468AbeDLUAN (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Apr 2018 16:00:13 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:46836 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752923AbeDLUAL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Apr 2018 16:00:11 -0400
Received: by mail-wr0-f196.google.com with SMTP id d1so6220959wrj.13;
        Thu, 12 Apr 2018 13:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=frlEpkx76aHB2MYngHV7qOkjBtija6sC6i6/bZ7GdYI=;
        b=Pf/tutnc3OUv5KynQBd8eBJ2oZXWUAJTNRBz30I8EtJoqaSWLk0+preRstn582JuGo
         WI5ybkBL7odXW/pQtkmm+oMI8a7Wf436RJyaZwaihUG6wtyVcl+Pwvc828Xdmsxo33ps
         55THyUohNJIr/lBsixV6/T9ObwURxPjlTdHb6pyEXT9ZvK07TOsLYjvou0X9roHTaQGs
         HA+0kagJJl0DNQMIsN8wUpgu9mIz8DYyd3Q3BcKv6qi0NsDHnz9tdn2yYjCUfuad/4s4
         ApXHG2eviSpDeSY7prPN/WUoc0L5aVBGlzqckGld5ttLLYXlS5Hk6yru10ttsWEFI4kt
         /0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=frlEpkx76aHB2MYngHV7qOkjBtija6sC6i6/bZ7GdYI=;
        b=sSLZbkgZhg42IbWddRw7togpoxilgkFwsJDIKOil2m723oltw+oA9weQASTIdOKJIC
         OD7EaL+FlO5FEARg94DSVWrlN3LwxSyFHb1XgWUaFvF8BJ4Lcp4l2ARaJ48S6jfXf+8u
         dxXg1XYP4QG3LP9Hd3RcEeJuvQMH5KrAJL/L3Wnrg3/2kobvmqnO0TTKFmd/JXfZQJQs
         HPg2m/kY5VFnfPoavGAlt0XLImC0m6JHhmk0amwu6rALVZ7148n2q2un+knZTJMrhu1i
         k7ZdV4KA8QnNc+UgfGbk8onul64SAIylBrzDDS6hoFSgc5rknQXGKWCFE+t/xh/VP9TT
         PI2g==
X-Gm-Message-State: ALQs6tBtG8JfBPRy6ilJ60fwkcDPOosBPQABlKtkHZ6de/5HEzd9jIcQ
        rx3CC15XHIYCDdm2zYxUS11whMyC
X-Google-Smtp-Source: AIpwx4/vhFgewJhFHwAjSbpjbuN2ZSkIKOl7bnKZH8GpuKlxA5MBZNMyvPiau/hnsui/2nBrT+JmSA==
X-Received: by 10.223.135.51 with SMTP id a48mr1629618wra.242.1523563210281;
        Thu, 12 Apr 2018 13:00:10 -0700 (PDT)
Received: from debian64.daheim (p200300D5FBC4BDFC0000000000000830.dip0.t-ipconnect.de. [2003:d5:fbc4:bdfc::830])
        by smtp.gmail.com with ESMTPSA id m35sm5632218wrm.59.2018.04.12.13.00.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Apr 2018 13:00:08 -0700 (PDT)
Received: from localhost.daheim ([127.0.0.1] helo=debian64.localnet)
        by debian64.daheim with esmtp (Exim 4.90_1)
        (envelope-from <chunkeey@gmail.com>)
        id 1f6iO7-0003r1-R7; Thu, 12 Apr 2018 22:00:07 +0200
From:   Christian Lamparter <chunkeey@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-gpio@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: add hogs support for machine code
Date:   Thu, 12 Apr 2018 22:00:07 +0200
Message-ID: <17720832.6ELUnVt0BR@debian64>
In-Reply-To: <20180410203028.11412-1-brgl@bgdev.pl>
References: <20180410203028.11412-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Dienstag, 10. April 2018 22:30:28 CEST Bartosz Golaszewski wrote:
> Board files constitute a significant part of the users of the legacy
> GPIO framework. In many cases they only export a line and set its
> desired value. We could use GPIO hogs for that like we do for DT and
> ACPI but there's no support for that in machine code.
> 
> This patch proposes to extend the machine.h API with support for
> registering hog tables in board files.
> 
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
> @@ -1326,6 +1364,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
>  
>  	acpi_gpiochip_add(chip);
>  
> +	machine_gpiochip_add(chip);
> +
>  	/*
>  	 * By first adding the chardev, and then adding the device,
>  	 * we get a device node entry in sysfs under
> @@ -3462,6 +3502,33 @@ void gpiod_remove_lookup_table(struct gpiod_lookup_table *table)

I think I see the same problem right here in regards to pinctrls
and gpiohogs that have with DeviceTree:
<https://patchwork.kernel.org/patch/10313767/>

The problem is that unlike native gpio-controllers, pinctrls need 
to have a "pin/gpio range" defined before any gpio-hogs can be added.

If this is not the case the generic pinctrl_gpio_reguest() [0] will
fail with -EPROBE_DEFER at this point. (see the call chain in the
"pinctrl: msm: fix gpio-hog related boot issueslogin register" mail
starting from gpiod_hog).

And now the crux of the matter is that currently in order for pinctrl
drivers to register the range they have to call gpiochip_add_pin_range() [1]. 
But they only can do it after the gpiochip_add_data_with_key() [2], since
this function initializes the pin_ranges list [3].

So what will happen is that you'll get an
"gpiochip_machine_hog: unable to hog GPIO line $LABEL $GPIONR -517" error
for every single gpio-hog and wonder why :(.

Regards,
Christian

[0] <https://elixir.bootlin.com/linux/v4.16.2/source/drivers/pinctrl/core.c#L743>
[1] <https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L2078>
[2] <https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L1136>
[3] <https://elixir.bootlin.com/linux/latest/source/drivers/gpio/gpiolib.c#L1253>



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
