Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42420221F35
	for <linux-doc@vger.kernel.org>; Mon,  7 Apr 2025 07:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744011769; cv=none; b=smVTaCeIwwAob9k6hAn4df+YCsb4OU8zoRghuNum7V5bmJ6x5Eq4HdC/5U2Z3eRj2y9sfF+Z+zDB+J/tv8gmRgHwVZdNHc21H4uNi/ya9uLMGG2m9O5zHW6nT6X054J7kE2NWhDWYEWe37HW6Y7mOq13Th7TFAxYRZsQH+Y+SJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744011769; c=relaxed/simple;
	bh=TT2CwatyE3PScxA6aGzLKHWl9XyGLFx6ZMSmhaOgntY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MiRMgZO82u/hMppRzvx+5JP9kILP8bqDFgp/nPMJDv/rqNH3eYLS9LHjixBYMZ97gIrD/3WCBibWRSvaXAy+J/Mi9QwYqBUDiXzjTBigdOENHLYqjCdOQuxcY+y8YZ7H8gao0SmQEnNV9KayfYUci1+8f+pV0JoeC9UnYTaV8QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Uh1FIZEH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Uh1FIZEH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso25508765e9.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 00:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744011765; x=1744616565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+SH50cqVXDjMtrk7e8ugGB2VmAlt5N0M4eNdMhk4w28=;
        b=Uh1FIZEHmLO0ydh4g3L1wDcEVKdGWwgWXtbRPV/o+Oj0BJqWxxkySgzxioEXA952tN
         piNPrlYHsPuQrSqhi2xn75UocRDQWCrvy8Ne4q6+V+FIKf8+9zMItUcK5M/ObxggDXmv
         AOAK3h/yzTGb76Ma/1SmYr17oDYo5CYTDZm8eFip5o7WN1bRgcXERAhKm1In8/Z1T22H
         HR8bTogDpOw19JMVITLhPd4FOL6fZaPMYnYIyzKSAuqBbXFT2JTus6h20i8Lc7w6Z6Xo
         VS/VkYtqO01JKldyu82WcqHTaDn5kyOQ9vqYYpfWofh/Xcf2ow609LpulSCLEy9+VYPi
         19yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744011765; x=1744616565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+SH50cqVXDjMtrk7e8ugGB2VmAlt5N0M4eNdMhk4w28=;
        b=pbet4qBogLt7SlSaLUERHDx+L7Rz2xkVK41dI4/MZb0+b6Vc31sRhRndeYc3ex1Pao
         62snmDnd+XSOGCQYxVKDpRxuPeMfQuUBmhrU8OBFJ3l8EHLrp5+MIZCZ5oTdhRkRck1Q
         t2RQJhmfHPLbqPHXQ+TFSFqIXQcGW2+JgEDfMC3CUUvlWN3CyuFZ/mrQ4+PRM93fq1Hb
         6N7V7t7i31BZjoiO6eeTSJdxSaSQH200U6jYc1+v9R1kzCEl85BkZS//a2D01T7u4dQt
         OJJzDUGABcXC91w6OgPBdVcgdgGxhKLUzc9Jzxt/Q+bOy76VvdIgnmDufilG/iosyiE1
         xytQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtNL4ppx5n+A9wJ16gkijfQBxor2lFKh1Fip2jklZvErzDUf/QvKDQMnrBfPhJxFjWqTNSXnIJIcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvwdT66ajjE03Ux06gEH2kVSsqNIJI9BlF49o5x3p5GL1lP+Nu
	DMaEwNHhQr6iXoRG6Ppiiy8+sbMtR/Hd6PYLVpfseCrjYMnA2YtQ3HLFXMQxG9Y=
X-Gm-Gg: ASbGncv/GHvcsvO4bc2j7fQh+pXd6wEd8klL9eHISWB2OtwgpQauV43QYerLaTFjE65
	Gg2D+cvglzzYyHoSZUp9bIMvwDrPoZa2HDxEAHd2mPoUr3shlJ4D+jCTrKEfwD4fxuAuf/LUezA
	9lEqFgvvHP3/+AkOcGpRmmY+M3dgGfzdaEBdvGEt6+qfcvvTyTvO6dmrSWdeawOIjS/x0Q/2+KF
	iriDBmdAqkkAQiCjludIwiNrE6ZqdDnFabD005fF8KF9aqfHifl3rLgMlRqH2AyCl24H9uFfZmz
	ynRNAfAer+Me8gwGgzLrVRuwpcyrRUci2AGRATgUllmVtasntO6f2fi4Q1nTqe2Y6338f6cSmPk
	oC5kdY5OY4ks7KzKe
