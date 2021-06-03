Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A158C47096
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 11:50:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F35B7613BF
	for <linux-doc@archiver.kernel.org>; Thu,  3 Jun 2021 11:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230084AbhFCLwl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:52:41 -0400
Received: from m32-153.88.com ([43.250.32.153]:13708 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229854AbhFCLwl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Jun 2021 07:52:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=bilZGaQC6c870DH9pMlFv4rsZCYuT7F0nRi8m
        iwmHOs=; b=MPpGqJkEcFPPuaRRE/u2b+TxhVbCrgNARe+owIA2xNRRHDXksxqxM
        zp5dqTOLy6iyFsbCeHV/nwdDXORn9dBRGKrKo03PooH2A7uvwONTPIBl9FCvs0T3
        2Ma4v1ZwxOuAlxkP/+6pl2kxLwZ0WFX3m1l8fqRTCOckV+5Oo9Gxbg=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCn9lgWwrhgIpFiAA--.53757S2;
        Thu, 03 Jun 2021 19:50:48 +0800 (CST)
Date:   Thu, 3 Jun 2021 19:50:40 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2] docs/zh_CN: add core api cachetlb translation
Message-ID: <20210603115040.GA5502@bobwxc.top>
References: <20210603015802.2609230-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20210603015802.2609230-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCn9lgWwrhgIpFiAA--.53757S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWkCw1DGFy8Jw47CF48JFb_yoWrZr4DpF
        yIk3s3Ka1IgFy09Fna9w4UJr1fJ348Ja17Ka9FgwnIqw1kXrW2v3yjgFyDuF97XrykZayI
        y34YyFyIkr42kaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUUPEfUUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi YanTeng,

I build it, and find some small problems.

