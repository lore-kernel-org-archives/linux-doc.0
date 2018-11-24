Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B05D07D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbeKYH2D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:28:03 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:39260 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726223AbeKYH2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:28:03 -0500
Received: by mail-lj1-f194.google.com with SMTP id t9-v6so13266721ljh.6
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MemGfOqxhb4bbzDSIHdqtma18mku1RRMcm6AHUMBKwc=;
        b=V8JxDTkloCGYAza57L/wVUlXIigfX8RjZnYh6L3ieVMg4v8+U0RUVAG2hMQzNxbIF2
         JKb+3dE4yMPU262wVBS1aWAmvUHwpdf3AU8BaYIKPMv2bbvmJiIFw1MsEbTf9Mv6YLC9
         6yC0rCKQ/mjRahqVnSvD/JpyJt5D/D/C1GHSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MemGfOqxhb4bbzDSIHdqtma18mku1RRMcm6AHUMBKwc=;
        b=mR5O8Q8ARZ8lCFd90ZPovq/MozP7hPEd/4YNZ7TUHOno/xzOz5c8KU5XpGHCn5Egdr
         edVSG3MCwAEom4QTUkHfy0eXZ2WbG05lg7rYFGeqFtYhZN3qto7xq/O1YrqAQFjmd2s1
         TtlFYtjDQuGNViBNRGaUWyMNuVQikM1hFXosot2WglSqD8EiKDwx8iO99w25vGDOUYDD
         tStVLQPcU941pHYYbuYpCAuyprUGNt+YWWg/2ttVmkcovsIr5QgybdMh5fdUHd/dSJiY
         dI0BOgjtB27pd69uWHwknyHYiA04U2J5fRgGGt4LWD8aOr0UhOzDGKH1zgDeRXMmQ5GX
         SNoA==
X-Gm-Message-State: AA+aEWaDzH56+AsQPeJ06Iodpdu9WmxH6u8AiS2ixLX5fi7gXh00e+Q/
        h7vnKe8mmziLphPI0Q6sO5qLf4Nd/G4s/p3Y2XpwMA==
X-Google-Smtp-Source: AFSGD/XC6KXTjoxX9zEf/MyCQjYRS7MODc2B1wcixAJcS2bwJ20s7qPBbusb82qy/27Ifzg0VN7yc6AyEXkMKoN8mbc=
X-Received: by 2002:a2e:9849:: with SMTP id e9-v6mr11674367ljj.9.1543091927901;
 Sat, 24 Nov 2018 12:38:47 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-3-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-3-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:38:35 +0100
Message-ID: <CACRpkdZu+RPr4MrsqF_t4Rd0LAu_rYR4omoLh69+02Qhg21jxw@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm: remove deprecated "[__]drm_gem_object_[un]reference[_locked]"
 functions
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

> There are no more places where these (deprecated) functions are being
> used from, thus they can now be removed.
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Patch applied to drm-misc-next.

Yours,
Linus Walleij
