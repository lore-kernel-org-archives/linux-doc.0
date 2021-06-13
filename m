Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E46C48BCF
	for <linux-doc@archiver.kernel.org>; Sun, 13 Jun 2021 11:47:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC45C61283
	for <linux-doc@archiver.kernel.org>; Sun, 13 Jun 2021 11:47:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231688AbhFMLtP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Jun 2021 07:49:15 -0400
Received: from [43.250.32.171] ([43.250.32.171]:60776 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231658AbhFMLtP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 13 Jun 2021 07:49:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=N2paUS4BsMB21y7mzDT3PyoMQUglF87ok3AZg
        j5Bz+I=; b=GpgMhUwrq8CwgLvzSrhg68pQQqHdOjIiR7lAnkAxAYRhsCdEh7E62
        tlySuaB7Q8HpLqntitdI99yk7439DZIyHsfuTY68EMbEZFdpyRV+cpBQujp0y/3k
        m5xSab3I0gaTkdBXQcn/q+WlZKFlTgO1uRNjDQUt9eQmcmhEZzneV4=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3EjYx8MVgRfoNAA--.29150S2;
        Sun, 13 Jun 2021 19:47:01 +0800 (CST)
Date:   Sun, 13 Jun 2021 19:46:56 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH 2/2] docs/zh_CN: add core api cpu_hotplug translation
Message-ID: <20210613114656.GA27230@bobwxc.top>
References: <cover.1623136676.git.siyanteng@loongson.cn>
 <254d2ecf0a9b4bb09f64a649fdc46f5153042a34.1623136676.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline
In-Reply-To: <254d2ecf0a9b4bb09f64a649fdc46f5153042a34.1623136676.git.siyanteng@loongson.cn>
X-today: Ah ha~
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgB3EjYx8MVgRfoNAA--.29150S2
X-Coremail-Antispam: 1UD129KBjvAXoWfGF1DWF4kJF15CFyDKw4Uurg_yoW8CFW7Co
        W3Zws0939rG3W3JasrA3y3Jr4jgw4jkF17Ars3Cr4j9Fy3WFnYkFWIyw47KFWrZFW5GF43
        JF1UJFy2gay3X3Zxn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUU5P7k0a2IF6w4xM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
        0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
        IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vE
        x4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262
        IYc4CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2
        j2WlYx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrw
        CF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY
        6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
        CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
        0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
        AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
        Ja73UjIFyTuYvjxUUPEfUUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 08, 2021 at 03:22:26PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/cpu_hotplug.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/cpu_hotplug.rst            | 347 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  2 files changed, 348 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotplug=
=2Erst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/=
Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> new file mode 100644
> index 000000000000..745eec87c050
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> @@ -0,0 +1,347 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/cpu_hotplug.rst
> +:=E7=BF=BB=E8=AF=91:
> +
> +=E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +*Proofreader's signature*
> +
> +.. _cn_core_api_cpu_hotplug:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=86=85=E6=A0=B8=E4=B8=AD=E7=9A=84CPU=E7=83=AD=E6=8B=94=E6=8F=92
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:=E6=97=B6=E9=97=B4: 2016=E5=B9=B412=E6=9C=88
> +:=E4=BD=9C=E8=80=85: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
> +          Rusty Russell <rusty@rustcorp.com.au>,
> +          Srivatsa Vaddagiri <vatsa@in.ibm.com>,
> +          Ashok Raj <ashok.raj@intel.com>,
> +          Joel Schopp <jschopp@austin.ibm.com>
> +
> +=E7=AE=80=E4=BB=8B
> +=3D=3D=3D=3D
> +
> +=E7=8E=B0=E4=BB=A3=E7=B3=BB=E7=BB=9F=E6=9E=B6=E6=9E=84=E7=9A=84=E6=BC=94=
=E8=BF=9B=E5=B7=B2=E7=BB=8F=E5=9C=A8=E5=A4=84=E7=90=86=E5=99=A8=E4=B8=AD=E5=
=BC=95=E5=85=A5=E4=BA=86=E5=85=88=E8=BF=9B=E7=9A=84=E9=94=99=E8=AF=AF=E6=8A=
=A5=E5=91=8A=E5=92=8C=E7=BA=A0=E6=AD=A3=E8=83=BD=E5=8A=9B=E3=80=82=E6=9C=89=
=E4=B8=80=E4=BA=9Boem=E4=B9=9F=E6=94=AF

OEM

> +=E6=8C=81NUMA=E7=A1=AC=E4=BB=B6=EF=BC=8C=E8=BF=99=E4=BA=9B=E7=A1=AC=E4=
=BB=B6=E4=B9=9F=E6=98=AF=E7=83=AD=E6=8F=92=E6=8B=94=E7=9A=84=EF=BC=8C=E5=85=
=B6=E4=B8=AD=E7=89=A9=E7=90=86=E8=8A=82=E7=82=B9=E7=9A=84=E6=8F=92=E5=85=A5=
=E5=92=8C=E7=A7=BB=E9=99=A4=E9=9C=80=E8=A6=81=E6=94=AF=E6=8C=81CPU=E7=83=AD=
=E6=8F=92=E6=8B=94=E3=80=82

=E4=B9=9F=E6=94=AF=E6=8C=81=E5=8F=AF=E7=83=AD=E6=8B=94=E6=8F=92=E7=9A=84NUM=
A=EF=BC=88Non Uniform Memory Access=EF=BC=8C=E9=9D=9E=E7=BB=9F=E4=B8=80=E5=
=86=85=E5=AD=98=E8=AE=BF=E9=97=AE=EF=BC=89=E7=A1=AC=E4=BB=B6

> +
> +=E8=BF=99=E6=A0=B7=E7=9A=84=E8=BF=9B=E6=AD=A5=E8=A6=81=E6=B1=82=E5=86=85=
=E6=A0=B8=E5=8F=AF=E7=94=A8=E7=9A=84CPU=E8=A2=AB=E7=A7=BB=E9=99=A4=EF=BC=8C=
=E8=A6=81=E4=B9=88=E6=98=AF=E5=87=BA=E4=BA=8E=E9=85=8D=E7=BD=AE=E7=9A=84=E5=
=8E=9F=E5=9B=A0=EF=BC=8C=E8=A6=81=E4=B9=88=E6=98=AF=E5=87=BA=E4=BA=8ERAS=E7=
=9A=84=E7=9B=AE=E7=9A=84=EF=BC=8C
> +=E4=BB=A5=E4=BF=9D=E6=8C=81=E4=B8=80=E4=B8=AA=E4=B8=8D=E9=9C=80=E8=A6=81=
=E7=9A=84CPU=E4=B8=8D=E5=9C=A8=E7=B3=BB=E7=BB=9F=E6=89=A7=E8=A1=8C=E8=B7=AF=
=E5=BE=84=E3=80=82=E5=9B=A0=E6=AD=A4=E9=9C=80=E8=A6=81=E5=9C=A8Linux=E5=86=
=85=E6=A0=B8=E4=B8=AD=E6=94=AF=E6=8C=81CPU=E7=83=AD=E6=8B=94=E6=8F=92=E3=80=
=82
> +
> +CPU=E7=83=AD=E6=8B=94=E6=8F=92=E6=94=AF=E6=8C=81=E7=9A=84=E4=B8=80=E4=B8=
=AA=E6=9B=B4=E6=96=B0=E9=A2=96=E7=9A=84=E7=94=A8=E9=80=94=E6=98=AF=E5=AE=83=
=E5=9C=A8SMP=E7=9A=84=E6=9A=82=E5=81=9C=E6=81=A2=E5=A4=8D=E6=94=AF=E6=8C=81=
=E4=B8=AD=E7=9A=84=E5=BA=94=E7=94=A8=E3=80=82=E5=8F=8C=E6=A0=B8=E5=92=8CHT=
=E6=94=AF

HT -> =E8=B6=85=E7=BA=BF=E7=A8=8B

> +=E6=8C=81=E4=BD=BF=E5=BE=97=E5=8D=B3=E4=BD=BF=E6=98=AF=E7=AC=94=E8=AE=B0=
=E6=9C=AC=E7=94=B5=E8=84=91=E4=B9=9F=E8=83=BD=E8=BF=90=E8=A1=8C=E4=B8=8D=E6=
=94=AF=E6=8C=81=E8=BF=99=E4=BA=9B=E6=96=B9=E6=B3=95=E7=9A=84SMP=E5=86=85=E6=
=A0=B8=E3=80=82
> +
> +
> +=E5=91=BD=E4=BB=A4=E8=A1=8C=E5=BC=80=E5=85=B3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +``maxcpus=3Dn``
> +  =E9=99=90=E5=88=B6=E5=90=AF=E5=8A=A8=E6=97=B6=E9=97=B4=E7=9A=84CPU=E4=
=B8=BA *n* =E3=80=82=E4=BE=8B=E5=A6=82=EF=BC=8C=E5=A6=82=E6=9E=9C=E4=BD=A0=
=E6=9C=89=E5=9B=9B=E4=B8=AACPU=EF=BC=8C=E4=BD=BF=E7=94=A8 ``maxcpus=3D2`` =
=E5=B0=86=E5=8F=AA=E8=83=BD=E5=90=AF

