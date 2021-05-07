Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6E28C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 02:15:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7771E6113D
	for <linux-doc@archiver.kernel.org>; Fri,  7 May 2021 02:15:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhEGCQo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 22:16:44 -0400
Received: from m32-153.88.com ([43.250.32.153]:33178 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229909AbhEGCQo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 6 May 2021 22:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=mpv2HzfZQ0h8nsqQ6zLy4nH8/6hltnBHPCbCE
        i8SC98=; b=UAtCcXVdZu6GWbFm3eK78lT4IJFtIkLBEIPvd2slA06stfRV7Tpn5
        rUAOo5rP9a12u3jtaQ3m9SQtzdkl6Z5JLgRyf7tnJcp+U5Z5lgXzDaerlYAoaEWp
        74+4aUDpXwmvSoytcmzDSPQ/sUK4IyaSjm0keVefxr1j/7Nu1gQe0o=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXJlnBopRggREiAA--.21504S2;
        Fri, 07 May 2021 10:15:31 +0800 (CST)
Date:   Fri, 7 May 2021 10:15:29 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 3/3] docs/zh_CN: add parisc registers.rst translation
Message-ID: <20210507021528.GA19650@bobwxc.top>
References: <cover.1619665430.git.siyanteng@loongson.cn>
 <45fb9f5b1000c99dff42aabbcfec94e429926235.1619665430.git.siyanteng@loongson.cn>
 <20210429151513.GC23087@bobwxc.top>
 <CAEensMyp52Td5NTvW1o1vOz49pjb9DSvSa0fQY2CkCzwW0WMKQ@mail.gmail.com>
 <CAEensMwsPe6ZnsPYPP9yUWhWuhOiC0EyZuqkxTmM7YCO07_t8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="M9NhX3UHpAaciwkO"
Content-Disposition: inline
In-Reply-To: <CAEensMwsPe6ZnsPYPP9yUWhWuhOiC0EyZuqkxTmM7YCO07_t8A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXJlnBopRggREiAA--.21504S2
X-Coremail-Antispam: 1UD129KBjvJXoW3CryxXFW7JryDJw1rArWxCrg_yoWkWFWfpr
        9xKa4xGw4UtryUKr4UKw1UWrnFkr18Jr1UXr97Jr18Jr1qkr17Jr1Utry8GrWkGryUAryU
        Zr4Utr17Ar15A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgqb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80
        ewAv7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMx
        AIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_
        Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
        AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
        cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
        IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
        vjDU0xZFpf9x07UjhFxUUUUU=
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--M9NhX3UHpAaciwkO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 05:48:26PM +0800, yanteng si wrote:
> Hi Xiangcheng=EF=BC=9A
>=20
> an asterisk=EF=BC=88*=EF=BC=89 is used for planned usage which is current=
ly unimplemented.
> so, I add "*"  to corresponding place.

ok

>=20
> yanteng si <siyanteng01@gmail.com> =E4=BA=8E2021=E5=B9=B45=E6=9C=884=E6=
=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=8D=883:26=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Wu X.C. <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B44=E6=9C=8829=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8811:15=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, Apr 29, 2021 at 11:33:35AM +0800, Yanteng Si wrote:
> > > > This patch translates Documentation/parisc/registers.rst into Chine=
se.
> > > >
> > > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > > ---
> > > >  .../translations/zh_CN/parisc/index.rst       |   2 +-
> > > >  .../translations/zh_CN/parisc/registers.rst   | 153 ++++++++++++++=
++++
> > > >  2 files changed, 154 insertions(+), 1 deletion(-)
> > > >  create mode 100644 Documentation/translations/zh_CN/parisc/registe=
rs.rst
> > > >
> > > > diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Do=
cumentation/translations/zh_CN/parisc/index.rst
> > > > index b913d664e735..a47454ebe32e 100644
> > > > --- a/Documentation/translations/zh_CN/parisc/index.rst
> > > > +++ b/Documentation/translations/zh_CN/parisc/index.rst
> > > > @@ -14,10 +14,10 @@ PA-RISC=E4=BD=93=E7=B3=BB=E6=9E=B6=E6=9E=84
> > > >     :maxdepth: 2
> > > >
> > > >     debugging
> > > > +   registers
> > > >
> > > >  Todolist:
> > > >
> > > > -   registers
> > > >     features
> > > >
> > > >  .. only::  subproject and html
> > > > diff --git a/Documentation/translations/zh_CN/parisc/registers.rst =
b/Documentation/translations/zh_CN/parisc/registers.rst
> > > > new file mode 100644
> > > > index 000000000000..7a2193674cb0
> > > > --- /dev/null
> > > > +++ b/Documentation/translations/zh_CN/parisc/registers.rst
> > > > @@ -0,0 +1,153 @@
> > > > +.. include:: ../disclaimer-zh_CN.rst
> > > > +
> > > > +:Original: Documentation/parisc/registers.rst
> > > > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > > > +
> > > > +.. _cn_parisc_registers:
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > +Linux/PA-RISC=E7=9A=84=E5=AF=84=E5=AD=98=E5=99=A8=E7=94=A8=E6=B3=95
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > +
> > > > +[ =E7=94=A8=E6=98=9F=E5=8F=B7=E8=A1=A8=E7=A4=BA=E7=9B=AE=E5=89=8D=
=E5=B0=9A=E6=9C=AA=E5=AE=9E=E7=8E=B0=E7=9A=84=E8=AE=A1=E5=88=92=E7=94=A8=E9=
=80=94=E3=80=82 ]
> > > > +
> > > > +ABI=E7=BA=A6=E5=AE=9A=E7=9A=84=E9=80=9A=E7=94=A8=E5=AF=84=E5=AD=98=
=E5=99=A8
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=E6=8E=A7=E5=88=B6=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +----------
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +CR 0 (=E6=81=A2=E5=A4=8D=E8=AE=A1=E6=95=B0=E5=99=A8)              =
 =E7=94=A8=E4=BA=8Eptrace
