Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57BCC433EF
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 16:17:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245298AbiFHQR5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 12:17:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245277AbiFHQR4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 12:17:56 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA291775CA
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 09:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=tjV/RvNG/Ir4AuKMuDO8wW34Ate8v6nXUuotJ
        vvUsQI=; b=TZ63Cd2FcjPAtH1xLV8j4uKAl8rXmFU/+C8ImJdWmWZRVIi37cVAw
        mN4VQ/TP+fgwAFD+jM7b97hyJZajGxzsq77CuD+gTF81w/1vwPI3HiR6Z2osYTG4
        89ZlJXjW4kl/NnZCFaEB0uBe0jzgWeu85Iqqhi95Pup6pm14fGdY4g=
Received: from bobwxc.mipc (unknown [120.242.68.162])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCHsSOmy6BiEcsOAA--.44000S2;
        Thu, 09 Jun 2022 00:17:44 +0800 (CST)
Date:   Thu, 9 Jun 2022 00:17:40 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH V2 2/2] docs/zh_CN: riscv: Update the translation of
 vm-layout.rst to 5.19-rc1
Message-ID: <YqCRuwy9dsl50lPu@bobwxc.mipc>
References: <cover.1654685338.git.zhoubinbin@loongson.cn>
 <10cd6a241a0266d1d19ee5f0b2177d7d14d17ed2.1654685338.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ad+1uz9CSpyBg6bC"
Content-Disposition: inline
In-Reply-To: <10cd6a241a0266d1d19ee5f0b2177d7d14d17ed2.1654685338.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgCHsSOmy6BiEcsOAA--.44000S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWxKFy7ur1Utr4kJrWrZrb_yoWrJFyrpr
        1DJryxGr48JryUJw1UJry5tr1UAr18A3WUJr1rJr1UJryUGr1UJr1UJry5Jr1DGr15Ar17
        Jr1DGrWUtr1UJw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyYb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02
        Avz4vE14v_JwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s02
        6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
        0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
        JbIYCTnIWIevJa73UjIFyTuYvjxU5pBTUUUUU
X-Originating-IP: [120.242.68.162]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--ad+1uz9CSpyBg6bC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 07:08:21PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit 9d19f2b5256e
> ("Documentation: riscv: Add sv48 description to VM layout")
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks :)

> ---
>  .../translations/zh_CN/riscv/vm-layout.rst    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/Documentation/translations/zh_CN/riscv/vm-layout.rst b/Docum=
entation/translations/zh_CN/riscv/vm-layout.rst
> index 585cb89317a3..91884e2dfff8 100644
> --- a/Documentation/translations/zh_CN/riscv/vm-layout.rst
> +++ b/Documentation/translations/zh_CN/riscv/vm-layout.rst
> @@ -6,6 +6,7 @@
>  :=E7=BF=BB=E8=AF=91:
> =20
>   =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +        Binbin Zhou <zhoubinbin@loongson.cn>
> =20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
>  RISC-V Linux=E4=B8=8A=E7=9A=84=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=B8=
=83=E5=B1=80
> @@ -65,3 +66,39 @@ RISC-V Linux Kernel SV39
>     ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules,=
 BPF
>     ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
>    __________________|____________|__________________|_________|_________=
___________________________________________________
> +
> +
> +RISC-V Linux Kernel SV48
> +------------------------
> +
> +::
> +
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +      =E5=BC=80=E5=A7=8B=E5=9C=B0=E5=9D=80       |   =E5=81=8F=E7=A7=BB =
     |     =E7=BB=93=E6=9D=9F=E5=9C=B0=E5=9D=80      |  =E5=A4=A7=E5=B0=8F =
   | =E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E6=8F=8F=E8=BF=
