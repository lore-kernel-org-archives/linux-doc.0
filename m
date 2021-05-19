Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EBBC43461
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:11:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C0DB60FF2
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 18:11:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbhESSM6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 14:12:58 -0400
Received: from [43.250.32.171] ([43.250.32.171]:54241 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229708AbhESSM6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 May 2021 14:12:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Ddl7G0N8Qt5jlSpqXoZI0YKgAf48IU0Why9Wh
        BaS11c=; b=YImLvL/5mobg/ZqTdencf0+Gt7rZxiA7coVnc2xK6cDwANIs8leLW
        HBdkFoFKA9jNk8O6q74fHjPZnz3C1pji+vQSEDwUhZqsNvp/90zotUSaPqb7uD7u
        v4ZswKII0fSrEDBZ3PeGiTJCyccoFNwCPvvhDBd/4Jlg2UcL15nSvk=
Received: from bobwxc.top (unknown [112.96.194.207])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAHz0HOVKVgVikzAA--.57262S2;
        Thu, 20 May 2021 02:11:28 +0800 (CST)
Date:   Thu, 20 May 2021 02:11:26 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 2/2] docs/zh_CN: add core api local_ops.rst translation
Message-ID: <20210519181125.GA24183@bobwxc.top>
References: <cover.1621255695.git.siyanteng@loongson.cn>
 <d3b3209a81bd225f6c6983c49b16a6ac8d93f054.1621255695.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Content-Disposition: inline
In-Reply-To: <d3b3209a81bd225f6c6983c49b16a6ac8d93f054.1621255695.git.siyanteng@loongson.cn>
X-today: 520 day
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAHz0HOVKVgVikzAA--.57262S2
X-Coremail-Antispam: 1UD129KBjvJXoW3JFW8ZF1kKw1DZF1rtw1rCrg_yoWfKFyDpF
        9Ikr97ta1fJFyDta4xKF1DtF1Dua18AasF9ay8AF93trs2yrZxJr47KF1vqrWfW3yvvFWk
        JFWagr15Cryay37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUy0b7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIec
        xEwVAFwVW5MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E
        4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
        WUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
        Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
        WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
        YxBIdaVFxhVjvjDU0xZFpf9x07U6v38UUUUU=
X-Originating-IP: [112.96.194.207]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:08:52AM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/local_ops.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   3 +-
>  .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++++
>  2 files changed, 195 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/local_ops.r=
st
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index 8f0b3fe8723d..c7a004bf2bd6 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -59,11 +59,10 @@ Linux=E5=A6=82=E4=BD=95=E8=AE=A9=E4=B8=80=E5=88=87=E5=
=90=8C=E6=97=B6=E5=8F=91=E7=94=9F=E3=80=82 =E8=AF=A6=E6=83=85=E8=AF=B7=E5=
=8F=82=E9=98=85
> =20
>     irq/index
>     refcount-vs-atomic
> -
> +   local_ops
> =20
>  Todolist:
> =20
> -   local_ops
>     padata
>     ../RCU/index
> =20
> diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst b/Do=
cumentation/translations/zh_CN/core-api/local_ops.rst
> new file mode 100644
> index 000000000000..1294cc1864ff
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
> @@ -0,0 +1,194 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/local_ops.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_local_ops:
> +
> +

Which is better for "local" in this article, =E5=B1=80=E9=83=A8 or =E6=9C=
=AC=E5=9C=B0=EF=BC=9F
Seems not much different

> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E8=AF=AD=
=E4=B9=89=E5=92=8C=E8=A1=8C=E4=B8=BA
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:=E4=BD=9C=E8=80=85: Mathieu Desnoyers
> +
> +
> +=E6=9C=AC=E6=96=87=E8=A7=A3=E9=87=8A=E4=BA=86=E6=9C=AC=E5=9C=B0=E5=8E=9F=
=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E7=9B=AE=E7=9A=84=EF=BC=8C=E5=A6=82=E4=
=BD=95=E4=B8=BA=E4=BB=BB=E4=BD=95=E7=BB=99=E5=AE=9A=E7=9A=84=E6=9E=B6=E6=9E=
=84=E5=AE=9E=E7=8E=B0=E8=BF=99=E4=BA=9B=E6=93=8D=E4=BD=9C=EF=BC=8C=E5=B9=B6=
=E8=AF=B4=E6=98=8E

=E8=AF=B4=E6=98=8E=E4=BA=86 or =E5=B1=95=E7=A4=BA=E4=BA=86

