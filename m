Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48116C4338F
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 06:35:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BC37611CA
	for <linux-doc@archiver.kernel.org>; Sat, 21 Aug 2021 06:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231666AbhHUGg3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Aug 2021 02:36:29 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44287 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230375AbhHUGg3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Aug 2021 02:36:29 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 03FBE580403;
        Sat, 21 Aug 2021 02:35:50 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute2.internal (MEProxy); Sat, 21 Aug 2021 02:35:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm3; bh=0I0is
        6KEDbVfcKV3D5cJLuEuYXzriGgYMLasQ1GDRPw=; b=talI36jc07XPgbykdC51U
        1FgU+pFvoTRn3SFbClQq3MFc9dV6a2k3UQEm4g9Y4WUCLA5nmj1duDe1LZxfMdfM
        AGGOkXIMYCEfbnFruh7ufAUaAAU4A0QCfpvp9DKRkMzQ8ELNVNVckTnpDGiS19DG
        eZhxN9b3HqK32j0NrNvJ5sArybJe8ChSGgu953S10iI8xHaOA+BGL34Av4Zs/h3c
        HRlbVQ3XRC0YVi/kKtVlWUV1nuzHymv0jo6CLLbO8JxfCeKSbXq6LUO9wVgPm63Q
        P0zUUCBtW6PRIuYB50E+LECiZSBNvZIQ+gBMLaWiUYKVqW5wwIvA07nn2V3VmKac
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=0I0is6KEDbVfcKV3D5cJLuEuYXzriGgYMLasQ1GDR
        Pw=; b=gtd9BNwouFqa1qOABepItRQz1dVtT8KG0FX/hvY/px+oKcrjX0/tKitCl
        s09MXNpXZUsNa7Q7S0Gj91N3U7YE/BUtgxPsOComdYg7GmwnbHhqasd6qLVsG/Il
        xF3O2ZYO0RbhOieUxIQ9tGZoAwG4P3o+K/tn4goH0UNVRtQCiDKqezNbNQi88qEK
        k448G5DGNM96sBfOAUj5O6UL48IlXA7SZNP79zKeBkExGzeZM2v5QEWB/akqI09j
        YISPzLwWr1OXK0tcHY/kHybbx7LR6gFE/feF9xeyw4TZlkEV3P5cFuq4frgiE1uY
        cGGyG29fgy6Fe9avgSZWl41c7fyug==
X-ME-Sender: <xms:xZ4gYZDOR4sP5962PaToD9xTdQdl66FJ6zGGoNjBAQ2Li-kLiMXTfg>
    <xme:xZ4gYXhv3mWQGU3zvjd03r76PfM4Yq6f-nbVH48l_i2NMYZmBEg-Lxwxrjz4tUDmU
    s5m1N31sluNYk8ZA0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddttddguddtjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdfl
    ihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdel
    hfefheekteefueektdefjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmh
    grihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:xZ4gYUme2wFhn7nikeuFQ_w4hZyWUPFM5zM2cnpz6kliR6N3lnKgQA>
    <xmx:xZ4gYTxn55iTQkslQq_lud1T4u2QBa2OS2xAf5Rq94tLukR1V3wzWQ>
    <xmx:xZ4gYeSg2nCatYnv-DFikDMAJ-sRGT6Ef4XoxmNYk_LRQsBtqKIXmQ>
    <xmx:xp4gYRGrwoA3BaViX3TIDEpJK7kVkZV4QIzReuI0TX7gBfUooo61Ig>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id D2FE1FA0AA4; Sat, 21 Aug 2021 02:35:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1118-g75eff666e5-fm-20210816.002-g75eff666
Mime-Version: 1.0
Message-Id: <00aa33ef-0c17-4ba3-8701-6c8b963e37b3@www.fastmail.com>
In-Reply-To: <22e6c7ae2b02f8b4f98dfb0c800edb66624029c0.1629274856.git.siyanteng@loongson.cn>
References: <cover.1629274856.git.siyanteng@loongson.cn>
 <22e6c7ae2b02f8b4f98dfb0c800edb66624029c0.1629274856.git.siyanteng@loongson.cn>
Date:   Sat, 21 Aug 2021 14:35:28 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>, alexs@kernel.org,
        "Wu XiangCheng" <bobwxc@email.cn>, seakeel@gmail.com
Cc:     "Huacai Chen" <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        "Puyu Wang" <realpuyuwang@gmail.com>, chenfeiyang@loongson.cn,
        chris.chenfeiyang@gmail.com, "yanteng si" <siyanteng01@gmail.com>
