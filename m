Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A8FDC2B9F4
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 07:48:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 02BFA613CE
	for <linux-doc@archiver.kernel.org>; Thu, 17 Jun 2021 07:48:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhFQHvB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:51:01 -0400
Received: from m32-153.88.com ([43.250.32.153]:56637 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229515AbhFQHvB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Jun 2021 03:51:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=WR6qH9Dzui0d0n5u+Jt4HsM36bKFWDlpmFVdT
        VkyoA4=; b=cNtxA6MOXP2y6PhoxgdO1Z/3WXyHiPLpSSLGDF7VazeFPepKU+GIQ
        D6fbmsWoSxdbVYPXN4cu+4rKZeZKgjbqu2+OsM7DA5pkpbX8TVBKYSH8kBtJUrjD
        UAfM5+BxCfJURqUUxd3l8aRpjvo356dPjxPsbQS8HFo4xTkC+hcWfk=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgA3Dv1b_spgCFMZAA--.54403S2;
        Thu, 17 Jun 2021 15:48:45 +0800 (CST)
Date:   Thu, 17 Jun 2021 15:48:43 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH 1/2] docs/zh_CN: add core api memory_hotplug translation
Message-ID: <20210617074842.GA16827@bobwxc.top>
References: <cover.1623743265.git.siyanteng@loongson.cn>
 <592b325fbc92ac72752b36195718c32763d15ecf.1623743265.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline
In-Reply-To: <592b325fbc92ac72752b36195718c32763d15ecf.1623743265.git.siyanteng@loongson.cn>
X-today: Sleepy Zzzzz
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgA3Dv1b_spgCFMZAA--.54403S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuFWUtrW7WF17uFy7Gry7GFg_yoW3GF4rpa
        sF9r93Ga18Cry0vFs7Cr1UGry8C34xCay7K347Ar1ayF1kArWIyF47tFy7Gr93W347AFyv
        yF4ayry0kFWFv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
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


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 15, 2021 at 03:52:39PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/cachetlb.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotp=
lug.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index b4bde9396339..14012c5b0f40 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -80,12 +80,12 @@ Todolist:
>     :maxdepth: 1
> =20
>     cachetlb
> +   memory-hotplug
> =20
>  Todolist:
> =20
> =20
>     cpu_hotplug
> -   memory-hotplug
>     genericirq
>     protection-keys
> =20
> diff --git a/Documentation/translations/zh_CN/core-api/memory-hotplug.rst=
 b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> new file mode 100644
> index 000000000000..35bd8f20a1be
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/memory-hotplug.rst
> @@ -0,0 +1,126 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/cachetlb.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +
> +.. _cn_core-api_memory-hotplug:
> +.. _memory_hotplug:
       ^^^^^^^^^^^^^^
       two tags, remove the 2nd tag

> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E5=AD=98=E7=83=AD=E6=8F=92=E6=8B=94
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E5=86=85=E5=AD=98=E7=83=AD=E6=8B=94=E6=8F=92=E4=BA=8B=E4=BB=B6=E9=80=9A=
=E7=9F=A5=E5=99=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E7=83=AD=E6=8F=92=E6=8B=94=E4=BA=8B=E4=BB=B6=E8=A2=AB=E5=8F=91=E9=80=81=
=E5=88=B0=E4=B8=80=E4=B8=AA=E9=80=9A=E7=9F=A5=E9=98=9F=E5=88=97=E4=B8=AD=E3=
=80=82
> +
> +=E5=9C=A8 ``include/linux/memory.h`` =E4=B8=AD=E5=AE=9A=E4=B9=89=E4=BA=
=86=E5=85=AD=E7=A7=8D=E7=B1=BB=E5=9E=8B=E7=9A=84=E9=80=9A=E7=9F=A5=EF=BC=9A
> +
> +MEM_GOING_ONLINE
> +  =E5=9C=A8=E6=96=B0=E5=86=85=E5=AD=98=E5=8F=AF=E7=94=A8=E4=B9=8B=E5=89=
=8D=E7=94=9F=E6=88=90=EF=BC=8C=E4=BB=A5=E4=BE=BF=E8=83=BD=E5=A4=9F=E4=B8=BA=
=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=A4=84=E7=90=86=E5=86=85=E5=AD=98=E5=81=9A=E5=
=87=86=E5=A4=87=E3=80=82=E9=A1=B5=E9=9D=A2=E5=88=86=E9=85=8D=E5=99=A8=E4=BB=
=8D=E7=84=B6=E6=97=A0=E6=B3=95=E4=BB=8E=E6=96=B0
> +  =E7=9A=84=E5=86=85=E5=AD=98=E4=B8=AD=E8=BF=9B=E8=A1=8C=E5=88=86=E9=85=
=8D=E3=80=82
> +
> +MEM_CANCEL_ONLINE
> +  =E5=A6=82=E6=9E=9CMEM_GOING_ONLINE=E5=A4=B1=E8=B4=A5=EF=BC=8C=E5=88=99=
=E7=94=9F=E6=88=90=E3=80=82
> +
> +MEM_ONLINE
> +  =E5=BD=93=E5=86=85=E5=AD=98=E6=88=90=E5=8A=9F=E4=B8=8A=E7=BA=BF=E6=97=
=B6=E4=BA=A7=E7=94=9F=E3=80=82=E5=9B=9E=E8=B0=83=E5=8F=AF=E4=BB=A5=E4=BB=8E=
=E6=96=B0=E7=9A=84=E5=86=85=E5=AD=98=E4=B8=AD=E5=88=86=E9=85=8D=E9=A1=B5=E9=
=9D=A2=E3=80=82
> +
> +MEM_GOING_OFFLINE
> +  =E5=9C=A8=E5=BC=80=E5=A7=8B=E5=AF=B9=E5=86=85=E5=AD=98=E8=BF=9B=E8=A1=
=8C=E4=B8=8B=E7=BA=BF=E5=A4=84=E7=90=86=E6=97=B6=E7=94=9F=E6=88=90=E3=80=82=
=E4=BB=8E=E5=86=85=E5=AD=98=E4=B8=AD=E7=9A=84=E5=88=86=E9=85=8D=E4=B8=8D=E5=
=86=8D=E5=8F=AF=E8=83=BD=EF=BC=8C=E4=BD=86=E6=98=AF=E4=B8=80=E4=BA=9B=E8=A6=
=81=E4=B8=8B=E7=BA=BF=E7=9A=84=E5=86=85=E5=AD=98
> +  =E4=BB=8D=E7=84=B6=E5=9C=A8=E4=BD=BF=E7=94=A8=E3=80=82=E5=9B=9E=E8=B0=
=83=E5=8F=AF=E4=BB=A5=E7=94=A8=E6=9D=A5=E9=87=8A=E6=94=BE=E4=B8=80=E4=B8=AA=
=E5=AD=90=E7=B3=BB=E7=BB=9F=E5=9C=A8=E6=8C=87=E5=AE=9A=E5=86=85=E5=AD=98=E5=
=9D=97=E4=B8=AD=E5=B7=B2=E7=9F=A5=E7=9A=84=E5=86=85=E5=AD=98=E3=80=82
> +
> +MEM_CANCEL_OFFLINE
> +  =E5=A6=82=E6=9E=9CMEM_GOING_OFFLINE=E5=A4=B1=E8=B4=A5=EF=BC=8C=E5=88=
=99=E7=94=9F=E6=88=90=E3=80=82=E6=9D=A5=E8=87=AA=E6=88=91=E4=BB=AC=E8=AF=95=
=E5=9B=BE=E7=A6=BB=E7=BA=BF=E7=9A=84=E5=86=85=E5=AD=98=E5=9D=97=E4=B8=AD=E7=
=9A=84=E5=86=85=E5=AD=98=E5=8F=88=E5=8F=AF=E4=BB=A5=E4=BD=BF
> +  =E7=94=A8=E4=BA=86=E3=80=82
> +
> +MEM_OFFLINE
> +  =E5=9C=A8=E4=B8=8B=E7=BA=BF=E5=86=85=E5=AD=98=E5=AE=8C=E6=88=90=E5=90=
=8E=E7=94=9F=E6=88=90=E3=80=82

=E5=86=85=E5=AD=98=E4=B8=8B=E7=BA=BF=E5=AE=8C=E6=88=90 =EF=BC=9F

