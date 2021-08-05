Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38663C4338F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0DEC16044F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Aug 2021 19:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhHETei (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 15:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhHETei (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 15:34:38 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E922C061765
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 12:34:23 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id z128so10854547ybc.10
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 12:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OjzSuQ/ih9YihuSqr0yJlft2iccfIfOLf5UR1oHtBfw=;
        b=t5jTHcshMRomx+U+mjOZL7JRahGyPOV1eVRgzK93HUhnC6bq1q+yENtT4en1ICJX6K
         Sx6fSQIoFxDXj/HsPMpubiGtMpmdjJIzWryGHXEzu0WBVsIuupkY9XB4UWzUczmbJjn3
         fcDokwwTaMcYiehLr2UczkhHkg6B0+al1ZUKGmg+XPeJiDHOJNmMwWOpPgEVVdsVWyyF
         AuxDAASWOpm3qkW6MkSheo+uPZBnzKhEg1Ug44RNotZwsIi0NUUbS5UKr0/jsYA44ybO
         0P0NmO+kPUHF9Qvcau5eTDS71/X5e/pE71m3KqwcjJmuSvRw1xyng53awCL4tTYiOtb3
         3Cqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OjzSuQ/ih9YihuSqr0yJlft2iccfIfOLf5UR1oHtBfw=;
        b=lWMvNZNB2CsGy++R1edQd6E3LSWOgmXchqikQeQfdLQKgjHgjvbUILuehAS2AUduOK
         RBdNDdtZPJMJ4CW0/5iEKudXeVfc5Ap7R1gIPkCI0q2Jy2yuBOUSypgYs4tHVClY9ow7
         ih6RsvzdPNbLZsB9RyiwZIcu6X0a1w4pJLxA7/022skYVKY/W69CiDBtsxophkt20AWx
         vbqjBwUHv9XSxn20XzKriQcryMk1/QrMUVwKts/+8lYiWnihL6OBB8QUyR17jTw0heXQ
         AmX28hXRWMhj9IHyGTDeJ1rUM2IAm3M+fjOXS7qOFqvQze7NERirMxBwusctriqZvnsS
         bhdA==
X-Gm-Message-State: AOAM5328gwMB1JA1rN+ib+5QrgMwxM5zeuYDUyTiVFjR0f+L0Jdz2k28
        HGp56KGimsFmdCzyQ6NB3wTr578CxeB90lJuG2SN5Q==
X-Google-Smtp-Source: ABdhPJzhy9EpxjDKV6CQnSv5zHP0x83zyvNrVobJHJ/xfKzeDYtHGJ/1+KtGYq5yledRXzszY2nUVt3MkIvCAtzNBbQ=
X-Received: by 2002:a25:505:: with SMTP id 5mr8137807ybf.157.1628192062775;
 Thu, 05 Aug 2021 12:34:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1626947923.git.mchehab+huawei@kernel.org> <e6f6fa5cebf94753ad8c4b30103459a8eea4bce0.1626947923.git.mchehab+huawei@kernel.org>
In-Reply-To: <e6f6fa5cebf94753ad8c4b30103459a8eea4bce0.1626947923.git.mchehab+huawei@kernel.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 5 Aug 2021 21:34:12 +0200
Message-ID: <CAMpxmJVe40C=69RJ4oKqQXogHBmgjcoRk+ExP1nGsO19WaikwA@mail.gmail.com>
Subject: Re: [PATCH 12/15] MAINTAINERS: update gpio-zynq.yaml reference
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 22, 2021 at 12:00 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
> renamed: Documentation/devicetree/bindings/gpio/gpio-zynq.txt
> to: Documentation/devicetree/bindings/gpio/gpio-zynq.yaml.
>
> Update its cross-reference accordingly.
>
> Fixes: 45ca16072b70 ("dt-bindings: gpio: zynq: convert bindings to YAML")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 76236b2c1d7a..7e1e5385d971 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20382,7 +20382,7 @@ R:      Srinivas Neeli <srinivas.neeli@xilinx.com>
>  R:     Michal Simek <michal.simek@xilinx.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/gpio/gpio-xilinx.txt
> -F:     Documentation/devicetree/bindings/gpio/gpio-zynq.txt
> +F:     Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
>  F:     drivers/gpio/gpio-xilinx.c
>  F:     drivers/gpio/gpio-zynq.c
>
> --
> 2.31.1
>

Applied, thanks!

Bart
