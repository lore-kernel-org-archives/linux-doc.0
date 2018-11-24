Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EEA9D7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbeKYH1h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:27:37 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42799 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726226AbeKYH1h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:27:37 -0500
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so13265507lja.9
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/YNX1aPE/SVwRFw3fNROIhW8+05SCoozZhXoa+cbw3k=;
        b=ZVb6PfSyCydnx4jxB+11VrJONbURfp+USpAimVG05XsuW95a8r6yIHF7RrGrlw71q9
         mZoXJi9ZSuQMVP6SDqS9LAtHt2ZQWkp/nTKu0Xfx1Jbz3ZXrg3fnk4WEOysp1LGHArKK
         1XL/bt+LfS57ytxcNN4U2NoxD3YAWDVDjNHYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/YNX1aPE/SVwRFw3fNROIhW8+05SCoozZhXoa+cbw3k=;
        b=lcpAy2lV4Oyi4kkhkv0rgzTLvFpvtbZ6+hFwR+psugw1Wn8hARW0MYRjSUXhuJ+v3e
         rhCYL4Zv1Z46QYSPZYlWy7Fv5yXVvHOKJTss63VRC1N99CE914i0gk5lzKXN/JNoj1mj
         SOMnZPsHaeiT798QAx5pv1WF9TwdsIzLJRgoMga+JxbEoWqXmsDct511XotI6ZJI+4lZ
         wimeWFN4hZLGBJWrhiIkh5XanKDhU/I7axGN/I+KSbbtxbhunmkB4aTPxoxhqCMGy+/3
         wxZVhrxu6Io/NGmjj8BFOPJaKqYhUiemoLO6Oi4M7pPiXC5N7jZfiJQ5lJowVxhFFKGm
         Vkng==
X-Gm-Message-State: AA+aEWZy+MtV+0K8xvXmD/Pv3vVkUyUx+j9u1t20WgMdcDUmDnonbXJt
        v6nI3GAzlKwUCxcS4B0KAIWD+E3NTaSMx7RFjCeREg==
X-Google-Smtp-Source: AFSGD/WxaBqpxmjeaIE/9a6dQ4gHFvwQRb4EPq5Y+mprubdQCWeAsbMER2Twzz3vSQ4B7LolaFIf0cvzR4tysMQFyvw=
X-Received: by 2002:a2e:9e03:: with SMTP id e3-v6mr13041027ljk.4.1543091901638;
 Sat, 24 Nov 2018 12:38:21 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-2-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-2-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:38:09 +0100
Message-ID: <CACRpkda9HhODvWgsUb_ErFVpJ_o3frp-xz_Syvzh0yJRw8US8g@mail.gmail.com>
Subject: Re: [PATCH 1/9] drm: replace "drm_gem_object_unreference_unlocked"
 function with "*put_unlocked"
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

> This patch unifies the naming of DRM functions for reference counting as
> requested on Documentation/gpu/todo.rst
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

This is already fixed in drm-misc-next as it happens:

commit a0d4d42cb5854400baa47bf63d9aae65fa9f484e
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 26 13:36:23 2018 +0200

    drm/bochs: Replace drm_commit a0d4d42cb5854400baa47bf63d9aae65fa9f484e
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Wed Sep 26 13:36:23 2018 +0200

    drm/bochs: Replace drm_gem_object_unreference_unlocked with put function

    This patch unifies the naming of DRM functions for reference counting
    of struct drm_gem_object. The resulting code is more aligned with the
    rest of the Linux kernel interfaces.

    v2:
            * rebase onto fbdev rework

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Link: http://patchwork.freedesktop.org/patch/msgid/20180926113623.22679-1-tzimmermann@suse.de
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
gem_object_unreference_unlocked with put function

    This patch unifies the naming of DRM functions for reference counting
    of struct drm_gem_object. The resulting code is more aligned with the
    rest of the Linux kernel interfaces.

    v2:
            * rebase onto fbdev rework

    Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
    Link: http://patchwork.freedesktop.org/patch/msgid/20180926113623.22679-1-tzimmermann@suse.de
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Going on to try and apply the rest.

Yours,
Linus Walleij
