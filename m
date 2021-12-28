Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C56C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 28 Dec 2021 07:11:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235198AbhL1HL4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Dec 2021 02:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbhL1HL4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Dec 2021 02:11:56 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B997C061574
        for <linux-doc@vger.kernel.org>; Mon, 27 Dec 2021 23:11:56 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id w13so17562247ybs.13
        for <linux-doc@vger.kernel.org>; Mon, 27 Dec 2021 23:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=becP1jjOyB9Zc5Kpdz/XFloZ2OXY9I33/ixmWWfGveI=;
        b=D4r5XemJkYeqjCjwvf0R6oUfS7m/ieMIFppExLgL1dMDBsXKbzb+lNrIcvtvoJ4zOr
         d84t6VM5U8KM1s/kOqigkOIWS6ciWzhP7PzVFy7dSn4hGqKNF12YvCrD9ffsngTAts9m
         eyAi/69g1BzWnAaZWLISEBcaSNURyrgV00RFOCtFlXtVK4dD3jz1FK/73uozQCWrI7Pb
         pDS7YMYzdFgDzzcGme8FeZ9PB3Q7KPq7N3unHXggfWxFan3Az7qLuFKdBrS4ACGptW7x
         lJKFkrtKwVXzwZX/79RGKmlcKpO2y91RgqEgWiGgwRYH4q0odkxMSt4SwaqTFXLtPD/c
         HUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=becP1jjOyB9Zc5Kpdz/XFloZ2OXY9I33/ixmWWfGveI=;
        b=Gk+CgW+hNtZm1qUM324qTCl9XT4Dl6fUoRyvA21P3VxnlCKLoGUaBHU6lmowzlZPWu
         xEJmxgayGfP5u0jkd+jT6AQb3FrX6FFuHcs7Wxz4TNO8cYhfjid/OcRYOzHevxIOEkz5
         S1/+UFrbuhOKYILJ6KOAvY4A7+V7cfk/Ci7Y7dK+qtGKZ1PdbBEP6HzKT7kikbMLk+3M
         Nb9WuZuXBPfm0C9O7Ve/Q/LWn0luct6gvbECx9LF/j2K5wQyHwrJYWuCECil1kSIdNyH
         pHtAotPFgMqAfsrQYi6RojzxY6/ANmK2f/uCvwHsl0VjoadQ8DFokbDnBI3G2UddoSsx
         yuCw==
X-Gm-Message-State: AOAM532uZuzZgawCEgqIF4jnKNP3dVnVpfKIwZnfa9x6euqjnw50Jf1R
        oRbdRAF3+zNwxgDeLyD3DQGXdtVzFne3BcF4WtI=
X-Google-Smtp-Source: ABdhPJxYNkZurKm30qJ/e5uKR4Ow3kMUacy7mUZLwTddcduau6G361v8AbM8Lr7bs/y2enQE5rPHF0tp0yM/adsCnK4=
X-Received: by 2002:a25:ae85:: with SMTP id b5mr13263674ybj.200.1640675514717;
 Mon, 27 Dec 2021 23:11:54 -0800 (PST)
MIME-Version: 1.0
References: <20211228021407.12449-1-tangyizhou@huawei.com> <20211228021407.12449-2-tangyizhou@huawei.com>
In-Reply-To: <20211228021407.12449-2-tangyizhou@huawei.com>
From:   yanteng si <siyanteng01@gmail.com>
Date:   Tue, 28 Dec 2021 15:11:43 +0800
Message-ID: <CAEensMyFYtKRv6bqywW5WY74OKpmXPR6H20B=n17CLx_tDKYCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] docs/zh_CN: Cleanup index.rst
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

Tang Yizhou <tangyizhou@huawei.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=BA=8C 09:46=E5=86=99=E9=81=93=EF=BC=9A
>
> The Chinese version of many */index is not in the same order as the
> English version. Put them to where they should be.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 46e14ec9963d..e7f5fa3e7502 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -104,13 +104,13 @@ TODOList:
>     :maxdepth: 2
>
>     core-api/index
> +   accounting/index
>     cpu-freq/index
>     iio/index
> +   infiniband/index
> +   virt/index
>     sound/index
>     filesystems/index
> -   virt/index
> -   infiniband/index
> -   accounting/index
>     scheduler/index
>
>  TODOList:
> --
> 2.17.1
>