> +=E5=A6=82=E4=BD=95=E6=AD=A3=E7=A1=AE=E4=BD=BF=E7=94=A8=E8=BF=99=E4=BA=9B=
=E6=93=8D=E4=BD=9C=E3=80=82=E5=AE=83=E8=BF=98=E5=BC=BA=E8=B0=83=E4=BA=86=E5=
=9C=A8=E5=86=85=E5=AD=98=E5=86=99=E5=85=A5=E9=A1=BA=E5=BA=8F=E5=BE=88=E9=87=
=8D=E8=A6=81=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E8=B7=A8CPU=E8=AF=
=BB=E5=8F=96
> +=E8=BF=99=E4=BA=9B=E6=9C=AC=E5=9C=B0=E5=8F=98=E9=87=8F=E6=97=B6=E5=BF=85=
=E9=A1=BB=E9=87=87=E5=8F=96=E7=9A=84=E9=A2=84=E9=98=B2=E6=8E=AA=E6=96=BD=E3=
=80=82
> +
> +.. note::
> +
> +    =E6=B3=A8=E6=84=8F=EF=BC=8C=E5=9F=BA=E4=BA=8E ``local_t`` =E7=9A=84=
=E6=93=8D=E4=BD=9C=E4=B8=8D=E5=BB=BA=E8=AE=AE=E5=9C=A8=E9=80=9A=E7=94=A8=E7=
=9A=84=E5=86=85=E6=A0=B8=E4=B8=AD=E4=BD=BF=E7=94=A8=E3=80=82=E8=AF=B7=E4=BD=
=BF=E7=94=A8 ``this_cpu``

=E4=B8=8D=E5=BB=BA=E8=AE=AE=E7=94=A8=E4=BA=8E=E4=B8=80=E8=88=AC=E5=86=85=E6=
=A0=B8=E6=93=8D=E4=BD=9C

> +    =E6=93=8D=E4=BD=9C=E6=9D=A5=E4=BB=A3=E6=9B=BF=E4=BD=BF=E7=94=A8=EF=
=BC=8C=E9=99=A4=E9=9D=9E=E7=9C=9F=E7=9A=84=E6=9C=89=E7=89=B9=E6=AE=8A=E7=9B=
=AE=E7=9A=84=E3=80=82=E5=A4=A7=E5=A4=9A=E6=95=B0=E5=86=85=E6=A0=B8=E4=B8=AD=
=E4=BD=BF=E7=94=A8=E7=9A=84 ``local_t`` =E5=B7=B2
> +    =E7=BB=8F=E8=A2=AB ``this_cpu`` =E6=93=8D=E4=BD=9C=E6=89=80=E5=8F=96=
=E4=BB=A3=E3=80=82 ``this_cpu`` =E6=93=8D=E4=BD=9C=E5=9C=A8=E4=B8=80=E6=9D=
=A1=E6=8C=87=E4=BB=A4=E4=B8=AD=E7=BB=93=E5=90=88=E4=BA=86=E9=87=8D
> +    =E5=AE=9A=E4=BD=8D=E5=92=8C=E7=B1=BB=E4=BC=BC ``local_t`` =E7=9A=84=
=E8=AF=AD=E4=B9=89=EF=BC=8C=E4=BA=A7=E7=94=9F=E4=BA=86=E6=9B=B4=E7=B4=A7=E5=
=87=91=E5=92=8C=E6=9B=B4=E5=BF=AB=E7=9A=84=E6=89=A7=E8=A1=8C=E4=BB=A3=E7=A0=
=81=E3=80=82
> +
> +
> +=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E7=9B=AE=
=E7=9A=84
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E7=9B=AE=
=E7=9A=84=E6=98=AF=E6=8F=90=E4=BE=9B=E5=BF=AB=E9=80=9F=E5=92=8C=E9=AB=98=E5=
=BA=A6=E5=8F=AF=E9=87=8D=E5=85=A5=E7=9A=84=E6=AF=8FCPU=E8=AE=A1=E6=95=B0=E5=
=99=A8=E3=80=82=E5=AE=83=E4=BB=AC=E9=80=9A=E8=BF=87=E7=A7=BB=E9=99=A4LOCK=
=E5=89=8D
> +=E7=BC=80=E5=92=8C=E9=80=9A=E5=B8=B8=E9=9C=80=E8=A6=81=E5=9C=A8CPU=E9=97=
=B4=E5=90=8C=E6=AD=A5=E7=9A=84=E5=86=85=E5=AD=98=E5=B1=8F=E9=9A=9C=EF=BC=8C=
=E5=B0=86=E6=A0=87=E5=87=86=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E6=
=80=A7=E8=83=BD=E6=88=90=E6=9C=AC=E9=99=8D=E5=88=B0=E6=9C=80=E4=BD=8E=E3=80=
=82
> +
> +=E5=9C=A8=E8=AE=B8=E5=A4=9A=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E6=8B=A5=
=E6=9C=89=E5=BF=AB=E9=80=9F=E7=9A=84=E6=AF=8FCPU=E5=8E=9F=E5=AD=90=E8=AE=A1=
=E6=95=B0=E5=99=A8=E6=98=AF=E5=BE=88=E6=9C=89=E8=B6=A3=E7=9A=84=EF=BC=9A=E5=
=AE=83=E4=B8=8D=E9=9C=80=E8=A6=81=E7=A6=81=E7=94=A8=E4=B8=AD=E6=96=AD=E6=9D=
=A5=E4=BF=9D=E6=8A=A4=E4=B8=AD

