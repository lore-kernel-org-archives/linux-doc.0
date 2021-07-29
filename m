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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4216AC4338F
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:28:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2925D60184
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jul 2021 13:28:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237350AbhG2N2E (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jul 2021 09:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237344AbhG2N2D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jul 2021 09:28:03 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93966C061765
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:28:00 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id d10so5851900ils.7
        for <linux-doc@vger.kernel.org>; Thu, 29 Jul 2021 06:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KI1i7uU3JTw/akaFbMNOkE6NPB1HzxIE29LHcEmVOsk=;
        b=NzX4K9ochoJBTVoNdvtfZWkBuKTHPeewGhen9NrVllWThadWWJ7ndkzV+QBcmCWuag
         ib2P/u+H37jQs73FEDVQaD0p3b27vGQSAHlA8cUUJ95zjIl+7/zCMH1N3SOSoDsPoahi
         qSgUrvgn+0Z6iBFYRpbhXZBN5xLj2/dySim8/O2WkgRyYcLIqQb4GETe//PyErDXOOgN
         Il/wWRsIDAJF97KE7c2M0g/HGTtSIeIko1rW8lSDJmJRZq1ZzrT+xYaoMB3w0RbFVj1A
         x8tdNHINSkKHE8dRqPRrgRvu4B7kyKUG1zSlNs9c6yjtnTIDCnsHmNYmlAjVoLniNuXS
         1MrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KI1i7uU3JTw/akaFbMNOkE6NPB1HzxIE29LHcEmVOsk=;
        b=Rb+wd6PXClHqsE3y2ofrP5+WiY8p/0fsvPuUb6I/m7tL/NZLM0lUVNqBUn93sfko/j
         9DDq2tcdhBBYGcxUi5KrtonTd82ZdejBi7MLzWXl3M3OQenaxpXTPhdGoF/OwqXV1r3n
         dBAJJPF7QSuVQiYemkI62Zr3VQQt/1uZNch71HgpVj1i+b2vtUYwTkeeZYj6BkwVYUrB
         /CFihiPP/vrdbsd7RNyIZiD8VOLwdqiHKU4ii7SHDyaSTD9ctC5NV7EMqm/3AdZycKy/
         95ULskMIaFP4o1/qWzb7Ekjf6TPu7L6YHvGij+WV+qhHF5/VGNIN6mnIDSyen70qxfFG
         EENQ==
X-Gm-Message-State: AOAM533BQ8EEuF3nvtcxhxWXEk+oVYtrFyh7HJhcCnI3GHKEH8w0cwUI
        xvbYzS/z2SE+UxNn/mTMrA7Cs+sKdAXGK6fvbwkEsBAsKpioMQ==
X-Google-Smtp-Source: ABdhPJzpQkwma6oayAlkIiTOdeFpGvs7a/Q4Zn+P47kwlHiJQFlIO+GOhl9Hy3SLm9hUHO2g4sOgyP9AcaieMuIASRI=
X-Received: by 2002:a05:6e02:78c:: with SMTP id q12mr3891150ils.243.1627565280115;
 Thu, 29 Jul 2021 06:28:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627007852.git.siyanteng@loongson.cn> <e0f2e665b5492c41dd51d1b54457c02d6c63ef94.1627007852.git.siyanteng@loongson.cn>
In-Reply-To: <e0f2e665b5492c41dd51d1b54457c02d6c63ef94.1627007852.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 29 Jul 2021 21:27:23 +0800
Message-ID: <CAJy-Am=RXPQGuVFefufCpWvLGO8px5-vsXnVQDpD3fQ8GtCSuA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] docs/zh_CN: add virt index translation
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

On Fri, Jul 23, 2021 at 10:45 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Add virt to .../zh_CN/index and translate it into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/virt/index.rst         | 37 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/virt/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 1f953d3439a5..f8f9fd1d5b09 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -97,6 +97,7 @@ TODOList:
>     iio/index
>     sound/index
>     filesystems/index
> +   virt/index
>
>  TODOList:
>
> @@ -122,7 +123,6 @@ TODOList:
>  * spi/index
>  * w1/index
>  * watchdog/index
> -* virt/index
>  * input/index
>  * hwmon/index
>  * gpu/index
> diff --git a/Documentation/translations/zh_CN/virt/index.rst b/Documentat=
ion/translations/zh_CN/virt/index.rst
> new file mode 100644
> index 000000000000..f5c922bbd8a8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/virt/index.rst
> @@ -0,0 +1,37 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/virt/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +.. _cn_virt_index:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux=E8=99=9A=E6=8B=9F=E5=8C=96=E6=94=AF=E6=8C=81
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +TODOLIST:
> +
> +   kvm/index
> +   uml/user_mode_linux_howto_v2
> +   paravirt_ops
> +   guest-halt-polling
> +   ne_overview
> +   acrn/index
> +
> +.. only:: html and subproject
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.27.0
>
