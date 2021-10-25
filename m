Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7F4C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 13:58:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1778E60F9B
	for <linux-doc@archiver.kernel.org>; Mon, 25 Oct 2021 13:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbhJYOAq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Oct 2021 10:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233103AbhJYOAn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Oct 2021 10:00:43 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27347C061767
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 06:58:21 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id l13so1476618ilh.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Oct 2021 06:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5nOmumExDuG/UBbWiWJp0a/1EMKZWB5ak0TMFRBCeFs=;
        b=RD+yB4ghUqrfkSSJGjh+N55d9jZmY75F5H7HVh4K8FoB4SSvqDvZN5VloLtsirCso3
         FEmuj4BrBYMAmP9RCFazaiaAtLO8prTuJJ6OA70V0Lls2QvtPNUijdLFENWO7E4+6/3r
         gIrTmxzc/xbpsuAATXeCi0STHDAEySlKr2KfswuALPmXtXxBXTgK/l9Z0hH2MIPGRHyW
         LoW2gIU9M7zkL50Yu+aZeQJw1Qr+je4oGqHYTaabz9ySS9rway4s0I3BN78nG7rXaadU
         5PWcciMPJpeB6K1CbE4fGHhcNbk1sBFZEMPVqD7xTsun7/eMsvBq/PqFAgJgzOHEaGl1
         Y5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5nOmumExDuG/UBbWiWJp0a/1EMKZWB5ak0TMFRBCeFs=;
        b=N2dr9nSYrbX69JG0dKJ9iEpsEBtwVc/jJWCiI4F09XYwLW3r6WNOJwb4jRRv0oOhTj
         h/SWXyBIwEbicdLvpIJRIVbbsPOEw122ApsiTM5hW/KmOjRUw8bF4dCDCfeUMvt55JxY
         pEzIjRc4Won5OAEZ0rPzP4oOSSoCNcCCfsWlYHvkCOKWPTWmUsLdIsjTN/HRQYw01K6g
         dSYApYhFlWB41ro+61ArLMsGoypQs+cHyn0tp5eY5X8P/7iEW/12lfUpzYc+g2sCO0wt
         l9xyzlLoW7ImTMIAIjMvsQR6+Zy/teqx7s53oGMkJEiK/ndQcjMgrOIvUQdr98c9OQgZ
         WD4Q==
X-Gm-Message-State: AOAM532DZYgG9M1hHBuT4FwW/jQD9ZZSjP3XpGq57v06irkejXrAFLIl
        STvCIGpS1dmfy0qY+k/tjE1IOO4UhVzqQvBtwjE=
X-Google-Smtp-Source: ABdhPJwUp+7tjXKXMGORaPWYjZ4bt4JUWi8Xlg/Qf9nAwzVGDRKgDWfNcUV+4NJbdrFl+K5bfC3cKCmP4RrEYfkdTjA=
X-Received: by 2002:a05:6e02:1a42:: with SMTP id u2mr4460372ilv.97.1635170300634;
 Mon, 25 Oct 2021 06:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634723736.git.siyanteng@loongson.cn> <d40830880bdf788512023735b69fcadcfa824578.1634723736.git.siyanteng@loongson.cn>
In-Reply-To: <d40830880bdf788512023735b69fcadcfa824578.1634723736.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 25 Oct 2021 21:57:44 +0800
Message-ID: <CAJy-AmmxMuoiCM0tTZO_iaN1Rzw8me1Xkdq1oodp4Zcfhsrwqg@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN add PCI index.rst translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On Wed, Oct 20, 2021 at 6:04 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Translate ../PCI/index.rst into Chinese
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/PCI/index.rst          | 35 +++++++++++++++++++
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  2 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/PCI/index.rst
>
> diff --git a/Documentation/translations/zh_CN/PCI/index.rst b/Documentati=
on/translations/zh_CN/PCI/index.rst
> new file mode 100644
> index 000000000000..8c6dec03856f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/PCI/index.rst
> @@ -0,0 +1,35 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/PCI/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +.. _cn_PCI_index.rst:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux PCI=E6=80=BB=E7=BA=BF=E5=AD=90=E7=B3=BB=E7=BB=9F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 2
> +   :numbered:
> +
> +Todolist:
> +
> +   pci
> +   pciebus-howto
> +   pci-iov-howto
> +   msi-howto
> +   sysfs-pci
> +   acpi-info
> +   pci-error-recovery
> +   pcieaer-howto
> +   endpoint/index
> +   boot-interrupts
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index a34e58733ac8..45bfd0774f2d 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -106,6 +106,7 @@ TODOList:
>     virt/index
>     infiniband/index
>     accounting/index
> +   PCI/index
>
>  TODOList:
>
> @@ -137,7 +138,6 @@ TODOList:
>  * vm/index
>  * bpf/index
>  * usb/index
> -* PCI/index
>  * scsi/index
>  * misc-devices/index
>  * scheduler/index
> --
> 2.27.0
>
