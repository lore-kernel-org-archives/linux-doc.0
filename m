Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CC3BC6FA83
	for <linux-doc@archiver.kernel.org>; Tue,  6 Sep 2022 13:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233252AbiIFNuM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 09:50:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239470AbiIFNta (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 09:49:30 -0400
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 239122AE3C
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 06:39:50 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id dc5so3498682ejb.9
        for <linux-doc@vger.kernel.org>; Tue, 06 Sep 2022 06:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=uFWPwn2VJziZW+HA6LrWm6uAZxZ7AAkEK+UCYwcfecyhrX9wQrNd/SDpgXe8m+z3t7
         6UE+A2LZsW+SBWLdVl2r+y1ZFFXIVLFNFRKNgEQ0JLL2NxAp7a30aAGR8OMnqyLAm4qH
         W3eAwkNqm8F0ORnU4nr7hDmsofLT3FJhb/PnrJpUi1uK+6ChvLyvUJXrFADB6z+Q/aNp
         DgpMcpeLzPiNU9nAngfPmEeB/PAtgeMRB1woWEuVEoiLZ9IfKNmGyMfOvBnOrBqkMWQm
         LnwF3ih3RiCFHEe2WFA909cUQrao9AUGlFUucUpF9nYSgXetwgU2g7g6LRAU2CfoGAzC
         tZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8j3iu7+QNQJ23oh0RvmPe+tMoX9hlrqhQYHAMxRoxm4=;
        b=dSRXKE2s2rNOVLvrJbiOyJsryYFWfrtJ/tXdroT6wgunM3YPTTCVG8/BJrZEoJg2c0
         WiYMCRJoNC77v5n07HIOWT3W1TFggvpQeQ67L77yXfpUCvpwvtP/8wJFbQoanjJpQ+SP
         S9pUfXbbUg+dyYTuPnTwyRXLpHLhFo8pwx/ybEmVzqXGPBBbpNGhjjaBlJVtNO0bqY00
         d3FLD5KLnbhxEXDjy8UvQ6Mc88CNkGAtya2pSol48uyMQtdnTc4Xp3vwgWHgx8owlGo5
         KiO0zbeK1yjWHlmQErepk/Ex6wuGK9tQ91zeP5HxMo55pxRnOUkztz5+2FrpTLFK5z8e
         60Yw==
X-Gm-Message-State: ACgBeo0K9gBV+Pm/ExTGyaC5Wu0dDCOn1M8QtHfUevWHpWTIp4lzVR4g
        1FR45brGoFkRrM5+K+iqTLdhZBhGj64bq85ZwaCh2g==
X-Google-Smtp-Source: AA6agR5bt19KIJibKb5OfdrwikN7TmkyTEX14efObQx8H0Svbutp2QjRsBLKvv9UqMC3h2dRJxI/ygCQvsNdpS4WJA4=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr39902857ejc.440.1662471500115; Tue, 06
 Sep 2022 06:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
In-Reply-To: <YxdInl2qzQWM+3bs@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 6 Sep 2022 15:38:08 +0200
Message-ID: <CACRpkdaF9s0Qzxa=dhj0k+xg+F9UEteeUuDuwi9XKwz=cVyuiA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Add Apple Mac System Management Controller GPIOs
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        asahi@lists.linux.dev, Bartosz Golaszewski <brgl@bgdev.pl>,
        devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Jonathan Corbet <corbet@lwn.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-gpio@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Rob Herring <robh+dt@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Peter <sven@svenpeter.dev>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 6, 2022 at 3:18 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

> This series adds support for the Apple Mac GPIO driver. These GPIOs
> are hadled via the System Management Controller.
>
> The first two patches add the DT binding documentation for the new
> drivers. No changes from the first posting (I think there's still
> some discussion going on about how best to handle these.)

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I'm happy with this, and it will be possible to augment
easily for future needs.

Yours,
Linus Walleij
