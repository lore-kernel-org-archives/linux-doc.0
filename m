Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E5C1D7D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 10:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727477AbeHJMkG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 08:40:06 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:52161 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727258AbeHJMkG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 08:40:06 -0400
Received: by mail-it0-f68.google.com with SMTP id e14-v6so1918441itf.1
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z1XSGgD2g/h71miz+mtYUCYJBOw3XFpuXRf52kOZ7vM=;
        b=ToCURU0avAFZujog3YX3NS/5wlPF8Z1A2ThdeaQlWxcG1XMBjXRcFXOVJK9l9pUqAJ
         aQRff1wmlIpB5BvZZScELO73kORlzn+XIkjlHeR3JA8Xe8/oRSdDxEazJ+LXuD5EVaZu
         igNnVvXJH6E7fTklmT2WxQ9REBTt3DvZlQprA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z1XSGgD2g/h71miz+mtYUCYJBOw3XFpuXRf52kOZ7vM=;
        b=AdetEsxcd+tANA/XUydK4OOqJCLBguR+Jsz1fodCSfDiQ3wDUEtYy3ohDXwEFZSUYc
         hOM6IND54NHIv1k7Eoo0FkrGcgXbqOLyUWsS/ckJICH3vsqIi9N0SD4y4rZhLs0Pn+8/
         az+yxB9ZKGY1wJRfrhgwQRBp4lGH1yCH+jnX7twdLKXGisNk11Jy7ZjejV3UxClku/t1
         XDbUEuQts9P3Q6HasGECKkts6L6DghXENSNh2XLn7sZn1K7wpzLyQU8Fmf5AUmdpz5w6
         bHT4u0N3niFhSKhk/EP2KODk2YizaZdQ613BceZ9is97RWn+8LYP1uOs5zPaU9esdIkE
         9nMg==
X-Gm-Message-State: AOUpUlE12JwDhelRBJDgH3C0XP4xAl7MpJI5mzEhqhgcEAK7tpdoR3Ze
        bxksWY2ldimyoomfda7QvNr7NnVRl3vonW8mOl7AOg==
X-Google-Smtp-Source: AA+uWPwKsc+VVvT1ZtveGYEMArDQXZ+ddcOFrCDKJk/NAoNxJyDzmQjDkk+EsYFQROGWzoqnAPf2Sd3E3NWDX6V4u1Q=
X-Received: by 2002:a24:5004:: with SMTP id m4-v6mr1558725itb.38.1533895853368;
 Fri, 10 Aug 2018 03:10:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com> <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-4-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-4-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Aug 2018 12:10:41 +0200
Message-ID: <CACRpkdaeVRy9XDptCZcTHLo7gs55uQx=6A9HnoQgRP-qnBCqUw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/12] ARM: OMAP1: ams-delta: Provide GPIO lookup
 table for NAND data port
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Jonathan Corbet <corbet@lwn.net>,
        =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Mark Vasut <marek.vasut@gmail.com>,
        ext Tony Lindgren <tony@atomide.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-mtd@lists.infradead.org, linux-doc@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 7, 2018 at 12:29 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Data port used by Amstrad Delta NAND driver is actually an OMAP MPUIO
> device, already under control of gpio-omap driver.  The NAND driver
> gets access to the port by ioremapping it and performs read/write
> operations.  That is done without any proteciton from other users
> legally manipulating the port pins over GPIO API.
>
> The plan is to convert the driver to access the port over GPIO consumer
> API.  Before that is implemented, the driver can already obtain
> exclusive access to the port by requesting an array of its GPIO
> descriptors.
>
> Add respective entries to the NAND GPIO lookup table.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
