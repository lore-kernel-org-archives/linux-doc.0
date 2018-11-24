Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A15E67D089
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:58:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbeKYHrt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:47:49 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40110 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726241AbeKYHrt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:47:49 -0500
Received: by mail-lj1-f193.google.com with SMTP id n18-v6so13287012lji.7
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G8aC00oI6Bq6NmQvXgGD7tu98VEEn1Ah4XoyIl86u1E=;
        b=cQYQ9fUjLcnFZGp+CYKwGs2RGLCSTBzErnbBytyqqI295ygJrfkngmYkfCekntnSYa
         +CKi99FfTbT2Zmuesk774/u2Vh5oBA53QYje+uiJasVLrLyRn/yVyPXJmE4m40gYkY/h
         az+d3cvK7ST0NXZFseURt+O3Crmskno2XG5G8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G8aC00oI6Bq6NmQvXgGD7tu98VEEn1Ah4XoyIl86u1E=;
        b=ODTRRFK8xUa2ihp3WuRdS5TTfvMLU5SFowg0AHe8eWhqT5m+CQ0LhAk0Gn+Rnq3cMz
         LtMO/JiUONakmYuXwsZR3UgIG6Fam4DJY9axn1Zumv/A08lgJIJqWPG+k/YQjWBQ8U0d
         T/EGDpa2XQ6DNai6Y0IqHsisXyXeTY2Dy+Srw0VGgZlYm2N6jT/glOASMzqDgWm2z4iI
         a32FhS9hLKjLZFSLcy1Ozi5NNFpU38775s5Wl1rDf3WGBmwSbQ+4yVrK5rcwDG4qcna+
         RHSvu5aeIrZto54A5Rd2NHD6zx/qZhHzYc9YBTICvVq2ItFydLhnTeMx8wJ1RbyEYmNw
         N6/Q==
X-Gm-Message-State: AA+aEWYh44+/LOLEt9G7BxmmzwUyeXxuNPUZHOgINWU9CX5Yj9iCST6l
        rNzVlhthkipoMT5UMGslDw/5c94gsZP3vjGOCHkDtw==
X-Google-Smtp-Source: AFSGD/VkmdUXbCdaOYBUoRQujU4xjke7bxhIGNQAN0RyPQCApFI4hBRgV0wE7Aupt+4+CQrN/HUfWq3W5PGgyNs7Y1c=
X-Received: by 2002:a2e:29d7:: with SMTP id p84-v6mr12907970ljp.12.1543093111035;
 Sat, 24 Nov 2018 12:58:31 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-9-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-9-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:58:19 +0100
Message-ID: <CACRpkdZs+jk-KY7kUnRz8EoSrGN74i2fiXwp8BNuSG6JNxgixw@mail.gmail.com>
Subject: Re: [PATCH 8/9] drm: remove no longer needed drm-get-put coccinelle script
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

On Thu, Nov 15, 2018 at 11:18 PM Fernando Ramos <greenfoo@gluegarage.com> wrote:

> The coccinelle script was used to rename some (deprecated) functions
> which no longer exist now.
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Patch applied with Julia's ACK.

Yours,
Linus Walleij
