Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7D0D87D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 10:11:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbeHJMko (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 08:40:44 -0400
Received: from mail-it0-f68.google.com ([209.85.214.68]:38774 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727445AbeHJMko (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 08:40:44 -0400
Received: by mail-it0-f68.google.com with SMTP id v71-v6so1931959itb.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Aug 2018 03:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u6M0dCfaQXx9iYWMNcClBpv33wj3darPut/Qo5lma94=;
        b=fKCLkJEUmp62n+YLnuySzKOEWwogRuCECbZgnOrmrUlSzD1pK51p37H3Ypta15rWrz
         90VDDbt74U3A+TQEFNiMZNddn7CNqIwXDrcg1+lQrFSM4LH5SdT3V3I0I1kP79G07V7r
         80ZE/KvieoG9MOd/8A8vcEkRyhe6U5xaHhreA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u6M0dCfaQXx9iYWMNcClBpv33wj3darPut/Qo5lma94=;
        b=Ry+J2zR63hE7uW8XN6oU7mNSBj4FTHmc+mjHlzBGE2SHS2bzRDMcyVlbmN0ojGxCSw
         lQsDSDCQr0sjzBoNfJ8d+70VJJbwOUXDHLm4jHj2yShURYpjdeowKFEXF5osqxLvcU7w
         Tdp/S/E4Y48V/2sbtDiTHOhookM4oOebeTdvN8uT9rOvUCYag7TSKKFuWyMX5rKCngrA
         ivZdPaAIHEf0XQSFv6U2Je9JZ+uVEGC0l1iqd9ALUzuHdZEbTij2joM8ih04Xmj91bgt
         vE6bzMSlEYPKKWlp0yAR2aqe4o2AStwKjdifgulQUOglMvOvuaI+dVJSsubNUyYk0ju5
         1X0Q==
X-Gm-Message-State: AOUpUlFdB3XPKdhBVE4eCLvgKhFdid1gAy/hCof7D2QmrT1dEKHgScrd
        SZctJm3/dyylVIxP3+oeH74mrTmNL3wCR+LORoGGvg==
X-Google-Smtp-Source: AA+uWPzMml66Mmlx1kdHa4dMZgsndA6pcwFvBgRkN+rUJcek94uyXKK9vUtymzpHP4crlY2sqLgYf7DU0UJvgnT17ZM=
X-Received: by 2002:a02:6c45:: with SMTP id w66-v6mr5148979jab.87.1533895891792;
 Fri, 10 Aug 2018 03:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <20180718235710.18242-1-jmkrzyszt@gmail.com> <20180806222918.12644-1-jmkrzyszt@gmail.com>
 <20180806222918.12644-5-jmkrzyszt@gmail.com>
In-Reply-To: <20180806222918.12644-5-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 10 Aug 2018 12:11:19 +0200
Message-ID: <CACRpkdZFq3AfH6ehCzMYqwptyfpdd3NLurx3kgj==DmKRASuiA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/12] mtd: rawnand: ams-delta: request data port
 GPIO resource
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

> Data port used by the driver is actually an OMAP MPUIO device, already
> under control of gpio-omap driver.  For that reason we used to not
> request the memory region of the port as that would fail because the
> region is already busy.  Despite that, we are still accessing the port
> by just ioremapping it and performing read/write operations.  Moreover,
> we are doing that without any proteciton from other users legally
> manipulating the port pins over GPIO API.
>
> The plan is to convert the driver to access the port over functions
> exposed by the gpio-omap driver.  Before that happens, already prevent
> from other users accessing the port pins by requesting an array of its
> GPIO descriptors.
>
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