> +
> +=E4=B8=80=E4=B8=AA=E5=9B=9E=E8=B0=83=E7=A8=8B=E5=BA=8F=E5=8F=AF=E4=BB=A5=
=E9=80=9A=E8=BF=87=E8=B0=83=E7=94=A8::

be registered by calling:
=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E8=B0=83=E7=94=A8=E5=A6=82=E4=B8=8B=E5=
=87=BD=E6=95=B0=E6=9D=A5=E6=B3=A8=E5=86=8C=E4=B8=80=E4=B8=AA=E5=9B=9E=E8=B0=
=83=E7=A8=8B=E5=BA=8F::

> +
> +  hotplug_memory_notifier(callback_func, priority)
> +
> +=E4=BC=98=E5=85=88=E7=BA=A7=E6=95=B0=E5=80=BC=E8=BE=83=E9=AB=98=E7=9A=84=
=E5=9B=9E=E8=B0=83=E5=87=BD=E6=95=B0=E5=9C=A8=E6=95=B0=E5=80=BC=E8=BE=83=E4=
=BD=8E=E7=9A=84=E5=9B=9E=E8=B0=83=E5=87=BD=E6=95=B0=E4=B9=8B=E5=89=8D=E8=A2=
=AB=E8=B0=83=E7=94=A8=E3=80=82
> +
> +=E4=B8=80=E4=B8=AA=E5=9B=9E=E8=B0=83=E5=87=BD=E6=95=B0=E5=BF=85=E9=A1=BB=
=E6=9C=89=E4=BB=A5=E4=B8=8B=E5=8E=9F=E5=9E=8B::
> +
> +  int callback_func(
> +    struct notifier_block *self, unsigned long action, void *arg);
> +
> +=E5=9B=9E=E8=B0=83=E5=87=BD=E6=95=B0=E7=9A=84=E7=AC=AC=E4=B8=80=E4=B8=AA=
=E5=8F=82=E6=95=B0=EF=BC=88self=EF=BC=89=E6=98=AF=E6=8C=87=E5=90=91=E5=9B=
=9E=E8=B0=83=E5=87=BD=E6=95=B0=E6=9C=AC=E8=BA=AB=E7=9A=84=E9=80=9A=E7=9F=A5=
=E5=99=A8=E9=93=BE=E5=9D=97=E7=9A=84=E4=B8=80=E4=B8=AA=E6=8C=87=E9=92=88=E3=
=80=82=E7=AC=AC=E4=BA=8C=E4=B8=AA=E5=8F=82
> +=E6=95=B0=EF=BC=88action=EF=BC=89=E6=98=AF=E4=B8=8A=E8=BF=B0=E7=9A=84=E4=
=BA=8B=E4=BB=B6=E7=B1=BB=E5=9E=8B=E4=B9=8B=E4=B8=80=E3=80=82=E7=AC=AC=E4=B8=
=89=E4=B8=AA=E5=8F=82=E6=95=B0=EF=BC=88arg=EF=BC=89=E4=BC=A0=E9=80=92=E4=B8=
=80=E4=B8=AA=E6=8C=87=E5=90=91
> +struct memory_notify=E7=9A=84=E6=8C=87=E9=92=88::
   ^^^^^^^
   memory_notify=E7=BB=93=E6=9E=84=E4=BD=93

> +
> +	struct memory_notify {
> +		unsigned long start_pfn;
> +		unsigned long nr_pages;
> +		int status_change_nid_normal;
> +		int status_change_nid_high;
> +		int status_change_nid;
> +	}
> +
> +- start_pfn=E6=98=AF=E5=9C=A8=E7=BA=BF/=E7=A6=BB=E7=BA=BF=E5=86=85=E5=AD=
=98=E7=9A=84start_pfn=E3=80=82
> +
> +- nr_pages=E6=98=AF=E5=9C=A8=E7=BA=BF/=E7=A6=BB=E7=BA=BF=E5=86=85=E5=AD=
=98=E7=9A=84#=E9=A1=B5=E6=95=B0=E3=80=82

# of pages =3D number of pages
remove #