=E9=99=90=E5=88=B6=E5=90=AF=E5=8A=A8=E6=97=B6=E7=9A=84CPU=E4=B8=BA *n* =E4=
=B8=AA=E3=80=82

> +  =E5=8A=A8=E4=B8=A4=E4=B8=AA=E3=80=82=E4=BD=A0=E5=8F=AF=E4=BB=A5=E9=80=
=89=E6=8B=A9=E7=A8=8D=E5=90=8E=E8=AE=A9=E5=85=B6=E4=BB=96CPU=E4=B8=8A=E7=BA=
=BF=E3=80=82
> +
> +``nr_cpus=3Dn``
> +  =E9=99=90=E5=88=B6=E5=86=85=E6=A0=B8=E5=B0=86=E6=94=AF=E6=8C=81=E7=9A=
=84CPU=E6=80=BB=E9=87=8F=E3=80=82=E5=A6=82=E6=9E=9C=E8=BF=99=E9=87=8C=E6=8F=
=90=E4=BE=9B=E7=9A=84=E6=95=B0=E9=87=8F=E4=BD=8E=E4=BA=8E=E5=AE=9E=E9=99=85=
=E5=8F=AF=E7=94=A8=E7=9A=84CPU=E6=95=B0=E9=87=8F=EF=BC=8C=E9=82=A3=E4=B9=88=
=E8=BF=99=E4=BA=9BCPU
                                                                           =
=E5=85=B6=E4=BB=96

> +  =E4=BB=A5=E5=90=8E=E5=B0=B1=E4=B8=8D=E8=83=BD=E4=B8=8A=E7=BA=BF=E4=BA=
=86=E3=80=82
> +
> +``additional_cpus=3Dn``
> +  =E4=BD=BF=E7=94=A8=E5=AE=83=E6=9D=A5=E9=99=90=E5=88=B6=E5=8F=AF=E7=83=
=AD=E6=8F=92=E6=8B=94=E7=9A=84CPU=E3=80=82=E8=AF=A5=E9=80=89=E9=A1=B9=E8=AE=
=BE=E7=BD=AE
> +  ``cpu_possible_mask =3D cpu_present_mask + additional_cpus``
> +
> +  =E8=BF=99=E4=B8=AA=E9=80=89=E9=A1=B9=E5=8F=AA=E9=99=90=E4=BA=8EIA64=E6=
=9E=B6=E6=9E=84=E3=80=82
> +
> +``possible_cpus=3Dn``
> +  =E8=BF=99=E4=B8=AA=E9=80=89=E9=A1=B9=E8=AE=BE=E7=BD=AE ``cpu_possible_=
mask`` =E4=B8=AD=E7=9A=84 ``possible_cpus`` =E4=BD=8D=E3=80=82
> +
> +  =E8=BF=99=E4=B8=AA=E9=80=89=E9=A1=B9=E5=8F=AA=E9=99=90=E4=BA=8EX86=E5=
=92=8CS390=E6=9E=B6=E6=9E=84=E3=80=82
> +
> +``cpu0_hotplug``
> +  =E5=85=81=E8=AE=B8=E5=85=B3=E9=97=ADCPU0=E3=80=82
> +
> +  =E8=BF=99=E4=B8=AA=E9=80=89=E9=A1=B9=E5=8F=AA=E9=99=90=E4=BA=8EX86=E6=
=9E=B6=E6=9E=84=E3=80=82
> +
> +CPU=E4=BD=8D=E5=9B=BE
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +``cpu_possible_mask``
> +  =E7=B3=BB=E7=BB=9F=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=AD=98=E5=9C=A8=E7=9A=
=84CPU=E7=9A=84=E4=BD=8D=E5=9B=BE=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8=E6=9D=
=A5=E4=B8=BAper_cpu=E5=8F=98=E9=87=8F=E5=88=86=E9=85=8D=E4=B8=80=E4=BA=9B=
=E5=90=AF=E5=8A=A8=E6=97=B6=E7=9A=84=E5=86=85=E5=AD=98=EF=BC=8C=E8=BF=99=E4=
=BA=9B=E5=8F=98=E9=87=8F

=E7=B3=BB=E7=BB=9F=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=8F=AF=E7=94=A8CPU=E7=9A=84=
=E4=BD=8D=E5=9B=BE =EF=BC=9F
|----------------|-----|

> +  =E4=B8=8D=E4=BC=9A=E9=9A=8F=E7=9D=80CPU=E7=9A=84=E5=8F=AF=E7=94=A8=E6=
=88=96=E7=A7=BB=E9=99=A4=E8=80=8C=E5=A2=9E=E5=8A=A0/=E5=87=8F=E5=B0=91=E3=
=80=82=E4=B8=80=E6=97=A6=E5=9C=A8=E5=90=AF=E5=8A=A8=E6=97=B6=E7=9A=84=E5=8F=
=91=E7=8E=B0=E9=98=B6=E6=AE=B5=E8=A2=AB=E8=AE=BE=E7=BD=AE=EF=BC=8C=E8=AF=A5=
=E5=9C=B0=E5=9B=BE=E5=B0=B1=E6=98=AF=E9=9D=99=E6=80=81
-------------------------------------------------------------------------^^=
^^ =E6=98=A0=E5=B0=84

> +  =E7=9A=84=EF=BC=8C=E4=B9=9F=E5=B0=B1=E6=98=AF=E8=AF=B4=EF=BC=8C=E4=BB=
=BB=E4=BD=95=E6=97=B6=E5=80=99=E9=83=BD=E4=B8=8D=E4=BC=9A=E5=A2=9E=E5=8A=A0=
=E6=88=96=E5=88=A0=E9=99=A4=E4=BB=BB=E4=BD=95=E4=BD=8D=E3=80=82=E6=A0=B9=E6=
=8D=AE=E4=BD=A0=E7=9A=84=E7=B3=BB=E7=BB=9F=E9=9C=80=E6=B1=82=E6=8F=90=E5=89=
=8D=E5=87=86=E7=A1=AE=E5=9C=B0=E8=B0=83=E6=95=B4=E5=AE=83
> +  =E5=8F=AF=E4=BB=A5=E8=8A=82=E7=9C=81=E4=B8=80=E4=BA=9B=E5=90=AF=E5=8A=
=A8=E6=97=B6=E7=9A=84=E5=86=85=E5=AD=98=E3=80=82
> +
> +``cpu_online_mask``
> +  =E5=BD=93=E5=89=8D=E5=9C=A8=E7=BA=BF=E7=9A=84=E6=89=80=E6=9C=89CPU=E7=
=9A=84=E4=BD=8D=E5=9B=BE=E3=80=82=E5=9C=A8=E4=B8=80=E4=B8=AACPU=E5=8F=AF=E7=
=94=A8=E4=BA=8E=E5=86=85=E6=A0=B8=E8=B0=83=E5=BA=A6=E5=B9=B6=E5=87=86=E5=A4=
=87=E6=8E=A5=E6=94=B6=E8=AE=BE=E5=A4=87=E7=9A=84=E4=B8=AD=E6=96=AD=E5=90=8E=
=EF=BC=8C=E5=AE=83=E8=A2=AB
> +  =E8=AE=BE=E7=BD=AE=E5=9C=A8 ``__cpu_up()`` =E4=B8=AD=E3=80=82=E5=BD=93=
=E4=BD=BF=E7=94=A8 ``__cpu_disable()`` =E5=85=B3=E9=97=AD=E4=B8=80=E4=B8=AA=
CPU=E6=97=B6=EF=BC=8C=E5=AE=83=E8=A2=AB=E6=B8=85
> +  =E7=A9=BA=EF=BC=8C=E5=9C=A8=E6=AD=A4=E4=B9=8B=E5=89=8D=EF=BC=8C=E6=89=
=80=E6=9C=89=E7=9A=84=E6=93=8D=E4=BD=9C=E7=B3=BB=E7=BB=9F=E6=9C=8D=E5=8A=A1=
=E5=8C=85=E6=8B=AC=E4=B8=AD=E6=96=AD=E9=83=BD=E8=A2=AB=E8=BF=81=E7=A7=BB=E5=
=88=B0=E5=8F=A6=E4=B8=80=E4=B8=AA=E7=9B=AE=E6=A0=87CPU=E3=80=82
> +
> +``cpu_present_mask``
> +  =E7=B3=BB=E7=BB=9F=E4=B8=AD=E5=BD=93=E5=89=8D=E5=AD=98=E5=9C=A8=E7=9A=
=84CPU=E7=9A=84=E4=BD=8D=E5=9B=BE=E3=80=82=E5=B9=B6=E9=9D=9E=E6=89=80=E6=9C=
=89=E7=9A=84CPU=E9=83=BD=E6=98=AF=E5=9C=A8=E7=BA=BF=E7=9A=84=E3=80=82=E5=BD=
=93=E7=89=A9=E7=90=86=E7=83=AD=E6=8B=94=E6=8F=92=E8=A2=AB=E7=9B=B8=E5=85=B3=
=E7=9A=84=E5=AD=90=E7=B3=BB=E7=BB=9F