On Thu, Jun 03, 2021 at 09:58:02AM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/cachetlb.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
> v2:
>=20
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.
>     If you don't want me to do this, please let me know.
>=20
> * Modified some words under Xiangcheng's and Alex's advices.
>=20
>  .../translations/zh_CN/core-api/cachetlb.rst  | 337 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   7 +-
>  2 files changed, 343 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/cachetlb.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Doc=
umentation/translations/zh_CN/core-api/cachetlb.rst
> new file mode 100644
> index 000000000000..d37653e029d8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
[...]
> +5) ``void update_mmu_cache(struct vm_area_struct *vma,
> +   unsigned long address, pte_t *ptep)``
> +
> +   =E5=9C=A8=E6=AF=8F=E4=B8=AA=E9=A1=B5=E9=9D=A2=E6=95=85=E9=9A=9C=E7=BB=
=93=E6=9D=9F=E6=97=B6=EF=BC=8C=E8=BF=99=E4=B8=AA=E7=A8=8B=E5=BA=8F=E8=A2=AB=
=E8=B0=83=E7=94=A8=EF=BC=8C=E4=BB=A5=E5=91=8A=E8=AF=89=E4=BD=93=E7=B3=BB=E7=
=BB=93=E6=9E=84=E7=89=B9=E5=AE=9A=E7=9A=84=E4=BB=A3=E7=A0=81=EF=BC=8C=E5=9C=
=A8
> +   =E8=BD=AF=E4=BB=B6=E9=A1=B5=E8=A1=A8=E4=B8=AD=EF=BC=8C=E5=9C=A8=E5=9C=
=B0=E5=9D=80=E7=A9=BA=E9=97=B4=E2=80=9Cvma->vm_mm=E2=80=9D=E7=9A=84=E8=99=
=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E2=80=9C=E5=9C=B0=E5=9D=80=E2=80=9D=E5=A4=84=
=EF=BC=8C=E7=8E=B0=E5=9C=A8=E5=AD=98=E5=9C=A8
> +   =E4=B8=80=E4=B8=AA=E7=BF=BB=E8=AF=91=E3=80=82
> +
> +   =E5=8F=AF=E4=BB=A5=E7=94=A8=E5=AE=83=E6=89=80=E9=80=89=E6=8B=A9=E7=9A=
=84=E4=BB=BB=E4=BD=95=E6=96=B9=E5=BC=8F=E4=BD=BF=E7=94=A8=E8=BF=99=E4=B8=AA=
=E4=BF=A1=E6=81=AF=E6=9D=A5=E8=BF=9B=E8=A1=8C=E7=A7=BB=E6=A4=8D=E3=80=82=E4=
=BE=8B=E5=A6=82=EF=BC=8C=E5=AE=83=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8=E8=BF=
=99
> +   =E4=B8=AA=E4=BA=8B=E4=BB=B6=E6=9D=A5=E4=B8=BA=E8=BD=AF=E4=BB=B6=E7=AE=
=A1=E7=90=86=E7=9A=84TLB=E9=85=8D=E7=BD=AE=E9=A2=84=E8=A3=85TLB=E8=BD=AC=E6=
=8D=A2=E3=80=82=E7=9B=AE=E5=89=8Dsparc64=E7=A7=BB=E6=A4=8D=E5=B0=B1=E6=98=
=AF=E8=BF=99=E4=B9=88=E5=B9=B2
> +   =E7=9A=84=E3=80=82
> +
> +
[...]
> +3) ``void flush_cache_range(struct vm_area_struct *vma,
> +   unsigned long start, unsigned long end)``
> +
> +   =E5=9C=A8=E8=BF=99=E9=87=8C=EF=BC=8C=E6=88=91=E4=BB=AC=E8=A6=81=E4=BB=
=8E=E7=BC=93=E5=AD=98=E4=B8=AD=E5=88=B7=E6=96=B0=E4=B8=80=E4=B8=AA=E7=89=B9=
=E5=AE=9A=E8=8C=83=E5=9B=B4=E7=9A=84=EF=BC=88=E7=94=A8=E6=88=B7=EF=BC=89=E8=
=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E3=80=82=E8=BF=90=E8=A1=8C
> +   =E5=90=8E=EF=BC=8C=E5=9C=A8=E2=80=9Cstart=E2=80=9D=E5=88=B0=E2=80=9Ce=
nd-1=E2=80=9D=E8=8C=83=E5=9B=B4=E5=86=85=E7=9A=84=E8=99=9A=E6=8B=9F=E5=9C=
=B0=E5=9D=80=E7=9A=84=E2=80=9Cvma->vm_mm=E2=80=9D=E7=9A=84=E7=BC=93=E5=AD=
=98=E4=B8=AD
> +   =E5=B0=86=E6=B2=A1=E6=9C=89=E9=A1=B5=E8=A1=A8=E9=A1=B9=E3=80=82
> +
> +   =E2=80=9Cvma=E2=80=9D=E6=98=AF=E8=A2=AB=E7=94=A8=E4=BA=8E=E8=AF=A5=E5=
=8C=BA=E5=9F=9F=E7=9A=84=E5=A4=87=E4=BB=BD=E5=AD=98=E5=82=A8=E3=80=82=E4=B8=
=BB=E8=A6=81=E6=98=AF=E7=94=A8=E4=BA=8Emunmap()=E7=B1=BB=E5=9E=8B=E7=9A=84=
=E6=93=8D=E4=BD=9C=E3=80=82
> +
> +   =E6=8F=90=E4=BE=9B=E8=BF=99=E4=B8=AA=E6=8E=A5=E5=8F=A3=E6=98=AF=E5=B8=
=8C=E6=9C=9B=E7=AB=AF=E5=8F=A3=E8=83=BD=E5=A4=9F=E6=89=BE=E5=88=B0=E4=B8=80=
=E4=B8=AA=E5=90=88=E9=80=82=E7=9A=84=E6=9C=89=E6=95=88=E6=96=B9=E6=B3=95=E6=
=9D=A5=E4=BB=8E=E7=BC=93=E5=AD=98=E4=B8=AD=E5=88=A0
> +   =E9=99=A4=E5=A4=9A=E4=B8=AA=E9=A1=B5=E9=9D=A2=E5=A4=A7=E5=B0=8F=E7=9A=
=84=E5=8C=BA=E5=9F=9F=EF=BC=8C =E8=80=8C=E4=B8=8D=E6=98=AF=E8=AE=A9=E5=86=
=85=E6=A0=B8=E4=B8=BA=E6=AF=8F=E4=B8=AA=E5=8F=AF=E8=83=BD=E8=A2=AB=E4=BF=AE=
=E6=94=B9=E7=9A=84=E9=A1=B5=E8=A1=A8=E9=A1=B9=E8=B0=83
> +   =E7=94=A8 flush_cache_page (=E8=A7=81=E4=B8=8B=E6=96=87)=E3=80=82
> +
> +
[...]
> +6) ``void flush_cache_vmap(unsigned long start, unsigned long end)``
> +   ``void flush_cache_vunmap(unsigned long start, unsigned long end)``
> +
> +   =E5=9C=A8=E8=BF=99=E9=87=8C=EF=BC=8C=E5=9C=A8=E8=BF=99=E4=B8=A4=E4=B8=
=AA=E6=8E=A5=E5=8F=A3=E4=B8=AD=EF=BC=8C=E6=88=91=E4=BB=AC=E4=BB=8E=E7=BC=93=
=E5=AD=98=E4=B8=AD=E5=88=B7=E6=96=B0=E4=B8=80=E4=B8=AA=E7=89=B9=E5=AE=9A=E8=
=8C=83=E5=9B=B4=E7=9A=84=EF=BC=88=E5=86=85=E6=A0=B8=EF=BC=89
> +   =E8=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E3=80=82=E8=BF=90=E8=A1=8C=E5=90=
=8E=EF=BC=8C=E5=9C=A8=E2=80=9Cstart=E2=80=9D=E5=88=B0=E2=80=9Cend-1=E2=80=
=9D=E8=8C=83=E5=9B=B4=E5=86=85=E7=9A=84=E8=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=
=E7=9A=84=E5=86=85=E6=A0=B8=E5=9C=B0
> +   =E5=9D=80=E7=A9=BA=E9=97=B4=E7=9A=84=E7=BC=93=E5=AD=98=E4=B8=AD=E4=B8=
=8D=E4=BC=9A=E6=9C=89=E9=A1=B5=E8=A1=A8=E9=A1=B9=E3=80=82
> +
> +   =E8=BF=99=E4=B8=A4=E4=B8=AA=E7=A8=8B=E5=BA=8F=E4=B8=AD=E7=9A=84=E7=AC=
=AC=E4=B8=80=E4=B8=AA=E6=98=AF=E5=9C=A8vmap_range()=E5=AE=89=E8=A3=85=E4=BA=
=86=E9=A1=B5=E8=A1=A8=E9=A1=B9=E4=B9=8B=E5=90=8E=E8=B0=83=E7=94=A8=E7=9A=84=
=E3=80=82
> +   =E7=AC=AC=E4=BA=8C=E4=B8=AA=E6=98=AF=E5=9C=A8vunmap_range()=E5=88=A0=
=E9=99=A4=E9=A1=B5=E8=A1=A8=E9=A1=B9=E4=B9=8B=E5=89=8D=E8=B0=83=E7=94=A8=E7=
=9A=84=E3=80=82
> +

