Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 511877D8A4
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbeKYHpG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:45:06 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36983 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbeKYHpF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:45:05 -0500
Received: by mail-lj1-f194.google.com with SMTP id e5-v6so13281218lja.4
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xPfyQ+7n1YYX7CPsLFiLqlbk/g/+BhVnBee1KeCITsw=;
        b=K+ozAtAkj+cEJPolhQSlJhhOzt1MQp2p7bscWS0hcwJjgnUQ5T70sgxOX1JWaEykUU
         C0xTjrWgPA37PMOoDVz9yBpX747po7o0g7C5GH/8DoLVR3aiA15kgNq202gYCYeAK6S3
         paKpv4AdjF9FyxTV3QmT6VpVpFUsHIzsW+Fa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPfyQ+7n1YYX7CPsLFiLqlbk/g/+BhVnBee1KeCITsw=;
        b=C+raSpejJ0jw6G0qJBucxi+fB+qDOqXTuRdOTys5CYQpJPonqaqMphycPVEsHhbd5s
         079n1d2Zro+LK3N2gWyYFGg1PdLA/mJiBo6GlknD0cJovBjzGr2uiADQWAfYjkw4IVCP
         3pmEduJIkd4sbxhJoLOMYh+OEBmVHQlOhzizM9F593Zz/3uhHmhQ9C4VBlTu+a5RSyiZ
         XcX1SSrHQL2Ch0VSR+caE9kuvPJAHs77hVpVUrebDx0cQWW3rxAuxaYlXqIEu0s91ppw
         Cfv9POlzAcOqIelgK1xAXXI5HyZhdePWYxJUADynefpS3eTe4mXw0Y1FTnl/PGnqU73h
         W6ng==
X-Gm-Message-State: AA+aEWa7aj3HXNPKYdr65foYcPqxrbCJZE37hJTnRL0vyVpFQilC8Fq1
        0YcjYs2w2G6KA86QNBYbxEInNZHIsycfVBZHS2O4jg==
X-Google-Smtp-Source: AFSGD/XA19TvIu5XxzdQPDRN8FU1WiyCel4XONUhvvUw0SPXcY9zAU+ZjL2a3ErzOgI77bC/Kd1UBaLst+S8dKF/BR8=
X-Received: by 2002:a2e:710a:: with SMTP id m10-v6mr12979412ljc.66.1543092947655;
 Sat, 24 Nov 2018 12:55:47 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-8-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-8-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:55:35 +0100
Message-ID: <CACRpkdbj1q8qSR3ffJOki2pcB-rj5-sq2CDdUKUZ0UD=m0_cAQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] drm: remove deprecated "drm_framebuffer_[un]reference"
 functions
To:     greenfoo@gluegarage.com
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>, sean@poorly.run,
        Dave Airlie <airlied@linux.ie>,
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
