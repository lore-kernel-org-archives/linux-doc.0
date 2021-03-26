Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96914C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 03:14:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6697D61A44
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 03:14:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230483AbhCZDNt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 23:13:49 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:35053 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230239AbhCZDNh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 23:13:37 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 5BF7F5C017E;
        Thu, 25 Mar 2021 23:13:33 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
  by compute6.internal (MEProxy); Thu, 25 Mar 2021 23:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type:content-transfer-encoding; s=fm1; bh=cNLkU
        i+0Hyeliugqammebo3QVr1byzna8BoCVdQ8t5k=; b=vMrBOdFKKPxKYzZ0yLnjs
        xVtX/PgVmcZdDOpBZvL7BKOqYP3+AtsVLsSR3eMPaWjKB6anCmI5ks8XXo5Y2qq8
        OsrwuuOdB9vCkgvg/n00/ot0/jLWIdwYk3JG3F0/3A50D/50jGG0W53e6MM0Vip+
        2lpaQkpK0t+nlBw/yerNLhgLFMDfkTju7koEVEnGrcRqIWBVpx9txBOSxU0yiK6y
        jxjygIhCq9WKZDQl+CeH/vayhzqEPxVVg0ah0SAdaAoECcP+Gyyf8LDsHeK3urf6
        rNhy04deJ6XG2mJCCa5TtGw7P1vGeeRv2gwkL4OVCv+aYFa7TgKnoosnjB1M2AQI
        Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=cNLkUi+0Hyeliugqammebo3QVr1byzna8BoCVdQ8t
        5k=; b=XqTtNHjjrkStGtYXpUnxNBxrZ01xSD9mpN7ok79+f0xxGA/QZxJvqX5M3
        y/PG2j8O4Np4IZNE0K3blsnmi1TbPWgnED+dXouXUmp9MLFeiTJp1CaLhYAgR5Ts
        yMw02wknyEovgA+/6mt6y2AJi6ZPSf134cZ2pUktiRZkbqqgsTTWZVXtbSCEmrTq
        INbJ/y2XSGAiZl9QnG3Nf4J7TUI0cMD7TqZXiPoexD7bSpe0HI9YgyE24Ee6ctLM
        EstjDdaFbTA5RYHLr3Bjaydz1yePbuLbokSKLLVuzampXcxXSoQ/BjIEuNpCyNgS
        Upn9WrzU8LXwPoHrInRWvt/Am6T7A==
X-ME-Sender: <xms:WlFdYOPux4MU-EOG3U68536zXP4fHmKjIMi9XUA2i1kp5VJM5-6n-w>
    <xme:WlFdYM_E-heQwhiWy5GRxkUy__rSF_uvN2AoOdCFnX-QGK4aANRPd4peTL8tIfobO
    ysrojFFcsEr5pqAr9E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudehuddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepfeetgeekveeftefhgfduheegvdeuuddvieefvddvlefh
    feehkeetfeeukedtfeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:WlFdYFQezGrN-YEOztn7aATX0duSBZ4r6kmWOm4MVJmunnw7jUqv5Q>
    <xmx:WlFdYOvNe-7HAjkkSTAB7ftSHDPxuKq-gLvwsx_XIngLzXC9svwY9w>
    <xmx:WlFdYGeTn6BW9EdnOf1FwKeDl3nnCT4sQ_zRo1pH4zOCDWMB5DzrMA>
    <xmx:XVFdYDHLAKqLkuN8Pga-Y9EABmFRvQfoWS3olCmxdyYx5lRFPNPeZg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 8346513004BF; Thu, 25 Mar 2021 23:13:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-273-g8500d2492d-fm-20210323.002-g8500d249
Mime-Version: 1.0
Message-Id: <5623c525-2898-4583-bd0c-df2dd4059bea@www.fastmail.com>
In-Reply-To: <20210324150731.4512-2-siyanteng@loongson.cn>
References: <20210324150731.4512-1-siyanteng@loongson.cn>
 <20210324150731.4512-2-siyanteng@loongson.cn>
Date:   Fri, 26 Mar 2021 11:12:54 +0800
From:   "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To:     "Yanteng Si" <siyanteng@loongson.cn>,
        "Jonathan Corbet" <corbet@lwn.net>