Subject: Re: [PATCH v3 3/6] docs/zh_CN: add core-api mm-api translation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



=E5=9C=A82021=E5=B9=B48=E6=9C=8818=E6=97=A5=E5=85=AB=E6=9C=88 =E4=B8=8B=E5=
=8D=884:32=EF=BC=8CYanteng Si=E5=86=99=E9=81=93=EF=BC=9A
> Translate Documentation/core-api/mm-api.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks.

> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../translations/zh_CN/core-api/mm-api.rst    | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.r=
st
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst=20
> b/Documentation/translations/zh_CN/core-api/index.rst
> index 9bc1dfeab98e..e5d2f4d5413c 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -101,6 +101,7 @@ Todolist:
> =20
>     memory-allocation
>     unaligned-memory-access
> +   mm-api
> =20
>  Todolist:
> =20
> @@ -108,7 +109,6 @@ Todolist:
>     dma-api-howto
>     dma-attributes
>     dma-isa-lpc
> -   mm-api
>     genalloc
>     pin_user_pages
>     boot-time-mm
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst=20
> b/Documentation/translations/zh_CN/core-api/mm-api.rst
> new file mode 100644
> index 000000000000..52e23aa3a59b
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst
> @@ -0,0 +1,110 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/mm-api.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> + =E6=97=B6=E5=A5=8E=E4=BA=AE<alexs@kernel.org>
> +
> +.. _cn_core-api_mm-api:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86APIs
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +API=EF=BC=88Application Programming Interface=EF=BC=8C=E5=BA=94=E7=94=
=A8=E7=A8=8B=E5=BA=8F=E6=8E=A5=E5=8F=A3=EF=BC=89
> +
> +=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E5=86=85=E5=AD=98=E8=AE=BF=E9=97=AE
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +arch/x86/include/asm/uaccess.h
> +
> +arch/x86/lib/usercopy_32.c
> +
> +mm/gup.c
> +
> +.. _mm-api-gfp-flags:
> +
> +=E5=86=85=E5=AD=98=E5=88=86=E9=85=8D=E6=8E=A7=E5=88=B6
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +include/linux/gfp.h
> +
> +Slab=E7=BC=93=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=AD=A4=E7=BC=93=E5=AD=98=E9=9D=9Ecpu=E7=89=87=E4=B8=8A=E7=BC=93=E5=
=AD=98=EF=BC=8C=E8=AF=B7=E8=AF=BB=E8=80=85=E8=87=AA=E8=A1=8C=E6=9F=A5=E9=
=98=85=E8=B5=84=E6=96=99=E3=80=82
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +include/linux/slab.h
> +
> +mm/slab.c
> +
> +mm/slab_common.c
> +
> +mm/util.c
> +
> +=E8=99=9A=E6=8B=9F=E8=BF=9E=E7=BB=AD=EF=BC=88=E5=86=85=E5=AD=98=E9=A1=
=B5=EF=BC=89=E6=98=A0=E5=B0=84
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +mm/vmalloc.c
> +
> +
> +=E6=96=87=E4=BB=B6=E6=98=A0=E5=B0=84=E5=92=8C=E9=A1=B5=E9=9D=A2=E7=BC=
=93=E5=AD=98
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +mm/readahead.c
> +
> +mm/filemap.c
> +
> +mm/page-writeback.c
> +
> +mm/truncate.c
> +
> +include/linux/pagemap.h
> +
> +=E5=86=85=E5=AD=98=E6=B1=A0
> +=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +mm/mempool.c
> +
> +DMA=E6=B1=A0
> +=3D=3D=3D=3D=3D
> +
> +DMA(Direct Memory Access=EF=BC=8C=E7=9B=B4=E6=8E=A5=E5=AD=98=E5=82=A8=
=E5=99=A8=E8=AE=BF=E9=97=AE)
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +mm/dmapool.c
> +
> +=E6=9B=B4=E5=A4=9A=E7=9A=84=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E5=87=
=BD=E6=95=B0
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=
=A0=81=E4=B8=AD:
> +
> +mm/memory.c
> +
> +mm/page_alloc.c
> +
> +mm/mempolicy.c
> +
> +include/linux/mm_types.h
> +
> +include/linux/mm.h
> +
> +include/linux/mmzone.h
> --=20
> 2.27.0
>=20
>=20


--=20
- Jiaxun
