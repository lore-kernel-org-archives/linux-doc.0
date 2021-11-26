Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EC9C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 06:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358734AbhKZGWe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 01:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344429AbhKZGUe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 01:20:34 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C597FC061746
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 22:17:21 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id z18so10143374iof.5
        for <linux-doc@vger.kernel.org>; Thu, 25 Nov 2021 22:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NBPn8U/HLJLkjCsgA/MZucWScGhTCe1sJze41pPb8kA=;
        b=Z/aNZYc4XqAn5Ue48yBMaKozL6Sn0fXXtIwATxCZ+b+ds4wGJiO+2R1F/sBnUZFrpZ
         L4X5D4vC5Bk6oLizcgwvNHUEkMxyxtdoC7BJb6Qg+z/EO/V8OOghFP5t34/qx9KYttZs
         PhqMecPsvLcq/tpVkBDNXSfoqHo9CjpYvBomcPvBeaoxCJlX8OlfrUvY41JuygJK8d+C
         ChMo9X0TDT+Py5oRM0XUX/fD3usUPseeHfxObNVAq/H2ukNMr7K62l6FOAU7qO4hwfvG
         PTYBT24b9N3TihT70AFuqC6egMHKv8yKHgUPbsHi3xtWuYrXe/eZ4zYEtM+FDC4Zomam
         z8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NBPn8U/HLJLkjCsgA/MZucWScGhTCe1sJze41pPb8kA=;
        b=3Ta54V8gHpv1knUTcjlWTAMGB4olKbpEGRtIaVoFF0efIJv0ypec0Ru+BbyeHakuLz
         EexBs1REv3vXt29jMgfXvjaLVRMhrhyOZbsNJlRXis7SS6jutElCvM+q5T/ZDx2zBY6j
         5aeRkjttE4RJ+Inw/Tg4qtOLCaP5kmyozA4rVMcvFJBKdqaEdYo2lZLQwrl93V0xVcoS
         ZrMj/Fd5qhPo23/UvpbhowR02sKA5pHMm3wEEmk0PS5Si4W3iUjoKCvQAQmwO2ny6/ln
         fkVgV8gWKt9gJo44m7GPk8d/N+heuxHpqF5uENX2Aj/4xpBRAhDQHkodHGl7gYkjp0vh
         C9aA==
X-Gm-Message-State: AOAM530DrR1535xbAX01xj1A/t3X3jV/oLLTwZ83op4ClW+xcdB1W6r8
        tOaIHET+C2hZ28JR9PZEYkeQO/63SitljHLzNrY=
X-Google-Smtp-Source: ABdhPJzM06yUkDN+yvOlIpGZpItJKkdK+RoUjUzuYk5o/aGG5vduJ46AXdyHtc6Mc3Ja4j7gp82U7gEszz8B2Vlf6kg=
X-Received: by 2002:a05:6602:1813:: with SMTP id t19mr32459333ioh.135.1637907441220;
 Thu, 25 Nov 2021 22:17:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637892363.git.siyanteng@loongson.cn> <ccaaafaac7678e80b446504152312e1f08514681.1637892363.git.siyanteng@loongson.cn>
In-Reply-To: <ccaaafaac7678e80b446504152312e1f08514681.1637892363.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Fri, 26 Nov 2021 14:16:45 +0800
Message-ID: <CAJy-Amnx3Lqu9dz+LXQDv8qtynfYQKc3nFWvhqmJC2wyaUSq+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] docs/zh_CN: add scheduler index translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Puyu Wang <realpuyuwang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Nov 26, 2021 at 10:21 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Translate .../scheduler/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  .../translations/zh_CN/scheduler/index.rst    | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index a34e58733ac8..aebe336ab538 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -106,6 +106,7 @@ TODOList:
>     virt/index
>     infiniband/index
>     accounting/index
> +   scheduler/index
>
>  TODOList:
>
> @@ -140,7 +141,6 @@ TODOList:
>  * PCI/index
>  * scsi/index
>  * misc-devices/index
> -* scheduler/index
>  * mhi/index
>
>  =E4=BD=93=E7=B3=BB=E7=BB=93=E6=9E=84=E6=97=A0=E5=85=B3=E6=96=87=E6=A1=A3
> diff --git a/Documentation/translations/zh_CN/scheduler/index.rst b/Docum=
entation/translations/zh_CN/scheduler/index.rst
> new file mode 100644
> index 000000000000..4fde5c2a9db3
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/scheduler/index.rst
> @@ -0,0 +1,44 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/scheduler/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +
> +.. _cn_scheduler_index.rst:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux=E8=B0=83=E5=BA=A6=E5=99=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +    :maxdepth: 1
> +
> +
> +TODOList:
> +
> +    completion
> +    sched-arch
> +    sched-bwc
> +    sched-deadline
> +    sched-design-CFS
> +    sched-domains
> +    sched-capacity
> +    sched-energy
> +    sched-nice-design
> +    sched-rt-group
> +    sched-stats
> +
> +    text_files
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =3D=3D=3D=3D=3D=3D=3D
> +
> +   * :ref:`genindex`
> --
> 2.27.0
>
