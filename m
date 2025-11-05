Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8785130F53E
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 11:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762341198; cv=none; b=CCeI3fXBwkpTgSdyL8NyIPCGw0RumV1OxW38EI8eP7Hz1VkuAXQP+zpGZWKmROiho558FQ4YjhXxY1wgkef2uPF5j1UIbZKRzHv3Kl+bkRfFVn5+s5QopJsTlvPWrtE6AShE98YTjjs7gkvFjVQ03o1Iuwv5Dmj82MF40BBwpWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762341198; c=relaxed/simple;
	bh=y+ju+eJvK8HzYCUKH5EbHPD0aKHBQeN8wwLP+uV2/K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hvDN6oha8L5WsAM+2awbAU5QplV3DUsl72w6idgydsu2Amh38NvQ2lUBzVGrUgHJpVauWqyTk8fcOA2T49/DmKtJdPkOXxPQ/pV+1FT+AkErErAMdMEgtQxzakXyawjoWo5GcmkrFHnsWvTttQg2f12zpTrK6qJquADyLt/b3Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UUeMFiI2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UUeMFiI2"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59052926cf9so7162591e87.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 03:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762341194; x=1762945994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JG51Hq++miK2Fex6Vfp0eKhsrvnsMhGhZv9+TnKZ4f0=;
        b=UUeMFiI2K5GitHqS5G/wlBFiXfsai5SRWNT+vI2Il+ujcLP3UZL3Ex4OxynSZjquvg
         bFvotS5qWWENEqHC9U4hWBSUJ9At+oaH1xxmzG6ECxtxkKwTd4ez5B1J4Qbje+a9ena4
         8AWXrIJLBCb2eOZQsf6EiTiUj9j+9Es6hpi/LbA6ZPylstxcEF1XOHn+QlXvUuoAl0Y5
         Xc0ofzcJrHRV1a1gusnDvUG3Lz+E7Lu1N8d/NU4JMLOK2TFjG+W3UN0nJru5s3gVTQec
         usdh5YzGOQ5y6glkWkh6M0RqBNqRjWPAZlTVZiFDKTnHIq736ND1N0IrD7WbNfBRySko
         VFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762341194; x=1762945994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JG51Hq++miK2Fex6Vfp0eKhsrvnsMhGhZv9+TnKZ4f0=;
        b=cnlTb7R3v9saXcSKZyXGjBzZOLHXzZWzCkqo7Wad8GixWgcj7J+dOkLIDumvoqULY8
         eFF87DLCSGioS8N7PfVWT+zPHWRuFqw+EJsQRsBo52FIZDvrd5YUhOTV5eiDTEv/XLyD
         6lfuUz3/Iy+tE/dGVGo2i7849mlcoPzu+yUIT9q8aBzZS0zFznw4U0RBXDO4ZkMKxbmT
         7qFu57/s3hRs9nvGgXU5Gc+czTr0YJNEPe14FSq+mD9zef3OYiKflUGhbw64rOYUcNYT
         YIoY9YBJFKL+cYTKN2Oac/tPxchgP+cG//xxeCLDhuwuLM5Pe3RqgLHATmbhO3OE7Ksa
         v68w==
X-Forwarded-Encrypted: i=1; AJvYcCU7f0f+MtouTQPNpEoAswQXHXZOYa5ClcCNPCL+HOkb8TpV1W8vsj9AbpiidI0vc9cOV3WgTwI314c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXR/tJ5j9ZjPsmWAGLJeuG7MvCKt/f4YZA/D2NHRJP7JaGHk6
	eKrJgeB/AUlgmy/vORMxR+hH1oSsqBR6Dq2SBwFLhp+yP0yzLD1RGVYA8vqzWB8Q0Vnr4aYMwiQ
	pL6jNb/utHNc7tMhsPT2JgW7rZbksTeDbz4EK3u8CfQ==
X-Gm-Gg: ASbGnctD/MvBIM0VJnLww7i6o1VTrLp6tQ96ummsaMq3xJ9lLJAn35LzMtBIZAcUQHo
	dyd2mZLVV3UVDgkerFHeuYaibOzGexYwhJMeNXgxaghaoZP2EmGnie78eRphCxUDE6wwNz8kF/h
	E0FornNnFTFPDNCbCKE0Nq/4vS8HO4aSAhhRPyDbxN7MGgffGhRLQhQSFzhNTXPfhhzF4HT47uD
	4RLP0w8ytX2EastrOSSmCeGWifqYQmPiirqf7F1XNGiGmnfNpBylFDAAboCR69IEGudKLmrcscF
	5kDcoWHd3EP510qI
