Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 466AA7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 08:28:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725827AbfJCI2A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 04:28:00 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:43191 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJCI2A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Oct 2019 04:28:00 -0400
Received: by mail-oi1-f194.google.com with SMTP id t84so1791903oih.10
        for <linux-doc@vger.kernel.org>; Thu, 03 Oct 2019 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qQG1qX2Fo7mymsvFZqN/2deIwbx2xFuKZ1SF2ngILIs=;
        b=GrOKcd2lYYN9CId0OKndMf+Pm4an+PKLS8N+dIjWg22jo7dp12Sq3GDmcMVZ7CU7oT
         k/xmDPM77AuHTjdYMTn5HGvLwKOOnYrOqhjSMm2tQjraSFmNCnkEvpncEJqzL+QjHuoQ
         qHCdQl+h5OZS4DhOC3HkF5mjC1osJTHAhlSGnVxzfhUqUc0HIzPLHSTskkKRKkJLPnw/
         43QoNAurPNvwzJ2HB8PKJRuG4/JaLDqPS/JFoz2tJ4NyVpgQzpuPBH3SvmP53HYq1aye
         YV4irhChx8QvgGTv+HpkNQnP2Lk+UA2ud/2azy5JUDiwMCIsji4m8hB6s5EfcXJrMRW9
         kWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qQG1qX2Fo7mymsvFZqN/2deIwbx2xFuKZ1SF2ngILIs=;
        b=KNC7TXpOIJFZmxYoWZ7mZFVE+v+LP32Gg9bQHy7/MfvEzGskYHN/pc0xitlGKtY7R6
         zoD7jPcA16vv4mYQJSmBGe56trW/445T8MDO22IE2z805ixFQpdXf7hQoSfJDeFa0cJ6
         zvFyUbn/ElHiir2UUuab+EkPNWUenVvTreQ6loZ5qqrjiUXwte0urZy2675NFl7PH38u
         TO6UmX2dREU2kfI/GdaXyFcwBW/CNm+kKEQ0Pq5MCTcggliBIhegfrDF7oJQUtFboduJ
         wTYmTM4ZPQjlNTsJXfseZ02Bk76ukhbtIaphzh4eiqiDb1vHqfLQDJOUy0UqoDQo7cBx
         UXGQ==
X-Gm-Message-State: APjAAAWjDntEdkNCNH81sp8cvZ3Up/WaCcrEpthexktb+We5F60B5ccg
        dtjfMtsfUHJihupKt+eYGFmWiaWOMBJ0+99tNPYcuA==
X-Google-Smtp-Source: APXvYqy9YqGTY4OOqbOUV9JhiWoUFw1BE2suz8xvM8zmVI8i/k5zOkaVkzTqsFu8W9c8Cz26Nwlccda3l09vDI6lSbY=
X-Received: by 2002:aca:f54d:: with SMTP id t74mr1949671oih.170.1570091279691;
 Thu, 03 Oct 2019 01:27:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191002144141.9732-1-j.neuschaefer@gmx.net>
In-Reply-To: <20191002144141.9732-1-j.neuschaefer@gmx.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Oct 2019 10:27:49 +0200
Message-ID: <CAMpxmJU7DZyQ9nJo3wc8T3+J838-MGsOOwE1wLe8SbCfR_xzHQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: gpio: driver: Format code blocks properly
To:     =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

=C5=9Br., 2 pa=C5=BA 2019 o 16:41 Jonathan Neusch=C3=A4fer <j.neuschaefer@g=
mx.net> napisa=C5=82(a):
>
> This fixes a lot of Sphinx warnings, and makes the code blocks look nice
> in HTML.
>
> Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
> ---
>  Documentation/driver-api/gpio/driver.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/dri=
ver-api/gpio/driver.rst
> index 3fdb32422f8a..18dca55eddfd 100644
> --- a/Documentation/driver-api/gpio/driver.rst
> +++ b/Documentation/driver-api/gpio/driver.rst
> @@ -415,6 +415,8 @@ If you do this, the additional irq_chip will be set u=
p by gpiolib at the
>  same time as setting up the rest of the GPIO functionality. The followin=
g
>  is a typical example of a cascaded interrupt handler using gpio_irq_chip=
:
>
> +.. code-block:: c
> +
>    /* Typical state container with dynamic irqchip */
>    struct my_gpio {
>        struct gpio_chip gc;
> @@ -450,6 +452,8 @@ is a typical example of a cascaded interrupt handler =
using gpio_irq_chip:
>  The helper support using hierarchical interrupt controllers as well.
>  In this case the typical set-up will look like this:
>
> +.. code-block:: c
> +
>    /* Typical state container with dynamic irqchip */
>    struct my_gpio {
>        struct gpio_chip gc;
> --
> 2.20.1
>

Applied, thanks!

Bart
