Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C3919F137
	for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2026 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774711024; cv=none; b=F/ezOuSdWPRrUqde7OuTm8SUF0CtvQy5Keh39SZhryQDfgktvLPV6mQIrle2du+cff8prZ4NFBEGWZ9T/QQGZKHgJy6SEQ326R8cb12KPBqDB0ZjDHpboK0zLNDuL64l287unvyyeMMryJCWn3uDxKcPwWpjlGaHSpV+uCusNu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774711024; c=relaxed/simple;
	bh=hi4QKuEXaFcxXNjs+RL7CC/hcxEkT49xI99F56w1mbU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZgwSF2xVcVHj5fPc3GwCUICaYHw+MfEMp3wxlozT+HOid9GvwuqqHhNnNri70ROOQTXCIFXWTSh4M3G/aAcsgZKnWwJWy4CXO/gdjr3+pm4AB9UHZZA1cvWktNVRZszjBhXw9OlIhVPpZyLyusil8PNDxDt1naotf0v9m7OhzmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0j2w+gm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0j2w+gm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e4989dacdso1819549e87.1
        for <linux-doc@vger.kernel.org>; Sat, 28 Mar 2026 08:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774711021; x=1775315821; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uks9yLyhh7hqScl22idPSyqFo1CqasSiIe6hIodJgeQ=;
        b=J0j2w+gmsGcycNaXCRq+4Wq1r+HqfuDCjp0qezfzEKGlOlVMCDkhXfdkq0PZqQV79a
         65Iw01AwalN+5XP3CCUigjmzSNcJUtzS36u9djnS+59rJEVHC2PTxihev7mdG46i3ODN
         jfkOdc+tQxuuRcdHmS6m9R/qesh449MJKLaj61h/Qd5izhEORDRMKFUvNb6nv13/0Bi6
         nTzqPzB/ZcOuzuZnIl83JkFXLxz4toAtBOJCf2ef8NIFYwEwSJCo+RpGhUTle3LuK4Lm
         1NvjVqeMRHumrCkQvYzAN43HDvZJNCWtuI2nQXj6kVsPYByDE5VrgBIXWXgiGN1HEIFD
         yI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774711021; x=1775315821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uks9yLyhh7hqScl22idPSyqFo1CqasSiIe6hIodJgeQ=;
        b=fe/jYSNiKxiRvmDKfXAeSk8hKbU/Cv/AP3ganlWltWWwl00msYFb8jJyfF5nOn8RLL
         hDXbsnv3p2wfksW1TVQybMmr1m8IywZT7C+k5elLpzYbzz4/6sBNpOXHwSHhPBY1iUSl
         mXSRWefFSl803JW4T36TaLIHSNoNbtzY30YaF9ABoxx4RJk2zaEIAN/SSjDMH7BKe2NQ
         FFwU7gTbZ/S91aMITLOynhYxzwMUumD7Z4LM1kEdRtQk/G9tSqjitw0N6L564HhGS7aU
         BRoDmXhDZg+pUnExlbwgOZPrXGqMvhpGXdpIHxN4mzfrZlXJgi/+gpsPEsnZSS6TfMWq
         M4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXrj3gIgBnfKC7GChGPSiPKilvvCTA2AcvA1IBa3Ia6GI8lwEwxqmUeiKeNe2bCpfIkUSKSCkyCfgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tlMdBLwle9mNqAL3cYaRl2T6We2gDphd6HpwvzgOZMtmXJkO
	XMyt3avVu8ZCi2PZrb/ffCfuI/xQ/zN1QYa3BZD0Z5OZwbcW6t6JO6UJmUnZLQ==
