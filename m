Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129C9C43334
	for <linux-doc@archiver.kernel.org>; Thu,  9 Jun 2022 01:35:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbiFIBfD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 21:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbiFIBfB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 21:35:01 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1139717F83E
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 18:35:01 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id s39so11819099ybi.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Jun 2022 18:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fShwCUpzMgplBS407bST46ZUvaWI+nvipL++oOrkX9k=;
        b=JaDCfup3IH7ag28lBmbSYjCVJgbIkfVGWxztoM8tBSH8A6laD23O3r+M/dbZsUh/qp
         MhFnj1Tku2ZCK77fD+Z9hAL5SpC8jbpa9xLH/FwYRRrRGfC6bFwPNpcOwC8xwwQpERom
         84A+D9SQnVLDgkSYbFibSPdSgdHS1HMcRTjFdXQeiOycvP2n8lShb9v9AI1x+krFX0cp
         Wx3rJtWa+uikXMMygYsynJxXLt5byldE0B0vSsBKrNr9wn8Hwh1MpuWXWbMCzDZdWpeh
         CuWCWG67KdlIXmOOmII0JTwtTMqPy4zd67jk/Hc5ifsrWVdSbGr8aBDfw8K8GX+jxoqK
         l4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fShwCUpzMgplBS407bST46ZUvaWI+nvipL++oOrkX9k=;
        b=myqZRp9/B/Rr9G7Kgn+KYQPKFkhtOBFjTOFoiTDniix7KjUVlkUcW3Xm7zaFBJsjgp
         CqJ+FT6v/7hz/QZBSk7SSuIeqZpjyxpW3w4akOjkJWxJS+JfBYoxZDuY+jlq7o1lOIYf
         r1onLYJD8XPHP+RMU8i84QcCyl5gHtdWHc0vsOOHA9yIQQmaXBoRPKPoGVhaWTnIeTlj
         EM0mg9wDCpzROd+csMDOljSEqi7j0QYGSaHer4o5IovFgh7gMctggBT1VomT/3X2Su/P
         OsjIo9yRZscuzxK3fTuuJu8O6bLGaHWMJjy7TMiqXEbOx2+j1oYJ7tdlPx3Rva460isX
         suNQ==
X-Gm-Message-State: AOAM530sKKmvbu3BnaXG/qRcbg3U/hsvIcENpriT/vH8FP+737Qkmdfr
        ltLvOE5ohuELResG5ESQU+PlK/byin71tVLDMEE=
X-Google-Smtp-Source: ABdhPJzDiT7YU63dVXBS+84l0In9XYRuT8ixzIFJd1Djvo8dfy4BX2XSXyoMop+s6MttqMzZLF8TyS0HNmNi+LYo2zw=
X-Received: by 2002:a25:8252:0:b0:65d:1c9b:19af with SMTP id
 d18-20020a258252000000b0065d1c9b19afmr38818406ybn.15.1654738500170; Wed, 08
 Jun 2022 18:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1654685338.git.zhoubinbin@loongson.cn> <10cd6a241a0266d1d19ee5f0b2177d7d14d17ed2.1654685338.git.zhoubinbin@loongson.cn>
 <YqCRuwy9dsl50lPu@bobwxc.mipc>
In-Reply-To: <YqCRuwy9dsl50lPu@bobwxc.mipc>
From:   teng sterling <sterlingteng@gmail.com>
Date:   Thu, 9 Jun 2022 09:34:47 +0800
Message-ID: <CAMU9jJpRdvAnFbjdPLObLTBHRGHY1mFo-8KTviG6F+CYhoRLVA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] docs/zh_CN: riscv: Update the translation of
 vm-layout.rst to 5.19-rc1
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     "Wu X.C." <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu X.C. <bobwxc@email.cn> =E4=BA=8E2022=E5=B9=B46=E6=9C=889=E6=97=A5=E5=91=
=A8=E5=9B=9B 00:45=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Jun 08, 2022 at 07:08:21PM +0800, Binbin Zhou wrote:
> > Synchronous translation from upstream commit 9d19f2b5256e
> > ("Documentation: riscv: Add sv48 description to VM layout")
> >
> > Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>