=E5=AE=83=E4=BB=AC=E5=B9=B6=E9=9D=9E=E5=85=A8=E9=83=A8=E5=9C=A8=E7=BA=BF=E3=
=80=82

them=E4=BB=A3=E6=8C=87=E5=89=8D=E8=BF=B0cpu

> +  =EF=BC=88=E5=A6=82ACPI=EF=BC=89=E5=A4=84=E7=90=86=E6=97=B6=EF=BC=8C=E5=
=8F=AF=E4=BB=A5=E6=94=B9=E5=8F=98=E5=92=8C=E6=B7=BB=E5=8A=A0=E6=96=B0=E7=9A=
=84=E4=BD=8D=E6=88=96=E4=BB=8E=E4=BD=8D=E5=9B=BE=E4=B8=AD=E5=88=A0=E9=99=A4=
=EF=BC=8C=E8=BF=99=E5=8F=96=E5=86=B3=E4=BA=8E=E4=BA=8B=E4=BB=B6=E6=98=AF
> +  hot-add/hot-remove=E3=80=82=E7=9B=AE=E5=89=8D=E8=BF=98=E6=B2=A1=E6=9C=
=89=E5=AE=9A=E6=AD=BB=E8=A7=84=E5=AE=9A=E3=80=82=E5=85=B8=E5=9E=8B=E7=9A=84=
=E7=94=A8=E6=B3=95=E6=98=AF=E5=9C=A8=E5=90=AF=E5=8A=A8=E6=97=B6=E5=90=AF=E5=
=8A=A8=E6=8B=93=E6=89=91=E7=BB=93=E6=9E=84=EF=BC=8C=E8=BF=99=E6=97=B6
> +  =E7=83=AD=E6=8F=92=E6=8B=94=E8=A2=AB=E7=A6=81=E7=94=A8=E3=80=82
> +
> +=E4=BD=A0=E7=9C=9F=E7=9A=84=E4=B8=8D=E9=9C=80=E8=A6=81=E6=93=8D=E4=BD=9C=
=E4=BB=BB=E4=BD=95=E7=B3=BB=E7=BB=9F=E7=9A=84CPU=E6=98=A0=E5=B0=84=E3=80=82=
=E5=9C=A8=E5=A4=A7=E5=A4=9A=E6=95=B0=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E5=
=AE=83=E4=BB=AC=E5=BA=94=E8=AF=A5=E6=98=AF=E5=8F=AA=E8=AF=BB=E7=9A=84=E3=80=
=82=E5=BD=93=E8=AE=BE=E7=BD=AE=E6=AF=8F=E4=B8=AA
> +CPU=E8=B5=84=E6=BA=90=E6=97=B6=EF=BC=8C=E5=87=A0=E4=B9=8E=E6=80=BB=E6=98=
=AF=E4=BD=BF=E7=94=A8 ``cpu_possible_mask`` =E6=88=96 ``for_each_possible_c=
pu()``
> +=E6=9D=A5=E8=BF=9B=E8=A1=8C=E8=BF=AD=E4=BB=A3=E3=80=82=E5=AE=8F ``for_ea=
ch_cpu()`` =E5=8F=AF=E4=BB=A5=E7=94=A8=E6=9D=A5=E8=BF=AD=E4=BB=A3=E4=B8=80=
=E4=B8=AA=E8=87=AA=E5=AE=9A=E4=B9=89=E7=9A=84CPU=E6=8E=A9=E7=A0=81=E3=80=82
> +
> +=E4=B8=8D=E8=A6=81=E4=BD=BF=E7=94=A8cpumask_t=E4=BB=A5=E5=A4=96=E7=9A=84=
=E4=BB=BB=E4=BD=95=E4=B8=9C=E8=A5=BF=E6=9D=A5=E8=A1=A8=E7=A4=BACPU=E7=9A=84=
=E4=BD=8D=E5=9B=BE=E3=80=82

``cpumask_t``

> +
> +
> +=E4=BD=BF=E7=94=A8CPU=E7=83=AD=E6=8B=94=E6=8F=92
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E5=86=85=E6=A0=B8=E9=80=89=E9=A1=B9CONFIG_HOTPLUG_CPU=E9=9C=80=E8=A6=81=
=E8=A2=AB=E5=90=AF=E7=94=A8=E3=80=82=E5=AE=83=E7=9B=AE=E5=89=8D=E5=8F=AF=E7=
=94=A8=E4=BA=8E=E5=A4=9A=E7=A7=8D=E6=9E=B6=E6=9E=84=EF=BC=8C=E5=8C=85=E6=8B=
=ACARM=E3=80=81MIPS=E3=80=81

*CONFIG_HOTPLUG_CPU*

> +PowerPC=E5=92=8CX86=E3=80=82=E9=85=8D=E7=BD=AE=E6=98=AF=E9=80=9A=E8=BF=
=87sysfs=E6=8E=A5=E5=8F=A3=E5=AE=8C=E6=88=90=E7=9A=84::
> +
> + $ ls -lh /sys/devices/system/cpu
> + total 0
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu0
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu1
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu2
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu3
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu4
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu5
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu6
> + drwxr-xr-x  9 root root    0 Dec 21 16:33 cpu7
> + drwxr-xr-x  2 root root    0 Dec 21 16:33 hotplug
> + -r--r--r--  1 root root 4.0K Dec 21 16:33 offline
> + -r--r--r--  1 root root 4.0K Dec 21 16:33 online
> + -r--r--r--  1 root root 4.0K Dec 21 16:33 possible
> + -r--r--r--  1 root root 4.0K Dec 21 16:33 present
> +
> +=E6=96=87=E4=BB=B6 *offline* =E3=80=81 *online* =E3=80=81*possible* =E3=
=80=81*present* =E4=BB=A3=E8=A1=A8CPU=E6=8E=A9=E7=A0=81=E3=80=82=E6=AF=8F=
=E4=B8=AACPU=E6=96=87=E4=BB=B6
> +=E5=A4=B9=E5=8C=85=E5=90=AB=E4=B8=80=E4=B8=AA *online* =E6=96=87=E4=BB=
=B6=EF=BC=8C=E6=8E=A7=E5=88=B6=E9=80=BB=E8=BE=91=E4=B8=8A=E7=9A=84=E5=BC=80=
=EF=BC=881=EF=BC=89=E5=92=8C=E5=85=B3=EF=BC=880=EF=BC=89=E7=8A=B6=E6=80=81=
=E3=80=82=E8=A6=81=E5=9C=A8=E9=80=BB=E8=BE=91=E4=B8=8A=E5=85=B3=E9=97=ADCPU=
4::
> +
> + $ echo 0 > /sys/devices/system/cpu/cpu4/online
> +  smpboot: CPU 4 is now offline
> +
> +=E4=B8=80=E6=97=A6CPU=E8=A2=AB=E5=85=B3=E9=97=AD=EF=BC=8C=E5=AE=83=E5=B0=
=86=E4=BB=8E */proc/interrupts* =E3=80=81*/proc/cpuinfo* =E4=B8=AD=E8=A2=AB=
=E5=88=A0=E9=99=A4=EF=BC=8C=E4=B9=9F=E4=B8=8D=E5=BA=94=E8=AF=A5
> +=E8=A2=ABtop=E5=91=BD=E4=BB=A4=E6=98=BE=E7=A4=BA=E5=87=BA=E6=9D=A5=E3=80=
=82=E8=A6=81=E8=AE=A9CPU4=E9=87=8D=E6=96=B0=E4=B8=8A=E7=BA=BF::

*top*

