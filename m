Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A97C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9492B60FE7
	for <linux-doc@archiver.kernel.org>; Sun, 24 Oct 2021 21:52:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhJXVym (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Oct 2021 17:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhJXVyl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Oct 2021 17:54:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB362C061745
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:52:19 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 65so4215371ljf.9
        for <linux-doc@vger.kernel.org>; Sun, 24 Oct 2021 14:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mEeaHd0IcNG+7aCaWbjqzJJvJQUWN+U/Ob03IWJaHww=;
        b=gB5proZrcJG3GWxyOXsXf6zMz4zQq8gBuaFe1f5Z7z6mmHuqslI0vlMOqjo1p1Hp4i
         3lt/dK7ARAK39ztLycaaLP8AwYu04C4p6Ijlm8c3BqahF943mj8mLU9BSxbdEizdMRg4
         RnP3AbFMp0V70Vj2V27wS9UDTvgRtVPJyV6G5uJnBmkV3t4vq6q2POiXY+vTEelfTtPN
         o6DnKYx0FpLBn/F+68OohGcFjuEyxKZGUfnPTIE+KXitqdvUuRj0BoaulnpopmrytnuA
         O2MSMyO95QBjiPUGRcoeTVGDRp6ivSWcX9T21kkNs23I27SkQwXsqZuQzFb448aue2wd
         D4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mEeaHd0IcNG+7aCaWbjqzJJvJQUWN+U/Ob03IWJaHww=;
        b=V08pDlhgfZ6uSzSxRqDhYq2+PpYbG3PhlAp6+U8BRVdTFkbFiCdSIYCiQOYkIc94uJ
         rZasgUfLL0+YShW1oyLPfi9otBPDbOW+WKxN+Bg18J8xRytlE0eE8mG6abgFPJcHLQNs
         evo9XjiO+5Fb9no7v3ZnGlmCs47HTHyFFGgUso1vENrWTKjFSiZr/fNUIXutVGz7bpLt
         zKmxCPOV/kMMU9L6d6yb3JjV8ceLgsUV7BcOTomRyz2DApbOz0qPVYmNzlYMvU43cipX
         SNScag7EujQZlGnVSRXdk9+mScK97cWPunW5tAtlQPTFDIXQqrG+yHZVHguaeHtrM5YG
         haaA==
X-Gm-Message-State: AOAM5302JeCoUeCfALsBKvAF+fZ6ie7P6DgnQMWsW4dksqQgaLNsMkoW
        pUyj5uHspfgUfVkZugG2c6ESoyIWcYom/ftEGYZaEdFReBc=
X-Google-Smtp-Source: ABdhPJxWj4JG6ojsCmA78phDPdJwUMKI5WGQKVlaDPHoR+YlYcry8KIcgeGivz9gmoDFSOsNVPFnOr9gDPAXxxwzZ7c=
X-Received: by 2002:a2e:b748:: with SMTP id k8mr15036313ljo.358.1635112338140;
 Sun, 24 Oct 2021 14:52:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634630485.git.mchehab+huawei@kernel.org> <dd52c97597a073a5830ecf115d4a6516eebc6d6a.1634630486.git.mchehab+huawei@kernel.org>
In-Reply-To: <dd52c97597a073a5830ecf115d4a6516eebc6d6a.1634630486.git.mchehab+huawei@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 24 Oct 2021 23:52:07 +0200
Message-ID: <CACRpkdYdN-pkZ+9H_agOW_bKAT=5c6BPZ9LaS8PiVpd4e-CYoQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/23] MAINTAINERS: update gemini.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 19, 2021 at 10:04 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

> Changeset 7da6ebf5f5a5 ("dt-bindings: arm: Convert Gemini boards to YAML")
> renamed: Documentation/devicetree/bindings/arm/gemini.txt
> to: Documentation/devicetree/bindings/arm/gemini.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 7da6ebf5f5a5 ("dt-bindings: arm: Convert Gemini boards to YAML")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It'd be great if Rob or you can apply this patch, I have sent my Gemini
patches upstream already.

Yours,
Linus Walleij