For above three point, annotation text is not indented correctly.
They are different from others.

> +=E8=BF=98=E6=9C=89=E4=B8=80=E7=B1=BBcpu=E7=BC=93=E5=AD=98=E9=97=AE=E9=A2=
=98=EF=BC=8C=E7=9B=AE=E5=89=8D=E9=9C=80=E8=A6=81=E4=B8=80=E5=A5=97=E5=AE=8C=
=E5=85=A8=E4=B8=8D=E5=90=8C=E7=9A=84=E6=8E=A5=E5=8F=A3=E6=9D=A5=E6=AD=A3=E7=
=A1=AE=E5=A4=84=E7=90=86=E3=80=82=E6=9C=80=E5=A4=A7
> +=E7=9A=84=E9=97=AE=E9=A2=98=E6=98=AF=E5=A4=84=E7=90=86=E5=99=A8=E7=9A=84=
=E6=95=B0=E6=8D=AE=E7=BC=93=E5=AD=98=E4=B8=AD=E7=9A=84=E8=99=9A=E6=8B=9F=E5=
=88=AB=E5=90=8D=E3=80=82
> +
> +.. =E8=AF=91=E8=80=85=E6=9C=89=E8=AF=9D=E8=AF=B4=EF=BC=9A

And this did not be rendered, so use below?=20

=2E. note::

	=E8=AF=91=E8=80=85=E6=9C=89=E8=AF=9D=E8=AF=B4=EF=BC=9A
