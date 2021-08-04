Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D7AC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E42C861037
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:27:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhHDC10 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbhHDC1Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:27:25 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9DF4C06175F
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:27:12 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id h18so432804ilc.5
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ktXFj/wJYC19f9c4mr97Kh2zTjbyjMHtIffS2vhKZ/w=;
        b=On9p16NbC5XIe7+Kv9UZP7KI2xGL/5er+nRnOt1SbQaKGpQZ+K2eL5fd/DnXmyY9wN
         YwMKw21IdAllgPUDMsd6Re/5V1EToxl/Gp7AQT96Cx+L/HnW4vOGF/fqKony8m2EvL1+
         PVeExmUFIjQT0LHnEll9kyRHqAEEplBMumHKsfZ83F9tb8627OrLvIJF/GKbpsaGAPZp
         sotRdzD7sSuvH0lbBaUYD/iN5S5pgJkhYE1l1X4L6vT/H79FLxLdaTX/ip6j8JEmYNL8
         l9qjxxR2R+MZu/1kr0hc/AJGD8IykAh3KccwecqEYmY5oJQ3bcYmYL92wLnBCJHY+IQo
         4vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ktXFj/wJYC19f9c4mr97Kh2zTjbyjMHtIffS2vhKZ/w=;
        b=MZ7+DGauVq3OTvwp7u4v08r3JPUE4WWkrSW3ZibQ0IXNrLqdD+phUiTleQOngMVTpu
         V++yPFtGVE6G85BWFD6+NsiPRViPjhoP5fRo5hdSAS1I5AiT3AI7AiBVN7eDeoKX+RcN
         EiA1kTDK3drkL0Pmv3/sR4BJDvmcxNTuxs7ETEoENhzD7HHjWuUHE0qyjNUKv8dMemFO
         rQAfhMKlIm+r3wBpo4WANq1PPYcTtvK6E2HxTM/fnYAbEYmoBoZeJBI39KXaNqKUuw4c
         Sphe5lL+wclHToEeZRy3w5QY6cND4nWf7KHyxYtHVwXFm6qCvA9iyrLkeYme078NMSaA
         SzUg==
X-Gm-Message-State: AOAM533ubHa3NPWqqPOYoVlYFIez3umgARHIwmtqwNUZUvniTEQIcCL0
        LjkHkSJ1IAvoEOuF99PH0vC9M0TDZRzY9+oWwII=
X-Google-Smtp-Source: ABdhPJygzv7voMITAYsfTdezwm5GFlQKAxaqNYYfqQwsRU9BzrOXCJ7yyKRmJwh95aFnUU/Tc/4SiL2iiBbCl9Z7d8s=
X-Received: by 2002:a05:6e02:2188:: with SMTP id j8mr404615ila.14.1628044031968;
 Tue, 03 Aug 2021 19:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <c270cb35409755903fff2b64de8f5dcc7b553e91.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <c270cb35409755903fff2b64de8f5dcc7b553e91.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:26:35 +0800
Message-ID: <CAJy-Am=UFh-KvUBK9gZ7eFbyY1pLYQrpboyHnDms0vVhVowBEw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] docs/zh_CN: add infiniband index translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 1, 2021 at 8:25 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/infiniband/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/infiniband/index.rst   | 40 +++++++++++++++++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index e0d51a167032..84d000245102 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -102,6 +102,7 @@ TODOList:
>     iio/index
>     sound/index
>     filesystems/index
> +   infiniband/index
>
>  TODOList:
>
> @@ -116,7 +117,6 @@ TODOList:
>  * hid/index
>  * i2c/index
>  * isdn/index
> -* infiniband/index
>  * leds/index
>  * netlabel/index
>  * networking/index
> diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Docu=
mentation/translations/zh_CN/infiniband/index.rst
> new file mode 100644
> index 000000000000..ebb1e20b7df4
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/infiniband/index.rst
> @@ -0,0 +1,40 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/infiniband/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> + =E7=8E=8B=E6=99=AE=E5=AE=87 Puyu Wang <realpuyuwang@gmail.com>
> + =E6=97=B6=E5=A5=8E=E4=BA=AE Alex Shi <alexs@kernel.org>
> +
> +.. _cn_infiniband_index:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +infiniband
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +TODOLIST:
> +
> +   core_locking
> +   ipoib
> +   opa_vnic
> +   sysfs
> +   tag_matching
> +   user_mad
> +   user_verbs
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.27.0
>
