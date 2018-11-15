Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D93D7D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Nov 2018 22:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727647AbeKPIse (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Nov 2018 03:48:34 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:38566 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727374AbeKPIse (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Nov 2018 03:48:34 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19-v6so5860034lja.5
        for <linux-doc@vger.kernel.org>; Thu, 15 Nov 2018 14:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SXqCNsRnQbG4WjKdL9YGXyFWRA6BFn3DdUb1fgQJwjo=;
        b=GDW0BNOiljUFmdnNq/ha2hXUSbIGKgBh7FNi/ONlT2Hf8nnlG89WsxR7JCQRsQuyw4
         Zca0DdFpy8au6Or48w988hwqvp56S0nWl4Udslb/hLjpnOeRyJbRRd3UkTvsBtRJrVuO
         E6H0GCBybFc+Iti7VcRKr5/mbWO68itWLOrpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SXqCNsRnQbG4WjKdL9YGXyFWRA6BFn3DdUb1fgQJwjo=;
        b=N4JQ0WDK2ou0pGMUWgCW985XTh/tsisI/TpkEInZdwMcHRCj4fHeTf4SUbf8dx9j+d
         oHT7wGHCdzD8IH2feJRw5LnAkqx6bffeitTDPFFC2IUMpMQKbxD7ZG/w5Wx6sAOzMw9d
         jiyqrMMdJE8quALHDrb0ZIi5Z4VX/1qsxDNkgdeMNQ3Ik1MmjYyJF1UfXSQZW2kKSM+j
         l0nBw7TbXPtj2h2TCUEy31JRVKVB/m1X7uZW7CbdqahguRCmmuSG57N1Lobai7uz+nci
         N9wLCcugCS1wuIqjPpl9wq2OrRFXCaxyGibRRGUDSbgCzB2gW6v8pfgi5NR/xfesj5L6
         4QsQ==
X-Gm-Message-State: AGRZ1gIandnKC0gTuW8XxkisjunQgfYql6xWapRqV75DFcl4syaPxmVz
        gIZxRJfP3cdT4eOkJgKb3Asa4w66/x1K8kEbC0je6Q==
X-Google-Smtp-Source: AJdET5fH0oQIDoa2/vLV5ZynXR7Yp7rKSkY/M9aVwgiOTxCI1h96LEZQmd2whxVHe+veTtkmej8toGDJXpGpbg4H1wo=
X-Received: by 2002:a2e:9107:: with SMTP id m7-v6mr4605034ljg.23.1542321528348;
 Thu, 15 Nov 2018 14:38:48 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-1-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 15 Nov 2018 23:38:35 +0100
Message-ID: <CACRpkdZmTSo02yQeU=qe9WyJMXEq76CNmc2kkFEHuwdo=HKPJw@mail.gmail.com>
Subject: Re: [PATCH 0/9] drm: remove deprecated functions
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
        hamohammed.sa@gmail.com, linux-doc@vger.kernel.org,
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

> One of the things in the DRM TODO list ("Documentation/gpu/todo.rst") was to
> "switch from reference/unreference to get/put". That's what this patch series is
> about.

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