X-Gm-Gg: ATEYQzwcMphuo1berWr6DmSOp/7OnLLrZGnvOpZXA6YodY5df9AxAWnE9D067ziDvY9
	jK8acV43BOfCW/rfe4d5GtDMgpExFiphK7+/X7ocK3aRiQJcQgZ9q9g42owaKAh0Pxs4Z7JmIPi
	TlAnkDcVD6sGbG/oNIpEc2bJ/yVur4d4ZQDSmSrB91fm2D8KrL9CRmPoFBdde/yvbu0B446rGxM
	c/pVynprYjlVdY8EVqa+xwSZnI9kNP8+63FseU9tvObuWoxBLxrWIzKiEtGTBn7JTAEXaKSer0K
	4m4phdKcdwMg8DTDBWLl31FXnCdgmifBNPD2d41w1baaTtp4GTBqHqV+epNWW8vBgNFXWNmVIa6
	kdkUfUUAWrqpVrjJ5qobu4h11qpkhJTwTAOcLmrw7NgL4az498/sQdOQQ9T5IkDB9yp6IjecIcC
	u4aVW3aJDVEkK9nOp4wUb/VbkUsKj/1+q7bbyoDllYVsz8QHU4mmRDrqIfymKROkJGpPiKOXzy4
	A==
X-Received: by 2002:a05:600c:8b6d:b0:485:35ba:1d81 with SMTP id 5b1f17b1804b1-48727eb7fb7mr93144965e9.21.1774690975407;
        Sat, 28 Mar 2026 02:42:55 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487305da785sm37137455e9.0.2026.03.28.02.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 02:42:54 -0700 (PDT)
Message-ID: <324e16aba4029ec4679f7b141c5f58e8929a0da3.camel@gmail.com>
Subject: Re: [PATCH v5 3/4] iio: adc: ad4691: add triggered buffer support
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: radu.sabau@analog.com, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner	 <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,  Andy Shevchenko	
 <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?=	 <ukleinek@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown	 <broonie@kernel.org>, Linus Walleij
 <linusw@kernel.org>, Bartosz Golaszewski	 <brgl@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Jonathan Corbet	 <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Date: Sat, 28 Mar 2026 09:44:00 +0000
In-Reply-To: <20260327-ad4692-multichannel-sar-adc-driver-v5-3-11f789de47b8@analog.com>
References: 
	<20260327-ad4692-multichannel-sar-adc-driver-v5-0-11f789de47b8@analog.com>
	 <20260327-ad4692-multichannel-sar-adc-driver-v5-3-11f789de47b8@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Radu,

Looking good. Just some minor stuff.

On Fri, 2026-03-27 at 13:07 +0200, Radu Sabau via B4 Relay wrote:
> From: Radu Sabau <radu.sabau@analog.com>
>=20
> Add buffered capture support using the IIO triggered buffer framework.
>=20
> CNV Burst Mode: the GP pin identified by interrupt-names in the device
> tree is configured as DATA_READY output. The IRQ handler stops
> conversions and fires the IIO trigger; the trigger handler executes a
> pre-built SPI message that reads all active channels from the AVG_IN
> accumulator registers and then resets accumulator state and restarts
> conversions for the next cycle.
>=20
> Manual Mode: CNV is tied to SPI CS so each transfer simultaneously
> reads the previous result and starts the next conversion (pipelined
> N+1 scheme). At preenable time a pre-built, optimised SPI message of
> N+1 transfers is constructed (N channel reads plus one NOOP to drain
> the pipeline). The trigger handler executes the message in a single
> spi_sync() call and collects the results. An external trigger (e.g.
> iio-trig-hrtimer) is required to drive the trigger at the desired
> sample rate.
>=20
> Both modes share the same trigger handler and push a complete scan =E2=80=
=94
> one u16 slot per channel at its scan_index position, followed by a
> timestamp =E2=80=94 to the IIO buffer via iio_push_to_buffers_with_ts().
>=20
> The CNV Burst Mode sampling frequency (PWM period) is exposed as a
> buffer-level attribute via IIO_DEVICE_ATTR.
>=20
> Signed-off-by: Radu Sabau <radu.sabau@analog.com>
> ---
> =C2=A0drivers/iio/adc/Kconfig=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/iio/adc/ad4691.c | 616 ++++++++++++++++++++++++++++++++++++=
++++++++++-
> =C2=A02 files changed, 612 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index 3685a03aa8dc..d498f16c0816 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -142,6 +142,8 @@ config AD4170_4
> =C2=A0config AD4691
> =C2=A0	tristate "Analog Devices AD4691 Family ADC Driver"
> =C2=A0	depends on SPI
> +	select IIO_BUFFER
> +	select IIO_TRIGGERED_BUFFER
> =C2=A0	select REGMAP
> =C2=A0	help
> =C2=A0	=C2=A0 Say yes here to build support for Analog Devices AD4691 Fam=
ily MuxSAR
> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> index f930efdb9d8c..b5a7646b46ca 100644
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
> @@ -4,14 +4,18 @@
> =C2=A0 * Author: Radu Sabau <radu.sabau@analog.com>
> =C2=A0 */
> =C2=A0#include <linux/bitfield.h>
> +#include <linux/bitmap.h>
> =C2=A0#include <linux/bitops.h>
> =C2=A0#include <linux/cleanup.h>
> =C2=A0#include <linux/delay.h>
> =C2=A0#include <linux/device.h>
> =C2=A0#include <linux/err.h>
> +#include <linux/interrupt.h>
> =C2=A0#include <linux/math.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
> +#include <linux/pwm.h>
> =C2=A0#include <linux/regmap.h>
> =C2=A0#include <linux/regulator/consumer.h>
> =C2=A0#include <linux/reset.h>
> @@ -19,7 +23,12 @@
> =C2=A0#include <linux/units.h>
> =C2=A0#include <linux/unaligned.h>
> =C2=A0

