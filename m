Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E46ECAAD5
	for <linux-doc@archiver.kernel.org>; Fri,  2 Sep 2022 08:29:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234406AbiIBI3w (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Sep 2022 04:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiIBI3v (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Sep 2022 04:29:51 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E0B7BE7
        for <linux-doc@vger.kernel.org>; Fri,  2 Sep 2022 01:29:46 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id m7so2227741lfq.8
        for <linux-doc@vger.kernel.org>; Fri, 02 Sep 2022 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=5V84ORK4wAWwN5/gNnFBkJfnWsaLRi0Hlbjhdvbzy0M=;
        b=PvCT/+PiWrlJWq0c6A1x7Po+9ZHH4pfuu2N8frCKyuR1vE1avr5DPNdz/r3zl5YrfJ
         OyhsbF2DYgHwrKC/LXbzAgWWq1ZX6ZY4GbgynZg/mSyv+TwtGp16gV/WOtK0lEsHTu9b
         TeuYtqk7B6Nlp2dQlZBPBGIMmHlso5MNlwxHRkEdW4Q9fbj+PZSe6MKwoxogkIkDBKAL
         w0wA0nUfPiFLxCSTV3C81vux47pQpuPRESiQ83U3Wh2eVGbWSRgvP2b7VwkBeY6B5YPF
         MMLTX7sh4o/4nBYbcw1kXBP5nBwNx0RH+rKZZDg1DIrgWl8Jxh6BMYOGiSYRFvaJHPUO
         vXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5V84ORK4wAWwN5/gNnFBkJfnWsaLRi0Hlbjhdvbzy0M=;
        b=lfba5avpRF9RLkL1J/jI6cY7qDnXCHWKqo+eAqmhUdMXbY12HLg0esPJO5vd9qjj+m
         WRQRoA4ilp4tEHhuTV4J69sHipg6fUIqUKP8BqpiVIjyajhxvno+Mjzes6jIEHIF4Euc
         TpWA1Y09aPdF+crq1gJuzZ9lcYPHldWM9xL/rC8oPJRQhqktwmIpMPAhti6/TrHdPG1Z
         xgtgY/q4+zH/jeZJTAbVBOnOWSps9Mpb0ND74hI6ZQFqpXNHLzgmwA0vUHHnACT7O4mB
         3/OgHu4HcBIqjf5FSoMXzusvOOxiP4EUKQEiviX4uXTrsswYJ/aEFTH7rcXZYwfR54mb
         WNbA==
X-Gm-Message-State: ACgBeo1Bof3Y8uY3AYrkZYVzk8wqgoPMr4jYshgrEv8G64EZShi7GPXa
        S2rSmaljQ4d66qEbSnX9q/m5OghWfP3pD94UARw=
X-Google-Smtp-Source: AA6agR52wYicUuR78UWeIiDaX3G6nkVDGRdiCC3cvRdWmelKJqytzdudtHfTUOmLlLk/+JKSE3Q8Svs40PBnG+Lnkh4=
X-Received: by 2002:ac2:41c1:0:b0:494:65a7:43ef with SMTP id
 d1-20020ac241c1000000b0049465a743efmr9161750lfi.592.1662107384845; Fri, 02
 Sep 2022 01:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662022757.git.siyanteng@loongson.cn> <0f2bfe28c1bdbc84b0085ba184675ea04f5e60b1.1662022757.git.siyanteng@loongson.cn>
In-Reply-To: <0f2bfe28c1bdbc84b0085ba184675ea04f5e60b1.1662022757.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 2 Sep 2022 16:29:08 +0800
Message-ID: <CAJy-Amktdy99ix7h_AQkTJLwLK1em6eM=84SrVTyynko0fnGNA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] docs/zh_CN: add dt kernel-api translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, "Wu X.C." <bobwxc@email.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 1, 2022 at 7:16 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translte .../devicetree/kernel-api.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Uh, no much useful info.

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  .../translations/zh_CN/devicetree/index.rst   |  5 +-
>  .../zh_CN/devicetree/kernel-api.rst           | 58 +++++++++++++++++++
>  2 files changed, 59 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/devicetree/kernel-ap=
i.rst
>
> diff --git a/Documentation/translations/zh_CN/devicetree/index.rst b/Docu=
mentation/translations/zh_CN/devicetree/index.rst
> index 9d95d2629b38..7451dbfdd3e5 100644
> --- a/Documentation/translations/zh_CN/devicetree/index.rst
> +++ b/Documentation/translations/zh_CN/devicetree/index.rst
> @@ -24,10 +24,7 @@ Open Firmware =E5=92=8C Devicetree
>
>     usage-model
>     of_unittest
> -
> -Todolist:
> -
> -*   kernel-api
> +   kernel-api
>
>  Devicetree Overlays
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/devicetree/kernel-api.rst b=
/Documentation/translations/zh_CN/devicetree/kernel-api.rst
> new file mode 100644
> index 000000000000..6aa3b685494e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/devicetree/kernel-api.rst
> @@ -0,0 +1,58 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/Devicetree/kernel-api.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E6=A0=B8=E4=B8=AD=E7=9A=84=E8=AE=BE=E5=A4=87=E6=A0=91API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=A0=B8=E5=BF=83=E5=87=BD=E6=95=B0
> +--------
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +drivers/of/base.c
> +
> +include/linux/of.h
> +
> +drivers/of/property.c
> +
> +include/linux/of_graph.h
> +
> +drivers/of/address.c
> +
> +drivers/of/irq.c
> +
> +drivers/of/fdt.c
> +
> +=E9=A9=B1=E5=8A=A8=E6=A8=A1=E5=9E=8B=E5=87=BD=E6=95=B0
> +------------
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +include/linux/of_device.h
> +
> +drivers/of/device.c
> +
> +include/linux/of_platform.h
> +
> +drivers/of/platform.c
> +
> +=E8=A6=86=E7=9B=96=E5=92=8C=E5=8A=A8=E6=80=81DT=E5=87=BD=E6=95=B0
> +----------------
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +drivers/of/resolver.c
> +
> +drivers/of/dynamic.c
> +
> +drivers/of/overlay.c
> --
> 2.31.1
>
