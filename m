Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1362C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 11:39:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90421610FD
	for <linux-doc@archiver.kernel.org>; Thu,  4 Nov 2021 11:39:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbhKDLmg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Nov 2021 07:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbhKDLmg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Nov 2021 07:42:36 -0400
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69536C061714
        for <linux-doc@vger.kernel.org>; Thu,  4 Nov 2021 04:39:58 -0700 (PDT)
Received: by mail-io1-xd31.google.com with SMTP id b203so3029294iof.10
        for <linux-doc@vger.kernel.org>; Thu, 04 Nov 2021 04:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QSz7ZphJmFLMqu+qJ0p3jpW5r9AffgvwSteuu1rHcS0=;
        b=D18Tw5LGORSlDu7y+Z/frNVwBSJaIgtAFT4nOPLsykAy7cTi3glXCR7h2YWtqr8vU9
         5NEiPRTdbESHkYv1MXPutOlToFQp7yg3qRjOzLA/FQgGA7M7G6M1hsUkXAW69gS+sh2+
         daAWDzURPBYIIOXNYyBvHDhrL+qpTPIuXuaLsh9dkfvMZSuzsoUoCe3bJK/I/Wuj9fkw
         kjOkqTLZ0/VYWH/KPigAOzJekhcCI51Vl+JZiuf43WWh3PzEUKqbLZsBEGc0LwbIJTXW
         WsZO5JriTNQtgs4+n81IqWEwx0PtPjz03tiW1INkFdqgcOrfAooebpyIl4zlDqA+g4VE
         +wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QSz7ZphJmFLMqu+qJ0p3jpW5r9AffgvwSteuu1rHcS0=;
        b=5DOZvNOJx0PV2fazdyMeCOWlxgP3gDnq4zSbF3VNepcWQk4L0PeFkcVsUGRxkw6gL4
         ShaKLTStduCjPrlj31z5LJ8nEddZTtYrgSmBVR1Tdc6GCn46b0UcbSflHVHqO1VDMuKr
         bFZk43j1XR2BbYfPYIryB7oaucgjhvJOkucJ8x9kcM7TaICXJEsM0v58kHmKhvxL6mwr
         UjuWytWEF9pbNjhhahu2QsjtVAPagFHCO7Ee6CMTrbMAJfHjkzuYjw07U2tJs7gn2ysX
         MczZrTTgjF5JTD5w6OOBCS9htxssJNmLa2qJ4AXE7tbr/xs8oJ6yQAv6jVj726UOJuWT
         D2qw==
X-Gm-Message-State: AOAM533Zx999THl3gOg1lO9ZbyHHlfex6GKBzSxbBE9mFEGtnIWR07L5
        tbSwYWCmbRpdNoFSeUSgdOlVYfkILJNE56Z9jso=
X-Google-Smtp-Source: ABdhPJw03QaEkGShFsxB9vOmvbMRDoGK6yZPuifHwQy5Ty3rq6OdvYLZ6gCfGRmj8kpX15RHgs7Ktn9asNGNKEMqt24=
X-Received: by 2002:a05:6602:14c7:: with SMTP id b7mr25236166iow.130.1636025997874;
 Thu, 04 Nov 2021 04:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1635907089.git.siyanteng@loongson.cn> <7189503a545b8452ce5a8b5f9ce4b0df1711128a.1635907089.git.siyanteng@loongson.cn>
In-Reply-To: <7189503a545b8452ce5a8b5f9ce4b0df1711128a.1635907089.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 4 Nov 2021 19:39:22 +0800
Message-ID: <CAJy-Amnv6UQxd_5_aj82A3hFM-JCnOfXxdzORe97yY=_ezaiNQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: move sparse into dev-tools
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, leoyang.li@nxp.com,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>,
        Hu Haowen <src.res@email.cn>,
        Wan Jiabing <wanjiabing@vivo.com>,
        Bernard Zhao <bernard@vivo.com>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>


On Wed, Nov 3, 2021 at 10:47 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> From: Yanteng Si <siyanteng01@gmail.com>
>
> ../zh_CN/saprse.txt is alone at here, let's move it to ../zh_CN/dev-tools/sparse.rst.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/dev-tools/index.rst            | 2 +-
>  .../translations/zh_CN/{sparse.txt => dev-tools/sparse.rst}     | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/translations/zh_CN/{sparse.txt => dev-tools/sparse.rst} (100%)
>
> diff --git a/Documentation/translations/zh_CN/dev-tools/index.rst b/Documentation/translations/zh_CN/dev-tools/index.rst
> index 0f770b8664e9..77a8c44cdf49 100644
> --- a/Documentation/translations/zh_CN/dev-tools/index.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/index.rst
> @@ -22,13 +22,13 @@ Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>     :maxdepth: 2
>
>     testing-overview
> +   sparse
>     gcov
>     kasan
>
>  Todolist:
>
>   - coccinelle
> - - sparse
>   - kcov
>   - ubsan
>   - kmemleak
> diff --git a/Documentation/translations/zh_CN/sparse.txt b/Documentation/translations/zh_CN/dev-tools/sparse.rst
> similarity index 100%
> rename from Documentation/translations/zh_CN/sparse.txt
> rename to Documentation/translations/zh_CN/dev-tools/sparse.rst
> --
> 2.27.0
>
