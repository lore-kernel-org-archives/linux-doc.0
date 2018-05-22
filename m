Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E87D7DF8A
	for <lwn-linux-doc@archive.lwn.net>; Tue, 22 May 2018 17:32:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751532AbeEVRb7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 22 May 2018 13:31:59 -0400
Received: from mail-yb0-f196.google.com ([209.85.213.196]:41354 "EHLO
        mail-yb0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751279AbeEVRb5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 May 2018 13:31:57 -0400
Received: by mail-yb0-f196.google.com with SMTP id l2-v6so5339263ybp.8;
        Tue, 22 May 2018 10:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FCIFCwN4BsZviL5RscZ08REikPLNKe91yrUJJGqBJmQ=;
        b=WESdLSiDdtgONJOcUvpNAE17OpnYF5hE9E7D54d0IEoBU0gaHD5hjXflIjB99k5yt7
         ltVh7eWK68ID0Q+FDZSDO1pOhCq8aF7ENhiPcMOZ5bhxghL6t61AVquYu2CVE4S1YCMI
         ES7M03A2/B8tG4meqpvEL19k2qpcvl2bshqjjn91gWVlYNZv4u5FVkDj2xy477Pw7lF6
         XfDW3vWXnV/+4jEPzTmJ5dSIDqjOMcfwSKIH9CpK1b4svthH5YpYJGnO9FU3qQOWCimw
         9TcdjXqJIaIrrr9zkgtyUkypvST7Fuf0ut0vfdDLE27hNiyzMHvyFLDbVvl6UKGcck00
         5bBQ==
X-Gm-Message-State: ALKqPwcfIIiQAPy5qufwWJHPd05lz5S2OvcqqBa/dZmlmF8Oe10YYCn1
        542ai9QwwKbROuIhLF591Q==
X-Google-Smtp-Source: AB8JxZqie4YO7cdwSOI/1OgOqxfbFZQnn5QHFjyzBiGmJ4X1m77Hge4xU1eqhRasBAkHHIBzbo7veA==
X-Received: by 2002:a25:c74e:: with SMTP id w75-v6mr487706ybe.337.1527010316875;
        Tue, 22 May 2018 10:31:56 -0700 (PDT)
Received: from localhost (24-223-123-72.static.usa-companies.net. [24.223.123.72])
        by smtp.gmail.com with ESMTPSA id x26-v6sm4202349ywj.95.2018.05.22.10.31.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 May 2018 10:31:56 -0700 (PDT)
Date:   Tue, 22 May 2018 12:31:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Mark Rutland <mark.rutland@arm.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Roy Pledge <Roy.Pledge@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, linux-gpio@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@zh-kernel.org, linux-usb@vger.kernel.org,
        linux-input@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-fbdev@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH v2 11/11] docs: fix broken references with multiple hints
Message-ID: <20180522173155.GA11767@rob-hp-laptop>
References: <cover.1525870886.git.mchehab+samsung@kernel.org>
 <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63a4f8a93f9115475bc184d0f37d076c9b9c75ff.1525870886.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 10:18:54AM -0300, Mauro Carvalho Chehab wrote:
> The script:
> 	./scripts/documentation-file-ref-check --fix-rst
> 
> Gives multiple hints for broken references on some files.
> Manually use the one that applies for some files.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/ABI/obsolete/sysfs-gpio                     | 2 +-
>  .../devicetree/bindings/display/bridge/tda998x.txt        | 2 +-

Acked-by: Rob Herring <robh@kernel.org>

>  Documentation/trace/events.rst                            | 2 +-
>  Documentation/trace/tracepoint-analysis.rst               | 2 +-
>  Documentation/translations/zh_CN/SubmittingDrivers        | 2 +-
>  Documentation/translations/zh_CN/gpio.txt                 | 4 ++--
>  MAINTAINERS                                               | 2 +-
>  drivers/hid/usbhid/Kconfig                                | 2 +-
>  drivers/input/Kconfig                                     | 4 ++--
>  drivers/input/joystick/Kconfig                            | 4 ++--
>  drivers/input/joystick/iforce/Kconfig                     | 2 +-
>  drivers/input/serio/Kconfig                               | 4 ++--
>  drivers/staging/fsl-mc/bus/dpio/dpio-driver.txt           | 2 +-
>  drivers/video/fbdev/skeletonfb.c                          | 8 ++++----
>  include/linux/tracepoint.h                                | 2 +-
>  security/device_cgroup.c                                  | 2 +-
>  16 files changed, 23 insertions(+), 23 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
