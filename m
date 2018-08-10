Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 87B717D87A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 10:26:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbeHJMzU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 08:55:20 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:38398 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727236AbeHJMzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 08:55:14 -0400
Received: by mail-it0-f68.google.com with SMTP id v71-v6so1975823itb.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 03:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qiie/80O+NQyatAAf/UTsMok73ZfNfGd8hIkUp1nGs8=;
        b=eKIlYLmPcT98fHUVszGxFYWD8jeldXNS5c1XsgJmEi5XDQ1c14dVzVQuK3rEoDRZ7X
         NykONpmns1VnEsysBccW2m+YJwNRVKScxEA6Lv5acLVdJ6ffTuPKK5OfumNuNErnpaiH
         CJChSRbaU58yh6y1tGcYxcp8IgGAYLAvnFIvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qiie/80O+NQyatAAf/UTsMok73ZfNfGd8hIkUp1nGs8=;
        b=K1GH1Auk5z2bbTxFgYHa8/3juRFVWRMaEfU+28tBke1tk4IXVOuma/J/evHMuc+a1e
         Pi2CQSdffq54Qb4YE8XYYFSxl4UZaZfPzkZUdQhMZbTBQDi3CNPWZyPiLOoZeeW8CEx5
         p5s+CGT013u4vQW50NrZqS+akizA11J6flmJTKacgjc2zFiaNS5ibthp6/GWwrj0Qwfa
         Mor1xeFIPhsudC+ta2rwnuL+RfyTLvgqYwI58H6ckekqE7CTp194tlwZE6vt52D/+iHu
         RKWiKzPIgeUZkXFBYsMc2OCNjZfZzGNpp6K+/4fAI+G6l/2M2fu4a+oNCTBmkKy9uKfH
         F4Jw==
X-Gm-Message-State: AOUpUlGmd2ElZBZsDOeqgPSoZLMs5L/ti/+9Qu9WhhnYzBH7G7E2CUSu
        bpVBt78EO/RLUeQY2qKql3UiyPvDjWpbTBqPGoWhpg==
X-Google-Smtp-Source: AA+uWPxsahDXEw0KDI5CtoBliDTabP/Ul4TC0EomVFLdXuheFw5pvx/9Mfl0+phiblaJLshKLvIxunJpX8DA2y5bbFA=
X-Received: by 2002:a24:2c49:: with SMTP id i70-v6mr1612529iti.135.1533896758189;
 Fri, 10 Aug 2018 03:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com> <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-6-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-6-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Aug 2018 12:25:45 +0200
Message-ID: <CACRpkdagqyuhxtv43UezqcKZvvUbOrHB3Cz9oaHT5X+64WaZQQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/12] mtd: rawnand: ams-delta: use GPIO API for
 data read/write
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

> Don't readw()/writew() data directly from/to GPIO port which is under
> control of gpio-omap driver, use GPIO API instead.
>
> Degrade of performance on Amstrad Delta is completely not acceptable.
>
> The driver should work with any 8+-bit bidirectional GPIO port, not
> only OMAP.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