> +
> + $ echo 1 > /sys/devices/system/cpu/cpu4/online
> + smpboot: Booting Node 0 Processor 4 APIC 0x1
> +
> +CPU=E5=8F=88=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8=E4=BA=86=E3=80=82=E8=BF=
=99=E5=BA=94=E8=AF=A5=E5=AF=B9=E6=89=80=E6=9C=89=E7=9A=84CPU=E9=83=BD=E6=9C=
=89=E6=95=88=E3=80=82CPU0=E9=80=9A=E5=B8=B8=E6=AF=94=E8=BE=83=E7=89=B9=E6=
=AE=8A=EF=BC=8C=E8=A2=AB=E6=8E=92=E9=99=A4=E5=9C=A8CPU=E7=83=AD=E6=8B=94=E6=
=8F=92=E4=B9=8B=E5=A4=96=E3=80=82
> +=E5=9C=A8X86=E4=B8=8A=EF=BC=8C=E5=86=85=E6=A0=B8=E9=80=89=E9=A1=B9 *CONF=
IG_BOOTPARAM_HOTPLUG_CPU0* =E5=BF=85=E9=A1=BB=E8=A2=AB=E5=90=AF=E7=94=A8=EF=
=BC=8C=E4=BB=A5=E4=BE=BF=E8=83=BD=E5=A4=9F=E5=85=B3=E9=97=ADCPU0=E3=80=82
> +=E6=88=96=E8=80=85=EF=BC=8C=E5=8F=AF=E4=BB=A5=E4=BD=BF=E7=94=A8=E5=86=85=
=E6=A0=B8=E5=91=BD=E4=BB=A4=E9=80=89=E9=A1=B9 *cpu0_hotplug* =E3=80=82CPU0=
=E7=9A=84=E4=B8=80=E4=BA=9B=E5=B7=B2=E7=9F=A5=E7=9A=84=E4=BE=9D=E8=B5=96=E6=
=80=A7:
> +
> +* =E4=BB=8E=E4=BC=91=E7=9C=A0/=E6=9A=82=E5=81=9C=E4=B8=AD=E6=81=A2=E5=A4=
=8D=E3=80=82=E5=A6=82=E6=9E=9CCPU0=E5=A4=84=E4=BA=8E=E7=A6=BB=E7=BA=BF=E7=
=8A=B6=E6=80=81=EF=BC=8C=E4=BC=91=E7=9C=A0/=E6=9A=82=E5=81=9C=E5=B0=86=E5=
=A4=B1=E8=B4=A5=E3=80=82
> +* PIC=E4=B8=AD=E6=96=AD=E3=80=82=E5=A6=82=E6=9E=9C=E6=A3=80=E6=B5=8B=E5=
=88=B0PIC=E4=B8=AD=E6=96=AD=EF=BC=8CCPU0=E5=B0=B1=E4=B8=8D=E8=83=BD=E8=A2=
=AB=E7=A7=BB=E9=99=A4=E3=80=82
> +
> +=E5=A6=82=E6=9E=9C=E4=BD=A0=E5=8F=91=E7=8E=B0CPU0=E4=B8=8A=E6=9C=89=E4=
=BB=BB=E4=BD=95=E4=BE=9D=E8=B5=96=E6=80=A7=EF=BC=8C=E8=AF=B7=E8=AE=A9=E5=91=
=8A=E7=9F=A5Fenghua Yu <fenghua.yu@intel.com>=E3=80=82
-----------------------------------^^ remove

> +
> +CPU=E7=9A=84=E7=83=AD=E6=8B=94=E6=8F=92=E5=8D=8F=E4=BD=9C
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E4=B8=8B=E7=BA=BF=E6=83=85=E5=86=B5
> +--------
> +
> +=E4=B8=80=E6=97=A6CPU=E8=A2=AB=E9=80=BB=E8=BE=91=E5=85=B3=E9=97=AD=EF=BC=
=8C=E6=B3=A8=E5=86=8C=E7=9A=84=E7=83=AD=E6=8F=92=E6=8B=94=E7=8A=B6=E6=80=81=
=E7=9A=84=E6=B8=85=E9=99=A4=E5=9B=9E=E8=B0=83=E5=B0=86=E8=A2=AB=E8=B0=83=E7=
=94=A8=EF=BC=8C=E4=BB=8E ``CPUHP_ONLINE`` =E5=BC=80=E5=A7=8B=EF=BC=8C=E5=9C=
=A8
> +``CPUHP_OFFLINE`` =E7=8A=B6=E6=80=81=E7=BB=93=E6=9D=9F=E3=80=82=E8=BF=99=
=E5=8C=85=E6=8B=AC:
> +
> +* =E5=A6=82=E6=9E=9C=E4=BB=BB=E5=8A=A1=E5=9B=A0=E6=9A=82=E5=81=9C=E6=93=
=8D=E4=BD=9C=E8=80=8C=E8=A2=AB=E5=86=BB=E7=BB=93=EF=BC=8C=E9=82=A3=E4=B9=88=
 *cpuhp_tasks_frozen* =E5=B0=86=E8=A2=AB=E8=AE=BE=E7=BD=AE=E4=B8=BAtrue=E3=
=80=82
> +
> +* =E6=89=80=E6=9C=89=E8=BF=9B=E7=A8=8B=E9=83=BD=E4=BC=9A=E4=BB=8E=E8=BF=
=99=E4=B8=AA=E5=B0=86=E8=A6=81=E7=A6=BB=E7=BA=BF=E7=9A=84CPU=E8=BF=81=E7=A7=
=BB=E5=88=B0=E6=96=B0=E7=9A=84CPU=E4=B8=8A=E3=80=82=E6=96=B0=E7=9A=84CPU=E6=
=98=AF=E4=BB=8E=E6=AF=8F=E4=B8=AA=E8=BF=9B=E7=A8=8B=E7=9A=84=E5=BD=93=E5=89=
=8Dcpuset=E4=B8=AD
> +  =E9=80=89=E6=8B=A9=E7=9A=84=EF=BC=8C=E5=AE=83=E5=8F=AF=E8=83=BD=E6=98=
=AF=E6=89=80=E6=9C=89=E5=9C=A8=E7=BA=BFCPU=E7=9A=84=E4=B8=80=E4=B8=AA=E5=AD=
=90=E9=9B=86=E3=80=82
> +
> +* =E6=89=80=E6=9C=89=E9=92=88=E5=AF=B9=E8=BF=99=E4=B8=AACPU=E7=9A=84=E4=
=B8=AD=E6=96=AD=E9=83=BD=E8=A2=AB=E8=BF=81=E7=A7=BB=E5=88=B0=E6=96=B0=E7=9A=
=84CPU=E4=B8=8A=E3=80=82
> +
> +* =E8=AE=A1=E6=97=B6=E5=99=A8=E4=B9=9F=E4=BC=9A=E8=A2=AB=E8=BF=81=E7=A7=
=BB=E5=88=B0=E6=96=B0=E7=9A=84CPU=E4=B8=8A=E3=80=82
> +
> +* =E4=B8=80=E6=97=A6=E6=89=80=E6=9C=89=E7=9A=84=E6=9C=8D=E5=8A=A1=E8=A2=
=AB=E8=BF=81=E7=A7=BB=EF=BC=8C=E5=86=85=E6=A0=B8=E4=BC=9A=E8=B0=83=E7=94=A8=
=E4=B8=80=E4=B8=AA=E7=89=B9=E5=AE=9A=E7=9A=84=E4=BE=8B=E7=A8=8B ``__cpu_dis=
able()`` =E6=9D=A5=E8=BF=9B=E8=A1=8C=E7=89=B9=E5=AE=9A=E7=9A=84=E6=B8=85
> +  =E7=90=86=E3=80=82
> +
> +=E4=BD=BF=E7=94=A8=E7=83=AD=E6=8F=92=E6=8B=94API
> +-------------
> +
> +=E4=B8=80=E6=97=A6=E4=B8=80=E4=B8=AACPU=E4=B8=8B=E7=BA=BF=E6=88=96=E4=B8=
=8A=E7=BA=BF=EF=BC=8C=E5=B0=B1=E6=9C=89=E5=8F=AF=E8=83=BD=E6=94=B6=E5=88=B0=
=E9=80=9A=E7=9F=A5=E3=80=82=E8=BF=99=E5=AF=B9=E6=9F=90=E4=BA=9B=E9=9C=80=E8=
=A6=81=E6=A0=B9=E6=8D=AE=E5=8F=AF=E7=94=A8CPU=E6=95=B0=E9=87=8F=E6=89=A7=E8=
=A1=8C=E6=9F=90=E7=A7=8D=E8=AE=BE=E7=BD=AE=E6=88=96=E6=B8=85
> +=E7=90=86=E5=8A=9F=E8=83=BD=E7=9A=84=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=
=E6=9D=A5=E8=AF=B4=E5=8F=AF=E8=83=BD=E5=BE=88=E9=87=8D=E8=A6=81::
> +
> +  #include <linux/cpuhotplug.h>
> +
> +  ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "X/Y:online",
> +                          Y_online, Y_prepare_down);
> +
> +*X* =E6=98=AF=E5=AD=90=E7=B3=BB=E7=BB=9F=EF=BC=8C *Y* =E6=98=AF=E7=89=B9=
=E5=AE=9A=E7=9A=84=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=E3=80=82 *Y_online* =
=E5=9B=9E=E8=B0=83=E5=B0=86=E5=9C=A8=E6=89=80=E6=9C=89=E5=9C=A8=E7=BA=BFCPU=
=E7=9A=84=E6=B3=A8=E5=86=8C=E8=BF=87=E7=A8=8B=E4=B8=AD=E8=A2=AB=E8=B0=83=E7=
=94=A8=E3=80=82
> +=E5=A6=82=E6=9E=9C=E5=9C=A8=E7=BA=BF=E5=9B=9E=E8=B0=83=E6=9C=9F=E9=97=B4=
=E5=8F=91=E7=94=9F=E9=94=99=E8=AF=AF=EF=BC=8C *Y_prepare_down*  =E5=9B=9E=
=E8=B0=83=E5=B0=86=E5=9C=A8=E6=89=80=E6=9C=89=E4=B9=8B=E5=89=8D=E8=B0=83=E7=
=94=A8=E8=BF=87=E5=9C=A8=E7=BA=BF=E5=9B=9E=E8=B0=83=E7=9A=84CPU=E4=B8=8A=E8=
=B0=83
> +=E7=94=A8=E3=80=82=E6=B3=A8=E5=86=8C=E5=AE=8C=E6=88=90=E5=90=8E=EF=BC=8C=
=E4=B8=80=E6=97=A6=E6=9C=89CPU=E4=B8=8A=E7=BA=BF=EF=BC=8C *Y_online* =E5=9B=
=9E=E8=B0=83=E5=B0=86=E8=A2=AB=E8=B0=83=E7=94=A8=EF=BC=8C=E5=BD=93CPU=E5=85=
=B3=E9=97=AD=E6=97=B6=EF=BC=8C *Y_prepare_down*
> +=E5=B0=86=E8=A2=AB=E8=B0=83=E7=94=A8=E3=80=82=E6=89=80=E6=9C=89=E4=B9=8B=
=E5=89=8D=E5=9C=A8 *Y_online* =E4=B8=AD=E5=88=86=E9=85=8D=E7=9A=84=E8=B5=84=
=E6=BA=90=E9=83=BD=E5=BA=94=E8=AF=A5=E5=9C=A8 *Y_prepare_down* =E4=B8=AD=E9=
=87=8A=E6=94=BE=E3=80=82=E5=A6=82=E6=9E=9C=E5=9C=A8
> +=E6=B3=A8=E5=86=8C=E8=BF=87=E7=A8=8B=E4=B8=AD=E5=8F=91=E7=94=9F=E9=94=99=
=E8=AF=AF=EF=BC=8C=E8=BF=94=E5=9B=9E=E5=80=BCret=E4=B8=BA=E8=B4=9F=E5=80=BC=
=E3=80=82=E5=90=A6=E5=88=99=E4=BC=9A=E8=BF=94=E5=9B=9E=E4=B8=80=E4=B8=AA=E6=
=AD=A3=E5=80=BC=EF=BC=8C=E5=85=B6=E4=B8=AD=E5=8C=85=E5=90=AB=E5=8A=A8=E6=80=
=81=E5=88=86=E9=85=8D=E7=8A=B6=E6=80=81

