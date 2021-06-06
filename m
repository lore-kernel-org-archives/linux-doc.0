Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA623C4743E
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 22:50:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C861F6141E
	for <linux-doc@archiver.kernel.org>; Sun,  6 Jun 2021 22:50:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231124AbhFFWwR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 6 Jun 2021 18:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbhFFWwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 6 Jun 2021 18:52:15 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCA6C061766
        for <linux-doc@vger.kernel.org>; Sun,  6 Jun 2021 15:50:25 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p17so22219227lfc.6
        for <linux-doc@vger.kernel.org>; Sun, 06 Jun 2021 15:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+HiD5HhosM/emrEAZdYOI7Gyss6pcG+u5xu0k8IYo/s=;
        b=livSg6TPBfB6EwkqK26GA5esocsahxpk9Ws4GoILwWOPBp2A6PiTejz1uQQnv1Ukbe
         l28jrxgjtvs6ugRUUpaaQITCCGMHzJYg4DS9mUYiS1ZpBFmc/V9iwhkhvAJs6VGeCz9g
         9MRQkZ0EVpBBI9XmBXkr1rk8GnW3srMoAWjO8Q3qiQ0oxaAJj//yWlrhfZ9Jx4Tnsalk
         o4f/TPInvfDSfcT5/7PO2+BPKskOJmI1U6pvlKKLOnEp1XZ+ZmhlhhH73M2K9AIbCfgb
         aNoej8BCXxLFa9E7HhCa1TrHoE0fATpePVUY2k+gLWU+ixKN/6k9LRDESe8Dg6kZLMH2
         t5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+HiD5HhosM/emrEAZdYOI7Gyss6pcG+u5xu0k8IYo/s=;
        b=N5LCdsWMJxGU3Lx6yUEeWcw5cwqyhAfvvnYhu4RYe5acBKIdnsryS38uOGVh4vAR1e
         MhuZt7zZdxKto9jfXr2y9aOUkEfGRbn7wIJUH9IE76w8hFqbR+jMsFY4D3EE9EDMQQ9Q
         clsBXihHPq8dmpvzuVsGrURMgPp4RxeOMxGXeJzwxeJf6FbWfcfzCmxhm7Xh9fFL6MTP
         MW+SIzW/xt/wjIhNcD5z5lfwJ33PDdSQUl6EVsJPRTXb/nABZo7kv0waTPMue9NklEIT
         geMcPjJpligJopQE3ywnf79ZC3tL737XHHABdvQxyj44Pxfp1BFSU720LkOi6XLbpn12
         wi+g==
X-Gm-Message-State: AOAM531myhaZaycORQvj9qvVr8GUyUOPOr+JJqVsymuXXvaRnDXRuQEm
        zczRNLN1DDHkbMj2nfgGV7xKdyXCorv9rXU4b+5W0w==
X-Google-Smtp-Source: ABdhPJxS6LPwuFoRiie241fNnwRDTKf9/sDPiCKNe2Q6490BW6AvfGX/NDaSl1qkxJm0Tmk6frP3noZZ8DSbdR96gNY=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr9665431lfr.649.1623019823537;
 Sun, 06 Jun 2021 15:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622648507.git.mchehab+huawei@kernel.org> <0d437806f3f8d2c930656872be482820ef1c2301.1622648507.git.mchehab+huawei@kernel.org>
In-Reply-To: <0d437806f3f8d2c930656872be482820ef1c2301.1622648507.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 7 Jun 2021 00:50:12 +0200
Message-ID: <CACRpkdYPtOWSLFDDhx-Z5DYO+_JfKGxvuvjYALB8w90=wmkGuA@mail.gmail.com>
Subject: Re: [PATCH 08/12] MAINTAINERS: update faraday,ftrtc010.yaml reference
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

On Wed, Jun 2, 2021 at 5:43 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> renamed: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
> to: Documentation/devicetree/bindings/rtc/faraday,ftrtc010.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 8df65d4adca6 ("dt-bindings: convert rtc/faraday,ftrtc01 to yaml")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
