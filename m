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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8846BC4338F
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:30:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 645A460F01
	for <linux-doc@archiver.kernel.org>; Wed,  4 Aug 2021 02:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhHDCaX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Aug 2021 22:30:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhHDCaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Aug 2021 22:30:23 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F15FC06175F
        for <linux-doc@vger.kernel.org>; Tue,  3 Aug 2021 19:30:11 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id k3so458760ilu.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Aug 2021 19:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xSVRaFFSO9oPGp8bWRJkLAoUy8+jLvppk9ZqZAswfT0=;
        b=a6xrQuI0b21YuYlxAemNDJxBYlOTUyNoCufIBMFMkoEBSimAlgZLlxwhw/PEFfXzgG
         5VvPO/AzH0qZ269wpB+80+ErSKnZGs4VTUthc3ap7zdzm97zF+kt12MPrpixSumFNQYO
         geLFZ00U9+JRyKu8h4zVGW7lWyudFa54ah77JjLyXow3pY3bvPcGNNJvWVPfyWofVqk1
         hwrjrGttsg4P3GbNf8RR6JvekWlkA4hSW1MRgFebH7gylb9jJgZhgF9NY+Mtp5O13L+5
         2Lh5hWFhBnkRYNpmXRLsCRMlccTVRFix7yowNqTRdCFIi7aCMVEFCV47EBWjhaGo9gLh
         ANCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xSVRaFFSO9oPGp8bWRJkLAoUy8+jLvppk9ZqZAswfT0=;
        b=jSeslgDVuAW50KTqLyxsWpYA/H1XcElwQQQCcos+JWZTZ1zSVzL8Ibk9BRVK/nf6c3
         tq9tA6nYah695vFUNpnKkmrEIhOekPFFODNYWHrwuEf01U9qjy9691y+usDOOlfu2K72
         bJ4RL8u3gXP1ilfgqk+L8CN4ahQA9UrDlpzGetDA1iIoljqf+qB7atXNXrU8wWWZ+oiw
         pQDNU656FQiA0sn6ZmQOq94sVcv285q3Jq35gRrKYhVJCtFUGREo+iE/xdhEJJlhkHIR
         jo9TrKfXALU6W+2hafumoGbZS6Rgvf0bqnCp1lIvviWqvqXcYZoVoaTnG8D5kZwng9C1
         Bfww==
X-Gm-Message-State: AOAM533UkgpguSUwh1n4uELFiVZv3Cp2XDZRIJXmMHlRl6ct0IrOSXpF
        L5RX2gy2zQHCywmgrieOtxMxFoE7znO8mi3Ux5s=
X-Google-Smtp-Source: ABdhPJw90ewT/noGPq3Y2yjklS0nh6+4lH0e5hYpYYFcLiAJJOyWyBav70F/B7RkitLi2r9PQEqLa3zAdWxdEAU0om0=
X-Received: by 2002:a05:6e02:2188:: with SMTP id j8mr411976ila.14.1628044210905;
 Tue, 03 Aug 2021 19:30:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1627820210.git.siyanteng@loongson.cn> <e00e8cb6affb5c281b8f8810ccd05aca81653c60.1627820210.git.siyanteng@loongson.cn>
In-Reply-To: <e00e8cb6affb5c281b8f8810ccd05aca81653c60.1627820210.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Wed, 4 Aug 2021 10:29:34 +0800
Message-ID: <CAJy-AmnqcWZ_Yahw3JujmV-vTTx+b8c1MsBVHqw=qX6rxvj5sg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] docs/zh_CN: add infiniband sysfs translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        chenweiguang82@126.com, yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 1, 2021 at 8:25 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> Translate Documentation/infiniband/sysfs.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

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
