Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E325C2FFDFB
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762344713; cv=none; b=ACs/+sxEC4kTj/1YNyL3J7yeYd5y4aYbcsoLGk1tAcjETN6eIgNzhrB/PvMhpPwtt+xoXtHtl+vd81UAYqDM46MsP1g6LHfhtGE93mwbODoH7MSsSh8IlF+ujCCmLq2paSoiTiFRYMjvuEv0LsJCXjpYErunXdmKsoOm+Vm5IWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762344713; c=relaxed/simple;
	bh=zaKNP8iv58DKJqCIt8itiElCUyIyiBazXKQF3KfbDRA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sIazQG2RCp4c7hkPGPpHbW17j52oidGc+bGmC+/Nj+NlJcjjMcVENIteCxKAp4Ag3ZuHcHLL2j1a3fDk+h7T50Cl/nzMDYWJShxoTgf7SZ6+M8gUyDWcr3IJBkRX91HaQ9GDATqo5oK/8fS6wx3mYzipi0NFv5iaStD0Vcuh/2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boEzyyTq; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boEzyyTq"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c7869704so4602897f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762344710; x=1762949510; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zaKNP8iv58DKJqCIt8itiElCUyIyiBazXKQF3KfbDRA=;
        b=boEzyyTqpAZF/bPKGSk/zxOfT8CkhaAW966/80p03JBCY/e91vECfZrmztREqiyNq0
         K40y0bnq8rlosvDP2Kc7KEARfNu/pg40VlPyzSxz5mtu8YXhpRjJHqaGvuZ33wcgBoa/
         E8UJ1Yh9S2hA1H9Tqe6HF27pGXmKqqH/3j0rKYqor5dlvprKYAEo2TrOY/RQzzgUyCto
         xtpNz9zSyNnrXSoyfZNV5vaWx+Iyn1koUCDLId8MYwi1RN0EWPPOU0i9FF9WVaI1fx0f
         uwPKtMffsSiuZTHBgVpSZIlsmvnuBSy6IwKpnbtbxRiHlKXDZYu4Q1mkDHjUoSqRY6iS
         X4Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762344710; x=1762949510;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zaKNP8iv58DKJqCIt8itiElCUyIyiBazXKQF3KfbDRA=;
        b=s9xpmcajuhfOvCE3oD8JqQLcYMZR7HP2MzqdDa9ug5Lc+qSH6VX4D9FudH3sj52F/x
         MI5+czL68qxqKaKpO2zFtMlGs8qlzDjijvrXZCUaR/+HHHJd+eaPmsGBL1/r2Na2UXay
         0th6vGC5hWa6VdGaIGSNh9BbhfxHjUFv5YhLTQNljnIMTiW7gVyHocMLRJJBO1quTiKj
         tqHEsr9zFJB5u6zSBlherEK+UhqiRId94vXIDlpX54b9hPC6w3ZAmUHHs05I0gusd+/z
         SrdF6gJyr4R9fJZJPX5vjSjeCTG4fV+hWuP71Y4X/2lL/0KOvKZlhjVLRz4N5WjW023c
         A/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVtii8YM32KrrlIZzpejg20Vi2AjFvDxX0giwSq1Sn78LxELtZoQj4K6GR57eIRxg3i6FrkeoNdnTo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb/eJgmT7JctSEpo8wz5Td85D+hpC8bc4wcvukFVahPK9JCSHH
	w6BMI22uePn7Dwzr/V4RK0a3dzt/7UA0/2kIPe4qNqK/0KrxW9dVzX7QF6XyOg==
X-Gm-Gg: ASbGnculT77RqY9gFkCfJnywPyniFZueBcc3em+SpMdkBalx4vExSM4Rr1ek2jloPuJ
	vBqQsgWpeKPhTaa5rrn9ZrYvqf9a8AHiTmP/vHmo1v9ha+pbTDYz0u7vlEau4sDAdOw10xbRjrp
	i03HbYsilwbq4Kt7aDUflW4bVmgpj4DdrImpj4cjBzb8zA6P+7E/tikIl69pGNdwdSdVZqhTGWY
	s0uLPUqw6EzYMgLai18GLc2Y4unsVJa2x6XcX4ar8dBEuDoAaj18CkNry4DNJx3m9cS3R/7Fgwr
	+Iz9DeT+TqOjpiuhUwPbAeWFzNVB9zQ1AaDU3c2PipROgD1yYeCkxjznXp3USiNTP3rc/RsXsqp
	SbUUWIq5wnJUx9kANFkUAiilclgCwrg1q8Qaet1h+jKXuZRFe4I90ZncYgiLl2ucm0E5sMSBasp
	jl4emWeWmg5eivDIk7QGA=
X-Google-Smtp-Source: AGHT+IG+PF6m1EhB7XL6OLeHfppwXzSzNI2WS3nGxmt5X3XJGlkjuHUrbhfSK6MiWla0TyRg594cWg==
X-Received: by 2002:a05:6000:220e:b0:425:825d:2c64 with SMTP id ffacd0b85a97d-429e32e6bfamr2400691f8f.17.1762344710071;
        Wed, 05 Nov 2025 04:11:50 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429dc1a850fsm10379544f8f.20.2025.11.05.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:11:49 -0800 (PST)