X-Google-Smtp-Source: AGHT+IGj4oFOpbFlCSYKH70mEMH5XLqpGaZABBghjAnvaw9bAjEggbo9aAX8vuvntuy/p28yBQRuZQ==
X-Received: by 2002:a05:600c:4f46:b0:43d:db5:7b1a with SMTP id 5b1f17b1804b1-43ecf86a5f9mr108047395e9.12.1744011765391;
        Mon, 07 Apr 2025 00:42:45 -0700 (PDT)
Received: from archlinux (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630de9sm124012395e9.1.2025.04.07.00.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:42:44 -0700 (PDT)
Date: Mon, 7 Apr 2025 09:41:32 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] iio: adc: ad7606: add SPI offload support
Message-ID: <vjxnpbxvvh2vdjsamdznhrmrwwfwt5tjhugqik3ktueopajv6l@wmehdnowjvjq>
References: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
 <20250403-wip-bl-spi-offload-ad7606-v1-3-1b00cb638b12@baylibre.com>
 <20250405164041.7d2e586b@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250405164041.7d2e586b@jic23-huawei>

Hi Jonathan,

On 05.04.2025 16:40, Jonathan Cameron wrote:
> On Thu, 03 Apr 2025 18:19:06 +0200
> Angelo Dureghello <adureghello@baylibre.com> wrote:
> 
> > From: Angelo Dureghello <adureghello@baylibre.com>
> > 
> > Add SPI offload support for this family.
> > 
> > Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
> Hi Angelo,
> 
> Code looks fine, but there is a TODO I'd like to know more about
> as it sounds 'ominous'. 
> 
> Otherwise this needs a dt review for patch 1 before I queue it up.
> 
> Jonathan
> > diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
> > index b2b975fb7fea4d1af6caef59e75ca495501bc140..b086122497eb22042171580878160334f56baa23 100644
> > --- a/drivers/iio/adc/ad7606_spi.c
> > +++ b/drivers/iio/adc/ad7606_spi.c
> 
> > +static int ad7606_spi_offload_probe(struct device *dev,
> > +				    struct iio_dev *indio_dev)
> > +{
> > +	struct ad7606_state *st = iio_priv(indio_dev);
> > +	struct spi_device *spi = to_spi_device(dev);
> > +	struct spi_bus_data *bus_data;
> > +	struct dma_chan *rx_dma;
> > +	struct spi_offload_trigger_info trigger_info = {
> > +		.fwnode = dev_fwnode(dev),
> > +		.ops = &ad7606_offload_trigger_ops,
> > +		.priv = st,
> > +	};
> > +	int ret;
> > +
> > +	bus_data = devm_kzalloc(dev, sizeof(*bus_data), GFP_KERNEL);
> > +	if (!bus_data)
> > +		return -ENOMEM;
> > +	st->bus_data = bus_data;
> > +
> > +	bus_data->offload = devm_spi_offload_get(dev, spi,
> > +						 &ad7606_spi_offload_config);
> > +	ret = PTR_ERR_OR_ZERO(bus_data->offload);
> > +	if (ret && ret != -ENODEV)
> > +		return dev_err_probe(dev, ret, "failed to get SPI offload\n");
> > +	/* Allow main ad7606_probe function to continue. */
> > +	if (ret == -ENODEV)
> > +		return 0;
> > +
> > +	ret = devm_spi_offload_trigger_register(dev, &trigger_info);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret,
> > +				     "failed to register offload trigger\n");
> > +
> > +	bus_data->offload_trigger = devm_spi_offload_trigger_get(dev,
> > +		bus_data->offload, SPI_OFFLOAD_TRIGGER_DATA_READY);
> > +	if (IS_ERR(bus_data->offload_trigger))
> > +		return dev_err_probe(dev, PTR_ERR(bus_data->offload_trigger),
> > +				     "failed to get offload trigger\n");
> > +
> > +	/* TODO: PWM setup should be ok, done for the backend. PWM mutex ? */
> 
> I don't understand this todo. Perhaps some more details?
>
it was just an initial comment i did, when i started the things
was not clear.
Let me know if you can remove it, or i can send a v2.

Thanks a lot.

Regards,
angelo
 
> > +	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev,
> > +							     bus_data->offload);
> > +	if (IS_ERR(rx_dma))
> > +		return dev_err_probe(dev, PTR_ERR(rx_dma),
> > +				     "failed to get offload RX DMA\n");
> > +
> > +	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
> > +		rx_dma, IIO_BUFFER_DIRECTION_IN);
> > +	if (ret)
> > +		return dev_err_probe(dev, PTR_ERR(rx_dma),
> > +				     "failed to setup offload RX DMA\n");
> > +
> > +	/* Use offload ops. */
> > +	indio_dev->setup_ops = &ad7606_offload_buffer_setup_ops;
> > +
> > +	st->offload_en = true;
> > +
> > +	return 0;
> > +}
> 
> 
