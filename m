Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1420FC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 11:08:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233208AbhLJLLo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 06:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbhLJLLn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 06:11:43 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A8C8C0617A2
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 03:08:09 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id be32so12697265oib.11
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 03:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BmcAx6dxRs3niE1gyFBLyikLQPzueiFlM1VUVQJa294=;
        b=p15ImpBQk5NiX2xglSCFpKnYYnobhQDELQyJGjBMttgHFyPvl8AGs/w5AwOmzReHU3
         8qLjiGLx33ADRCT/FJ4TvGFyoRbDHVK4PZ204013TeBPXEIW/I9dYJnVqTDS2zR4HV8+
         zYEX5zU1TbnQ0/kUfFPEjpEZrRyGb5wzbNq4m8Tx6IdsAnb5I0BHoMa2O2Pq661gdYa7
         FdWRsKyUQ6x4KYZA4Azsix+VG/byjIGROwihDKQEpy0Dg7X+d7Wf3wpUu72ssQX7XLmC
         URJLqy9PGM+x/rQfGvyyAdL2iNtUNm0sesEsdp7c28xHSwOAwrNNgwNzUgyQFatH5Qo2
         jsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BmcAx6dxRs3niE1gyFBLyikLQPzueiFlM1VUVQJa294=;
        b=ZcI6tBo/di2a7gtxBm3XWZ0A+2ORZYYAYHlBeLvk4x5Y/7k642OWRhmOgq0SXgW0ks
         Nuvby9qfTlheR46POEXsSBPuBaOgVL2XAjtpVDhKRMK+49B7T8lXvOVpqF53iCUBDijU
         33IHO6S+2ICNTMKGYeyr4GBjwyy2nIUHJadyjh+H1ZgtfkqvwF+WhLO5kQAcIU3GTEU2
         qfNgeK5EgQg7ezMbKAc5O9ov6JxdUjOoMhUtfrb+kqjLykT4K4WPYLoWbScTwm3ql2h/
         pcarUJR6S0nykt39iZevk935RDBCk7F5aiUAfQ63qaSJgZgxYFuQLhBn0ZL1p+ALZTGc
         U8Rw==
X-Gm-Message-State: AOAM533GCpERYyNrdJISbc94po34SNkOrwiZMAqymcJ4d7qCmrhx/xkJ
        JaJaOQgG0IZfOKAumEz4U42dFLck4YXqq4SV9DY=
X-Google-Smtp-Source: ABdhPJzjvLrMRyC4vp9lPpZX273lZsZ2yhRC0LpzmajiQnjfmLuzD9uW4O2AyJtTu/aTllz3ZU/6fkxi7ukxyhs398k=
X-Received: by 2002:a05:6808:1709:: with SMTP id bc9mr11798961oib.130.1639134488513;
 Fri, 10 Dec 2021 03:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20211210100322.1490-1-tangyizhou@huawei.com> <20211210100322.1490-3-tangyizhou@huawei.com>
In-Reply-To: <20211210100322.1490-3-tangyizhou@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Fri, 10 Dec 2021 19:07:57 +0800
Message-ID: <CAEensMx+M6bdYs8A3_UXWpJk1cNXT6_Fxzy7A91wwufF6pakXQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] docs/zh-CN: Update sched-capacity in scheduler/index.rst
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8810=E6=
=97=A5=E5=91=A8=E4=BA=94 17:35=E5=86=99=E9=81=93=EF=BC=9A
>
> sched-capacity.rst has been added in the previous patch,
> so update here.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  Documentation/translations/zh_CN/scheduler/index.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Docum=
entation/translations/zh_CN/scheduler/index.rst
> index 4c4deca4302a..e97ad7781088 100644
> --- a/Documentation/translations/zh_CN/scheduler/index.rst
> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> @@ -20,6 +20,7 @@ Linux=E8=B0=83=E5=BA=A6=E5=99=A8
>      completion
>      sched-arch
>      sched-bwc
> +    sched-capacity
Usually, this doesn't need to be split out as a patch, because it
looks like a warning was fixed.

Thanks,
Yanteng
>
>
>  TODOList:
> @@ -28,7 +29,6 @@ TODOList:
>      sched-deadline
>      sched-design-CFS
>      sched-domains
> -    sched-capacity
>      sched-energy
>      sched-nice-design
>      sched-rt-group
> --
> 2.17.1
>
