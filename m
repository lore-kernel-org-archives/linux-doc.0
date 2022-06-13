Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE0F7C43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 06:31:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiFMGbQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 02:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbiFMGbP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 02:31:15 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 759981C927
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 23:31:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id y32so7264300lfa.6
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 23:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=30HKhFww5yjlLrtWGR69lRSxxvG7OA5GOBQZS+aF1+I=;
        b=B2FcGFaJQ98Wn4R+K9/NYaa41hYXkwsU8wA/k+SCm+ZlZdM7X+1o23jCb2WxGzBjHW
         uMB5+j1ac07x4kWGtOQRd8of+cfoel/0HlBES86hLLPY/63YZFNEgbGKZhj120S45lMp
         jJ/GZfuGcA5yB71lY4dayF4ikAYoC0TOwjY8AKyhiq7Wby7qYvw6Jiv11jQTIPlvJqd+
         2Z2LJiy7Q+i//pTGcY+gzCRQ/aOVVShyofIu0Ba+Zfixpx/yyjFx4/XSCdCFSlU7+KoC
         wwElAV697KgedKXFRtDBjcS77Qf+ukmgZt9AeHM9DDfh+dPGnTSFqXAuNWqDR2ErqW8j
         g4zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=30HKhFww5yjlLrtWGR69lRSxxvG7OA5GOBQZS+aF1+I=;
        b=iw1ODTCDqDrZMRWfMScrJG2zMQcDJUyRIZ18tI/sAzS02hYXEl4wwjfWSDZIUyVZRt
         zzfLJiSonlbpMp/PxR/JdYJb+CdzrgaKDheNAMsvmPXWcF9gl1RdzEgmcm7gn09kbhp/
         Qf3VyXUuEj4cjUO9EbbQa5Q7R4PO4L2ySsSJPwh9feKmzqDPLPEy93Pw1Sv05keiQt1J
         GNDtNo2H9UIRWgUGMF2kFn+MBFOZ4hj4ZWmbtvNuWG2AJt5bJCqrhEr46khaJwoTibVH
         UWnVmDAy+iqpmkVTD3WHflPwTpGoDo7vyd6dRC5DmUNYylqTskXFy4cZuQw5amS6zBVz
         jcDw==
X-Gm-Message-State: AOAM530RD44hj/Mn4iKeootehqzngL2pON+cIP8zCd2W/CDSfJEZrssb
        th4BaFn996qZZ+mA16pt17W3ExOqEBYx7HN7BdOXx5hq73jALQ==
X-Google-Smtp-Source: ABdhPJwEf/VeMrNHbvbZ3qdSo7A/XGU/Yove3boOwf5lmxmY7YDZ72SIEEFVYaeUOA04gTeIIjQDQfsLcTa/jnJNHo0=
X-Received: by 2002:a05:6512:10c4:b0:479:7509:2f4c with SMTP id
 k4-20020a05651210c400b0047975092f4cmr17221563lfg.606.1655101871765; Sun, 12
 Jun 2022 23:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1655094814.git.siyanteng@loongson.cn> <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
