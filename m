Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA9EC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 21 Mar 2022 02:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344261AbiCUDBO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Mar 2022 23:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbiCUDBN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Mar 2022 23:01:13 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D662F47048
        for <linux-doc@vger.kernel.org>; Sun, 20 Mar 2022 19:59:48 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id l18so15388718ioj.2
        for <linux-doc@vger.kernel.org>; Sun, 20 Mar 2022 19:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lldPzKWLxp3NtUzJVbkX1jHnmHJgd1rGwmb9LyCJ8vU=;
        b=kC+Aez720DjJrn7oBb2MFeALMhIDsMaCrDEKq9ycC2X1VGM0zI7X114w+NKMWTclrL
         4r5uDk6EHaHj32mrt1Zq6gjHnSai4PILnGycWj3XUunrBmn7b2SRTl6NYwHfpL/q8zV3
         XXM9V7Ez17y8+CNCkFldHRciONURxIEBhLY3PJJ1Xw97snh5yots78k2ZgbnyHtWCIHY
         sCArs9KYCzJ3CIW3aT+qyN/jnM8sgcVtJISgyaeHrAp3DXojk+kWyH/O0tGEXFb3Uw0W
         G6PscUQu0UwXSgm3f3EufPWrqtjk533tpa5HPYIzMj3QwRs9u0b2okVWOVl5u72KBHMK
         kIOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lldPzKWLxp3NtUzJVbkX1jHnmHJgd1rGwmb9LyCJ8vU=;
        b=UR9CdBwem7nbfNo/JQkKYHtBS/EJO9kRyfUhXIvHqmY8DZfdK4mCOpj8Df7WhhdKeq
         WboLnf4AVNtnRRZiG4hbqiByRDrK+ppACBLG3c9wmqLXRP4K2UKPpP0nauXRpmQsguux
         Ak1mXEYtUbxNUGkU0Ue4fWdbrvP9YQ8E+4wsRHcip88DVzhD9c59O96EtUTXSMVn0014
         Z/siFgfQ/6UzdVCIUaE24RQQTGsjzgYyNHRpgArYT1Dx/RzNXpzt4wLz/4yMJ28TomwA
         PxYcCQI+6b1mgsszJsZULExeAYHERxB2PmmuxnnJVYG126taqfG5xRZJSFh+7GEerbHM
         W9rw==
X-Gm-Message-State: AOAM530Pc7/dGZ0uwZNNfaCxe5EjikP+3Ydivzbra+ntZonZ8BkZ7iAn
        qaSAmjNhtqredKYiAh/9QhmlL6Qkwv5FDLbX5p4=
X-Google-Smtp-Source: ABdhPJxx+X2QXuSz7Nzik9Dk2/vSniG2D81rIJV9Kh+vzlZIXEIeDDjiLPh53mdeAGsdJQdX0IkLXdjRx99SdxBtoeM=
X-Received: by 2002:a02:928e:0:b0:317:c128:be69 with SMTP id
 b14-20020a02928e000000b00317c128be69mr9721301jah.2.1647831588382; Sun, 20 Mar
 2022 19:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1647598049.git.siyanteng@loongson.cn> <939ed43ded672c98407b5fa12e5c1a9a58a86064.1647598049.git.siyanteng@loongson.cn>
In-Reply-To: <939ed43ded672c98407b5fa12e5c1a9a58a86064.1647598049.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 21 Mar 2022 10:59:12 +0800
Message-ID: <CAJy-AmnOg3EhntjPzUb9-ZV0X2J9X7L1JS3LEow8fG5bG7tPBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] docs/zh_CN/damon: typo fix
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 18, 2022 at 6:11 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> The word in original doc is: 'enabled', not 'enable'.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>


> ---
>  .../translations/zh_CN/admin-guide/mm/damon/reclaim.rst       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclai=
m.rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> index 9e541578f38d..1500bdbf338a 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
> @@ -53,8 +53,8 @@ DAMON_RECLAIM=E6=89=BE=E5=88=B0=E5=9C=A8=E7=89=B9=E5=AE=
=9A=E6=97=B6=E9=97=B4=E5=86=85=E6=B2=A1=E6=9C=89=E8=A2=AB=E8=AE=BF=E9=97=AE=
=E7=9A=84=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E5=B9=B6=E5=88=86=E9=A1=B5=E3=
=80=82
>
>  =E4=B8=8B=E9=9D=A2=E6=98=AF=E6=AF=8F=E4=B8=AA=E5=8F=82=E6=95=B0=E7=9A=84=
=E6=8F=8F=E8=BF=B0=E3=80=82
>
> -enable
> -------
> +enabled
> +-------
>
>  =E5=90=AF=E7=94=A8=E6=88=96=E7=A6=81=E7=94=A8DAMON_RECLAIM=E3=80=82
>
> --
> 2.27.0
>