X-Google-Smtp-Source: AGHT+IHDSaXviCfITtg/FMcF5Bu77Gbwi/aiVMbNVLeu3JkIbzZIrWvYPYHyWiNt0LQo+iniDeT7EH+k0eJ0DFliQVI=
X-Received: by 2002:a05:6512:61a1:b0:563:2efc:dea7 with SMTP id
 2adb3069b0e04-5943d7c9126mr1005125e87.34.1762341193497; Wed, 05 Nov 2025
 03:13:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251104-ltc4283-support-v3-0-4bea496f791d@analog.com> <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
In-Reply-To: <20251104-ltc4283-support-v3-3-4bea496f791d@analog.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 5 Nov 2025 12:13:02 +0100
X-Gm-Features: AWmQ_bmQd858eXoItm7LwqkIZXbCZS2AkKpBWiMVEPi0lh3UwpYTx2HZMgJHzUk
Message-ID: <CAMRc=MeWyDOFfUnX8eV9+9tykinB+Hd9duf-v+UOCvcYKt9g9Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 4, 2025 at 11:31=E2=80=AFAM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:
>
> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> ---
>  MAINTAINERS                 |   2 +
>  drivers/gpio/Kconfig        |  15 +++
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-ltc4283.c | 217 ++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 235 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d02fdf0a0593..76a659408c8c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14757,9 +14757,11 @@ F:     drivers/hwmon/ltc4282.c
>
>  LTC4283 HARDWARE MONITOR AND GPIO DRIVER
>  M:     Nuno S=C3=A1 <nuno.sa@analog.com>
> +L:     linux-gpio@vger.kernel.org
>  L:     linux-hwmon@vger.kernel.org
>  S:     Supported
>  F:     Documentation/devicetree/bindings/hwmon/adi,ltc4283.yaml
> +F:     drivers/gpio/gpio-ltc4283.c
>  F:     drivers/hwmon/ltc4283.c
>
>  LTC4286 HARDWARE MONITOR DRIVER
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 7ee3afbc2b05..58610f77a75e 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1741,6 +1741,21 @@ config GPIO_WM8994
>
>  endmenu
>
> +menu "AUXBUS GPIO expanders"
> +       depends on AUXILIARY_BUS
> +

Please call the section "Auxiliary Bus GPIO drivers"

It's not very clear what "AUXBUS" is.

> +config GPIO_LTC4283
> +       tristate "Analog Devices LTC4283 GPIO support"
> +       depends on SENSORS_LTC4283
> +       help
> +         If you say yes here you want the GPIO function available in Ana=
log
> +         Devices LTC4283 Negative Voltage Hot Swap Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called gpio-ltc4283.
> +
> +endmenu
> +
>  menu "PCI GPIO expanders"
>         depends on PCI
>
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index ec296fa14bfd..b6550944ed78 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -99,6 +99,7 @@ obj-$(CONFIG_GPIO_LP873X)             +=3D gpio-lp873x.=
o
>  obj-$(CONFIG_GPIO_LP87565)             +=3D gpio-lp87565.o
>  obj-$(CONFIG_GPIO_LPC18XX)             +=3D gpio-lpc18xx.o
>  obj-$(CONFIG_GPIO_LPC32XX)             +=3D gpio-lpc32xx.o
> +obj-$(CONFIG_GPIO_LTC4283)             +=3D gpio-ltc4283.o
>  obj-$(CONFIG_GPIO_MACSMC)              +=3D gpio-macsmc.o
>  obj-$(CONFIG_GPIO_MADERA)              +=3D gpio-madera.o
>  obj-$(CONFIG_GPIO_MAX3191X)            +=3D gpio-max3191x.o
> diff --git a/drivers/gpio/gpio-ltc4283.c b/drivers/gpio/gpio-ltc4283.c
> new file mode 100644
> index 000000000000..885af67146a8
> --- /dev/null
> +++ b/drivers/gpio/gpio-ltc4283.c
> @@ -0,0 +1,217 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Analog Devices LTC4283 GPIO driver
> + *
> + * Copyright 2025 Analog Devices Inc.
> + */

Add a newline.

> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitmap.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

In ASCII '_' sorts before 'u'.

With that fixed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
