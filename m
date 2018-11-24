Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 329407D8A4
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 21:17:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbeKYIGq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 03:06:46 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:35715 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbeKYIGq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 03:06:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id x85-v6so13325041ljb.2
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 13:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=LFoDMHZQz8UBWaJLXzIWV8IXutyISCt0Xum8q759EGs=;
        b=FV66h96nOuhPRcswvE33wNkp9sWMVqWLcX8T8M6Q87Zv66u+/V0tiwzmkQLMf7oQJn
         /8opov9c44wHuR8vHnmngX+vW5d9j4tRlBVaDAO64yB+sXpoEN/GzpKoyDIC0dcK3jSf
         c0GI0SNiuyVetgqEew7VpXJvxZu3j8GGCwh0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=LFoDMHZQz8UBWaJLXzIWV8IXutyISCt0Xum8q759EGs=;
        b=WotWaZ2Fw+dYpOV9Z7//V4yyt2CyP4mYpqWOmLgYdygnHzA9UdYSpK6bIHchQyDrE9
         ETKQ8+6YiOevHd1zA8c5vzmcvdzhrr0fxZVG9tT7Baujxy/iSs47+HBwT17fSaMiXL/l
         nhKAV1nulkZTHlQn5I30LpRJDXIAgr1P1+WNJO0iucQ8MqOOjLD++I+7O0eKINxicOz+
         /XwJrHcFmNeSY8V5/p0SzXxAVfKDrSNffKAIu/6q6A9UTiHQra3h5UmpkgbkzBS+vpI+
         8g+r3BL0Op9dktIZ8t+wokdtECkDlAmjhqaEfrKmwVkNmeOrPKg1qOnvVqpWXbONmwtx
         j7BQ==
X-Gm-Message-State: AA+aEWbs2LfVljn+iUB4578KybW/fdzObuRizkihRdQAb1J5+ase3yXj
        K4rb2As5y7lYqw7dAPNIu+DO6bTVq+c0iQpvqdDzVg==
X-Google-Smtp-Source: AJdET5dBN60eGZw4aZBnUaOtrwGI8Lx40LRymSPRBcxwlYWJxaFKw3ZoWCG2GtfVkWkwNbhaZle6s1TnZhJ89YN1f7o=
X-Received: by 2002:a2e:9107:: with SMTP id m7-v6mr13103518ljg.23.1543094245529;
 Sat, 24 Nov 2018 13:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
 <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com> <20181121094233.GN4266@phenom.ffwll.local>
In-Reply-To: <20181121094233.GN4266@phenom.ffwll.local>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 22:17:13 +0100
Message-ID: <CACRpkdaXUFwSiQnMqv2WBXr2ytn7kx3CeAuamkj9ZYU1C6bpnw@mail.gmail.com>
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

On Wed, Nov 21, 2018 at 10:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Thu, Nov 15, 2018 at 11:38:35PM +0100, Linus Walleij wrote:
> > On Thu, Nov 15, 2018 at 11:17 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:
> >
> > > One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> > > "switch from reference/unreference to get/put". That's what this patch series is
> > > about.
> >
> > The series:
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
> Since your reviewed it all, and there's a pile of acks for the driver
> parts too: Want to go ahead and apply it too?

OK I did... the git was quirky, patches changes around
under my feet and dim started to complain about problems
with commits that weren't even mine.

It was especially scary.

But I think I managed to apply the patches and push the
branch now.

Yours,
Linus Walleij
