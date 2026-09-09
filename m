Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24C03CA4A0
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 20:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788985087; cv=pass; b=XusPAJv262+Ki1NnzHX0jgVteczMRdcVNX1XDMtC7XdjVyNcIt5CD4wmGgUf1ADa1BuBn7HMCk46eLevw93D5CCx60ISes1bx9BN2pL9JmI6CiOENfnnjgLGyrGkvLyefBazUVvgmJWJhITCKrkka/ppuTDV7fCNqCrtO1vSR4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788985087; c=relaxed/simple;
	bh=r0SYPe6/MLvVhiIoMkAkIXOuQ6dRGOznaSyuFqfT4PU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WPgSQYfRDUDPeyae/udINMWGW1qNBBXOPTw66i/TY544fxApK32CNeiqMAi0Qkn6nG9x38oVeKzCfH5GZ+9AzvSdJFQze0l5cZnvtq1USrB6nqn5h23qJLGrGsYtkQglLdDJtOtvsM+lKyGbCL0G/nOR+PtQDVKgGCIRtK67CqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=smJQALHJ; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="smJQALHJ"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b4afc8465eso437817e87.2
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 13:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788985078; cv=none;
        d=google.com; s=arc-20260327;
        b=iGKwqJiXeEbJoOrj2EP2f+jlXla+42vt6yDfASYLTVdyqKD1otou53beUCCSZtKb79
         +hMB5FXpb1OUp4/IhTkPcLPFnMa9vREwpwMAeKNk73z5kp3JhtEQqI6p610uMwvruqRV
         3OBwFlrYUG6OKb5/VRcfMyyt3Ud+AQ2bUR1kYtmOYpVVaONGBIhyqc54pdbENCTQ/Qre
         WPcYtFyclEHkhSBYaMZarpdPYA7O9aDMaKmUY6PM72PD1B49bke4O5dopBG1bisAdbnG
         vEj6o3dKZQq6wghCvJmHFfA/T5p8fEpsZrlJsFWAoODGiCAo6597eIX+oyEBQRjQUWtb
         25Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        fh=wDKRQBJxWNIH/NjbPBMqt7PUpETEj1t2vlb2walxhbw=;
        b=IriY/PVAa/ikogwEiMgyfcS0NQ3Qrupel79OYrkhKI9M/ctz/kIlbwFhXk4qotwQwG
         GUgCcZTkOE+8YgfYdmOn/KomCZEjpwod5BWZC+l50ToiXwsh6wBZJE3AXake0x01F2nV
         WB8H2KAwmNo59qlcKhckmqheFKLmYQsjK22AzZY6DhsDDiqezElpbKKsiq4aPvNHliTL
         Ez8626cYDcdiJp816XUewsOv2hMOpNa7s4cSual3tXFnauX2fUx6hOZYkt2uWBgvYtIR
         8iDnb30R3wP+GAY1t+V39tvlCDGuH7JoYE0loyOr64Ba7nA/cH0RuXEYKLluDFDBVE9B
         RmYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788985078; x=1789589878; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=smJQALHJEKLggOAUE3JHMc4GrHnhEz7kBOpoYZ+TN9qx1gucc9icC6ZGkjkY25N0Hc
         hwOKnXbTnOmQlCMiX8WY7Wbjwvsib1tfB2qyB6MqkouZEUe5OjkyThv3qA5myAKF01PX
         BmLKDkjM5hOjVkYHLAanr63ETq0E9LC2GSoZqoox6EZvrQR6uYEu/UVdyTXh2zgSk1V2
         M024205Bv8hrlzM4HVPzmnPrUR/+dlNMyqZLhQMLQvjtwdq7uJLqGI2km027Yh8QgtFu
         7WIf3RmVmKLsaxk6qGoIS24SCB7zbMPTLBu8TI43Ok91YY3/KlWDJj6JYoMwuHjkDq5x
         NhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788985078; x=1789589878;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rU/edVWvN0al2QuqioTnSDLV4+asJJGA8jcDggwnG3A=;
        b=so3hLeH6XogLY+lzf6bpDVzHocJbo2kLfQbakKN6za97XeEfu+OS5s8u+IJylMcLhj
         19+CvgPeRdbZJcW7vXqw1TeNlRPnull9W68rC4gAfcg9tyQdDjJYSfFuciYl4Ik9k9XR
         XvWBlGHjOvOmRy79UGQ3t4NqsFm6tc81GSqdY8wAwirW9zXrO0VM8zcCayaVfmz0dO0X
         ZwOUFr7/ZdeVW0B+RoZRlYR0NZW0WXyvpwEGD+4F9ldqaDc5sR5SwLVeR6IVP0KaCmxW
         byTuujJ1egP1PiprE+CzAVmCialmhQ8Wa8d+AGl517CCXL3cFTkwk/Yv9UWTTtKoGe3j
         aI4g==
X-Forwarded-Encrypted: i=1; AKwUvByK5A0QtBg7VpUL9jDrYHuMpr97a6d3ylhVL2uvm8zeh7Z//V60V2K579ZfO1/3OjA1dLcuFrLm3l8=@vger.kernel.org
X-Gm-Message-State: AFuF++ncpfUJ7eLd4M1BFDkQrHtCnqAmqSt0yUU6IuU9B0f9gqRggNbG
	jezfAXHNdlguj3xyP9WFw1WiUgryLV0/nTfiE15EiYlYAZ2T67fTlIJnsU4Yd6ZFb+CqGmRfGkr
	Yz9alE1QFnEAErylyeBZm3M6TOVCY+fI=
X-Gm-Gg: AYBFou0fzcgQkYWWt+FBGW7ZVAaasSw+6OYVpHFBNu3idjO0xggja4foS/lVnJZvVZi
	OKF2hIlaoG0HXmcZhmQpkcdUQ6BlmNjLhYYy66u+HaJSC/Ut9hGGhgHAQOUkkBDpSoYzc4fXdgz
	f1HQ8XCorWDHomZEK8LPto16ZVBE81nrO+lj12qBiv8K7EiiBnTWiLHGd3Ei7jDckSR8Bp/SzV/
	aEAiN+PwylzncaqRsbxxLtAUpWoC/EBvHAhPGvvIz3Lea5EWaqKi8KoZR6uFuos6Z4jk/SrDteJ
	Gw7VL8WEz/UhZ47xFqx9IB8i1QcBm87MIRGhBA0OvTZxRLLJjaQznWxRjdKQZkZ7oeWiiTeAnQw
	GUeT+cPHZs5l+7UM0q85uXv1dNkwMjRGmATeJ42GMfJGJ
X-Received: by 2002:a05:6512:acd:b0:5b6:1a7c:fd86 with SMTP id
 2adb3069b0e04-5b61a7cfdb9mr6159278e87.44.1788985077633; Wed, 09 Sep 2026
 13:17:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-9-arnd@kernel.org>
In-Reply-To: <20260908152808.3928630-9-arnd@kernel.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 9 Sep 2026 17:17:46 -0300
X-Gm-Features: AcwNN1WKZQyaGADU6lkE-GsXnisq5MVghkNUlNC3CqrQiDAXJmgIgXPSi_5sivU
Message-ID: <CAOMZO5B4q01XRGRfK_LoR1SWkvdP-_fbSHrE4BYq7gVf7k0Xwg@mail.gmail.com>
Subject: Re: [PATCH 08/13] ARM: imx: remove nommu support
To: Arnd Bergmann <arnd@kernel.org>
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
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Giulio Benetti <giulio.benetti@benettiengineering.com>
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