*ret*

> +=EF=BC=88CPUHP_AP_ONLINE_DYN=EF=BC=89=E7=9A=84=E5=88=86=E9=85=8D=E7=83=
=AD=E6=8B=94=E6=8F=92=E3=80=82=E5=AF=B9=E4=BA=8E=E9=A2=84=E5=AE=9A=E4=B9=89=
=E7=9A=84=E7=8A=B6=E6=80=81=EF=BC=8C=E5=AE=83=E5=B0=86=E8=BF=94=E5=9B=9E0=
=E3=80=82

*CPUHP_AP_ONLINE_DYN*

> +
> +=E8=AF=A5=E5=9B=9E=E8=B0=83=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E8=B0=83=
=E7=94=A8 ``cpuhp_remove_state()`` =E6=9D=A5=E5=88=A0=E9=99=A4=E3=80=82=E5=
=A6=82=E6=9E=9C=E6=98=AF=E5=8A=A8=E6=80=81=E5=88=86=E9=85=8D=E7=9A=84=E7=8A=
=B6=E6=80=81
> +=EF=BC=88CPUHP_AP_ONLINE_DYN=EF=BC=89=EF=BC=8C=E5=88=99=E4=BD=BF=E7=94=
=A8=E8=BF=94=E5=9B=9E=E7=9A=84=E7=8A=B6=E6=80=81=E3=80=82=E5=9C=A8=E7=A7=BB=
=E9=99=A4=E7=83=AD=E6=8F=92=E6=8B=94=E7=8A=B6=E6=80=81=E7=9A=84=E8=BF=87=E7=
=A8=8B=E4=B8=AD=EF=BC=8C=E5=B0=86=E8=B0=83=E7=94=A8=E6=8B=86=E8=A7=A3=E5=9B=
=9E=E8=B0=83=E3=80=82

*CPUHP_AP_ONLINE_DYN*

