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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675EDC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CEE961040
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 03:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhHDDBV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 23:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbhHDDBV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 23:01:21 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4816EC061575
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 20:01:09 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id r6so810134ioj.8
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 20:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mZJPXr2xCElM6pyx0uS3nuPF3Aq4RsXyqFWTzpc9X/Q=;
        b=CDKv0CDuOVARRiCnWvg3WeQ3fe2SmIXbJDge7X/D1WIOPL8mgVsaswn5If9mAfp8CY
         tYTZXFJi8br993N2bbgGfi6+leOAAqAnR236U3Qxkg5OOQvIc4rd5tY+xZu/l5REK9lr
         vJeXKqk8l4VIxIVoMuf3BKFy5Pt/Wq7jcZkZ8nQuPajSnf3ucJ4G7TCHa5qJX3rxJ8Bs
         DRlpVK9mlnWiFf5syYwABH6hmY6WQrTQdEBbEeyFvwHgwBSyfw+FBjVfvZD63njHt7/v
         M0yi4DBW+OaHVaMYrH+SKtvy9J+kunYuSx/mjqLpD47lYlYrrDCGXJ9m0aY2jw/tvGe9
         l4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mZJPXr2xCElM6pyx0uS3nuPF3Aq4RsXyqFWTzpc9X/Q=;
        b=fa+O4dywhkQk14ACThldT7GJqJYiXrNYY5w2bSbT/mP8EJojV2xgEag94gR4ekeDLg
         pvAX0NMSGZ+iUNX+FkYCtdXThvq+D/Nq7bCStZsFj9VOAxBbuylGcAlDHiCPpwESwMCs
         xqoexHaJITEB2BHoSnhHESnmkwGz+nuR+4ZfRqGOnbWe9J7q2+Ip582YyUmKoQ9R5Nw7
         9EsmKtqMiYLSsCqzoTnpQqF+pTc+puyDcRiE+8DflDZybvlVqT6oO5XYarHl8WgSlJYK
         lmDXCg+x2iYhLr9upooY5rVyAWLYqZRSNLjevQfH7CIboVq1vgexwtf/nVlaOMJNt3yk
         H5Iw==
X-Gm-Message-State: AOAM532MOkGobt+Cioxcu6Rz9j/NckpTL1zOSNzgCmHOHEznCJbw7xjj
        GDvMO61ndEcd5y0+zdvScUcVn6qFIG3SC/zja0g=
X-Google-Smtp-Source: ABdhPJzLGroFmlpmHofE05rNMUsnVcFPd036SwrWtCtTtV/oIvUCijAGzDObygH0aYtSmJFIHjL8eoa2F0fg/HvTLuw=
X-Received: by 2002:a05:6638:1af:: with SMTP id b15mr21748476jaq.124.1628046068693;
 Tue, 03 Aug 2021 20:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627823347.git.siyanteng@loongson.cn> <d26d719b6dff289f39431240ae3d33b9d1a72fa9.1627823347.git.siyanteng@loongson.cn>
In-Reply-To: <d26d719b6dff289f39431240ae3d33b9d1a72fa9.1627823347.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 11:00:32 +0800
Message-ID: <CAJy-AmnwAsLa+-zniFuatLeN9zH2bLyV2vHHdOk_kqz_VAmOKg@mail.gmail.com>
Subject: Re: [PATCH v3 5/8] docs/zh_CN: add virt acrn index translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenfeiyang@loongson.cn, chris.chenfeiyang@gmail.com,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 1, 2021 at 9:32 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/virt/acrn/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  .../translations/zh_CN/virt/acrn/index.rst    | 27 +++++++++++++++++++
>  .../translations/zh_CN/virt/index.rst         |  2 +-
>  2 files changed, 28 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/virt/acrn/index.rst
>
> diff --git a/Documentation/translations/zh_CN/virt/acrn/index.rst b/Docum=
entation/translations/zh_CN/virt/acrn/index.rst
> new file mode 100644
> index 000000000000..6061e790ee83
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/virt/acrn/index.rst
> @@ -0,0 +1,27 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/virt/acrn/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> + =E6=97=B6=E5=A5=8E=E4=BA=AE Alex Shi <alexs@kernel.org>
> +
> +.. _cn_virt_acrn_index:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +ACRN=E8=B6=85=E7=BA=A7=E7=AE=A1=E7=90=86=E5=99=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +TODOLIST:
> +
> +   introduction
> +   io-request
> +   cpuid
> diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentat=
ion/translations/zh_CN/virt/index.rst
> index 8e7713163962..f8dd13681341 100644
> --- a/Documentation/translations/zh_CN/virt/index.rst
> +++ b/Documentation/translations/zh_CN/virt/index.rst
> @@ -23,12 +23,12 @@ Linux=E8=99=9A=E6=8B=9F=E5=8C=96=E6=94=AF=E6=8C=81
>     paravirt_ops
>     guest-halt-polling
>     ne_overview
> +   acrn/index
>
>  TODOLIST:
>
>     kvm/index
>     uml/user_mode_linux_howto_v2
> -   acrn/index
>
>  .. only:: html and subproject
>
> --
> 2.27.0
>
