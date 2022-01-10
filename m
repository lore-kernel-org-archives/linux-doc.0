Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A24DC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jan 2022 03:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238289AbiAJDKl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 9 Jan 2022 22:10:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232735AbiAJDKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 9 Jan 2022 22:10:40 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6104C06173F
        for <linux-doc@vger.kernel.org>; Sun,  9 Jan 2022 19:10:40 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id u8so15762397iol.5
        for <linux-doc@vger.kernel.org>; Sun, 09 Jan 2022 19:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xzqspMNQHmPmSCqve3Sv1bUwJDnkF3yc6Xc9qHqT2aw=;
        b=BwCcNK1O4zWEwFzfZt7L8fjE9OEr0ZhD0icUpio3DKuJWVBBub+DA07EeFrOR1Agn9
         Q21QYA2U0SUJ+owALeiGyC8XxbyiZZ5XhlTX+s5T/BIW3iufSnYJznW16k2vcVs263fA
         u6XgWqaVgOOlcOBpwq0N/T9n7iQt5wB6RU2atgrukl1zmjJgEHSYhSt70vvlBQE7mcm3
         A+cbd5HZhvHGeQtnD65UYjfvlCzQooP/MBgpfeXr4/8XHipLv0uPeA6we4ucNbxDNA4C
         DFPZf7Db7IjxSTsOTN2PANpkWw7EQe9JpJ4SY5+I4oglFCA5aPy7rYB5C5PddDvtrCXT
         z+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xzqspMNQHmPmSCqve3Sv1bUwJDnkF3yc6Xc9qHqT2aw=;
        b=2YAt/0KUdPvA/RTlftv6hV5lRkisS2C8GKm5TjxOR2sVt5h9R0II31NhBm0jq5E0ol
         llje7RGGHBM40aIVQ1KUiWD0MDzLVS167T7qo+jFmv6JD2dRKwJeUb1L4LPWe4lXobxS
         aXBTfKoMlJqjbXkvjWE7W+0Og2sot4f7+jDB0zQyx3Txsg4QeGJFEdXzOPjJEcyo0Hbs
         ID/RFh16qejNY9l78wx9DdJqo1THVc2Zt3b8TJ5IThpcupucl5fgJcvMVJmlv5XKKvdi
         SZvR6Ylhesn0a0IqiEHl+ADV2r4LGn1bCGs8WphdIQqBegAuci9GcRe7P5fQYy5OuU25
         56Wg==
X-Gm-Message-State: AOAM533P23r03lbACU7sgjCVQgnz+egGmJqI8BqfYJsQ8fHUAj9Nvj+j
        yzCOh861khweRiN/euwaSC6gKLdy5hQK52HgWYA=
X-Google-Smtp-Source: ABdhPJy4L1ZUoojNd1NaKWlX1ThzQlCPvkoibeNkSVdhPoYuuVbRvdFRekTawFEWxBIhEYl3RGYkXhfcq77/QOKyHas=
X-Received: by 2002:a02:cd81:: with SMTP id l1mr921548jap.2.1641784240187;
 Sun, 09 Jan 2022 19:10:40 -0800 (PST)
