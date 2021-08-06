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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 192E3C432BE
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:15:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EAA9661207
	for <linux-doc@archiver.kernel.org>; Fri,  6 Aug 2021 02:15:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242357AbhHFCPs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Aug 2021 22:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242335AbhHFCPs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Aug 2021 22:15:48 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7B0C061798
        for <linux-doc@vger.kernel.org>; Thu,  5 Aug 2021 19:15:32 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id c24so11630222lfi.11
        for <linux-doc@vger.kernel.org>; Thu, 05 Aug 2021 19:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mr9IrMudSM+RYGQijtMbn3redLnse2ke2SFCeJo9M5s=;
        b=QmT6V4eR8T0a/37FFbDyvDFndOPCgYk5Kju/fwwSaRRMWjpvUUgGL1etARCqDeGS4t
         ta/DfB56RqH+3stWZXh/3UW4I4B3wzzv3eOjxGt9KMWZBhyPQ6xXBEdliDxTAmldgQft
         1ddREXMK+4IB3CLTddLcqKokpH35ufOlAhiQX05M0Y+b4SMTnbJzYVhrhpbkaV6852KT
         mGIIGPGZvVX04UQBMW3lhKHz02V9/Mc0Z3jFpZGnmukbiX1XSwXF4AuEcBH1uwgofQrf
         6nsL9oVfuLfCCPeha53F+e2twzA+lvBHzh+M4+6pT7UssR0V+HU+OOS2rwMEL1maNVBm
         xP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mr9IrMudSM+RYGQijtMbn3redLnse2ke2SFCeJo9M5s=;
        b=RyLAliC71Y4davUMshpPnjarvZNt8Sh37uYxgcgu7m5BOYzzljTR1FBJMJw7u6nyUY
         PLUkCQqabmOSNUyRRzfj7U+gnAocbSetyEaLzNNAAYs1fczLVzZT1Lk2km8kEtplI184
         DGdk4Ip7QXVhXiLyksVUH2DHlrGkZg60Lv8DDt49KRMJk7lfqzHa+prDOicxLSdgwILp
         W9S7lKqAMbqE6q3uawg2mfVYub7NvlHAIX3x3C/OfH710NjxJ2Rn9+tf6W6Txh3y3C73
         CRreDR+2wH8ik8P/I/f2y6rjOFaeHIjNaK6vCYYUzCp+GdUIcB2ppZlcT4bCQAhAPcge
         INVQ==
X-Gm-Message-State: AOAM5338ocb8j6vTBj7+lT/PSYsvhAtBbVVplGGRuMIo67qf5sYoR1X4
        j366EmhZytbEOCdybjTEZJpc4ATxT5NJlFAAeN0=
X-Google-Smtp-Source: ABdhPJxL1dFCbP7rNVq1Dj1chC6NQU7ocqovxQE0l5GGfrncsTn1G3TD5f7GusSrIkoImyPNg5Z2wH67BQUkx0OgaOg=
X-Received: by 2002:ac2:4941:: with SMTP id o1mr6026552lfi.100.1628216130890;
 Thu, 05 Aug 2021 19:15:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <e00e8cb6affb5c281b8f8810ccd05aca81653c60.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <e00e8cb6affb5c281b8f8810ccd05aca81653c60.1627820210.git.siyanteng@loongson.cn>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Fri, 6 Aug 2021 02:15:19 +0000
Message-ID: <CADQR0QiOqntPoVO29gA=JMjRKErC5Ucj_dt8Pw-8VZWiZ1motg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/zh_CN: add infiniband sysfs translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, chenweiguang82@126.com,
        Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 1, 2021 at 12:25 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/infiniband/sysfs.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Puyu Wang <realpuyuwang@gmail.com>
> ---
>  .../translations/zh_CN/infiniband/index.rst   |  2 +-
>  .../translations/zh_CN/infiniband/sysfs.rst   | 21 +++++++++++++++++++
>  2 files changed, 22 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst
>
> diff --git a/Documentation/translations/zh_CN/infiniband/index.rst b/Docu=
mentation/translations/zh_CN/infiniband/index.rst
> index a933e3c6981d..1d208d50b0c2 100644
> --- a/Documentation/translations/zh_CN/infiniband/index.rst
> +++ b/Documentation/translations/zh_CN/infiniband/index.rst
> @@ -25,10 +25,10 @@ infiniband
>     core_locking
>     ipoib
>     opa_vnic
> +   sysfs
>
>  TODOLIST:
>
> -   sysfs
>     tag_matching
>     user_mad
>     user_verbs
> diff --git a/Documentation/translations/zh_CN/infiniband/sysfs.rst b/Docu=
mentation/translations/zh_CN/infiniband/sysfs.rst
> new file mode 100644
> index 000000000000..e9a48b0b2ba6
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/infiniband/sysfs.rst
> @@ -0,0 +1,21 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/infiniband/sysfs.rst
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
> +.. _cn_infiniband_sysfs:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Sysfs=E6=96=87=E4=BB=B6
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +sysfs=E6=8E=A5=E5=8F=A3=E5=B7=B2=E7=A7=BB=E8=87=B3
> +Documentation/ABI/stable/sysfs-class-infiniband.
> --
> 2.27.0
>
