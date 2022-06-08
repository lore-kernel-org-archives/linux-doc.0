Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78AF9C43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 16:19:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245299AbiFHQTB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 12:19:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245409AbiFHQSj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 12:18:39 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932909AE40
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=/6IksaCAqINqxE2I8ORSCRmOawtZD+TGobbLH
        a8hxQ0=; b=TqcibY2p5VseQmrJot1ITr/QkUBKVy0TSHbG0iTUHdF3U80QB/VfU
        P+GgHf6lxhuy+y29oYeZY4/MH12uEBLEU1E7C4EBK6/MONk7yXnyDVY8uhH8Fvw7
        L9gB/ztoyPA+DoklidD+2JGhdPrAKnacjL60IgK2Bk0/7S6gfgGcTA=
Received: from bobwxc.mipc (unknown [120.242.68.162])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC34CLQy6BiZssOAA--.36641S2;
        Thu, 09 Jun 2022 00:18:25 +0800 (CST)
Date:   Thu, 9 Jun 2022 00:18:21 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH V2 1/2] docs/zh_CN: riscv: Remove the translation of
 pmu.rst
Message-ID: <YqDLzWpBBFZcZGkM@bobwxc.mipc>
References: <cover.1654685338.git.zhoubinbin@loongson.cn>
 <6fe45d69210300a6c065262470bce963f8dc0ec3.1654685338.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="YuecJCHJLWANY2WV"
Content-Disposition: inline
In-Reply-To: <6fe45d69210300a6c065262470bce963f8dc0ec3.1654685338.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgC34CLQy6BiZssOAA--.36641S2
X-Coremail-Antispam: 1UD129KBjvJXoW3tFW5Aw15uFy5KFW8Gr1ftFb_yoWkuF4xpa
        nxCryfKa1UArykX3sxK34j9r18ArWxCanIkFW8Aas3Xr10vrWqyFyDt3Z5Aas3Ga40yFyv
        kr4j9r4fZw1ayw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21le4C267I2x7xF54xIwI1l5I8CrVACY4xI64kE6c02F40Ex7xf
        McIj6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2
        xSY4AK67AK6r1l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UQ_-PUUUUU=