s/=E6=9C=89=E8=B6=A3/=E6=9C=89=E5=90=B8=E5=BC=95=E5=8A=9B/

> +=E6=96=AD=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=EF=BC=8C=E5=AE=83=E5=85=81=
=E8=AE=B8=E5=9C=A8NMI=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=E4=B8=AD=E4=BD=BF=
=E7=94=A8=E8=BF=9E=E8=B4=AF=E7=9A=84=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82=E5=
=AE=83=E5=AF=B9=E8=BF=BD=E8=B8=AA=E7=9B=AE=E7=9A=84=E5=92=8C=E5=90=84=E7=A7=
=8D=E6=80=A7=E8=83=BD=E7=9B=91

=EF=BC=88Non Maskable Interrupt=EF=BC=89

> +=E6=B5=8B=E8=AE=A1=E6=95=B0=E5=99=A8=E7=89=B9=E5=88=AB=E6=9C=89=E7=94=A8=
=E3=80=82
> +
> +=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E5=8F=AA=E4=BF=9D=
=E8=AF=81=E5=9C=A8=E6=8B=A5=E6=9C=89=E6=95=B0=E6=8D=AE=E7=9A=84CPU=E4=B8=8A=
=E7=9A=84=E5=8F=98=E9=87=8F=E4=BF=AE=E6=94=B9=E7=9A=84=E5=8E=9F=E5=AD=90=E6=
=80=A7=E3=80=82=E5=9B=A0=E6=AD=A4=EF=BC=8C=E5=BF=85=E9=A1=BB=E6=B3=A8=E6=84=
=8F=E7=A1=AE=E4=BF=9D=E5=8F=AA
> +=E6=9C=89=E4=B8=80=E4=B8=AACPU=E5=86=99=E5=88=B0 ``local_t`` =E7=9A=84=
=E6=95=B0=E6=8D=AE=E3=80=82=E8=BF=99=E6=98=AF=E9=80=9A=E8=BF=87=E4=BD=BF=E7=
=94=A8=E6=AF=8FCPU=E7=9A=84=E6=95=B0=E6=8D=AE=E6=9D=A5=E5=AE=9E=E7=8E=B0=E7=
=9A=84=EF=BC=8C=E5=B9=B6=E7=A1=AE
> +=E4=BF=9D=E6=88=91=E4=BB=AC=E5=9C=A8=E4=B8=80=E4=B8=AA=E6=8A=A2=E5=8D=A0=
=E5=BC=8F=E5=AE=89=E5=85=A8=E4=B8=8A=E4=B8=8B=E6=96=87=E4=B8=AD=E4=BF=AE=E6=
=94=B9=E5=AE=83=E3=80=82=E7=84=B6=E8=80=8C=EF=BC=8C=E4=BB=8E=E4=BB=BB=E4=BD=
=95=E4=B8=80=E4=B8=AACPU=E8=AF=BB=E5=8F=96 ``local_t``
> +=E6=95=B0=E6=8D=AE=E9=83=BD=E6=98=AF=E5=85=81=E8=AE=B8=E7=9A=84=EF=BC=9A=
=E8=BF=99=E6=A0=B7=E5=AE=83=E5=B0=B1=E4=BC=9A=E6=98=BE=E5=BE=97=E4=B8=8E=E6=
=89=80=E6=9C=89=E8=80=85CPU=E7=9A=84=E5=85=B6=E4=BB=96=E5=86=85=E5=AD=98=E5=
=86=99=E5=85=A5=E9=A1=BA=E5=BA=8F=E4=B8=8D=E4=B8=80=E8=87=B4=E3=80=82
> +
> +
> +=E9=92=88=E5=AF=B9=E7=89=B9=E5=AE=9A=E6=9E=B6=E6=9E=84=E7=9A=84=E5=AE=9E=
=E7=8E=B0
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=BF=99=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E7=A8=8D=E5=BE=AE=E4=BF=AE=
=E6=94=B9=E6=A0=87=E5=87=86=E7=9A=84=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E6=
=9D=A5=E5=AE=9E=E7=8E=B0=EF=BC=9A=E5=8F=AA=E6=9C=89=E5=AE=83=E4=BB=AC=E7=9A=
=84UP=E5=8F=98=E4=BD=93=E5=BF=85=E9=A1=BB=E8=A2=AB=E4=BF=9D=E7=95=99=E3=80=
=82=E8=BF=99=E9=80=9A=E5=B8=B8
> +=E6=84=8F=E5=91=B3=E7=9D=80=E5=88=A0=E9=99=A4LOCK=E5=89=8D=E7=BC=80=EF=
=BC=88=E5=9C=A8i386=E5=92=8Cx86_64=E4=B8=8A=EF=BC=89=E5=92=8C=E4=BB=BB=E4=
=BD=95SMP=E5=90=8C=E6=AD=A5=E5=B1=8F=E9=9A=9C=E3=80=82=E5=A6=82=E6=9E=9C=E6=
=9E=B6=E6=9E=84=E5=9C=A8 SMP
----------------------------------------------------------------------^
a space

