Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67F51C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 13:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CF4F6135F
	for <linux-doc@archiver.kernel.org>; Wed, 19 May 2021 13:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346769AbhESNVm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 May 2021 09:21:42 -0400
Received: from m32-153.88.com ([43.250.32.153]:29803 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1346736AbhESNVk (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 May 2021 09:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=h7SIhmeY4PiwqFpuJBo7v+nXA60hLLCwOOe2V
        J9IGik=; b=YSjBon/HC4rtVa2k7qQvyg46nQ8q9db4gcjEaKssNizPRxURsELCS
        0fdrglYXPLaNqszvuAofL/IpZF9FflgVGLkfBmX5vIdfp9qwL0VpLD1mxH730VF7
        uuxSekNWWmOuVOEPK+IFDo0Ty6/F6jXK08bfH3u3JgL38uMgcW9EAY=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHV1mIEKVg8VU7AA--.19191S2;
        Wed, 19 May 2021 21:20:10 +0800 (CST)
Date:   Wed, 19 May 2021 21:20:08 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 1/2] docs/zh_CN:add core-api refcount-vs-atomic.rst
 translation.
Message-ID: <20210519132008.GA15316@bobwxc.top>
References: <cover.1621255695.git.siyanteng@loongson.cn>
 <41587be482017c99ac57d1650b3cdfc2e77b7a84.1621255695.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <41587be482017c99ac57d1650b3cdfc2e77b7a84.1621255695.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHV1mIEKVg8VU7AA--.19191S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww43Gr1UXr47AFWxCFWruFg_yoWfuw4kpr
        ZIvr93Ga1aga45Zr1kW34jqw1xCa18CFZrKw4xAFyfAr1xZ3sxJw48KFyfXrWUWrykArW8
        Zr43ur4jkr47Za7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvjxUjDGYDUUUU
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 18, 2021 at 11:08:51AM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/refcount-vs-atomic.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   3 +-
>  .../zh_CN/core-api/refcount-vs-atomic.rst     | 154 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/refcount-vs=
-atomic.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index f1fa71e45c77..8f0b3fe8723d 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -58,10 +58,11 @@ Linux=E5=A6=82=E4=BD=95=E8=AE=A9=E4=B8=80=E5=88=87=E5=
=90=8C=E6=97=B6=E5=8F=91=E7=94=9F=E3=80=82 =E8=AF=A6=E6=83=85=E8=AF=B7=E5=
=8F=82=E9=98=85
>     :maxdepth: 1
> =20
>     irq/index
> +   refcount-vs-atomic
> +
> =20
>  Todolist:
> =20
> -   refcount-vs-atomic
>     local_ops
>     padata
>     ../RCU/index
> diff --git a/Documentation/translations/zh_CN/core-api/refcount-vs-atomic=
=2Erst b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
> new file mode 100644
> index 000000000000..dabe0c1dae9a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/refcount-vs-atomic.rst
> @@ -0,0 +1,154 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/refcount-vs-atomic.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_refcount-vs-atomic:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E4=B8=8Eatomic_t=E7=9B=B8=E6=AF=94=EF=BC=8Crefcount_t=E7=9A=84API=E6=98=
=AF=E8=BF=99=E6=A0=B7=E7=9A=84
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. contents:: :local:
> +
> +=E7=AE=80=E4=BB=8B
> +=3D=3D=3D=3D
> +
> +refcount_t API=E7=9A=84=E7=9B=AE=E6=A0=87=E6=98=AF=E4=B8=BA=E5=AE=9E=E7=
=8E=B0=E5=AF=B9=E8=B1=A1=E7=9A=84=E5=BC=95=E7=94=A8=E8=AE=A1=E6=95=B0=E5=99=
=A8=E6=8F=90=E4=BE=9B=E4=B8=80=E4=B8=AA=E6=9C=80=E5=B0=8F=E7=9A=84API=E3=80=
=82=E8=99=BD=E7=84=B6=E6=9D=A5=E8=87=AA
> +lib/refcount.c=E7=9A=84=E7=8B=AC=E7=AB=8B=E4=BA=8E=E6=9E=B6=E6=9E=84=E7=
=9A=84=E9=80=9A=E7=94=A8=E5=AE=9E=E7=8E=B0=E5=9C=A8=E4=B8=8B=E9=9D=A2=E4=BD=
=BF=E7=94=A8=E4=BA=86=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=EF=BC=8C=E4=BD=86=
=E4=B8=80=E4=BA=9B ``refcount_*()``
> +=E5=92=8C ``atomic_*()`` =E5=87=BD=E6=95=B0=E5=9C=A8=E5=86=85=E5=AD=98=
=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E6=96=B9=E9=9D=A2=E6=9C=89=E5=BE=88=E5=
=A4=9A=E4=B8=8D=E5=90=8C=E3=80=82=E6=9C=AC=E6=96=87=E6=A1=A3=E6=A6=82=E8=BF=
=B0=E4=BA=86=E8=BF=99=E4=BA=9B=E5=B7=AE=E5=BC=82=EF=BC=8C=E5=B9=B6
> +=E6=8F=90=E4=BE=9B=E4=BA=86=E7=9B=B8=E5=BA=94=E7=9A=84=E4=BE=8B=E5=AD=90=
=EF=BC=8C=E4=BB=A5=E5=B8=AE=E5=8A=A9=E5=BC=80=E5=8F=91=E8=80=85=E6=A0=B9=E6=
=8D=AE=E8=BF=99=E4=BA=9B=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=
=81=E7=9A=84=E5=8F=98=E5=8C=96=E6=9D=A5=E9=AA=8C=E8=AF=81=E4=BB=96=E4=BB=AC=
=E7=9A=84=E4=BB=A3=E7=A0=81=E3=80=82
> +
> +=E6=9C=AC=E6=96=87=E6=A1=A3=E4=B8=AD=E4=BD=BF=E7=94=A8=E7=9A=84=E6=9C=AF=
=E8=AF=AD=E5=B0=BD=E9=87=8F=E9=81=B5=E5=BE=AAtools/memory-model/Documentati=
on/explanation.txt
> +=E4=B8=AD=E5=AE=9A=E4=B9=89=E7=9A=84=E6=AD=A3=E5=BC=8FLKMM=E3=80=82
> +
> +memory-barriers.txt=E5=92=8Catomic_t.txt=E6=8F=90=E4=BE=9B=E4=BA=86=E6=
=9B=B4=E5=A4=9A=E5=85=B3=E4=BA=8E=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E7=9A=
=84=E8=83=8C=E6=99=AF=EF=BC=8C=E7=89=B9=E5=88=AB=E6=98=AF
> +=E5=AF=B9=E4=BA=8E=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E3=80=82

=E8=83=8C=E6=99=AF=EF=BC=8C=E5=8C=85=E6=8B=AC=E9=80=9A=E7=94=A8=E7=9A=84=E5=
=92=8C=E9=92=88=E5=AF=B9=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E7=9A=84=E3=80=
=82

> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E7=9A=84=E7=9B=B8=E5=85=B3=E7=B1=BB=
=E5=9E=8B
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. note:: =E4=B8=8B=E9=9D=A2=E7=9A=84=E9=83=A8=E5=88=86=E5=8F=AA=E6=B6=
=B5=E7=9B=96=E4=BA=86=E4=B8=8E=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E5=92=8C=
=E5=BC=95=E7=94=A8=E8=AE=A1=E6=95=B0=E5=99=A8=E6=9C=89=E5=85=B3=E7=9A=84=E4=
=B8=80=E4=BA=9B=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E7=B1=BB=E5=9E=8B=EF=BC=
=8C=E5=B9=B6
> +   =E9=80=9A=E8=BF=87=E6=9C=AC=E6=96=87=E6=A1=A3=E4=BD=BF=E7=94=A8=E3=80=
=82=E5=A6=82=E6=9E=9C=E6=83=B3=E4=BA=86=E8=A7=A3=E6=9B=B4=E5=B9=BF=E6=B3=9B=
=E7=9A=84=E6=83=85=E5=86=B5=EF=BC=8C=E8=AF=B7=E6=9F=A5=E9=98=85memory-barri=
ers.txt=E6=96=87=E4=BB=B6=E3=80=82

=E5=8F=AA=E6=B6=B5=E7=9B=96=E4=BA=86=E6=9C=AC=E6=96=87=E4=BD=BF=E7=94=A8=E7=
=9A=84=E4=B8=8E=E5=8E=9F=E5=AD=90=E6=93=8D=E4=BD=9C=E5=92=8C=E5=BC=95=E7=94=
=A8=E8=AE=A1=E6=95=B0=E5=99=A8=E6=9C=89=E5=85=B3=E7=9A=84=E4=B8=80=E4=BA=9B=
=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E7=B1=BB=E5=9E=8B=E3=80=82

> +
> +=E5=9C=A8=E6=B2=A1=E6=9C=89=E4=BB=BB=E4=BD=95=E5=86=85=E5=AD=98=E9=A1=BA=
=E5=BA=8F=E4=BF=9D=E8=AF=81=E7=9A=84=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=88=E5=
=8D=B3=E5=AE=8C=E5=85=A8=E6=97=A0=E5=BA=8F=EF=BC=89=EF=BC=8Catomics & refco=
unters=E5=8F=AA=E6=8F=90=E4=BE=9B=E5=8E=9F

atomics & refcounters=E6=98=AF=E5=90=A6=E7=BF=BB=E8=AF=91=E8=AF=B7=E7=BB=9F=
=E4=B8=80

> +=E5=AD=90=E6=80=A7=E5=92=8C=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=EF=BC=88=
po=EF=BC=89=E5=85=B3=E7=B3=BB=EF=BC=88=E5=9C=A8=E5=90=8C=E4=B8=80=E4=B8=AAC=
PU=E4=B8=8A=EF=BC=89=E3=80=82=E5=AE=83=E4=BF=9D=E8=AF=81=E6=AF=8F=E4=B8=AA =
``atomic_* ()`` =E5=92=8C ``refcount_*()``

=EF=BC=88program order, po=EF=BC=89

> +=E6=93=8D=E4=BD=9C=E9=83=BD=E6=98=AF=E5=8E=9F=E5=AD=90=E6=80=A7=E7=9A=84=
=EF=BC=8C=E6=8C=87=E4=BB=A4=E5=9C=A8=E5=8D=95=E4=B8=AACPU=E4=B8=8A=E6=8C=89=
=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=E6=89=A7=E8=A1=8C=E3=80=82=E8=BF=99=E6=
=98=AF=E7=94=A8READ_ONCE()/WRITE_ONCE()
> +=E5=92=8C=E6=AF=94=E8=BE=83=E2=80=94=E2=80=94=E4=BA=A4=E6=8D=A2=E5=8E=9F=
=E8=AF=AD=E5=AE=9E=E7=8E=B0=E7=9A=84=E3=80=82

=E6=AF=94=E8=BE=83=E5=B9=B6=E4=BA=A4=E6=8D=A2=EF=BC=9F

> +
> +=E5=BC=BA=EF=BC=88=E5=85=A8=EF=BC=89=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=
=E4=BF=9D=E8=AF=81=E5=9C=A8=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=89=80=
=E6=9C=89=E5=85=88=E5=89=8D=E7=9A=84=E5=8A=A0=E8=BD=BD=E5=92=8C=E5=AD=98=E5=
=82=A8=EF=BC=88=E6=89=80=E6=9C=89po-earlier=E6=8C=87=E4=BB=A4=EF=BC=89=E5=
=9C=A8

=EF=BC=88=E5=AE=8C=E5=85=A8=EF=BC=89

> +=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E6=89=A7=E8=A1=8C=E4=BB=BB=E4=BD=95po-lat=
er=E6=8C=87=E4=BB=A4=E4=B9=8B=E5=89=8D=E5=AE=8C=E6=88=90=E3=80=82=E5=AE=83=
=E8=BF=98=E4=BF=9D=E8=AF=81=E5=9C=A8=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=
=E6=89=80=E6=9C=89po-earlier=E5=AD=98
> +=E5=82=A8=E5=92=8C=E6=9D=A5=E8=87=AA=E5=85=B6=E4=BB=96CPU=E7=9A=84=E6=89=
=80=E6=9C=89=E4=BC=A0=E6=92=AD=E7=9A=84=E5=AD=98=E5=82=A8=E5=BF=85=E9=A1=BB=
=E5=9C=A8=E5=8E=9FCPU=E4=B8=8A=E6=89=A7=E8=A1=8C=E4=BB=BB=E4=BD=95po-later=
=E6=8C=87=E4=BB=A4=E4=B9=8B=E5=89=8D=E4=BC=A0=E6=92=AD=E5=88=B0=E6=89=80=E6=
=9C=89
> +=E5=85=B6=E4=BB=96CPU=EF=BC=88A-=E7=B4=AF=E7=A7=AF=E5=B1=9E=E6=80=A7=EF=
=BC=89=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8smp_mb()=E5=AE=9E=E7=8E=B0=E7=9A=
=84=E3=80=82

maybe
=E5=BC=BA=EF=BC=88=E5=AE=8C=E5=85=A8=EF=BC=89=E5=86=85=E5=AD=98=E9=A1=BA=E5=
=BA=8F=E4=BF=9D=E8=AF=81=E5=9C=A8=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=
=89=80=E6=9C=89=E8=BE=83=E6=97=A9=E5=8A=A0=E8=BD=BD=E5=92=8C=E5=AD=98=E5=82=
=A8=E7=9A=84=E6=8C=87=E4=BB=A4=EF=BC=88=E6=89=80=E6=9C=89=E7=A8=8B=E5=BA=8F=
=E9=A1=BA=E5=BA=8F=E8=BE=83=E6=97=A9
[po-earlier]=E6=8C=87=E4=BB=A4=EF=BC=89=E5=9C=A8=E6=89=A7=E8=A1=8C=E4=BB=BB=
=E4=BD=95=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=E8=BE=83=E5=90=8E=E6=8C=87=E4=
=BB=A4=EF=BC=88po-later=EF=BC=89=E4=B9=8B=E5=89=8D=E5=AE=8C=E6=88=90=E3=80=
=82=E5=AE=83=E8=BF=98=E4=BF=9D=E8=AF=81
=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E5=82=A8=E5=AD=98=E7=9A=84=E7=A8=8B=E5=BA=8F=
=E4=BC=98=E5=85=88=E8=BE=83=E6=97=A9=E7=9A=84=E6=8C=87=E4=BB=A4=E5=92=8C=E6=
=9D=A5=E8=87=AA=E5=85=B6=E4=BB=96CPU=E4=BC=A0=E6=92=AD=E7=9A=84=E6=8C=87=E4=
=BB=A4=E5=BF=85=E9=A1=BB=E5=9C=A8=E8=AF=A5CPU=E6=89=A7=E8=A1=8C=E4=BB=BB=E4=
=BD=95
=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=E8=BE=83=E5=90=8E=E6=8C=87=E4=BB=A4=E4=
=B9=8B=E5=89=8D=E4=BC=A0=E6=92=AD=E5=88=B0=E5=85=B6=E4=BB=96CPU=EF=BC=88A-=
=E7=B4=AF=E7=A7=AF=E5=B1=9E=E6=80=A7=EF=BC=89=E3=80=82

> +
> +=E4=B8=80=E4=B8=AARELEASE=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=
=E8=AF=81=E4=BA=86=E5=9C=A8=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E6=89=80=E6=9C=89=
=E5=85=88=E5=89=8D=E7=9A=84=E5=8A=A0=E8=BD=BD=E5=92=8C=E5=AD=98=E5=82=A8=EF=
=BC=88=E6=89=80=E6=9C=89po-earlier=E6=8C=87=E4=BB=A4=EF=BC=89
> +=E5=9C=A8=E6=93=8D=E4=BD=9C=E5=89=8D=E5=AE=8C=E6=88=90=E3=80=82=E5=AE=83=
=E8=BF=98=E4=BF=9D=E8=AF=81=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=89=80=
=E6=9C=89po-earlier=E5=AD=98=E5=82=A8=E4=BB=A5=E5=8F=8A=E6=9D=A5=E8=87=AA=
=E5=85=B6=E4=BB=96CPU=E7=9A=84=E6=89=80=E6=9C=89=E4=BC=A0=E6=92=AD=E7=9A=84
> +=E5=AD=98=E5=82=A8=E5=BF=85=E9=A1=BB=E5=9C=A8=E9=87=8A=E6=94=BE=E6=93=8D=
=E4=BD=9C=E4=B9=8B=E5=89=8D=E4=BC=A0=E6=92=AD=E5=88=B0=E6=89=80=E6=9C=89=E5=
=85=B6=E4=BB=96CPU=EF=BC=88A-=E7=B4=AF=E7=A7=AF=E5=B1=9E=E6=80=A7=EF=BC=89=
=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8smp_store_release()
> +=E5=AE=9E=E7=8E=B0=E7=9A=84=E3=80=82

RELEASE=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E4=BA=86=E5=
=9C=A8=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E6=89=80=E6=9C=89=E8=BE=83=E6=97=A9=E5=
=8A=A0=E8=BD=BD=E5=92=8C=E5=AD=98=E5=82=A8=E7=9A=84=E6=8C=87=E4=BB=A4=EF=BC=
=88=E6=89=80=E6=9C=89=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=E8=BE=83=E6=97=A9
=E6=8C=87=E4=BB=A4=EF=BC=89=E5=9C=A8=E6=AD=A4=E6=93=8D=E4=BD=9C=E5=89=8D=E5=
=AE=8C=E6=88=90=E3=80=82=E5=AE=83=E8=BF=98=E4=BF=9D=E8=AF=81=E5=90=8C=E4=B8=
=80CPU=E4=B8=8A=E5=82=A8=E5=AD=98=E7=9A=84=E7=A8=8B=E5=BA=8F=E4=BC=98=E5=85=
=88=E8=BE=83=E6=97=A9=E7=9A=84=E6=8C=87=E4=BB=A4=E5=92=8C=E6=9D=A5=E8=87=AA=
=E5=85=B6=E4=BB=96CPU
=E4=BC=A0=E6=92=AD=E7=9A=84=E6=8C=87=E4=BB=A4=E5=BF=85=E9=A1=BB=E5=9C=A8=E9=
=87=8A=E6=94=BE=EF=BC=88release=EF=BC=89=E6=93=8D=E4=BD=9C=E4=B9=8B=E5=89=
=8D=E4=BC=A0=E6=92=AD=E5=88=B0=E6=89=80=E6=9C=89=E5=85=B6=E4=BB=96CPU=EF=BC=
=88A-=E7=B4=AF=E7=A7=AF=E5=B1=9E=E6=80=A7=EF=BC=89=E3=80=82=E8=BF=99=E6=98=
=AF=E7=94=A8
smp_store_release()=E5=AE=9E=E7=8E=B0=E7=9A=84=E3=80=82

> +
> +ACQUIRE=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E4=BA=86=
=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=89=80=E6=9C=89=E5=90=8E=E5=8A=A0=
=E8=BD=BD=E5=92=8C=E5=AD=98=E5=82=A8=EF=BC=88=E6=89=80=E6=9C=89po-later=E6=
=8C=87=E4=BB=A4=EF=BC=89=E5=9C=A8=E8=8E=B7=E5=8F=96=E6=93=8D=E4=BD=9C
> +=E4=B9=8B=E5=90=8E=E5=AE=8C=E6=88=90=E3=80=82=E5=AE=83=E8=BF=98=E4=BF=9D=
=E8=AF=81=E5=9C=A8=E8=8E=B7=E5=8F=96=E6=93=8D=E4=BD=9C=E6=89=A7=E8=A1=8C=E5=
=90=8E=EF=BC=8C=E5=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=89=80=E6=9C=89po-=
later=E5=AD=98=E5=82=A8=E5=BF=85=E9=A1=BB=E4=BC=A0=E6=92=AD=E5=88=B0=E6=89=
=80=E6=9C=89=E5=85=B6
> +=E4=BB=96CPU=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8smp_acquire__after_ctrl_=
dep()=E5=AE=9E=E7=8E=B0=E7=9A=84=E3=80=82

ACQUIRE=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E4=BA=86=E5=
=90=8C=E4=B8=80CPU=E4=B8=8A=E7=9A=84=E6=89=80=E6=9C=89=E5=90=8E=E5=8A=A0=E8=
=BD=BD=E5=92=8C=E5=AD=98=E5=82=A8=E7=9A=84=E6=8C=87=E4=BB=A4=EF=BC=88=E6=89=
=80=E6=9C=89=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=BA=8F=E8=BE=83=E5=90=8E
=E6=8C=87=E4=BB=A4=EF=BC=89=E5=9C=A8=E8=8E=B7=E5=8F=96=EF=BC=88acquire=EF=
=BC=89=E6=93=8D=E4=BD=9C=E4=B9=8B=E5=90=8E=E5=AE=8C=E6=88=90=E3=80=82=E5=AE=
=83=E8=BF=98=E4=BF=9D=E8=AF=81=E5=9C=A8=E8=8E=B7=E5=8F=96=E6=93=8D=E4=BD=9C=
=E6=89=A7=E8=A1=8C=E5=90=8E=EF=BC=8C=E5=90=8C=E4=B8=80CPU=E4=B8=8A
=E5=82=A8=E5=AD=98=E7=9A=84=E6=89=80=E6=9C=89=E7=A8=8B=E5=BA=8F=E9=A1=BA=E5=
=BA=8F=E8=BE=83=E5=90=8E=E6=8C=87=E4=BB=A4=E5=BF=85=E9=A1=BB=E4=BC=A0=E6=92=
=AD=E5=88=B0=E6=89=80=E6=9C=89=E5=85=B6=E4=BB=96CPU=E3=80=82=E8=BF=99=E6=98=
=AF=E7=94=A8
smp_acquire__after_ctrl_dep()=E5=AE=9E=E7=8E=B0=E7=9A=84=E3=80=82

> +
> +=E5=AF=B9Refcounters=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BE=9D=E8=B5=96=EF=BC=
=88=E5=8F=96=E5=86=B3=E4=BA=8E=E6=88=90=E5=8A=9F=EF=BC=89=E4=BF=9D=E8=AF=81=
=E4=BA=86=E5=A6=82=E6=9E=9C=E4=B8=80=E4=B8=AA=E5=AF=B9=E8=B1=A1=E7=9A=84=E5=
=BC=95=E7=94=A8=E8=A2=AB=E6=88=90=E5=8A=9F=E8=8E=B7=E5=BE=97=EF=BC=88=E5=BC=
=95=E7=94=A8=E8=AE=A1=E6=95=B0
> +=E5=99=A8=E7=9A=84=E5=A2=9E=E9=87=8F=E6=88=96=E5=A2=9E=E5=8A=A0=E8=A1=8C=
=E4=B8=BA=E5=8F=91=E7=94=9F=E4=BA=86=EF=BC=8C=E5=87=BD=E6=95=B0=E8=BF=94=E5=
=9B=9Etrue=EF=BC=89=EF=BC=8C=E9=82=A3=E4=B9=88=E8=BF=9B=E4=B8=80=E6=AD=A5=
=E7=9A=84=E5=AD=98=E5=82=A8=E6=98=AF=E9=92=88=E5=AF=B9=E8=BF=99=E4=B8=AA=E6=
=93=8D=E4=BD=9C=E7=9A=84=E5=91=BD=E4=BB=A4=E3=80=82=E5=AF=B9=E5=AD=98
> +=E5=82=A8=E7=9A=84=E6=8E=A7=E5=88=B6=E4=BE=9D=E8=B5=96=E6=B2=A1=E6=9C=89=
=E4=BD=BF=E7=94=A8=E4=BB=BB=E4=BD=95=E6=98=8E=E7=A1=AE=E7=9A=84=E5=B1=8F=E9=
=9A=9C=E6=9D=A5=E5=AE=9E=E7=8E=B0=EF=BC=8C=E8=80=8C=E6=98=AF=E4=BE=9D=E8=B5=
=96=E4=BA=8ECPU=E4=B8=8D=E5=AF=B9=E5=AD=98=E5=82=A8=E8=BF=9B=E8=A1=8C=E7=8C=
=9C=E6=B5=8B=E3=80=82=E8=BF=99=E5=8F=AA=E6=98=AF
> +=E4=B8=80=E4=B8=AA=E5=8D=95=E4=B8=80=E7=9A=84CPU=E5=85=B3=E7=B3=BB=EF=BC=
=8C=E5=AF=B9=E5=85=B6=E4=BB=96CPU=E4=B8=8D=E6=8F=90=E4=BE=9B=E4=BB=BB=E4=BD=
=95=E4=BF=9D=E8=AF=81=E3=80=82
> +
> +
> +=E5=87=BD=E6=95=B0=E7=9A=84=E6=AF=94=E8=BE=83
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E6=83=85=E5=86=B51=EF=BC=89 - =E9=9D=9E "=E8=AF=BB/=E4=BF=AE=E6=94=B9/=
=E5=86=99"=EF=BC=88RMW=EF=BC=89=E6=93=8D=E4=BD=9C

=E2=80=9C=E2=80=9D

> +------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_set() --> refcount_set()
> + * atomic_read() --> refcount_read()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * none (=E4=B8=A4=E8=80=85=E9=83=BD=E6=98=AF=E5=AE=8C=E5=85=A8=E6=97=A0=
=E5=BA=8F=E7=9A=84)
> +
> +
> +=E6=83=85=E5=86=B52=EF=BC=89 - =E5=9F=BA=E4=BA=8E=E5=A2=9E=E9=87=8F=E7=
=9A=84=E6=93=8D=E4=BD=9C=EF=BC=8C=E4=B8=8D=E8=BF=94=E5=9B=9E=E4=BB=BB=E4=BD=
=95=E5=80=BC
> +--------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_inc() --> refcount_inc()
> + * atomic_add() --> refcount_add()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * none (=E4=B8=A4=E8=80=85=E9=83=BD=E6=98=AF=E5=AE=8C=E5=85=A8=E6=97=A0=
=E5=BA=8F=E7=9A=84)
> +
> +=E6=83=85=E5=86=B53=EF=BC=89 - =E5=9F=BA=E4=BA=8E=E9=80=92=E5=87=8F=E7=
=9A=84RMW=E6=93=8D=E4=BD=9C=EF=BC=8C=E6=B2=A1=E6=9C=89=E8=BF=94=E5=9B=9E=E5=
=80=BC
> +---------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_dec() --> refcount_dec()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * =E5=AE=8C=E5=85=A8=E6=97=A0=E5=BA=8F=E7=9A=84 --> RELEASE=E9=A1=BA=E5=
=BA=8F
> +
> +
> +=E6=83=85=E5=86=B54=EF=BC=89 - =E5=9F=BA=E4=BA=8E=E5=A2=9E=E9=87=8F=E7=
=9A=84RMW=E6=93=8D=E4=BD=9C=EF=BC=8C=E8=BF=94=E5=9B=9E=E4=B8=80=E4=B8=AA=E5=
=80=BC
> +---------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_inc_not_zero() --> refcount_inc_not_zero()
> + * =E6=97=A0=E5=8E=9F=E5=AD=90=E6=80=A7=E5=AF=B9=E5=BA=94=E5=87=BD=E6=95=
=B0 --> refcount_add_not_zero()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * =E5=AE=8C=E5=85=A8=E6=9C=89=E5=BA=8F=E7=9A=84 --> =E6=8E=A7=E5=88=B6=
=E4=BE=9D=E8=B5=96=E4=BA=8E=E5=AD=98=E5=82=A8=E7=9A=84=E6=88=90=E5=8A=9F
> +
> +.. note:: =E6=88=91=E4=BB=AC=E7=9C=9F=E7=9A=84=E5=9C=A8=E8=BF=99=E9=87=
=8C=E5=81=87=E8=AE=BE=EF=BC=8C=E5=BF=85=E8=A6=81=E7=9A=84=E9=A1=BA=E5=BA=8F=
=E6=98=AF=E4=BD=9C=E4=B8=BA=E8=8E=B7=E5=BE=97=E5=AF=B9=E8=B1=A1=E6=8C=87=E9=
=92=88=E7=9A=84=E7=BB=93=E6=9E=9C=E8=80=8C=E6=8F=90=E4=BE=9B=E7=9A=84=E3=80=
=82
how about
=E6=AD=A4=E5=A4=84 **=E5=81=87=E8=AE=BE** =E4=BA=86=EF=BC=8C

really=E8=A1=A8=E5=BC=BA=E8=B0=83=E4=B8=8D=E5=A5=BD=E7=BF=BB=E8=AF=91

> +
> +
> +=E6=83=85=E5=86=B5 5=EF=BC=89 - =E5=9F=BA=E4=BA=8EDec/Sub=E9=80=92=E5=87=
=8F=E7=9A=84=E9=80=9A=E7=94=A8RMW=E6=93=8D=E4=BD=9C=EF=BC=8C=E8=BF=94=E5=9B=
=9E=E4=B8=80=E4=B8=AA=E5=80=BC
> +---------------------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_dec_and_test() --> refcount_dec_and_test()
> + * atomic_sub_and_test() --> refcount_sub_and_test()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * =E5=AE=8C=E5=85=A8=E6=9C=89=E5=BA=8F=E7=9A=84 --> RELEASE=E9=A1=BA=E5=
=BA=8F + =E6=88=90=E5=8A=9F=E5=90=8EACQUIRE=E9=A1=BA=E5=BA=8F
> +
> +
> +=E6=83=85=E5=86=B56=EF=BC=89=E5=85=B6=E4=BB=96=E5=9F=BA=E4=BA=8E=E9=80=
=92=E5=87=8F=E7=9A=84RMW=E6=93=8D=E4=BD=9C=EF=BC=8C=E8=BF=94=E5=9B=9E=E4=B8=
=80=E4=B8=AA=E5=80=BC
> +----------------------------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * =E6=97=A0=E5=8E=9F=E5=AD=90=E6=80=A7=E5=AF=B9=E5=BA=94=E5=87=BD=E6=95=
=B0 --> refcount_dec_if_one()
> + * ``atomic_add_unless(&var, -1, 1)`` --> ``refcount_dec_not_one(&var)``
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * =E5=AE=8C=E5=85=A8=E6=9C=89=E5=BA=8F=E7=9A=84 --> RELEASE=E9=A1=BA=E5=
=BA=8F + =E6=8E=A7=E5=88=B6=E4=BE=9D=E8=B5=96
> +
> +.. note:: atomic_add_unless()=E5=8F=AA=E5=9C=A8=E6=89=A7=E8=A1=8C=E6=88=
=90=E5=8A=9F=E6=97=B6=E6=8F=90=E4=BE=9B=E5=AE=8C=E6=95=B4=E7=9A=84=E9=A1=BA=
=E5=BA=8F=E3=80=82
> +
> +
> +=E6=83=85=E5=86=B57=EF=BC=89--=E5=9F=BA=E4=BA=8E=E9=94=81=E7=9A=84RMW
> +--------------------
> +
> +=E5=87=BD=E6=95=B0=E5=8F=98=E5=8C=96:
> +
> + * atomic_dec_and_lock() --> refcount_dec_and_lock()
> + * atomic_dec_and_mutex_lock() --> refcount_dec_and_mutex_lock()
> +
> +=E5=86=85=E5=AD=98=E9=A1=BA=E5=BA=8F=E4=BF=9D=E8=AF=81=E5=8F=98=E5=8C=96:
> +
> + * =E5=AE=8C=E5=85=A8=E6=9C=89=E5=BA=8F --> RELEASE=E9=A1=BA=E5=BA=8F + =
=E6=8E=A7=E5=88=B6=E4=BE=9D=E8=B5=96 + =E6=8C=81=E6=9C=89
> +   =E6=88=90=E5=8A=9F=E5=90=8Espin_lock()
> --=20
> 2.27.0

Thanks,

        Wu X.C.

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmClEIQACgkQtlsoEiKC
sIVHPwv/T+V4zfz1rabo2HBoFGjf65elgShuYx0NTXbnKev78tPk+HGznusnvk4F
3V3NKJa0Fz6xxJVO94FTt1RtA8ny5fG9OdZnboaJs/S79x8fVC6OKUE0p+tdI3rQ
AMgfZH7gQZVhwna2eBtHjc6kVYUyR+rw4xxIR506mi5zk1DRd88eRvj/i+w8zHri
LKgqKKt8j+icahbVA249mBwdKwo+Ully0ziVCeZGilVRj/U7a5SdktYg+5CYjXAi
fKXmk/yt6gm1BpbOkMhkdFRAp3K1VMDA+DtsUeDO40UFHkwVM3tQF0U7FtMcqmFz
gWl5TA26iI7olVbj80MD7GZuYK7nlXE6RR7G7XdSph7qTUaYlubLpJ1PqcigDLW+
YVVV3hyU0AM4F2af7NpMaDzN1YMRuQhMIueB1M5dbuNcdttZvzI0njsRkJ/tPzc8
Ufyv5zXmtTZ8QpW7V1eH6Q2HJgI4z6jQcRdVFlPUqC70jHpba/2CH3cLPWcdLrx8
2LBkJ6ho
=iUyx
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--