...

>=20
> +static void ad4691_free_scan_bufs(struct ad4691_state *st)
> +{
> +	kfree(st->scan_xfers);
> +	kfree(st->scan_tx);
> +	kfree(st->scan_rx);
> +	st->scan_xfers =3D NULL;
> +	st->scan_tx =3D NULL;
> +	st->scan_rx =3D NULL;

Do we need NULL. Are you actually checking for that anywhere?

> +}
> +
> +static int ad4691_manual_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->regmap);
> +	struct spi_device *spi =3D to_spi_device(dev);
> +	unsigned int n_active =3D bitmap_weight(indio_dev->active_scan_mask,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indio_dev->masklength);

ditto

> +	unsigned int n_xfers =3D n_active + 1;
> +	unsigned int k, i;
> +	int ret;
> +
> +	st->scan_xfers =3D kcalloc(n_xfers, sizeof(*st->scan_xfers), GFP_KERNEL=
);
> +	if (!st->scan_xfers)
> +		return -ENOMEM;
> +
> +	st->scan_tx =3D kcalloc(n_xfers, sizeof(*st->scan_tx), GFP_KERNEL);
> +	if (!st->scan_tx) {
> +		kfree(st->scan_xfers);
> +		return -ENOMEM;
> +	}
> +
> +	st->scan_rx =3D kcalloc(n_xfers, sizeof(*st->scan_rx), GFP_KERNEL);
> +	if (!st->scan_rx) {
> +		kfree(st->scan_tx);
> +		kfree(st->scan_xfers);
> +		return -ENOMEM;
> +	}
> +
> +	spi_message_init(&st->scan_msg);
> +
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		st->scan_tx[k] =3D cpu_to_be16(AD4691_ADC_CHAN(i));
> +		st->scan_xfers[k].tx_buf =3D &st->scan_tx[k];
> +		st->scan_xfers[k].rx_buf =3D &st->scan_rx[k];
> +		st->scan_xfers[k].len =3D sizeof(__be16);
> +		st->scan_xfers[k].cs_change =3D 1;
> +		spi_message_add_tail(&st->scan_xfers[k], &st->scan_msg);
> +		k++;
> +	}
> +
> +	/* Final NOOP transfer to retrieve last channel's result. */
> +	st->scan_tx[k] =3D cpu_to_be16(AD4691_NOOP);
> +	st->scan_xfers[k].tx_buf =3D &st->scan_tx[k];
> +	st->scan_xfers[k].rx_buf =3D &st->scan_rx[k];
> +	st->scan_xfers[k].len =3D sizeof(__be16);
> +	spi_message_add_tail(&st->scan_xfers[k], &st->scan_msg);
> +
> +	st->scan_msg.spi =3D spi;
> +
> +	ret =3D spi_optimize_message(spi, &st->scan_msg);
> +	if (ret) {
> +		ad4691_free_scan_bufs(st);
> +		return ret;
> +	}
> +
> +	ret =3D ad4691_enter_conversion_mode(st);
> +	if (ret) {
> +		spi_unoptimize_message(&st->scan_msg);
> +		ad4691_free_scan_bufs(st);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ad4691_manual_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D ad4691_exit_conversion_mode(st);
> +	spi_unoptimize_message(&st->scan_msg);
> +	ad4691_free_scan_bufs(st);
> +	return ret;
> +}
> +
> +static const struct iio_buffer_setup_ops ad4691_manual_buffer_setup_ops =
=3D {
> +	.preenable =3D &ad4691_manual_buffer_preenable,
> +	.postdisable =3D &ad4691_manual_buffer_postdisable,
> +};
> +
> +static int ad4691_cnv_burst_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	struct device *dev =3D regmap_get_device(st->regmap);
> +	struct spi_device *spi =3D to_spi_device(dev);
> +	unsigned int n_active =3D bitmap_weight(indio_dev->active_scan_mask,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indio_dev->masklength);

