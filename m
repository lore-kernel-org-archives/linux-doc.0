Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288B5C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 05:23:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E778B6144E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 05:23:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231781AbhD2FXs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 01:23:48 -0400
Received: from m32-153.88.com ([43.250.32.153]:35645 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229792AbhD2FXs (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Apr 2021 01:23:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=mGmOP/CWSlGEHCrSjXgMUp63qXM1+Bi/OkB9s
        5pZnpk=; b=VJkzGFrYBTSrHREjt5/NA7eNGxd6HcH49N0Xm/IFChECMYHU6suL3
        PU7zMlrgUpNldPkdUNRr3bAfMzrD3pd3tI9mNTBftKWM5IoMQrROH0jyepTBFMq9
        vDmJSkHd0sD+bRq7rR3xUkWP7IEsgxKSTMZWXtn7lx9IhNPsnNQYnc=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBHl1msQopgPTESAA--.47472S2;
        Thu, 29 Apr 2021 13:22:54 +0800 (CST)
Date:   Thu, 29 Apr 2021 13:22:52 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        Yanteng Si <siyanteng01@gmail.com>,
        Huang JiangHui <huangjianghui@uniontech.com>
Subject: Re: [PATCH] docs/zh_CN: add core-api symbol-namespaces.rst
 translation
Message-ID: <20210429052252.GA9451@bobwxc.top>
References: <20210426125530.3760955-1-siyanteng@loongson.cn>
 <20210427140910.GA32250@bobwxc.top>
 <CAMU9jJq90Zayg77iV8eNNK8gNf3Dk-BLGhdHVx8SmsWVdXKo8A@mail.gmail.com>
 <CAMU9jJrB6O2ZwNJBpPGZ-OigHH2DM6mpZPZ-SQ3vL8vVz4rjXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="/9DWx/yDrRhgMJTb"
Content-Disposition: inline
In-Reply-To: <CAMU9jJrB6O2ZwNJBpPGZ-OigHH2DM6mpZPZ-SQ3vL8vVz4rjXw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBHl1msQopgPTESAA--.47472S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr4Dtw18tw47tw4rurykXwb_yoW8tFy8pa
        4jva4Igr18XrWqy3Z7Kw1Svr929w4vgF1agw1UKry3C34qyF9xJ3Zrtr95u3Z2yrykWFyk
        Za1DXFy3JF1rXaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyFb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02
        Avz4vE14v_GrWl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_
        GrUvcSsGvfC2KfnxnUUI43ZEXa7IUUO6pPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--/9DWx/yDrRhgMJTb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 29, 2021 at 10:29:21AM +0800, teng sterling wrote:
[...]
> > > >+
> > > >+=E7=AC=A6=E5=8F=B7=E5=8F=AF=E4=BB=A5=E7=94=A8=E4=B8=8D=E5=90=8C=E7=
=9A=84=E6=96=B9=E6=B3=95=E5=AF=BC=E5=87=BA=E5=88=B0=E5=91=BD=E5=90=8D=E7=A9=
=BA=E9=97=B4=E3=80=82=E6=89=80=E6=9C=89=E8=BF=99=E4=BA=9B=E9=83=BD=E5=9C=A8=
=E6=94=B9=E5=8F=98 EXPORT_SYMBOL =E5=92=8C=E4=BC=99=E4=BC=B4=EF=BC=88friend=
s=EF=BC=89
> > > >+=E8=A2=AB=E6=A3=80=E6=B5=8B=E5=88=B0=E7=9A=84=E6=96=B9=E5=BC=8F=EF=
=BC=8C=E4=BB=A5=E5=88=9B=E5=BB=BA ksymtab =E6=9D=A1=E7=9B=AE=E3=80=82
> > >
> > > =EF=BC=9F=EF=BC=9F
> > To be honest, I'm not sure I understood the original document correctly.
> >
> now  I'm sure.
> =E7=AC=A6=E5=8F=B7=E5=8F=AF=E4=BB=A5=E7=94=A8=E4=B8=8D=E5=90=8C=E7=9A=84=
=E6=96=B9=E6=B3=95=E5=AF=BC=E5=87=BA=E5=88=B0=E5=91=BD=E5=90=8D=E7=A9=BA=E9=
=97=B4=E3=80=82=E6=89=80=E6=9C=89=E8=BF=99=E4=BA=9B=E9=83=BD=E5=9C=A8=E6=94=
=B9=E5=8F=98 EXPORT_SYMBOL =E5=92=8C=E4=B8=8E=E4=B9=8B=E7=B1=BB=E4=BC=BC=E7=
=9A=84=E9=82=A3=E4=BA=9B=E5=AE=8F =E8=A2=AB=E6=A3=80=E6=B5=8B=E5=88=B0=E7=
=9A=84=E6=96=B9=E5=BC=8F=EF=BC=8C=E4=BB=A5=E5=88=9B=E5=BB=BA ksymtab =E6=9D=
=A1=E7=9B=AE=E3=80=82
> OK?
>=20

Yeah.

[...]
> > > >+=E5=AF=B9=E6=A8=A1=E5=9D=97=E4=BD=9C=E8=80=85=E6=9D=A5=E8=AF=B4=EF=
=BC=8C=E4=B8=80=E4=B8=AA=E5=85=B8=E5=9E=8B=E7=9A=84=E6=83=85=E5=86=B5=E6=98=
=AF::
> > >
> > > maybe
> > > =E4=BB=A5=E4=B8=8B=E6=83=85=E5=86=B5=E5=8F=AF=E8=83=BD=E5=BE=88=E5=85=
=B8=E5=9E=8B
> > OK!
> > >
> > > >+
> > > >+      - write code that depends on a symbol from a not imported
> > namespace
> > > >+      - `make`
> > > >+      - notice the warning of modpost telling about a missing import
> > > >+      - run `make nsdeps` to add the import to the correct code
> > location
> >
>    - =E7=BC=96=E5=86=99=E4=BE=9D=E8=B5=96=E6=9C=AA=E5=AF=BC=E5=85=A5=E5=
=91=BD=E5=90=8D=E7=A9=BA=E9=97=B4=E7=9A=84=E7=AC=A6=E5=8F=B7=E7=9A=84=E4=BB=
=A3=E7=A0=81
>    - ``make``
>    - =E6=B3=A8=E6=84=8F ``modpost`` =E7=9A=84=E8=AD=A6=E5=91=8A=EF=BC=8C=
=E6=8F=90=E9=86=92=E4=BD=A0=E6=9C=89=E4=B8=80=E4=B8=AA=E4=B8=A2=E5=A4=B1=E7=
=9A=84=E5=AF=BC=E5=85=A5=E3=80=82
>    - =E8=BF=90=E8=A1=8C ``make nsdeps``=E5=B0=86=E5=AF=BC=E5=85=A5=E6=B7=
=BB=E5=8A=A0=E5=88=B0=E6=AD=A3=E7=A1=AE=E7=9A=84=E4=BB=A3=E7=A0=81=E4=BD=8D=
=E7=BD=AE=E3=80=82
>=20
> > > >+
> > > >+=E5=AF=B9=E4=BA=8E=E5=BC=95=E5=85=A5=E5=91=BD=E5=90=8D=E7=A9=BA=E9=
=97=B4=E7=9A=84=E5=AD=90=E7=B3=BB=E7=BB=9F=E7=BB=B4=E6=8A=A4=E8=80=85=E6=9D=
=A5=E8=AF=B4=EF=BC=8C=E5=85=B6=E6=AD=A5=E9=AA=A4=E9=9D=9E=E5=B8=B8=E7=9B=B8=
=E4=BC=BC=E3=80=82=E5=90=8C=E6=A0=B7=EF=BC=8Cmake nsdeps=E6=9C=80=E7=BB=88=
=E5=B0=86
> > > >+=E4=B8=BA=E6=A0=91=E5=86=85=E6=A8=A1=E5=9D=97=E6=B7=BB=E5=8A=A0=E7=
=BC=BA=E5=A4=B1=E7=9A=84=E5=91=BD=E5=90=8D=E7=A9=BA=E9=97=B4=E5=AF=BC=E5=85=
=A5::
> > > >+
> > > >+      - move or add symbols to a namespace (e.g. with
> > EXPORT_SYMBOL_NS())
> > > >+      - `make` (preferably with an allmodconfig to cover all in-ker=
nel
> > > >+        modules)
> > > >+      - notice the warning of modpost telling about a missing import
> > > >+      - run `make nsdeps` to add the import to the correct code
> > location
> >
> > >+
> >

Pay attention to indentation ;)

> - =E5=90=91=E5=91=BD=E5=90=8D=E7=A9=BA=E9=97=B4=E8=BD=AC=E7=A7=BB=E6=88=
=96=E6=B7=BB=E5=8A=A0=E7=AC=A6=E5=8F=B7=EF=BC=88=E4=BE=8B=E5=A6=82=EF=BC=8C=
=E4=BD=BF=E7=94=A8EXPORT_SYMBOL_NS()=EF=BC=89=E3=80=82
> - `make e`=EF=BC=88=E6=9C=80=E5=A5=BD=E6=98=AF=E7=94=A8allmodconfig=E6=9D=
=A5=E8=A6=86=E7=9B=96=E6=89=80=E6=9C=89=E7=9A=84=E5=86=85=E6=A0=B8=E6=A8=A1=
=E5=9D=97=EF=BC=89=E3=80=82

``make``

> - =E6=B3=A8=E6=84=8F ``modpost`` =E7=9A=84=E8=AD=A6=E5=91=8A=EF=BC=8C=E6=
=8F=90=E9=86=92=E4=BD=A0=E6=9C=89=E4=B8=80=E4=B8=AA=E4=B8=A2=E5=A4=B1=E7=9A=
=84=E5=AF=BC=E5=85=A5=E3=80=82
> - =E8=BF=90=E8=A1=8C ``maknsdeps``=E5=B0=86=E5=AF=BC=E5=85=A5=E6=B7=BB=E5=
=8A=A0=E5=88=B0=E6=AD=A3=E7=A1=AE=E7=9A=84=E4=BB=A3=E7=A0=81=E4=BD=8D=E7=BD=
=AE=E3=80=82
>=20
> > >
> > > above two blocks seem need to translate
> > OK!
> > >

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks

Wu X.C.

--/9DWx/yDrRhgMJTb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCKQqgACgkQtlsoEiKC
sIWBQQwA3PAOml0g9yEGHmB1N0c3rT/BFAfF2AwFXc6YahYE7pua7nJAJwl02nFd
YrXvQwzeB9fvJNJY4yG8IzuCANHIui+cfcBg+ydS1vt69Dbo4hD+wa0H3zhUPIR3
E7GLgPiC4t1FnflLZAu6EcLgEsOG3AgP2uhwumlXQdjgf+CmukiRLNNdTbtC24Xx
pBqFOqSprH2MbWOm/zghKzwoF5+dsfF+rg0bGmrBTaua9SPe9I+qDBN3pOWcu19e
iLY7UiSHFLUtaB2rcEmijn2zjSfrodzOmoKRUmpYN/DpEc7f6cgvBny80JjEK596
8E4dtBzbNOrmqLdLCpsBl7J+LlzZvOacWfqTYJdXL7VUZP+XDmFrg6sCvM4PNU31
PR02bDNGS5+jpuwqa0YQpe1AT32xpUo7O/ygy8s4N1oSVB7gnbdPPzcpkecaflBv
BacnU71WJxoUtF5c/0Ar/rFHD4HSmljVNvx2VPshk0aQEq+v5q62z4kZ8mqeSQbB
KXByDf0l
=WfH3
-----END PGP SIGNATURE-----

--/9DWx/yDrRhgMJTb--