Message-ID: <be118b069b451e96ec689e49d714b0b0452afebd.camel@gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jean Delvare
	 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet
	 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 05 Nov 2025 12:12:25 +0000
In-Reply-To: <CAMRc=MeWyDOFfUnX8eV9+9tykinB+Hd9duf-v+UOCvcYKt9g9Q@mail.gmail.com>
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com>
	 <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
	 <CAMRc=MeWyDOFfUnX8eV9+9tykinB+Hd9duf-v+UOCvcYKt9g9Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-11-05 at 12:13 +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 4, 2025 at 11:31=E2=80=AFAM Nuno S=C3=A1 via B4 Relay
> <devnull+nuno.sa.analog.com@kernel.org> wrote:
> >=20
> > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> >=20
> > The LTC4283 device has up to 8 pins that can be configured as GPIOs.
> >=20
> > Note that PGIO pins are not set as GPIOs by default so if they are
> > configured to be used as GPIOs we need to make sure to initialize them
> > to a sane default. They are set as inputs by default.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > =C2=A0drivers/gpio/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 15 +++
> > =C2=A0drivers/gpio/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 1 +
> > =C2=A0drivers/gpio/gpio-ltc4283.c | 217 +++++++++++++++++++++++++++++++=
+++++++++++++
> > =C2=A04 files changed, 235 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index d02fdf0a0593..76a659408c8c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -14757,9 +14757,11 @@ F:=C2=A0=C2=A0=C2=A0=C2=A0 drivers/hwmon/ltc42=
82.c
> >=20
> > =C2=A0LTC4283 HARDWARE MONITOR AND GPIO DRIVER
> > =C2=A0M:=C2=A0=C2=A0=C2=A0=C2=A0 Nuno S=C3=A1 <nuno.sa@analog.com>
> > +L:=C2=A0=C2=A0=C2=A0=C2=A0 linux-gpio@vger.kernel.org
> > =C2=A0L:=C2=A0=C2=A0=C2=A0=C2=A0 linux-hwmon@vger.kernel.org
> > =C2=A0S:=C2=A0=C2=A0=C2=A0=C2=A0 Supported
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0 Documentation/devicetree/bindings/hwmo=
n/adi,ltc4283.yaml
> > +F:=C2=A0=C2=A0=C2=A0=C2=A0 drivers/gpio/gpio-ltc4283.c
> > =C2=A0F:=C2=A0=C2=A0=C2=A0=C2=A0 drivers/hwmon/ltc4283.c
> >=20
> > =C2=A0LTC4286 HARDWARE MONITOR DRIVER
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 7ee3afbc2b05..58610f77a75e 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1741,6 +1741,21 @@ config GPIO_WM8994
> >=20
> > =C2=A0endmenu
> >=20
> > +menu "AUXBUS GPIO expanders"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on AUXILIARY_BUS
> > +
>=20
> Please call the section "Auxiliary Bus GPIO drivers"
>=20
> It's not very clear what "AUXBUS" is.
>=20
> > +config GPIO_LTC4283
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "Analog Devices LTC4283 =
GPIO support"
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on SENSORS_LTC4283
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If you say yes here y=
ou want the GPIO function available in Analog
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Devices LTC4283 Negat=
ive Voltage Hot Swap Controller.
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This driver can also =
be built as a module. If so, the module will
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 be called gpio-ltc428=
3.
> > +
> > +endmenu
> > +
> > =C2=A0menu "PCI GPIO expanders"
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on PCI
> >=20
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index ec296fa14bfd..b6550944ed78 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -99,6 +99,7 @@ obj-$(CONFIG_GPIO_LP873X)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-lp873x.o
> > =C2=A0obj-$(CONFIG_GPIO_LP87565)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-lp87565.o
> > =C2=A0obj-$(CONFIG_GPIO_LPC18XX)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-lpc18xx.o
> > =C2=A0obj-$(CONFIG_GPIO_LPC32XX)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-lpc32xx.o
> > +obj-$(CONFIG_GPIO_LTC4283)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-ltc4283.o
> > =C2=A0obj-$(CONFIG_GPIO_MACSMC)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-macsmc.o
> > =C2=A0obj-$(CONFIG_GPIO_MADERA)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-madera.o
> > =C2=A0obj-$(CONFIG_GPIO_MAX3191X)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +=3D gpio-max3191x.o
> > diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> > new file mode 100644
> > index 000000000000..885af67146a8
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-ltc4283.c
> > @@ -0,0 +1,217 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Analog Devices LTC4283 GPIO driver
> > + *
> > + * Copyright 2025 Analog Devices Inc.
> > + */
>=20
> Add a newline.
>=20
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/bitmap.h>
> > +#include <linux/bits.h>
> > +#include <linux/device.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/mod_devicetable.h>
>=20
> In ASCII '_' sorts before 'u'.
>=20
> With that fixed:
>=20
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thx, will change it on v4

- Nuno S=C3=A1

