Return-Path: <SRS0=6TNM=5M=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38D7EC2D0E8
	for <linux-doc@archiver.kernel.org>; Fri, 27 Mar 2020 19:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 072D22073B
	for <linux-doc@archiver.kernel.org>; Fri, 27 Mar 2020 19:26:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IGaP7Mdp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727593AbgC0T0N (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Mar 2020 15:26:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37998 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726738AbgC0T0N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Mar 2020 15:26:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id c5so8840455lfp.5
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2020 12:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xyt/WUa2OD/knVIi601SFgcT1l0Zvp/CDfO2pM2aN4k=;
        b=IGaP7Mdp93QPDuqZ2364as99CykHs3PJ4uYKf6kPp4MEHCRvpSlBKK1Qz4NqpXAC6F
         jcs/JXuF1nLBhdGF1Gfkw12gMzmJM5qi8Hew8wMHVHPFn7QhLflUWGX6h8S1zZUgwGyT
         ZwdedZA3Dn3uw31OdZWSCHUvQ9C5JfKBWJ6IESHexoyfrt48U76swLir1qWsNWYgDKBz
         Umrm5nAGV4JXf72ChFK+JRjPexOHxC/o9E2BcsUkz3OS2rD419n45AlPLeHu98S305n6
         Vn9s3lQwR9CuCC+WQNGKtunP3nNeRTSmrM3aVOkwU64nC9v2VXIkLhIGnMW6fzq+KY+T
         k/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xyt/WUa2OD/knVIi601SFgcT1l0Zvp/CDfO2pM2aN4k=;
        b=XCoS2+JtQ8FxiBRz9bukEexXkV/iEw+nokd1UuLsPxD5XHBDgJKHbXmVYcUzEcfi3v
         8XcfVRTR+hAuAfHip8iTqpEdtwvvyPlOCpeV5G5jfyi50zneQST9Wy07+Rpi7vQuV/R0
         Ty64ULyptA7ME55GWFXbGg9Clm6taL7ymLikMRh7TWwOmPXsQP4CS8JCxUS9TUSTu/db
         f2D6K5PXIh0VZNzLRhn8eyk+Y5iQ8Pn6Ac4CYJGLU8BUADTuMDngzlAS/LhnUyiS8tKy
         JEb3EjFlDzftzzMQN5NYiN0MuIJfTaeWlrUuWvPdmlTJBl7vQlf8ByJN/pmctwxazbI9
         bDcw==
X-Gm-Message-State: AGi0PuZ+5lNy2FtrTIGSpvvz7rtmBJuhnGXdeFIloJoD2HOXqCR19h6J
        5X3xZ+kCeycRtSBHudLQ9RMq7RPoteY9iySKCDgo3w==
X-Google-Smtp-Source: APiQypIDOmD/wk2tYVESxm4bIRP7LjM723EaFL/9IRPRsGvMcf3ygcQJnmmosTirkk89eivLqwScLbnLWxa4ztRvg0Y=
X-Received: by 2002:a19:ac8:: with SMTP id 191mr518366lfk.77.1585337170911;
 Fri, 27 Mar 2020 12:26:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584456635.git.mchehab+huawei@kernel.org> <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
In-Reply-To: <51197e3568f073e22c280f0584bfa20b44436708.1584456635.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Mar 2020 20:25:59 +0100
Message-ID: <CACRpkdY4_fEbsgX9vRHd5_8Z-1MbBDd3y-pVsTit4bDLW6VpoQ@mail.gmail.com>
Subject: Re: [PATCH 12/17] gpio: gpiolib.c: fix a doc warning
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 17, 2020 at 3:54 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Use a different markup for the ERR_PTR, as %FOO doesn't work
> if there are parenthesis. So, use, instead:
>
>         ``ERR_PTR(-EINVAL)``
>
> This fixes the following warning:
>
>         ./drivers/gpio/gpiolib.c:139: WARNING: Inline literal start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Patch applied.

Yours,
Linus Walleij