> +
> +=E5=A4=9A=E4=B8=AA=E5=AE=9E=E4=BE=8B
> +~~~~~~~~
> +
> +=E5=A6=82=E6=9E=9C=E4=B8=80=E4=B8=AA=E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=
=E6=9C=89=E5=A4=9A=E4=B8=AA=E5=AE=9E=E4=BE=8B=EF=BC=8C=E5=B9=B6=E4=B8=94=E6=
=AF=8F=E4=B8=AA=E5=AE=9E=E4=BE=8B=E9=83=BD=E9=9C=80=E8=A6=81=E7=8B=AC=E7=AB=
=8B=E6=89=A7=E8=A1=8C=E5=9B=9E=E8=B0=83=EF=BC=8C=E9=82=A3=E4=B9=88=E5=BE=88=
=E5=8F=AF=E8=83=BD=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=A8
> +``multi-state`` =E3=80=82=E9=A6=96=E5=85=88=E9=9C=80=E8=A6=81=E6=B3=A8=
=E5=86=8C=E4=B8=80=E4=B8=AA=E5=A4=9A=E7=8A=B6=E6=80=81=E7=9A=84=E7=8A=B6=E6=
=80=81::
> +
> +  ret =3D cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN, "X/Y:online,
> +                                Y_online, Y_prepare_down);
> +  Y_hp_online =3D ret;
> +
> +``cpuhp_setup_state_multi()`` =E7=9A=84=E8=A1=8C=E4=B8=BA=E4=B8=8E ``cpu=
hp_setup_state()`` =E7=B1=BB=E4=BC=BC=EF=BC=8C=E5=8F=AA=E6=98=AF=E5=AE=83
> +=E4=B8=BA=E5=A4=9A=E7=8A=B6=E6=80=81=E5=87=86=E5=A4=87=E4=BA=86=E5=9B=9E=
=E8=B0=83=EF=BC=8C=E4=BD=86=E4=B8=8D=E8=B0=83=E7=94=A8=E5=9B=9E=E8=B0=83=E3=
=80=82=E8=BF=99=E6=98=AF=E4=B8=80=E4=B8=AA=E4=B8=80=E6=AC=A1=E6=80=A7=E7=9A=
=84=E8=AE=BE=E7=BD=AE=E3=80=82
> +=E4=B8=80=E6=97=A6=E5=88=86=E9=85=8D=E4=BA=86=E4=B8=80=E4=B8=AA=E6=96=B0=
=E7=9A=84=E5=AE=9E=E4=BE=8B=EF=BC=8C=E4=BD=A0=E9=9C=80=E8=A6=81=E6=B3=A8=E5=
=86=8C=E8=BF=99=E4=B8=AA=E6=96=B0=E5=AE=9E=E4=BE=8B::
> +
> +  ret =3D cpuhp_state_add_instance(Y_hp_online, &d->node);
> +
> +=E8=BF=99=E4=B8=AA=E5=87=BD=E6=95=B0=E5=B0=86=E6=8A=8A=E8=BF=99=E4=B8=AA=
=E5=AE=9E=E4=BE=8B=E6=B7=BB=E5=8A=A0=E5=88=B0=E4=BD=A0=E5=85=88=E5=89=8D=E5=
=88=86=E9=85=8D=E7=9A=84 ``Y_hp_online`` =E7=8A=B6=E6=80=81=EF=BC=8C=E5=B9=
=B6=E5=9C=A8=E6=89=80=E6=9C=89=E5=9C=A8=E7=BA=BF=E7=9A=84
> +CPU=E4=B8=8A=E8=B0=83=E7=94=A8=E5=85=88=E5=89=8D=E6=B3=A8=E5=86=8C=E7=9A=
=84=E5=9B=9E=E8=B0=83=EF=BC=88 ``Y_online`` =EF=BC=89=E3=80=82 *node* =E5=
=85=83=E7=B4=A0=E6=98=AF=E4=BD=A0=E7=9A=84=E6=AF=8F=E4=B8=AA=E5=AE=9E=E4=BE=
=8B=E6=95=B0=E6=8D=AE=E7=BB=93=E6=9E=84
> +=E4=B8=AD=E7=9A=84=E4=B8=80=E4=B8=AA ``struct hlist_node`` =E6=88=90=E5=
=91=98=E3=80=82
> +
> +=E5=9C=A8=E7=A7=BB=E9=99=A4=E8=AF=A5=E5=AE=9E=E4=BE=8B=E6=97=B6::
> +
> +  cpuhp_state_remove_instance(Y_hp_online, &d->node)
> +
> +=E5=BA=94=E8=AF=A5=E8=A2=AB=E8=B0=83=E7=94=A8=EF=BC=8C=E8=BF=99=E5=B0=86=
=E5=9C=A8=E6=89=80=E6=9C=89=E5=9C=A8=E7=BA=BFCPU=E4=B8=8A=E8=B0=83=E7=94=A8=
=E6=8B=86=E5=88=86=E5=9B=9E=E8=B0=83=E3=80=82
> +
> +=E6=89=8B=E5=8A=A8=E8=AE=BE=E7=BD=AE
> +~~~~~~~~
> +
> +=E9=80=9A=E5=B8=B8=E6=83=85=E5=86=B5=E4=B8=8B=EF=BC=8C=E5=9C=A8=E6=B3=A8=
=E5=86=8C=E6=88=96=E7=A7=BB=E9=99=A4=E7=8A=B6=E6=80=81=E6=97=B6=E8=B0=83=E7=
=94=A8setup=E5=92=8Cteamdown=E5=9B=9E=E8=B0=83=E6=98=AF=E5=BE=88=E6=96=B9=
=E4=BE=BF=E7=9A=84=EF=BC=8C=E5=9B=A0=E4=B8=BA=E9=80=9A=E5=B8=B8=E5=9C=A8CPU=
=E4=B8=8A=E7=BA=BF
> +=EF=BC=88=E4=B8=8B=E7=BA=BF=EF=BC=89=E5=92=8C=E9=A9=B1=E5=8A=A8=E7=9A=84=
=E5=88=9D=E5=A7=8B=E8=AE=BE=E7=BD=AE=EF=BC=88=E5=85=B3=E9=97=AD=EF=BC=89=E6=
=97=B6=E9=9C=80=E8=A6=81=E6=89=A7=E8=A1=8C=E8=AF=A5=E6=93=8D=E4=BD=9C=E3=80=
=82=E7=84=B6=E8=80=8C=EF=BC=8C=E6=AF=8F=E4=B8=AA=E6=B3=A8=E5=86=8C=E5=92=8C=
=E5=88=A0=E9=99=A4=E5=8A=9F=E8=83=BD=E4=B9=9F=E6=9C=89=E4=B8=80=E4=B8=AA
> +_nocalls=E7=9A=84=E5=90=8E=E7=BC=80=EF=BC=8C=E5=A6=82=E6=9E=9C=E4=B8=8D=
=E5=B8=8C=E6=9C=9B=E8=B0=83=E7=94=A8=E5=9B=9E=E8=B0=83=EF=BC=8C=E5=88=99=E4=
=B8=8D=E8=B0=83=E7=94=A8=E6=89=80=E6=8F=90=E4=BE=9B=E7=9A=84=E5=9B=9E=E8=B0=
=83=E3=80=82=E5=9C=A8=E6=89=8B=E5=8A=A8=E8=AE=BE=E7=BD=AE=EF=BC=88=E6=88=96=
=E5=85=B3=E9=97=AD=EF=BC=89=E6=9C=9F=E9=97=B4=EF=BC=8C
> +=E5=BA=94=E8=AF=A5=E4=BD=BF=E7=94=A8 ``get_online_cpus()`` =E5=92=8C ``p=
ut_online_cpus()`` =E5=87=BD=E6=95=B0=E6=9D=A5=E6=8A=91=E5=88=B6CPU=E7=83=
=AD=E6=8F=92=E6=8B=94=E6=93=8D=E4=BD=9C=E3=80=82
> +
> +
> +=E4=BA=8B=E4=BB=B6=E7=9A=84=E9=A1=BA=E5=BA=8F
> +----------
> +
> +=E7=83=AD=E6=8F=92=E6=8B=94=E7=8A=B6=E6=80=81=E8=A2=AB=E5=AE=9A=E4=B9=89=
=E5=9C=A8 ``include/linux/cpuhotplug.h``:
> +
> +* ``CPUHP_OFFLINE`` ... ``CPUHP_AP_OFFLINE`` =E7=8A=B6=E6=80=81=E6=98=AF=
=E5=9C=A8CPU=E5=90=AF=E5=8A=A8=E5=89=8D=E8=B0=83=E7=94=A8=E7=9A=84=E3=80=82
> +
> +* ``CPUHP_AP_OFFLINE`` ... ``CPUHP_AP_ONLINE`` =E7=8A=B6=E6=80=81=E6=98=
=AF=E5=9C=A8CPU=E8=A2=AB=E5=90=AF=E5=8A=A8=E5=90=8E=E8=A2=AB=E8=B0=83=E7=94=
=A8=E7=9A=84=E3=80=82
> +  =E4=B8=AD=E6=96=AD=E6=98=AF=E5=85=B3=E9=97=AD=E7=9A=84=EF=BC=8C=E8=B0=
=83=E5=BA=A6=E7=A8=8B=E5=BA=8F=E8=BF=98=E6=B2=A1=E6=9C=89=E5=9C=A8=E8=BF=99=
=E4=B8=AACPU=E4=B8=8A=E6=B4=BB=E5=8A=A8=E3=80=82=E4=BB=8E ``CPUHP_AP_OFFLIN=
E`` =E5=BC=80=E5=A7=8B=EF=BC=8C
> +  =E5=9B=9E=E8=B0=83=E8=A2=AB=E8=B0=83=E7=94=A8=E5=88=B0=E7=9B=AE=E6=A0=
=87CPU=E4=B8=8A=E3=80=82
> +
> +* ``CPUHP_AP_ONLINE_DYN`` =E5=92=8C ``CPUHP_AP_ONLINE_DYN_END`` =E4=B9=
=8B=E9=97=B4=E7=9A=84=E7=8A=B6=E6=80=81=E8=A2=AB=E4=BF=9D=E7=95=99
> +  =E7=BB=99=E5=8A=A8=E6=80=81=E5=88=86=E9=85=8D=E3=80=82
> +
> +* =E8=BF=99=E4=BA=9B=E7=8A=B6=E6=80=81=E5=9C=A8CPU=E5=85=B3=E9=97=AD=E6=
=97=B6=E4=BB=A5=E7=9B=B8=E5=8F=8D=E7=9A=84=E9=A1=BA=E5=BA=8F=E8=B0=83=E7=94=
=A8=EF=BC=8C=E4=BB=8E ``CPUHP_ONLINE`` =E5=BC=80=E5=A7=8B=EF=BC=8C=E5=9C=A8=
 ``CPUHP_OFFLINE``
