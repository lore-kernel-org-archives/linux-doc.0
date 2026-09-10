Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC748D860
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045763; cv=pass; b=fq32va0GTILQs15SkyZQ/o76RDXEuR7IVt//PGIpdjnwo+EpyWK1Hhfbsn+xt4b3VorL7C8cTvAMhfokOMYdCSCqohNwZaKcvqxsNAMOPbG5yjEcokQaoopoXMTEgVKGNcQJcaqRQjQ4KwMF8VPUwxj4MMbhPKcsHdJwG0EpMK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045763; c=relaxed/simple;
	bh=OK0YfBX92H6A0Epu2Kw2rNUmQkQOp+XxcafXxrqgWXE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCVsi29qyBoLBZqSgb4Fb8fBqf8kqGReovwAakoGD4t1yhZ5LFtNx4ASdBA1G8H142Jv3N5EcQhMebR05BqET+WV+YhOt34s1AluX5XFLMYUClflf3Cb6iu6Y9Rnd0WFh8ppRez3AHfGRRWksK0ocviCpLuYUloZMcRn16hlxSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nmc8Thfj; arc=pass smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nmc8Thfj"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso10818695e9.3
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 06:09:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789045758; cv=none;
        d=google.com; s=arc-20260327;
        b=MY8LsYe8tz0cwLv1lkwDn//OSU/qscZp81C9rcu2tkXC4H6cBRflEnt8Y8KP7QB0Gf
         HBSR7z6LLKpzLx5ZeKFDhTmGPABh6QOV892Ti9eOwT0e6f6pa/EWH0jT9aALSK2kxXkP
         3BDNCNawwZLoXEcLsOWPu3v51CZyLv4/rIpx/dlQbNmiqhJ8hgJDnjenhoc/ssqbKQpK
         h06D421elBi9vd9e+aYfMBjFU7lBEPXJmu0A9n5xKC1/2l8Bkfmhx3gOS0hloG0Miemx
         9SI9tF7UIzbhTgkarQXLgct2JEtCkcYl2qGfwL9W2e5ZBCrR9EM9m6WojA3CPr58mfix
         rjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        fh=Ip/mhJ3uTaViEv6XPw1xcx9AOBinZcguUrPU3uh5qnk=;
        b=V8hCN1gCeK5O0Es7mb20voIGI216GGgkd5MJK8OYQ/jCIEeTTkFDoGEweAQGbyoyo2
         mFYdzvjGNdYgHq3ur4ctwi9hj11DgP5nVLRozQ4PXbmM5Gl/0Sm53jVfC78Y4se83Fgp
         GKa/kDE6dTRLFQXKzCys/trHR+Yo06sW+3qG+I/c0SxTGDuvqGLw5Eil85KoDMusYye/
         JWt16Fb9uxmwOMuLQB97gBS7mC67w38S6mgazpFoDe0ZoIPxme4IiO74xuO7Tc1QQvfV
         9UFoOnap45vlzEAaLX6v7YiCadkh1iFlsY/kKzp9pm4ESHnENE/fZgp1Mk+m96vMJwZS
         6O5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789045758; x=1789650558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=Nmc8ThfjVslSMqzrKT+riGIeqWXuIbbPKhuePOqXbEtive9B071Y2UmKWQ8xIFar0v
         vA/GpXEFTitK8UACRjGIY+bU+kd4zM5UNY97QSblVGvIrYfRJ0prOF7gpAAMohqvNCHw
         ADtOp2Cffsa9pyjg6w1EN3k8gJZVPkcLDY+VveKt4EHf1RVykK1+lvIc5UhcRlBf00CD
         lawTFbZgQNQm1Fvu/R2lpmTbI5fCTfEB0dlwHpnclaXnT3rxsVg5mXzxap4nBabS/Dmo
         e31sGhW4VwAzj1pm3vv+9atnWga8YADGgOYgvziJHOfkJkr3+BNMuMZZqefb7WfskKLk
         1M5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045758; x=1789650558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Df7aozBOtXp5BasAQeyfsseQI0gbS7rSN3y93pihr6s=;
        b=FOZy5mVN4qqvJCz1m1OxmeOQNycVh72grT6CmOF8+y5C1MM2AytbCjPxAMALLO3uT/
         uW9P/PJd/jQxHzYCOdrJu2sChzbTrkWxyldT0gf/Tf4fg+qjkkKopxhAclSJ99aHj7/I
         OYynrfqNrH71sgukXI0no5qSvTqR2oakQw0SkctmuPCwsMl7D7Bbjrr8Fo6Q0SObGdHZ
         wR63r8SEfQ55RIn+yXO89AuH+m/ngCz1FsoPH9NqWb6ZLpHKG5FtfBqc6QAzdb0MCbv+
         yWTb6nx8BFKgli1YE//RpOrkVSBxyO/Jz4U1uewlWT29Iq+jkxmGxAOtdLAlAQzPlwr4
         ywtw==
