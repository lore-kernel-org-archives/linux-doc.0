Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB620C43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 09:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbiFHJBQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 05:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233267AbiFHJBB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 05:01:01 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28CE915E619
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 01:20:01 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-30c2f288f13so200801137b3.7
        for <linux-doc@vger.kernel.org>; Wed, 08 Jun 2022 01:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TsPPYJy7oWZMueokRyo8j+PEpq+an3vdvt5wLbFglx4=;
        b=ItBdNvZHRPHANQFDyUB/7kvg9kLUtR87zkTRm8DEdV6jG02Q+fSj6fzSxf+e404AcM
         zl26OlxpRbNz/oYSENe0mfWXCDh1+dEvMxIYIjIMBxTL0UJdYexjdbStdf4iMzcTfaf0
         tOxPU0U71c2Kk9/Mgx7XNWyw4oxjRuZggD6O457mwFKYlDVFRHetEolBm7KpB7ZSPrxV
         9E0BlvIL21ASe5d78bYLyj6tdNhnKRKCjOYqIl/TpTusM6eV5GacWVwkFQ8i+hBZRCwM
         JwBRSb5fdXcMtjTlyb4U68ZFNyYmgo+TP+BKnUpJYK0lAb09wpsy/KFIzdJC26wWMzjn
         VXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TsPPYJy7oWZMueokRyo8j+PEpq+an3vdvt5wLbFglx4=;
        b=DaT39cHh4iIh28hVNUr0m8MN3jtdJsWnEq/5pUx4EVSe7oan1rVoHj7o6109WjmbU4
         XBr4Z5reyuXPHQhAg/dqEGsfrUVEFoaj9xsU5DW2BsDBANobczrfIaahGBoFDaH1iJAu
         WA0Bb8OCMhRHvbMZZUIwYLaEfzcUEhaYD/3KGhyURrb72rXDtXugt6L30fJRvL2qf3kM
         +AZqz+46Obu5emcoPJjKt/cF6YaSNj+QniE40sA2rU1WhGlQUvipC6Xwg28CG+gtixYa
         jgF54Tbylsphn6LHkR7zykHzIYSeLG4x7JLk8iQOClLh3PFXVLnO+LA8BWxvoGkPuOQX
         orWw==
X-Gm-Message-State: AOAM530et+QxbvVhL7mJd86It7s1YaEKjKB7I7S+Fq6x2Kz++sxhF4eg
        esm7tDhMtmAzgrsYa5X9CItdPGmZnkTujOUnWcM=
X-Google-Smtp-Source: ABdhPJwSnir2TtngnKeKSStBfVIIFcoOcNM7qytoq5/pB+7qtxJHrnJxp7pf3Wa6dEIMgYzopi1J6l9wACMdy1RhSoc=
X-Received: by 2002:a81:a95:0:b0:30c:7063:ff2e with SMTP id
 143-20020a810a95000000b0030c7063ff2emr35916855ywk.65.1654676400588; Wed, 08
 Jun 2022 01:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654652729.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1654652729.git.zhoubinbin@loongson.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Wed, 8 Jun 2022 16:19:49 +0800
Message-ID: <CAMU9jJpCXt1eD3NuPy6XJxarcAnn9AdUmOBwWPZQ2NwjqJLH_g@mail.gmail.com>
Subject: Re: [PATCH 0/3] docs/zh_CN: riscv: Update the translation to 5.19-rc1
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Wu X.C." <bobwxc@email.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> =E4=BA=8E2022=E5=B9=B46=E6=9C=888=E6=
=97=A5=E5=91=A8=E4=B8=89 15:55=E5=86=99=E9=81=93=EF=BC=9A
Hi Binbin
>
> The content of riscv Chinese documents lags behind the corresponding
> English documents, and the relevant commits are updated synchronously.
>
> Binbin Zhou (3):
>   docs/zh_CN: riscv: Update the translation of features.rst to 5.19-rc1
>   docs/zh_CN: riscv: Update the translation of pmu.rst to 5.19-rc1
I noticed that in 5.19-rc1, this document no longer exists, so we can
write the subject like this=EF=BC=9A

docs/zh_CN: riscv: Remove the translation of pmu.rst

>   docs/zh_CN: riscv: Update the translation of vm-layout.rst to 5.19-rc1
>
>  .../translations/zh_CN/riscv/features.rst     |   8 +
We don't need to translate features.rst.

Thanks,
Yanteng
>  .../translations/zh_CN/riscv/index.rst        |   2 +-
>  .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
>  .../translations/zh_CN/riscv/vm-layout.rst    |  37 +++
>  4 files changed, 46 insertions(+), 236 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/riscv/features.rst
>  delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst
>
> --
> 2.20.1
>