> > > > +CR 1-CR 7(=E6=97=A0=E5=AE=9A=E4=B9=89)               =E6=9C=AA=E4=
=BD=BF=E7=94=A8
> > > > +CR 8 (Protection ID)            =E6=AF=8F=E8=BF=9B=E7=A8=8B value*
> =E6=AF=8F=E8=BF=9B=E7=A8=8B=E5=80=BC*
> > >
> > > =E4=BF=9D=E6=8A=A4ID =EF=BC=9F
> > I think the words translated here may make it difficult to understand=
=E3=80=82

ok

> >
> > > =E9=80=90=E8=BF=9B=E7=A8=8B=E5=80=BC
> > =E9=80=90 =3D =E6=AF=8F

Fine

> >
> > >
> > > > +CR 9, 12, 13 (PIDS)             =E6=9C=AA=E4=BD=BF=E7=94=A8=E7=9A=
=84
> > >
> > > remove =E7=9A=84
> > OK=EF=BC=81
> > >
> > > > +CR10 (CCR)                      =E6=87=92=E6=83=B0FPU saving*
> > >
> > > FPU=E5=BB=B6=E8=BF=9F=E4=BF=9D=E5=AD=98
> > OK=EF=BC=81
>  FPU=E5=BB=B6=E8=BF=9F=E4=BF=9D=E5=AD=98*
> > > FYI <https://access.redhat.com/solutions/3485131>
> > >
> > > > +CR11                            =E6=8C=89=E7=85=A7ABI=E7=9A=84=E8=
=A7=84=E5=AE=9A=EF=BC=88SAR=EF=BC=89=E3=80=82
> > > > +CR14 (=E4=B8=AD=E6=96=AD=E5=90=91=E9=87=8F)                 =E5=88=
=9D=E5=A7=8B=E5=8C=96=E4=B8=BA fault_vector
> > > > +CR15 (EIEM)                     =E5=88=9D=E5=A7=8B=E5=8C=96=E4=B8=
=BA=E6=89=80=E6=9C=89=E7=9A=84 ones*
> > >
> > > What is "ones" ?
> > I Think "ones" is a point.
> > Need to see the code to know, I need some time.
> =E6=89=80=E6=9C=89=E4=BD=8D=E5=88=9D=E5=A7=8B=E5=8C=96=E4=B8=BA1

ok

> > >
> > > > +CR16 (=E9=97=B4=E9=9A=94=E8=AE=A1=E6=97=B6=E5=99=A8)              =
 =E8=AF=BB=E5=8F=96=E5=91=A8=E6=9C=9F=E6=95=B0/=E5=86=99=E5=85=A5=E5=BC=80=
=E5=A7=8B=E6=97=B6=E9=97=B4=E9=97=B4=E9=9A=94 Tmr
> > >
> > > T(i)m(e)r
> > Origin Doc is Tmr. :)

I mean why not translate it to =E8=AE=A1=E6=97=B6=E5=99=A8