masklength is __private. Use iio_get_masklength(). I would expect sparse to
complain about the above.

> +	unsigned int bit, k, i;
> +	int ret;
> +
> +	st->scan_xfers =3D kcalloc(2 * n_active, sizeof(*st->scan_xfers),
> GFP_KERNEL);
> +	if (!st->scan_xfers)
> +		return -ENOMEM;
> +
> +	st->scan_tx =3D kcalloc(n_active, sizeof(*st->scan_tx), GFP_KERNEL);
> +	if (!st->scan_tx) {
> +		kfree(st->scan_xfers);
> +		return -ENOMEM;
> +	}
> +
> +	st->scan_rx =3D kcalloc(n_active, sizeof(*st->scan_rx), GFP_KERNEL);
> +	if (!st->scan_rx) {
> +		kfree(st->scan_tx);
> +		kfree(st->scan_xfers);
> +		return -ENOMEM;
> +	}
> +
> +	spi_message_init(&st->scan_msg);
> +
> +	/*
> +	 * Each AVG_IN read needs two transfers: a 2-byte address write phase
> +	 * followed by a 2-byte data read phase. CS toggles between channels
> +	 * (cs_change=3D1 on the read phase of all but the last channel).
> +	 */
> +	k =3D 0;
> +	iio_for_each_active_channel(indio_dev, i) {
> +		st->scan_tx[k] =3D cpu_to_be16(0x8000 | AD4691_AVG_IN(i));
> +		st->scan_xfers[2 * k].tx_buf =3D &st->scan_tx[k];
> +		st->scan_xfers[2 * k].len =3D sizeof(__be16);
> +		spi_message_add_tail(&st->scan_xfers[2 * k], &st->scan_msg);
> +		st->scan_xfers[2 * k + 1].rx_buf =3D &st->scan_rx[k];
> +		st->scan_xfers[2 * k + 1].len =3D sizeof(__be16);
> +		if (k < n_active - 1)
> +			st->scan_xfers[2 * k + 1].cs_change =3D 1;
> +		spi_message_add_tail(&st->scan_xfers[2 * k + 1], &st->scan_msg);
> +		k++;
> +	}
> +
> +	st->scan_msg.spi =3D spi;
> +
> +	ret =3D spi_optimize_message(spi, &st->scan_msg);
> +	if (ret) {
> +		ad4691_free_scan_bufs(st);
> +
Why not goto here?

Alternatively, to simplify error handling with buffers you can use some hel=
per
variables with __free(kfree) and then in the end assign to st with no_free_=
ptr().

> 		return ret;
> +	}
> +
> +	ret =3D regmap_write(st->regmap, AD4691_ACC_MASK_REG,
> +			=C2=A0=C2=A0 (u16)~bitmap_read(indio_dev->active_scan_mask, 0,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 indio_dev->masklength));
> +	if (ret)
> +		goto err;
> +
> +	ret =3D regmap_write(st->regmap, AD4691_STD_SEQ_CONFIG,
> +			=C2=A0=C2=A0 bitmap_read(indio_dev->active_scan_mask, 0,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 indio_dev->masklength));
> +	if (ret)
> +		goto err;
> +
> +	iio_for_each_active_channel(indio_dev, bit) {
> +		ret =3D regmap_write(st->regmap, AD4691_ACC_DEPTH_IN(bit),
> +				=C2=A0=C2=A0 st->osr[bit]);
> +		if (ret)
> +			goto err;
> +	}
> +
> +	ret =3D ad4691_enter_conversion_mode(st);
> +	if (ret)
> +		goto err;
> +
> +	ret =3D ad4691_sampling_enable(st, true);
> +	if (ret)
> +		goto err;
> +
> +	enable_irq(st->irq);
> +	return 0;
> +err:
> +	spi_unoptimize_message(&st->scan_msg);
> +	ad4691_free_scan_bufs(st);
> +	return ret;
> +}
> +
> +static int ad4691_cnv_burst_buffer_postdisable(struct iio_dev *indio_dev=
)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	disable_irq(st->irq);
> +
> +	ret =3D ad4691_sampling_enable(st, false);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(st->regmap, AD4691_STD_SEQ_CONFIG,
> +			=C2=A0=C2=A0 AD4691_SEQ_ALL_CHANNELS_OFF);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ad4691_exit_conversion_mode(st);
> +	spi_unoptimize_message(&st->scan_msg);
> +	ad4691_free_scan_bufs(st);
> +	return ret;
> +}
> +
> +static const struct iio_buffer_setup_ops ad4691_cnv_burst_buffer_setup_o=
ps =3D {
> +	.preenable =3D &ad4691_cnv_burst_buffer_preenable,
> +	.postdisable =3D &ad4691_cnv_burst_buffer_postdisable,
> +};
> +
> +static ssize_t sampling_frequency_show(struct device *dev,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_attribute *attr,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char *buf)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
> +	return sysfs_emit(buf, "%u\n", (u32)(NSEC_PER_SEC / st->cnv_period_ns))=
;
> +}
> +
> +static ssize_t sampling_frequency_store(struct device *dev,
> +					struct device_attribute *attr,
> +					const char *buf, size_t len)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	int freq, ret;
> +
> +	ret =3D kstrtoint(buf, 10, &freq);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D ad4691_set_pwm_freq(st, freq);
> +	if (ret)
> +		return ret;
> +