> +=E5=92=8CUP=E4=B9=8B=E9=97=B4=E6=B2=A1=E6=9C=89=E4=B8=8D=E5=90=8C=E7=9A=
=84=E8=A1=8C=E4=B8=BA=EF=BC=8C=E5=9C=A8=E4=BD=A0=E7=9A=84=E6=9E=B6=E6=9E=84=
=E7=9A=84 ``local.h`` =E4=B8=AD=E5=8C=85=E6=8B=AC ``asm-generic/local.h``
> +=E5=B0=B1=E8=B6=B3=E5=A4=9F=E4=BA=86=E3=80=82
> +
> +=E9=80=9A=E8=BF=87=E5=9C=A8=E4=B8=80=E4=B8=AA=E7=BB=93=E6=9E=84=E4=B8=AD=
=E5=B5=8C=E5=85=A5=E4=B8=80=E4=B8=AA ``atomic_long_t`` =EF=BC=8C ``local_t`=
` =E7=B1=BB=E5=9E=8B=E8=A2=AB=E5=AE=9A=E4=B9=89=E4=B8=BA

=E7=BB=93=E6=9E=84=E4=BD=93

> +=E4=B8=80=E4=B8=AA=E4=B8=8D=E9=80=8F=E6=98=8E=E7=9A=84 ``signed long`` =
=E5=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E8=BF=99=E6=A0=B7=E5=81=9A=E7=9A=84=E7=
=9B=AE=E7=9A=84=E6=98=AF=E4=B8=BA=E4=BA=86=E4=BD=BF=E4=BB=8E=E8=BF=99=E4=B8=
=AA=E7=B1=BB=E5=9E=8B=E5=88=B0

=E5=AD=97=E7=AC=A6=E4=B8=B2 =E7=A1=AE=E5=AE=9A=E4=B9=88=EF=BC=9F

> +``long`` =E7=9A=84=E8=BD=AC=E6=8D=A2=E5=A4=B1=E8=B4=A5=E3=80=82=E8=AF=A5=
=E5=AE=9A=E4=B9=89=E7=9C=8B=E8=B5=B7=E6=9D=A5=E5=83=8F::
> +
> +    typedef struct { atomic_long_t a; } local_t;
> +
> +
> +=E4=BD=BF=E7=94=A8=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=
=E6=97=B6=E5=BA=94=E9=81=B5=E5=BE=AA=E7=9A=84=E8=A7=84=E5=88=99
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
> +
> +* =E8=A2=AB=E6=9C=AC=E5=9C=B0=E6=93=8D=E4=BD=9C=E8=A7=A6=E5=8F=8A=E7=9A=
=84=E5=8F=98=E9=87=8F=E5=BF=85=E9=A1=BB=E6=98=AF=E6=AF=8Fcpu=E7=9A=84=E5=8F=
=98=E9=87=8F=E3=80=82
> +
> +* =E5=8F=AA=E6=9C=89=E8=BF=99=E4=BA=9B=E5=8F=98=E9=87=8F=E7=9A=84CPU=E6=
=89=80=E6=9C=89=E8=80=85=E6=89=8D=E5=8F=AF=E4=BB=A5=E5=86=99=E5=85=A5=E8=BF=
=99=E4=BA=9B=E5=8F=98=E9=87=8F=E3=80=82

