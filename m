Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DFFC4743C
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 15:59:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A77360E0B
	for <linux-doc@archiver.kernel.org>; Mon, 21 Jun 2021 15:59:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbhFUQBw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Jun 2021 12:01:52 -0400
Received: from [43.250.32.171] ([43.250.32.171]:39365 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229719AbhFUQBw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Jun 2021 12:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=HM5EOVoX5qSKx6lywhc+oTrmwGFGOdZ2R0Rfs
        ywvNps=; b=JJ+5GxWYMaR7ABjRF4Rcc8RlNxxdgDFIXBFYgt3I+kTqNu8xxtnfI
        rkWCwYNtA2mfNlGIp+aaqoImV9dZtOVkJS7x6srUy8PsMQSRAEMzS0la7NHV7kFi
        Sf58gL0o5bzTZPeagEzCip9su+AfucAzeBIWL6J2PcQCGN+gOCV4NQ=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDXcTVkt9BgAngdAA--.53263S2;
        Mon, 21 Jun 2021 23:59:34 +0800 (CST)
Date:   Mon, 21 Jun 2021 23:59:32 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <seakeel@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation
 zh_CN/admin-guide/efi-stub.rst
Message-ID: <20210621155932.GA32241@bobwxc.top>
References: <cover.1624169811.git.bobwxc@email.cn>
 <3341764131722e5bac894fe5b5699bbaf07e2e8a.1624169811.git.bobwxc@email.cn>
 <e7972da7-d17a-e48a-368e-b5f313625e3d@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <e7972da7-d17a-e48a-368e-b5f313625e3d@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDXcTVkt9BgAngdAA--.53263S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4UJr4kKrWxXr1DZFyrJFb_yoW8ZF4Dpa
        4qkrySg3Z7Jry3Wr93Kr48JF45AFZ7Wa98t3WIq34rJwnYvFWktry7tr13Wwn7WFyrAa4r
        ZF4FgFy3Cr10y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21le4C267I2x7xF54xIwI1l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42
        xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2IqxVCFs4IE7xkEbVWU
        JVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67
        kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY
        6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
        vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2Kfnx
        nUUI43ZEXa7xRRJPEDUUUUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 21, 2021 at 05:12:26PM +0800, Alex Shi wrote:
>=20
>=20
> On 6/20/21 6:40 PM, Wu XiangCheng wrote:
> > Add a new translation
> >   Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > and link it to zh_CN/admin-guide/index.rst
> >=20
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/admin-guide/efi-stub.rst            | 86 +++++++++++++++++++
> >  .../translations/zh_CN/admin-guide/index.rst  |  2 +-
> >  2 files changed, 87 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/zh_CN/admin-guide/efi-st=
ub.rst
> >=20
> > diff --git a/Documentation/translations/zh_CN/admin-guide/efi-stub.rst =
b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > new file mode 100644
> > index 000000000000..b6a4cedec8eb
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/admin-guide/efi-stub.rst
> > @@ -0,0 +1,86 @@
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/admin-guide/efi-stub.rst
> > +
> > +:=E8=AF=91=E8=80=85:
> > +
> > + =E5=90=B4=E6=83=B3=E6=88=90 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +EFI=E5=BC=95=E5=AF=BC=E6=A1=A9
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +=E5=9C=A8x86=E5=92=8CARM=E5=B9=B3=E5=8F=B0=E4=B8=8A=EF=BC=8C=E5=86=85=
=E6=A0=B8zImage/bzImage=E5=8F=AF=E4=BB=A5=E4=BC=AA=E8=A3=85=E6=88=90PE/COFF=
=E6=98=A0=E5=83=8F=EF=BC=8C=E4=BB=8E=E8=80=8C=E4=BD=BFEFI=E5=9B=BA=E4=BB=B6=
=E5=8A=A0=E8=BD=BD
> > +=E7=A8=8B=E5=BA=8F=E5=8A=A0=E8=BD=BD=E5=85=B6=E4=BD=9C=E4=B8=BAEFI=E5=
=8F=AF=E6=89=A7=E8=A1=8C=E6=96=87=E4=BB=B6=E3=80=82=E4=BF=AE=E6=94=B9bzImag=
e=E5=A4=B4=E4=BB=A5=E5=8F=8A=E5=9B=BA=E4=BB=B6=E5=8A=A0=E8=BD=BD=E7=A8=8B=
=E5=BA=8F=E8=B7=B3=E8=BD=AC=E7=89=B9=E5=AE=9A=E5=85=A5=E5=8F=A3=E7=82=B9=E7=
=9A=84
> > +=E4=BB=A3=E7=A0=81=E8=A2=AB=E7=BB=9F=E7=A7=B0=E4=B8=BA=E2=80=9CEFI=E5=
=BC=95=E5=AF=BC=E6=A1=A9=EF=BC=88EFI Boot Stub=EF=BC=89=E2=80=9D=EF=BC=8C=
=E5=88=86=E5=B8=83=E5=9C=A8arch/x86/boot/header.S=E5=92=8C
> > +arch/x86/boot/compressed/eboot.c=E4=B8=AD=E3=80=82=E5=AF=B9=E4=BA=8EAR=
M=EF=BC=8CEFI=E6=A1=A9=E5=9C=A8arch/arm/boot/compressed/efi-header.S
> > +=E5=92=8Carch/arm/boot/compressed/efi-stub.c=E4=B8=AD=E5=AE=9E=E7=8E=
=B0=E3=80=82=E4=BD=93=E7=B3=BB=E7=BB=93=E6=9E=84=E4=B9=8B=E9=97=B4=E5=85=B1=
=E4=BA=AB=E7=9A=84EFI=E6=A1=A9=E4=BB=A3=E7=A0=81
> > +=E4=BD=8D=E4=BA=8Edrivers/firmware/efi/libstub=E4=B8=AD=E3=80=82
> > +
> > +=E8=80=8Carm64=E6=B2=A1=E6=9C=89=E5=8E=8B=E7=BC=A9=E5=86=85=E6=A0=B8=
=E6=94=AF=E6=8C=81=EF=BC=8C=E5=9B=A0=E6=AD=A4=E6=98=A0=E5=83=8F=E6=9C=AC=E8=
=BA=AB=E4=BC=AA=E8=A3=85=E6=88=90PE/COFF=E6=98=A0=E5=83=8F=EF=BC=8CEFI=E6=
=A1=A9=E9=93=BE=E6=8E=A5=E5=88=B0=E5=86=85=E6=A0=B8=E3=80=82
>=20
> arm64=E4=B8=8D=E6=94=AF=E6=8C=81=E5=8E=8B=E7=BC=A9=E5=86=85=E6=A0=B8=EF=
=BC=9F=20
>=20
> Thanks
> Alex

OK!

Thanks,
	Wu X.C.


--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDQt2EACgkQtlsoEiKC
sIWCLQwAmy66WuMrKg1th+B5BrTeP36/ziwPe4E3wt2r2dofdUxtiozsn4u8houI
x5D6fDkh5AYJes3DCltGFtrFjsaH4yOK4jVNbML+QNWQoHBkLsNBT1WpO54uWoyD
yG57BW7yyGBuB+cVzLLYIZQ6rProndqfeBRsId8e0azbUqWGuxEmYM0xNwHTcHVn
BUlVjh6XuvLBezI6/Pvp+SLl0UXfPn/csRyrVDZhrLPa6vPvQLQqliD1Jb5v7ggs
//l3h3pz77uXsHeViO+23nuSi9uIWOFBxSEOm6IMYf7rtsqAkM3Cpq6ZyJ94Ytih
+S4kjIiAq2bVr7L9cjCAWOb0bVPlU9M3SWvGNH0eklX630OlOlqUNwObHfyP2/8v
R+7LP4FJpokyYiZYEfeYg3KPlErmIItxyaK7L6wphr9jSxyDDTjZWZUcBU1zmnuK
I5G5s8y2keyXlM9s0hjogCY5p+XaZ3G8W77NZqq6lilLteS+y0qauZ5sgJPkg4/s
Qa7hHdyI
=j+Al
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