MIME-Version: 1.0
References: <cover.1641782124.git.siyanteng@loongson.cn> <7c66e1c130d54b8bb26118a2daf62e5b02b1fbc2.1641782124.git.siyanteng@loongson.cn>
In-Reply-To: <7c66e1c130d54b8bb26118a2daf62e5b02b1fbc2.1641782124.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Mon, 10 Jan 2022 11:10:04 +0800
Message-ID: <CAJy-Amk0bB5Y=1eL98D1O-D859k6_sa+iKqSmOZhzGoQqiHJtQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] docs/zh_CN: add vm/index translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Tang Yizhou <tangyizhou@huawei.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 10, 2022 at 10:44 AM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> From: Yanteng Si <siyanteng01@gmail.com>
>
> Translate ../vm/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Tang Yizhou <tangyizhou@huawei.com>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  Documentation/translations/zh_CN/index.rst    |  2 +-
>  Documentation/translations/zh_CN/vm/index.rst | 52 +++++++++++++++++++
>  2 files changed, 53 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/index.rst
>
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/t=
ranslations/zh_CN/index.rst
> index 46e14ec9963d..911fb64d4073 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -112,6 +112,7 @@ TODOList:
>     infiniband/index
>     accounting/index
>     scheduler/index
> +   vm/index
>
>  TODOList:
>
> @@ -140,7 +141,6 @@ TODOList:
>  * gpu/index
>  * security/index
>  * crypto/index
> -* vm/index
>  * bpf/index
>  * usb/index
>  * PCI/index
> diff --git a/Documentation/translations/zh_CN/vm/index.rst b/Documentatio=
n/translations/zh_CN/vm/index.rst
> new file mode 100644
> index 000000000000..0fda40c602ac
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/vm/index.rst
> @@ -0,0 +1,52 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/vm/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Linux=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E6=96=87=E6=A1=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=BF=99=E6=98=AF=E4=B8=80=E4=B8=AA=E5=85=B3=E4=BA=8ELinux=E5=86=85=E5=
=AD=98=E7=AE=A1=E7=90=86=EF=BC=88mm=EF=BC=89=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=
=86=85=E9=83=A8=E7=9A=84=E6=96=87=E6=A1=A3=E9=9B=86=EF=BC=8C=E5=85=B6=E4=B8=
=AD=E6=9C=89=E4=B8=8D=E5=90=8C=E5=B1=82=E6=AC=A1=E7=9A=84=E7=BB=86=E8=8A=82=
=EF=BC=8C=E5=8C=85=E6=8B=AC=E6=B3=A8=E9=87=8A
> +=E5=92=8C=E9=82=AE=E4=BB=B6=E5=88=97=E8=A1=A8=E7=9A=84=E5=9B=9E=E5=A4=8D=
=EF=BC=8C=E7=94=A8=E4=BA=8E=E9=98=90=E8=BF=B0=E6=95=B0=E6=8D=AE=E7=BB=93=E6=
=9E=84=E5=92=8C=E7=AE=97=E6=B3=95=E7=9A=84=E5=9F=BA=E6=9C=AC=E6=83=85=E5=86=
=B5=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=AD=A3=E5=9C=A8=E5=AF=BB=E6=89=BE=
=E5=85=B3=E4=BA=8E=E7=AE=80=E5=8D=95=E5=88=86=E9=85=8D=E5=86=85=E5=AD=98=E7=
=9A=84=E5=BB=BA
> +=E8=AE=AE=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85(Documentation/translations=
/zh_CN/core-api/memory-allocation.rst)=E3=80=82
> +=E5=AF=B9=E4=BA=8E=E6=8E=A7=E5=88=B6=E5=92=8C=E8=B0=83=E6=95=B4=E6=8C=87=
=E5=8D=97=EF=BC=8C=E8=AF=B7=E5=8F=82=E9=98=85(Documentation/admin-guide/mm/=
index)=E3=80=82
> +TODO:=E5=BE=85=E5=BC=95=E7=94=A8=E6=96=87=E6=A1=A3=E9=9B=86=E8=A2=AB=E7=
=BF=BB=E8=AF=91=E5=AE=8C=E6=AF=95=E5=90=8E=E8=AF=B7=E5=8F=8A=E6=97=B6=E4=BF=
=AE=E6=94=B9=E6=AD=A4=E5=A4=84=EF=BC=89
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +
> +TODOLIST:
> +* active_mm
> +* arch_pgtable_helpers
> +* balance
> +* damon/index
> +* free_page_reporting
> +* frontswap
> +* highmem
> +* hmm
> +* hwpoison
> +* hugetlbfs_reserv
> +* ksm
> +* memory-model
> +* mmu_notifier
> +* numa
> +* overcommit-accounting
> +* page_migration
> +* page_frags
> +* page_owner
> +* page_table_check
> +* remap_file_pages
> +* slub
> +* split_page_table_lock
> +* transhuge
> +* unevictable-lru
> +* vmalloced-kernel-stacks
> +* z3fold
> +* zsmalloc
> --
> 2.27.0
>