Cc:     "Alex Shi" <alex.shi@linux.alibaba.com>,
        "Huacai Chen" <chenhuacai@gmail.com>,
        "Harry Wei" <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, "yanteng si" <siyanteng01@gmail.com>
Subject: Re: [PATCH 1/8] docs/zh_CN: add cpu-freq core.rst translation
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On Wed, Mar 24, 2021, at 11:07 PM, Yanteng Si wrote:
> This patch translates Documention/cpu-freq/core.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/cpu-freq/core.rst      | 105 +++++++++++++++++=
+
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/cpu-freq/core.rst=

>=20
> diff --git a/Documentation/translations/zh_CN/cpu-freq/core.rst=20
> b/Documentation/translations/zh_CN/cpu-freq/core.rst
> new file mode 100644
> index 000000000000..1571087c2581
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/cpu-freq/core.rst
> @@ -0,0 +1,105 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../cpu-freq/core`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_core.rst:
> +
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +CPUFreq=E6=A0=B8=E5=BF=83=E5=92=8CCPUFreq=E9=80=9A=E7=9F=A5=E5=99=A8=E7=
=9A=84=E4=B8=80=E8=88=AC=E8=AF=B4=E6=98=8E
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=E4=B8=80=E8=88=AC -> =E9=80=9A=E7=94=A8=EF=BC=9F=20

> +
> +=E4=BD=9C=E8=80=85:
> +	- Dominik Brodowski  <linux@brodo.de>
> +	- David Kimdon <dwhedon@debian.org>
> +	- Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> +	- Viresh Kumar <viresh.kumar@linaro.org>
> +
> +.. =E7=9B=AE=E5=BD=95:
> +
> +   1.  CPUFreq=E6=A0=B8=E5=BF=83=E5=92=8C=E6=8E=A5=E5=8F=A3
> +   2.  CPUFreq=E9=80=9A=E7=9F=A5=E5=99=A8
> +   3.  =E5=90=AB=E6=9C=89Operating Performance Point (OPP)=E7=9A=84CP=
UFreq=E8=A1=A8=E7=9A=84=E7=94=9F=E6=88=90
> +
> +1. CPUFreq=E6=A0=B8=E5=BF=83=E5=92=8C=E6=8E=A5=E5=8F=A3
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +cpufreq=E6=A0=B8=E5=BF=83=E4=BB=A3=E7=A0=81=E4=BD=8D=E4=BA=8Edrivers/=
cpufreq/cpufreq.c=E4=B8=AD=E3=80=82=E8=BF=99=E4=BA=9Bcpufreq=E4=BB=A3=E7=
=A0=81=E4=B8=BACPUFreq=E6=9E=B6=E6=9E=84=E7=9A=84=E9=A9=B1
> +=E5=8A=A8=E7=A8=8B=E5=BA=8F=EF=BC=88=E9=82=A3=E4=BA=9B=E8=BF=9B=E8=A1=
=8C=E5=AE=9E=E9=99=85=E9=A2=91=E7=8E=87=E8=BD=AC=E6=8D=A2=E7=9A=84=E4=BB=
=A3=E7=A0=81=EF=BC=89=E4=BB=A5=E5=8F=8A "=E9=80=9A=E7=9F=A5=E5=99=A8 "=E6=
=8F=90=E4=BE=9B=E4=BA=86=E4=B8=80=E4=B8=AA=E6=A0=87=E5=87=86=E5=8C=96=E7=
=9A=84=E6=8E=A5=E5=8F=A3=E3=80=82

=E9=82=A3=E4=BA=9B=E6=93=8D=E4=BD=9C=E7=A1=AC=E4=BB=B6=E5=88=87=E6=8D=A2=
=E9=A2=91=E7=8E=87=E7=9A=84=E4=BB=A3=E7=A0=81 will help with understandi=
ng.


> +=E8=BF=99=E4=BA=9B=E6=98=AF=E8=AE=BE=E5=A4=87=E9=A9=B1=E5=8A=A8=E7=A8=
=8B=E5=BA=8F=E6=88=96=E9=9C=80=E8=A6=81=E4=BA=86=E8=A7=A3=E7=AD=96=E7=95=
=A5=E5=8F=98=E5=8C=96=E7=9A=84=E5=85=B6=E5=AE=83=E5=86=85=E6=A0=B8=E9=83=
=A8=E5=88=86=EF=BC=88=E5=A6=82 ACPI =E7=AD=89=E7=83=AD=E6=A8=A1=E5=9D=97=
=EF=BC=89=E6=88=96=E6=89=80=E6=9C=89=E9=A2=91=E7=8E=87=E6=9B=B4=E6=94=B9=
=EF=BC=88=E9=99=A4
Add sbject "=E9=80=9A=E7=9F=A5=E5=99=A8"
=E7=83=AD=E6=A8=A1=E5=9D=97 seems bogus, =E7=83=AD=E9=87=8F=E7=AE=A1=E7=90=
=86=EF=BC=9F

> +=E8=AE=A1=E6=97=B6=E4=BB=A3=E7=A0=81=E5=A4=96=EF=BC=89=EF=BC=8C=E7=94=
=9A=E8=87=B3=E9=9C=80=E8=A6=81=E5=BC=BA=E5=88=B6=E7=A1=AE=E5=AE=9A=E9=80=
=9F=E5=BA=A6=E9=99=90=E5=88=B6=EF=BC=88=E5=A6=82 ARM =E6=9E=B6=E6=9E=84=E4=
=B8=8A=E7=9A=84 LCD =E9=A9=B1=E5=8A=A8=E7=A8=8B=E5=BA=8F=EF=BC=89=E3=80=82=

> +=E6=AD=A4=E5=A4=96=EF=BC=8C =E5=86=85=E6=A0=B8 "=E5=B8=B8=E6=95=B0" l=
oops_per_jiffy=E4=BC=9A=E6=A0=B9=E6=8D=AE=E9=A2=91=E7=8E=87=E5=8F=98=E5=8C=
=96=E8=80=8C=E6=9B=B4=E6=96=B0=E3=80=82
> +
> +cpufreq=E7=AD=96=E7=95=A5=E7=9A=84=E5=BC=95=E7=94=A8=E8=AE=A1=E6=95=B0=
=E7=94=B1 cpufreq_cpu_get =E5=92=8C cpufreq_cpu_put =E6=9D=A5=E5=AE=8C=E6=
=88=90=EF=BC=8C=E4=BB=A5=E7=A1=AE=E4=BF=9D cpufreq =E9=A9=B1
> +=E5=8A=A8=E7=A8=8B=E5=BA=8F=E8=A2=AB=E6=AD=A3=E7=A1=AE=E5=9C=B0=E6=B3=
=A8=E5=86=8C=E5=88=B0=E6=A0=B8=E5=BF=83=E4=B8=AD=EF=BC=8C=E5=B9=B6=E4=B8=
=94=E5=9C=A8 cpufreq_put_cpu =E8=A2=AB=E8=B0=83=E7=94=A8=E4=B9=8B=E5=89=8D=
=E4=B8=8D=E4=BC=9A=E8=A2=AB=E5=8D=B8=E8=BD=BD=E3=80=82=E8=BF=99=E4=B9=9F=
=E4=BF=9D=E8=AF=81=E4=BA=86=E5=90=84=E8=87=AA=E7=9A=84
> +cpufreq =E7=AD=96=E7=95=A5=E5=9C=A8=E4=BD=BF=E7=94=A8=E6=97=B6=E4=B8=8D=
=E4=BC=9A=E8=A2=AB=E9=87=8A=E6=94=BE=E3=80=82

It makes me "Parser error" when reading.....

> +
> +2. CPUFreq =E9=80=9A=E7=9F=A5=E5=99=A8
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +CPUFreq=E9=80=9A=E7=9F=A5=E5=99=A8=E7=AC=A6=E5=90=88=E6=A0=87=E5=87=86=
=E7=9A=84=E5=86=85=E6=A0=B8=E9=80=9A=E7=9F=A5=E5=99=A8=E6=8E=A5=E5=8F=A3=
=E3=80=82
> +=E5=85=B3=E4=BA=8E=E9=80=9A=E7=9F=A5=E5=99=A8=E7=9A=84=E7=BB=86=E8=8A=
=82=E8=AF=B7=E5=8F=82=E9=98=85 linux/include/linux/notifier.h=E3=80=82
> +
> +=E8=BF=99=E9=87=8C=E6=9C=89=E4=B8=A4=E4=B8=AA=E4=B8=8D=E5=90=8C=E7=9A=
=84CPUfreq=E9=80=9A=E7=9F=A5=E5=99=A8 - =E7=AD=96=E7=95=A5=E9=80=9A=E7=9F=
=A5=E5=99=A8=E5=92=8C=E8=BD=AC=E6=8D=A2=E9=80=9A=E7=9F=A5=E5=99=A8=E3=80=
=82
> +
> +
> +2.1 CPUFreq=E7=AD=96=E7=95=A5=E9=80=9A=E7=9F=A5=E5=99=A8
> +----------------------------
> +
> +=E5=BD=93=E5=88=9B=E5=BB=BA=E6=88=96=E7=A7=BB=E9=99=A4=E7=AD=96=E7=95=
=A5=E6=97=B6=EF=BC=8C=E8=BF=99=E4=BA=9B=E9=83=BD=E4=BC=9A=E8=A2=AB=E9=80=
=9A=E7=9F=A5=E3=80=82
> +
> +=E9=98=B6=E6=AE=B5=E6=98=AF=E5=9C=A8=E9=80=9A=E7=9F=A5=E5=99=A8=E7=9A=
=84=E7=AC=AC=E4=BA=8C=E4=B8=AA=E5=8F=82=E6=95=B0=E4=B8=AD=E6=8C=87=E5=AE=
=9A=E7=9A=84=E3=80=82=E5=BD=93=E7=AC=AC=E4=B8=80=E6=AC=A1=E5=88=9B=E5=BB=
=BA=E7=AD=96=E7=95=A5=E6=97=B6=EF=BC=8C=E9=98=B6=E6=AE=B5=E6=98=AFCPUFRE=
Q_CREATE_POLICY=EF=BC=8C=E5=BD=93
> +=E7=AD=96=E7=95=A5=E8=A2=AB=E7=A7=BB=E9=99=A4=E6=97=B6=EF=BC=8C=E9=98=
=B6=E6=AE=B5=E6=98=AFCPUFREQ_REMOVE_POLICY=E3=80=82
> +
> +=E7=AC=AC=E4=B8=89=E4=B8=AA=E5=8F=82=E6=95=B0 ``void *pointer`` =E6=8C=
=87=E5=90=91=E4=B8=80=E4=B8=AA=E7=BB=93=E6=9E=84=E4=BD=93cpufreq_policy=EF=
=BC=8C=E5=85=B6=E5=8C=85=E6=8B=ACmin=EF=BC=8Cmax(=E6=96=B0=E7=AD=96=E7=95=
=A5=E7=9A=84=E4=B8=8B=E9=99=90=E5=92=8C
> +=E4=B8=8A=E9=99=90=EF=BC=88=E5=8D=95=E4=BD=8D=E4=B8=BAkHz=EF=BC=89)=E8=
=BF=99=E5=87=A0=E4=B8=AA=E5=80=BC=E3=80=82
> +
> +
> +2.2 CPUFreq=E8=BD=AC=E6=8D=A2=E9=80=9A=E7=9F=A5=E5=99=A8
> +--------------------------------
> +
> +=E5=BD=93CPUfreq=E9=A9=B1=E5=8A=A8=E5=88=87=E6=8D=A2CPU=E6=A0=B8=E5=BF=
=83=E9=A2=91=E7=8E=87=E6=97=B6=EF=BC=8C=E7=AD=96=E7=95=A5=E4=B8=AD=E7=9A=
=84=E6=AF=8F=E4=B8=AA=E5=9C=A8=E7=BA=BFCPU=E9=83=BD=E4=BC=9A=E6=94=B6=E5=
=88=B0=E4=B8=A4=E6=AC=A1=E9=80=9A=E7=9F=A5=EF=BC=8C=E8=BF=99=E4=BA=9B=E5=
=8F=98=E5=8C=96=E6=B2=A1=E6=9C=89=E4=BB=BB=E4=BD=95=E5=A4=96=E9=83=A8=E5=
=B9=B2
> +=E9=A2=84=E3=80=82
> +
> +=E7=AC=AC=E4=BA=8C=E4=B8=AA=E5=8F=82=E6=95=B0=E6=8C=87=E5=AE=9A=E9=98=
=B6=E6=AE=B5 - CPUFREQ_PRECHANGE or CPUFREQ_POSTCHANGE.
> +
> +=E7=AC=AC=E4=B8=89=E4=B8=AA=E5=8F=82=E6=95=B0=E6=98=AF=E4=B8=80=E4=B8=
=AA=E5=8C=85=E5=90=AB=E5=A6=82=E4=B8=8B=E5=80=BC=E7=9A=84=E7=BB=93=E6=9E=
=84=E4=BD=93cpufreq_freqs=EF=BC=9A
> +
> +=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +cpu	=E5=8F=97=E5=BD=B1=E5=93=8Dcpu=E7=9A=84=E7=BC=96=E5=8F=B7
> +old	=E6=97=A7=E9=A2=91=E7=8E=87
> +new	=E6=96=B0=E9=A2=91=E7=8E=87
> +flags	cpufreq=E9=A9=B1=E5=8A=A8=E7=9A=84=E6=A0=87=E5=BF=97
> +=3D=3D=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +3. =E5=90=AB=E6=9C=89Operating Performance Point (OPP)=E7=9A=84CPUFre=
q=E8=A1=A8=E7=9A=84=E7=94=9F=E6=88=90
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E5=85=B3=E4=BA=8EOPP=E7=9A=84=E7=BB=86=E8=8A=82=E8=AF=B7=E5=8F=82=E9=
=98=85 Documentation/power/opp.rst
> +
> +dev_pm_opp_init_cpufreq_table -
> +	=E8=BF=99=E4=B8=AA=E5=8A=9F=E8=83=BD=E6=8F=90=E4=BE=9B=E4=BA=86=E4=B8=
=80=E4=B8=AA=E9=9A=8F=E6=97=B6=E5=8F=AF=E7=94=A8=E7=9A=84=E8=BD=AC=E6=8D=
=A2=E7=A8=8B=E5=BA=8F=EF=BC=8C=E7=94=A8=E6=9D=A5=E5=B0=86OPP=E5=B1=82=E5=
=85=B3=E4=BA=8E=E5=8F=AF=E7=94=A8=E9=A2=91=E7=8E=87=E7=9A=84=E5=86=85=E9=
=83=A8=E4=BF=A1=E6=81=AF=E7=BF=BB=E8=AF=91=E6=88=90=E4=B8=80=E7=A7=8D=E5=
=AE=B9=E6=98=93=E6=8F=90=E4=BE=9B=E7=BB=99
> +	cpufreq=E7=9A=84=E6=A0=BC=E5=BC=8F=E3=80=82
> +
> +	.. Warning::
> +
> +		=E4=B8=8D=E8=A6=81=E5=9C=A8=E4=B8=AD=E6=96=AD=E4=B8=8A=E4=B8=8B=E6=96=
=87=E4=B8=AD=E4=BD=BF=E7=94=A8=E6=AD=A4=E5=87=BD=E6=95=B0=E3=80=82
> +
> +	=E4=BE=8B=E5=A6=82::
> +
> +	 soc_pm_init()
> +	 {
> +		/* Do things */
> +		r =3D dev_pm_opp_init_cpufreq_table(dev, &freq_table);
> +		if (!r)
> +			policy->freq_table =3D freq_table;
> +		/* Do other things */
> +	 }
> +
> +	.. note::
> +
> +		=E8=AF=A5=E5=87=BD=E6=95=B0=E5=8F=AA=E6=9C=89=E5=9C=A8CONFIG_PM_OPP=
=E4=B9=8B=E5=A4=96=E8=BF=98=E5=90=AF=E7=94=A8=E4=BA=86CONFIG_CPU_FREQ=E6=
=97=B6=E6=89=8D=E5=8F=AF=E7=94=A8=E3=80=82
> +
> +dev_pm_opp_free_cpufreq_table
> +	=E9=87=8A=E6=94=BEdev_pm_opp_init_cpufreq_table=E5=88=86=E9=85=8D=E7=
=9A=84=E8=A1=A8=E3=80=82
> --=20
> 2.25.1
>=20
>

--=20
- Jiaxun