*=E5=8F=AA=E6=9C=89*=20

> +
> +* =E8=BF=99=E4=B8=AACPU=E5=8F=AF=E4=BB=A5=E4=BB=8E=E4=BB=BB=E4=BD=95=E4=
=B8=8A=E4=B8=8B=E6=96=87=EF=BC=88=E8=BF=9B=E7=A8=8B=E3=80=81=E4=B8=AD=E6=96=
=AD=E3=80=81=E8=BD=AF=E4=B8=AD=E6=96=AD=E3=80=81nmi...=EF=BC=89=E4=B8=AD=E4=
=BD=BF=E7=94=A8=E6=9C=AC=E5=9C=B0=E6=93=8D=E4=BD=9C=E6=9D=A5=E6=9B=B4=E6=96=
=B0
> +  =E5=AE=83=E7=9A=84local_t=E5=8F=98=E9=87=8F=E3=80=82
> +
> +* =E5=BD=93=E5=9C=A8=E8=BF=9B=E7=A8=8B=E4=B8=8A=E4=B8=8B=E6=96=87=E4=B8=
=AD=E4=BD=BF=E7=94=A8=E6=9C=AC=E5=9C=B0=E6=93=8D=E4=BD=9C=E6=97=B6=EF=BC=8C=
=E5=BF=85=E9=A1=BB=E7=A6=81=E7=94=A8=E6=8A=A2=E5=8D=A0=EF=BC=88=E6=88=96=E4=
=B8=AD=E6=96=AD=EF=BC=89=EF=BC=8C=E4=BB=A5=E7=A1=AE=E4=BF=9D=E8=BF=9B=E7=A8=
=8B=E5=9C=A8=E8=8E=B7=E5=BE=97=E6=AF=8F
> +  CPU=E5=8F=98=E9=87=8F=E5=92=8C=E8=BF=9B=E8=A1=8C=E5=AE=9E=E9=99=85=E7=
=9A=84=E6=9C=AC=E5=9C=B0=E6=93=8D=E4=BD=9C=E4=B9=8B=E9=97=B4=E4=B8=8D=E4=BC=
=9A=E8=A2=AB=E8=BF=81=E7=A7=BB=E5=88=B0=E4=B8=8D=E5=90=8C=E7=9A=84CPU=E3=80=
=82
> +
> +* =E5=BD=93=E5=9C=A8=E4=B8=AD=E6=96=AD=E4=B8=8A=E4=B8=8B=E6=96=87=E4=B8=
=AD=E4=BD=BF=E7=94=A8=E6=9C=AC=E5=9C=B0=E6=93=8D=E4=BD=9C=E6=97=B6=EF=BC=8C=
=E5=9C=A8=E4=B8=BB=E7=BA=BF=E5=86=85=E6=A0=B8=E4=B8=8A=E4=B8=8D=E9=9C=80=E8=
=A6=81=E7=89=B9=E5=88=AB=E6=B3=A8=E6=84=8F=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=AE=
=83=E4=BB=AC=E5=B0=86=E5=9C=A8=E5=B1=80
> +  =E9=83=A8CPU=E4=B8=8A=E8=BF=90=E8=A1=8C=EF=BC=8C=E5=B9=B6=E4=B8=94=E5=
=B7=B2=E7=BB=8F=E7=A6=81=E7=94=A8=E4=BA=86=E6=8A=A2=E5=8D=A0=E3=80=82=E7=84=
=B6=E8=80=8C=EF=BC=8C=E6=88=91=E5=BB=BA=E8=AE=AE=E6=97=A0=E8=AE=BA=E5=A6=82=
=E4=BD=95=E9=83=BD=E8=A6=81=E6=98=8E=E7=A1=AE=E5=9C=B0=E7=A6=81=E7=94=A8=E6=
=8A=A2=E5=8D=A0=EF=BC=8C
> +  =E4=BB=A5=E7=A1=AE=E4=BF=9D=E5=AE=83=E5=9C=A8-rt=E5=86=85=E6=A0=B8=E4=
=B8=8A=E4=BB=8D=E8=83=BD=E6=AD=A3=E7=A1=AE=E5=B7=A5=E4=BD=9C=E3=80=82
> +
> +* =E8=AF=BB=E5=8F=96=E6=9C=AC=E5=9C=B0cpu=E5=8F=98=E9=87=8F=E5=B0=86=E6=
=8F=90=E4=BE=9B=E8=AF=A5=E5=8F=98=E9=87=8F=E7=9A=84=E5=BD=93=E5=89=8D=E6=8B=
=B7=E8=B4=9D=E3=80=82
> +
> +* =E5=AF=B9=E8=BF=99=E4=BA=9B=E5=8F=98=E9=87=8F=E7=9A=84=E8=AF=BB=E5=8F=
=96=E5=8F=AF=E4=BB=A5=E4=BB=8E=E4=BB=BB=E4=BD=95CPU=E8=BF=9B=E8=A1=8C=EF=BC=
=8C=E5=9B=A0=E4=B8=BA=E5=AF=B9 =E2=80=9C ``long`` =E2=80=9D=EF=BC=8C=E5=AF=
=B9=E9=BD=90=E7=9A=84=E5=8F=98=E9=87=8F=E7=9A=84=E6=9B=B4=E6=96=B0
> +  =E6=80=BB=E6=98=AF=E5=8E=9F=E5=AD=90=E7=9A=84=E3=80=82=E7=94=B1=E4=BA=
=8E=E5=86=99=E7=A8=8B=E5=BA=8F=E7=9A=84CPU=E6=B2=A1=E6=9C=89=E8=BF=9B=E8=A1=
=8C=E5=86=85=E5=AD=98=E5=90=8C=E6=AD=A5=EF=BC=8C=E6=89=80=E4=BB=A5=E5=9C=A8=
=E8=AF=BB=E5=8F=96=E5=85=B6=E4=BB=96cpu=E7=9A=84=E5=8F=98=E9=87=8F=E6=97=B6=
=EF=BC=8C=E5=8F=AF