=B0
> + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +                    |            |                  |         |
> +   0000000000000000 |    0       | 00007fffffffffff |  128 TB | =E7=94=
=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=EF=BC=8C=
=E6=AF=8F=E4=B8=AA=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E5=99=A8=E4=B8=8D=E5=
=90=8C
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... =E5=
=B7=A8=E5=A4=A7=E7=9A=84=E3=80=81=E5=87=A0=E4=B9=8E64=E4=BD=8D=E5=AE=BD=E7=
=9A=84=E7=9B=B4=E5=88=B0=E5=86=85=E6=A0=B8=E6=98=A0=E5=B0=84=E7=9A=84-128TB=
=E5=9C=B0=E6=96=B9
> +                    |            |                  |         |     =E5=
=BC=80=E5=A7=8B=E5=81=8F=E7=A7=BB=E7=9A=84=E9=9D=9E=E7=BB=8F=E5=85=B8=E8=99=
=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=9C=B0=E5=9D=80=E7=A9=BA=E6=B4=9E=E3=80=82
> +                    |            |                  |         |
> +  __________________|____________|__________________|_________|_________=
__________________________________________________
> +                                                              |
> +                                                              | =E5=86=
=85=E6=A0=B8=E7=A9=BA=E9=97=B4=E7=9A=84=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=
=EF=BC=8C=E5=9C=A8=E6=89=80=E6=9C=89=E8=BF=9B=E7=A8=8B=E4=B9=8B=E9=97=B4=E5=
=85=B1=E4=BA=AB:
> +  ____________________________________________________________|_________=
__________________________________________________
> +                    |            |                  |         |
> +   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
> +   ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
> +   ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemmap
> +   ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmalloc/=
ioremap space
> +   ffffaf8000000000 |  -80.5  TB | ffffef7fffffffff |   64 TB | =E7=9B=
=B4=E6=8E=A5=E6=98=A0=E5=B0=84=E6=89=80=E6=9C=89=E7=89=A9=E7=90=86=E5=86=85=
=E5=AD=98
> +   ffffef8000000000 |  -16.5  TB | fffffffeffffffff | 16.5 TB | kasan
> +  __________________|____________|__________________|_________|_________=
___________________________________________________
> +                                                              |
> +                                                              | =E4=BB=
=8E=E6=AD=A4=E5=A4=84=E5=BC=80=E5=A7=8B=EF=BC=8C=E4=B8=8E39-bit=E5=B8=83=E5=
=B1=80=E7=9B=B8=E5=90=8C=EF=BC=9A
> +  ____________________________________________________________|_________=
___________________________________________________
> +                    |            |                  |         |
> +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | modules,=
 BPF
> +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> +  __________________|____________|__________________|_________|_________=
___________________________________________________
> --=20
> 2.20.1

--ad+1uz9CSpyBg6bC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmKgy5YACgkQtlsoEiKC
sIXNOAwAnw+6gObP/1Ixdw4v10hfyRQLv8PMMGGvAD0nJd4r/a7pngHA5P5Qh10x
diMfE1WoszeIN8/OxlT/wBYZIc3AYYslEeduLl4Hm0uTOjDP74h/nceZJGzmQcdz
7a4oorSwG8Eh4SFC04IsEF2Sjb3rD7c62BW/px7DcQJLY36z8gwRfqzBe/YUu7Gx
Lk3gcxgWi6eTzotHtJlrqqWfeYQItollgICZLZksb76PcAutESHAIx7DKT2UpI4Y
rcNEWDrj+tox2uKb4nF0+Xy7dYXTIodcXMGWB+Z3kW0yN6KPWDKzz/zdoDEX7Y6+
DBryLrqy4nnx/S8OSi++GPF1VLBshcFtk6w54Ym9c5cdPJ5Gp8lvEmJr07b9R6gV
efRXmbKYWvE/Kt/aoBiBit9+IwkUSjFWzWZF6gQiFftolhUO7cdCcnrw56LmV7Tc
+zlGmTL7UGnlzKB4zhQ26Vh66OPDOGRXejfgM7fOoKqEmZvdRx2qItQhB4CGRYjZ
wIMzjUUd
=+1e8
-----END PGP SIGNATURE-----

--ad+1uz9CSpyBg6bC--