> +  =E5=81=9C=E6=AD=A2=E3=80=82=E8=BF=99=E9=87=8C=E7=9A=84=E5=9B=9E=E8=B0=
=83=E6=98=AF=E5=9C=A8=E5=B0=86=E8=A2=AB=E5=85=B3=E9=97=AD=E7=9A=84CPU=E4=B8=
=8A=E8=B0=83=E7=94=A8=E7=9A=84=EF=BC=8C=E7=9B=B4=E5=88=B0 ``CPUHP_AP_OFFLIN=
E`` =E3=80=82
> +
> +=E9=80=9A=E8=BF=87 ``CPUHP_AP_ONLINE_DYN`` =E5=8A=A8=E6=80=81=E5=88=86=
=E9=85=8D=E7=9A=84=E7=8A=B6=E6=80=81=E9=80=9A=E5=B8=B8=E5=B7=B2=E7=BB=8F=E8=
=B6=B3=E5=A4=9F=E4=BA=86=E3=80=82=E7=84=B6=E8=80=8C=EF=BC=8C=E5=A6=82=E6=9E=
=9C=E5=9C=A8=E5=90=AF=E5=8A=A8=E6=88=96=E5=85=B3=E9=97=AD
> +=E6=9C=9F=E9=97=B4=E9=9C=80=E8=A6=81=E6=9B=B4=E6=97=A9=E7=9A=84=E8=B0=83=
=E7=94=A8=EF=BC=8C=E9=82=A3=E4=B9=88=E5=BA=94=E8=AF=A5=E8=8E=B7=E5=BE=97=E4=
=B8=80=E4=B8=AA=E6=98=BE=E5=BC=8F=E7=8A=B6=E6=80=81=E3=80=82=E5=A6=82=E6=9E=
=9C=E7=83=AD=E6=8B=94=E6=8F=92=E4=BA=8B=E4=BB=B6=E9=9C=80=E8=A6=81=E7=9B=B8=
=E5=AF=B9=E4=BA=8E=E5=8F=A6=E4=B8=80=E4=B8=AA=E7=83=AD=E6=8B=94=E6=8F=92=E4=
=BA=8B
> +=E4=BB=B6=E7=9A=84=E7=89=B9=E5=AE=9A=E6=8E=92=E5=BA=8F=EF=BC=8C=E4=B9=9F=
=E5=8F=AF=E8=83=BD=E9=9C=80=E8=A6=81=E4=B8=80=E4=B8=AA=E6=98=BE=E5=BC=8F=E7=
=8A=B6=E6=80=81=E3=80=82
> +
> +=E6=B5=8B=E8=AF=95=E7=83=AD=E6=8B=94=E6=8F=92=E7=8A=B6=E6=80=81
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E9=AA=8C=E8=AF=81=E8=87=AA=E5=AE=9A=E4=B9=89=E7=8A=B6=E6=80=81=E6=98=AF=
=E5=90=A6=E6=8C=89=E9=A2=84=E6=9C=9F=E5=B7=A5=E4=BD=9C=E7=9A=84=E4=B8=80=E4=
=B8=AA=E6=96=B9=E6=B3=95=E6=98=AF=E5=85=B3=E9=97=AD=E4=B8=80=E4=B8=AACPU=EF=
=BC=8C=E7=84=B6=E5=90=8E=E5=86=8D=E6=8A=8A=E5=AE=83=E4=B8=8A=E7=BA=BF=E3=80=
=82=E4=B9=9F=E5=8F=AF=E4=BB=A5=E6=8A=8ACPU=E6=94=BE=E5=88=B0=E6=9F=90
> +=E4=BA=9B=E7=8A=B6=E6=80=81=EF=BC=88=E4=BE=8B=E5=A6=82 ``CPUHP_AP_ONLINE=
`` =EF=BC=89=EF=BC=8C=E7=84=B6=E5=90=8E=E5=86=8D=E5=9B=9E=E5=88=B0 ``CPUHP_=
ONLINE`` =E3=80=82=E8=BF=99=E5=B0=86=E6=A8=A1=E6=8B=9F=E5=9C=A8
> +``CPUHP_AP_ONLINE`` =E4=B9=8B=E5=90=8E=E7=9A=84=E4=B8=80=E4=B8=AA=E7=8A=
=B6=E6=80=81=E5=87=BA=E7=8E=B0=E9=94=99=E8=AF=AF=EF=BC=8C=E4=BB=8E=E8=80=8C=
=E5=AF=BC=E8=87=B4=E5=9B=9E=E6=BB=9A=E5=88=B0=E5=9C=A8=E7=BA=BF=E7=8A=B6=E6=
=80=81=E3=80=82
> +
> +=E6=89=80=E6=9C=89=E6=B3=A8=E5=86=8C=E7=9A=84=E7=8A=B6=E6=80=81=E9=83=BD=
=E8=A2=AB=E5=88=97=E4=B8=BE=E5=9C=A8 ``/sys/devices/system/cpu/hotplug/stat=
es`` ::
> +
> + $ tail /sys/devices/system/cpu/hotplug/states
> + 138: mm/vmscan:online
> + 139: mm/vmstat:online
> + 140: lib/percpu_cnt:online
> + 141: acpi/cpu-drv:online
> + 142: base/cacheinfo:online
> + 143: virtio/net:online
> + 144: x86/mce:online
> + 145: printk:online
> + 168: sched:active
> + 169: online
> +
> +=E8=A6=81=E5=B0=86CPU4=E5=9B=9E=E6=BB=9A=E5=88=B0 ``lib/percpu_cnt:onlin=
e`` =EF=BC=8C=E5=86=8D=E5=9B=9E=E5=88=B0=E5=9C=A8=E7=BA=BF=E7=8A=B6=E6=80=
=81=EF=BC=8C=E5=8F=AA=E9=9C=80=E5=8F=91=E5=87=BA::
> +
> +  $ cat /sys/devices/system/cpu/cpu4/hotplug/state
> +  169
> +  $ echo 140 > /sys/devices/system/cpu/cpu4/hotplug/target
> +  $ cat /sys/devices/system/cpu/cpu4/hotplug/state
> +  140
> +
> +=E9=9C=80=E8=A6=81=E6=B3=A8=E6=84=8F=E7=9A=84=E6=98=AF=EF=BC=8C=E7=8A=B6=
=E6=80=81140=E7=9A=84=E6=B8=85=E9=99=A4=E8=B0=83=E7=94=A8bac=E5=B7=B2=E7=BB=
=8F=E8=A2=AB=E8=B0=83=E7=94=A8=E3=80=82=E7=8E=B0=E5=9C=A8=E9=87=8D=E6=96=B0=
=E4=B8=8A=E7=BA=BF::

"callbac" seems a typo, =E5=9B=9E=E8=B0=83

> +
> +  $ echo 169 > /sys/devices/system/cpu/cpu4/hotplug/target
> +  $ cat /sys/devices/system/cpu/cpu4/hotplug/state
> +  169
> +
> +=E5=90=AF=E7=94=A8=E8=BF=BD=E8=B8=AA=E4=BA=8B=E4=BB=B6=E5=90=8E=EF=BC=8C=
=E5=8D=95=E4=B8=AA=E6=AD=A5=E9=AA=A4=E4=B9=9F=E6=98=AF=E5=8F=AF=E8=A7=81=E7=
=9A=84::
> +
> +  #  TASK-PID   CPU#    TIMESTAMP  FUNCTION
> +  #     | |       |        |         |
> +      bash-394  [001]  22.976: cpuhp_enter: cpu: 0004 target: 140 step: =
169 (cpuhp_kick_ap_work)
> +   cpuhp/4-31   [004]  22.977: cpuhp_enter: cpu: 0004 target: 140 step: =
168 (sched_cpu_deactivate)
> +   cpuhp/4-31   [004]  22.990: cpuhp_exit:  cpu: 0004  state: 168 step: =
168 ret: 0
> +   cpuhp/4-31   [004]  22.991: cpuhp_enter: cpu: 0004 target: 140 step: =
144 (mce_cpu_pre_down)
> +   cpuhp/4-31   [004]  22.992: cpuhp_exit:  cpu: 0004  state: 144 step: =
144 ret: 0
> +   cpuhp/4-31   [004]  22.993: cpuhp_multi_enter: cpu: 0004 target: 140 =
step: 143 (virtnet_cpu_down_prep)
> +   cpuhp/4-31   [004]  22.994: cpuhp_exit:  cpu: 0004  state: 143 step: =
143 ret: 0
> +   cpuhp/4-31   [004]  22.995: cpuhp_enter: cpu: 0004 target: 140 step: =
142 (cacheinfo_cpu_pre_down)
> +   cpuhp/4-31   [004]  22.996: cpuhp_exit:  cpu: 0004  state: 142 step: =
142 ret: 0
> +      bash-394  [001]  22.997: cpuhp_exit:  cpu: 0004  state: 140 step: =
169 ret: 0
> +      bash-394  [005]  95.540: cpuhp_enter: cpu: 0004 target: 169 step: =
140 (cpuhp_kick_ap_work)
> +   cpuhp/4-31   [004]  95.541: cpuhp_enter: cpu: 0004 target: 169 step: =
141 (acpi_soft_cpu_online)
> +   cpuhp/4-31   [004]  95.542: cpuhp_exit:  cpu: 0004  state: 141 step: =
141 ret: 0
> +   cpuhp/4-31   [004]  95.543: cpuhp_enter: cpu: 0004 target: 169 step: =
142 (cacheinfo_cpu_online)
> +   cpuhp/4-31   [004]  95.544: cpuhp_exit:  cpu: 0004  state: 142 step: =
142 ret: 0
> +   cpuhp/4-31   [004]  95.545: cpuhp_multi_enter: cpu: 0004 target: 169 =
step: 143 (virtnet_cpu_online)
> +   cpuhp/4-31   [004]  95.546: cpuhp_exit:  cpu: 0004  state: 143 step: =
143 ret: 0
> +   cpuhp/4-31   [004]  95.547: cpuhp_enter: cpu: 0004 target: 169 step: =
144 (mce_cpu_online)
> +   cpuhp/4-31   [004]  95.548: cpuhp_exit:  cpu: 0004  state: 144 step: =
144 ret: 0
> +   cpuhp/4-31   [004]  95.549: cpuhp_enter: cpu: 0004 target: 169 step: =
145 (console_cpu_notify)
> +   cpuhp/4-31   [004]  95.550: cpuhp_exit:  cpu: 0004  state: 145 step: =
145 ret: 0
> +   cpuhp/4-31   [004]  95.551: cpuhp_enter: cpu: 0004 target: 169 step: =
168 (sched_cpu_activate)
> +   cpuhp/4-31   [004]  95.552: cpuhp_exit:  cpu: 0004  state: 168 step: =
168 ret: 0
> +      bash-394  [005]  95.553: cpuhp_exit:  cpu: 0004  state: 169 step: =
140 ret: 0
> +
> +=E5=8F=AF=E4=BB=A5=E7=9C=8B=E5=88=B0=EF=BC=8CCPU4=E4=B8=80=E7=9B=B4=E4=
=B8=8B=E9=99=8D=E5=88=B0=E6=97=B6=E9=97=B4=E6=88=B322.996=EF=BC=8C=E7=84=B6=
=E5=90=8E=E5=8F=88=E4=B8=8A=E5=8D=87=E5=88=B095.552=E3=80=82=E6=89=80=E6=9C=
=89=E8=A2=AB=E8=B0=83=E7=94=A8=E7=9A=84=E5=9B=9E=E8=B0=83=EF=BC=8C
> +=E5=8C=85=E6=8B=AC=E5=AE=83=E4=BB=AC=E7=9A=84=E8=BF=94=E5=9B=9E=E4=BB=A3=
=E7=A0=81=E9=83=BD=E5=8F=AF=E4=BB=A5=E5=9C=A8=E8=B7=9F=E8=B8=AA=E4=B8=AD=E7=
=9C=8B=E5=88=B0=E3=80=82
> +
> +=E6=9E=B6=E6=9E=84=E7=9A=84=E8=A6=81=E6=B1=82
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E9=9C=80=E8=A6=81=E5=85=B7=E5=A4=87=E4=BB=A5=E4=B8=8B=E5=8A=9F=E8=83=BD=
=E5=92=8C=E9=85=8D=E7=BD=AE=EF=BC=9A
> +
> +``CONFIG_HOTPLUG_CPU``
> +  =E8=BF=99=E4=B8=AA=E9=85=8D=E7=BD=AE=E9=A1=B9=E9=9C=80=E8=A6=81=E5=9C=
=A8Kconfig=E4=B8=AD=E5=90=AF=E7=94=A8
> +
> +``__cpu_up()``
> +  =E8=B0=83=E5=87=BA=E4=B8=80=E4=B8=AAcpu=E7=9A=84=E6=9E=B6=E6=9E=84=E6=
=8E=A5=E5=8F=A3
> +
> +``__cpu_disable()``
> +  =E5=85=B3=E9=97=ADCPU=E7=9A=84=E6=9E=B6=E6=9E=84=E6=8E=A5=E5=8F=A3=EF=
=BC=8C=E5=9C=A8=E4=BE=8B=E7=A8=8B=E8=BF=94=E5=9B=9E=E5=90=8E=EF=BC=8C=E5=86=
=85=E6=A0=B8=E4=B8=8D=E8=83=BD=E5=86=8D=E5=A4=84=E7=90=86=E4=BB=BB=E4=BD=95=
=E4=B8=AD=E6=96=AD=E3=80=82=E8=BF=99=E5=8C=85=E6=8B=AC=E5=AE=9A=E6=97=B6=E5=
=99=A8=E7=9A=84=E5=85=B3=E9=97=AD=E3=80=82