> >
> > >
> > > > +CR17-CR22                       =E4=B8=AD=E6=96=AD=E5=8F=82=E6=95=
=B0
> > > > +CR19                            =E4=B8=AD=E6=96=AD=E6=8C=87=E4=BB=
=A4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +CR20                            =E4=B8=AD=E6=96=AD=E7=A9=BA=E9=97=
=B4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +CR21                            =E4=B8=AD=E6=96=AD=E5=81=8F=E7=A7=
=BB=E9=87=8F=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +CR22                            =E4=B8=AD=E6=96=AD PSW
> > > > +CR23 (EIRR)                     =E8=AF=BB=E5=8F=96=E6=9C=AA=E5=86=
=B3=E4=B8=AD=E6=96=AD/=E5=86=99=E5=85=A5=E6=B8=85=E9=99=A4=E4=BD=8D
> > > > +CR24 (TR 0)                     =E5=86=85=E6=A0=B8=E7=A9=BA=E9=97=
=B4=E9=A1=B5=E7=9B=AE=E5=BD=95=E6=8C=87=E9=92=88
> > > > +CR25 (TR 1)                     =E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=
=B4=E9=A1=B5=E7=9B=AE=E5=BD=95=E6=8C=87=E9=92=88
> > > > +CR26 (TR 2)                     =E4=B8=8D=E4=BD=BF=E7=94=A8
> > > > +CR27 (TR 3)                     =E7=BA=BF=E7=A8=8B=E6=8F=8F=E8=BF=
=B0=E7=AC=A6=E6=8C=87=E9=92=88
> > > > +CR28 (TR 4)                     =E4=B8=8D=E4=BD=BF=E7=94=A8
> > > > +CR29 (TR 5)                     =E4=B8=8D=E4=BD=BF=E7=94=A8
> > > > +CR30 (TR 6)                     =E5=BD=93 / 0
> > >
> > > =E5=BD=93 ?
> > =E5=BD=93=E5=89=8D

ok

