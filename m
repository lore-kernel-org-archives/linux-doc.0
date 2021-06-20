Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6AAC49361
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 04:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACB94611BD
	for <linux-doc@archiver.kernel.org>; Sun, 20 Jun 2021 04:33:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbhFTEfb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Jun 2021 00:35:31 -0400
Received: from m32-153.88.com ([43.250.32.153]:59309 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229482AbhFTEfa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 20 Jun 2021 00:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=rXK5X2DEZExCAUqp0xv20o9wWi1llycg1p5jr
        fueEUw=; b=CzPCs/Imp7eTsTH+8nzLXeLDs6xH2gIEz+nLRZrbPW21YartZj60A
        1K2/RQGLpvYTC2fCjSw6Z3EeKBcBccVxyMIQcnvz9DDnHZ4+zPlS8MnYoW4rdnb5
        QoabESmYXhJvG0miYRIqrj+dSIS44vD2Lr3GICmexgRGDgZnt7z7QM=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXrfwAxc5g_sYfAA--.1101S2;
        Sun, 20 Jun 2021 12:33:06 +0800 (CST)
Date:   Sun, 20 Jun 2021 12:33:04 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH 2/2] docs/zh_CN: add core api protection keys translation
Message-ID: <20210620043304.GA14958@bobwxc.top>
References: <cover.1623743265.git.siyanteng@loongson.cn>
 <6cf9d7c35867d303ba4e66169f3ed1c9d5399e8e.1623743265.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <6cf9d7c35867d303ba4e66169f3ed1c9d5399e8e.1623743265.git.siyanteng@loongson.cn>
X-today: flowers
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXrfwAxc5g_sYfAA--.1101S2
X-Coremail-Antispam: 1UD129KBjvJXoW3GF48tFy5JFWUtrWrWFW7urg_yoW7WrW3pr
        93K3s7KrWIyFyjyrySgr17CFn8Aa17A3ZIgw4xWFy5ZFn5Gas3tr42gryY9rW7CrnFyFyk
        ZF4rGrW0v3sIy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUjDGYDUUUU
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 03:52:40PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/protection-keys.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/protection-keys.rst        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/protection-=
keys.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/protection-keys.rs=
t b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> new file mode 100644
> index 000000000000..91a282b9a576
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/protection-keys.rst
> @@ -0,0 +1,98 @@
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
> +
> +.. _cn_core-api_protection-keys:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E5=AD=98=E4=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E7=9A=84=E5=86=85=E5=AD=98=E4=BF=9D=
=E6=8A=A4=E5=AF=86=E9=92=A5=EF=BC=88PKU=EF=BC=8C=E5=8F=88=E7=A7=B0PKEYs=EF=
=BC=89=E6=98=AF=E8=8B=B1=E7=89=B9=E5=B0=94Skylake=EF=BC=88=E5=8F=8A=E4=BB=
=A5=E5=90=8E=EF=BC=89"=E5=8F=AF=E6=89=A9
                                                                    ^
=EF=BC=88Memory Protection Keys for Userspace=EF=BC=8CPKU=EF=BC=8C=E4=BA=A6=
=E5=8D=B3PKEYs=EF=BC=89

> +=E5=B1=95=E5=A4=84=E7=90=86=E5=99=A8 "=E6=9C=8D=E5=8A=A1=E5=99=A8CPU=E4=
=B8=8A=E7=9A=84=E4=B8=80=E9=A1=B9=E5=8A=9F=E8=83=BD=E3=80=82=E5=AE=83=E5=B0=
=86=E5=9C=A8=E6=9C=AA=E6=9D=A5=E7=9A=84=E9=9D=9E=E6=9C=8D=E5=8A=A1=E5=99=A8=
=E8=8B=B1=E7=89=B9=E5=B0=94=E5=A4=84=E7=90=86=E5=99=A8=E5=92=8C=E6=9C=AA=E6=
=9D=A5
           ^^
           =E2=80=9C=E2=80=9D

> +=E7=9A=84AMD=E5=A4=84=E7=90=86=E5=99=A8=E4=B8=AD=E4=BD=BF=E7=94=A8=E3=80=
=82

s/=E4=BD=BF=E7=94=A8/=E5=8F=AF=E7=94=A8/

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
=9C=A8=E6=AF=8F=E4=B8=AA=E9=A1=B5=E8=A1=A8=E9=A1=B9=E4=B8=AD=E4=B8=BA "=E4=
=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5 "=E5=88=86=E9=85=8D4=E4=B8=AA=E4=BB=A5
                                                   ^^        ^^

