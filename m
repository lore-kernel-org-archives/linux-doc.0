Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF2CC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 11:38:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11DCE613DD
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 11:38:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbhEULjb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 07:39:31 -0400
Received: from [43.250.32.171] ([43.250.32.171]:28683 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229991AbhEULjb (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 07:39:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=7mGorer9y6xHcbwXt4BNMbsz5+7Zhk4euqyvJ
        VoIsbI=; b=HFIDOpdlQXy5kqLV6tFjLvMsGB01+tR9YMKvyrGRrUENjP9yE0oM/
        y0DoPrzrOQKgJ4nSFduuJK2Z57DNbsQrR9Q55tDm3NTIRPdViU069GgIWnwnMJ1e
        IYCEiL5QRax6FkupcJTyVYAIvJ3Wy5Ogq43HSW99fjaxblKdMOMdxA=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3PkGWm6dgiI42AA--.64306S2;
        Fri, 21 May 2021 19:38:00 +0800 (CST)
Date:   Fri, 21 May 2021 19:37:53 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH] docs: zh_CN: update Chinese translations
Message-ID: <20210521113752.GA24581@bobwxc.top>
References: <20210521083908.3783492-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline
In-Reply-To: <20210521083908.3783492-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3PkGWm6dgiI42AA--.64306S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFyUtr4rJF1kWFWDCF4fAFb_yoW5Xry8p3
        Wa9FnIkanFvrnrXFn7Kryjgr1rCFZ5Wa4UC3srXr95JF1rZryvyF4xKr95WF97WryUta4r
        tFsrtryjyw4jyrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUnLSdPUUUUU==
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 04:39:08PM +0800, Yanteng Si wrote:
> Two new commits were added to the original document:
>=20
> commit ddba35031db2ea89facc91c745e5ad55ba2e0e7f
> commit 20bc8c1e972f29afcac85e524e430c11a6df5f58
>=20
> translate them into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/core-api/printk-formats.rst           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst=
 b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> index 624a090e6ee5..a680c8f164c3 100644
> --- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
> +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> @@ -122,6 +122,17 @@ seq_printf()=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AFprin=
tk()=EF=BC=89=E7=94=B1=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=BF=9B=E7=A8=
=8B=E8=AF=BB=E5=8F=96=EF=BC=8C=E4=BD=BF=E7=94=A8=E4=B8=8B=E9=9D=A2=E6=8F=8F
>  ``B`` =E5=8D=A0=E4=BD=8D=E7=AC=A6=E7=9A=84=E7=BB=93=E6=9E=9C=E6=98=AF=E5=
=B8=A6=E6=9C=89=E5=81=8F=E7=A7=BB=E9=87=8F=E7=9A=84=E7=AC=A6=E5=8F=B7=E5=90=
=8D=EF=BC=8C=E5=9C=A8=E6=89=93=E5=8D=B0=E5=A0=86=E6=A0=88=E5=9B=9E=E6=BA=AF=
=E6=97=B6=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=A8=E3=80=82=E5=8D=A0=E4=BD=8D=E7=
=AC=A6=E5=B0=86=E8=80=83=E8=99=91=E7=BC=96=E8=AF=91=E5=99=A8=E4=BC=98=E5=8C=
=96
>  =E7=9A=84=E5=BD=B1=E5=93=8D=EF=BC=8C=E5=BD=93=E4=BD=BF=E7=94=A8=E5=B0=BE=
=E9=83=A8=E8=B0=83=E7=94=A8=E5=B9=B6=E4=BD=BF=E7=94=A8noreturn GCC=E5=B1=9E=
=E6=80=A7=E6=A0=87=E8=AE=B0=E6=97=B6=EF=BC=8C=E5=8F=AF=E8=83=BD=E4=BC=9A=E5=
=8F=91=E7=94=9F=E8=BF=99=E7=A7=8D=E4=BC=98=E5=8C=96=E3=80=82
> =20
> +=E5=A6=82=E6=9E=9C=E6=8C=87=E9=92=88=E5=9C=A8=E4=B8=80=E4=B8=AA=E6=A8=A1=
=E5=9D=97=E5=86=85=EF=BC=8C=E6=A8=A1=E5=9D=97=E5=90=8D=E7=A7=B0=E5=92=8C=E5=
=8F=AF=E9=80=89=E7=9A=84=E6=9E=84=E5=BB=BAID=E5=B0=86=E8=A2=AB=E6=89=93=E5=
=8D=B0=E5=9C=A8=E7=AC=A6=E5=8F=B7=E5=90=8D=E7=A7=B0=E4=B9=8B=E5=90=8E=EF=BC=
=8C=E5=B9=B6=E5=9C=A8=E8=AF=B4=E6=98=8E=E7=AC=A6=E7=9A=84=E6=9C=AB=E5=B0=BE=
=E6=B7=BB=E5=8A=A0
> +=E4=B8=80=E4=B8=AA=E9=A2=9D=E5=A4=96=E7=9A=84 ``b`` =E3=80=82
> +
> +::
> +
> +	%pS	versatile_init+0x0/0x110 [module_name]
> +	%pSb	versatile_init+0x0/0x110 [module_name ed5019fdf5e53be37cb1ba789929=
2d7e143b259e]
> +	%pSRb	versatile_init+0x9/0x110 [module_name ed5019fdf5e53be37cb1ba78992=
92d7e143b259e]
> +		(with __builtin_extract_return_addr() translation)
> +	%pBb	prev_fn_of_versatile_init+0x88/0x88 [module_name ed5019fdf5e53be37=
cb1ba7899292d7e143b259e]
> +
>  =E6=9D=A5=E8=87=AABPF / tracing=E8=BF=BD=E8=B8=AA=E7=9A=84=E6=8E=A2=E6=
=9F=A5=E6=8C=87=E9=92=88
>  ----------------------------------
> =20
> @@ -483,9 +494,10 @@ Fwnode handles
>  ::
> =20
>  	%pt[RT]			YYYY-mm-ddTHH:MM:SS
> +	%pt[RT]s		YYYY-mm-dd HH:MM:SS
>  	%pt[RT]d		YYYY-mm-dd
>  	%pt[RT]t		HH:MM:SS
> -	%pt[RT][dt][r]
> +	%pt[RT][dt][r][s]
> =20
>  =E7=94=A8=E4=BA=8E=E6=89=93=E5=8D=B0=E6=97=A5=E6=9C=9F=E5=92=8C=E6=97=B6=
=E9=97=B4::
> =20
> @@ -497,6 +509,9 @@ Fwnode handles
>  =E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E5=B9=B4=E5=B0=86=
=E4=BB=A51900=E4=B8=BA=E5=8D=95=E4=BD=8D=E9=80=92=E5=A2=9E=EF=BC=8C=E6=9C=
=88=E5=B0=86=E4=BB=A51=E4=B8=BA=E5=8D=95=E4=BD=8D=E9=80=92=E5=A2=9E=E3=80=
=82 =E4=BD=BF=E7=94=A8%pt[RT]r (raw)
>  =E6=9D=A5=E6=8A=91=E5=88=B6=E8=BF=99=E7=A7=8D=E8=A1=8C=E4=B8=BA=E3=80=82
> =20
> +%pt[RT]s=EF=BC=88=E7=A9=BA=E6=A0=BC=EF=BC=89=E5=B0=86=E8=A6=86=E7=9B=96I=
SO 8601=E7=9A=84=E5=88=86=E9=9A=94=E7=AC=A6=EF=BC=8C=E5=9C=A8=E6=97=A5=E6=
=9C=9F=E5=92=8C=E6=97=B6=E9=97=B4=E4=B9=8B=E9=97=B4=E4=BD=BF=E7=94=A8''=EF=
=BC=88=E7=A9=BA=E6=A0=BC=EF=BC=89=E8=80=8C
> +=E4=B8=8D=E6=98=AF'T'=EF=BC=88=E5=A4=A7=E5=86=99T=EF=BC=89=E3=80=82=E5=
=BD=93=E6=97=A5=E6=9C=9F=E6=88=96=E6=97=B6=E9=97=B4=E8=A2=AB=E7=9C=81=E7=95=
=A5=E6=97=B6=EF=BC=8C=E5=AE=83=E4=B8=8D=E4=BC=9A=E6=9C=89=E4=BB=BB=E4=BD=95=
=E5=BD=B1=E5=93=8D=E3=80=82
> +
>  =E9=80=9A=E8=BF=87=E5=BC=95=E7=94=A8=E4=BC=A0=E9=80=92=E3=80=82
> =20
>  clk=E7=BB=93=E6=9E=84=E4=BD=93
> --=20
> 2.27.0

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCnm40ACgkQtlsoEiKC
sIWR5Qv+McbSlRLhZMwLHW3eP3zhDG7nc9xm8atjrbEcZaqMHgULcTPzax+Vq9dm
ZyDP4iHnzuuttumPDm4lSq37XBhjHGHAkFCbkuoqaITDhM45SA6Pt5M1JAblh0wh
2uEzWAhm6cfHzBoVV4Avqo7AIA9K/+MXEWSKFyucn2GYFWlH+33aKtsCb0kKrmXU
ekFBJ7twaFApPNHNAFycROcoGwMkFqz3qFuUKeDZ+LJ0TBk2rmBtzj87FUEuR2Vm
JoQtHoA9H+pQ/++3ct61jPgTL+oCkOkja0Hce0lkg5SVyn9p2HxOJKNINwR/ujTo
jUZZcZxGrAJpQKFnfwoJKC8y9w/sH8ksb7ldBr6k4kPE5Qg9LpseMfpOnXQa1OY2
rO1EhBHJEKR7lqfi2M3/AvtLM8hJYD7XAoy3SIUe//bVqziEc+yqWQe5v00gxEmq
hIiUxxA5d2jGfbG6T7wd4rtrRtA6km5687tvGr5zktSVtxr2Cqmi2eURFN55bdE9
rKhqdueM
=qTU4
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--