Thanks,
Yanteng
>
> Thanks :)
>
> > ---
> >  .../translations/zh_CN/riscv/vm-layout.rst    | 37 +++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/Documentation/translations/zh_CN/riscv/vm-layout.rst b/Doc=
umentation/translations/zh_CN/riscv/vm-layout.rst
> > index 585cb89317a3..91884e2dfff8 100644
> > --- a/Documentation/translations/zh_CN/riscv/vm-layout.rst
> > +++ b/Documentation/translations/zh_CN/riscv/vm-layout.rst
> > @@ -6,6 +6,7 @@
> >  :=E7=BF=BB=E8=AF=91:
> >
> >   =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> > +        Binbin Zhou <zhoubinbin@loongson.cn>
> >
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> >  RISC-V Linux=E4=B8=8A=E7=9A=84=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=
=B8=83=E5=B1=80
> > @@ -65,3 +66,39 @@ RISC-V Linux Kernel SV39
> >     ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | module=
s, BPF
> >     ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> >    __________________|____________|__________________|_________|_______=
_____________________________________________________
> > +
> > +
> > +RISC-V Linux Kernel SV48
> > +------------------------
> > +
> > +::
> > +
> > + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +      =E5=BC=80=E5=A7=8B=E5=9C=B0=E5=9D=80       |   =E5=81=8F=E7=A7=
=BB      |     =E7=BB=93=E6=9D=9F=E5=9C=B0=E5=9D=80      |  =E5=A4=A7=E5=B0=
=8F    | =E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=8C=BA=E5=9F=9F=E6=8F=8F=E8=
=BF=B0
> > + =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +                    |            |                  |         |
> > +   0000000000000000 |    0       | 00007fffffffffff |  128 TB | =E7=94=
=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=EF=BC=8C=
=E6=AF=8F=E4=B8=AA=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E5=99=A8=E4=B8=8D=E5=
=90=8C
> > +  __________________|____________|__________________|_________|_______=
____________________________________________________
> > +                    |            |                  |         |
> > +   0000800000000000 | +128    TB | ffff7fffffffffff | ~16M TB | ... =
=E5=B7=A8=E5=A4=A7=E7=9A=84=E3=80=81=E5=87=A0=E4=B9=8E64=E4=BD=8D=E5=AE=BD=
=E7=9A=84=E7=9B=B4=E5=88=B0=E5=86=85=E6=A0=B8=E6=98=A0=E5=B0=84=E7=9A=84-12=
8TB=E5=9C=B0=E6=96=B9
> > +                    |            |                  |         |     =
=E5=BC=80=E5=A7=8B=E5=81=8F=E7=A7=BB=E7=9A=84=E9=9D=9E=E7=BB=8F=E5=85=B8=E8=
=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=E5=9C=B0=E5=9D=80=E7=A9=BA=E6=B4=9E=E3=80=
=82
> > +                    |            |                  |         |
> > +  __________________|____________|__________________|_________|_______=
____________________________________________________
> > +                                                              |
> > +                                                              | =E5=86=
=85=E6=A0=B8=E7=A9=BA=E9=97=B4=E7=9A=84=E8=99=9A=E6=8B=9F=E5=86=85=E5=AD=98=
=EF=BC=8C=E5=9C=A8=E6=89=80=E6=9C=89=E8=BF=9B=E7=A8=8B=E4=B9=8B=E9=97=B4=E5=
=85=B1=E4=BA=AB:
> > +  ____________________________________________________________|_______=
____________________________________________________
> > +                    |            |                  |         |
> > +   ffff8d7ffee00000 |  -114.5 TB | ffff8d7ffeffffff |    2 MB | fixmap
> > +   ffff8d7fff000000 |  -114.5 TB | ffff8d7fffffffff |   16 MB | PCI io
> > +   ffff8d8000000000 |  -114.5 TB | ffff8f7fffffffff |    2 TB | vmemma=
p
> > +   ffff8f8000000000 |  -112.5 TB | ffffaf7fffffffff |   32 TB | vmallo=
c/ioremap space
> > +   ffffaf8000000000 |  -80.5  TB | ffffef7fffffffff |   64 TB | =E7=9B=
=B4=E6=8E=A5=E6=98=A0=E5=B0=84=E6=89=80=E6=9C=89=E7=89=A9=E7=90=86=E5=86=85=
=E5=AD=98
> > +   ffffef8000000000 |  -16.5  TB | fffffffeffffffff | 16.5 TB | kasan
> > +  __________________|____________|__________________|_________|_______=
_____________________________________________________
> > +                                                              |
> > +                                                              | =E4=BB=
=8E=E6=AD=A4=E5=A4=84=E5=BC=80=E5=A7=8B=EF=BC=8C=E4=B8=8E39-bit=E5=B8=83=E5=
=B1=80=E7=9B=B8=E5=90=8C=EF=BC=9A
> > +  ____________________________________________________________|_______=
_____________________________________________________
> > +                    |            |                  |         |
> > +   ffffffff00000000 |   -4    GB | ffffffff7fffffff |    2 GB | module=
s, BPF
> > +   ffffffff80000000 |   -2    GB | ffffffffffffffff |    2 GB | kernel
> > +  __________________|____________|__________________|_________|_______=
_____________________________________________________
> > --
> > 2.20.1