> +=E5=89=8D=E8=A2=AB=E5=BF=BD=E7=95=A5=E7=9A=84=E4=BD=8D=EF=BC=8C=E4=BB=8E=
=E8=80=8C=E6=8F=90=E4=BE=9B16=E4=B8=AA=E5=8F=AF=E8=83=BD=E7=9A=84=E5=AF=86=
=E9=92=A5=E3=80=82
> +
> +=E8=BF=98=E6=9C=89=E4=B8=80=E4=B8=AA=E6=96=B0=E7=9A=84=E7=94=A8=E6=88=B7=
=E5=8F=AF=E8=AE=BF=E9=97=AE=E7=9A=84=E5=AF=84=E5=AD=98=E5=99=A8=EF=BC=88PKR=
U=EF=BC=89=EF=BC=8C=E4=B8=BA=E6=AF=8F=E4=B8=AA=E5=AF=86=E9=92=A5=E6=8F=90=
=E4=BE=9B=E4=B8=A4=E4=B8=AA=E5=8D=95=E7=8B=AC=E7=9A=84=E4=BD=8D=EF=BC=88=E8=
=AE=BF
                         ^^
                         remove =E7=9A=84
                         =E6=96=AD=E5=8F=A5=E6=AD=A7=E4=B9=89

> +=E9=97=AE=E7=A6=81=E6=AD=A2=E5=92=8C=E5=86=99=E5=85=A5=E7=A6=81=E6=AD=A2=
=EF=BC=89=E3=80=82=E4=BD=9C=E4=B8=BA=E4=B8=80=E4=B8=AACPU=E5=AF=84=E5=AD=98=
=E5=99=A8=EF=BC=8CPKRU=E5=9C=A8=E6=9C=AC=E8=B4=A8=E4=B8=8A=E6=98=AF=E7=BA=
=BF=E7=A8=8B=E6=9C=AC=E5=9C=B0=E7=9A=84=EF=BC=8C=E5=8F=AF=E8=83=BD
> +=E4=BC=9A=E7=BB=99=E6=AF=8F=E4=B8=AA=E7=BA=BF=E7=A8=8B=E6=8F=90=E4=BE=9B=
=E4=B8=80=E5=A5=97=E4=B8=8D=E5=90=8C=E4=BA=8E=E5=85=B6=E4=BB=96=E7=BA=BF=E7=
=A8=8B=E7=9A=84=E4=BF=9D=E6=8A=A4=E6=8E=AA=E6=96=BD=E3=80=82
> +
> +=E6=9C=89=E4=B8=A4=E6=9D=A1=E6=96=B0=E6=8C=87=E4=BB=A4=EF=BC=88RDPKRU/WR=
PKRU=EF=BC=89=E7=94=A8=E4=BA=8E=E8=AF=BB=E5=8F=96=E5=92=8C=E5=86=99=E5=85=
=A5=E6=96=B0=E7=9A=84=E5=AF=84=E5=AD=98=E5=99=A8=E3=80=82=E8=AF=A5=E5=8A=9F=
=E8=83=BD=E4=BB=85=E5=9C=A864=E4=BD=8D
> +=E6=A8=A1=E5=BC=8F=E4=B8=8B=E5=8F=AF=E7=94=A8=EF=BC=8C=E5=B0=BD=E7=AE=A1=
PAE PTEs=E4=B8=AD=E7=90=86=E8=AE=BA=E4=B8=8A=E6=9C=89=E7=A9=BA=E9=97=B4=E3=
=80=82=E8=BF=99=E4=BA=9B=E6=9D=83=E9=99=90=E5=8F=AA=E5=9C=A8=E6=95=B0=E6=8D=
=AE=E8=AE=BF=E9=97=AE=E4=B8=8A=E5=BC=BA=E5=88=B6=E6=89=A7=E8=A1=8C=EF=BC=8C
> +=E5=AF=B9=E6=8C=87=E4=BB=A4=E8=8E=B7=E5=8F=96=E6=B2=A1=E6=9C=89=E5=BD=B1=
=E5=93=8D=E3=80=82

s/PAE PTEs/=E7=89=A9=E7=90=86=E5=9C=B0=E5=9D=80=E6=89=A9=E5=B1=95=E9=A1=B5=
=E8=A1=A8/ =EF=BC=9F

