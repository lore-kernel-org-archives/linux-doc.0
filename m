Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A15EC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 10 Aug 2021 12:46:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A9F1606A5
	for <linux-doc@archiver.kernel.org>; Tue, 10 Aug 2021 12:46:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240763AbhHJMqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Aug 2021 08:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240752AbhHJMq1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Aug 2021 08:46:27 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C470C061798
        for <linux-doc@vger.kernel.org>; Tue, 10 Aug 2021 05:46:05 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h17so17530429ljh.13
        for <linux-doc@vger.kernel.org>; Tue, 10 Aug 2021 05:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DHQEcn/L096FZeElaexXhPEBfdCO+soqV1fEHutjPfc=;
        b=pVCY8pXO8WZx60AuIWSpSjnrcNn+QdvfI24iCIcoeKiyqzYL01tnKGNifhcSVirEx5
         7vh/G2qT+6K3GKYp1q7HMmh5N6KlRb3uar6xoKqYDMvgdXnR5HbYktcemK1Y0ShEOqpm
         H+aMr+oDEE/A2vPtYnC3GD2aRu/O2HkQdTuEQ0ywmhtGNPAi6T2ILQkTZ3HwCv/RsJn2
         pOrdSEVptFsrNuQ34mdGGx8cQBvY4eCGerDZUcGMQ9ZpH4GEdgvm1IztsvM8Ejf+xnob
         LDGd6Xkt+8WLzcQ91LGk2sW9tFP3+zHZCgfp5fhBvcuxHxtM5z4d7PYhtH9l79yR4vRp
         9V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DHQEcn/L096FZeElaexXhPEBfdCO+soqV1fEHutjPfc=;
        b=H1m3X8AJJQSa8LVr0Ne7FEge+Eqd5uMP+3aCAj4/eoeEh2xFgC5i1YSFPB+5XZNUm8
         MVCTLRu+Ei5H2IB7JmfVsrbrv0ueSiGthjfJ9fAeincvUS2des78QbHC/eQzlZ+cHT0Y
         LnsCPXCL1M5vyARakrgIwWTZvtPR4n4YfRUjqYg9vkwGaFg/08RvP/Xp+c4gpiLazxgO
         pNAQq1BjivOnPm2HU+GdGi+aIjjituxvXmr8zE/NEUUeZzGYt2K/xhtEK5P31ckpMvWA
         FCSsNGm73WZLSBCs6cy72DAY7xg4VmtIR9pmN+DcAMSncetKPca7GA2DYQgC6IAfkFkw
         2mSA==
X-Gm-Message-State: AOAM53265UrsNYCatDgqF4G5rJGyh+8ysD18sF95kdSObSffZRn+H0h5
        qou3Uw8QXnG8AOlkm37ba3Pw8EhbXV4lbc3+rbdaCA==
X-Google-Smtp-Source: ABdhPJx17ikL8rd0Vw6gtWQ3wKu8CkLkaqj4zrGseAsmSHW46dcdTBrLGmh9BIf/ZKcRCwT80y6mnZJMPToeK/DUAjM=
X-Received: by 2002:a2e:b819:: with SMTP id u25mr19278050ljo.438.1628599563886;
 Tue, 10 Aug 2021 05:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210723132810.25728-1-alexandre.torgue@foss.st.com> <20210723132810.25728-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20210723132810.25728-3-alexandre.torgue@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Aug 2021 14:45:52 +0200
Message-ID: <CACRpkdb2Wvr510Oc-cbN4GHaNBoMvnobB6dUJiCMg=vo3SeTMA@mail.gmail.com>
Subject: Re: [PATCH 2/7] pinctrl: stm32: Add STM32MP135 SoC support
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jul 23, 2021 at 3:28 PM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> STM32MP135 SoC embeds 9 GPIO banks of 16 gpios each. Those GPIO
> banks contain same features as STM32MP157 GPIO banks except that
> each GPIO line of the STM32MP135 can be secured.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Patch applied!

Yours,
Linus Walleij