> +
> +- status_change_nid_normal=E6=98=AF=E5=BD=93nodemask=E7=9A=84N_NORMAL_ME=
MORY=E8=A2=AB=E8=AE=BE=E7=BD=AE/=E6=B8=85=E9=99=A4=E6=97=B6=E8=AE=BE=E7=BD=
=AE=E8=8A=82
> +  =E7=82=B9id=EF=BC=8C=E5=A6=82=E6=9E=9C=E6=98=AF-1=EF=BC=8C=E5=88=99nod=
emask=E7=8A=B6=E6=80=81=E4=B8=8D=E6=94=B9=E5=8F=98=E3=80=82
> +
> +- status_change_nid_high=E6=98=AF=E5=BD=93nodemask=E7=9A=84N_HIGH_MEMORY=
=E8=A2=AB=E8=AE=BE=E7=BD=AE/=E6=B8=85=E9=99=A4=E6=97=B6=E8=AE=BE=E7=BD=AE=
=E7=9A=84=E8=8A=82=E7=82=B9
> +  id=EF=BC=8C=E5=A6=82=E6=9E=9C=E8=BF=99=E4=B8=AA=E5=80=BC=E4=B8=BA-1=EF=
=BC=8C=E9=82=A3=E4=B9=88nodemask=E7=8A=B6=E6=80=81=E4=B8=8D=E4=BC=9A=E6=94=
=B9=E5=8F=98=E3=80=82
> +
> +- status_change_nid=E6=98=AF=E5=BD=93nodemask=E7=9A=84N_MEMORY=E8=A2=AB=
=EF=BC=88=E5=B0=86=EF=BC=89=E8=AE=BE=E7=BD=AE/=E6=B8=85=E9=99=A4=E6=97=B6=
=E8=AE=BE=E7=BD=AE=E7=9A=84=E8=8A=82=E7=82=B9id=E3=80=82=E8=BF=99
> +  =E6=84=8F=E5=91=B3=E7=9D=80=E4=B8=80=E4=B8=AA=E6=96=B0=E7=9A=84=EF=BC=
=88=E6=97=A0=E8=AE=B0=E5=BF=86=E7=9A=84=EF=BC=89=E8=8A=82=E7=82=B9=E9=80=9A=
=E8=BF=87=E8=81=94=E6=9C=BA=E8=8E=B7=E5=BE=97=E6=96=B0=E7=9A=84=E5=86=85=E5=
=AD=98=EF=BC=8C=E8=80=8C=E4=B8=80=E4=B8=AA=E8=8A=82=E7=82=B9=E5=A4=B1=E5=8E=
=BB=E4=BA=86=E6=89=80=E6=9C=89=E7=9A=84=E5=86=85
                                       ^^^^
                                       =E4=B8=8A=E7=BA=BF =EF=BC=9F

> +  =E5=AD=98=E3=80=82=E5=A6=82=E6=9E=9C=E8=BF=99=E4=B8=AA=E5=80=BC=E4=B8=
=BA-1=EF=BC=8C=E9=82=A3=E4=B9=88nodemask=E7=9A=84=E7=8A=B6=E6=80=81=E5=B0=
=B1=E4=B8=8D=E4=BC=9A=E6=94=B9=E5=8F=98=E3=80=82
> +
> +  =E5=A6=82=E6=9E=9C status_changed_nid* >=3D 0=EF=BC=8C=E5=9B=9E=E8=B0=
=83=E5=BA=94=E8=AF=A5=E5=9C=A8=E5=BF=85=E8=A6=81=E6=97=B6=E4=B8=BA=E8=8A=82=
=E7=82=B9=E5=88=9B=E5=BB=BA/=E4=B8=A2=E5=BC=83=E7=BB=93=E6=9E=84=E4=BD=93=
=E3=80=82
> +
> +=E5=9B=9E=E8=B0=83=E4=BE=8B=E7=A8=8B=E5=BA=94=E8=BF=94=E5=9B=9E ``includ=
e/linux/notifier.h`` =E4=B8=AD=E5=AE=9A=E4=B9=89=E7=9A=84NOTIFY_DONE, NOTIF=
Y_OK,

s/=E4=BE=8B=E7=A8=8B/=E7=A8=8B=E5=BA=8F/