> +
> +
> +=E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=9C=893=E4=B8=AA=E7=B3=BB=E7=BB=9F=E8=B0=83=E7=94=A8=E5=8F=AF=E4=BB=
=A5=E7=9B=B4=E6=8E=A5=E4=B8=8Epkeys=E8=BF=9B=E8=A1=8C=E4=BA=A4=E4=BA=92::
> +
> +	int pkey_alloc(unsigned long flags, unsigned long init_access_rights)
> +	int pkey_free(int pkey);
> +	int pkey_mprotect(unsigned long start, size_t len,
> +			  unsigned long prot, int pkey);
> +
> +=E5=9C=A8=E4=BD=BF=E7=94=A8=E4=B8=80=E4=B8=AApkey=E4=B9=8B=E5=89=8D=EF=
=BC=8C=E5=BF=85=E9=A1=BB=E5=85=88=E7=94=A8pkey_alloc()=E5=88=86=E9=85=8D=E5=
=AE=83=E3=80=82=E4=B8=80=E4=B8=AA=E5=BA=94=E7=94=A8=E7=A8=8B=E5=BA=8F=E7=9B=
=B4=E6=8E=A5=E8=B0=83=E7=94=A8
> +WRPKRU=E6=8C=87=E4=BB=A4=EF=BC=8C=E4=BB=A5=E6=94=B9=E5=8F=98=E4=B8=80=E4=
=B8=AA=E5=AF=86=E9=92=A5=E8=A6=86=E7=9B=96=E7=9A=84=E5=86=85=E5=AD=98=E7=9A=
=84=E8=AE=BF=E9=97=AE=E6=9D=83=E9=99=90=E3=80=82=E5=9C=A8=E8=BF=99=E4=B8=AA=
=E4=BE=8B=E5=AD=90=E4=B8=AD=EF=BC=8CWRPKRU
> +=E8=A2=AB=E4=B8=80=E4=B8=AA=E5=8F=AB=E5=81=9Apkey_set()=E7=9A=84C=E5=87=
=BD=E6=95=B0=E6=89=80=E5=B0=81=E8=A3=85::
> +
> +	int real_prot =3D PROT_READ|PROT_WRITE;
> +	pkey =3D pkey_alloc(0, PKEY_DISABLE_WRITE);
> +	ptr =3D mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS|MAP_PRIVATE, -1,=
 0);
> +	ret =3D pkey_mprotect(ptr, PAGE_SIZE, real_prot, pkey);
> +	... application runs here
> +
> +=E7=8E=B0=E5=9C=A8=EF=BC=8C=E5=A6=82=E6=9E=9C=E5=BA=94=E7=94=A8=E7=A8=8B=
=E5=BA=8F=E9=9C=80=E8=A6=81=E6=9B=B4=E6=96=B0'ptr'=E5=A4=84=E7=9A=84=E6=95=
=B0=E6=8D=AE=EF=BC=8C=E5=AE=83=E5=8F=AF=E4=BB=A5=E8=8E=B7=E5=BE=97=E8=AE=BF=
=E9=97=AE=E6=9D=83=EF=BC=8C=E8=BF=9B=E8=A1=8C=E6=9B=B4=E6=96=B0=EF=BC=8C
> +=E7=84=B6=E5=90=8E=E5=8F=96=E6=B6=88=E5=85=B6=E5=86=99=E8=AE=BF=E9=97=AE=
=E6=9D=83::
> +
> +	pkey_set(pkey, 0); // clear PKEY_DISABLE_WRITE
> +	*ptr =3D foo; // assign something
> +	pkey_set(pkey, PKEY_DISABLE_WRITE); // set PKEY_DISABLE_WRITE again
> +
> +=E7=8E=B0=E5=9C=A8=EF=BC=8C=E5=BD=93=E5=AE=83=E9=87=8A=E6=94=BE=E5=86=85=
=E5=AD=98=E6=97=B6=EF=BC=8C=E5=AE=83=E4=B9=9F=E5=B0=86=E9=87=8A=E6=94=BEpke=
y=EF=BC=8C=E5=9B=A0=E4=B8=BA=E5=AE=83=E4=B8=8D=E5=86=8D=E8=A2=AB=E4=BD=BF=
=E7=94=A8=E4=BA=86::
> +
> +	munmap(ptr, PAGE_SIZE);
> +	pkey_free(pkey);
> +
> +.. note:: pkey_set()=E6=98=AFRDPKRU=E5=92=8CWRPKRU=E6=8C=87=E4=BB=A4=E7=
=9A=84=E4=B8=80=E4=B8=AA=E5=B0=81=E8=A3=85=E5=99=A8=E3=80=82=E5=9C=A8tools/=
testing/selftests/x86/protection_keys.c=E4=B8=AD=E5=8F=AF=E4=BB=A5=E6=89=BE=
=E5=88=B0=E4=B8=80=E4=B8=AA=E5=AE=9E=E7=8E=B0=E5=AE=9E=E4=BE=8B=E3=80=82
> +          tools/testing/selftests/x86/protection_keys.c.
> +
> +=E8=A1=8C=E4=B8=BA
> +=3D=3D=3D=3D
> +
> +=E5=86=85=E6=A0=B8=E8=AF=95=E5=9B=BE=E4=BD=BF=E4=BF=9D=E6=8A=A4=E5=AF=86=
=E9=92=A5=E4=B8=8E=E6=99=AE=E9=80=9A=E7=9A=84protect()=E7=9A=84=E8=A1=8C=E4=
=B8=BA=E4=B8=80=E8=87=B4=E3=80=82=E4=BE=8B=E5=A6=82=EF=BC=8C=E5=A6=82=E6=9E=
=9C=E4=BD=A0=E8=BF=99=E6=A0=B7=E5=81=9A::
                             ^^^^^^^^^
                             mprotect()

