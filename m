Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A67C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 04:33:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56D9064EB7
	for <linux-doc@archiver.kernel.org>; Fri, 26 Feb 2021 04:33:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhBZEcv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Feb 2021 23:32:51 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:45639 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229498AbhBZEcv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Feb 2021 23:32:51 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id B432C5C00DF;
        Thu, 25 Feb 2021 23:32:04 -0500 (EST)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Thu, 25 Feb 2021 23:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=RpaLH
        6U6sC/sBvLp4itaZpJK/4LXih1+3tVMcIIOd+o=; b=bxufQnnIJq9IadW+iu09f
        In+wXkyHGkhx3zboLANLWyWoekGcxwBYveGousuLGpM1oyY0NOTbJTN60ZCrlFYA
        B3do2Ssryf5hxvj2AuFZRdnIlrpUwblLlgVywBRFyws9mfGgpNtPYyyLrT1AgIHO
        P0vzemSmeoGHo9KggOqL6X5riBBYo/suwTQqO1Cu5aeSV6XXdlHTnFEYKhXCHKVC
        v6ILxTdXDaxCWL7L7cnE0aYOTdU6JNsFI0/ysF6N1M/S7UVt1XCu9dL6Cd0SrVQ0
        zTXmO+rOqw4ZRbnb28MmoovkW2ALCrV4/mwIdXosERzBKcTRjLL0QzSVzVdjlgMO
        A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=RpaLH6U6sC/sBvLp4itaZpJK/4LXih1+3tVMcIIOd
        +o=; b=ESTgt555fVASpRxKx9BT+tu9MAiM2nKB6AjZFQsNrv+1xUgt4hkv0W5co
        hsHYBg3K9deqpR2Fw8rbYCZrY+4DngMtRw8nmC5VoVQjhmylXuuylCF9QI7l6hRO
        jO+ll52I93LpcAXvkipdmpYa2ICtb4CrOysebCR5D76h6S/GoG9Dm5oas/X33G5y
        SgZ3T0pm7P1Mjl/MQ7J7pR2+y/t8HI+IbPMV/WTbUsdXDJvP7KoDZqnhQxc9cd7F
        0pZLuPRhZS1N69pW3wYRXR2hkbDnta4Lb4/jil88QtUq5U8P+tcvG4SrAt6VkPHL
        5jBo3n2F34fRaHQkilUsjawFKNRzg==
X-ME-Sender: <xms:wnk4YGsFeipUYa5sFznMUvS5x72mFEqrXjzLzCM9gtke-ap0LK6bsw>
    <xme:wnk4YLeMbMcF96hORRyBAG4IX4fECQleI3l8h6GJ_zXRWE13VYGWpockCNmHXTmVz
    aPgqkZdrAHfpk1DBXw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrledtgdejfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtgfesthhqredtreerjeenucfhrhhomhepfdflihgr
    gihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqe
    enucggtffrrghtthgvrhhnpeefteegkeevfeethffgudehgedvueduvdeifedvvdelhfef
    heekteefueektdefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
    hlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:wnk4YBysuNEVtVJdMhQjYqtIgP_GBlkQt6M6ml3edQRyNNaLuppyRw>
    <xmx:wnk4YBPc9WxSWaWh73j_AWu2lEdjrpSzTAlwA5RDAnVLE9G1RbcxJw>
    <xmx:wnk4YG-KL-CzNusQe5LGo2EtsdKxWf2eC5m1IOXjviqyeFT1lQY8UQ>
    <xmx:xHk4YNkAnuMVjwocJmMX3DYS7Y2lP9kvoPTDvIuYXTkv0WgiwlI8NA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 34B7C130005D; Thu, 25 Feb 2021 23:32:02 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-141-gf094924a34-fm-20210210.001-gf094924a
