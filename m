Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B11277011
	for <linux-doc@vger.kernel.org>; Thu,  4 Sep 2025 19:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757015860; cv=none; b=ghaNTtEBo+XGAklIRJ9fh23hrjyR4qE3wdxrrbAyTP+jge/F5Pzzh1cL6njrOB0i6PyNxGGfv2L1VNbst5uHgFRn4FQnlZKM0nY2DjnBvKtLDB577NaWmxSkhyttm16x6ThwjlYeRwqKJaDzvRs30hvAzq+zav9eAICjXcaWYFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757015860; c=relaxed/simple;
	bh=AkQDfljW56aeK9hFyEplI/9Ee67wMd+uq6QJcRF62eo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AA1Sqk5+uW482JP66HUXAbgYkDCAiyj6dxV65H07zW9t7YYUupg8pGWj0Sbv0n9MQVkm7QNoQbddCl0JobvcfXIYHGUjI+dHnFht2wcGudTroyrx1o/e2oB/3zVA8HsNh7g7hIPL709yrlIpyfjgS83o7TJ3XY8iyR/n6y4tvX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iv+32+pl; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iv+32+pl"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f7cd8ec2cso1923080e87.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Sep 2025 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757015857; x=1757620657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=Iv+32+pl+RF/5u9CXQ2H/5eyAmAkycT/gu4sr+1dppOQN7ClaN1+UkvsAo99TDI91J
         JZTVbf1mcgBfbJyKlqFd/ymeo2YWyWes8minSpK/VUiXqtkViDeOzo2lbrRAE5bQek52
         q7j1d2+8Ch3M7w8baGcVVxySNOnd3S8w3zQ1FKgO/1yjTjh5HXjnSgWETLcT72Gu/vjb
         ffs9gc7cT4wIel3sXqOYcTnic/NCW8dGMWJ7sHdrnzLj4QQ/LSUXF7Rmr0UlikLNkxeq
         gW2jIybvjzI3HKgnIZedva/HORa3f5dytWHHplPHe20DUd1v5W8Uzb2HzpDXsUZFSytk
         aCsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757015857; x=1757620657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kwPz46AfjWSljE81nGPsJRjk/PBKufX3IFU3DIxO20=;
        b=A5ePg7M/FGrKmTgqX4Bg2uy5f13yFwP6Yb+EaTEvta8IvYVhQUq5joG4cjelFfzpvl
         BOvr0y6NgyouW3gYLOmwfTZQ7d1CIzaF+zmomG89BHMk83azANgtWjjTTMc+jRT5xhEI
         OfueEgxFm0/pg/24Pv36jWqtTXOg0lYJbKvbunfbb3T5V9othHptUgVgbz4HVLAmO23n
         KbLA/bvbi4VNY6I3eJ3nlWSnueddLRoO3QUn4Hm7lFBgIPtAn4dz6fljvn0gGCTQQcic
         vYoky/p6lRz4eKCDm3/f1RUAgtPrzRlxUUTrOXXfSCbhcuujbOcSWdyGaCelXETORfmv
         ABBw==
X-Forwarded-Encrypted: i=1; AJvYcCVVgkNYiXnytkUBk7dhSXD6UcwSBlDW84efvgftgJXC2uHEqp5g0Fu7qoTHjWiPDfaZrxRsQsBn7X0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPK19GE9ud7GZFf5fIGxCerd9aidDMvbEibVE4MhM7xNdWpPLk
	XCfZzc+bkVfJRmnofROOBPDhumPm4psSuT3/b2UiBarafnfoiCGm+mv9STbfEn5bE7wvRIOZjPG
	5UcD6+11oQ/aRaCizkuTVs9g5TMDJ/R8wfLmyeub5TOQqbDAuoMZZdHw=
X-Gm-Gg: ASbGncvENglnKg0zOb6vDLSFwzPcSdQIMM0zwTNkqat8kHzRYK2jXo27kaJok2lZA9r
	wpL1iO0SucsLvsBqO7htxC7L2JFb0sBqkcjAyq24P+EBjOdfjh0AHrniSkWajjEMXYsneSCfF90
	laixTHD+CMd06ceRuIy4LsknHdxwJMUNpmpaLZ06anx0pkYGWGVmZWrQlDX+A3CPe6apXGzshXk
	orOeUw=
X-Google-Smtp-Source: AGHT+IGSNGuoZa0tGd2MuceeY+rWx4+fE98zKz5kXJNG5SS9yafrJ2IfBrrLXPyBqms3qzMRhIcBxsxK/c607/IOLes=
X-Received: by 2002:a2e:a4d8:0:b0:32c:abf4:d76a with SMTP id
 38308e7fff4ca-336caf58af5mr43186631fa.38.1757015856723; Thu, 04 Sep 2025
 12:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com> <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
In-Reply-To: <20250903-ltc4283-support-v2-3-6bce091510bf@analog.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 4 Sep 2025 21:57:25 +0200
X-Gm-Features: Ac12FXySP_jPTakETmSTujg6AZkgjLE-3L81eBmgyMtwcrvqz9e4_hK7r8cr0mE
Message-ID: <CACRpkdbgcCjZbZ2HtrNO7vK1HXzrwxkrNFCzqGguq=ckKg3cFQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: gpio-ltc4283: Add support for the LTC4283
 Swap Controller
To: nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nuno,

thanks for your patch!

On Wed, Sep 3, 2025 at 12:04=E2=80=AFPM Nuno S=C3=A1 via B4 Relay
<devnull+nuno.sa.analog.com@kernel.org> wrote:

> From: Nuno S=C3=A1 <nuno.sa@analog.com>
>
> The LTC4283 device has up to 8 pins that can be configured as GPIOs.
>
> Note that PGIO pins are not set as GPIOs by default so if they are
> configured to be used as GPIOs we need to make sure to initialize them
> to a sane default. They are set as inputs by default.
>
> Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>

(...)

> +config GPIO_LTC4283
> +       tristate "Analog Devices LTC4283 GPIO support"
> +       depends on SENSORS_LTC4283

Could that be
depends on REGMAP && (SENSOR_LTC4283 || COMPILE_TEST)
?

Or does something blow up if you do that? (I guess it also needs
AUXBUS but more on that below)

should it also be

default SENSOR_LTC4283

Sof if that is compiled in (=3Dy) or module (=3Dm) then this becomes
the same by default?

> +       help
> +         If you say yes here you want the GPIO function available in Ana=
log
> +         Devices LTC4283 Negative Voltage Hot Swap Controller.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll
> +         be called gpio-ltc4283.
> +
>  config GPIO_MB86S7X

This is placed among the memory-mapped drivers, but:

> +#include <linux/auxiliary_bus.h>
(...)
> +static struct auxiliary_driver ltc4283_gpio_driver =3D {
> +       .probe =3D ltc4283_gpio_probe,
> +       .id_table =3D ltc4283_aux_id_table,
> +};
> +module_auxiliary_driver(ltc4283_gpio_driver);

Create a new submenu for auxiliary bus drivers and add it
there. We already have a submenu for MFD so why not?

menu "AUXBUS GPIO expanders"
  depends on AUXILIARY_BUS
...

Have you looked into using GPIO_REGMAP?
I guess some specials are used here so maybe it is
not possible.

Yours,
Linus Walleij
