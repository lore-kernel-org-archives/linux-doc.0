Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 440BA7D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:44:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbeKYHeK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:34:10 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42063 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbeKYHeK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:34:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id l15-v6so13271366lja.9
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:44:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qu0Q5lsKovpLa36mEqIQaw/+EGL0gmOyRCZniPWwu6M=;
        b=QenR8MCMVtjsl4odRclGgCfzFk+bgahZWO9gHDejGQ6RSHp5kP9ebUelnqzjOuwrv+
         K4ABrCfL7gsgsSNL215x6f5nCHYw8YWZtKnv38Bo4dBo4GqUVTkdjdo+lHPrQ2v+IgIc
         ta5+0qnTO9lXcx5R6U4IyWePf1pLEPUI2NZMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qu0Q5lsKovpLa36mEqIQaw/+EGL0gmOyRCZniPWwu6M=;
        b=ou4Jfh1rJN60RsZnyJK2oQnyvyce4UgWhPa1DCG23w9eR8HrAWW6aYSdZM96SKRxUq
         cf5D+oN2fxbC8oeStIHLgpFSGtQxOUA2lDxa44e6or0zv8pWM+odzP2dQ9/KqsOYGXgi
         ckCaDxSrN+BYHgl1eV6R6An8a15l3+mCRwqOnvv6hKitCDQYYy7B3/VAySUtSXP4VZ9E
         YAxjG1dqtkn1EOimbSdkJYxUWDuPXMUm9m3TIN4GiTJQrGr6fNxDGGYhy8SH2VQaLZrn
         toWrm9Gtd6A3f5tHlMUmCxddyZnrbQXt+i+V7X146G7YzHZtzVbqWUUM2rxQgwUlMPQT
         yr0w==
X-Gm-Message-State: AA+aEWZLygCxqBnwhckNKRO2ED6I5+Ci5q9jKb8EzuydO1kx38e2wkwV
        cq22jbIDf6iyZF+fDfgVifH0eQ3XwJiA3c00/Dkc1w==
X-Google-Smtp-Source: AFSGD/VEZ6x2QCIsilhaQrORMHhVTCoUS8UhL+kkx0459UvExM0A2qAA/NryzYHLlA1XplXsR00eF/6kPkhjxnR1lx8=
X-Received: by 2002:a2e:9849:: with SMTP id e9-v6mr11681009ljj.9.1543092293964;
 Sat, 24 Nov 2018 12:44:53 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-4-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-4-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:44:41 +0100
Message-ID: <CACRpkdatws8igmhXrEZSi6+ZES+omtWDone8SjpUrN9pohBNGw@mail.gmail.com>
Subject: Re: [PATCH 3/9] drm: replace "drm_dev_unref" function with "drm_dev_put"
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

Patch applied after some collecting ACKs and tweaking.

Yours,
Linus Walleij
