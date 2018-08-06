Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0FAC67E3B8
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 Aug 2018 23:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732458AbeHGBlV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 Aug 2018 21:41:21 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:36410 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732619AbeHGBlV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Aug 2018 21:41:21 -0400
Received: by mail-it0-f68.google.com with SMTP id p81-v6so20618824itp.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Aug 2018 16:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6QSii7YSnx8NPOsJMR5ybdW/HjUJ46dLVnPRZOr+9T0=;
        b=c6rmcwB0f7fzQ1kCSjxQ+xhAqv+nu8uyasX2xk6eFrb2nbE8nyxOXSEKQUP4IplZo4
         /+snH+4hTB0KkSxA+1zOW0dLWL2Y1JEwb6/Pzl/BmF/vBoiFZuFH1Aulduyi6H4sbgIZ
         ZexdIiPDAWnn3mOobsUjMyt6r6AhkXWZKzPfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6QSii7YSnx8NPOsJMR5ybdW/HjUJ46dLVnPRZOr+9T0=;
        b=YAqs/Xg98CzuxNFH0LDI7VJH63kIbiH7j/UnAkzWL/IYNbAo+ggQmJY0KfjucbeQJv
         EI2LSAaPdd7MOe2oNt7PbkV/tEIKRrmQceuKEwJi9ti76Xc34XzNcU0XisyqGjT854P9
         wMfpMQQYoup9aT7hbn2ZWLb4W3jrpHIFyaIT5SC9EdlHfrrBT5VPPh99QJUzSLEA8+fI
         0wzVhdvaBw6gCWESR/BOnvJUrZKwerYtgtO/7KCycsvQyOy9Yx51NJbC9cg5naz1uTpC
         1QeWuRj9kle+BjO1OkDjXXM83CD9O8qXwi0OQqk3zVA0ZOx1hhQEF0WvrCw3NlReTduv
         covw==
X-Gm-Message-State: AOUpUlHqzOhjILk6wiY8amoJvbXf8bf841UGapLrBEmVW/WEcaPw9Pga
        5IBYr8ndPMWOL09R4OEDPcbWXprt1rbod7YvIAF+AQ==
X-Google-Smtp-Source: AAOMgpd6N773qynu0ZhlAHUh0ceANRmiVsu8oyyi3KMWgTki09J4cWW5NDDPJ79TGlNZoKaRxvxoYp0zSHT1tJZC/pc=
X-Received: by 2002:a02:5916:: with SMTP id p22-v6mr3596365jab.113.1533598196155;
 Mon, 06 Aug 2018 16:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com> <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-10-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-10-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Aug 2018 01:29:43 +0200
Message-ID: <CACRpkdZtuU6zXBz6UqprE7-31vW9-1ZabFjyzHBgWaTgmqkbbQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/12] gpiolib: Identify GPIO descriptor arrays
 with direct mapping
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

Hi Janusz!

On Tue, Aug 7, 2018 at 12:29 AM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

> Certain GPIO array lookup results may map directly to GPIO pins of a
> single GPIO chip in hardware order.  If that condition is recognized
> and handled efficiently, significant performance gain of get/set array
> functions may be possible.
>
> While processing a request for an array of GPIO descriptors, verify if
> the descriptors just collected represent consecutive pins of a single
> GPIO chip.  Pass that information with the array to the caller so it
> can benefit from enhanced performance as soon as bitmap based get/set
> array functions which can make efficient use of that are available.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
(...)
>  This function returns a struct gpio_descs which contains an array of
> -descriptors::
> +descriptors.  It may also contain a valid descriptor of a single GPIO chip in
> +case the array strictly matches pin hardware layout of the chip::
>
>         struct gpio_descs {
>                 unsigned int ndescs;
>                 struct gpio_desc *desc[];
> +               struct gpio_chip *chip;

This must be motivated: if the only purpose is to indicate to the consumer that
all GPIOs are on the same chip, why not just have a

bool all_on_same_chip;

That you set to true if these are all on the same chip?

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