> +
> +	mprotect(ptr, size, PROT_NONE);
> +	something(ptr);
> +
> +=E8=BF=99=E6=A0=B7=E5=81=9A=E7=9A=84=E6=97=B6=E5=80=99=EF=BC=8C=E4=BD=A0=
=E5=8F=AF=E4=BB=A5=E6=9C=9F=E5=BE=85=E4=BF=9D=E6=8A=A4=E5=AF=86=E9=92=A5=E7=
=9A=84=E7=9B=B8=E5=90=8C=E6=95=88=E6=9E=9C::
> +
> +	pkey =3D pkey_alloc(0, PKEY_DISABLE_WRITE | PKEY_DISABLE_READ);
> +	pkey_mprotect(ptr, size, PROT_READ|PROT_WRITE, pkey);
> +	something(ptr);
> +
> +=E6=97=A0=E8=AE=BAsomething()=E6=98=AF=E5=90=A6=E6=98=AF=E5=AF=B9'ptr'=
=E7=9A=84=E7=9B=B4=E6=8E=A5=E8=AE=BF=E9=97=AE=EF=BC=8C=E8=BF=99=E9=83=BD=E5=
=BA=94=E8=AF=A5=E4=B8=BA=E7=9C=9F=E3=80=82
> +=E5=A6=82::
> +
> +	*ptr =3D foo;
> +
> +=E6=88=96=E8=80=85=E5=BD=93=E5=86=85=E6=A0=B8=E4=BB=A3=E8=A1=A8=E5=BA=94=
=E7=94=A8=E7=A8=8B=E5=BA=8F=E8=BF=9B=E8=A1=8C=E8=AE=BF=E9=97=AE=E6=97=B6=EF=
=BC=8C=E6=AF=94=E5=A6=82read()::
> +
> +	read(fd, ptr, 1);
> +
> +=E5=9C=A8=E8=BF=99=E4=B8=A4=E7=A7=8D=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=
=E5=86=85=E6=A0=B8=E9=83=BD=E4=BC=9A=E5=8F=91=E9=80=81=E4=B8=80=E4=B8=AASIG=
SEGV=EF=BC=8C=E4=BD=86=E5=BD=93=E8=BF=9D=E5=8F=8D=E4=BF=9D=E6=8A=A4=E5=AF=
=86=E9=92=A5=E6=97=B6=EF=BC=8Csi_code
> +=E5=B0=86=E8=A2=AB=E8=AE=BE=E7=BD=AE=E4=B8=BASEGV_PKERR=EF=BC=8C=E8=80=
=8C=E5=BD=93=E8=BF=9D=E5=8F=8D=E6=99=AE=E9=80=9A=E7=9A=84mprotect()=E6=9D=
=83=E9=99=90=E6=97=B6=EF=BC=8C=E5=88=99=E6=98=AFSEGV_ACCERR=E3=80=82
> --=20
> 2.27.0

Thanks,
        Wu X.C.

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDOxPcACgkQtlsoEiKC
sIVg8AwAlhpxeyGduUr4tS3mKCvD2auctyZ1//d00f/fMQ3H762aR0CTSS8fxYa+
sPY+1USrBHnhWtijtX2uyb/5vnZ/EppQ5E0w/Ms0NnAqetgdsz/onY5T93mknUqx
z3HJ5F7AIOEuZyCfWbkH1ClDeYFnVkkdT3WOuk3qvGmQkGplthuEiZeGurrwFkGW
6G6oT9NUcfWp22ZpnycLDMSB9oRTH54G5CxtZDXALrjgFMyom6qDiWyCgof355qB
ztObB8F9JEAW+czdLrwFnA7bC3ye4Lm+EJ6jSZVuvrnJpqB+qbX9htUA6EMQjwhp
1DD3suGwaNQwyO58XX7Js6qaMAanCmXWSo6prE2PMOAZFYpfMzgTuB/g9o0a3lEt
7m2TUYJeOOxIUHkpk9LZMBfrpL9hJ0/HoqO6pe2F2Dq9kEnshZ9Qk/VMby3n7Kl8
K0+M3JIK0zZLJNFDCH4z9sLb0Ll2r9CQtZzEgfUSUfyVOOQgjtV3z6lZM0W5BViQ
+L5TN9fj
=APjf
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--

