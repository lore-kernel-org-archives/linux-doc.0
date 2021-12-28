Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DFB7C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Dec 2021 07:12:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235199AbhL1HMI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Dec 2021 02:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhL1HMI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 02:12:08 -0500
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A03B9C061574
        for <linux-doc@vger.kernel.org>; Mon, 27 Dec 2021 23:12:07 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id g80so7468712ybf.0
        for <linux-doc@vger.kernel.org>; Mon, 27 Dec 2021 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DF2RNipr5WK4CvwMHJy8/JzTXMS9mq2RSccHr//IGJM=;
        b=dPKy5LOTgirjvdIXu86+bIxDKUIuzzcB+ryXpqGphobPMi4U5wX6uiEs8UJ8p91giv
         b1m7xZ5pL9ZD5cus41eUPMEps5nHbPszpD5Q4U/4c1vDiPsMnR0/eIB2GQB7A3fIzyDI
         6a8Gc5VLKjHODXRMBdtekg8tVWA5qCa3qOd55NP9qnwyTKJaF3s92Kw/9NlkBU38xm2J
         hbEzQdjV7poCB1Gvvp1kHbeX+JOo5yzQMIuk7AMllczUZLxaGc2vix1N1XgYln1SZj+T
         by9C6N3DL5iv3xAG0tBlKsq/uFCcZTX83wL9EMaVo/5WVdDMLwpoJTd6bypAi0fekIRm
         boRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DF2RNipr5WK4CvwMHJy8/JzTXMS9mq2RSccHr//IGJM=;
        b=YjYmvk860szqSdiEbwmVZWkzZNPZHZJfs+v2Ug4ixxYuQB3b3kZOuR1/RsFanbElT0
         ltTk8LSkIU01S/g3h05EoBZRTZsoohIB8fqBZpbyr9xzcK2+GXdIyuOmUYeu/YFCK02x
         8rvBV92qCVw94Qu6irg4r+dQ/w4YCKcqdJ0kCo5y5ixFfaoHzFduv6He82BylAW+glA4
         TSaQB6U1dnPCGj0QFBHfyt1rfugmL913i+VbwCyHlm0dEvU0rk1gqPCugXXcYbxy3Lws
         zL39+H+zHiyt5sC/0FQEq90hvPt5m1Rz8fsJYBQgZxdxgyHVtkudfdw/WzwLPmDjePGD
         wq8Q==
X-Gm-Message-State: AOAM5330zLTCxo+xOpQQd9V0EDwiStI9bmx1VPa53oAZsv7Rn6GV71l1
        8NIpad+nZEWOvpWa8mkm/rREGsB/Ge9CiMVMouE=
X-Google-Smtp-Source: ABdhPJwmNl2ZSfhyAYISVvnrKmI0mw7Y2z9enlTMdCEfL+A3XJAEcRorb1L9pHMQreKGMvSYBXLQmgwngoq1cIIChek=
X-Received: by 2002:a05:6902:709:: with SMTP id k9mr24294696ybt.572.1640675526883;
 Mon, 27 Dec 2021 23:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20211228021407.12449-1-tangyizhou@huawei.com> <20211228021407.12449-3-tangyizhou@huawei.com>
In-Reply-To: <20211228021407.12449-3-tangyizhou@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 28 Dec 2021 15:11:55 +0800
Message-ID: <CAEensMwusWZocK2GJyOv9zktjg2YcW4Me4b7vKaQuRc1MMFwsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] docs/zh_CN: Add power/index Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 09:46=E5=86=99=E9=81=93=EF=BC=9A
>
> Translate power/index.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/power/index.rst        | 55 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/power/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index e7f5fa3e7502..08144252630c 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -108,6 +108,7 @@ TODOList:
>     cpu-freq/index
>     iio/index
>     infiniband/index
> +   power/index
>     virt/index
>     sound/index
>     filesystems/index
> @@ -129,7 +130,6 @@ TODOList:
>  * netlabel/index
>  * networking/index
>  * pcmcia/index
> -* power/index
>  * target/index
>  * timers/index
>  * spi/index
> diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documenta=
tion/translations/zh_CN/power/index.rst
> new file mode 100644
> index 000000000000..fd379adfda8e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/power/index.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/power/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> +  =E5=94=90=E8=89=BA=E8=88=9F Tang Yizhou <tangyeechou@gmail.com>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E7=94=B5=E6=BA=90=E7=AE=A1=E7=90=86
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +TODOList:
> +
> +    * apm-acpi
> +    * basic-pm-debugging
> +    * charger-manager
> +    * drivers-testing
> +    * energy-model
> +    * freezing-of-tasks
> +    * opp
> +    * pci
> +    * pm_qos_interface
> +    * power_supply_class
> +    * runtime_pm
> +    * s2ram
> +    * suspend-and-cpuhotplug
> +    * suspend-and-interrupts
> +    * swsusp-and-swap-files
> +    * swsusp-dmcrypt
> +    * swsusp
> +    * video
> +    * tricks
> +
> +    * userland-swsusp
> +
> +    * powercap/powercap
> +    * powercap/dtpm
> +
> +    * regulator/consumer
> +    * regulator/design
> +    * regulator/machine
> +    * regulator/overview
> +    * regulator/regulator
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.17.1
>
