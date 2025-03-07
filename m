Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6751221146D
	for <linux-doc@vger.kernel.org>; Fri,  7 Mar 2025 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741344737; cv=none; b=l/mie47pOvyUknsG9UWn3sVl9M4GinwfgEm892UYurhwaZ7pl6VADXLCG6hm6im5Sczay2suJIZuofiwBfbzq/Z9T+D9qys8p/jDiY5Bk7DxSmvw8O0xRUOkycV2whZxs5oRNfaLIQmG87TuJlFdOQRgdzTBd8lU/e78lwggzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741344737; c=relaxed/simple;
	bh=UPiCGB7id3J1Lgv5V6c3KuQAx79xGzzqfArR+kR1p9s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MexTvN0lWvfWDTXD9n+fr89V6EuBNwZmJXgTQtJbl4ZPW4LzWcpIuGUYkzqNXb8c8J2cH4T31mJi9BbrX3VcQZNTApzgKQupW1200lgye7L2NsuuE08oyqZ4HUFoXG/1pyEyvMV0l2gNuCa12Sg9EajJRQqm84r8gL6jwmo0AtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=t5kx29Dg; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t5kx29Dg"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3061513d353so18359721fa.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Mar 2025 02:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741344733; x=1741949533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43iEn7JI+JVfImukURZDy+wlnZTduIdMuwCwHiHb2L4=;
        b=t5kx29DgxBLwFRgGeyWORnNiym1+ant4k42yo+o6x8/DbCtFzJ0pls25N2fpxdEJ16
         QqR4I7/186AzIkgn+JY5nr5z8+YYLIf/jnSJ4YCmBRotuBXEqMn1fPwoJjBWxor//59c
         I+R59OJXTN1RuvfYaZDpoa/xcoidwoMEYhJDcl+lUyhWD5pRnZkk6erLnfUSyNw56S3d
         gS3AAx36HghDf4pZw1i0Abu9/UZqSyxBTiiMLpCiwca3se4AguW/fDizGAa3mRYxhxWG
         UXQlo0CI2/N7oaFQ6kwCbpB4fymeAhjr94axZMqYsKiO6Aue17hwTEPa3/hL2nF91vuy
         O9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741344733; x=1741949533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43iEn7JI+JVfImukURZDy+wlnZTduIdMuwCwHiHb2L4=;
        b=LudsbgXwR86kc3aJOYihXtatWib+pOqYFPZbSweMaZ4HtfxWMgM/1S1O5bv64/CSl8
         U/52P2/U7utB5b2nUiPrv1+2B/uUsCsq+t5Hiy8uzkWzpkfT9/yEheNBEeYoZ9A81b/+
         p2Kf4eSBLQgyoEW97bR2zWVL6Asjmm/BUrQd9u18Y34IRrQLTl/35TmnXj5ML/aYPGgL
         hb0BZWkd6BtVNPTeh9PihgrVQPN2BXG7WfLcKgP2f1clkQoKXsebjFgmjdQHo1UsVnNP
         k+5AVcldOZCqFAzkRymp6aQxK73FDeBwhtD65pbX26gu/vEhGQiGOkCSHR/g+QKe5BKW
         2USg==
X-Forwarded-Encrypted: i=1; AJvYcCVGoCoWMovAwFDMT/kdjl4ojukKOCLZOS371MUC1zZlKHCUeWotIKuo34qo2wwRPO6JYVi2MLEACo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKh9Z89Z51R3ysSCZWDMy+1roLRPfLfzSmMg8RfeLhE14UHWvn
	vA/jWTQ9HTPhOtnoBVOKTPhOLrGge4FA2P42FNswdD0EiDyu8/jWGVc3h6Ty7nsopD2OnEhL/5Y
	1YiIDGKsyK3/xvPows8uvEgHF1qEB7ViSzLHy7Q==
X-Gm-Gg: ASbGncsvmRsZRQLQbxs1x/wENhIcOcqBVOA/+18WYXIpzAXhBMii1ym66XbcUK+y8CX
	QXDOThISXA307mczTkV48FAsVPAeMsTJ6mv15sJrUrZDYHBcLhO4ohObZlEzXv8n93Y1dEn8h3S
	pNJl2DnGRRHbWSolfxpJ+DugPZpQ==
X-Google-Smtp-Source: AGHT+IHB3kK56vH8JV6/mkLBm8uqvR7p6MJCGGVmcvlyTK2KPum07gwr4GAktMuyL3uRXkIC0qo1105z0ZQF6RQulRM=
X-Received: by 2002:a05:651c:1546:b0:308:efa4:d277 with SMTP id
 38308e7fff4ca-30bf451a693mr10523131fa.15.1741344732515; Fri, 07 Mar 2025
 02:52:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250306-iio-driver-ad4052-v1-0-2badad30116c@analog.com> <20250306-iio-driver-ad4052-v1-3-2badad30116c@analog.com>
