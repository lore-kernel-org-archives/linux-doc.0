Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C13C5DA6
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985304; cv=pass; b=Rz0eDIyD90VUatpBgPlHaOCtER/B9jjVCsH8ko7HOHSTT8Kh7G8nb/aMSLguP9Leqy49L7MQBq5tYUVVw10tAKqakMPjPusnoJpgdxzDF0JH3KB2sPsLtHMi8x7MF/5VvAaOJAlNYA+pTepRUo4hu9qC59/xK2hPE6UYJZGqgBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985304; c=relaxed/simple;
	bh=0VHC4PV1n3kvmpJBB03kx86ZwKDGKzt09AXVkbRvG6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4apKu6dzEa3FWXj/ugz/w5Ko+iCbcOWx3HzWJxXHV5kYE8wOZDVbfblehsxnliDjotyLl5drIJelYOCn5CPj4LLSQV/QR6UuHVaal2Mr3L7rd6WG0LZa+/1gSjz/CLrMNTzmaJkDu/Mu9IUZ3Q6Oh6hXpoXMVlpI8aOhvm28uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUIaaVuJ; arc=pass smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUIaaVuJ"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a58f2ce443so5312211fa.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985296; cv=none;
        d=google.com; s=arc-20260327;
        b=IM6wtmgj05IozWKFHnFeK1dhX+t2/ev3P6SCXvyo30gB4a5/LVFW/Ej5/9uU/VAud7
         QsfLpVhv703mP8tI0N8NoWfXX3YrXjNkoVKYr6JPLv9b4ma+hoKYArATpH3Bbxr4fX2z
         gWye6/Y7s+9VuUGb9pki0y29GaV4unD1t2q7PuTW0fEomwk1oHwbyvQ5V5lQ7ilYUpiD
         u0JuvA5DiTpOsza1CLPW2u/1Kg+077yoJztqVm7ZIpidCxKtGEugte3vHOJjpAHDbxon
         0Q5pKwb9+zEXFHduyVCAY0DLu4I+cc48FCEdMHKonTK+ITaZovR0LqfdmATNdSYq6ycY
         L45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        fh=BVqPLBR508w9XJfYTX+Q6qzsxOeAkm0kzD9WWRoEMw0=;
        b=CoI6cvJbCaL+F5Dfw7zBzY1DnTF8J9JSSWGMYRVycY+93GBvVHxlp1uO42tJ9UI+xw
         ZeAJ6A/2NVreIorKtSxUX/p0AIGlcQWLVnBJkEA0yis0ssxnsVAymv9H6Gl5sJYRHm8j
         yR3RkmactpsYhSVGfsM2WfuN5FKBp6+SiTQXtYmPaW8jCJUorL0RCO/AZQXc76TWaiPk
         ApsJQOd21Z0LOZte/YLCe6EsYfrwUU8rrD9H0X7bUdZTz9L+VXOgxPDLkg+XvvV+4T93
         TpLYErJ6j+npTowVd7SsVEoupiWmFlS5kV65jEgNGJ3FM5e0kleE8CvaELABLp4EHAys
         3Jaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985296; x=1789590096; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=LUIaaVuJod11/3g/t6MbNyyoSX0CGO7oms/3y74cxk2EqkM2BDpR1KUNdVBrhuAfA9
         bSMPndRxSTkcgUpnYqN9zDlJgMWyAIZ1UlS4m1CFX6RVka/csj2ljbMnaDf/WDF0xUDh
         p2RzP3hZ0yLqEloDhD4nDMUMHpuQiLu3xcB5SXR3tnbFjOiY3ZxDtdXHK9mR1nh+VEF4
         TTnh0U90Ta5H05+5Kn4Vu/aOoDSE/k82LatXfdQtFVmsxCKPCz6dRSa3x5X9sCT78Hxh
         Q/o0uo7WWnZte+3/JDYeSMruLATwmPWM3pOGCjLoBwn3RAf8UCyqjrKgQFa8QCOsHz5l
         zJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985296; x=1789590096;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KA2VpArXTb8DPUcHb4yt2Z+i5iQStht727IOnEs/FJU=;
        b=ZwnNNpRWQOYHzUP+L3n2GlgtHk7kCD6D+1UtJQ9A7q91uG/Ewuo3O1dmnP+c4G8GEK
         arzpGxTyzMfU8in5Qg1c83LbxbrV8WIeAyo7dDpCgTfK2vbjSbw5K4g6bX0TQKySv796
         Arn0+R9/+RmXTKykYHRC11CZKi8GEE4KGLtP4iGk8HhwEh0gjYtCAI3f6F+XyicyhfKH
         qTq9a9QF3KSF42gvhkIHYs2/Kq0bjx9beXP8C5tEjYd2Bf4hdNrnQzdaT4NCRfgt3DDz
         xQbKaNHhvIWEVoK2cCMnf0N+J7h4FxokL6dU6ldt61bjMLr1XFUO386tj9cfvarPao9X
         8gVg==
