Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A71C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:53:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6857460FE7
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:53:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbhJXV4F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Oct 2021 17:56:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJXV4E (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 17:56:04 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42236C061745
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:53:43 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g8so6653406ljn.4
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XTUIqto/oxCHUKEctW3fxwyrTpyEEyiqeWbHydY//aY=;
        b=rPomx7SGz7pofYeRDGLqDkcQRSZlQbdpBhMMrKQWf5IrCOVLV6wGd9MMUK5rxk8H65
         eMJbMl098dYYF5dFimnOC9XGelOmpfE9WkoNyIHOCVmFoVag72GWBlr5cFHneYY9HLSu
         ckdKi5JSuavVPV5MQI2GMijZdnB1JgOgMgZSCwTpycbXJnxiQ402WcOU3OSSCGBBg4qW
         mc2LzkOvduj85x5KxYrCoY6PE3J1XhEmEi5JKHAv/0uwMqIAKO9G7pYn1vfZYecRUY3X
         DHpDG5PFFL4iEQzShwAeffP3Epz7vD38JhLDw+jSI372kFcEVZrxJnaKndHbi7OGPk8j
         yZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XTUIqto/oxCHUKEctW3fxwyrTpyEEyiqeWbHydY//aY=;
        b=wbOCEoln4+GQG7RAu7Y8/JOR8GO1icWoRDgOeYY97S1IQoIxwKcJXA836CnCPzTa5q
         MpN9Gu5ABehuS5p9SxXwNPXWwI1tf4EvGGWcrba6rTiDdKadzgvqGXPO2BiMhCasqVK3
         l8JjK9Hztm8p4+IZYmPiqFKBw47Bo0FDPVaEHO1GCswsmZXt1QhLnB7p8Z6zr2vXTeYi
         J9+THkAbOLLxrJvJzmGbWLLLzLdpDcsv22qjRw4aoNrVg0sdSjw8N+YVtz6DwKy1zV2L
         gtLmzI/OoVv+K+yIvAP/UFaYF/SHs/fqqPUZzA3KwYeqXGfa4oO5bC14in6GGXLckjIR
         E3PQ==
X-Gm-Message-State: AOAM530NW+5xjN7NEqsFznghHNMvL+aaAXMJIK+J0YCWc9skYtnRxY9S
        FQROaRVMsH34o9+PJpsIYYQxNw1SO6RNla8MZj7Owg==
X-Google-Smtp-Source: ABdhPJzEiyGNQYYwxf6GSF8eoY/NkxKZS5lTOKOd6kRvE1b3p3ngJbGT3Kl1pCfiIERJpHBFhh9yeI8E2RrphqMSBuw=
X-Received: by 2002:a05:651c:a05:: with SMTP id k5mr14869914ljq.288.1635112421650;
 Sun, 24 Oct 2021 14:53:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <56737d183299294c840c8308c1427c3385d88a1e.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <56737d183299294c840c8308c1427c3385d88a1e.1634630486.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:53:30 +0200
Message-ID: <CACRpkdb3Qz4KUrniinYSgQYKH-ueMB60o9KWChmbPOg-5gk+JA@mail.gmail.com>
Subject: Re: [PATCH v3 06/23] MAINTAINERS: update faraday,ftrtc010.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> renamed: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> to: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