> +NOTIFY_BAD, NOTIFY_STOP=E4=B8=AD=E7=9A=84=E4=B8=80=E4=B8=AA=E5=80=BC=E3=
=80=82
> +
> +NOTIFY_DONE=E5=92=8CNOTIFY_OK=E5=AF=B9=E8=BF=9B=E4=B8=80=E6=AD=A5=E5=A4=
=84=E7=90=86=E6=B2=A1=E6=9C=89=E5=BD=B1=E5=93=8D=E3=80=82
> +
> +NOTIFY_BAD=E6=98=AF=E4=BD=9C=E4=B8=BA=E5=AF=B9MEM_GOING_ONLINE=E3=80=81M=
EM_GOING_OFFLINE=E3=80=81MEM_ONLINE=E6=88=96MEM_OFFLINE
> +=E5=8A=A8=E4=BD=9C=E7=9A=84=E5=9B=9E=E5=BA=94=EF=BC=8C=E7=94=A8=E4=BA=8E=
=E5=8F=96=E6=B6=88=E7=83=AD=E6=8F=92=E6=8B=94=E3=80=82=E5=AE=83=E5=81=9C=E6=
=AD=A2=E5=AF=B9=E9=80=9A=E7=9F=A5=E9=98=9F=E5=88=97=E7=9A=84=E8=BF=9B=E4=B8=
=80=E6=AD=A5=E5=A4=84=E7=90=86=E3=80=82
> +
> +NOTIFY_STOP=E5=81=9C=E6=AD=A2=E5=AF=B9=E9=80=9A=E7=9F=A5=E9=98=9F=E5=88=
=97=E7=9A=84=E8=BF=9B=E4=B8=80=E6=AD=A5=E5=A4=84=E7=90=86=E3=80=82
> +
> +=E5=86=85=E9=83=A8=E9=94=81
> +=3D=3D=3D=3D=3D=3D
> +
> +=E5=BD=93=E6=B7=BB=E5=8A=A0/=E5=88=A0=E9=99=A4=E4=BD=BF=E7=94=A8=E5=86=
=85=E5=AD=98=E5=9D=97=E8=AE=BE=E5=A4=87=EF=BC=88=E5=8D=B3=E6=99=AE=E9=80=9A=
RAM=EF=BC=89=E7=9A=84=E5=86=85=E5=AD=98=E6=97=B6=EF=BC=8Cdevice_hotplug_loc=
k=E5=BA=94=E8=AF=A5=E8=A2=AB=E4=BF=9D=E6=8C=81
> +=E4=B8=BA:
> +
> +- =E9=92=88=E5=AF=B9=E5=9C=A8=E7=BA=BF/=E7=A6=BB=E7=BA=BF=E8=AF=B7=E6=B1=
=82=E8=BF=9B=E8=A1=8C=E5=90=8C=E6=AD=A5=EF=BC=88=E4=BE=8B=E5=A6=82=EF=BC=8C=
=E9=80=9A=E8=BF=87sysfs=EF=BC=89=E3=80=82=E8=BF=99=E6=A0=B7=E4=B8=80=E6=9D=
=A5=EF=BC=8C=E5=86=85=E5=AD=98=E5=9D=97=E8=AE=BE=E5=A4=87=E5=8F=AA=E6=9C=89=
=E5=9C=A8=E5=86=85=E5=AD=98
> +  =E8=A2=AB=E5=AE=8C=E5=85=A8=E6=B7=BB=E5=8A=A0=E5=90=8E=E6=89=8D=E8=83=
=BD=E8=A2=AB=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=AE=BF=E9=97=AE=EF=BC=88=
=2Eonline/.state=E5=B1=9E=E6=80=A7=EF=BC=89=E3=80=82=E8=80=8C=E5=9C=A8=E5=
=88=A0=E9=99=A4=E5=86=85=E5=AD=98=E6=97=B6=EF=BC=8C=E6=88=91=E4=BB=AC=E7=9F=
=A5
> +  =E9=81=93=E6=B2=A1=E6=9C=89=E4=BA=BA=E5=9C=A8=E5=85=B3=E9=94=AE=E9=83=
=A8=E5=88=86=E3=80=82

s/=E5=85=B3=E9=94=AE=E9=83=A8=E5=88=86/=E4=B8=B4=E7=95=8C=E5=8C=BA/

> +
> +- =E4=B8=8ECPU=E7=83=AD=E6=8F=92=E6=8B=94=E5=92=8C=E7=B1=BB=E4=BC=BC=E7=
=9A=84=E5=90=8C=E6=AD=A5=EF=BC=88=E4=BE=8B=E5=A6=82=EF=BC=8C=E4=B8=8EACPI=
=E5=92=8CPPC=E6=9C=89=E5=85=B3=EF=BC=89

