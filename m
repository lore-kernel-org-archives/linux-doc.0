Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950C0C4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 06:43:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71DC161289
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 06:43:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhFWGqK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 02:46:10 -0400
Received: from [43.250.32.171] ([43.250.32.171]:59778 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229660AbhFWGqK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 02:46:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=wb7PtPzlqWVKnusGdTBZtAhlPRhlAuwAsFy8y
        56i/BE=; b=KTh2904EzUe+xuZ+me8WMd/B79h9BipTultvelvsYdhD2Af9YqCtD
        ijuvWAgwTZywM3d9ZaS9txoftmss9Spt8hlS6FpG61QLBbqbanrxaLvt+nPopX8V
        918vO4wU3q+YwuAH3c5se9bg0ZlYRHpYATw9syPDv67j4uTOgSDBbk=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3kTUf2NJg8g8gAA--.62049S2;
        Wed, 23 Jun 2021 14:43:45 +0800 (CST)
Date:   Wed, 23 Jun 2021 14:43:43 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v3 2/2] docs/zh_CN: add core api protection keys
 translation
Message-ID: <20210623064342.GA20445@bobwxc.top>
References: <cover.1624370078.git.siyanteng@loongson.cn>
 <0a7cf1ed40f04a80ac7a556572f3b2b8f965e1f2.1624370078.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <0a7cf1ed40f04a80ac7a556572f3b2b8f965e1f2.1624370078.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgD3kTUf2NJg8g8gAA--.62049S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CFyfJFWkXr4rKw18XFyUtrb_yoW8KrWUpr
        9ak3s3GF4xtryUu3s7Gr12kF18Ja18GanIgw4Iq3WxJ3Z5Jw4vyr43tFy5WrykGrn2yFy0
        vF48CrWjk34YywUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgqb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21le4C267I2x7xF54xIwI1l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42
        xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
        vjDU0xZFpf9x07Un189UUUUU=
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 10:00:18PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/protection-keys.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/protection-keys.rst        | 99 +++++++++++++++++++
>  1 file changed, 99 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/protection-=
keys.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/protection-keys.rs=
t b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> new file mode 100644
> index 000000000000..edd2a3202a2c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> @@ -0,0 +1,99 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/protection-keys.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> + =E5=90=B4=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
> +
> +.. _cn_core-api_protection-keys:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E5=AD=98=E4=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E7=9A=84=E5=86=85=E5=AD=98=E4=BF=9D=
=E6=8A=A4=E5=AF=86=E9=92=A5=EF=BC=88Memory Protection Keys for Userspace=EF=
=BC=8CPKU=EF=BC=8C=E4=BA=A6
> +=E5=8D=B3PKEYs=EF=BC=89=E6=98=AF=E8=8B=B1=E7=89=B9=E5=B0=94Skylake=EF=BC=
=88=E5=8F=8A=E4=BB=A5=E5=90=8E=EF=BC=89=E2=80=9C=E5=8F=AF=E6=89=A9=E5=B1=95=
=E5=A4=84=E7=90=86=E5=99=A8=E2=80=9D=E6=9C=8D=E5=8A=A1=E5=99=A8CPU=E4=B8=8A=
=E7=9A=84=E4=B8=80=E9=A1=B9=E5=8A=9F=E8=83=BD=E3=80=82
> +=E5=AE=83=E5=B0=86=E5=9C=A8=E6=9C=AA=E6=9D=A5=E7=9A=84=E9=9D=9E=E6=9C=8D=
=E5=8A=A1=E5=99=A8=E8=8B=B1=E7=89=B9=E5=B0=94=E5=A4=84=E7=90=86=E5=99=A8=E5=
=92=8C=E6=9C=AA=E6=9D=A5=E7=9A=84AMD=E5=A4=84=E7=90=86=E5=99=A8=E4=B8=AD=E5=
=8F=AF=E7=94=A8=E3=80=82
> +
> +=E5=AF=B9=E4=BA=8E=E4=BB=BB=E4=BD=95=E5=B8=8C=E6=9C=9B=E6=B5=8B=E8=AF=95=
=E6=88=96=E4=BD=BF=E7=94=A8=E8=AF=A5=E5=8A=9F=E8=83=BD=E7=9A=84=E4=BA=BA=E6=
=9D=A5=E8=AF=B4=EF=BC=8C=E5=AE=83=E5=9C=A8=E4=BA=9A=E9=A9=AC=E9=80=8A=E7=9A=
=84EC2 C5=E5=AE=9E=E4=BE=8B=E4=B8=AD=E6=98=AF=E5=8F=AF=E7=94=A8=E7=9A=84=EF=
=BC=8C
> +=E5=B9=B6=E4=B8=94=E5=B7=B2=E7=9F=A5=E5=8F=AF=E4=BB=A5=E5=9C=A8=E9=82=A3=
=E9=87=8C=E4=BD=BF=E7=94=A8Ubuntu 17.04=E9=95=9C=E5=83=8F=E8=BF=90=E8=A1=8C=
=E3=80=82
> +
> +=E5=86=85=E5=AD=98=E4=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5=E6=8F=90=E4=BE=9B=
=E4=BA=86=E4=B8=80=E7=A7=8D=E6=9C=BA=E5=88=B6=E6=9D=A5=E6=89=A7=E8=A1=8C=E5=
=9F=BA=E4=BA=8E=E9=A1=B5=E9=9D=A2=E7=9A=84=E4=BF=9D=E6=8A=A4=EF=BC=8C=E4=BD=
=86=E5=9C=A8=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E6=94=B9=E5=8F=98=E4=BF=9D=
=E6=8A=A4=E5=9F=9F
> +=E6=97=B6=E4=B8=8D=E9=9C=80=E8=A6=81=E4=BF=AE=E6=94=B9=E9=A1=B5=E8=A1=A8=
=E3=80=82=E5=AE=83=E7=9A=84=E5=B7=A5=E4=BD=9C=E5=8E=9F=E7=90=86=E6=98=AF=E5=
=9C=A8=E6=AF=8F=E4=B8=AA=E9=A1=B5=E8=A1=A8=E9=A1=B9=E4=B8=AD=E4=B8=BA=E2=80=
=9C=E4=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5=E2=80=9D=E5=88=86=E9=85=8D4=E4=B8=
=AA=E4=BB=A5
> +=E5=89=8D=E8=A2=AB=E5=BF=BD=E7=95=A5=E7=9A=84=E4=BD=8D=EF=BC=8C=E4=BB=8E=
=E8=80=8C=E6=8F=90=E4=BE=9B16=E4=B8=AA=E5=8F=AF=E8=83=BD=E7=9A=84=E5=AF=86=
=E9=92=A5=E3=80=82
> +
> +=E8=BF=98=E6=9C=89=E4=B8=80=E4=B8=AA=E6=96=B0=E7=94=A8=E6=88=B7=E5=8F=AF=
=E8=AE=BF=E9=97=AE=E7=9A=84=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88PKRU=EF=BC=
=89=EF=BC=8C=E4=B8=BA=E6=AF=8F=E4=B8=AA=E5=AF=86=E9=92=A5=E6=8F=90=E4=BE=9B=
=E4=B8=A4=E4=B8=AA=E5=8D=95=E7=8B=AC=E7=9A=84=E4=BD=8D=EF=BC=88=E8=AE=BF

