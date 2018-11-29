Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42D8C7D8BB
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 14:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732735AbeK3BvZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 20:51:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45786 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729915AbeK3BvY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 20:51:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id s5-v6so1949108ljd.12
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 06:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=ZV2007TjFCEWoWuUW9JwZgz6Ylp/zem61BAg5NSbJ30=;
        b=JiPlv86YCFX2a2nL9VMX0CNOqdeKsXAItI9lLN7MNOjKzi1MXVCGV4fxTX6XJR6MUB
         jbAqsirDDJLVHLAt2NhSQnZ66Mz/C0fOEcRdyzaMQKH2JCEuaN13eRB0g9aAW92E4ycy
         0gwDuV+aczfjmz2YmZFn8DfTm6mfFIvW4z4qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=ZV2007TjFCEWoWuUW9JwZgz6Ylp/zem61BAg5NSbJ30=;
        b=LuUlvfm4kuBBV0HZADyZpZxIpRIWSYJBGuFXafuuCBu+gbzcNNZfzNN89Eop9I64hz
         4TczuOnQT5CFRaIplPts0up5A4jaTQqiqjtuMG/TnH/jplv5kdOaSymHOp2oMkmyhdON
         soxOdBgWBRp1T36paX5eNuE8FWidyHJOtqPGLR/u2vt3L0Kzcnucre6ljYVXOFKI32hL
         PLoKzBiP7/Tk+jZGMnSP13cjQcX0D1TNliVgut3ZDPr1iCgHavUkY2S0FjcQzGAgYqFe
         VO3dLa37v3Kev8l3R7WmuoVBPD/556cl4NS2ae6GzAhpoCkvi9CRUEELMT19/qz361hx
         cnjQ==
X-Gm-Message-State: AA+aEWbjUu+c5frDKa4agDko+n9Uarqq2axpa521kUJGN633mNsFZfxP
        SZQLJjBGm/CRcjblv1PEZwxzU7KEjB3OSfOUW+igcw==
X-Google-Smtp-Source: AFSGD/UQ7Jhv0hxPLNJ0fGMUMqJ6VkMJ+WPXc/MQPPE8bhUNP7JH7AmudeXaT9ShbT+hTLx4BuSdN3NMQVKfR4J2wBU=
X-Received: by 2002:a2e:7403:: with SMTP id p3-v6mr1301878ljc.97.1543502746923;
 Thu, 29 Nov 2018 06:45:46 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
 <20181121094233.GN4266@phenom.ffwll.local> <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
 <20181126141241.GM4266@phenom.ffwll.local>
In-Reply-To: <20181126141241.GM4266@phenom.ffwll.local>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Nov 2018 15:45:33 +0100
Message-ID: <CACRpkdYmBSVKBvu=YOV87zWK8WCC+pcn9ux_W4VEYwzRzexQ_A@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
To:     greenfoo@gluegarage.com,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
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

On Mon, Nov 26, 2018 at 3:12 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Sat, Nov 24, 2018 at 10:17:13PM +0100, Linus Walleij wrote:

> > It was especially scary.
> >
> > But I think I managed to apply the patches and push the
> > branch now.
>
> Except when you're racing with someone else you should only see conflicts
> with stuff you've just pushed. Or if someone forgot to fix up their mess.
> What was the conflict?

dim push-branches was complaining that one of the commits was
missing the proper committer sign-off, it was the bottom commit under
mine (IIRC "drm/atomic-helper: WARN if fake_commit->hw_done is not
completed as expected")
and dim update-branches seemed to rebase and fix up my patches
and then everything was fine.

I just felt slightly out of control :D

Yours,
Linus Walleij