In-Reply-To: <9f458a7be9ef3b9eea3d7bba4e97fc962f6a061e.1655094814.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 13 Jun 2022 14:30:35 +0800
Message-ID: <CAJy-AmkF6uCreGjK_iJVOfO6x+yXCecPvL42V+DpXNchm5_bxQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] docs/zh_CN: Update the translation of vm index to 5.19-rc1
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        "Wu X.C." <bobwxc@email.cn>, Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        yanteng si <siyanteng01@gmail.com>, zhoubinbin@loongson.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 1:02 PM Yanteng Si <siyanteng@loongson.cn> wrote:
>
> update to commit 481cc97349d6 ("mm,doc: Add new
> documentation structure")
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/vm/bootmem.rst         | 14 +++++++
>  Documentation/translations/zh_CN/vm/index.rst | 37 +++++++++++++++----
>  Documentation/translations/zh_CN/vm/oom.rst   | 14 +++++++
>  .../translations/zh_CN/vm/page_allocation.rst | 14 +++++++
>  .../translations/zh_CN/vm/page_cache.rst      | 14 +++++++
>  .../translations/zh_CN/vm/page_reclaim.rst    | 14 +++++++
>  .../translations/zh_CN/vm/page_tables.rst     | 14 +++++++
>  .../translations/zh_CN/vm/physical_memory.rst | 14 +++++++
>  .../translations/zh_CN/vm/process_addrs.rst   | 14 +++++++
>  Documentation/translations/zh_CN/vm/shmfs.rst | 14 +++++++
>  Documentation/translations/zh_CN/vm/slab.rst  | 14 +++++++
>  Documentation/translations/zh_CN/vm/swap.rst  | 14 +++++++
>  .../translations/zh_CN/vm/vmalloc.rst         | 14 +++++++
>  13 files changed, 198 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/bootmem.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/oom.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_allocation.r=
st
>  create mode 100644 Documentation/translations/zh_CN/vm/page_cache.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_reclaim.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/page_tables.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/physical_memory.r=
st
>  create mode 100644 Documentation/translations/zh_CN/vm/process_addrs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/shmfs.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/slab.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/swap.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/vmalloc.rst

It's better to add above doc completely one by one, not just
unfinished few words.

Thanks
Alex

>
> diff --git a/Documentation/translations/zh_CN/vm/bootmem.rst b/Documentat=
ion/translations/zh_CN/vm/bootmem.rst
> new file mode 100644
> index 000000000000..8f8fa82281f1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/bootmem.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/bootmem.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=90=AF=E5=8A=A8=E5=86=85=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentatio=
n/translations/zh_CN/vm/index.rst
> index a1c6d529b6ff..a02929bb0d31 100644
> --- a/Documentation/translations/zh_CN/vm/index.rst
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -12,11 +12,36 @@
>  Linux=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E6=96=87=E6=A1=A3
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> -=E8=BF=99=E6=98=AF=E4=B8=80=E4=B8=AA=E5=85=B3=E4=BA=8ELinux=E5=86=85=E5=
=AD=98=E7=AE=A1=E7=90=86=EF=BC=88mm=EF=BC=89=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=
=86=85=E9=83=A8=E7=9A=84=E6=96=87=E6=A1=A3=E9=9B=86=EF=BC=8C=E5=85=B6=E4=B8=
=AD=E6=9C=89=E4=B8=8D=E5=90=8C=E5=B1=82=E6=AC=A1=E7=9A=84=E7=BB=86=E8=8A=82=
=EF=BC=8C=E5=8C=85=E6=8B=AC=E6=B3=A8=E9=87=8A
> -=E5=92=8C=E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8=E7=9A=84=E5=9B=9E=E5=A4=8D=
=EF=BC=8C=E7=94=A8=E4=BA=8E=E9=98=90=E8=BF=B0=E6=95=B0=E6=8D=AE=E7=BB=93=E6=
=9E=84=E5=92=8C=E7=AE=97=E6=B3=95=E7=9A=84=E5=9F=BA=E6=9C=AC=E6=83=85=E5=86=
=B5=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=AD=A3=E5=9C=A8=E5=AF=BB=E6=89=BE=
=E5=85=B3=E4=BA=8E=E7=AE=80=E5=8D=95=E5=88=86=E9=85=8D=E5=86=85=E5=AD=98=E7=
=9A=84=E5=BB=BA
> -=E8=AE=AE=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85(Documentation/translations=
/zh_CN/core-api/memory-allocation.rst)=E3=80=82
> -=E5=AF=B9=E4=BA=8E=E6=8E=A7=E5=88=B6=E5=92=8C=E8=B0=83=E6=95=B4=E6=8C=87=
=E5=8D=97=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85(Documentation/admin-guide/mm/=
index)=E3=80=82
> -TODO:=E5=BE=85=E5=BC=95=E7=94=A8=E6=96=87=E6=A1=A3=E9=9B=86=E8=A2=AB=E7=
=BF=BB=E8=AF=91=E5=AE=8C=E6=AF=95=E5=90=8E=E8=AF=B7=E5=8F=8A=E6=97=B6=E4=BF=
=AE=E6=94=B9=E6=AD=A4=E5=A4=84=EF=BC=89
> +=E8=BF=99=E6=98=AF=E4=B8=80=E4=BB=BD=E5=85=B3=E4=BA=8E=E4=BA=86=E8=A7=A3=
Linux=E7=9A=84=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E5=AD=90=E7=B3=BB=E7=BB=
=9F=E7=9A=84=E6=8C=87=E5=8D=97=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=AD=A3=
=E5=9C=A8=E5=AF=BB=E6=89=BE=E5=85=B3=E4=BA=8E=E7=AE=80=E5=8D=95=E5=88=86=E9=
=85=8D=E5=86=85=E5=AD=98=E7=9A=84
> +=E5=BB=BA=E8=AE=AE=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85=E5=86=85=E5=AD=98=
=E5=88=86=E9=85=8D=E6=8C=87=E5=8D=97
> +(Documentation/translations/zh_CN/core-api/memory-allocation.rst)=E3=80=
=82
> +=E5=85=B3=E4=BA=8E=E6=8E=A7=E5=88=B6=E5=92=8C=E8=B0=83=E6=95=B4=E7=9A=84=
=E6=8C=87=E5=8D=97=EF=BC=8C=E8=AF=B7=E7=9C=8B=E7=AE=A1=E7=90=86=E6=8C=87=E5=
=8D=97
> +(Documentation/translations/zh_CN/admin-guide/mm/index.rst)=E3=80=82
> +
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   physical_memory
> +   page_tables
> +   process_addrs
> +   bootmem
> +   page_allocation
> +   vmalloc
> +   slab
> +   highmem
> +   page_reclaim
> +   swap
> +   page_cache
> +   shmfs
> +   oom
> +
> +=E9=81=97=E7=95=99=E6=96=87=E6=A1=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=BF=99=E6=98=AF=E4=B8=80=E4=B8=AA=E5=85=B3=E4=BA=8ELinux=E5=86=85=E5=
=AD=98=E7=AE=A1=E7=90=86=EF=BC=88MM=EF=BC=89=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=
=86=85=E9=83=A8=E7=9A=84=E6=97=A7=E6=96=87=E6=A1=A3=E7=9A=84=E9=9B=86=E5=90=
=88=EF=BC=8C=E5=85=B6=E4=B8=AD=E6=9C=89=E4=B8=8D=E5=90=8C=E5=B1=82=E6=AC=A1=
=E7=9A=84=E7=BB=86=E8=8A=82=EF=BC=8C
> +=E5=8C=85=E6=8B=AC=E6=B3=A8=E9=87=8A=E5=92=8C=E9=82=AE=E4=BB=B6=E5=88=97=
=E8=A1=A8=E7=9A=84=E5=9B=9E=E5=A4=8D=EF=BC=8C=E7=94=A8=E4=BA=8E=E9=98=90=E8=
=BF=B0=E6=95=B0=E6=8D=AE=E7=BB=93=E6=9E=84=E5=92=8C=E7=AE=97=E6=B3=95=E7=9A=
=84=E6=8F=8F=E8=BF=B0=E3=80=82=E5=AE=83=E5=BA=94=E8=AF=A5=E8=A2=AB=E5=BE=88=
=E5=A5=BD=E5=9C=B0=E6=95=B4=E5=90=88=E5=88=B0=E4=B8=8A=E8=BF=B0
> +=E7=BB=93=E6=9E=84=E5=8C=96=E7=9A=84=E6=96=87=E6=A1=A3=E4=B8=AD=EF=BC=8C=
=E5=A6=82=E6=9E=9C=E5=AE=83=E5=B7=B2=E7=BB=8F=E5=AE=8C=E6=88=90=E4=BA=86=E5=
=AE=83=E7=9A=84=E4=BD=BF=E5=91=BD=EF=BC=8C=E5=8F=AF=E4=BB=A5=E5=88=A0=E9=99=
=A4=E3=80=82
>
>  .. toctree::
>     :maxdepth: 1
> @@ -25,7 +50,6 @@ TODO:=E5=BE=85=E5=BC=95=E7=94=A8=E6=96=87=E6=A1=A3=E9=
=9B=86=E8=A2=AB=E7=BF=BB=E8=AF=91=E5=AE=8C=E6=AF=95=E5=90=8E=E8=AF=B7=E5=8F=
=8A=E6=97=B6=E4=BF=AE=E6=94=B9=E6=AD=A4=E5=A4=84=EF=BC=89
>     balance
>     damon/index
>     free_page_reporting
> -   highmem
>     ksm
>     frontswap
>     hmm
> @@ -48,7 +72,6 @@ TODOLIST:
>  * free_page_reporting
>  * hugetlbfs_reserv
>  * page_migration
> -* slub
>  * transhuge
>  * unevictable-lru
>  * vmalloced-kernel-stacks
> diff --git a/Documentation/translations/zh_CN/vm/oom.rst b/Documentation/=
translations/zh_CN/vm/oom.rst
> new file mode 100644
> index 000000000000..633b02d79f24
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/oom.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/oom.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E5=AD=98=E4=B8=8D=E8=B6=B3=E5=A4=84=E7=90=86
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/page_allocation.rst b/Do=
cumentation/translations/zh_CN/vm/page_allocation.rst
> new file mode 100644
> index 000000000000..3d5b2743d96a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_allocation.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_allocation.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E9=A1=B5=E9=9D=A2=E5=88=86=E9=85=8D
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/page_cache.rst b/Documen=
tation/translations/zh_CN/vm/page_cache.rst
> new file mode 100644
> index 000000000000..b0c9c72ccde8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_cache.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_cache.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E9=A1=B5=E9=9D=A2=E7=BC=93=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/page_reclaim.rst b/Docum=
entation/translations/zh_CN/vm/page_reclaim.rst
> new file mode 100644
> index 000000000000..83275afc07bf
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_reclaim.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_reclaim.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E9=A1=B5=E9=9D=A2=E5=9B=9E=E6=94=B6
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/page_tables.rst b/Docume=
ntation/translations/zh_CN/vm/page_tables.rst
> new file mode 100644
> index 000000000000..b525d8f0438c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/page_tables.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/page_tables.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D
> +=E9=A1=B5=E8=A1=A8
> +=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/physical_memory.rst b/Do=
cumentation/translations/zh_CN/vm/physical_memory.rst
> new file mode 100644
> index 000000000000..129962d496ce
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/physical_memory.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/physical_memory.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E7=89=A9=E7=90=86=E5=86=85=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/process_addrs.rst b/Docu=
mentation/translations/zh_CN/vm/process_addrs.rst
> new file mode 100644
> index 000000000000..c1319938101b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/process_addrs.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/process_addrs.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E8=BF=9B=E7=A8=8B=E5=9C=B0=E5=9D=80
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/shmfs.rst b/Documentatio=
n/translations/zh_CN/vm/shmfs.rst
> new file mode 100644
> index 000000000000..2987939f5e25
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/shmfs.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/shmfs.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=85=B1=E4=BA=AB=E5=86=85=E5=AD=98=E6=96=87=E4=BB=B6=E7=B3=BB=E7=BB=9F
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/slab.rst b/Documentation=
/translations/zh_CN/vm/slab.rst
> new file mode 100644
> index 000000000000..0af77c8612b8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/slab.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/slab.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +Slab=E5=88=86=E9=85=8D
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/swap.rst b/Documentation=
/translations/zh_CN/vm/swap.rst
> new file mode 100644
> index 000000000000..1c1a3e61a80c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/swap.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/swap.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +=E4=BA=A4=E6=8D=A2=E5=86=85=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/vm/vmalloc.rst b/Documentat=
ion/translations/zh_CN/vm/vmalloc.rst
> new file mode 100644
> index 000000000000..d65ed70642c9
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/vmalloc.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/vmalloc.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E8=BF=9E=E7=BB=AD=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=88=86=E9=85=8D
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --
> 2.27.0
>
