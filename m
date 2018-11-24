Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1394A7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726289AbeKYHfY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:35:24 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:37618 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbeKYHfU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:35:20 -0500
Received: by mail-lj1-f194.google.com with SMTP id e5-v6so13272330lja.4
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xPfyQ+7n1YYX7CPsLFiLqlbk/g/+BhVnBee1KeCITsw=;
        b=kRIC0X3xR7w0MN5vhWpzOuocor2Adll+gKhIcAdHsl8nPmxwpaAtiWacEJR1HRw0Vy
         kX/+oH/zRukHEOOjiBOKG7/fjvpdzurgfpt4CJk1Hm4DTOe0OaBsxUBtKu+Qg1a6mvcT
         3r6arwVXXMrB2CBm1RIeXfvyaLfPDaUTZZH4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPfyQ+7n1YYX7CPsLFiLqlbk/g/+BhVnBee1KeCITsw=;
        b=RIAveSWa8rMj0osB+KyewsPk7ruP8FC9wP0kPeCAQABSo+TCDFouTUxojTy005G28N
         LDVpPAvJvFe+tsrLQGvcfrT/OH48n98IPW7JZT8aCcr43e53pJFtb30jQnRPKwD1ZatQ
         CLodI81rZcewB+cuJLl0QIqrgJD/QeNsVWO9odBocH4Q+Y1wYA+QdKC6J8jbtTvuKcvP
         oAXhWkT3eUK/FaNleygA+cvGnzfZJNhZaORbQ5MJWtnHRdvAY0oju7b36Nb0O8qpzxMj
         /aT90ZVCSDe0pRqpvoYM8oDnXmpGKtJK0JPmXvM72bG9PqrQYIztpVt+ckpIx/tPBzUP
         FhdA==
X-Gm-Message-State: AA+aEWZCvUCXsiDxbsBOvckm9IpNJpQOV0V2jQQkIQhrqyMqw7w8VnyS
        B91q5lYv7SsMqKTp0R2htSH7/f0q3nGAuImTCa8O+w==
X-Google-Smtp-Source: AJdET5dOlzltbyljr++5GfM6EIVINqzc81nKgQY3MQlNzVDc/tyYJnO9Phc/L7QlVgQepJmBZWVG1kkBG1Rm8vMpK0c=
X-Received: by 2002:a2e:7403:: with SMTP id p3-v6mr13069874ljc.97.1543092363062;
 Sat, 24 Nov 2018 12:46:03 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-5-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-5-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:45:51 +0100
Message-ID: <CACRpkdb9=s9oFgOKBWD_V7rdVGz1WCxuU+t_4SBymvj93MUR+g@mail.gmail.com>
Subject: Re: [PATCH 4/9] drm: remove deprecated "drm_dev_unref" function
To:     greenfoo@gluegarage.com
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Jonathan Corbet <corbet@lwn.net>, abrodkin@synopsys.com,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Archit Taneja <architt@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        linux+etnaviv@armlinux.org.uk,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Julia Lawall <Julia.Lawall@lip6.fr>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Nicolas Palix <nicolas.palix@imag.fr>, michal.lkml@markovi.net,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        linux-doc@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        virtualization@lists.linux-foundation.org,
        etnaviv@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        cocci@systeme.lip6.fr
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:

> There are no more places where this (deprecated) function is being used
> from, thus it can now be removed.
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Patch applied.

Yours,
Linus Walleij