a new user-accessible register (PKRU)
=E4=B8=80=E4=B8=AA=E6=96=B0=E7=9A=84=E7=94=A8=E6=88=B7=E5=8F=AF=E8=AE=BF=E9=
=97=AE=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88PKRU=EF=BC=89
       |

You've removed a wrong one.

All others are good.

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu X.C.


--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDS2B4ACgkQtlsoEiKC
sIVQIwwAnHjJGSf6RJlEHeKA0VbBg6ufxP6GRfwJe11r7o10Ecw7f/UEF1SUUS0B
EcjYm8bXXdNqdH0koC52JNhdBrkB2j/IxUjpFXxAvCxobrEO30NIIEImTFlbmXcC
RGR4vLfoysIa/eGibao+ZSKfkHMPOayhbOAFF7xYP9kKyxl0B4PuJtOc1Jy4G7G3
k6ShDR7Wx02hMK2fE9mpdV0LheUKg+mJg43ovDl98ErNDSJeljiFOlflz+kNSuXw
/6ym5j3WkHNHqPKJ5VHX9Kl6xaAv6YojV6plC0xlN8/QCHkqsMFISlGM+EKQrNA/
wq36jCnZxFURdh2vLLfrXuBewvqFpaCDNd73SFHym+cDUF740gbfdCRh5Nsc+6Cf
PfJUbXmH6qpFwV3oHC3p8DhsgFjA9tShVHLullVb6/Did4PQkl7PCvvRYoudTP9k
7APGhAJYXNjVPu7dSbfCDxDDrWCGK3uChF72eeXHICrUeQB/D23TpsMLZBqcwzQL
ERaKX1p4
=LmVu
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

