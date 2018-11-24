Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E53707D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726226AbeKYHdk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:33:40 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:39651 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbeKYHdk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:33:40 -0500
Received: by mail-lf1-f67.google.com with SMTP id n18so10840199lfh.6
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aoh/llfN+DP1BphaBbtZ9lMq228Eqfq+oVKAM5tJwj4=;
        b=HsAMo3emE8VtaiHj54uLcvqGv97nQd56MJNoU6kpCasCt5g3POEdVPn6gShPM4zvb8
         uVG/hMag2kMKK7LMpyJWLp+EqBBX/S6eeKLrT9k3OXfHXi3Q7EfAatNz+Ep/y/lLmyVY
         PtLKofkFEPrh99GUUkHinDsJIrnTuZQurdGxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aoh/llfN+DP1BphaBbtZ9lMq228Eqfq+oVKAM5tJwj4=;
        b=f0buOgvKF3qKNLYhGc7pkuiIK4mewSbgOr6HGedwoWBphc/viKQV25s2UIljtAVqMu
         qjUsXfWHm9UmJJ43CmW8Amow6mUbfayJnumyTRu0MAiiUUcTzAJvMS9rjOXhz7GzV0Je
         NFvU4dRCneMVychkxXwMJu2NWZi+WJRcqgpPneDvnHKOl3Nf413k+Y5daobzxkqrYG+K
         usfRxD0SNZ05EsDHL7ufYVHfL/kf2CturArw4raEpYzqZlVBHWL6wJQCF0Z8ITyMvXmS
         yQDBOTGrHPox8/SsXG79QSYSiL7NBH2iv3HYXN+M82LPa5HqDHBEoQH58g7ShpeysJxc
         /d9Q==
X-Gm-Message-State: AGRZ1gIow+crVJY9uJFLbm5abSoM3/lKW9fUHd7vIHvDG1OefWu68Dzc
        /OiFwdIYur3NDn57DmgxwC2looKjhBxIjggS1a9a2A==
X-Google-Smtp-Source: AJdET5fPIIwJknb41JYU5KBaOcyMz5QZesu/TkkV9W+nZmDtft5Q3XixWbZ0ZkKxXT3xifbncpYGhzYmEDd0rq/T5Gw=
X-Received: by 2002:a19:c801:: with SMTP id y1mr11885559lff.53.1543092263785;
 Sat, 24 Nov 2018 12:44:23 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <20181115221634.22715-4-greenfoo@gluegarage.com> <1542363310.23489.22.camel@pengutronix.de>
 <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
In-Reply-To: <1542387884.1134874.1579436592.07F916C5@webmail.messagingengine.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:44:11 +0100
Message-ID: <CACRpkda1FJOzBn42=7GgExA3fdNJabc_=JUba4y7k34uy9tsKA@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with "drm_dev_put"
To:     greenfoo@gluegarage.com
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Haneen Mohammed <hamohammed.sa@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Gilles Muller <Gilles.Muller@lip6.fr>,
        Dave Airlie <airlied@linux.ie>,
        virtualization@lists.linux-foundation.org,
        Gerd Hoffmann <kraxel@redhat.com>, cocci@systeme.lip6.fr,
        Marek Vasut <marex@denx.de>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, abrodkin@synopsys.com,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        linux+etnaviv@armlinux.org.uk,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Nicolas Palix <nicolas.palix@imag.fr>,
        etnaviv@lists.freedesktop.org, Julia Lawall <Julia.Lawall@lip6.fr>,
        sean@poorly.run, Linux ARM <linux-arm-kernel@lists.infradead.org>,
        michal.lkml@markovi.net,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kieran.bingham+renesas@ideasonboard.com,
        Shawn Guo <shawnguo@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 16, 2018 at 6:04 PM Fernando <greenfoo@gluegarage.com> wrote:

> I'm new on this, how should I proceed? Should I create a new (V2) patch series with
> these changes reverted? Or will the maintainer automatically take care
> of this when merging?

I fixed it :) I think. At least I hope I didn't do something bad.

Yours,
Linus Walleij