X-Forwarded-Encrypted: i=1; AKwUvByoit3W8vytYzueYxfFGfkYdrN1uzcCO09V/U5mkDi36URo+QTKLrBTeUkynEKaFLCF3gNxuSKSxHw=@vger.kernel.org
X-Gm-Message-State: AFuF++mlWEGBTU56IxbIBs9KX0QhhQDRogqQMWRAL8Ac4pH1aQIG8Ok7
	9jRZ3yX/Ezn8SMRGIdbt5IOqGSXw2TE5TMeVusXgCRraSUSJuB2J4aEjdZVz96Q6W/PyBXIY6qF
	Rrz/U2OLfeIcfD0l6rBjvzigrzFqQfg8=
X-Gm-Gg: AYBFou2tnx4Q3Bj2aCEpMQczpf8Byl4yl8i/U2Hi4ZJ3Ktzv7uAbD+hr1AtxZq9BnJV
	ZDBlb6kl8qT/1d0FTWF1rtuR07bztbOvubHZTIntaQnt+dyoD5CQC36oxx6cTwp8rvLzxmrSqPR
	dC3WizeG07Zozyax9f1j8Xoz6IIJHA2KmwbTS5Id5yAeQ52Y5ZV/3GzeHQSqOsKxC+comr6roc2
	kLEl/xBYoY0n34aOtAEjK7xq4zmSF/oXVBz8SgzzX4ue5cOAPfNNCAM03C5H8yOcpmU5/v0sjwC
	2XRpWb1thvDTmfnr9hy5Xbs8GEknY36Y6azedl6eGpQWTboQkQpdMMixvKBCYdgEim12ZeUEUom
	IYbUTZK2rRL3uuNfSXaMmXl55ML9tIj1ygK8UwQ5nfaiX
X-Received: by 2002:a05:651c:b0f:b0:3a3:749e:31a4 with SMTP id
 38308e7fff4ca-3a58d92c643mr3500071fa.24.1788985296110; Wed, 09 Sep 2026
 13:21:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:21:24 -0300
X-Gm-Features: AcwNN1XhCWWR_p45edJ2cAUvnO6YnDwGtKUGW17Fe3LwHfhT5TU0cNccQ42bU4E
Message-ID: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>, Jesse Taube <mr.bossman075@gmail.com>, 
	Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The i.MX platform has grown support for three separate product
> lines using Cortex-M based microcontrollers over the years:
>
>  - i.MX RT1050, a high-end microcontroller
>  - Vybrid vf610 suppors running Linux on either the Cortex-A5
>    CPU or the Cortex-M4 MCU
>  - i.MX7D similarly can run Linux on the Cortex-A7 or the
>    Cortex-M4
>
> There are no known upstream users of any of those three, so
> drop support and simplify the platform to assume that an MMU
> is present.
>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Stefan Agner <stefan@agner.ch>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
>  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
>  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
>  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
>  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
>  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
>  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
>  arch/arm/configs/imxrt_defconfig              |   35 -
>  arch/arm/configs/vf610m4_defconfig            |   39 -
>  arch/arm/mach-imx/Kconfig                     |   27 +-
>  arch/arm/mach-imx/Makefile                    |    3 -
>  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
>  arch/arm/mach-imx/mach-imxrt.c                |   19 -

The imxrt1050-evk dts is used in U-Boot.

Adding Jesse and Giulio, who use this platform in U-Boot.
