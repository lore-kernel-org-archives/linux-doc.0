Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 383C0C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 26 Dec 2021 08:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231465AbhLZIak (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Dec 2021 03:30:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232079AbhLZIaj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Dec 2021 03:30:39 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC22AC06173E
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 00:30:38 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id w1so9653689ilh.9
        for <linux-doc@vger.kernel.org>; Sun, 26 Dec 2021 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=G7+kI9dO9Xox8Fsb+aojm7ah8j1mKJfTK3QxeBLPqVA=;
        b=dnj+ah7oPDO9TWJB6RruSJtKoeqJ+/QebAuJjTBRPmEv7njo3mHkNmHnPVsDkffz8I
         Yffe76GeSR13comHqOUUXdiWwt+W1On6BB8UAwGn1rC+lF28lLHWiDYFy0DshbPRdk6+
         bfR8/zbp/N0eOVVKN1DSKt4L3rRbECdU9rdGr9b3totuyyMrDuw38Fe0IOT55HnYVpPL
         INh557CCa6e+Qb1izT0YCeFs1jgyucYnP5Df5lCKfGCPqHKKCN9hWZ1yUSP2a4BLz0sL
         Iq6tcl5hXpv7f69dXhD3Vsw4lWHNfpYJuxmmOXPRmx1XHwfZuauiSBu2/pmPuU9WQkOQ
         +sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=G7+kI9dO9Xox8Fsb+aojm7ah8j1mKJfTK3QxeBLPqVA=;
        b=bksLPdwDgp0cNPRtxxdKCHP+DA2p3nu4EVrYAJMG9sQnucAFx+AYu2546RFY3mpVAE
         xnH47fs1wzz53TuBL9uUDJp+0mNE+KpV7OOeeecugKIl4BMUxOFKEHGHL85a13KXLW+x
         /3f2UAbmLdMXgYhKlu7HS1T6SZq8+lEymm7quGoA6vmGHExdJv6ykgxXzTtR6sGGGRXq
         Fck4IiSpDO3E2AlnYQbaeBVjuAdrI9MWbagj0d1qTwLZMuFy9DeBAxdVtNcnkOuWTZkz
         KjFCquIHptWsWCvUWLHadNd2447W1q4xg79CXEX6HVHn3PYJU+Fi2Rh+QYOKK3esP/dI
         Wl6w==
X-Gm-Message-State: AOAM532qGe8GJwSIc3+LJG6WtkMOpcQ3dy6OwQbqGT14nhFgveUwMNWs
        xtTo0UndDzMb7ve8qiSVwZgUZPwtr6eA1lRbSxM=
X-Google-Smtp-Source: ABdhPJzZ5MxwmXWeWiFpA2xbP2lsDW3rHo5piO8IMTcihw1FqYvmRu9LWEw2QqB0dqAlKw8iTpvH4Tz2/LfS4NEOEqc=
X-Received: by 2002:a92:280e:: with SMTP id l14mr5988147ilf.97.1640507438305;
 Sun, 26 Dec 2021 00:30:38 -0800 (PST)
MIME-Version: 1.0
References: <20211226082923.3261-1-tangyizhou@huawei.com> <20211226082923.3261-2-tangyizhou@huawei.com>
In-Reply-To: <20211226082923.3261-2-tangyizhou@huawei.com>
From:   Alex Shi <seakeel@gmail.com>
Date:   Sun, 26 Dec 2021 16:30:02 +0800
Message-ID: <CAJy-Amkd7YJszrgxmxXCYjHNR1ngwk+irHJvfDUnJXZ5fc_wfw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add power/index Chinese translation
To:     Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, zhengbin13@huawei.com,
        Yeechou Tang <tangyeechou@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Dec 26, 2021 at 4:01 PM Tang Yizhou <tangyizhou@huawei.com> wrote:
>
> Translate power/index.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> ---
>  Documentation/translations/zh_CN/index.rst    |  4 +-
>  .../translations/zh_CN/power/index.rst        | 55 +++++++++++++++++++
>  2 files changed, 57 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/power/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 46e14ec9963d..7658e2fa6f98 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -104,13 +104,14 @@ TODOList:
>     :maxdepth: 2
>
>     core-api/index
> +   accounting/index

What's this?

Thanks
Alex

>     cpu-freq/index
>     iio/index
>     sound/index
>     filesystems/index
>     virt/index
>     infiniband/index
> -   accounting/index
> +   power/index
>     scheduler/index
>
>  TODOList:
> @@ -129,7 +130,6 @@ TODOList:
>  * netlabel/index
>  * networking/index
>  * pcmcia/index
> -* power/index
>  * target/index
>  * timers/index
>  * spi/index
> diff --git a/Documentation/translations/zh_CN/power/index.rst b/Documenta=
tion/translations/zh_CN/power/index.rst
> new file mode 100644
> index 000000000000..fd379adfda8e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/power/index.rst
> @@ -0,0 +1,55 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/power/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> +  =E5=94=90=E8=89=BA=E8=88=9F Tang Yizhou <tangyeechou@gmail.com>
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E7=94=B5=E6=BA=90=E7=AE=A1=E7=90=86
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +TODOList:
> +
> +    * apm-acpi
> +    * basic-pm-debugging
> +    * charger-manager
> +    * drivers-testing
> +    * energy-model
> +    * freezing-of-tasks
> +    * opp
> +    * pci
> +    * pm_qos_interface
> +    * power_supply_class
> +    * runtime_pm
> +    * s2ram
> +    * suspend-and-cpuhotplug
> +    * suspend-and-interrupts
> +    * swsusp-and-swap-files
> +    * swsusp-dmcrypt
> +    * swsusp
> +    * video
> +    * tricks
> +
> +    * userland-swsusp
> +
> +    * powercap/powercap
> +    * powercap/dtpm
> +
> +    * regulator/consumer
> +    * regulator/design
> +    * regulator/machine
> +    * regulator/overview
> +    * regulator/regulator
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.17.1
>
