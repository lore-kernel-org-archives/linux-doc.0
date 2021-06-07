Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FBC47082
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 14:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F39261153
	for <linux-doc@archiver.kernel.org>; Mon,  7 Jun 2021 14:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhFGOSy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Jun 2021 10:18:54 -0400
Received: from mail-yb1-f180.google.com ([209.85.219.180]:40869 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhFGOSx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jun 2021 10:18:53 -0400
Received: by mail-yb1-f180.google.com with SMTP id e10so25191712ybb.7
        for <linux-doc@vger.kernel.org>; Mon, 07 Jun 2021 07:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yuNOwZfNMKgDqyZEslbLVQ4ckoEZsVVYvZ4kkvz7Ayk=;
        b=175Az1+gbdCGPk2q817imWwk0+PcD+/w0zW/awReT4yWlE7aK8YHT/VbFrx0KcraOM
         Uo32NIQzkysX4ZY3k7Br12TjFLXa7IWyzESIPPq63OHdWxgDkHuP/sP10RdLuPZapsyg
         pf8YLCkt8Kxf3U6Xv83/jor79VuO/4RpD/aUs6/H9j5yn+hQPYYwz5lOB3bBk7mD3y5s
         99Ou0rDYhK8lFifPOdkjHlXLNR8/MFEK3sDM+ibRJJkmdDNBCzL9wVcCCfOPqVgk8qIg
         FvlSocmD6sCTtUHAuqEmx0gRo1GI0/QLNY/5sEum/shlqscl3S+wLZI+6YWbcVnZmZyI
         AI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yuNOwZfNMKgDqyZEslbLVQ4ckoEZsVVYvZ4kkvz7Ayk=;
        b=EN0W0tiF04xDOaiyHGmMxIMmUk8m2k2/lzPoxAanIceVSQUjYHb1740wDt6XceHirY
         UIVoh0I8ILgmkWR+3ZnbS+zfEzgq2BFEuLF+Xci1k3896xkI13bTJJjPkwdWT2ZLersP
         W5Ro/v2AM1U3DyM/Mh5sEBaLnaZtLdDlnW3VLgVbEHYlxvfNxWniK8wcPxL72tWHKQ9u
         AM4NmDkIkp2jPbWSOO97+nMvHm8dXxkfynW7jjQWqiWrVpXBVEWvcKeghblEYBmxwhno
         3jBZndxBMVr5cQ2a2XSgBpEGLwdHwJB1/9Du2PIPnMxGcOJUcwETSGl3+SudwGFL81cZ
         zWtA==
X-Gm-Message-State: AOAM533DAXPc607r7OMliemlnzSvKeCdBs3hMc13FVPUyO1KDSqKQDNQ
        h/soTk6S8sb2KeHXjPq7u9enxtxr1pIu2rVPY6TmSIOhLTo=
X-Google-Smtp-Source: ABdhPJxCEjDwRKocJ+MS4sV1pJrDfa8g4djXIhFVM1qC/8wOSpVeKSoaP1BvbRFLolJZ1sG5z7lZYJf7ncyGtWgD3rM=
X-Received: by 2002:a25:8804:: with SMTP id c4mr24571525ybl.469.1623075351742;
 Mon, 07 Jun 2021 07:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1622648507.git.mchehab+huawei@kernel.org> <832058f088a30e44cf25a81f1d4b9b4e0ed0904f.1622648507.git.mchehab+huawei@kernel.org>
In-Reply-To: <832058f088a30e44cf25a81f1d4b9b4e0ed0904f.1622648507.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Jun 2021 16:15:41 +0200
Message-ID: <CAMpxmJWnG14ECT6jHxsT3NQ8smZGCWQRgWVOGZHmoGdYs_pG9w@mail.gmail.com>
Subject: Re: [PATCH 10/12] MAINTAINERS: update ti,omap-gpio.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 2, 2021 at 5:43 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset bc3aca5393c4 ("dt-bindings: gpio: omap: Convert to json-schema")
> renamed: Documentation/devicetree/bindings/gpio/gpio-omap.txt
> to: Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: bc3aca5393c4 ("dt-bindings: gpio: omap: Convert to json-schema")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 644572ab4b2d..7d65784df8c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13412,7 +13412,7 @@ M:      Santosh Shilimkar <ssantosh@kernel.org>
>  M:     Kevin Hilman <khilman@kernel.org>
>  L:     linux-omap@vger.kernel.org
>  S:     Maintained
> -F:     Documentation/devicetree/bindings/gpio/gpio-omap.txt
> +F:     Documentation/devicetree/bindings/gpio/ti,omap-gpio.yaml
>  F:     drivers/gpio/gpio-omap.c
>
>  OMAP HARDWARE SPINLOCK SUPPORT
> --
> 2.31.1
>

Applied, thanks!

Bartosz
