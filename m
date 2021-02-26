Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AAAC433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 04:39:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C878064EE4
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 04:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBZEjJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 23:39:09 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:47241 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229508AbhBZEjJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 23:39:09 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8BD3F5C0101;
        Thu, 25 Feb 2021 23:38:22 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 23:38:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=6EFJc
        xOTQ6BxgtvuZy6c2PuNinD+r67jrckxNx3wuy0=; b=Ic+N2Z5zJZA6e0300xNGX
        nW0FYHaWkq7Ft6h8Pf/i4t/CRlaVIDQJv7kvED8medYXmhvkm1Es+je224Y9atDV
        /iYZFPb3HrB2g9jLSzU83DbDETgJm6SuBBKf1Uz8kF2nlB1zKOytmx0VeCoGOcoS
        L1S7lh4gFqFnndUwg1PvAUubXKnAKmVhF0Cvl5ub5szYxIFpN2eaGVZ2THW/W/Id
        /p7fTpsK/21Oa/mBA7HK3rAcNdAJKhLlMLXXRzYs1su62YgHZs7aQTH+zC8sRE6r
        hgzkqhtoscdK1zNiXqTr3epuJjCLyVOdZ4aRjDaJXS8i4ZArB9mjnAAnhZBo3gM6
        g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=6EFJcxOTQ6BxgtvuZy6c2PuNinD+r67jrckxNx3wu
        y0=; b=jdCT8jUR8SfKi9tWHLF13mMjig7MNgHqH0cVteBhy4tvh4t9tKUw+To4R
        xhA44TcYWprUH1dJz42GDm8TtQ/KH5VHpGXaO+cGZ4jh6KbF6QE9f7f0hJTVzcTZ
        a8y+vcDt8cpwx5p/j76Nj5wxSqzpHfCmK5jtwi4LhN55Bx3gnp00+uhCh4/tmOQc
        aheGvKMsMWePLMrndb5iZSVmB5K0Qz+lVyC/yRAeNrgxSgYhEvbSIGvrCi3X4Xjs
        5zF/XmXAaPIaLN6hQpDMdq74PjKA0EluYuPPq8VPBN5X/dxWaYayEOVFkL/ojjPo
        QBJf+5Pu/xX5q2InYEdiCOrKYPjOA==
X-ME-Sender: <xms:PHs4YFCEf2d6qKgekh4KOpLlirfHWsiEMzNpwLwXPzaPQC66U4ybTA>
    <xme:PHs4YDhS4UNcBFPRqvMp3OiVAqrHg794Et99edjafFtsTHJE-RDRxNwkVZtFO9IjJ
    oV0Rn1ByvhZXQ92zlY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdelhfef
    heekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:PHs4YAmqzqmqyc_OXYeuOjil5dTYitc8x9AJfGHMoZzbg8E_usBfRg>
    <xmx:PHs4YPzn8czqE1uknZXbbFuiiiN0qm_6h3VV3r74256E8xXVe2fv1A>
    <xmx:PHs4YKTy_znhZ0C7omNHz38qJaeKhhHCPwEeCy6mbmhJswxFSQ4oFA>
    <xmx:Pns4YHKYgZ8jLYZGg4NFhgWrtTIju0RYqCElKV6Ag_KQAYTtJKuxHw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AD73D130005D; Thu, 25 Feb 2021 23:38:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <69ead859-ec9f-499b-a148-38af97d26da7@www.fastmail.com>
In-Reply-To: <20210225184136.4526-2-siyanteng@loongson.cn>
References: <20210225184136.4526-1-siyanteng@loongson.cn>
 <20210225184136.4526-2-siyanteng@loongson.cn>
Date:   Fri, 26 Feb 2021 12:38:00 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Alex Shi" <alex.shi@linux.alibaba.com>,
        "Harry Wei" <harryxiyou@gmail.com>,
        "yanteng si" <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, "Huacai Chen" <chenhuacai@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_1/4]_docs/zh=5FCN:add_riscv_boot-image-header.rs?=
 =?UTF-8?Q?t_translation?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Fri, Feb 26, 2021, at 2:41 AM, Yanteng Si wrote:
> This patch translates Documentation/riscv/boot-image-header.rst intoCh=
inese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> ---
>  .../zh_CN/riscv/boot-image-header.rst         | 67 ++++++++++++++++++=
+
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/boot-image-=
header.rst
>=20
> diff --git=20
> a/Documentation/translations/zh_CN/riscv/boot-image-header.rst=20
> b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> new file mode 100644
> index 000000000000..fadfe08d03d5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> @@ -0,0 +1,67 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/boot-image-header`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_boot-image-header.rst:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +RISC-V Linux=E5=90=AF=E5=8A=A8=E9=95=9C=E5=83=8F=E6=96=87=E4=BB=B6=E5=
=A4=B4
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +:Author: Atish Patra <atish.patra@wdc.com>
> +:Date:   20 May 2019
> +
> +=E6=AD=A4=E6=96=87=E6=A1=A3=E4=BB=85=E6=8F=8F=E8=BF=B0RISC-V Linux =E5=
=90=AF=E5=8A=A8=E6=96=87=E4=BB=B6=E5=A4=B4=E7=9A=84=E8=AF=A6=E6=83=85=E3=
=80=82
> +
> +TODO:
> +  =E5=86=99=E4=B8=80=E4=B8=AA=E5=AE=8C=E6=95=B4=E7=9A=84=E5=90=AF=E5=8A=
=A8=E6=8C=87=E5=8D=97=E3=80=82
> +
> +=E5=9C=A8=E8=A7=A3=E5=8E=8B=E5=90=8E=E7=9A=84Linux=E5=86=85=E6=A0=B8=E9=
=95=9C=E5=83=8F=E4=B8=AD=E5=AD=98=E5=9C=A8=E4=BB=A5=E4=B8=8B64=E5=AD=97=E8=
=8A=82=E7=9A=84=E6=96=87=E4=BB=B6=E5=A4=B4::
> +
> +	u32 code0;		  /* Executable code */
> +	u32 code1;		  /* Executable code */
> +	u64 text_offset;	  /* Image load offset, little endian */
> +	u64 image_size;		  /* Effective Image size, little endian */
> +	u64 flags;		  /* kernel flags, little endian */
> +	u32 version;		  /* Version of this header */
> +	u32 res1 =3D 0;		  /* Reserved */
> +	u64 res2 =3D 0;		  /* Reserved */
> +	u64 magic =3D 0x5643534952; /* Magic number, little endian, "RISCV" =
*/
> +	u32 magic2 =3D 0x05435352;  /* Magic number 2, little endian, "RSC\x=
05"=20
> */
> +	u32 res3;		  /* Reserved for PE COFF offset */
> +
> +=E8=BF=99=E7=A7=8D=E5=A4=B4=E6=A0=BC=E5=BC=8F=E4=B8=8EPE/COFF=E6=96=87=
=E4=BB=B6=E5=A4=B4=E5=85=BC=E5=AE=B9=EF=BC=8C=E5=B9=B6=E5=9C=A8=E5=BE=88=
=E5=A4=A7=E7=A8=8B=E5=BA=A6=E4=B8=8A=E5=8F=97=E5=88=B0ARM64=E6=96=87=E4=BB=
=B6=E5=A4=B4=E7=9A=84=E5=90=AF=E5=8F=91=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=
=8CARM64
> +=E5=92=8CRISC-V=E6=96=87=E4=BB=B6=E5=A4=B4=E5=8F=AF=E4=BB=A5=E5=9C=A8=
=E6=9C=AA=E6=9D=A5=E5=90=88=E5=B9=B6=E4=B8=BA=E4=B8=80=E4=B8=AA=E5=85=B1=
=E5=90=8C=E7=9A=84=E5=A4=B4=E3=80=82
> +
> +=E6=B3=A8=E6=84=8F
> +=3D=3D=3D=3D
> +
> +- =E5=B0=86=E6=9D=A5=E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=A4=8D=E7=94=A8=E8=BF=
=99=E4=B8=AA=E6=96=87=E4=BB=B6=E5=A4=B4=EF=BC=8C=E7=94=A8=E6=9D=A5=E5=AF=
=B9RISC-V=E7=9A=84EFI=E6=A1=A9=E6=8F=90=E4=BE=9B=E6=94=AF=E6=8C=81=E3=80=
=82=E4=B8=BA=E4=BA=86=E4=BD=BF=E5=86=85=E6=A0=B8=E9=95=9C=E5=83=8F=E5=A6=
=82=E5=90=8C=E4=B8=80=E4=B8=AA
> +  EFI=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E4=B8=80=E6=A0=B7=E5=8A=A0=E8=
=BD=BD=EF=BC=8CEFI=E8=A7=84=E8=8C=83=E4=B8=AD=E8=A7=84=E5=AE=9A=E5=9C=A8=
=E5=86=85=E6=A0=B8=E9=95=9C=E5=83=8F=E7=9A=84=E5=BC=80=E5=A7=8B=E9=9C=80=
=E8=A6=81PE/COFF=E9=95=9C=E5=83=8F=E6=96=87=E4=BB=B6=E5=A4=B4=E3=80=82=E4=
=B8=BA=E4=BA=86
> +  =E6=94=AF=E6=8C=81EFI=E6=A1=A9=EF=BC=8C=E5=BA=94=E8=AF=A5=E7=94=A8=E2=
=80=9CMZ=E2=80=9D=E9=AD=94=E6=9C=AF=E5=AD=97=E7=AC=A6=E6=9B=BF=E6=8D=A2=E6=
=8E=89code0=EF=BC=8C=E5=B9=B6=E4=B8=94res3=EF=BC=88=E5=81=8F=E7=A7=BB=E9=
=87=8F=E6=9C=AA0x3c=EF=BC=89=E5=BA=94=E6=8C=87=E5=90=91PE/COFF
=E4=B8=BA0x3c -> =E4=B8=BA 0x3c?
Also I'd prefer not to translate stub as it already become a well known =
noun.

> +  =E6=96=87=E4=BB=B6=E5=A4=B4=E7=9A=84=E5=85=B6=E4=BD=99=E9=83=A8=E5=88=
=86.
> +
> +- =E8=A1=A8=E7=A4=BA=E6=96=87=E4=BB=B6=E5=A4=B4=E7=9A=84=E7=89=88=E6=9C=
=AC=E5=8F=B7=E7=9A=84bit=E4=BD=8D=E5=9F=9F
Drop bit

> +
> +	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	Bits 0:15   =E6=AC=A1=E8=A6=81  =E7=89=88=E6=9C=AC
> +	Bits 16:31  =E4=B8=BB=E8=A6=81  =E7=89=88=E6=9C=AC
> +	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  =E8=BF=99=E4=BF=9D=E6=8C=81=E4=BA=86=E6=96=B0=E6=97=A7=E7=89=88=E6=9C=
=AC=E4=B9=8B=E9=97=B4=E7=9A=84=E5=85=BC=E5=AE=B9=E6=80=A7=E3=80=82
> +  =E5=BD=93=E5=89=8D=E7=89=88=E6=9C=AC=E8=A2=AB=E5=AE=9A=E4=B9=89=E4=B8=
=BA0.2=E3=80=82
> +
> +- =E4=BB=8E=E7=89=88=E6=9C=AC0.2=E5=BC=80=E5=A7=8B=EF=BC=8C=E7=BB=93=E6=
=9E=84=E4=BD=93=E6=88=90=E5=91=98=E2=80=9Cmagic=E2=80=9D=E5=B0=B1=E5=B7=B2=
=E7=BB=8F=E8=A2=AB=E5=BC=83=E7=94=A8=EF=BC=8C=E5=9C=A8=E4=B9=8B=E5=90=8E=
=E7=9A=84=E7=89=88=E6=9C=AC=E4=B8=AD=EF=BC=8C=E5=8F=AF=E8=83=BD=E4=BC=9A=
=E7=A7=BB=E9=99=A4=E6=8E=89=E5=AE=83=E3=80=82
> +  =E6=9C=80=E5=88=9D=EF=BC=8C=E8=AF=A5=E6=88=90=E5=91=98=E5=BA=94=E8=AF=
=A5=E4=B8=8EARM64=E5=A4=B4=E7=9A=84=E2=80=9Cmagic=E2=80=9D=E6=88=90=E5=91=
=98=E5=8C=B9=E9=85=8D=EF=BC=8C=E4=BD=86=E9=81=97=E6=86=BE=E7=9A=84=E6=98=
=AF=E5=B9=B6=E6=B2=A1=E6=9C=89=E3=80=82
> +  =E2=80=9Cmagic2=E2=80=9D=E6=88=90=E5=91=98=E4=BB=A3=E6=9B=BF=E2=80=9C=
magic=E2=80=9D=E6=88=90=E5=91=98=E4=B8=8EARM64=E5=A4=B4=E7=9B=B8=E5=8C=B9=
=E9=85=8D=E3=80=82
> +
> +- =E5=9C=A8=E5=BD=93=E5=89=8D=E7=9A=84=E6=96=87=E4=BB=B6=E5=A4=B4=EF=BC=
=8C=E6=A0=87=E5=BF=97=E4=BD=8D=E5=9F=9F=E5=8F=AA=E5=89=A9=E4=B8=8B=E4=BA=
=86=E4=B8=80=E4=B8=AA=E3=80=82
=E5=89=A9=E4=B8=8B=E4=BA=86=E4=B8=80=E4=B8=AA=E4=BD=8D

> +
> +	=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	Bit 0  =E5=86=85=E6=A0=B8=E5=AD=97=E8=8A=82=E5=BA=8F=E3=80=821 if BE=
, 0 if LE.
> +	=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +- =E5=AF=B9=E4=BA=8E=E5=BC=95=E5=AF=BC=E5=8A=A0=E8=BD=BD=E7=A8=8B=E5=BA=
=8F=E5=8A=A0=E8=BD=BD=E5=86=85=E6=A0=B8=E6=98=A0=E5=83=8F=E6=9D=A5=E8=AF=
=B4=EF=BC=8Cimage_size=E6=88=90=E5=91=98=E6=98=AF=E5=BC=BA=E5=88=B6=E6=80=
=A7=E8=A6=81=E5=86=99=E8=BF=9B=E6=96=87=E4=BB=B6=E5=A4=B4=E7=9A=84=EF=BC=
=8C=E5=90=A6=E5=88=99=E5=B0=86=E5=BC=95
> +  =E5=AF=BC=E5=A4=B1=E8=B4=A5=E3=80=82
Image size =E6=88=90=E5=91=98=E5=AF=B9=E5=BC=95=E5=AF=BC=E5=8A=A0=E8=BD=BD=
=E7=A8=8B=E5=BA=8F(or =E5=8A=A0=E8=BD=BD=E5=99=A8=EF=BC=9F) =E8=80=8C=E8=
=A8=80=E6=98=AF=E5=BF=85=E9=A1=BB=E7=9A=84=E3=80=82

> --=20
> 2.25.1
>=20
>

--=20
- Jiaxun