=E4=B8=8ECPU=E7=83=AD=E6=8B=94=E6=8F=92=E6=88=96=E7=B1=BB=E4=BC=BC=E6=93=8D=
=E4=BD=9C=E5=90=8C=E6=AD=A5=EF=BC=88=E4=BE=8B=E5=A6=82ACPI=E5=92=8CPPC=E7=
=9B=B8=E5=85=B3=E6=93=8D=E4=BD=9C=EF=BC=89

> +
> +=E7=89=B9=E5=88=AB=E6=98=AF=EF=BC=8C=E5=9C=A8=E6=B7=BB=E5=8A=A0=E5=86=85=
=E5=AD=98=E5=92=8C=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E8=AF=95=E5=9B=BE=E4=
=BB=A5=E6=AF=94=E9=A2=84=E6=9C=9F=E6=9B=B4=E5=BF=AB=E7=9A=84=E9=80=9F=E5=BA=
=A6=E8=81=94=E6=9C=BA=E8=AF=A5=E5=86=85=E5=AD=98=E6=97=B6=EF=BC=8C=E6=9C=89=
=E5=8F=AF=E8=83=BD=E5=87=BA=E7=8E=B0=E9=94=81=E5=8F=8D=E8=BD=AC=EF=BC=8C
                                                     ^^^^

> +=E4=BD=BF=E7=94=A8device_hotplug_lock=E5=8F=AF=E4=BB=A5=E9=81=BF=E5=85=
=8D=E3=80=82:

remove =E3=80=82
=E5=8F=AF=E4=BB=A5=E9=81=BF=E5=85=8D=E6=AD=A4=E6=83=85=E5=86=B5

> +
> +- device_online()=E5=B0=86=E9=A6=96=E5=85=88=E6=8E=A5=E5=8F=97device_loc=
k()=EF=BC=8C=E7=84=B6=E5=90=8E=E6=98=AFmem_hotplug_lock=E3=80=82
> +
> +- add_memory_resource()=E5=B0=86=E9=A6=96=E5=85=88=E4=BD=BF=E7=94=A8mem_=
hotplug_lock=EF=BC=8C=E7=84=B6=E5=90=8E=E6=98=AFdevice_lock()=EF=BC=88=E5=
=9C=A8=E5=88=9B
> +  =E5=BB=BA=E8=AE=BE=E5=A4=87=E6=97=B6=EF=BC=8C=E5=9C=A8bus_add_device()=
=E6=9C=9F=E9=97=B4=EF=BC=89=E3=80=82
> +
> +=E7=94=B1=E4=BA=8E=E5=9C=A8=E4=BD=BF=E7=94=A8device_lock()=E4=B9=8B=E5=
=89=8D=EF=BC=8C=E8=AE=BE=E5=A4=87=E5=AF=B9=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=
=B4=E6=98=AF=E5=8F=AF=E8=A7=81=E7=9A=84=EF=BC=8C=E8=BF=99=E5=8F=AF=E8=83=BD=
=E5=AF=BC=E8=87=B4=E9=94=81=E7=9A=84=E5=8F=8D=E8=BD=AC=E3=80=82
> +
> +=E5=86=85=E5=AD=98=E7=9A=84=E4=B8=8A=E7=BA=BF/=E4=B8=8B=E7=BA=BF=E5=BA=
=94=E8=AF=A5=E9=80=9A=E8=BF=87device_online()/device_offline()=E5=AE=8C=E6=
=88=90--=E4=BB=A5=E7=A1=AE=E4=BF=9D=E5=AE=83=E4=B8=8E=E9=80=9A=E8=BF=87
                                                              ^^
=E2=80=94=E2=80=94

