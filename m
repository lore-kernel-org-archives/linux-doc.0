Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB3C19F28
	for <linux-doc@archiver.kernel.org>; Wed,  3 Aug 2022 07:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbiHCHUx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Aug 2022 03:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233836AbiHCHUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Aug 2022 03:20:52 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF401CFC0
        for <linux-doc@vger.kernel.org>; Wed,  3 Aug 2022 00:20:50 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x39so15578780lfu.7
        for <linux-doc@vger.kernel.org>; Wed, 03 Aug 2022 00:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sw7p8iQ6XPSMZYgzW7361iN40Iaa4lzyMtRpri0hWsA=;
        b=mBKeF84pmeLfiXPoL7ep6sCo8e+tjoogxEBfE5htIwOGENidPLk1nCgp8UtUExDKFB
         xr6MyBmswxF26GUKC7z3gTZaj23rEZH7PVPJ1seKBp+QWhkD0bOHuD0ObF0C9sMxZqj4
         FmZadfng7e3bfnNlnkwTLCQ4zPwDaaRUO2QJ37OOsAuK8DJKVhItZTspz3gyPesDM4Lm
         BW6+sTdDoiNf/fuu+pjo80gM4OGzOLY+JLQ2QWrrJBLSwutoWwWqRrnKjz3UrWN0CPIO
         szfW/pSwpc9qtLyyLXtorKs4xLrp9RRhSOtydPwuzgN+w5ItWLrNadcvwOrcK9tuq/SW
         XSFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sw7p8iQ6XPSMZYgzW7361iN40Iaa4lzyMtRpri0hWsA=;
        b=QSlUxQThg3ywFlRmlOHjh1b6TUGbwNfWdX5iy3ho902cqr5uJ05Dpz+hls2nexZ9+B
         j0Pse3BTAeEJtePm6xoDE+yyW3YJwgb3iYKrgdgpdaU+YxcFpRAwPe7/L1f/CBmqEVtJ
         Sjg7gtje1I36D3NU/66n8/qWwLf2Y+jgJmihBvzQYcBQgKote360iRjI6by+rjzvA3Yg
         zrqCc/DZPHLGoKro9rCRiuhQLUCBavTFQKjKN822HuUlYvQFimOkquWBWpsUmOg6pm/V
         vEXM9e6AqOooE3pUp+8+LdTS1iI1elKoMpkwviojdTCdwkj6Q12pbF4eI199BVt794KK
         t39Q==
X-Gm-Message-State: ACgBeo3uY+d1QdilCjB/ztmiSIiK7j1SEtHJfDX+oCTrOIXoO0bM2704
        eArYlbhgIyUcOI71hBo9sqrjppNfZTkfRbE1XqA=
X-Google-Smtp-Source: AGRyM1uPkA73DFzGcKKxYiZGQpgaVR7c1gzog07r2JZ1hf0+Kqbz7juwavX2VhVak1JH2t+tZWAlJrF72x3i2QVRCUg=
X-Received: by 2002:a05:6512:b11:b0:48a:86f9:661b with SMTP id
 w17-20020a0565120b1100b0048a86f9661bmr8350114lfu.606.1659511249301; Wed, 03
 Aug 2022 00:20:49 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1658196777.git.zhoubinbin@loongson.cn> <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
In-Reply-To: <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 3 Aug 2022 15:20:13 +0800
Message-ID: <CAJy-AmmHAmuvwVqi=QG0DRv5bNKc4nS9q1J3h1DFTSAbkiS6Fw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] docs/zh_CN: core-api: Add generic-radix-tree
 Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Wu X.C." <bobwxc@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's nearly an empty file...

Anyway,
Reviewed-by: Alex Shi <alexs@kernel.org>

On Tue, Jul 19, 2022 at 9:04 PM Binbin Zhou <zhoubinbin@loongson.cn> wrote:
>
> Translate core-api/generic-radix-tree.rst into Chinese.
>
> Last English version used:
>
> commit ba20ba2e3743 ("generic radix trees").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../zh_CN/core-api/generic-radix-tree.rst     | 23 +++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |  2 +-
>  2 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/generic-rad=
ix-tree.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/generic-radix-tree=
.rst b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> new file mode 100644
> index 000000000000..eacd1d2ebddc
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/generic-radix-tree.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=91=A8=E5=BD=AC=E5=BD=AC Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E9=80=9A=E7=94=A8=E5=9F=BA=E6=95=B0=E6=A0=91/=E7=A8=80=E7=96=8F=E6=95=
=B0=E7=BB=84
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E9=80=9A=E7=94=A8=E5=9F=BA=E6=95=B0=E6=A0=91/=E7=A8=80=E7=96=8F=E6=95=
=B0=E7=BB=84=E7=9A=84=E7=9B=B8=E5=85=B3=E5=86=85=E5=AE=B9=E8=AF=B7=E8=A7=81=
include/linux/generic-radix-tree.h=E6=96=87=E4=BB=B6=E4=B8=AD=E7=9A=84
> +=E2=80=9CDOC: Generic radix trees/sparse arrays=E2=80=9D=E3=80=82
> +
> +=E9=80=9A=E7=94=A8=E5=9F=BA=E6=95=B0=E6=A0=91=E5=87=BD=E6=95=B0
> +--------------
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +include/linux/generic-radix-tree.h
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index 854b923f3b30..60f76c83a9d8 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -46,12 +46,12 @@
>     rbtree
>     idr
>     circular-buffers
> +   generic-radix-tree
>
>  Todolist:
>
>
>
> -   generic-radix-tree
>     packing
>     bus-virt-phys-mapping
>     this_cpu_ops
> --
> 2.20.1
>