Question. Is it safe or does it make sense to change the above while buffer=
ing?
Same question might be valid for other stuff like oversampling.

> +	return len;
> +}
> +
> +static IIO_DEVICE_ATTR(sampling_frequency, 0644,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sampling_frequency_show,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sampling_frequency_store, 0);
> +
> +static const struct iio_dev_attr *ad4691_buffer_attrs[] =3D {
> +	&iio_dev_attr_sampling_frequency,
> +	NULL
> +};
> +
> +static irqreturn_t ad4691_irq(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +
> +	/*
> +	 * GPx has asserted: stop conversions before reading so the
> +	 * accumulator does not continue sampling while the trigger handler
> +	 * processes the data. Then fire the IIO trigger to push the sample
> +	 * to the buffer.
> +	 */
> +	ad4691_sampling_enable(st, false);
> +	iio_trigger_poll(indio_dev->trig);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct iio_trigger_ops ad4691_trigger_ops =3D {
> +	.validate_device =3D iio_trigger_validate_own_device,
> +};
> +
> +static int ad4691_read_scan(struct iio_dev *indio_dev, s64 timestamp)
> +{
> +	struct ad4691_state *st =3D iio_priv(indio_dev);
> +	unsigned int i, k =3D 0;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	ret =3D spi_sync(st->scan_msg.spi, &st->scan_msg);
> +	if (ret)
> +		return ret;
> +
> +	if (st->manual_mode) {
> +		iio_for_each_active_channel(indio_dev, i) {
> +			st->scan.vals[i] =3D be16_to_cpu(st->scan_rx[k + 1]);
> +			k++;
> +		}
> +	} else {
> +		iio_for_each_active_channel(indio_dev, i) {
> +			st->scan.vals[i] =3D be16_to_cpu(st->scan_rx[k]);
> +			k++;
> +		}
> +
> +		ret =3D regmap_write(st->regmap, AD4691_STATE_RESET_REG,
> +				=C2=A0=C2=A0 AD4691_STATE_RESET_ALL);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ad4691_sampling_enable(st, true);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	iio_push_to_buffers_with_ts(indio_dev, &st->scan, sizeof(st->scan),
> +				=C2=A0=C2=A0=C2=A0 timestamp);
> +	return 0;
> +}
> +
> +static irqreturn_t ad4691_trigger_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *indio_dev =3D pf->indio_dev;
> +
> +	ad4691_read_scan(indio_dev, pf->timestamp);
> +	iio_trigger_notify_done(indio_dev->trig);
> +	return IRQ_HANDLED;
> +}
> +
> =C2=A0static const struct iio_info ad4691_info =3D {
> =C2=A0	.read_raw =3D &ad4691_read_raw,
> =C2=A0	.write_raw =3D &ad4691_write_raw,
> @@ -493,6 +982,18 @@ static const struct iio_info ad4691_info =3D {
> =C2=A0	.debugfs_reg_access =3D &ad4691_reg_access,
> =C2=A0};
> =C2=A0
> +static int ad4691_pwm_setup(struct ad4691_state *st)
> +{
> +	struct device *dev =3D regmap_get_device(st->regmap);
> +
> +	st->conv_trigger =3D devm_pwm_get(dev, "cnv");
> +	if (IS_ERR(st->conv_trigger))
> +		return dev_err_probe(dev, PTR_ERR(st->conv_trigger),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "Failed to get cnv pwm\n");
> +
> +	return ad4691_set_pwm_freq(st, st->info->max_rate);
> +}
> +
> =C2=A0static int ad4691_regulator_setup(struct ad4691_state *st)
> =C2=A0{
> =C2=A0	struct device *dev =3D regmap_get_device(st->regmap);
> @@ -557,8 +1058,25 @@ static int ad4691_config(struct ad4691_state *st)
> =C2=A0{
> =C2=A0	struct device *dev =3D regmap_get_device(st->regmap);
> =C2=A0	enum ad4691_ref_ctrl ref_val;
> +	unsigned int gp_num;
> =C2=A0	int ret;
> =C2=A0
> +	/*
> +	 * Determine buffer conversion mode from DT: if a PWM is provided it
> +	 * drives the CNV pin (CNV_BURST_MODE); otherwise CNV is tied to CS
> +	 * and each SPI transfer triggers a conversion (MANUAL_MODE).
> +	 * Both modes idle in AUTONOMOUS mode so that read_raw can use the
> +	 * internal oscillator without disturbing the hardware configuration.
> +	 */
> +	if (device_property_present(dev, "pwms")) {
> +		st->manual_mode =3D false;
> +		ret =3D ad4691_pwm_setup(st);
> +		if (ret)
> +			return ret;
> +	} else {
> +		st->manual_mode =3D true;
> +	}
> +
> =C2=A0	switch (st->vref_uV) {
> =C2=A0	case AD4691_VREF_uV_MIN ... AD4691_VREF_2P5_uV_MAX:
> =C2=A0		ref_val =3D AD4691_VREF_2P5;
> @@ -609,7 +1127,87 @@ static int ad4691_config(struct ad4691_state *st)
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(dev, ret, "Failed to write ADC_SETUP\n");
> =C2=A0
> -	return 0;
> +	if (st->manual_mode)
> +		return 0;
> +
> +	for (gp_num =3D 0; gp_num < ARRAY_SIZE(ad4691_gp_names); gp_num++) {
> +		if (fwnode_irq_get_byname(dev_fwnode(dev),
> +					=C2=A0 ad4691_gp_names[gp_num]) > 0)

Don't love this line break. I'm also a bit puzzled. How does the above diff=
ers from
the trigger code? I guess this should be the same GP pin?


- Nuno S=C3=A1