s/=E5=86=99=E7=A8=8B=E5=BA=8F/=E5=86=99=E5=85=A5=E7=A8=8B=E5=BA=8F/
*=E5=85=B6=E4=BB=96*

> +  =E4=BB=A5=E8=AF=BB=E5=8F=96=E8=AF=A5=E5=8F=98=E9=87=8F=E7=9A=84=E8=BF=
=87=E6=9C=9F=E5=89=AF=E6=9C=AC=E3=80=82
> +
> +
> +=E5=A6=82=E4=BD=95=E4=BD=BF=E7=94=A8=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=
=E6=93=8D=E4=BD=9C
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +::
> +
> +    #include <linux/percpu.h>
> +    #include <asm/local.h>
> +
> +    static DEFINE_PER_CPU(local_t, counters) =3D LOCAL_INIT(0);
> +
> +
> +=E8=AE=A1=E6=95=B0=E5=99=A8
> +=3D=3D=3D=3D=3D=3D
> +
> +=E8=AE=A1=E6=95=B0=E6=98=AF=E5=9C=A8=E4=B8=80=E4=B8=AAsigned long=E7=9A=
=84=E6=89=80=E6=9C=89=E4=BD=8D=E4=B8=8A=E8=BF=9B=E8=A1=8C=E7=9A=84=E3=80=82
> +
> +=E5=9C=A8=E5=8F=AF=E6=8A=A2=E5=8D=A0=E7=9A=84=E4=B8=8A=E4=B8=8B=E6=96=87=
=E4=B8=AD=EF=BC=8C=E5=9B=B4=E7=BB=95=E6=9C=AC=E5=9C=B0=E5=8E=9F=E5=AD=90=E6=
=93=8D=E4=BD=9C=E4=BD=BF=E7=94=A8 ``get_cpu_var()`` =E5=92=8C
> +``put_cpu_var()`` =EF=BC=9A=E5=AE=83=E7=A1=AE=E4=BF=9D=E5=9C=A8=E5=AF=B9=
=E6=AF=8F=E4=B8=AAcpu=E5=8F=98=E9=87=8F=E8=BF=9B=E8=A1=8C=E5=86=99=E8=AE=BF=
=E9=97=AE=E6=97=B6=EF=BC=8C=E6=8A=A2=E5=8D=A0=E8=A2=AB=E7=A6=81=E7=94=A8=E3=
=80=82=E6=AF=94=E5=A6=82
> +=E8=AF=B4::
> +
> +    local_inc(&get_cpu_var(counters));
> +    put_cpu_var(counters);
> +
> +=E5=A6=82=E6=9E=9C=E4=BD=A0=E5=B7=B2=E7=BB=8F=E5=9C=A8=E4=B8=80=E4=B8=AA=
=E6=8A=A2=E5=8D=A0=E5=BC=8F=E5=AE=89=E5=85=A8=E4=B8=8A=E4=B8=8B=E6=96=87=E4=
=B8=AD=EF=BC=8C=E4=BD=A0=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8 ``this_cpu_ptr=
()`` =E4=BB=A3=E6=9B=BF::