> +
> +	=E8=BF=99=E6=AE=B5=E5=86=85=E5=AE=B9=E6=9C=89=E4=BA=9B=E6=99=A6=E6=B6=
=A9=EF=BC=8C=E4=B8=BA=E4=BA=86=E5=87=8F=E8=BD=BB=E4=B8=AD=E6=96=87=E9=98=85=
=E8=AF=BB=E5=8E=8B=E5=8A=9B=EF=BC=8C=E7=89=B9=E4=BD=9C=E6=AD=A4=E8=AF=91=E6=
=B3=A8=E3=80=82
> +
> +	=E5=88=AB=E5=90=8D=EF=BC=88alias=EF=BC=89=E5=B1=9E=E4=BA=8E=E7=BC=93=E5=
=AD=98=E4=B8=80=E8=87=B4=E6=80=A7=E9=97=AE=E9=A2=98=EF=BC=8C=E5=BD=93=E4=B8=
=8D=E5=90=8C=E7=9A=84=E8=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E6=98=A0=E5=B0=84=
=E7=9B=B8=E5=90=8C=E7=9A=84
> +	=E7=89=A9=E7=90=86=E5=9C=B0=E5=9D=80=EF=BC=8C=E8=80=8C=E8=BF=99=E4=BA=
=9B=E8=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E7=9A=84index=E4=B8=8D=E5=90=8C=EF=
=BC=8C=E6=AD=A4=E6=97=B6=E5=B0=B1=E5=8F=91=E7=94=9F=E4=BA=86=E5=88=AB=E5=90=
=8D=E7=8E=B0=E8=B1=A1(=E5=A4=9A
> +	=E4=B8=AA=E8=99=9A=E6=8B=9F=E5=9C=B0=E5=9D=80=E8=A2=AB=E7=A7=B0=E4=B8=
=BA=E5=88=AB=E5=90=8D)=E3=80=82=E9=80=9A=E4=BF=97=E7=82=B9=E6=9D=A5=E8=AF=
=B4=E5=B0=B1=E6=98=AF=E6=8C=87=E5=90=8C=E4=B8=80=E4=B8=AA=E7=89=A9=E7=90=86=
=E5=9C=B0=E5=9D=80=E7=9A=84=E6=95=B0=E6=8D=AE=E8=A2=AB
> +	=E5=8A=A0=E8=BD=BD=E5=88=B0=E4=B8=8D=E5=90=8C=E7=9A=84cacheline=E4=B8=
=AD=E5=B0=B1=E4=BC=9A=E5=87=BA=E7=8E=B0=E5=88=AB=E5=90=8D=E7=8E=B0=E8=B1=A1=
=E3=80=82
> +
> +	=E5=B8=B8=E8=A7=81=E7=9A=84=E8=A7=A3=E5=86=B3=E6=96=B9=E6=B3=95=E6=9C=
=89=E4=B8=A4=E7=A7=8D=EF=BC=9A=E7=AC=AC=E4=B8=80=E7=A7=8D=E6=98=AF=E7=A1=AC=
=E4=BB=B6=E7=BB=B4=E6=8A=A4=E4=B8=80=E8=87=B4=E6=80=A7=EF=BC=8C=E8=AE=BE=E8=
=AE=A1=E7=89=B9=E5=AE=9A=E7=9A=84cpu=E7=94=B5
> +	=E8=B7=AF=E6=9D=A5=E8=A7=A3=E5=86=B3=E9=97=AE=E9=A2=98=EF=BC=88=E4=BE=
=8B=E5=A6=82=E8=AE=BE=E8=AE=A1=E4=B8=BAPIPT=E7=9A=84cache=EF=BC=89=EF=BC=9B=
=E7=AC=AC=E4=BA=8C=E7=A7=8D=E6=98=AF=E8=BD=AF=E4=BB=B6=E7=BB=B4=E6=8A=A4=E4=
=B8=80=E8=87=B4=E6=80=A7=EF=BC=8C
> +	=E5=B0=B1=E6=98=AF=E4=B8=8B=E9=9D=A2=E4=BB=8B=E7=BB=8D=E7=9A=84sparc=E7=
=9A=84=E8=A7=A3=E5=86=B3=E6=96=B9=E6=A1=88=E2=80=94=E2=80=94=E9=A1=B5=E9=9D=
=A2=E6=9F=93=E8=89=B2=EF=BC=8C=E6=B6=89=E5=8F=8A=E7=9A=84=E6=8A=80=E6=9C=AF=
=E7=BB=86=E8=8A=82=E5=A4=AA=E5=A4=9A=EF=BC=8C
> +	=E8=AF=91=E8=80=85=E4=B8=8D=E4=BE=BF=E5=B1=95=E5=BC=80=EF=BC=8C=E8=AF=
=B7=E8=AF=BB=E8=80=85=E8=87=AA=E8=A1=8C=E6=9F=A5=E9=98=85=E7=9B=B8=E5=85=B3=
=E8=B5=84=E6=96=99=E3=80=82
> +

All others are good.
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks!

Wu X.C.

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmC4wgsACgkQtlsoEiKC
sIVelAwAjku85zUUMmUUD/DKjPLov6Mtvet+4VPfUxjQq821Oj3Rwb7swe70FPfE
2AyE1SES+38XmY5buPIwsvL7JhVuhwkbhtZbOgL4QQC9tH5dmKDG2l7KglWbYD5y
cxSxDM3wqDqV6MY4AJ8okYm8/WK409OMHLda8mWf6EhoeGp33pNgK7vgRZvfplwU
jJv5EPoYExtqmSpGlT+rj2qJybq5vTFAoOMOFVbtvbfSQo2sxYHumhMyGOZ5lOyP
8bdmm78Ts0shan7teNXKRtVntjohCACoSMrIgEdrftjlTmxtYn1RTApIFXXsbpo2
bLmTkCnnf8Q02KP50TbOWPtLNz4CTkc02ws3U+tQl4gwFXpItDRcpu4xvmLq/vbO
d+ISZRbeEWsul7i0rTf4VE+S0pv1LOxyOCaTPdNuL/tRaeNHEtLrjh0WEntpQq3g
da+qTN0RyM2cizrbAlJAar0M0gIx382dkwYZVQFnKtHgS8BGdZ+b9xVAzsnIuJo/
m80khCK5
=ObHy
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--