> +sysfs=E8=BF=9B=E8=A1=8C=E7=9A=84=E6=93=8D=E4=BD=9C=E6=AD=A3=E7=A1=AE=E5=
=90=8C=E6=AD=A5=E3=80=82=E5=BB=BA=E8=AE=AE=E6=8C=81=E6=9C=89device_hotplug_=
lock=EF=BC=88=E4=BE=8B=E5=A6=82=EF=BC=8C=E4=BF=9D=E6=8A=A4online_type=EF=BC=
=89=E3=80=82
> +
> +=E5=BD=93=E6=B7=BB=E5=8A=A0/=E5=88=A0=E9=99=A4/=E4=B8=8A=E7=BA=BF/=E4=B8=
=8B=E7=BA=BF=E5=86=85=E5=AD=98=E6=88=96=E6=B7=BB=E5=8A=A0/=E5=88=A0=E9=99=
=A4=E5=BC=82=E6=9E=84/=E8=AE=BE=E5=A4=87=E5=86=85=E5=AD=98=E6=97=B6=EF=BC=
=8C=E6=88=91=E4=BB=AC=E5=BA=94=E8=AF=A5=E5=A7=8B=E7=BB=88=E6=8C=81=E6=9C=89=
=E5=86=99=E6=A8=A1=E5=BC=8F=E7=9A=84
                            |         |        |
=E6=88=96=E8=80=85=E6=B7=BB=E5=8A=A0/=E5=88=A0=E9=99=A4=E5=BC=82=E6=9E=84=
=E6=88=96=E8=AE=BE=E5=A4=87=E5=86=85=E5=AD=98

> +mem_hotplug_lock=EF=BC=8C=E4=BB=A5=E5=BA=8F=E5=88=97=E5=8C=96=E5=86=85=
=E5=AD=98=E7=83=AD=E6=8F=92=E6=8B=94=EF=BC=88=E4=BE=8B=E5=A6=82=E8=AE=BF=E9=
=97=AE=E5=85=A8=E5=B1=80/=E5=8C=BA=E5=9F=9F=E5=8F=98=E9=87=8F=EF=BC=89=E3=
=80=82
> +
> +=E6=AD=A4=E5=A4=96=EF=BC=8Cmem_hotplug_lock=EF=BC=88=E4=B8=8Edevice_hotp=
lug_lock=E7=9B=B8=E5=8F=8D=EF=BC=89=E5=9C=A8=E8=AF=BB=E5=8F=96=E6=A8=A1=E5=
=BC=8F=E4=B8=8B=E5=85=81=E8=AE=B8=E4=B8=80=E4=B8=AA=E7=9B=B8=E5=BD=93
> +=E6=9C=89=E6=95=88=E7=9A=84get_online_mems/put_online_mems=E5=AE=9E=E7=
=8E=B0=EF=BC=8C=E6=89=80=E4=BB=A5=E8=AE=BF=E9=97=AE=E5=86=85=E5=AD=98=E7=9A=
=84=E4=BB=A3=E7=A0=81=E5=8F=AF=E4=BB=A5=E9=98=B2=E6=AD=A2=E8=AF=A5=E5=86=85=
=E5=AD=98
> +=E6=B6=88=E5=A4=B1=E3=80=82
> --=20
> 2.27.0

Thanks,
        Wu X.C.

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDK/lcACgkQtlsoEiKC
sIU6xQwA0HkL49OQNFlaFExGKS3L/0O2ygSFDBBysVfD9lnQrFMI8PaEEU2NG38a
QRaHRgcwn0DyhsNCoIethuSTD0IkBp3xfhtnleu1z4DoHFiIJpi3JEuYYPTPNAsJ
YplTpZxXdZWKFEh6JDAp9Rg4qrBg6dggJo18NjcBBNNpkHkMby0UpZi4T3TCbgLQ
g7BK0gk7BYb8B3iySpHopjUDSjd2zt/oc7+vhSZ9CwYoAi8t+ncASLOuhIYuLl5f
D89BYM2RLdnedO4VG5nnm29Un68wShtJTnRnJjwTc8xNBYwPfMDKPgMy+UO8A0ER
74d5eIZGUX0KoNf+ViXZYBO0kDaSIMHkaxl12j2EhoF2/zn2MTPMhtyXfC61cam7
Ev9zMf3yxTbDVu7vO5AI5TthHSJ5HJeZ6ihpTIn6hS8l7sGOQGuNQy6G7ST8jfnz
zQPjhQUUS87pJGlX4nG0+pWTS9zl6RC5djW7ggxeuHxySIyZ3bi57RhvGmFXdoMd
9g5ZdGVo
=YXd1
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--

