Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 749A47D92B
	for <lwn-linux-doc@archive.lwn.net>; Sat, 24 Nov 2018 20:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbeKYHjM (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 25 Nov 2018 02:39:12 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:44309 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbeKYHjK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Nov 2018 02:39:10 -0500
Received: by mail-lj1-f193.google.com with SMTP id k19-v6so13254313lji.11
        for <linux-doc@vger.kernel.org>; Sat, 24 Nov 2018 12:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3/LlKhNyX8sYjUGmXqz5PMOIR/UUsMdV+QLAfbVxSKg=;
        b=KWVsEQPgiF9WSTjQ2Nm96im4eBnZmtgzeu7s9ea+En1ZKm2Ou29Z7K+79PPZ8P7EOk
         opNOGYUmJNu6q0qoU0n3tHI41D69zcYKKGQ4PaPJrWX57qUfmvk4ud7ziTbiWZMX0Yo7
         5pXshWPnu2MmRYbIu5Ar1VgB88lzJdoob9puc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3/LlKhNyX8sYjUGmXqz5PMOIR/UUsMdV+QLAfbVxSKg=;
        b=mazavVBNhRgmhjIi3WenISxmJnE6Jyie41swW8d98VNlvDPo5qv9QT19v1eXlYJjQu
         NpadHE9l3sNZZ1FdvS9yloehcP9hPnX9iW5WGimvGqpqEaI88mOYYCGAcsrWT0MOxP1m
         9R+wMQQmhCjSVWpTIMYBs5BEN2dqZap3fDVVmZZd6z4KycULhwuH1ZDneD2UBnPS8g5B
         5vo9i5z25Wnt+V96TRLD6TefhtrFxa8j/Y+yZoaH5UxQFb15kPO41XEGOrkr0rp6gQmE
         2t1wMTc4LwlHnMcB9bKfpc1+jmTXWkRVsm9BkCpk3iskoqgo50rkFlsGn6/YK/2kxW+w
         WkKA==
X-Gm-Message-State: AA+aEWZ8G5ZZ6D+VQJetk5a/JikdQ7HZfTcX1RY5EtHql8nJuvL58vkd
        Mw4pPL9XXq/jUdxxAUr4sgcwVuNq7nE5NDNkZxH7Vg==
X-Google-Smtp-Source: AFSGD/X38EvdM0w73bY11gLRvQ6Stb/Mpuev32UF0R2mQcw4e2zg5VVqrRnbyATIVbg0qepWmRMh9aUQXTY+vu/GGE0=
X-Received: by 2002:a2e:29d7:: with SMTP id p84-v6mr12898208ljp.12.1543092593428;
 Sat, 24 Nov 2018 12:49:53 -0800 (PST)
MIME-Version: 1.0
References: <20181115221634.22715-1-greenfoo@gluegarage.com> <20181115221634.22715-7-greenfoo@gluegarage.com>
In-Reply-To: <20181115221634.22715-7-greenfoo@gluegarage.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 24 Nov 2018 21:49:38 +0100
Message-ID: <CACRpkdZwHTJCh4cps6+9=5CPyfeZyTQ9kbOnVGakEGAxwOdW2A@mail.gmail.com>
Subject: Re: [PATCH 6/9] drm: remove deprecated "drm_connector_[un]reference" functions
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

> There are no more places where this (deprecated) function is being
> used from, thus it can now be removed.
>
> Signed-off-by: Fernando Ramos <greenfoo@gluegarage.com>

Patch applied collecting Paul's review tag.

Yours,
Linus Walleij
