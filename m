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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724D1C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:40:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D22823975
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 09:40:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728658AbhAUJkF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:40:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728383AbhAUJ3F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 04:29:05 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4E7DC061757
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:28:24 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id h11so2629305ioh.11
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 01:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NSmskaQzCxd6S1zpafdVN+iroBrtoxVQVW1pdkIa5Cg=;
        b=ATFm59HBGSbFnv3oCk466zKTQZOhZSd7T8PLYirndnvQ1THUzDFmLW9WybfuW4qY6b
         NcYKEkwSxNWAT95vOGPlzf9sH7LYKIsWjZT72+DIoBxvFky/drLO+cV1oorGCVl4Jrj/
         f0mvm+/IC9U+f7ePsDwIsTMRMO3mavSZaCeLyJaCbTivC9/5aNzjTwBLyreV4CR8einW
         bZ8jAc+Roj0pSHt98UXoObvouDcGkMnApOw99sRmozlk5puohRL3Ammb3K6Bfm8qIpMs
         1cEh7kSuKP5mev+A2/XMEMf7gBusBtG7NzfcTw+wAVVyKrkXrPguM0ySMshgb5ZKOzHk
         eI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NSmskaQzCxd6S1zpafdVN+iroBrtoxVQVW1pdkIa5Cg=;
        b=mse1L0cI+hP7kGLEAsSS0cRi6hE0+nXVPcURjwdiHbhsvPcrxsYvqKDabqvHkpdol5
         kDsvw2vrOyi6zL1d/126b/C4TOanCMo4XIzwtxRSFWV2F+9irIykLsIUtiDoeUhkFOj/
         jOw37hwtUyh5Ocdj1mpBtWy0BSwHU0jOUSpr/SOYT1FpuartzdZA4ZIphzYSkaF12kcs
         HCutmAOMRmnHaxFx6XSHlBuqyMHYl53iSpcAp+f1sCoJmF9/ivnD8OZfEHD+WBLn0jQ2
         2Z2WZBpa+QwQeMt6wp9AkwgBBeYj/T9zulYJqTcxaAINWfPTE39DtIGz0NGDN0s5jwrX
         WEEw==
X-Gm-Message-State: AOAM531aEYKvf5lmbRbA+j+ZGiwU8XW0CYR5GAonqRxmJzI9TIGZg8z0
        W6AIJc+maAhMdSZSJKnJ+mQRjJmE9SF2CMRY3AE=
X-Google-Smtp-Source: ABdhPJzjZAjS1KK2+lfyiI9m7ByYnJ6txFhnMFD1Hfb0Va1snkViM5Ipej3HxX5Q9gJ6NtXuENLCWEXe5+t5OJNZBWU=
X-Received: by 2002:a6b:7f45:: with SMTP id m5mr9835652ioq.180.1611221304358;
 Thu, 21 Jan 2021 01:28:24 -0800 (PST)
MIME-Version: 1.0
References: <20210121033302.558935-1-siyanteng@loongson.cn> <20210121033302.558935-3-siyanteng@loongson.cn>
In-Reply-To: <20210121033302.558935-3-siyanteng@loongson.cn>
From:   Huacai Chen <chenhuacai@gmail.com>
Date:   Thu, 21 Jan 2021 17:28:14 +0800
Message-ID: <CAAhV-H4itVrn_1tA5gLQGPe9fOoe=Mx3pzKFMfKbe-E=A7DPfg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] docs: zh_CN: add iio index.rst translation
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

Reviewed-by: Huacai Chen <chenhuacai@kernel.org>

On Thu, Jan 21, 2021 at 11:32 AM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> This patch translates Documentation/iio/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
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
> +.. _cn_iio_index:
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