Mime-Version: 1.0
Message-Id: <521d672a-c3d7-4739-aa0b-e1363394a4b6@www.fastmail.com>
In-Reply-To: <20210225184136.4526-3-siyanteng@loongson.cn>
References: <20210225184136.4526-1-siyanteng@loongson.cn>
 <20210225184136.4526-3-siyanteng@loongson.cn>
Date:   Fri, 26 Feb 2021 12:31:41 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Alex Shi" <alex.shi@linux.alibaba.com>,
        "Harry Wei" <harryxiyou@gmail.com>,
        "yanteng si" <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, "Huacai Chen" <chenhuacai@gmail.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v3_2/4]_docs/zh=5FCN:_add_riscv_patch-acceptance.rs?=
 =?UTF-8?Q?t_translation?=
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Fri, Feb 26, 2021, at 2:41 AM, Yanteng Si wrote:
> This patch translates Documentation/riscv/patch-acceptance.rst into Ch=
ineae.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
> ---
>  .../zh_CN/riscv/patch-acceptance.rst          | 32 ++++++++++++++++++=
+
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/patch-accep=
tance.rst
>=20
> diff --git=20
> a/Documentation/translations/zh_CN/riscv/patch-acceptance.rst=20
> b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> new file mode 100644
> index 000000000000..75446871559f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/patch-acceptance.rst
> @@ -0,0 +1,32 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/patch-acceptance`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_riscv_patch-acceptance:
> +
> +
> +arch/riscv =E5=BC=80=E5=8F=91=E8=80=85=E7=BB=B4=E6=8A=A4=E6=8C=87=E5=8D=
=97
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +=E6=A6=82=E8=BF=B0
> +----
> +RISC-V=E6=8C=87=E4=BB=A4=E9=9B=86=E4=BD=93=E7=B3=BB=E7=BB=93=E6=9E=84=
=E6=98=AF=E5=85=AC=E5=BC=80=E5=BC=80=E5=8F=91=E7=9A=84=EF=BC=9A
> +=E6=AD=A3=E5=9C=A8=E8=BF=9B=E8=A1=8C=E7=9A=84=E8=8D=89=E6=A1=88=E5=8F=
=AF=E4=BE=9B=E6=89=80=E6=9C=89=E4=BA=BA=E6=9F=A5=E7=9C=8B=E5=92=8C=E6=B5=
=8B=E8=AF=95=E5=AE=9E=E7=8E=B0=E3=80=82=E6=96=B0=E6=A8=A1=E5=9D=97=E6=88=
=96=E8=80=85=E6=89=A9=E5=B1=95=E8=8D=89=E6=A1=88=E5=8F=AF=E8=83=BD=E4=BC=
=9A=E5=9C=A8=E5=BC=80=E5=8F=91=E8=BF=87=E7=A8=8B=E4=B8=AD=E5=8F=91
> +=E7=94=9F=E6=9B=B4=E6=94=B9---=E6=9C=89=E6=97=B6=E4=BB=A5=E4=B8=8D=E5=
=85=BC=E5=AE=B9=E7=9A=84=E6=96=B9=E5=BC=8F=E5=AF=B9=E4=BB=A5=E5=89=8D=E7=
=9A=84=E8=8D=89=E6=A1=88=E8=BF=9B=E8=A1=8C=E6=9B=B4=E6=94=B9=E3=80=82=E8=
=BF=99=E7=A7=8D=E7=81=B5=E6=B4=BB=E6=80=A7=E5=8F=AF=E8=83=BD=E4=BC=9A=E7=
=BB=99RISC-V Linux
> +=E7=BB=B4=E6=8A=A4=E8=80=85=E5=B8=A6=E6=9D=A5=E6=8C=91=E6=88=98=E3=80=
=82Linux=E5=BC=80=E5=8F=91=E8=BF=87=E7=A8=8B=E6=9B=B4=E5=96=9C=E6=AC=A2=E7=
=BB=8F=E8=BF=87=E8=89=AF=E5=A5=BD=E6=A3=80=E6=9F=A5=E5=92=8C=E6=B5=8B=E8=
=AF=95=E7=9A=84=E4=BB=A3=E7=A0=81=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E8=
=AF=95=E9=AA=8C=E4=BB=A3=E7=A0=81=E3=80=82=E6=88=91
> +=E4=BB=AC=E5=B8=8C=E6=9C=9B=E6=8E=A8=E5=B9=BF=E5=90=8C=E6=A0=B7=E7=9A=
=84=E8=A7=84=E5=88=99=E5=88=B0=E5=8D=B3=E5=B0=86=E8=A2=AB=E5=86=85=E6=A0=
=B8=E5=90=88=E5=B9=B6=E7=9A=84RISC-V=E7=9B=B8=E5=85=B3=E4=BB=A3=E7=A0=81=
=E3=80=82
> +
> +=E6=8F=90=E4=BA=A4=E8=A1=A5=E9=81=97=E6=B8=85=E5=8D=95

^=E9=99=84=E5=8A=A0=E7=9A=84=E6=8F=90=E4=BA=A4=E6=A3=80=E6=9F=A5=E5=8D=95=
=EF=BC=9F

Addendum means additional part to the regular patch submition check list=
.

> +-------------------------
> +=E5=A6=82=E6=9E=9CRISC-V=E5=9F=BA=E9=87=91=E4=BC=9A=E5=B0=86=E8=BF=99=
=E4=BA=9B=E6=A8=A1=E5=9D=97=E6=88=96=E6=89=A9=E5=B1=95=E7=9A=84=E8=A7=84=
=E8=8C=83=E5=88=97=E4=B8=BA=E2=80=9C=E5=86=BB=E7=BB=93=E2=80=9D=E6=88=96=
=E2=80=9C=E5=B7=B2=E6=89=B9=E5=87=86=E2=80=9D=EF=BC=8C=E5=88=99=E6=88=91=
=E4=BB=AC=E4=BB=85=E6=8E=A5=E5=8F=97=E6=96=B0=E6=A8=A1=E5=9D=97
> +=E6=88=96=E6=89=A9=E5=B1=95=E7=9A=84=E8=A1=A5=E4=B8=81=E3=80=82 =EF=BC=
=88=E7=88=B1=E5=A5=BD=E8=80=85=E5=BD=93=E7=84=B6=E5=8F=AF=E4=BB=A5=E7=BB=
=B4=E6=8A=A4=E8=87=AA=E5=B7=B1=E7=9A=84Linux=E5=86=85
^ such expression seems bogus in Chinese, should be
=E6=88=91=E4=BB=AC=E4=BB=85=E6=8E=A5=E5=8F=97=E7=9B=B8=E5=85=B3=E6=A0=87=
=E5=87=86=E5=B7=B2=E7=BB=8F=E8=A2=ABRISC-V=E5=9F=BA=E9=87=91=E4=BC=9A=E6=
=A0=87=E5=87=86=E4=B8=BA=E2=80=9C=E5=B7=B2=E6=89=B9=E5=87=86=E2=80=9D=E6=
=88=96=E2=80=9C=E5=B7=B2=E5=86=BB=E7=BB=93=E2=80=9D=E7=9A=84=E6=89=A9=E5=
=B1=95=E6=88=96=E6=A8=A1=E5=9D=97=E7=9A=84=E8=A1=A5=E4=B8=81=E3=80=82

=E6=A0=B8=E6=A0=91=EF=BC=8C=E5=85=B6=E4=B8=AD=E5=8C=85=E5=90=AB=E6=89=80=
=E9=9C=80=E4=BB=A3=E7=A0=81=E6=89=A9=E5=B1=95=E8=8D=89=E6=A1=88
> +=E7=9A=84=E4=BB=A3=E7=A0=81=E3=80=82=EF=BC=89
=E7=88=B1=E5=A5=BD=E8=80=85 means hobbiest, I'd prefer =E5=BC=80=E5=8F=91=
=E8=80=85 over =E7=88=B1=E5=A5=BD=E8=80=85=EF=BC=8C as it's exactly Deve=
loper means.

> +
> +=E6=AD=A4=E5=A4=96=EF=BC=8CRISC-V=E8=A7=84=E8=8C=83=E5=85=81=E8=AE=B8=
=E7=88=B1=E5=A5=BD=E8=80=85=E5=88=9B=E5=BB=BA=E8=87=AA=E5=B7=B1=E7=9A=84=
=E8=87=AA=E5=AE=9A=E4=B9=89=E6=89=A9=E5=B1=95=E3=80=82=E8=BF=99=E4=BA=9B=
=E8=87=AA=E5=AE=9A=E4=B9=89=E6=8B=93=E5=B1=95=E4=B8=8D=E9=9C=80=E8=A6=81=
=E9=80=9A=E8=BF=87RISC-V
> +=E5=9F=BA=E9=87=91=E4=BC=9A=E7=9A=84=E4=BB=BB=E4=BD=95=E5=AE=A1=E6=A0=
=B8=E6=88=96=E6=89=B9=E5=87=86=E3=80=82=E4=B8=BA=E4=BA=86=E9=81=BF=E5=85=
=8D=E5=B0=86=E7=88=B1=E5=A5=BD=E8=80=85=E4=B8=80=E4=BA=9B=E7=89=B9=E5=88=
=AB=E7=9A=84RISC-V=E6=8B=93=E5=B1=95=E6=B7=BB=E5=8A=A0=E8=BF=9B=E5=86=85=
=E6=A0=B8=E4=BB=A3=E7=A0=81=E5=B8=A6=E6=9D=A5
> +=E7=9A=84=E7=BB=B4=E6=8A=A4=E5=A4=8D=E6=9D=82=E6=80=A7=E5=92=8C=E5=AF=
=B9=E6=80=A7=E8=83=BD=E7=9A=84=E6=BD=9C=E5=9C=A8=E5=BD=B1=E5=93=8D=EF=BC=
=8C=E6=88=91=E4=BB=AC=E5=B0=86=E5=8F=AA=E6=8E=A5=E5=8F=97RISC-V=E5=9F=BA=
=E9=87=91=E4=BC=9A=E6=AD=A3=E5=BC=8F=E5=86=BB=E7=BB=93=E6=88=96=E6=89=B9=
=E5=87=86=E7=9A=84=E7=9A=84=E6=89=A9=E5=B1=95
> +=E8=A1=A5=E4=B8=81=E3=80=82=EF=BC=88=E7=88=B1=E5=A5=BD=E8=80=85=E5=BD=
=93=E7=84=B6=E5=8F=AF=E4=BB=A5=E7=BB=B4=E6=8A=A4=E8=87=AA=E5=B7=B1=E7=9A=
=84Linux=E5=86=85=E6=A0=B8=E6=A0=91=EF=BC=8C=E5=85=B6=E4=B8=AD=E5=8C=85=E5=
=90=AB=E4=BB=96=E4=BB=AC=E6=83=B3=E8=A6=81=E7=9A=84=E4=BB=BB=E4=BD=95=E8=
=87=AA=E5=AE=9A=E4=B9=89=E6=89=A9=E5=B1=95
> +=E7=9A=84=E4=BB=A3=E7=A0=81=E3=80=82=EF=BC=89
Again, implementer means those who are implementing their own RISC-V cor=
e design.
s/=E7=88=B1=E5=A5=BD=E8=80=85/=E5=AE=9E=E6=96=BD=E8=80=85 or =E6=89=A7=E8=
=A1=8C=E8=80=85 =E5=AE=9E=E7=8E=B0=E8=80=85=EF=BC=9F

thanks

> --=20
> 2.25.1
>=20
>

--=20
- Jiaxun