remove =E5=BC=8F =EF=BC=9F

> +
> +    local_inc(this_cpu_ptr(&counters));
> +
> +
> +
> +=E8=AF=BB=E5=8F=96=E8=AE=A1=E6=95=B0=E5=99=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E9=82=A3=E4=BA=9B=E6=9C=AC=E5=9C=B0=E8=AE=A1=E6=95=B0=E5=99=A8=E5=8F=AF=
=E4=BB=A5=E4=BB=8E=E5=A4=96=E9=83=A8=E7=9A=84CPU=E4=B8=AD=E8=AF=BB=E5=8F=96=
=EF=BC=8C=E4=BB=A5=E6=B1=82=E5=BE=97=E8=AE=A1=E6=95=B0=E7=9A=84=E6=80=BB=E5=
=92=8C=E3=80=82=E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8Clocal_read
> +=E6=89=80=E7=9C=8B=E5=88=B0=E7=9A=84=E8=B7=A8CPU=E7=9A=84=E6=95=B0=E6=8D=
=AE=E5=BF=85=E9=A1=BB=E8=A2=AB=E8=AE=A4=E4=B8=BA=E6=98=AF=E7=9B=B8=E5=AF=B9=
=E4=BA=8E=E6=8B=A5=E6=9C=89=E8=AF=A5=E6=95=B0=E6=8D=AE=E7=9A=84CPU=E4=B8=8A=
=E5=8F=91=E7=94=9F=E7=9A=84=E5=85=B6=E4=BB=96=E5=86=85=E5=AD=98=E5=86=99=E5=
=85=A5=E6=9D=A5
> +=E8=AF=B4=E4=B8=8D=E7=AC=A6=E5=90=88=E9=A1=BA=E5=BA=8F=E7=9A=84=E3=80=82=
::

remove =E3=80=82

