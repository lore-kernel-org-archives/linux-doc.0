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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A373C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:48:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2CA7722241
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:48:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731203AbhATBsC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728829AbhATBrz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:47:55 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94563C061573
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:47:14 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id u17so43874503iow.1
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5+WhwzNRDpmWcjMswnWq7E2yb90Yz7CDT/ASxX9uTR0=;
        b=DRFzXjwMHdy+hp3QFZ75qgsM2DMUTCu6U75uWV2VOGqXS0/FMbGYG/AzxizWr/Scs5
         Qc50Id8JeUBRxixIIvxskSBvu15A1fcg/gA5rLzShWXI4/XcZa1pe7sWgcneP8uhKh3S
         FUoRfvO63ilUUXKt5pY7LrtBdxErGk3+hgJGWVPmy8C/Ojm9q2ygOcQONjivcqXQ4dgj
         wEYXFWlZT162jiZh+r43cV0FYYz8J5+1qZk4No8XuJcJD+aPSbCGbyYLF00ylOjNjWiM
         0phQoeusbKN85SOewFITjBGrJKePhWfB7vtIceeQuthp86eGwppeq605v9GVsu3ahi5T
         vFbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5+WhwzNRDpmWcjMswnWq7E2yb90Yz7CDT/ASxX9uTR0=;
        b=CyewnRyGHeD8HgsnwBcwASX2LVg6FbvL++CaJCwbv4A50VaOMYVqu0O15TEZEJhIR0
         aLFCGNS6IXoDMjgiwiRLDXOh4YTx0+smAXzrOsUKplOqp0PUfr1cHxWjTowi4R3cBZ04
         k6lESdeN20itG2Wk0m9o+aL1kavoJInYK9l8o4HIOVT2e0vHQVXHh1PEZdf5zJTBFkme
         0gKCzN4XiQ1SrI880BpBrOi3S0kOKXaOhgKwXHMZRNfYz+vuVoMHWu4iX8ntT7qJTcmR
         Quv5HNqcNcESMYgC+OWIAuPLjuGmprGWPWWGm79VozHHihZwAI8CTGVslrpONKM/sV2B
         MRQA==
X-Gm-Message-State: AOAM530Ss7DEoSI1bItuRQdu2ythBksrH5omNN64H/q/bPgQJgrK6cmA
        Wp7yvsTMuwDIddRpeLC/luwKpwMXqOVBpugGzAI=
X-Google-Smtp-Source: ABdhPJy62kEQieTeSA2J6yIZv87/eimIurRXjgMBcYObkijzPEWlGzRbQX6wsV0E6cxHBZ9oOfiSoU4rOcHt2SGgrds=
X-Received: by 2002:a02:969a:: with SMTP id w26mr5871142jai.96.1611107233884;
 Tue, 19 Jan 2021 17:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
In-Reply-To: <20210119074617.3109276-1-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Wed, 20 Jan 2021 09:47:02 +0800
Message-ID: <CAAhV-H6C+wWaSHe+zpsGJ=bGeRqsQK3aYJU3KTEB204dYMfHCw@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs: zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, Yanteng,

What is "MIPS" in the title??

Huacai

On Tue, Jan 19, 2021 at 3:46 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> This patch translates Documentation/iio/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/iio/index.rst          | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/iio/index.rst
>
> diff --git a/Documentation/translations/zh_CN/iio/index.rst b/Documentati=
on/translations/zh_CN/iio/index.rst
> new file mode 100644
> index 000000000000..88b6ba5f233b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/iio/index.rst
> @@ -0,0 +1,20 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../iio/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_index:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=B7=A5=E4=B8=9A I/O
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   iio_configfs
> +
> +   ep93xx_adc
> --
> 2.27.0
>
