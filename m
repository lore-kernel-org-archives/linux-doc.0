Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBB83E314F
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787819425; cv=none; b=JyDuS4+XBVHonkhdZA23+ja/Y/vHHf7sDmcpVRwQRaUnF4+Gp/23a3IUr1AfTQenW5qBtjPWx1edZOQ3D5f8lTizK6MZG9fhK9krB9XFILsGRsdNbT8elhv1AWZ0GkNMotJb3ex3tt9frdF2nkcYExXudHGevEX5YCEBrzm93I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787819425; c=relaxed/simple;
	bh=yJpyF+5Tc3G8tE31WpMqXfWM3y43ClMVTYl+eMZsTmI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0YwD5Bp/jtI9bAX+ulQTsAIIzWMvLmymKg4+gocJCIEtlXQRjKOQfmPA6jMZ/q6TQa095O8fdRmgAaiaNPRejJv4AdlEjwxLUQoFzpuY7s9WJfaZRKK5bHL0yU+ApoDwoAFLTVem7afILOuaZ2TXNbfTB3EHw0d77TrYShhISg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aJamGOWR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aJamGOWR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso8772005e9.0
        for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 01:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787819421; x=1788424221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=aJamGOWR4RskmKAgdzroTT/6XZdn0jLXN4eI42AFneeGhUeKClD8v+xJHo6cd5//dR
         l+7TljvSWDuY2EkxK7lCpsSrJbgYwL9U7KqMIDJ4IH7QYhvaVE/3Gb/lzDwSVHjgr0pu
         nBm86C3Bg69rJtasMMPnQgTISlRCTkJ0O6l1sOvee7utl6ZiIrNh6LxGsqMaHE66u6rN
         AEPpTQoKZSnri660Aqi9iWkuaIVfG/kJwvOd7VKTc7Dic3OkMayKLuXFThQ4bCRN4qZf
         PNQcWp0xRtx18Z1Cs+wQAlxRcMFLCLMTQMnwQz5yukSyzYipkXQkcDT+XGnyPgSma9Zm
         BNGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787819421; x=1788424221;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gv10IZgS+I8/TcY7gcREpSsUvzMsxKqW3sbwG8Jb3QY=;
        b=SiUalnzjYWaQfzoNbzOf9HBeYCVBaA6l9OpuVwHoCEKZ2l83GVaIq8G3WepCmPstsd
         LqP9kL3i2ud9k3mk//d+97Gr9JFDdmNcHE8R+xrpbjp3mR/jMeCSUxWMEYt+zsiqdAQH
         Xm8yUY0eY+HftMqvJSDCzCATDt8YDdKHPZt18E4dj67M68pkYu3EKOdbkccOJjX/wT1V
         jQO1vZpImuPrbp2QbsSk/Ex6aLi0dWBRP4aCFDwa8EDUp5n2EiwwahbzhVSg5lv3t4qF
         4hYw6wgUWx79u4ANz+plmdL+6rPyYQRdW0E4++B3VgO7C1CHLhA0GUt7OwOZPlhq5cz/
         H3hQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1vPlTrgOKIKtbqHTX/uGBxEf4BwQDT6ODd+OA3k4AJkYd6k2AFetE3zYHcqdM744TQHRXIaT1pB8=@vger.kernel.org
X-Gm-Message-State: AFuF++mcKmdJav7cZcrGpcDfNfAv3C6y2RT335C2gZNnoHet6ErZ3frq
	gePudpoJVdAwq5A+Gu2ZjzdoNnhvc84Ecnyh8RN67N0H0/6CJGVC74tw
X-Gm-Gg: AR+sD10H42WvSzYuX5TF0zmBFVLZfXx4I3W7uLkRbCKrRTVdPihIotWDy8lT6lyykOj
	b4BUHxKrs/tIhrf19r4jHJkSRtRpBIKARb54OQyI3pO2NFJ/YK9id1oUj/KHIlmFqm+WCpV2cEE
	GaF2Q1OAMCKD8NuLjV6gAq3FMeh9ol2kYe5fImDBFfNf6Wgsw9VDL4QOJpG2NYbVoICsSbsiHvT
	9aCIOnCDt/8nsr25k3Ksvi/5KhOd/mN79fNmmViIpZjp9WlxDIXDYVtT58vRbKcoo2zNlz3QzZs
	PBoVuJ0KT7oShGwtwPP/6rWGEvVb7yVmiPH5RDuP3/YlgcI8h8KypRhgVLJFwpMX5GKgKub5cfY
	bHfwwH8g6EieNfMVDqIyAQwTnWECbnZ7yNH5FT0GfoYRclulr71dmJrnBIc4Hp12LRq8Rfoizpo
	CQLF0m1KibiBWn/w/Hb4R0jqFCyaTscbMK6FFgbWfuRqHCcymH7y5Sh4k7CxUQxrMOer3twkwus
	xpAwoaIHZla/9AYsog5Dldik+k1DORdlrDYKPTWjrNeFxtpqV9ZtJGmP3nSAIjKbdXj8HYqKmLv
	r8BwZwSiqoEDOuHyHrFkjLDOV1IdbyPMME0Fcqm0/cJCm60rG+KB7Y+5xNIGI4CEGfuNTOXBv2/
	JKHJWjTyKNBy3t3dB38u9ZCGhEZ8gefWKaNsFn79gKUhJ0Nv95qXnpGBXS8RUTRJNtmo3BA0lsj
	YKTUI6
X-Received: by 2002:a05:600c:a0d:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-499dc6e9b00mr152209385e9.3.1787819421205;
        Thu, 27 Aug 2026 01:30:21 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56826bsm53438315e9.4.2026.08.27.01.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:30:20 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:30:19 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, "David
 Lechner" <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "Jonathan
 Corbet" <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark
 Brown <broonie@kernel.org>, Marius Cristea <marius.cristea@microchip.com>,
 "Marcus Folkesson" <marcus.folkesson@gmail.com>, Kent Gustavsson
 <kent@minoris.se>, Conor Dooley <conor.dooley@microchip.com>, Daire
 McNamara <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>,
 "Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Alexandre Ghiti" <alex@ghiti.fr>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Janani Sunil <jan.sun97@gmail.com>,
 <linux-spi@vger.kernel.org>, Kent Gustavsson <nedo80@gmail.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v10 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260827103019.00002663@gmail.com>
In-Reply-To: <20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
References: <20260827-ad5529r-driver-v10-0-38f2be07b824@analog.com>
	<20260827-ad5529r-driver-v10-3-38f2be07b824@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 09:34:48 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/iio/iio.h>

IIO specific headers should go after the generic <linux/*> headers,
it's just convention.

> +#include <linux/module.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/reset.h>
> +#include <linux/spi/spi.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +

...

> +static int ad5529r_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ad5529r_state *st = iio_priv(indio_dev);
> +	unsigned int reg_addr;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (val < 0 || val > GENMASK(st->model_data->resolution - 1, 0))

There is a function for this - in_range(), in linux/minmax.h.

> +			return -EINVAL;
> +
> +		reg_addr = AD5529R_REG_DAC_INPUT_A(chan->channel);
> +
> +		return regmap_write(st->regmap_16bit, reg_addr, val);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +

-- 
Kind regards,
Joshua Crofts
