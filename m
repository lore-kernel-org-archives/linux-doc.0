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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFB0C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:10:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDBCB611CC
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235979AbhDCDKk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 23:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhDCDKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Apr 2021 23:10:40 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D0FC0613E6
        for <linux-doc@vger.kernel.org>; Fri,  2 Apr 2021 20:10:35 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id c204so892800pfc.4
        for <linux-doc@vger.kernel.org>; Fri, 02 Apr 2021 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=QS5cj1fj/12Gjz6KRUWFU8we4wF47npgi+U8WH/Y+iw=;
        b=LduQ3EIJhYGr4rCj8XONPBflihtEhbw6LEvS7OMmXtj/+/Q7V1COFR3IM8zzcpWvOJ
         tScXrMHcKuhtnO9mi+yNfEQ3R8PUzBN9QIrG0MULwMLJhPyW/Pa/Bn1WNyoHIr8UF6tI
         CGlIaa1xDkOYq8zx9uCN1yaelbNCweINn7si0x8ldBi1DxDv7wDCUZxUBaqrG8MuWoAE
         lcZxAMWFyga2Bvzn54Vzd8Qrvta7cPNGl4hyc2KKShtXJjhqXQ1t7ApEtG/yheMQ403Y
         ovKkkHvIkobCMLeqIgQt+RdkhcxNB6klZhiZWtWyL3Kn1RFIz7uN1OJeSw0mvupLPWvG
         olNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QS5cj1fj/12Gjz6KRUWFU8we4wF47npgi+U8WH/Y+iw=;
        b=uA2Gt9cv8c0WrdHHIb3fTgatv5xJ7GPC8m2hmT6Fzad9iCYt/Km5Sj5vG21OuvW0fD
         de/TYF6gGZr59vBsnCs/RzYtxVbAkbZtGRBbxMyf8OzAkx4Q5W4qw2iDvVjYLN5ZYDa6
         UYvzj/zf9dh//XkSc+BuwTeWc+WvSyX1yHjYxdpcNDZ2HmHLphQilBL8B4Szkjd/ctIK
         lTj5WNfyZL4AD0SZu3/v8obgo709ClR7s+1yPEsxWMMTkFr38sDLnzoX+4zH5JLLOeSs
         ViscmdDSI2CmmvUqjUVsPBrAmAqDuIFSt0lPDbzdUjoJkiJbJtBcHgkLoW3TXDKI81i0
         itTg==
X-Gm-Message-State: AOAM533JGpPCx2+BT5JNfpdqjO/P+Pe91QGuq0iismu/0YBcaAjYRxdn
        Gcdw9KPiNKhe+VY+NyRit0qHdLMwPd+yHAlp/R8=
X-Google-Smtp-Source: ABdhPJyR9PbSLSc6ai/NeLRz5fx4sCFwYOsLq2tzxzt7Xh9MnssSlhpVE4oqnL88LCd/iiqrOeCvwUPn4P0IAz92KBk=
X-Received: by 2002:a63:d449:: with SMTP id i9mr13804507pgj.227.1617419435231;
 Fri, 02 Apr 2021 20:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617412012.git.bobwxc@email.cn> <066b972c0ef496004dcd9a2c6adff4a53504b600.1617412012.git.bobwxc@email.cn>
In-Reply-To: <066b972c0ef496004dcd9a2c6adff4a53504b600.1617412012.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Sat, 3 Apr 2021 11:10:30 +0800
Message-ID: <CAMU9jJqqpRncO0SYx=KB3tiNixSndocGqynNrG8EXkndy6E5Aw@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Wu XiangCheng <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B44=E6=9C=883=E6=97=A5=
=E5=91=A8=E5=85=AD =E4=B8=8A=E5=8D=889:24=E5=86=99=E9=81=93=EF=BC=9A
>
> Add new translation
>   Documentation/translations/zh_CN/doc-guide/index.rst
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../translations/zh_CN/doc-guide/index.rst    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
>
> diff --git a/Documentation/translations/zh_CN/doc-guide/index.rst b/Docum=
entation/translations/zh_CN/doc-guide/index.rst
> new file mode 100644
> index 000000000000..b835c8d95f0e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/index.rst
> @@ -0,0 +1,30 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/doc-guide/index.rst
> +
> +:=E8=AF=91=E8=80=85: =E5=90=B4=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@e=
mail.cn>
> +
> +.. _doc_guide_zh:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=A6=82=E4=BD=95=E7=BC=96=E5=86=99=E5=86=85=E6=A0=B8=E6=96=87=E6=A1=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   sphinx
> +   kernel-doc
> +
> +TodoList:
> +
> +* parse-headers
> +* contributing
> +* maintainer-profile
> +
> +.. only::  =E5=AD=90=E9=A1=B9=E7=9B=AE=E4=B8=8EHTML
> +
> +   =E7=9B=AE=E5=BD=95
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.20.1
>