s/=E4=BE=8B=E7=A8=8B/=E6=AD=A4=E7=A8=8B=E5=BA=8F/

> +
> +``__cpu_die()``
> +  =E8=BF=99=E5=AE=9E=E9=99=85=E4=B8=8A=E6=98=AF=E4=B8=BA=E4=BA=86=E7=A1=
=AE=E4=BF=9DCPU=E7=9A=84=E6=AD=BB=E4=BA=A1=E3=80=82=E5=AE=9E=E9=99=85=E4=B8=
=8A=EF=BC=8C=E7=9C=8B=E7=9C=8B=E5=85=B6=E4=BB=96=E6=9E=B6=E6=9E=84=E4=B8=AD=
=E5=AE=9E=E7=8E=B0CPU=E7=83=AD=E6=8B=94=E6=8F=92=E7=9A=84=E4=B8=80=E4=BA=9B=
=E7=A4=BA=E4=BE=8B=E4=BB=A3
> +  =E7=A0=81=E3=80=82=E5=AF=B9=E4=BA=8E=E9=82=A3=E4=B8=AA=E7=89=B9=E5=AE=
=9A=E7=9A=84=E6=9E=B6=E6=9E=84=EF=BC=8C=E5=A4=84=E7=90=86=E5=99=A8=E8=A2=AB=
=E4=BB=8E ``idle()`` =E5=BE=AA=E7=8E=AF=E4=B8=AD=E6=8B=BF=E4=B8=8B=E6=9D=A5=
=E3=80=82 ``__cpu_die()``
> +  =E9=80=9A=E5=B8=B8=E4=BC=9A=E7=AD=89=E5=BE=85=E4=B8=80=E4=BA=9Bper_cpu=
=E7=8A=B6=E6=80=81=E7=9A=84=E8=AE=BE=E7=BD=AE=EF=BC=8C=E4=BB=A5=E7=A1=AE=E4=
=BF=9D=E5=A4=84=E7=90=86=E5=99=A8=E7=9A=84=E6=AD=BB=E4=BA=A1=E4=BE=8B=E7=A8=
=8B=E8=A2=AB=E8=B0=83=E7=94=A8=E6=9D=A5=E4=BF=9D=E6=8C=81=E6=B4=BB=E8=B7=83=
=E3=80=82
> +
> +=E7=94=A8=E6=88=B7=E7=A9=BA=E9=97=B4=E9=80=9A=E7=9F=A5
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E5=9C=A8CPU=E6=88=90=E5=8A=9F=E4=B8=8A=E7=BA=BF=E6=88=96=E4=B8=8B=E7=BA=
=BF=E5=90=8E=EF=BC=8Cudev=E4=BA=8B=E4=BB=B6=E8=A2=AB=E5=8F=91=E9=80=81=E3=
=80=82=E4=B8=80=E4=B8=AAudev=E8=A7=84=E5=88=99=EF=BC=8C=E6=AF=94=E5=A6=82::
> +
> +  SUBSYSTEM=3D=3D"cpu", DRIVERS=3D=3D"processor", DEVPATH=3D=3D"/devices=
/system/cpu/*", RUN+=3D"the_hotplug_receiver.sh"
> +
> +=E5=B0=86=E6=8E=A5=E6=94=B6=E6=89=80=E6=9C=89=E4=BA=8B=E4=BB=B6=E3=80=82=
=E4=B8=80=E4=B8=AA=E5=83=8F=E8=BF=99=E6=A0=B7=E7=9A=84=E8=84=9A=E6=9C=AC::
> +
> +  #!/bin/sh
> +
> +  if [ "${ACTION}" =3D "offline" ]
> +  then
> +      echo "CPU ${DEVPATH##*/} offline"
> +
> +  elif [ "${ACTION}" =3D "online" ]
> +  then
> +      echo "CPU ${DEVPATH##*/} online"
> +
> +  fi
> +
> +=E5=8F=AF=E4=BB=A5=E8=BF=9B=E4=B8=80=E6=AD=A5=E5=A4=84=E7=90=86=E8=AF=A5=
=E4=BA=8B=E4=BB=B6=E3=80=82
> +
> +=E5=86=85=E6=A0=B8=E5=86=85=E8=81=94=E6=96=87=E6=A1=A3=E5=8F=82=E8=80=83
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +=E8=AF=A5API=E5=9C=A8=E4=BB=A5=E4=B8=8B=E5=86=85=E6=A0=B8=E4=BB=A3=E7=A0=
=81=E4=B8=AD:
> +
> +include/linux/cpuhotplug.h
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index b4bde9396339..59ae7c2898de 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -80,11 +80,11 @@ Todolist:
>     :maxdepth: 1
> =20
>     cachetlb
> +   cpu_hotplug
> =20
>  Todolist:
> =20
> =20
> -   cpu_hotplug
>     memory-hotplug
>     genericirq
>     protection-keys
> --=20
> 2.27.0

=E7=AB=AF=E5=8D=88=E5=AE=89=E5=BA=B7=EF=BC=81
Happy Dragon Boat Festival!

Thanks,
	Wu X.C.

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDF8CgACgkQtlsoEiKC
sIXxRwv/bxLQHG3ta9M6QcH4U8qEgkbQGK2x13fh2GPzNAe2m46JbdSTbsLfNeXs
Ff1CNv6yg9Ne4+HTX2f2wqPF+knPvE/0MhjcUMX0HQKNvqC3RcU+644z7e+e3jq4
D1K2BMuC+c3Bpjnw+ovZ9qH+UjdjX7Qy5MGRYdrcmLigkrIumO8tIYvkx/xoy728
cnkPbAVsjJlkEeSol2TbD1rHqOXZt7dR7xBxQ1UaQGPvaRPePSOw9LLzEuO0jUIy
bNOTdq586HS6WEbpHdz0fcI7F6o1aJ1hAPefqtMUw+1dP6Vkr8iTAnHyhfbc1JpD
n0usgM4WtL0rLS6r9978JeH4bvePD9TagZQvQNUv5DM3TAgouyZHRpFeh0WCv/cU
/qP9BxMHsDAo1S3RyobDAxvYndFkI7i/6SozSbnLw3vK8xURM7U5PFiXyO5CO2/K
pXsNtoeIdJiwIi8bssnTfaylL/ANDlOnruHFEWn/UHcisA4tOw6entx5Li7DJ6NH
AAqFfHXO
=gdTm
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--

