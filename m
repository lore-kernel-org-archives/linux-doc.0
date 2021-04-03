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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8885C433B4
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E054610CC
	for <linux-doc@archiver.kernel.org>; Sat,  3 Apr 2021 03:11:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236037AbhDCDMA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Apr 2021 23:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235942AbhDCDMA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Apr 2021 23:12:00 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3905DC0613E6
        for <linux-doc@vger.kernel.org>; Fri,  2 Apr 2021 20:11:58 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id s21so3483787pjq.1
        for <linux-doc@vger.kernel.org>; Fri, 02 Apr 2021 20:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jfZPj9D+1AHhx/8yvFym0Kj4KLJAyHACIVweBS+O3OQ=;
        b=rep4g2GBYoCuBHpCtRzWzKnqYaLkwPRYe7KVsJX92pJ0Cp3dfmSC6iDV086xu3Uqmb
         MMq8A1CNszwBHxiprQRj00gr+qH3huiqk6gdVbOqzwapgqVIElDiqCuaRUHD8EbnHdIF
         R68K+U8MBW9uChbZqAdTUm98MHQlGKzTPtIhInOoiers5eKZPDaODWfSWsSTZVHZPXa9
         HhHSmZ/rjZO4RqtyNaeTJPz4xOKzDFUWKUVO2CZwZxFFBxhTR9mSiVMRq1lS05gKxekL
         kR54rzmcSEU5ssk8jh1BtdsaL4th/hx0cBCgbXhqwlMTGqszE9EdQShJbMoVuYrBs2Nx
         lImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jfZPj9D+1AHhx/8yvFym0Kj4KLJAyHACIVweBS+O3OQ=;
        b=OnUvdhZCG6YjBZbGY46kNmjFFq+hAG750rA1xsjjKrLu9r6K0vq7UxFjtGF2+7Oagr
         6u6nq0dql/tOxUH8fe4q8e2fOnoLmTEZyGBUO2VRtELItWC2YuXbJYELn/o62xCAIZcI
         2ZiU8CTF8LCILoCMQ6zYxPUeJ9OVv97T6g3RJ/JoWDbPNDC6SQF2jMFPo/lWy/wRgSva
         U+btz98RcXw0Wx3OjpxT1KMZJLQhOkQJp3jKghpSIfGQq3utskKqqPNOz8vb5VgFhAGo
         MvDt54Ln+SoKDBGLnp6e0xMnwFDP6dPfW0xP7vkbkgK+hkhQgjBq5OxPHwpIa4bb22Se
         /w3w==
X-Gm-Message-State: AOAM531Bhxa8i+kblExzEKr07w3mWPQr1eGxBr2eAh7MwCZC4mevdYUO
        k9i8tmlI9xK28rAFA/pKW3bRJt/AiMs5i8YtkZM=
X-Google-Smtp-Source: ABdhPJwfrf+eVRfb1OBiJ9nFK1Bpxyq552ugJ/Wa52xuBlFUZuscUjvgEihZ2dWFcrd4L+eXA6RSWuDfMewE5yM21gk=
X-Received: by 2002:a17:90a:65c3:: with SMTP id i3mr16000108pjs.24.1617419517874;
 Fri, 02 Apr 2021 20:11:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1617412012.git.bobwxc@email.cn> <f05359d330dfaf3befda5b81e552020c844f72c8.1617412012.git.bobwxc@email.cn>
In-Reply-To: <f05359d330dfaf3befda5b81e552020c844f72c8.1617412012.git.bobwxc@email.cn>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Sat, 3 Apr 2021 11:11:53 +0800
Message-ID: <CAMU9jJoEannhc5Nk-w93Vs6YC_mBjruJKY5Z9oYpDQe0NjEpGQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] docs/zh_CN: Add two image example files
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
> Add two image exaple files used by zh_CN/doc-guide/sphinx.rst
>   Documentation/translations/zh_CN/doc-guide/hello.dot
>   Documentation/translations/zh_CN/doc-guide/svg_image.svg
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  Documentation/translations/zh_CN/doc-guide/hello.dot   |  3 +++
>  .../translations/zh_CN/doc-guide/svg_image.svg         | 10 ++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.=
svg
>
> diff --git a/Documentation/translations/zh_CN/doc-guide/hello.dot b/Docum=
entation/translations/zh_CN/doc-guide/hello.dot
> new file mode 100644
> index 000000000000..2740ad882e6a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/hello.dot
> @@ -0,0 +1,3 @@
> +graph G {
> +      =E4=BD=A0=E5=A5=BD -- =E4=B8=96=E7=95=8C
> +}
> diff --git a/Documentation/translations/zh_CN/doc-guide/svg_image.svg b/D=
ocumentation/translations/zh_CN/doc-guide/svg_image.svg
> new file mode 100644
> index 000000000000..5405f85b8137
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
> @@ -0,0 +1,10 @@
> +<?xml version=3D"1.0" encoding=3D"UTF-8"?>
> +<!-- originate: https://commons.wikimedia.org/wiki/File:Variable_Resisto=
r.svg -->
> +<svg xmlns=3D"http://www.w3.org/2000/svg"
> +       version=3D"1.1" baseProfile=3D"full"
> +       width=3D"70px" height=3D"40px" viewBox=3D"0 0 700 400">
> +       <line x1=3D"0" y1=3D"200" x2=3D"700" y2=3D"200" stroke=3D"black" =
stroke-width=3D"20px"/>
> +       <rect x=3D"100" y=3D"100" width=3D"500" height=3D"200" fill=3D"wh=
ite" stroke=3D"black" stroke-width=3D"20px"/>
> +       <line x1=3D"180" y1=3D"370" x2=3D"500" y2=3D"50" stroke=3D"black"=
 stroke-width=3D"15px"/>
> +       <polygon points=3D"585 0 525 25 585 50" transform=3D"rotate(135 5=
25 25)"/>
> +</svg>
> --
> 2.20.1
>
