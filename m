Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5162AC433DB
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 00:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C2DD64E33
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 00:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbhCKAIE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Mar 2021 19:08:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbhCKAHz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Mar 2021 19:07:55 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09888C061761
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 16:07:54 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v9so36713760lfa.1
        for <linux-doc@vger.kernel.org>; Wed, 10 Mar 2021 16:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgq4Y5PHhYdVA57Cks4DEvoLb2HPLnl2GjvjQyQnhTE=;
        b=BJAs+tLZlJi11RsuQGLvzja6T+eulKzxor3UQfPfxutgav9ImPpdFrWrSDP9yKsl19
         CexOX3SackIZzgCPwC1QJVVO4agnzUBfiz2YcfW3X+Cpf5UJkNZm3AXKJ+IM+ywtdCDQ
         Vz+XpPv93qc/UVOsqTQGOi4pTmWzXAdyx3s2omaCbkCBKIqR3tZyDZtJw+99zLh8gwjG
         5qREnabnzZFLMnYmaP1/nTWAE+/ixA6REu8T69DBNI8lB2SVoVrXVnFL0JFsBObaDhlx
         ndm3ARMdXji28awuXA7o0K4H6H5J4Q67WH5JQgIotEziPVv4Dgbq63bLgC+eBgrrsjhh
         hMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgq4Y5PHhYdVA57Cks4DEvoLb2HPLnl2GjvjQyQnhTE=;
        b=Wpow7tIKMdlkNOaLVwA6N2FAvr2//J5lmGV592VLRY4IxcH9k2/eTE1Ukluj3oOY4u
         CgbkUBEbiSjclAFq7jIwTelMgPiQGPcVmo24zkgkFm/Y1nRjaBox9W0Hqay3RQuLhrkr
         WKs121WUzuU1G5StuO9226xt9vV2ZRj5tQvaflHdcmd/c4TtT2qkeD/b9YxJPNCo9rQA
         ViPJD5sq7pwBEClgs22OSIdzWA+Mu2bXmX3ewgBHtkA4DfOJq0cIv/3fQdvHMAbgUcKp
         TrL/kJsj32oHlZdY7BawER3zUvr57rDfPPFtvFo5N7bwE2ondWOzKig/P3Gc/4GMmNLZ
         Jp4A==
X-Gm-Message-State: AOAM533iiE2QfG4659DHTeAryzkGF2dEmkBnORREdbLzL0cHJ3ZGhoWC
        /wt4odLnpLrDvwd2YiLlvyUGpGH0xOIseFq9HZPyrQ==
X-Google-Smtp-Source: ABdhPJwUappJtdm8yRMVifYLvbx0dllat4gXBrBmitf8oYZjjQAAkBgV6Ie6yTsSfetKd2qgPAzfg549AzQnJ2grqTA=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr579121lfa.157.1615421273415;
 Wed, 10 Mar 2021 16:07:53 -0800 (PST)
MIME-Version: 1.0
References: <20210309205921.15992-1-brgl@bgdev.pl> <20210309205921.15992-9-brgl@bgdev.pl>
In-Reply-To: <20210309205921.15992-9-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 01:07:42 +0100
Message-ID: <CACRpkdbdRrcTfhzvAMbBxyrvUQMJfc3FWJhgtLLGH1+W796Dgw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] gpio: sim: new testing module
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 9, 2021 at 9:59 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Implement a new, modern GPIO testing module controlled by configfs
> attributes instead of module parameters. The goal of this driver is
> to provide a replacement for gpio-mockup that will be easily extensible
> with new features and doesn't require reloading the module to change
> the setup.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This looks really useful and helpful and clean to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