In-Reply-To: <20250306-iio-driver-ad4052-v1-3-2badad30116c@analog.com>
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 7 Mar 2025 11:52:01 +0100
X-Gm-Features: AQ5f1JoiUtEQ4jvbbzJp6JsM_Z5iT3lzE5Y0UsgAtaayiupCCfLSsOBfI0fpWNs
Message-ID: <CAMknhBFiZZUtCkTjQ=AVSgwqe=wCkMnqAmaTqvW_X6fm1OKuYA@mail.gmail.com>
Subject: Re: [PATCH 3/4] docs: iio: new docs for ad4052 driver
To: Jorge Marques <jorge.marques@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 6, 2025 at 3:04=E2=80=AFPM Jorge Marques <jorge.marques@analog.=
com> wrote:
>
> This adds a new page to document how to use the ad4052 ADC driver.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  Documentation/iio/ad4052.rst | 93 ++++++++++++++++++++++++++++++++++++++=
++++++
>  MAINTAINERS                  |  1 +
>  2 files changed, 94 insertions(+)
>
> diff --git a/Documentation/iio/ad4052.rst b/Documentation/iio/ad4052.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..cf0cbd60d0a48ea52f74ea02f=
de659fcdba61aa1
> --- /dev/null
> +++ b/Documentation/iio/ad4052.rst
> @@ -0,0 +1,93 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +AD4052 driver
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +ADC driver for Analog Devices Inc. AD4052 and similar devices.
> +The module name is ``ad4052``.
> +
> +Supported devices
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The following chips are supported by this driver:
> +
> +* `AD4050 <https://www.analog.com/AD4050>`_
> +* `AD4052 <https://www.analog.com/AD4052>`_
> +* `AD4056 <https://www.analog.com/AD4056>`_
> +* `AD4058 <https://www.analog.com/AD4058>`_
> +
> +Wiring modes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ADC uses SPI 4-wire mode, and contain two programmable GPIOs and
> +a CNV pin.
> +
> +The CNV pin is exposed as the ``cnv-gpios`` and triggers a ADC conversio=
n.
> +GP1 is ADC conversion ready signal and GP0 Threshold event interrupt, bo=
th
> +exposed as interrupts.
> +
> +Omit ``cnv-gpios`` and tie CNV and CS together to use the rising edge
> +of the CS as the CNV signal.
> +
> +Device attributes
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ADC contain only one channels, and the following attributes:
> +
> +.. list-table:: Driver attributes
> +   :header-rows: 1
> +
> +   * - Attribute
> +     - Description
> +   * - ``in_voltage0_raw``
> +     - Raw ADC voltage value
> +   * - ``in_voltage0_oversampling_ratio``
> +     - Enable the device's burst averaging mode to over sample using
> +       the internal sample rate.
> +   * - ``in_voltage0_oversampling_ratio_available``
> +     - List of available oversampling values. Value 0 disable the burst
> +       averaging mode.
> +   * - ``sample_rate``
> +     - Device internal sample rate used in the burst averaging mode.
> +   * - ``sample_rate_available``
> +     - List of available sample rates.

Why not using the standard sampling_frequency[_available] attributes?

> +
> +Threshold events
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The ADC supports a monitoring mode to raise threshold events.
> +The driver supports a single interrupt for both rising and falling
> +readings.
> +
> +During monitor mode, the device is busy since other transactions
> +require to put the device in configuration mode first.

This isn't so clear to me. Is this saying that events do not work
while doing a buffered read? Do you need to do need to read the
in_voltage0_raw input to trigger an event?

> +
> +Low-power mode
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +The device enters low-power mode on idle to save power.
> +Enabling an event puts the device out of the low-power since the ADC
> +autonomously samples to assert the event condition.
> +
> +SPI offload support
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +To be able to achieve the maximum sample rate, the driver can be used wi=
th the
> +`AXI SPI Engine`_ to provide SPI offload support.
> +
> +.. _AXI SPI Engine: http://analogdevicesinc.github.io/hdl/projects/ad405=
2_ardz/index.html

This diagram show a PWM connected to the CNV pin on the ADC, but I
didn't see a pwms property in the DT bindings to describe this.

> +
> +When SPI offload is being used, additional attributes are present:
> +
> +.. list-table:: Additional attributes
> +   :header-rows: 1
> +
> +   * - Attribute
> +     - Description
> +   * - ``in_voltage0_sampling_frequency``
> +     - Set the sampling frequency.
> +   * - ``in_voltage0_sampling_frequency_available``
> +     - Get the sampling frequency range.
> +
> +The scan type is different when the buffer with offload support is enabl=
ed.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fef8adaee888d59e1aa3b3592dda5a8bea0b7677..312b2cf94b8f06298b1cbe597=
5ee32e2cf9a74d8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1322,6 +1322,7 @@ M:        Jorge Marques <jorge.marques@analog.com>
>  S:     Supported
>  W:     https://ez.analog.com/linux-software-drivers
>  F:     Documentation/devicetree/bindings/iio/adc/adi,ad4052.yaml
> +F:     Documentation/iio/ad4052.rst
>
>  ANALOG DEVICES INC AD4130 DRIVER
>  M:     Cosmin Tanislav <cosmin.tanislav@analog.com>
>
> --
> 2.48.1
>

I didn't have time to read the full datasheet or look at the driver
code yet, but can do that next week.