X-Forwarded-Encrypted: i=1; AKwUvBzTfYsKq/5ahzJQZAubdefe2tXGBKCq1fQDtriv7NNtcOq8DM/u/Y6JiABiCPCrSOOnM331BvSnpLA=@vger.kernel.org
X-Gm-Message-State: AFuF++lBYBI14UqT2sre6RKm30vXHlXafVrUyhhZuDZOjSCt7zEwzYOK
	XIBtM1fxlgrfMO/v8A/T1z3HKPOemgQDHQrn/hHGxEqDPSx3TjkOD9ji+XDzykLc5AlseDWc//M
	mXdK798TRUk3FiLhmmTfLBYoA70Ei4Xo=
X-Gm-Gg: AYBFou38enw424qc2LRMKFfIos6SfnkaeWd+XxqSugoLKvxzM/K5Nxc4UCRrYxC/mEM
	mMZrZy1aNvM2uICmXIYk1bLDmGkflTe7bSGBHjMgckFxWvyzSXQhIIpZBAKenQ68kw7V943c0PN
	EwBEVGuJQIXB/b/b21jPXAbsahKasTK/zx48cLf0cd+pl+B5EX3xO9h06dcrqcMzBOqnc7kmbHc
	+KwvRQJhKrLAiBC9G5AgdM84AW3XZM2E+K91vuNiPkiwnC3Nz8AAdfK9wpmPPMPkik8rgiwmjBT
	QLqeLoEFYN1xlmaWDOoQt4RGmqu1FDP2AmiuHpi8Qrn1gA8EYSMMC78Jn5OkVJ4xlRHudmPkEWf
	q92/USTgpjCue
X-Received: by 2002:a05:600c:6c07:b0:49d:1cc7:5ec3 with SMTP id
 5b1f17b1804b1-49d259138abmr111164355e9.9.1789045757952; Thu, 10 Sep 2026
 06:09:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
 <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
In-Reply-To: <CAOMZO5Bw72SkBChbRLg+FaYZ34ENAW95-0+LrgcrESu_YtNXFQ@mail.gmail.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Thu, 10 Sep 2026 09:08:41 -0400
X-Gm-Features: AcwNN1UEFdvIck3fXBUKab0LkOKuiFOwC71vVQo2jwIoxCjaBOCf3NRiYyhyIhY
Message-ID: <CAJFTR8RYajZ+Az9JvemMCApvUEGG3pDLq1KVkKyAsA6Luw-0BA@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Fabio Estevam <festevam@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
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

On Wed, Sep 9, 2026 at 4:21=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:
>
> On Tue, Sep 8, 2026 at 12:29=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> w=
rote:
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > The i.MX platform has grown support for three separate product
> > lines using Cortex-M based microcontrollers over the years:
> >
> >  - i.MX RT1050, a high-end microcontroller
> >  - Vybrid vf610 suppors running Linux on either the Cortex-A5
> >    CPU or the Cortex-M4 MCU
> >  - i.MX7D similarly can run Linux on the Cortex-A7 or the
> >    Cortex-M4
> >
> > There are no known upstream users of any of those three,
There is both a u-boot and buildroot config for i.MX RT1050,
I also do basic regression testing on this platform. I understand the
need to depreciate no-MMU, but it's sad to see them go.

If it helps at all to remove i.MX RT1050 there are only 11 commits
adding it that are from Giulio Benetti and I.
For i.MX RT1170 only 3 commits by me which only got partially
added. See
Commit: fff65226b229 ("pinctrl: freescale: Add i.MXRT1170 pinctrl
driver support")

I also occasionally test the stm32f429-disco as I have one.

> > so
> > drop support and simplify the platform to assume that an MMU
> > is present.
> >
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Stefan Agner <stefan@agner.ch>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Vladimir Zapolskiy <vz@mleia.com>
> > Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |    2 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-evk.dts   |   72 -
> >  arch/arm/boot/dts/nxp/imx/imxrt1050-pinfunc.h |  993 -----------
> >  arch/arm/boot/dts/nxp/imx/imxrt1050.dtsi      |  160 --
> >  arch/arm/boot/dts/nxp/imx/imxrt1170-pinfunc.h | 1561 -----------------
> >  arch/arm/boot/dts/nxp/vf/Makefile             |    2 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-colibri.dts  |   61 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4-cosmic.dts   |   88 -
> >  arch/arm/boot/dts/nxp/vf/vf610m4.dtsi         |   61 -
> >  arch/arm/configs/imxrt_defconfig              |   35 -
> >  arch/arm/configs/vf610m4_defconfig            |   39 -
> >  arch/arm/mach-imx/Kconfig                     |   27 +-
> >  arch/arm/mach-imx/Makefile                    |    3 -
> >  arch/arm/mach-imx/mach-imx7d-cm4.c            |   18 -
> >  arch/arm/mach-imx/mach-imxrt.c                |   19 -
>
> The imxrt1050-evk dts is used in U-Boot.
>
> Adding Jesse and Giulio, who use this platform in U-Boot.

Thanks for the CC,
Jesse Taube
