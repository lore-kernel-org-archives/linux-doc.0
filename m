Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111D4C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jul 2022 16:34:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233362AbiGFQel (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233303AbiGFQek (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jul 2022 12:34:40 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8D0815A39
        for <linux-doc@vger.kernel.org>; Wed,  6 Jul 2022 09:34:39 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id ay16so28066880ejb.6
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 09:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rsmyrhFdA3oRLX5GTtCbo3h/deELHX26ErxA9V5MPxQ=;
        b=TJU8Xl+X3pgKEXzhElDychDhdR1mtS857lUCIMiUJ7UVPUTAfbH22wLlDzFeHUCmUZ
         SqN45egvCiUJRyanpNpkDwnX6D12usmPyEDiHZ5zjR+NEqqnEYKK3EDJ2SqFll0lMv2X
         SDM8GjPbBjmAa49M3+dDATcxnuVZql2wKbTvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rsmyrhFdA3oRLX5GTtCbo3h/deELHX26ErxA9V5MPxQ=;
        b=FKigz5npN/pbIbuKWM8TVzhDZ79WrjtQjHz53eCUpAInIN1VuTxxNSRlfnakDVqWdL
         Kk2FyJQWMMhthEOQs18I4hbhRWjmTwkj631R3WII9/oQ5jVLaDWOWdgxKdCHfFL3PrOx
         LlVnjPpy1vZ2i3uM1jmIOa8/gQoLIo0ZHwTdom8bjukSAKI+jIO/xE3HIXR0vihk6IVh
         b6IGCvKgKPRO5RLvkcd241BKkl5m47WWzU3cy+NUnmk93A4c8WL2tDCazgrQtQ/lzCIP
         bqAEn/pMZDUz4Jeq4MNfj+rbgkgezExTwopqifxlIrsbjvRqII2ML59X03QvEqnCaeWL
         QwUg==
X-Gm-Message-State: AJIora/gO2py4PpVqmQ+zMkHWqnyNEkClNXVpVVQCLjlAK//By8vsvqa
        BiR/ooy8z6V52hDw9xG4QMKBvnLxzv0eXlL0
X-Google-Smtp-Source: AGRyM1v5aQg+OlfSRBlio3qZ6zmDvJU6+cuuoyCkL+3uRUuNmWpH8zS+k7y/v0lFjk5RkSCTibzmjg==
X-Received: by 2002:a17:906:e4c:b0:726:94a0:2701 with SMTP id q12-20020a1709060e4c00b0072694a02701mr39049819eji.360.1657125276665;
        Wed, 06 Jul 2022 09:34:36 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id d25-20020a50fe99000000b004355998ec1asm25639099edt.14.2022.07.06.09.34.35
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 09:34:35 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id o19-20020a05600c4fd300b003a0489f414cso9283998wmq.4
        for <linux-doc@vger.kernel.org>; Wed, 06 Jul 2022 09:34:35 -0700 (PDT)
X-Received: by 2002:a05:600c:2049:b0:3a0:536b:c01b with SMTP id
 p9-20020a05600c204900b003a0536bc01bmr44065555wmg.151.1657125275340; Wed, 06
 Jul 2022 09:34:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1656759988.git.mchehab@kernel.org> <0ae8251f97c642cfd618f2e32eb1e66339e5dfde.1656759989.git.mchehab@kernel.org>
In-Reply-To: <0ae8251f97c642cfd618f2e32eb1e66339e5dfde.1656759989.git.mchehab@kernel.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 6 Jul 2022 09:34:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W7gzG4xSsR3HxOv96ytzyNvT5a1oQnmy4F0BqpCOChOw@mail.gmail.com>
Message-ID: <CAD=FV=W7gzG4xSsR3HxOv96ytzyNvT5a1oQnmy4F0BqpCOChOw@mail.gmail.com>
Subject: Re: [PATCH 11/12] docs: arm: index.rst: add google/chromebook-boot-flow
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Sat, Jul 2, 2022 at 4:07 AM Mauro Carvalho Chehab <mchehab@kernel.org> wrote:
>
> This document was added without placing it at arm book.
>
> Fixes: 59228d3b9060 ("dt-bindings: Document how Chromebooks with depthcharge boot")
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH 00/12] at: https://lore.kernel.org/all/cover.1656759988.git.mchehab@kernel.org/
>
>  Documentation/arm/index.rst | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/arm/index.rst b/Documentation/arm/index.rst
> index 2bda5461a80b..495ada7915e1 100644
> --- a/Documentation/arm/index.rst
> +++ b/Documentation/arm/index.rst
> @@ -31,6 +31,8 @@ SoC-specific documents
>  .. toctree::
>     :maxdepth: 1
>
> +   google/chromebook-boot-flow
> +

Sure, seems reasonable. It's not truly SoC-specific but I guess
there's no better place for it.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
