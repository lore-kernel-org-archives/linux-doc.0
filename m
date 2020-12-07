Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01F3C4361B
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 10:32:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 726CA23331
	for <linux-doc@archiver.kernel.org>; Mon,  7 Dec 2020 10:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbgLGKcI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 05:32:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbgLGKcG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 05:32:06 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B97C0613D0
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 02:31:26 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id f23so18758439ejk.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=avwXTY4xKF4GYJux7MHK5WB/0Z5FSjvXovshldSv0FY=;
        b=Koz8pLD92Bc+OA38U/SVkLaUxErp6GlaZiBlKyqXz1eMnIAAlJ1AzWywkxnWEpTuqH
         jcpvF2CqCxtziXQ7kd8q4pe836G+LkCaA5WsZfZ+pm4I/4SkjmXLtjrf6laDzMx6YhkD
         SyBhLnB81hYrCMvTbf578MOKilnaYFTq/NK1CVGPEbc0M1UMpiq1F8EYEDb7K6Ev5RWH
         aEJnikVY4spRTMvGWM0UD5D+eqnZN53w2nheq9/FxLG3obYGCPgEMKPqABacz7+/06xW
         IhMcpuOukOTei6R7dZMXRvM6D7SIU/KSQDdBaPuloTNPORL20DniuYKo5CX05qvRp1We
         kP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=avwXTY4xKF4GYJux7MHK5WB/0Z5FSjvXovshldSv0FY=;
        b=OH6C8iLE9jzOAgVkEzMZgn2oUNtVK4TqEO3uGH+biLGBaiU5GOE0iUtlcXXiDjFEVh
         MZIBtrrfJ0OqctUm4SH3AJ82USgDOX+SlhFSj8TzqsG0hurh43fNWhOLF7GEkY9NuClV
         SGP/HBkBdyypNlZ2yInYWYonZ89wY8RoZGTOa4ddzkdVmDDhl5HaWbeErzy6+KNHbLmK
         T39uoPYYTNCgfn60H6rTWbUp+3d7kWKkVUG3LSyE4oh2c0V8Q2BV7G2zGetHIY8THQTM
         YoG6PTzaQYAvwL/NsrG/KLZOp936Fl2UDugNSjwrWWUNrlyklWBr2GnghUHwTUJiHXR6
         0tug==
X-Gm-Message-State: AOAM533h0dFGlyNFYSF48maFT/ziIprMS/dXLeDVck3sV9bh8VB92Aea
        uIfGg2E1DpHddVi8jOXVm8lzZXK8MJDlXq6vr3mogg==
X-Google-Smtp-Source: ABdhPJzXz9wKScnULYT5yiqNYTc0tuNX148+tIwRVDm7K1qucm+VxxovDI70gPvRQXH3EBb4Z3MpwQMNCuOuDuVMuAE=
X-Received: by 2002:a17:906:15cc:: with SMTP id l12mr17640381ejd.363.1607337085119;
 Mon, 07 Dec 2020 02:31:25 -0800 (PST)
MIME-Version: 1.0
References: <20201203191135.21576-1-info@metux.net>
In-Reply-To: <20201203191135.21576-1-info@metux.net>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 7 Dec 2020 11:31:14 +0100
Message-ID: <CAMpxmJVkXeH_B4A_e1Vy4H2LcQnNz0BVoZyXNKEXmG8NvgO6cw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drivers: gpio: put virtual gpio device into their
 own submenu
To:     "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        linux-doc <linux-doc@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        virtualization@lists.linux-foundation.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 3, 2020 at 8:11 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:
>
> Since we already have a few virtual gpio devices, and more to come,
> this category deserves its own submenu.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> ---
>  drivers/gpio/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 5d4de5cd6759..01619eb58396 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1590,6 +1590,8 @@ config GPIO_VIPERBOARD
>
>  endmenu
>
> +menu "Virtual GPIO devices"
> +
>  config GPIO_AGGREGATOR
>         tristate "GPIO Aggregator"
>         help
> @@ -1613,4 +1615,6 @@ config GPIO_MOCKUP
>           tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
>           it.
>
> +endmenu
> +
>  endif
> --
> 2.11.0
>

I'd call this section "Virtual GPIO drivers" because the code contains
drivers not devices.

Bartosz