> > >
> > > > +CR31 (TR 7)                     =E4=B8=B4=E6=97=B6=E5=AF=84=E5=AD=
=98=E5=99=A8=EF=BC=8C=E5=9C=A8=E4=B8=8D=E5=90=8C=E5=9C=B0=E6=96=B9=E4=BD=BF=
=E7=94=A8
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=E7=A9=BA=E9=97=B4=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88=E5=86=85=E6=
=A0=B8=E6=A8=A1=E5=BC=8F=EF=BC=89
> > > > +----------------------
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D                        =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +SR0                             =E4=B8=B4=E6=97=B6=E7=A9=BA=E9=97=
=B4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +SR4-SR7                         =E8=AE=BE=E7=BD=AE=E4=B8=BA0
> > > > +SR1                             =E4=B8=B4=E6=97=B6=E7=A9=BA=E9=97=
=B4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +SR2                             =E5=86=85=E6=A0=B8=E4=B8=8D=E5=BA=
=94=E8=AF=A5=E7=A0=B4=E5=9D=8F=E5=AE=83
> > > > +SR3                             =E7=94=A8=E4=BA=8E=E7=94=A8=E6=88=
=B7=E7=A9=BA=E9=97=B4=E8=AE=BF=E9=97=AE=EF=BC=88=E5=BD=93=E5=89=8D=E8=BF=9B=
=E7=A8=8B=EF=BC=89=E3=80=82
> > >
> > > remove =E3=80=82
> > OK=EF=BC=81
> > >
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D                        =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +=E7=A9=BA=E9=97=B4=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88=E7=94=A8=E6=
=88=B7=E6=A8=A1=E5=BC=8F=EF=BC=89
> > > > +----------------------
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D                        =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +SR0                             =E4=B8=B4=E6=97=B6=E7=A9=BA=E9=97=
=B4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +SR1                             =E4=B8=B4=E6=97=B6=E7=A9=BA=E9=97=
=B4=E5=AF=84=E5=AD=98=E5=99=A8
> > > > +SR2                             =E4=BF=9D=E5=AD=98Linux=E7=BD=91=
=E5=85=B3=E9=A1=B5=E7=9A=84=E7=A9=BA=E9=97=B4
> > >
> > > =E7=BD=91=E5=85=B3? I am not sure if it's correct.
> > Emmmmm=EF=BC=8CPlease give me some time
>=20
> The Linux gateway page on PA-RISC is "special".
> It actually has PAGE_GATEWAY bits set (this is linux terminology; in pari=
sc
> terminology it's Execute, promote to PL0) in the page map.  So anything
> executing on this page executes with kernel level privilege (there's more=
 to it
> than that: to have this happen, you also have to use a branch with a ,gate
> completer to activate the privilege promotion).  The upshot is that every=
thing
> that runs on the gateway page runs at kernel privilege but with the curre=
nt
> user process address space (although you have access to kernel space via =
%sr2).
> For the 0x100 syscall entry, we redo the space registers to point to the =
kernel
> address space (preserving the user address space in %sr3), move to wide m=
ode if
> required, save the user registers and branch into the kernel syscall entry
> point.  For all the other functions, we execute at kernel privilege but d=
on't
> flip address spaces. The basic upshot of this is that these code snippets=
 are
> executed atomically (because the kernel can't be pre-empted) and they may
> perform architecturally forbidden (to PL3) operations (like setting contr=
ol
> registers).
>=20
> The "gateway page" is a trap, the page contains privileged code to
> help handle user
> state exceptions. Since there is no "syscall" command in parisc, so
> "syscall" is a jump
> into "gateway page", and I think it is better to keep it in English.
>

Thanks for the long explanation.
> =E4=BF=9D=E5=AD=98Linux gateway page=E7=9A=84=E7=A9=BA=E9=97=B4? :)
OK, it's reasonable to keep it here.

>=20
> > >
> > > > +SR3                             =E5=9C=A8=E5=86=85=E6=A0=B8=E4=B8=
=AD=E4=BF=9D=E5=AD=98=E7=94=A8=E6=88=B7=E5=9C=B0=E5=9D=80=E7=A9=BA=E9=97=B4=
=E7=9A=84=E5=80=BC
> > > > +SR4-SR7                         =E5=AE=9A=E4=B9=89=E4=BA=86=E7=94=
=A8=E6=88=B7/=E5=86=85=E6=A0=B8=E7=9A=84=E7=9F=AD=E5=9C=B0=E5=9D=80=E7=A9=
=BA=E9=97=B4
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D                        =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +
> > > > +=E5=A4=84=E7=90=86=E5=99=A8=E7=8A=B6=E6=80=81=E5=AD=97
> > > > +------------
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > > +W =EF=BC=8864=E4=BD=8D=E5=9C=B0=E5=9D=80=EF=BC=89                 =
 0
> > > > +E =EF=BC=88=E5=B0=8F=E5=B0=BE=E7=AB=AF=EF=BC=89                   =
 0
> > > > +S =EF=BC=88=E5=AE=89=E5=85=A8=E9=97=B4=E9=9A=94=E8=AE=A1=E6=97=B6=
=E5=99=A8=EF=BC=89            0
> > > > +T =EF=BC=88=E4=BA=A7=E7=94=9F=E5=88=86=E6=94=AF=E9=99=B7=E9=98=B1=
=EF=BC=89              0
> > > > +H =EF=BC=88=E9=AB=98=E7=89=B9=E6=9D=83=E7=BA=A7=E9=99=B7=E9=98=B1=
=EF=BC=89              0
> > > > +L =EF=BC=88=E4=BD=8E=E7=89=B9=E6=9D=83=E7=BA=A7=E9=99=B7=E9=98=B1=
=EF=BC=89              0
> > > > +N =EF=BC=88=E6=92=A4=E9=94=80=E4=B8=8B=E4=B8=80=E6=9D=A1=E6=8C=87=
=E4=BB=A4=EF=BC=89            =E8=A2=ABC=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=94=A8
> > > > +X =EF=BC=88=E6=95=B0=E6=8D=AE=E5=AD=98=E5=82=A8=E4=B8=AD=E6=96=AD=
=E7=A6=81=E7=94=A8=EF=BC=89          0
> > > > +B =EF=BC=88=E4=BA=A7=E7=94=9F=E5=88=86=E6=94=AF=EF=BC=89          =
        =E8=A2=ABC=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=94=A8
> > > > +C =EF=BC=88=E4=BB=A3=E7=A0=81=E5=9C=B0=E5=9D=80=E8=BD=AC=E8=AF=91=
=EF=BC=89              1, =E5=9C=A8=E6=89=A7=E8=A1=8C=E5=AE=9E=E6=A8=A1=E5=
=BC=8F=E4=BB=A3=E7=A0=81=E6=97=B6=E4=B8=BA0
> > > > +V =EF=BC=88=E9=99=A4=E6=B3=95=E6=AD=A5=E9=95=BF=E6=A0=A1=E6=AD=A3=
=EF=BC=89              =E8=A2=ABC=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=94=A8
> > > > +M =EF=BC=88HPMC =E6=8E=A9=E7=A0=81=EF=BC=89                 0, =E5=
=9C=A8=E6=89=A7=E8=A1=8CHPMC handler* =E6=97=B6=E4=B8=BA1
> > >
> > > handler
> > I think "handler" is a point.
> handler -> =E6=93=8D=E4=BD=9C
> > >
> > > > +C/B =EF=BC=88=E8=BF=9B/=E5=80=9F =E4=BD=8D=EF=BC=89               =
 =E8=A2=ABC=E4=BB=A3=E7=A0=81=E4=BD=BF=E7=94=A8
> > > > +O =EF=BC=88=E6=9C=89=E5=BA=8F=E5=BC=95=E7=94=A8=EF=BC=89          =
        1*
> > > > +F =EF=BC=88=E6=80=A7=E8=83=BD=E7=9B=91=E8=A7=86=E5=99=A8=EF=BC=89 =
               0
> > > > +R =EF=BC=88=E5=9B=9E=E6=94=B6=E8=AE=A1=E6=95=B0=E5=99=A8=E9=99=B7=
=E9=98=B1=EF=BC=89            0
> > > > +Q =EF=BC=88=E6=94=B6=E9=9B=86=E4=B8=AD=E6=96=AD=E7=8A=B6=E6=80=81=
=EF=BC=89              1 =EF=BC=88=E5=9C=A8rfi=E4=B9=8B=E5=89=8D=E7=9A=84=
=E4=BB=A3=E7=A0=81=E4=B8=AD=E4=B8=BA0=EF=BC=89
> > > > +P =EF=BC=88=E4=BF=9D=E6=8A=A4=E6=A0=87=E8=AF=86=E7=AC=A6=EF=BC=89 =
               1*
> > > > +D =EF=BC=88=E6=95=B0=E6=8D=AE=E5=9C=B0=E5=9D=80=E8=BD=AC=E8=AF=91=
=EF=BC=89              1, =E5=9C=A8=E6=89=A7=E8=A1=8C=E5=AE=9E=E6=A8=A1exte=
rnal interrupt mask=E5=BC=8F=E4=BB=A3=E7=A0=81=E6=97=B6=E4=B8=BA0
> > > ------------------------------------------------^^^^^^^^^^^^^^^^^^^^^=
^^
> > =E5=9C=A8=E6=89=A7=E8=A1=8C=E5=AE=9E=E6=A8=A1=E5=BC=8F=E4=BB=A3=E7=A0=
=81=E6=97=B6=E4=B8=BA0
> > >
> > > > +I =EF=BC=88=E5=A4=96=E9=83=A8=E4=B8=AD=E6=96=AD=E6=8E=A9=E7=A0=81=
=EF=BC=89              =E7=94=B1cli()/sti()=E5=AE=8F=E4=BD=BF=E7=94=A8=E3=
=80=82
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
          =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > > > +
> > > > +=E2=80=9C=E9=9A=90=E5=BD=A2=E2=80=9D =E5=AF=84=E5=AD=98=E5=99=A8=
=EF=BC=88=E5=BD=B1=E5=AD=90=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=89
> > > ---------^
> > > extra space
> > OK! DEL
> > >
> > > > +---------------------------
> > > > +
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                   =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +PSW W =E9=BB=98=E8=AE=A4=E5=80=BC                    0
> > > > +PSW E =E9=BB=98=E8=AE=A4=E5=80=BC                    0
> > > > +=E5=BD=B1=E5=AD=90=E5=AF=84=E5=AD=98=E5=99=A8                     =
 =E8=A2=AB=E4=B8=AD=E6=96=AD=E5=A4=84=E7=90=86=E4=BB=A3=E7=A0=81=E4=BD=BF=
=E7=94=A8
> > > > +TOC=E5=90=AF=E7=94=A8=E4=BD=8D                       1
> > > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D                   =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > +
> > > > +----------------------------------------------------------
> > > > +
> > > > +PA-RISC=E6=9E=B6=E6=9E=84=E5=AE=9A=E4=B9=89=E4=BA=867=E4=B8=AA=E5=
=AF=84=E5=AD=98=E5=99=A8=E4=BD=9C=E4=B8=BA "=E5=BD=B1=E5=AD=90=E5=AF=84=E5=
=AD=98=E5=99=A8"=E3=80=82=E8=BF=99=E4=BA=9B=E5=AF=84=E5=AD=98=E5=99=A8=E5=
=9C=A8
> > >
> > > "" -> =E2=80=9C=E2=80=9D
> > ok!
> > >
> > > > +RETURN FROM INTERRUPTION AND RESTORE=E6=8C=87=E4=BB=A4=E4=B8=AD=E4=
=BD=BF=E7=94=A8=EF=BC=8C=E9=80=9A=E8=BF=87=E6=B6=88
> > > > +=E9=99=A4=E4=B8=AD=E6=96=AD=E5=A4=84=E7=90=86=E7=A8=8B=E5=BA=8F=E4=
=B8=AD=E5=AF=B9=E4=B8=80=E8=88=AC=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88GR=EF=
=BC=89=E7=9A=84=E4=BF=9D=E5=AD=98=E5=92=8C=E6=81=A2=E5=A4=8D=E7=9A=84=E9=9C=
=80=E8=A6=81=E6=9D=A5=E5=87=8F
> > > > +=E5=B0=91=E7=8A=B6=E6=80=81=E4=BF=9D=E5=AD=98=E5=92=8C=E6=81=A2=E5=
=A4=8D=E6=97=B6=E9=97=B4=E3=80=82=E5=BD=B1=E5=AD=90=E5=AF=84=E5=AD=98=E5=99=
=A8=E6=98=AFGRs 1, 8, 9, 16, 17,
> > > > +24=E5=92=8C25=E3=80=82
> > > > +
> > > > +------------------------------------------------------------------=
-------
> > > > +
> > > > +=E5=AF=84=E5=AD=98=E5=99=A8=E4=BD=BF=E7=94=A8=E8=AF=B4=E6=98=8E=EF=
=BC=8C=E6=9C=80=E5=88=9D=E7=94=B1=E7=BA=A6=E7=BF=B0-=E9=A9=AC=E6=96=87=E6=
=8F=90=E4=BE=9B=EF=BC=8C=E5=B9=B6=E7=94=B1Randolph Chung=E6=8F=90=E4=BE=9B=
=E4=B8=80=E4=BA=9B=E8=A1=A5=E5=85=85=E8=AF=B4=E6=98=8E=E3=80=82
> > >
> > > s/-/=C2=B7/
> > > or don't translate name
> > OK=EF=BC=81
> > John Marvin
> > >
> > > > +
> > > > +=E5=AF=B9=E4=BA=8E=E9=80=9A=E7=94=A8=E5=AF=84=E5=AD=98=E5=99=A8:
> > > > +
> > > > +r1,r2,r19-r26,r28,r29 & r31=E5=8F=AF=E4=BB=A5=E5=9C=A8=E4=B8=8D=E4=
=BF=9D=E5=AD=98=E5=AE=83=E4=BB=AC=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=E8=A2=
=AB=E4=BD=BF=E7=94=A8=E3=80=82=E5=BD=93=E7=84=B6=EF=BC=8C=E5=A6=82=E6=9E=9C=
=E4=BD=A0
> > > > +=E5=85=B3=E5=BF=83=E5=AE=83=E4=BB=AC=EF=BC=8C=E5=9C=A8=E8=B0=83=E7=
=94=A8=E5=8F=A6=E4=B8=80=E4=B8=AA=E7=A8=8B=E5=BA=8F=E4=B9=8B=E5=89=8D=EF=BC=
=8C=E4=BD=A0=E4=B9=9F=E9=9C=80=E8=A6=81=E4=BF=9D=E5=AD=98=E5=AE=83=E4=BB=AC=
=E3=80=82=E4=B8=8A=E9=9D=A2=E7=9A=84=E4=B8=80=E4=BA=9B=E5=AF=84=E5=AD=98=E5=
=99=A8=E7=A1=AE=E5=AE=9E
> > > > +=E6=9C=89=E7=89=B9=E6=AE=8A=E7=9A=84=E5=90=AB=E4=B9=89=EF=BC=8C=E4=
=BD=A0=E5=BA=94=E8=AF=A5=E6=B3=A8=E6=84=8F=E4=B8=80=E4=B8=8B:
> > > > +
> > > > +    r1:
> > >
> > > Next paragraph's indentation should be a 8-width TAB.
> > > So as followed.
> > OK=EF=BC=81
> > >
> > > > +    addil=E6=8C=87=E4=BB=A4=E6=98=AF=E7=A1=AC=E6=80=A7=E8=A7=84=E5=
=AE=9A=E5=B0=86=E5=85=B6=E7=BB=93=E6=9E=9C=E6=94=BE=E5=9C=A8r1=E4=B8=AD=EF=
=BC=8C=E6=89=80=E4=BB=A5=E5=A6=82=E6=9E=9C=E4=BD=A0=E4=BD=BF=E7=94=A8=E8=BF=
=99=E6=9D=A1=E6=8C=87=E4=BB=A4=E8=A6=81
> > > > +    =E6=B3=A8=E6=84=8F=E8=BF=99=E7=82=B9=E3=80=82
> > > > +
> > > > +    r2:
> > > > +    =E8=BF=99=E5=B0=B1=E6=98=AF=E8=BF=94=E5=9B=9E=E6=8C=87=E9=92=
=88=E3=80=82=E4=B8=80=E8=88=AC=E6=9D=A5=E8=AF=B4=EF=BC=8C=E4=BD=A0=E4=B8=8D=
=E6=83=B3=E4=BD=BF=E7=94=A8=E5=AE=83=EF=BC=8C=E5=9B=A0=E4=B8=BA=E4=BD=A0=E9=
=9C=80=E8=A6=81=E8=BF=99=E4=B8=AA=E6=8C=87=E9=92=88=E6=9D=A5=E8=BF=94
> > > > +    =E5=9B=9E=E7=BB=99=E4=BD=A0=E7=9A=84=E8=B0=83=E7=94=A8=E8=80=
=85=E3=80=82=E7=84=B6=E8=80=8C=EF=BC=8C=E5=AE=83=E4=B8=8E=E8=BF=99=E7=BB=84=
=E5=AF=84=E5=AD=98=E5=99=A8=E7=BB=84=E5=90=88=E5=9C=A8=E4=B8=80=E8=B5=B7=EF=
=BC=8C=E5=9B=A0=E4=B8=BA=E8=B0=83=E7=94=A8=E8=80=85=E4=B8=8D=E8=83=BD
> > > > +    =E4=BE=9D=E8=B5=96=E4=BD=A0=E8=BF=94=E5=9B=9E=E6=97=B6=E7=9A=
=84=E5=80=BC=E6=98=AF=E7=9B=B8=E5=90=8C=E7=9A=84=EF=BC=8C=E4=B9=9F=E5=B0=B1=
=E6=98=AF=E8=AF=B4=EF=BC=8C=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=B0=86r2=E5=A4=8D=
=E5=88=B6=E5=88=B0=E5=8F=A6=E4=B8=80=E4=B8=AA=E5=AF=84=E5=AD=98
> > > > +    =E5=99=A8=EF=BC=8C=E5=B9=B6=E5=9C=A8=E4=BD=9C=E5=BA=9Fr2=E5=90=
=8E=E9=80=9A=E8=BF=87=E8=AF=A5=E5=AF=84=E5=AD=98=E5=99=A8=E8=BF=94=E5=9B=9E=
=EF=BC=8C=E8=BF=99=E5=BA=94=E8=AF=A5=E4=B8=8D=E4=BC=9A=E7=BB=99=E8=B0=83=E7=
=94=A8=E7=A8=8B=E5=BA=8F=E5=B8=A6=E6=9D=A5=E9=97=AE=E9=A2=98=E3=80=82
> > > > +
> > > > +    r19-r22:
> > > > +    =E8=BF=99=E4=BA=9B=E9=80=9A=E5=B8=B8=E8=A2=AB=E8=AE=A4=E4=B8=
=BA=E6=98=AF=E4=B8=B4=E6=97=B6=E5=AF=84=E5=AD=98=E5=99=A8=E3=80=82
> > > > +    =E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8C=E5=9C=A864=E4=BD=8D=E4=B8=
=AD=E5=AE=83=E4=BB=AC=E6=98=AFarg7-arg4=E3=80=82
> > > > +
> > > > +    r23-r26:
> > > > +    =E8=BF=99=E4=BA=9B=E6=98=AFarg3-arg0=EF=BC=8C=E4=B9=9F=E5=B0=
=B1=E6=98=AF=E8=AF=B4=EF=BC=8C=E5=A6=82=E6=9E=9C=E4=BD=A0=E4=B8=8D=E5=86=8D=
=E5=85=B3=E5=BF=83=E4=BC=A0=E5=85=A5=E7=9A=84=E5=80=BC=EF=BC=8C=E4=BD=A0=E5=
=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8
> > > > +    =E5=AE=83=E4=BB=AC=E3=80=82
> > > > +
> > > > +    r28,r29:
> > > > +    =E6=98=AFret0=E5=92=8Cret1=E3=80=82=E5=AE=83=E4=BB=AC=E6=98=AF=
=E4=BD=A0=E4=BC=A0=E9=80=92=E8=BF=94=E5=9B=9E=E5=80=BC=E7=9A=84=E4=B8=9C=E8=
=A5=BF=E3=80=82r28=E6=98=AF=E4=B8=BB=E8=A6=81=E7=9A=84=E8=BF=94=E5=9B=9E=E3=
=80=82=E5=BD=93=E8=BF=94
> > > > +    =E5=9B=9E=E5=B0=8F=E7=BB=93=E6=9E=84=E6=97=B6=EF=BC=8Cr29=E4=
=B9=9F=E5=8F=AF=E4=BB=A5=E7=94=A8=E6=9D=A5=E5=B0=86=E6=95=B0=E6=8D=AE=E4=BC=
=A0=E5=9B=9E=E7=BB=99=E8=B0=83=E7=94=A8=E8=80=85=E3=80=82
> > >
> > > =E8=BF=99=E4=BF=A9=E6=98=AFret0=E5=92=8Cret1=E3=80=82=E5=AE=83=E4=BB=
=AC=E6=98=AF=E4=BD=A0=E4=BC=A0=E5=85=A5=E8=BF=94=E5=9B=9E=E5=80=BC=E7=9A=84=
=E5=9C=B0=E6=96=B9=E3=80=82r28=E6=98=AF=E4=B8=BB=E8=BF=94=E5=9B=9E=E5=80=BC=
=E3=80=82=E5=BD=93=E8=BF=94=E5=9B=9E
> > > =E5=B0=8F=E7=BB=93=E6=9E=84=E4=BD=93=E6=97=B6=EF=BC=8Cr29=E4=B9=9F=E5=
=8F=AF=E4=BB=A5=E7=94=A8=E6=9D=A5=E5=B0=86=E6=95=B0=E6=8D=AE=E4=BC=A0=E5=9B=
=9E=E7=BB=99=E8=B0=83=E7=94=A8=E8=80=85=E3=80=82
> > OK=EF=BC=81
> > =E8=B0=83=E7=94=A8=E8=80=85 -> =E8=B0=83=E7=94=A8=E7=A8=8B=E5=BA=8F=EF=
=BC=9F=EF=BC=9A=EF=BC=89
> > >
> > > > +
> > > > +    r30:
> > > > +    =E6=A0=88=E6=8C=87=E9=92=88
> > > > +
> > > > +    r31:
> > > > +    ble=E6=8C=87=E4=BB=A4=E5=B0=86=E8=BF=94=E5=9B=9E=E6=8C=87=E9=
=92=88=E6=94=BE=E5=9C=A8=E8=BF=99=E9=87=8C=E3=80=82
> > > > +
> > > > +
> > > Next paragraph's indentation is correct.
> > > > +    r3-r18,r27,r30=E9=9C=80=E8=A6=81=E8=A2=AB=E4=BF=9D=E5=AD=98=E5=
=92=8C=E6=81=A2=E5=A4=8D=E3=80=82r3-r18=E5=8F=AA=E6=98=AF=E4=B8=80=E8=88=AC=
=E7=94=A8=E9=80=94=E7=9A=84=E5=AF=84=E5=AD=98=E5=99=A8=E3=80=82
> > > > +    r27=E6=98=AF=E6=95=B0=E6=8D=AE=E6=8C=87=E9=92=88=EF=BC=8C=E7=
=94=A8=E6=9D=A5=E4=BD=BF=E5=AF=B9=E5=85=A8=E5=B1=80=E5=8F=98=E9=87=8F=E7=9A=
=84=E5=BC=95=E7=94=A8=E6=9B=B4=E5=AE=B9=E6=98=93=E3=80=82r30=E6=98=AF=E6=A0=
=88=E6=8C=87=E9=92=88=E3=80=82
> > > > --
> > > > 2.27.0
> > >

Thanks

	Wu X.C.

--M9NhX3UHpAaciwkO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCUor0ACgkQtlsoEiKC
sIVh4gwAkyeDSEoVorGWeZTXrFPOIOSQECvFVPSHpQi1j+77WwAzQZ4m+WdtFK35
ZYjm0PKe3GElIMR4+0mDSIeEeMqRN1kJzHyZSn8uhY/lypQPAvqMZh2FM5NheQUL
Fx0/b5gS60t+O0bmyXX4QQIW6AUhSEyAoStpA9r0z8hCLa+C66H7P00xKfjlCkIH
lKWbJ6ZEG587GFe6K7c1TnW9bV6QWoNZz4Q+NimkI629FJ93R4jnh9nFcWEVvcRt
Hm4uOR31zVqVnUUA+mlHxgPGG/dp2+VpzeiA7IbR864xO/J2STMgqNf+F49b5kO3
GlTWzuxtw/WKgk4B19ZSLITS43b/cSENcS56jNaAJiZZHOaakOY0GcAaNL5Vu6o9
FL0Oi8GMyGbjPPMoEOvAO5JKTWnb72GuD6355lVKq//Orjoph2xyoTGfF63miEQy
8vWiatrOoK8oEmdXcI1t1EzTwWJ/ivkXPbDv5jkDmPhl1dv5OBhLPBU+/e1vAzLc
v1H064x8
=M68h
-----END PGP SIGNATURE-----

--M9NhX3UHpAaciwkO--