> +
> +    long sum =3D 0;
> +    for_each_online_cpu(cpu)
> +            sum +=3D local_read(&per_cpu(counters, cpu));
> +
> +=E5=A6=82=E6=9E=9C=E4=BD=A0=E6=83=B3=E4=BD=BF=E7=94=A8=E8=BF=9C=E7=A8=8B=
local_read=E6=9D=A5=E5=90=8C=E6=AD=A5CPU=E4=B9=8B=E9=97=B4=E5=AF=B9=E8=B5=
=84=E6=BA=90=E7=9A=84=E8=AE=BF=E9=97=AE=EF=BC=8C=E5=BF=85=E9=A1=BB=E5=9C=A8=
=E5=86=99=E5=85=A5=E8=80=85=E5=92=8C=E8=AF=BB=E5=8F=96=E8=80=85
> +=E7=9A=84CPU=E4=B8=8A=E5=88=86=E5=88=AB=E4=BD=BF=E7=94=A8=E6=98=BE=E5=BC=
=8F=E7=9A=84 ``smp_wmb()`` =E5=92=8C ``smp_rmb()`` =E5=86=85=E5=AD=98=E5=B1=
=8F=E9=9A=9C=E3=80=82=E5=A6=82=E6=9E=9C=E4=BD=A0=E4=BD=BF
> +=E7=94=A8 ``local_t`` =E5=8F=98=E9=87=8F=E4=BD=9C=E4=B8=BA=E5=86=99=E5=
=9C=A8=E7=BC=93=E5=86=B2=E5=8C=BA=E4=B8=AD=E7=9A=84=E5=AD=97=E8=8A=82=E7=9A=
=84=E8=AE=A1=E6=95=B0=E5=99=A8=EF=BC=8C=E5=B0=B1=E4=BC=9A=E5=87=BA=E7=8E=B0=
=E8=BF=99=E7=A7=8D=E6=83=85=E5=86=B5=EF=BC=9A=E5=9C=A8=E7=BC=93
> +=E5=86=B2=E5=8C=BA=E5=86=99=E5=92=8C=E8=AE=A1=E6=95=B0=E5=99=A8=E5=A2=9E=
=E9=87=8F=E4=B9=8B=E9=97=B4=E5=BA=94=E8=AF=A5=E6=9C=89=E4=B8=80=E4=B8=AA ``=
smp_wmb()`` =EF=BC=8C=E5=9C=A8=E8=AE=A1=E6=95=B0=E5=99=A8=E8=AF=BB=E5=92=8C=
=E7=BC=93=E5=86=B2=E5=8C=BA=E8=AF=BB=E4=B9=8B=E9=97=B4
> +=E4=B9=9F=E5=BA=94=E6=9C=89=E4=B8=80=E4=B8=AA ``smp_rmb()`` =E3=80=82
> +
> +=E4=B8=8B=E9=9D=A2=E6=98=AF=E4=B8=80=E4=B8=AA=E4=BD=BF=E7=94=A8 ``local.=
h`` =E5=AE=9E=E7=8E=B0=E6=AF=8F=E4=B8=AAcpu=E5=9F=BA=E6=9C=AC=E8=AE=A1=E6=
=95=B0=E5=99=A8=E7=9A=84=E7=A4=BA=E4=BE=8B=E6=A8=A1=E5=9D=97::
> +
> +    /* test-local.c
> +     *
> +     * Sample module for local.h usage.
> +     */
> +
> +
> +    #include <asm/local.h>
> +    #include <linux/module.h>
> +    #include <linux/timer.h>
> +
> +    static DEFINE_PER_CPU(local_t, counters) =3D LOCAL_INIT(0);
> +
> +    static struct timer_list test_timer;
> +
> +    /* IPI called on each CPU. */
> +    static void test_each(void *info)
> +    {
> +            /* Increment the counter from a non preemptible context */
> +            printk("Increment on cpu %d\n", smp_processor_id());
> +            local_inc(this_cpu_ptr(&counters));
> +
> +            /* This is what incrementing the variable would look like wi=
thin a
> +             * preemptible context (it disables preemption) :
> +             *
> +             * local_inc(&get_cpu_var(counters));
> +             * put_cpu_var(counters);
> +             */
> +    }
> +
> +    static void do_test_timer(unsigned long data)
> +    {
> +            int cpu;
> +
> +            /* Increment the counters */
> +            on_each_cpu(test_each, NULL, 1);
> +            /* Read all the counters */
> +            printk("Counters read from CPU %d\n", smp_processor_id());
> +            for_each_online_cpu(cpu) {
> +                    printk("Read : CPU %d, count %ld\n", cpu,
> +                            local_read(&per_cpu(counters, cpu)));
> +            }
> +            mod_timer(&test_timer, jiffies + 1000);
> +    }
> +
> +    static int __init test_init(void)
> +    {
> +            /* initialize the timer that will increment the counter */
> +            timer_setup(&test_timer, do_test_timer, 0);
> +            mod_timer(&test_timer, jiffies + 1);
> +
> +            return 0;
> +    }
> +
> +    static void __exit test_exit(void)
> +    {
> +            del_timer_sync(&test_timer);
> +    }
> +
> +    module_init(test_init);
> +    module_exit(test_exit);
> +
> +    MODULE_LICENSE("GPL");
> +    MODULE_AUTHOR("Mathieu Desnoyers");
> +    MODULE_DESCRIPTION("Local Atomic Ops");
> --=20
> 2.27.0

Thanks!

        Wu X.C.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmClVMoACgkQtlsoEiKC
sIXwUAv+Kew3Z68jveX6EuIgNw0uDOJruHGdtsSyostm3SPKcPBvCI45uNJ5ujR0
Zls4wqjuleEXJjkPQBD1grdnjJ4zUfpAXC2bKrECUVUa4k2V1dm+DKyNicNDt1CI
HxLDDCRTg4KkXvDASfawf2SdNk1pu5jtfkDJm4pTZijsT/Dt2VaSNuPvEFwjW/RS
Wty2NORtmknvk03CDNIuIdIcV7sckTqm6AZTvZvmuFWf2VZnmHrVcNU0OHoG8M5C
xZuP1JkQCHUGhy4SU9OoSIC6Nke64isdq9Cb688yVnIjGDk15WZ0wkP8KjhZmqtM
V0w4VUv1ezt4o9L7m/8TKy5ri1qased594t7du5LVhWXpreCVn/1O5oSRAva+mTo
oBDbeEUhs4WNaAtnFG2PEzpo976gKDylow+uFKIip2oV5FzimYczQXsQAs054C49
2AvxFZiLolI7OW7R4vxT3ZOXW9KdI57YPPk5y7VFBi7+GJ4kAGGqlcNRRWmZEVAA
DkuRCI4N
=VHFL
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--

