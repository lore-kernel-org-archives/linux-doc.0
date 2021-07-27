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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B56C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 15:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 439F161B70
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 15:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhG0P4Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 11:56:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhG0P4Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 11:56:16 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0222C061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 08:56:14 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a26so22411501lfr.11
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y/6wmDRUV3Mq45U7QKG9NK88Z/ryWCvRF5mIeEZ3jBo=;
        b=aDhMRhEtcNuhtYUN3kGak42piGDX+1usqnhXZ5F2v5PDvqJ+8XAbG43lFh4iV/o3ju
         tObbLoWyWdO8FdAhi69N2bABtynT4lI6gboqalayHRuWvrWpQZHBMbXFS5RhPJsOMaYX
         rsR0/bAP7b08+y6uLtujOLy6JGP6uOnbrOkFgUrIcD7aRtBLs3Tfnf5BpZMDDW1LKbSm
         4VvqtchOjl6oPZsOQElAXx6VWDT9YZ04s4aPATid76DB7tYJrCyLLIHJQqW6Ajs/BuXB
         IiWV6s84fGw65IutacdE7ovdGPD2C8U2Yrlg1JrKCBDr20bg746LN/5oQr5LqT161fdr
         zYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y/6wmDRUV3Mq45U7QKG9NK88Z/ryWCvRF5mIeEZ3jBo=;
        b=bDNglaOA7xOxptUI/tBIEX2x+XJx8XEncGWp3huODFVDzoqRn/bnxFQAUT6A1ZE9T5
         lh8as7vPf/YpghYSsLx75bLNASshZY3Bvdp9tHAlrBfTey50MgnGsFvAv8ttCliivQWE
         RBe3UtfyN2dWN/1Vcr+1yXBUUffL6Szn9BADVMMKCvPDLMfMjo3d4qPC1vufpjvbuaeN
         PHXlWf8GdUBuIe89HwDDK9Su5aI7K+ZLdSCVY92g3tyqDAxczm1hhMeWsaO/Bfa9OK2W
         mboUfp0LmuDpIQmE29+koPnECJ3ycN0VJZdq2Jzp73bUCzriwawKlW7cPAQCbjRSBQvw
         B8mA==
X-Gm-Message-State: AOAM530+yVOxRMLMxmCpGUu5xg+X+W7eZpOKyrwKgigB0QmREdsOi4Y0
        XksN2iYEKdMmNJ+kgwKGATN+0WptJO1MEuwoWT4=
X-Google-Smtp-Source: ABdhPJxSyyf03JGqlBKi47AVxnqPJxF2JkDLHPQwppzhGU9QREOVNI/I36a5i93dC6XoHEBojyH0lAzvJmb+sL9xotI=
X-Received: by 2002:a19:5f04:: with SMTP id t4mr16740662lfb.297.1627401373298;
 Tue, 27 Jul 2021 08:56:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1624525360.git.siyanteng@loongson.cn> <2d78245c7ae3972435913691d1a1bc9c2e7332d6.1624525360.git.siyanteng@loongson.cn>
In-Reply-To: <2d78245c7ae3972435913691d1a1bc9c2e7332d6.1624525360.git.siyanteng@loongson.cn>
From:   Puyu Wang <realpuyuwang@gmail.com>
Date:   Tue, 27 Jul 2021 09:56:01 -0600
Message-ID: <CADQR0QhLDQoN440rsdvxVqDfaw38WgzpN-d5PD8y-ospfjPo5g@mail.gmail.com>
Subject: Re: [PATCH 1/8] docs/zh_CN: add infiniband index translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com, chenhuacai@kernel.org,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dear Yanteng,

I think in most cases there is no need to translate "Infiniband" into
=E6=97=A0=E9=99=90=E5=B8=A6=E5=AE=BD (It is not the official Chinese name).=
 You can use Infiniband
directly in the Chinese context since it is actually commonly used.
All best,
Puyu Wang

On Thu, Jun 24, 2021 at 3:06 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/core-api/infiniband/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/infiniband/index.rst   | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 1f953d3439a5..90bdc3db7f8f 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -97,6 +97,7 @@ TODOList:
>     iio/index
>     sound/index
>     filesystems/index
> +   infiniband/index
>
>  TODOList:
>
> @@ -111,7 +112,6 @@ TODOList:
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
> index 000000000000..2ad0b3714443
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/infiniband/index.rst
> @@ -0,0 +1,39 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/infiniband/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> + <sign>
> +
> +.. _cn_infiniband_index:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E6=97=A0=E9=99=90=E5=B8=A6=E5=AE=BD
> +=3D=3D=3D=3D=3D=3D=3D=3D
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
