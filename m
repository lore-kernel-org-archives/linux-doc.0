Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EC4C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 14 Jan 2022 02:53:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238917AbiANCxw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Jan 2022 21:53:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238923AbiANCxw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Jan 2022 21:53:52 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3631C061574
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:53:51 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id u5so3050217ilq.9
        for <linux-doc@vger.kernel.org>; Thu, 13 Jan 2022 18:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mrULFvql7urnTeBnFSKO1DSH1yv2NTJRlMHKMvjwREY=;
        b=UFRELbdI4DGDvq+O36G6mfNdwWBtHgToikzb+665vNn8x7PKoMJf2C3dGl0RADHScp
         8DZozrFy0LBSo8r+Ry6/jqf2ObRnpI3eR2jrgl8pT12cMtR6qbBgOu8TyYhZNS5Il6Od
         ZsjSNmxMjfRLZrKWTSOs4w7KOxIyyeoYojUwjXW7HF54BDgV1IZL8uwNpi/P0x89CqTd
         gYTyV8u1UB6HC182nNxl0I1wWDHFgAE7pbLaJes4ugonREymENfZInMwmT2u5vHHasoh
         bxoLq2Z/wK6XC+JzPYy//CpHshauK+o4AAOIV3CBAfpIvz63/2vBgiFsFcio87vg5vq6
         CtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mrULFvql7urnTeBnFSKO1DSH1yv2NTJRlMHKMvjwREY=;
        b=PfbmabS7xTIY2UhDL1FulBDAizpMkAjiyq53cbbxEDe/OnxN/tGBbhk1UCWVkww1nk
         DvXaZtXszBAZsMOsBEnmBJH9hTSaAjqOafQGEFr48eSvWjZ3iB4g1ydva4qcbhszEKEc
         6GKRFEgguWBGP36GK0MAxiIewcCjLJFMHV3EjPFguEm9O4Sk5IynKkX1uMTAiEpfhhtR
         hnYQXCO5zRylDRUMElaWvc21AbBfjClol2QwRsZjKOxatImFnLXmMx7K7a6MO3t84LZg
         5yFKjFCbu1jj9yiJ8jMSK2h1GnF7MZf3DFKAm0gUHgx3kK74kpBM5B99x0YRgcc+lks+
         LWPQ==
X-Gm-Message-State: AOAM5310bAkgM4a9EOj0Z5IoxDPlWF0+S3ZaWIJCATYu0Rpd248OpNUf
        qic9MdR2eNphUw2OjSIHWgfhAi9pZMB45/OJ5Tlld4GGG/1jXgFI
X-Google-Smtp-Source: ABdhPJzGG+gdIxAJSInd/WL3Q0pwt89hja2xAgTqCBuLyb1ZL57zz0tXBe0pCtWUBugOkZLiEI5tqNdBxb6Cvow5xy0=
X-Received: by 2002:a92:8750:: with SMTP id d16mr3582444ilm.103.1642128831423;
 Thu, 13 Jan 2022 18:53:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1642043630.git.siyanteng@loongson.cn> <b30a06d42ed8f528f77be343d300c472f49536d1.1642043630.git.siyanteng@loongson.cn>
In-Reply-To: <b30a06d42ed8f528f77be343d300c472f49536d1.1642043630.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 14 Jan 2022 10:53:15 +0800
Message-ID: <CAJy-AmmSbze+iVZAaLb4Zjz=sSC1z2iNJ=LT4wyYZLa1EctuZg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/zh_CN: add damon api translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 13, 2022 at 11:21 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Translate .../vm/damon/api.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
>  .../translations/zh_CN/vm/damon/api.rst       | 32 +++++++++++++++++++
>  .../translations/zh_CN/vm/damon/index.rst     |  4 +--
>  2 files changed, 33 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/damon/api.rst
>
> diff --git a/Documentation/translations/zh_CN/vm/damon/api.rst b/Document=
ation/translations/zh_CN/vm/damon/api.rst
> new file mode 100644
> index 000000000000..21143eea4ebe
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/damon/api.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +:Original: Documentation/vm/damon/api.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D
> +API=E5=8F=82=E8=80=83
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +=E5=86=85=E6=A0=B8=E7=A9=BA=E9=97=B4=E7=9A=84=E7=A8=8B=E5=BA=8F=E5=8F=AF=
=E4=BB=A5=E4=BD=BF=E7=94=A8=E4=B8=8B=E9=9D=A2=E7=9A=84API=E6=9D=A5=E4=BD=BF=
=E7=94=A8DAMON=E7=9A=84=E6=AF=8F=E4=B8=AA=E5=8A=9F=E8=83=BD=E3=80=82=E4=BD=
=A0=E6=89=80=E9=9C=80=E8=A6=81=E5=81=9A=E7=9A=84=E5=B0=B1=E6=98=AF=E5=BC=95=
=E7=94=A8 ``damon.h`` =EF=BC=8C
> +=E5=AE=83=E4=BD=8D=E4=BA=8E=E6=BA=90=E4=BB=A3=E7=A0=81=E6=A0=91=E7=9A=84=
include/linux/=E3=80=82
> +
> +=E7=BB=93=E6=9E=84=E4=BD=93
> +=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +include/linux/damon.h
> +
> +
> +=E5=87=BD=E6=95=B0
> +=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +mm/damon/core.c
> diff --git a/Documentation/translations/zh_CN/vm/damon/index.rst b/Docume=
ntation/translations/zh_CN/vm/damon/index.rst
> index 077db7e4326f..84d36d90c9b0 100644
> --- a/Documentation/translations/zh_CN/vm/damon/index.rst
> +++ b/Documentation/translations/zh_CN/vm/damon/index.rst
> @@ -29,7 +29,5 @@ DAMON=E6=98=AFLinux=E5=86=85=E6=A0=B8=E7=9A=84=E4=B8=80=
=E4=B8=AA=E6=95=B0=E6=8D=AE=E8=AE=BF=E9=97=AE=E7=9B=91=E6=8E=A7=E6=A1=86=E6=
=9E=B6=E5=AD=90=E7=B3=BB=E7=BB=9F=E3=80=82DAMON=E7=9A=84=E6=A0=B8=E5=BF=83
>
>     faq
>     design
> +   api
>
> -TODOLIST:
> -
> -*   api
> --
> 2.27.0
>
