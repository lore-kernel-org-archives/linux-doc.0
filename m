Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87199C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 01:46:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F9AC61450
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 01:46:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235569AbhDWBra (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Apr 2021 21:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235302AbhDWBr3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Apr 2021 21:47:29 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40911C061574
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 18:46:54 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id j7so24734937pgi.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Apr 2021 18:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9GGnZINYaAnchH8DZmAx+rvqSHFaWbjIYjPyTTy9Z5A=;
        b=XbTyQIzWIManNIJQPRAV+qwLBIjpMzQdIQ5C/1HBn44E7dwHUQmUW6pU0jBxtG09FY
         PwtTI4V13GCJEyOIH6Lsv2SB3UYPKpV3WvBPzBsbRCcMEv1CTCWRYbUWAB2MXeHCSnE3
         ylhhK3Gq4qRdRDCVCjtPBl/y8+xVSTNts9U7D4mc/nNgsXKU1DpAo+FzyBcZEfqtEMst
         yFCIl5rHVbN32+sUa485gLTV3IhbEeWOxOceRkh9rYhMRXMia8NHJNxU6nkbFTND+8yZ
         6E344MiofZUMsS+0Tfex++FFeZG4E9zCATmgE8Okg+MLW252Ki2oOCk3qq+bW0G1o0op
         7k+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9GGnZINYaAnchH8DZmAx+rvqSHFaWbjIYjPyTTy9Z5A=;
        b=Afm+WmN4AWA/THjim7QxfwWMaS5CcsHMiLy3SN7Rda9VR8ST2Ha1THe03cZ5AiiYHf
         tQJveuhnlNnT/UTwCx1P43Y218TZYnJqQ7+ZiQyGv87livtU64tH2hWySTC3elicZFDZ
         4VMHQ1v7VaX1fMQUKCOu8GP0XHLThULDxQyEJ9r9aHbasHnv3jDvwRWiln/mVT7MPEFh
         CKOdZ7FZcKfAyeMN4Br0r1QVYyVjo9XmWJVtR4aSzx1Coya8MaBD3MaJSMu2q2prAsy8
         ++t8ge5TerB+ccndM3sFwJWNPmkGDNwoQtLqNrRzIhkWgMKUzZ6j3YF37m4buEu1WI+3
         bnWg==
X-Gm-Message-State: AOAM532oxsVOxJR+pTSWh6pMl+S15yQn6y6O7yHkJaNJFB+W54RTi75y
        kDVUOvywPX6rVldIEL1aneyiHt0wwBg/H35+afg=
X-Google-Smtp-Source: ABdhPJxMlpxv13qbKZy4+34Dkn75i7tFlfhZ2LU70apUKBKvcmrzqIXV3ZvVRXOVzrOFNyHM2BJi1S7br5uuSRVe+3o=
X-Received: by 2002:a63:2c81:: with SMTP id s123mr1492622pgs.168.1619142413752;
 Thu, 22 Apr 2021 18:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1619093668.git.bobwxc@email.cn> <17f5e1dea82388e64b3c90024d50650b663d0046.1619093668.git.bobwxc@email.cn>
In-Reply-To: <17f5e1dea82388e64b3c90024d50650b663d0046.1619093668.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Fri, 23 Apr 2021 09:46:44 +0800
Message-ID: <CAMU9jJq3+Tm29-OO8MuVABWHRiM2pNqhRre2jB-wqM-bPRcLHA@mail.gmail.com>
Subject: Re: [PATCH 1/6] docs/zh_CN: Add translation zh_CN/maintainer/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>,
        hjh <huangjianghui@uniontech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Wu XiangCheng <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B44=E6=9C=8822=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:27=E5=86=99=E9=81=93=EF=BC=9A
>
> Add a new translation
>   Documentation/translations/zh_CN/maintainer/index.rst
> and link it to zh_CN/index.rst
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> Todolist in this file will be changed one-by-one in followed [Patch 5-6/6=
]
>
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  .../translations/zh_CN/maintainer/index.rst   | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/maintainer/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index ee6b20ca9080..3bfecfe179b8 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -21,6 +21,7 @@
>     dev-tools/index
>     doc-guide/index
>     kernel-hacking/index
> +   maintainer/index
>     filesystems/index
>     arm64/index
>     sound/index
> diff --git a/Documentation/translations/zh_CN/maintainer/index.rst b/Docu=
mentation/translations/zh_CN/maintainer/index.rst
> new file mode 100644
> index 000000000000..4ce27c12f370
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/maintainer/index.rst
> @@ -0,0 +1,19 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/maintainer/index.rst
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E6=A0=B8=E7=BB=B4=E6=8A=A4=E8=80=85=E6=89=8B=E5=86=8C
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=9C=AC=E6=96=87=E6=A1=A3=E6=9C=AC=E6=98=AF=E5=86=85=E6=A0=B8=E7=BB=B4=
=E6=8A=A4=E8=80=85=E6=89=8B=E5=86=8C=E7=9A=84=E9=A6=96=E9=A1=B5=E3=80=82
> +=E6=9C=AC=E6=89=8B=E5=86=8C=E8=BF=98=E9=9C=80=E8=A6=81=E5=A4=A7=E9=87=8F=
=E5=AE=8C=E5=96=84=EF=BC=81=E8=AF=B7=E8=87=AA=E7=94=B1=E6=8F=90=E5=87=BA=EF=
=BC=88=E5=92=8C=E7=BC=96=E5=86=99=EF=BC=89=E6=9C=AC=E6=89=8B=E5=86=8C=E7=9A=
=84=E8=A1=A5=E5=85=85=E5=86=85=E5=AE=B9=E3=80=82
> +*=E8=AF=91=E6=B3=A8=EF=BC=9A=E6=8C=87=E8=8B=B1=E6=96=87=E5=8E=9F=E7=89=
=88*
> +
> +TODOList:
> +
> +-   configure-git
> +-   rebasing-and-merging
> +-   pull-requests
> +-   maintainer-entry-profile
> +-   modifying-patches
> --
> 2.20.1
>