X-Originating-IP: [120.242.68.162]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--YuecJCHJLWANY2WV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 08, 2022 at 07:08:20PM +0800, Binbin Zhou wrote:
> Synchronous translation from the following:
>=20
> [1]: commit 23b1f18326ec("Documentation: riscv:
>      Remove the old documentation")
>=20
> [2]: commit 8933e7f2e375 ("Documentation: riscv: remove
>      non-existent directory from table of contents")
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/riscv/index.rst        |   1 -
>  .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
>  2 files changed, 236 deletions(-)
>  delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst
>=20
> diff --git a/Documentation/translations/zh_CN/riscv/index.rst b/Documenta=
tion/translations/zh_CN/riscv/index.rst
> index 614cde0c0997..131e405aa857 100644
> --- a/Documentation/translations/zh_CN/riscv/index.rst
> +++ b/Documentation/translations/zh_CN/riscv/index.rst
> @@ -19,7 +19,6 @@ RISC-V =E4=BD=93=E7=B3=BB=E7=BB=93=E6=9E=84
> =20
>      boot-image-header
>      vm-layout
> -    pmu
>      patch-acceptance
> =20
> =20
> diff --git a/Documentation/translations/zh_CN/riscv/pmu.rst b/Documentati=
on/translations/zh_CN/riscv/pmu.rst
> deleted file mode 100644
> index 7ec801026c4d..000000000000
> --- a/Documentation/translations/zh_CN/riscv/pmu.rst
> +++ /dev/null
> @@ -1,235 +0,0 @@
> -.. include:: ../disclaimer-zh_CN.rst
> -
> -:Original: Documentation/riscv/pmu.rst
> -
> -:=E7=BF=BB=E8=AF=91:
> -
> - =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> -
> -.. _cn_riscv_pmu:
> -
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -RISC-V=E5=B9=B3=E5=8F=B0=E4=B8=8A=E5=AF=B9PMUs=E7=9A=84=E6=94=AF=E6=8C=81
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -Alan Kao <alankao@andestech.com>, Mar 2018
> -
> -=E7=AE=80=E4=BB=8B
> -------------
> -
> -=E6=88=AA=E6=AD=A2=E6=9C=AC=E6=96=87=E6=92=B0=E5=86=99=E6=97=B6=EF=BC=8C=
=E5=9C=A8The RISC-V ISA Privileged Version 1.10=E4=B8=AD=E6=8F=90=E5=88=B0=
=E7=9A=84 perf_event
> -=E7=9B=B8=E5=85=B3=E7=89=B9=E6=80=A7=E5=A6=82=E4=B8=8B:
> -=EF=BC=88=E8=AF=A6=E6=83=85=E8=AF=B7=E6=9F=A5=E9=98=85=E6=89=8B=E5=86=8C=
=EF=BC=89
> -
> -* [m|s]counteren
> -* mcycle[h], cycle[h]
> -* minstret[h], instret[h]
> -* mhpeventx, mhpcounterx[h]
> -
> -=E4=BB=85=E6=9C=89=E4=BB=A5=E4=B8=8A=E8=BF=99=E4=BA=9B=E5=8A=9F=E8=83=BD=
=EF=BC=8C=E7=A7=BB=E6=A4=8Dperf=E9=9C=80=E8=A6=81=E5=81=9A=E5=BE=88=E5=A4=
=9A=E5=B7=A5=E4=BD=9C=EF=BC=8C=E7=A9=B6=E5=85=B6=E5=8E=9F=E5=9B=A0=E6=98=AF=
=E7=BC=BA=E5=B0=91=E4=BB=A5=E4=B8=8B=E9=80=9A=E7=94=A8=E6=9E=B6=E6=9E=84=E7=
=9A=84=E6=80=A7=E8=83=BD
> -=E7=9B=91=E6=B5=8B=E7=89=B9=E6=80=A7:
> -
> -* =E5=90=AF=E7=94=A8/=E5=81=9C=E7=94=A8=E8=AE=A1=E6=95=B0=E5=99=A8
> -  =E5=9C=A8=E6=88=91=E4=BB=AC=E8=BF=99=E9=87=8C=EF=BC=8C=E8=AE=A1=E6=95=
=B0=E5=99=A8=E4=B8=80=E7=9B=B4=E5=9C=A8=E8=87=AA=E7=94=B1=E8=BF=90=E8=A1=8C=
=E3=80=82
> -* =E8=AE=A1=E6=95=B0=E5=99=A8=E6=BA=A2=E5=87=BA=E5=BC=95=E8=B5=B7=E7=9A=
=84=E4=B8=AD=E6=96=AD
> -  =E8=A7=84=E8=8C=83=E4=B8=AD=E6=B2=A1=E6=9C=89=E8=BF=99=E7=A7=8D=E5=8A=
=9F=E8=83=BD=E3=80=82
> -* =E4=B8=AD=E6=96=AD=E6=8C=87=E7=A4=BA=E5=99=A8
> -  =E4=B8=8D=E5=8F=AF=E8=83=BD=E6=89=80=E6=9C=89=E7=9A=84=E8=AE=A1=E6=95=
=B0=E5=99=A8=E9=83=BD=E6=9C=89=E5=BE=88=E5=A4=9A=E7=9A=84=E4=B8=AD=E6=96=AD=
=E7=AB=AF=E5=8F=A3=EF=BC=8C=E6=89=80=E4=BB=A5=E9=9C=80=E8=A6=81=E4=B8=80=E4=
=B8=AA=E4=B8=AD=E6=96=AD=E6=8C=87=E7=A4=BA=E5=99=A8=E8=AE=A9=E8=BD=AF=E4=BB=
=B6=E6=9D=A5=E5=88=A4=E6=96=AD
> -  =E5=93=AA=E4=B8=AA=E8=AE=A1=E6=95=B0=E5=99=A8=E5=88=9A=E5=A5=BD=E6=BA=
=A2=E5=87=BA=E3=80=82
> -* =E5=86=99=E5=85=A5=E8=AE=A1=E6=95=B0=E5=99=A8
> -  =E7=94=B1=E4=BA=8E=E5=86=85=E6=A0=B8=E4=B8=8D=E8=83=BD=E4=BF=AE=E6=94=
=B9=E8=AE=A1=E6=95=B0=E5=99=A8=EF=BC=8C=E6=89=80=E4=BB=A5=E4=BC=9A=E6=9C=89=
=E4=B8=80=E4=B8=AASBI=E6=9D=A5=E6=94=AF=E6=8C=81=E8=BF=99=E4=B8=AA=E5=8A=9F=
=E8=83=BD[1]=E3=80=82 =E5=8F=A6=E5=A4=96=EF=BC=8C=E4=B8=80=E4=BA=9B=E5=8E=
=82=E5=95=86
> -  =E8=80=83=E8=99=91=E5=AE=9E=E7=8E=B0M-S-U=E5=9E=8B=E5=8F=B7=E6=9C=BA=
=E5=99=A8=E7=9A=84=E7=A1=AC=E4=BB=B6=E6=89=A9=E5=B1=95=E6=9D=A5=E7=9B=B4=E6=
=8E=A5=E5=86=99=E5=85=A5=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82
> -
> -=E8=BF=99=E7=AF=87=E6=96=87=E6=A1=A3=E6=97=A8=E5=9C=A8=E4=B8=BA=E5=BC=80=
=E5=8F=91=E8=80=85=E6=8F=90=E4=BE=9B=E4=B8=80=E4=B8=AA=E5=9C=A8=E5=86=85=E6=
=A0=B8=E4=B8=AD=E6=94=AF=E6=8C=81PMU=E7=9A=84=E7=AE=80=E8=A6=81=E6=8C=87=E5=
=8D=97=E3=80=82=E4=B8=8B=E9=9D=A2=E7=9A=84=E7=AB=A0=E8=8A=82=E7=AE=80=E8=A6=
=81=E8=A7=A3=E9=87=8A=E4=BA=86
> -perf' =E6=9C=BA=E5=88=B6=E5=92=8C=E5=BE=85=E5=8A=9E=E4=BA=8B=E9=A1=B9=E3=
=80=82
> -
> -=E4=BD=A0=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=BF=99=E9=87=8C=E6=9F=A5=E7=9C=8B=
=E4=BB=A5=E5=89=8D=E7=9A=84=E8=AE=A8=E8=AE=BA[1][2]=E3=80=82 =E5=8F=A6=E5=
=A4=96=EF=BC=8C=E6=9F=A5=E7=9C=8B=E9=99=84=E5=BD=95=E4=B8=AD=E7=9A=84=E7=9B=
=B8=E5=85=B3=E5=86=85=E6=A0=B8=E7=BB=93=E6=9E=84=E4=BD=93=E5=8F=AF=E8=83=BD=
=E4=BC=9A=E6=9C=89
> -=E5=B8=AE=E5=8A=A9=E3=80=82
> -
> -
> -1. =E5=88=9D=E5=A7=8B=E5=8C=96
> ----------
> -
> -*riscv_pmu* =E6=98=AF=E4=B8=80=E4=B8=AA=E7=B1=BB=E5=9E=8B=E4=B8=BA *stru=
ct riscv_pmu* =E7=9A=84=E5=85=A8=E5=B1=80=E6=8C=87=E9=92=88=EF=BC=8C=E5=AE=
=83=E5=8C=85=E5=90=AB=E4=BA=86=E6=A0=B9=E6=8D=AEperf=E5=86=85=E9=83=A8
> -=E7=BA=A6=E5=AE=9A=E7=9A=84=E5=90=84=E7=A7=8D=E6=96=B9=E6=B3=95=E5=92=8C=
PMU-specific=E5=8F=82=E6=95=B0=E3=80=82=E4=BA=BA=E4=BB=AC=E5=BA=94=E8=AF=A5=
=E5=A3=B0=E6=98=8E=E8=BF=99=E6=A0=B7=E7=9A=84=E5=AE=9E=E4=BE=8B=E6=9D=A5=E4=
=BB=A3=E8=A1=A8PMU=E3=80=82 =E9=BB=98=E8=AE=A4=E6=83=85=E5=86=B5
> -=E4=B8=8B=EF=BC=8C *riscv_pmu* =E6=8C=87=E5=90=91=E4=B8=80=E4=B8=AA=E5=
=B8=B8=E9=87=8F=E7=BB=93=E6=9E=84=E4=BD=93 *riscv_base_pmu* =EF=BC=8C=E5=AE=
=83=E5=AF=B9=E5=9F=BA=E5=87=86QEMU=E6=A8=A1=E5=9E=8B=E6=9C=89=E9=9D=9E=E5=
=B8=B8
> -=E5=9F=BA=E7=A1=80=E7=9A=84=E6=94=AF=E6=8C=81=E3=80=82
> -
> -
> -=E7=84=B6=E5=90=8E=E4=BB=96/=E5=A5=B9=E5=8F=AF=E4=BB=A5=E5=B0=86=E5=AE=
=9E=E4=BE=8B=E7=9A=84=E6=8C=87=E9=92=88=E5=88=86=E9=85=8D=E7=BB=99 *riscv_p=
mu* =EF=BC=8C=E8=BF=99=E6=A0=B7=E5=B0=B1=E5=8F=AF=E4=BB=A5=E5=88=A9=E7=94=
=A8=E5=B7=B2=E7=BB=8F=E5=AE=9E=E7=8E=B0=E7=9A=84=E6=9C=80=E5=B0=8F=E9=80=BB
> -=E8=BE=91=EF=BC=8C=E6=88=96=E8=80=85=E5=88=9B=E5=BB=BA=E4=BB=96/=E5=A5=
=B9=E8=87=AA=E5=B7=B1=E7=9A=84 *riscv_init_platform_pmu* =E5=AE=9E=E7=8E=B0=
=E3=80=82
> -
> -=E6=8D=A2=E5=8F=A5=E8=AF=9D=E8=AF=B4=EF=BC=8C=E7=8E=B0=E6=9C=89=E7=9A=84=
 *riscv_base_pmu* =E6=BA=90=E5=8F=AA=E6=98=AF=E6=8F=90=E4=BE=9B=E4=BA=86=E4=
=B8=80=E4=B8=AA=E5=8F=82=E8=80=83=E5=AE=9E=E7=8E=B0=E3=80=82 =E5=BC=80=E5=
=8F=91=E8=80=85=E5=8F=AF=E4=BB=A5=E7=81=B5=E6=B4=BB=E5=9C=B0
> -=E5=86=B3=E5=AE=9A=E5=A4=9A=E5=B0=91=E9=83=A8=E5=88=86=E5=8F=AF=E7=94=A8=
=EF=BC=8C=E5=9C=A8=E6=9C=80=E6=9E=81=E7=AB=AF=E7=9A=84=E6=83=85=E5=86=B5=E4=
=B8=8B=EF=BC=8C=E4=BB=96=E4=BB=AC=E5=8F=AF=E4=BB=A5=E6=A0=B9=E6=8D=AE=E8=87=
=AA=E5=B7=B1=E7=9A=84=E9=9C=80=E8=A6=81=E5=AE=9A=E5=88=B6=E6=AF=8F=E4=B8=80=
=E4=B8=AA=E5=87=BD=E6=95=B0=E3=80=82
> -
> -
> -2. Event Initialization
> ------------------------
> -
> -=E5=BD=93=E7=94=A8=E6=88=B7=E5=90=AF=E5=8A=A8perf=E5=91=BD=E4=BB=A4=E6=
=9D=A5=E7=9B=91=E6=8E=A7=E4=B8=80=E4=BA=9B=E4=BA=8B=E4=BB=B6=E6=97=B6=EF=BC=
=8C=E9=A6=96=E5=85=88=E4=BC=9A=E8=A2=AB=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=
=E7=9A=84perf=E5=B7=A5=E5=85=B7=E8=A7=A3=E9=87=8A=E4=B8=BA=E5=A4=9A=E4=B8=AA
> -*perf_event_open* =E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8=EF=BC=8C=E7=84=B6=
=E5=90=8E=E8=BF=9B=E4=B8=80=E6=AD=A5=E8=B0=83=E7=94=A8=E4=B8=8A=E4=B8=80=E6=
=AD=A5=E5=88=86=E9=85=8D=E7=9A=84 *event_init* =E6=88=90=E5=91=98=E5=87=BD=
=E6=95=B0
> -=E7=9A=84=E4=B8=BB=E4=BD=93=E3=80=82 =E5=9C=A8 *riscv_base_pmu* =E7=9A=
=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E5=B0=B1=E6=98=AF *riscv_event_init=
* =E3=80=82
> -
> -=E8=AF=A5=E5=8A=9F=E8=83=BD=E7=9A=84=E4=B8=BB=E8=A6=81=E7=9B=AE=E7=9A=84=
=E6=98=AF=E5=B0=86=E7=94=A8=E6=88=B7=E6=8F=90=E4=BE=9B=E7=9A=84=E4=BA=8B=E4=
=BB=B6=E7=BF=BB=E8=AF=91=E6=88=90=E6=98=A0=E5=B0=84=E5=9B=BE=EF=BC=8C=E4=BB=
=8E=E8=80=8C=E5=8F=AF=E4=BB=A5=E7=9B=B4=E6=8E=A5=E5=AF=B9HW-related=E7=9A=
=84=E6=8E=A7
> -=E5=88=B6=E5=AF=84=E5=AD=98=E5=99=A8=E6=88=96=E8=AE=A1=E6=95=B0=E5=99=A8=
=E8=BF=9B=E8=A1=8C=E6=93=8D=E4=BD=9C=E3=80=82=E8=AF=A5=E7=BF=BB=E8=AF=91=E5=
=9F=BA=E4=BA=8E *riscv_pmu* =E4=B8=AD=E6=8F=90=E4=BE=9B=E7=9A=84=E6=98=A0=
=E5=B0=84=E5=92=8C=E6=96=B9=E6=B3=95=E3=80=82
> -
> -=E6=B3=A8=E6=84=8F=EF=BC=8C=E6=9C=89=E4=BA=9B=E5=8A=9F=E8=83=BD=E4=B9=9F=
=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=BF=99=E4=B8=AA=E9=98=B6=E6=AE=B5=E5=AE=8C=E6=
=88=90:
> -
> -(1) =E4=B8=AD=E6=96=AD=E8=AE=BE=E7=BD=AE=EF=BC=8C=E8=BF=99=E4=B8=AA=E5=
=9C=A8=E4=B8=8B=E4=B8=80=E8=8A=82=E8=AF=B4=EF=BC=9B
> -(2) =E7=89=B9=E9=99=90=E7=BA=A7=E8=AE=BE=E7=BD=AE(=E4=BB=85=E7=94=A8=E6=
=88=B7=E7=A9=BA=E9=97=B4=E3=80=81=E4=BB=85=E5=86=85=E6=A0=B8=E7=A9=BA=E9=97=
=B4=E3=80=81=E4=B8=A4=E8=80=85=E9=83=BD=E6=9C=89)=EF=BC=9B
> -(3) =E6=9E=90=E6=9E=84=E5=87=BD=E6=95=B0=E8=AE=BE=E7=BD=AE=E3=80=82 =E9=
=80=9A=E5=B8=B8=E5=BA=94=E7=94=A8 *riscv_destroy_event* =E5=8D=B3=E5=8F=AF=
=EF=BC=9B
> -(4) =E5=AF=B9=E9=9D=9E=E9=87=87=E6=A0=B7=E4=BA=8B=E4=BB=B6=E7=9A=84=E8=
=B0=83=E6=95=B4=EF=BC=8C=E8=BF=99=E5=B0=86=E8=A2=AB=E5=87=BD=E6=95=B0=E5=BA=
=94=E7=94=A8=EF=BC=8C=E5=A6=82 *perf_adjust_period* =EF=BC=8C=E9=80=9A=E5=
=B8=B8=E5=A6=82=E4=B8=8B::
> -
> -      if (!is_sampling_event(event)) {
> -              hwc->sample_period =3D x86_pmu.max_period;
> -              hwc->last_period =3D hwc->sample_period;
> -              local64_set(&hwc->period_left, hwc->sample_period);
> -      }
> -
> -
> -=E5=9C=A8 *riscv_base_pmu* =E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=
=E7=9B=AE=E5=89=8D=E5=8F=AA=E6=8F=90=E4=BE=9B=E4=BA=86=EF=BC=883=EF=BC=89=
=E3=80=82
> -
> -
> -3. =E4=B8=AD=E6=96=AD
> --------
> -
> -3.1. =E4=B8=AD=E6=96=AD=E5=88=9D=E5=A7=8B=E5=8C=96
> -
> -=E8=BF=99=E7=A7=8D=E6=83=85=E5=86=B5=E7=BB=8F=E5=B8=B8=E5=87=BA=E7=8E=B0=
=E5=9C=A8 *event_init* =E6=96=B9=E6=A1=88=E7=9A=84=E5=BC=80=E5=A4=B4=E3=80=
=82=E9=80=9A=E5=B8=B8=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E8=BF=99=E5=BA=94=
=E8=AF=A5=E6=98=AF=E4=B8=80=E4=B8=AA=E4=BB=A3=E7=A0=81=E6=AE=B5=EF=BC=8C=E5=
=A6=82::
> -
> -  int x86_reserve_hardware(void)
> -  {
> -        int err =3D 0;
> -
> -        if (!atomic_inc_not_zero(&pmc_refcount)) {
> -                mutex_lock(&pmc_reserve_mutex);
> -                if (atomic_read(&pmc_refcount) =3D=3D 0) {
> -                        if (!reserve_pmc_hardware())
> -                                err =3D -EBUSY;
> -                        else
> -                                reserve_ds_buffers();
> -                }
> -                if (!err)
> -                        atomic_inc(&pmc_refcount);
> -                mutex_unlock(&pmc_reserve_mutex);
> -        }
> -
> -        return err;
> -  }
> -
> -=E8=80=8C=E7=A5=9E=E5=A5=87=E7=9A=84=E6=98=AF *reserve_pmc_hardware* =EF=
=BC=8C=E5=AE=83=E9=80=9A=E5=B8=B8=E5=81=9A=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=
=9C=EF=BC=8C=E4=BD=BF=E5=AE=9E=E7=8E=B0=E7=9A=84IRQ=E5=8F=AF=E4=BB=A5=E4=BB=
=8E=E6=9F=90=E4=B8=AA=E5=85=A8=E5=B1=80=E5=87=BD
> -=E6=95=B0=E6=8C=87=E9=92=88=E8=AE=BF=E9=97=AE=E3=80=82 =E8=80=8C *releas=
e_pmc_hardware* =E7=9A=84=E4=BD=9C=E7=94=A8=E6=AD=A3=E5=A5=BD=E7=9B=B8=E5=
=8F=8D=EF=BC=8C=E5=AE=83=E7=94=A8=E5=9C=A8=E4=B8=8A=E4=B8=80=E8=8A=82=E6=8F=
=90=E5=88=B0=E7=9A=84=E4=BA=8B=E4=BB=B6=E5=88=86=E9=85=8D
> -=E5=99=A8=E4=B8=AD=E3=80=82
> -
> - (=E6=B3=A8=EF=BC=9A=E4=BB=8E=E6=89=80=E6=9C=89=E6=9E=B6=E6=9E=84=E7=9A=
=84=E5=AE=9E=E7=8E=B0=E6=9D=A5=E7=9C=8B=EF=BC=8C*reserve/release* =E5=AF=B9=
=E6=80=BB=E6=98=AFIRQ=E8=AE=BE=E7=BD=AE=EF=BC=8C=E6=89=80=E4=BB=A5 *pmc_har=
dware*
> - =E4=BC=BC=E4=B9=8E=E6=9C=89=E4=BA=9B=E8=AF=AF=E5=AF=BC=E3=80=82 =E5=AE=
=83=E5=B9=B6=E4=B8=8D=E5=A4=84=E7=90=86=E4=BA=8B=E4=BB=B6=E5=92=8C=E7=89=A9=
=E7=90=86=E8=AE=A1=E6=95=B0=E5=99=A8=E4=B9=8B=E9=97=B4=E7=9A=84=E7=BB=91=E5=
=AE=9A=EF=BC=8C=E8=BF=99=E4=B8=80=E7=82=B9=E5=B0=86=E5=9C=A8=E4=B8=8B=E4=B8=
=80=E8=8A=82=E4=BB=8B=E7=BB=8D=E3=80=82)
> -
> -3.2. IRQ=E7=BB=93=E6=9E=84=E4=BD=93
> -
> -=E5=9F=BA=E6=9C=AC=E4=B8=8A=EF=BC=8C=E4=B8=80=E4=B8=AAIRQ=E8=BF=90=E8=A1=
=8C=E4=BB=A5=E4=B8=8B=E4=BC=AA=E4=BB=A3=E7=A0=81::
> -
> -  for each hardware counter that triggered this overflow
> -
> -      get the event of this counter
> -
> -      // following two steps are defined as *read()*,
> -      // check the section Reading/Writing Counters for details.
> -      count the delta value since previous interrupt
> -      update the event->count (# event occurs) by adding delta, and
> -                 event->hw.period_left by subtracting delta
> -
> -      if the event overflows
> -          sample data
> -          set the counter appropriately for the next overflow
> -
> -          if the event overflows again
> -              too frequently, throttle this event
> -          fi
> -      fi
> -
> -  end for
> -
> - =E7=84=B6=E8=80=8C=E6=88=AA=E8=87=B3=E7=9B=AE=E5=89=8D=EF=BC=8C=E6=B2=
=A1=E6=9C=89=E4=B8=80=E4=B8=AARISC-V=E7=9A=84=E5=AE=9E=E7=8E=B0=E4=B8=BAper=
f=E8=AE=BE=E8=AE=A1=E4=BA=86=E4=B8=AD=E6=96=AD=EF=BC=8C=E6=89=80=E4=BB=A5=
=E5=85=B7=E4=BD=93=E7=9A=84=E5=AE=9E=E7=8E=B0=E8=A6=81=E5=9C=A8=E6=9C=AA=E6=
=9D=A5=E5=AE=8C=E6=88=90=E3=80=82
> -
> -4. Reading/Writing =E8=AE=A1=E6=95=B0
> ------------------------
> -
> -=E5=AE=83=E4=BB=AC=E7=9C=8B=E4=BC=BC=E5=B7=AE=E4=B8=8D=E5=A4=9A=EF=BC=8C=
=E4=BD=86perf=E5=AF=B9=E5=BE=85=E5=AE=83=E4=BB=AC=E7=9A=84=E6=80=81=E5=BA=
=A6=E5=8D=B4=E6=88=AA=E7=84=B6=E4=B8=8D=E5=90=8C=E3=80=82 =E5=AF=B9=E4=BA=
=8E=E8=AF=BB=EF=BC=8C=E5=9C=A8 *struct pmu* =E4=B8=AD=E6=9C=89=E4=B8=80=E4=
=B8=AA
> -*read* =E6=8E=A5=E5=8F=A3=EF=BC=8C=E4=BD=86=E5=AE=83=E7=9A=84=E4=BD=9C=
=E7=94=A8=E4=B8=8D=E4=BB=85=E4=BB=85=E6=98=AF=E8=AF=BB=E3=80=82 =E6=A0=B9=
=E6=8D=AE=E4=B8=8A=E4=B8=8B=E6=96=87=EF=BC=8C*read* =E5=87=BD=E6=95=B0=E4=
=B8=8D=E4=BB=85=E8=A6=81=E8=AF=BB=E5=8F=96=E8=AE=A1=E6=95=B0=E5=99=A8=E7=9A=
=84=E5=86=85=E5=AE=B9
> -=EF=BC=88event->count=EF=BC=89=EF=BC=8C=E8=BF=98=E8=A6=81=E6=9B=B4=E6=96=
=B0=E5=B7=A6=E5=91=A8=E6=9C=9F=E5=88=B0=E4=B8=8B=E4=B8=80=E4=B8=AA=E4=B8=AD=
=E6=96=AD=EF=BC=88event->hw.period_left=EF=BC=89=E3=80=82
> -
> - =E4=BD=86 perf =E7=9A=84=E6=A0=B8=E5=BF=83=E4=B8=8D=E9=9C=80=E8=A6=81=
=E7=9B=B4=E6=8E=A5=E5=86=99=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82 =E5=86=99=
=E8=AE=A1=E6=95=B0=E5=99=A8=E9=9A=90=E8=97=8F=E5=9C=A8=E4=BB=A5=E4=B8=8B=E4=
=B8=A4=E7=82=B9=E7=9A=84=E6=8A=BD=E8=B1=A1=E5=8C=96=E4=B9=8B=E5=90=8E=EF=BC=
=8C
> - 1=EF=BC=89 *pmu->start* =EF=BC=8C=E4=BB=8E=E5=AD=97=E9=9D=A2=E4=B8=8A=
=E7=9C=8B=E5=B0=B1=E6=98=AF=E5=BC=80=E5=A7=8B=E8=AE=A1=E6=95=B0=EF=BC=8C=E6=
=89=80=E4=BB=A5=E5=BF=85=E9=A1=BB=E6=8A=8A=E8=AE=A1=E6=95=B0=E5=99=A8=E8=AE=
=BE=E7=BD=AE=E6=88=90=E4=B8=80=E4=B8=AA=E5=90=88=E9=80=82=E7=9A=84=E5=80=BC=
=EF=BC=8C=E4=BB=A5
> - =E4=BE=BF=E4=B8=8B=E4=B8=80=E6=AC=A1=E4=B8=AD=E6=96=AD=EF=BC=9B
> - 2=EF=BC=89=E5=9C=A8IRQ=E9=87=8C=E9=9D=A2=EF=BC=8C=E5=BA=94=E8=AF=A5=E6=
=8A=8A=E8=AE=A1=E6=95=B0=E5=99=A8=E8=AE=BE=E7=BD=AE=E6=88=90=E5=90=8C=E6=A0=
=B7=E7=9A=84=E5=90=88=E7=90=86=E5=80=BC=E3=80=82
> -
> -=E5=9C=A8RISC-V=E4=B8=AD=EF=BC=8C=E8=AF=BB=E6=93=8D=E4=BD=9C=E4=B8=8D=E6=
=98=AF=E9=97=AE=E9=A2=98=EF=BC=8C=E4=BD=86=E5=86=99=E6=93=8D=E4=BD=9C=E5=B0=
=B1=E9=9C=80=E8=A6=81=E8=B4=B9=E4=BA=9B=E5=8A=9B=E6=B0=94=E4=BA=86=EF=BC=8C=
=E5=9B=A0=E4=B8=BAS=E6=A8=A1=E5=BC=8F=E4=B8=8D=E5=85=81=E8=AE=B8=E5=86=99=
=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82
> -
> -
> -5. add()/del()/start()/stop()
> ------------------------------
> -
> -=E5=9F=BA=E6=9C=AC=E6=80=9D=E6=83=B3: add()/del() =E5=90=91PMU=E6=B7=BB=
=E5=8A=A0/=E5=88=A0=E9=99=A4=E4=BA=8B=E4=BB=B6=EF=BC=8Cstart()/stop() =E5=
=90=AF=E5=8A=A8/=E5=81=9C=E6=AD=A2PMU=E4=B8=AD=E6=9F=90=E4=B8=AA=E4=BA=8B=
=E4=BB=B6
> -=E7=9A=84=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82 =E6=89=80=E6=9C=89=E8=BF=
=99=E4=BA=9B=E5=87=BD=E6=95=B0=E9=83=BD=E4=BD=BF=E7=94=A8=E7=9B=B8=E5=90=8C=
=E7=9A=84=E5=8F=82=E6=95=B0: *struct perf_event *event* =E5=92=8C *int flag=
* =E3=80=82
> -
> -=E6=8A=8A perf =E7=9C=8B=E4=BD=9C=E4=B8=80=E4=B8=AA=E7=8A=B6=E6=80=81=E6=
=9C=BA=EF=BC=8C=E9=82=A3=E4=B9=88=E4=BD=A0=E4=BC=9A=E5=8F=91=E7=8E=B0=E8=BF=
=99=E4=BA=9B=E5=87=BD=E6=95=B0=E4=BD=9C=E4=B8=BA=E8=BF=99=E4=BA=9B=E7=8A=B6=
=E6=80=81=E4=B9=8B=E9=97=B4=E7=9A=84=E7=8A=B6=E6=80=81=E8=BD=AC=E6=8D=A2=E8=
=BF=87=E7=A8=8B=E3=80=82
> -=E5=AE=9A=E4=B9=89=E4=BA=86=E4=B8=89=E7=A7=8D=E7=8A=B6=E6=80=81=EF=BC=88=
event->hw.state=EF=BC=89:
> -
> -* PERF_HES_STOPPED:	=E8=AE=A1=E6=95=B0=E5=81=9C=E6=AD=A2
> -* PERF_HES_UPTODATE:	event->count=E6=98=AF=E6=9C=80=E6=96=B0=E7=9A=84
> -* PERF_HES_ARCH:	=E4=BE=9D=E8=B5=96=E4=BA=8E=E4=BD=93=E7=B3=BB=E7=BB=93=
=E6=9E=84=E7=9A=84=E7=94=A8=E6=B3=95=EF=BC=8C=E3=80=82=E3=80=82=E3=80=82=E6=
=88=91=E4=BB=AC=E7=8E=B0=E5=9C=A8=E5=B9=B6=E4=B8=8D=E9=9C=80=E8=A6=81=E5=AE=
=83=E3=80=82
> -
> -=E8=BF=99=E4=BA=9B=E7=8A=B6=E6=80=81=E8=BD=AC=E6=8D=A2=E7=9A=84=E6=AD=A3=
=E5=B8=B8=E6=B5=81=E7=A8=8B=E5=A6=82=E4=B8=8B:
> -
> -* =E7=94=A8=E6=88=B7=E5=90=AF=E5=8A=A8=E4=B8=80=E4=B8=AA perf =E4=BA=8B=
=E4=BB=B6=EF=BC=8C=E5=AF=BC=E8=87=B4=E8=B0=83=E7=94=A8 *event_init* =E3=80=
=82
> -* =E5=BD=93=E8=A2=AB=E4=B8=8A=E4=B8=8B=E6=96=87=E5=88=87=E6=8D=A2=E8=BF=
=9B=E6=9D=A5=E7=9A=84=E6=97=B6=E5=80=99=EF=BC=8C*add* =E4=BC=9A=E8=A2=AB pe=
rf core =E8=B0=83=E7=94=A8=EF=BC=8C=E5=B9=B6=E5=B8=A6=E6=9C=89=E4=B8=80=E4=
=B8=AA=E6=A0=87=E5=BF=97 PERF_EF_START=EF=BC=8C
> -  =E4=B9=9F=E5=B0=B1=E6=98=AF=E8=AF=B4=E4=BA=8B=E4=BB=B6=E8=A2=AB=E6=B7=
=BB=E5=8A=A0=E5=90=8E=E5=BA=94=E8=AF=A5=E8=A2=AB=E5=90=AF=E5=8A=A8=E3=80=82=
 =E5=9C=A8=E8=BF=99=E4=B8=AA=E9=98=B6=E6=AE=B5=EF=BC=8C=E5=A6=82=E6=9E=9C=
=E6=9C=89=E7=9A=84=E8=AF=9D=EF=BC=8C=E4=B8=80=E8=88=AC=E4=BA=8B=E4=BB=B6=E4=
=BC=9A=E8=A2=AB=E7=BB=91=E5=AE=9A=E5=88=B0=E4=B8=80=E4=B8=AA=E7=89=A9
> -  =E7=90=86=E8=AE=A1=E6=95=B0=E5=99=A8=E4=B8=8A=E3=80=82=E5=BD=93=E7=8A=
=B6=E6=80=81=E5=8F=98=E4=B8=BAPERF_HES_STOPPED=E5=92=8CPERF_HES_UPTODATE=EF=
=BC=8C=E5=9B=A0=E4=B8=BA=E7=8E=B0=E5=9C=A8=E5=B7=B2=E7=BB=8F=E5=81=9C=E6=AD=
=A2=E4=BA=86,
> -  =EF=BC=88=E8=BD=AF=E4=BB=B6=EF=BC=89=E4=BA=8B=E4=BB=B6=E8=AE=A1=E6=95=
=B0=E4=B8=8D=E9=9C=80=E8=A6=81=E6=9B=B4=E6=96=B0=E3=80=82
> -
> -  - =E7=84=B6=E5=90=8E=E8=B0=83=E7=94=A8 *start* =EF=BC=8C=E5=B9=B6=E5=
=90=AF=E7=94=A8=E8=AE=A1=E6=95=B0=E5=99=A8=E3=80=82
> -    =E9=80=9A=E8=BF=87PERF_EF_RELOAD=E6=A0=87=E5=BF=97=EF=BC=8C=E5=AE=83=
=E5=90=91=E8=AE=A1=E6=95=B0=E5=99=A8=E5=86=99=E5=85=A5=E4=B8=80=E4=B8=AA=E9=
=80=82=E5=BD=93=E7=9A=84=E5=80=BC=EF=BC=88=E8=AF=A6=E7=BB=86=E6=83=85=E5=86=
=B5=E8=AF=B7=E5=8F=82=E8=80=83=E4=B8=8A=E4=B8=80=E8=8A=82=EF=BC=89=E3=80=82
> -    =E5=A6=82=E6=9E=9C=E6=A0=87=E5=BF=97=E4=B8=8D=E5=8C=85=E5=90=ABPERF_=
EF_RELOAD=EF=BC=8C=E5=88=99=E4=B8=8D=E4=BC=9A=E5=86=99=E5=85=A5=E4=BB=BB=E4=
=BD=95=E5=86=85=E5=AE=B9=E3=80=82
> -    =E7=8E=B0=E5=9C=A8=E7=8A=B6=E6=80=81=E8=A2=AB=E9=87=8D=E7=BD=AE=E4=
=B8=BAnone=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=AE=83=E6=97=A2=E6=B2=A1=E6=9C=89=
=E5=81=9C=E6=AD=A2=E4=B9=9F=E6=B2=A1=E6=9C=89=E6=9B=B4=E6=96=B0=EF=BC=88=E8=
=AE=A1=E6=95=B0=E5=B7=B2=E7=BB=8F=E5=BC=80=E5=A7=8B=EF=BC=89=E3=80=82
> -
> -*=E5=BD=93=E8=A2=AB=E4=B8=8A=E4=B8=8B=E6=96=87=E5=88=87=E6=8D=A2=E5=87=
=BA=E6=9D=A5=E6=97=B6=E8=A2=AB=E8=B0=83=E7=94=A8=E3=80=82 =E7=84=B6=E5=90=
=8E=EF=BC=8C=E5=AE=83=E6=A3=80=E6=9F=A5=E5=87=BAPMU=E4=B8=AD=E7=9A=84=E6=89=
=80=E6=9C=89=E4=BA=8B=E4=BB=B6=EF=BC=8C=E5=B9=B6=E8=B0=83=E7=94=A8 *stop* =
=E6=9D=A5=E6=9B=B4=E6=96=B0=E5=AE=83=E4=BB=AC
> - =E7=9A=84=E8=AE=A1=E6=95=B0=E3=80=82
> -
> -  - *stop* =E8=A2=AB *del* =E5=92=8Cperf=E6=A0=B8=E5=BF=83=E8=B0=83=E7=
=94=A8=EF=BC=8C=E6=A0=87=E5=BF=97=E4=B8=BAPERF_EF_UPDATE=EF=BC=8C=E5=AE=83=
=E7=BB=8F=E5=B8=B8=E4=BB=A5=E7=9B=B8=E5=90=8C=E7=9A=84=E9=80=BB=E8=BE=91=E5=
=92=8C *read*
> -    =E5=85=B1=E7=94=A8=E5=90=8C=E4=B8=80=E4=B8=AA=E5=AD=90=E7=A8=8B=E5=
=BA=8F=E3=80=82
> -    =E7=8A=B6=E6=80=81=E5=8F=88=E4=B8=80=E6=AC=A1=E5=8F=98=E4=B8=BAPERF_=
HES_STOPPED=E5=92=8CPERF_HES_UPTODATE=E3=80=82
> -
> -  - =E8=BF=99=E4=B8=A4=E5=AF=B9=E7=A8=8B=E5=BA=8F=E7=9A=84=E7=94=9F=E5=
=91=BD=E5=91=A8=E6=9C=9F: *add* =E5=92=8C *del* =E5=9C=A8=E4=BB=BB=E5=8A=A1=
=E5=88=87=E6=8D=A2=E6=97=B6=E8=A2=AB=E5=8F=8D=E5=A4=8D=E8=B0=83=E7=94=A8=EF=
=BC=9B*start* =E5=92=8C *stop* =E5=9C=A8
> -    perf=E6=A0=B8=E5=BF=83=E9=9C=80=E8=A6=81=E5=BF=AB=E9=80=9F=E5=81=9C=
=E6=AD=A2=E5=92=8C=E5=90=AF=E5=8A=A8=E6=97=B6=E4=B9=9F=E4=BC=9A=E8=A2=AB=E8=
=B0=83=E7=94=A8=EF=BC=8C=E6=AF=94=E5=A6=82=E5=9C=A8=E8=B0=83=E6=95=B4=E4=B8=
=AD=E6=96=AD=E5=91=A8=E6=9C=9F=E6=97=B6=E3=80=82
> -
> -=E7=9B=AE=E5=89=8D=E7=9A=84=E5=AE=9E=E7=8E=B0=E5=B7=B2=E7=BB=8F=E8=B6=B3=
=E5=A4=9F=E4=BA=86=EF=BC=8C=E5=B0=86=E6=9D=A5=E5=8F=AF=E4=BB=A5=E5=BE=88=E5=
=AE=B9=E6=98=93=E5=9C=B0=E6=89=A9=E5=B1=95=E5=88=B0=E5=8A=9F=E8=83=BD=E3=80=
=82
> -
> -A. =E7=9B=B8=E5=85=B3=E7=BB=93=E6=9E=84=E4=BD=93
> --------------
> -
> -* struct pmu: include/linux/perf_event.h
> -* struct riscv_pmu: arch/riscv/include/asm/perf_event.h
> -
> -  =E4=B8=A4=E4=B8=AA=E7=BB=93=E6=9E=84=E4=BD=93=E9=83=BD=E8=A2=AB=E8=AE=
=BE=E8=AE=A1=E4=B8=BA=E5=8F=AA=E8=AF=BB=E3=80=82
> -
> -  *struct pmu* =E5=AE=9A=E4=B9=89=E4=BA=86=E4=B8=80=E4=BA=9B=E5=87=BD=E6=
=95=B0=E6=8C=87=E9=92=88=E6=8E=A5=E5=8F=A3=EF=BC=8C=E5=AE=83=E4=BB=AC=E5=A4=
=A7=E5=A4=9A=E4=BB=A5 *struct perf_event* =E4=BD=9C=E4=B8=BA=E4=B8=BB=E5=8F=
=82=E6=95=B0=EF=BC=8C=E6=A0=B9=E6=8D=AE
> -  perf=E7=9A=84=E5=86=85=E9=83=A8=E7=8A=B6=E6=80=81=E6=9C=BA=E5=A4=84=E7=
=90=86perf=E4=BA=8B=E4=BB=B6=EF=BC=88=E8=AF=A6=E6=83=85=E8=AF=B7=E6=9F=A5=
=E7=9C=8Bkernel/events/core.c=EF=BC=89=E3=80=82
> -
> -  *struct riscv_pmu* =E5=AE=9A=E4=B9=89=E4=BA=86PMU=E7=9A=84=E5=85=B7=E4=
=BD=93=E5=8F=82=E6=95=B0=E3=80=82 =E5=91=BD=E5=90=8D=E9=81=B5=E5=BE=AA=E6=
=89=80=E6=9C=89=E5=85=B6=E5=AE=83=E6=9E=B6=E6=9E=84=E7=9A=84=E6=83=AF=E4=BE=
=8B=E3=80=82
> -
> -* struct perf_event: include/linux/perf_event.h
> -* struct hw_perf_event
> -
> -  =E8=A1=A8=E7=A4=BA perf =E4=BA=8B=E4=BB=B6=E7=9A=84=E9=80=9A=E7=94=A8=
=E7=BB=93=E6=9E=84=E4=BD=93=EF=BC=8C=E4=BB=A5=E5=8F=8A=E7=A1=AC=E4=BB=B6=E7=
=9B=B8=E5=85=B3=E7=9A=84=E7=BB=86=E8=8A=82=E3=80=82
> -
> -* struct riscv_hw_events: arch/riscv/include/asm/perf_event.h
> -
> -  =E4=BF=9D=E5=AD=98=E4=BA=8B=E4=BB=B6=E7=8A=B6=E6=80=81=E7=9A=84=E7=BB=
=93=E6=9E=84=E6=9C=89=E4=B8=A4=E4=B8=AA=E5=9B=BA=E5=AE=9A=E6=88=90=E5=91=98=
=E3=80=82
> -  =E4=BA=8B=E4=BB=B6=E7=9A=84=E6=95=B0=E9=87=8F=E5=92=8C=E4=BA=8B=E4=BB=
=B6=E7=9A=84=E6=95=B0=E7=BB=84=E3=80=82
> -
> -=E5=8F=82=E8=80=83=E6=96=87=E7=8C=AE
> ---------
> -
> -[1] https://github.com/riscv/riscv-linux/pull/124
> -
> -[2] https://groups.google.com/a/groups.riscv.org/forum/#!topic/sw-dev/f1=
9TmCNP6yA
> --=20
> 2.20.1

--YuecJCHJLWANY2WV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmKgy80ACgkQtlsoEiKC
sIWA8AwA2vz0gQiZ79WkljCdhXtuJcnOfy+BFUr2EZ87jirsOqAA8b2a+ZRTQp23
nXMvF2qEfJL4pnXEIbhd+iy8C9xxkIpkD3buJQDbbL1w6wuVqwCfnbD/E+3fjZsL
9r2XYh5YzQlNr7o78NQNDEO/JyvJclT1a6xE/zva6xeDwftwNb9FlM9K6hMsQoOk
yNzxbPwbipSuoZ/VL+ecVRsjuHn1Bfnq1BEH38v0gd+9g0+CmmEFyuxINFsyV8oG
i3kgyEcCV8MPr7unhbQNKJjPN+qH6qHYZvufGX/wkIVrvkUrP07Ov+FqSmiopPyB
C9v1SV8lF3my+FXlW7Dl5Zx2gkFYSzySdTPqyF1Fw+TBshQ9ErWlX0Yx7aYl6sTb
S1V9qmKjC0DndOMnsyGjVQFa2Dw/i36ABayAe/ivsCPnl1U5pGHUw0DQ3ZHd5WQ1
tAhnr4o+eQyzdjomP/oHs9PUkJcvyZKFASAHdWuiESxitWZKJWAx5R9WxxpnPe32
tx8L5Znt
=LN9B
-----END PGP SIGNATURE-----

--YuecJCHJLWANY2WV--

