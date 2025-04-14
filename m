Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C21D932F
	for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 20:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744660847; cv=none; b=nu/Ak9wzI4bHXMeihTuLVhIL406NKxs/qxWdFQt6CrhPunXJLBtsTOSSYD5OgkU+fWUSvrPWXVt1xlqJX0cVUgDPsVgb++2X3u/VRqAt6xgMPLZ8Qn0V5lfqmNx53Uvjdr/jkzGkwwPYZ+P0dQhV7Piok87kCUpQ1HjbVz7GZmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744660847; c=relaxed/simple;
	bh=Nw0LcWGPT7ovb/UapvxLHTltKihzzl3S+Aj3yFzA+Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N3B18cVxr/D1RtkTTbsLTpDqzwmetBmSk8Fyd04APWguaQg+TalthCyu3fASAhwvSbu2BOGbmUw35xdj0TnDNmvhhxDK4FL+R49lmt734SSAA/bK0i5h1Mi0V4gcUVf8DkFzgGrFhgK7revAyA4ihnZIqelraK1itfRJaZfepRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kZfvKh6g; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kZfvKh6g"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso24229225e9.3
        for <linux-doc@vger.kernel.org>; Mon, 14 Apr 2025 13:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744660844; x=1745265644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I+dr467YMrCXRlo27LgBCAnCDb+4zH3txMsyWAkJpXA=;
        b=kZfvKh6gMXpNUV6sClVyHYdPqfb+wW1IM/qlKhhPFRHyQJb+GhloSOAV896kTNzjmI
         gd9Ea/2REUYl8wgmFykz0blSSxnOb99j6LJKDleNlqMckgjXDITuoUiZ10P0VinxdNa7
         N8MhKxnfjxVOg6I+JUMbGtzDPwjvSz1J21m5hH2mzJ3Ms9i4a9VMruNKWBDKq95P3eTx
         dSLT3X0lFjab/jQMZeT3N9c9H4vHGLDuFr5rFl2ZM3IVr4Cau+YYIo06CZXq/2bZipue
         We8DMpHIzYN4P6kgGcovvr9o9+rdRI7T6SfUlLyMvKBYIhlXjcVVYtAY7Menu4IZ+Hl4
         aBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744660844; x=1745265644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+dr467YMrCXRlo27LgBCAnCDb+4zH3txMsyWAkJpXA=;
        b=GxXha/nCVVYQKvvJsicV72y9MC7+sqm/vm7OffnRbeX36Lr9hLWD4JrYlL5bdjHQ+w
         L/xr/eUATo6QSoaydcvWw3QD4miJGfJ0Ub7+35czfnzGUS5/sfOMunnLAEE9V6zyL8dD
         iaOl8XC/hCctV06gU3UQ3lPh3kkn+NR2xcLRu1gRmu5UzQVaINSuIn9s3V8cBI+OfXed
         aQ4Ls7Ahj3aThdwWCNxAqYlZHZIU6dcXvLKbL1jSBvQ1dcsxo5Vb/N2J22RNI+yA4/yt
         gx1IXaPKoO2l3OiXg1TQGrEfNEoHb89gmnZRhLhs9FmdtRci0F0StKUamBIXWU42kUVK
         8Mpw==
X-Forwarded-Encrypted: i=1; AJvYcCVlCGxEV/c0QEaKoaD1Mxpf1GZlvpU4c6kRaihEbLhZl+q/wDOf5Z3Lt+itCenqwYxuHhVyxFAVOhY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMnNygAx5+TYKJ4dmbh0KnjBu7VFmAWhdBfFIg0TJCZ1zN9dUR
	Ow9vUHzf+GxOd+Kk3EV+PlXcAv1ZCec2SMpj8aZmN0EAHzoveFnSzzmcMC+Ccgo=
X-Gm-Gg: ASbGncvaPxfTF4gpk+9wbvt0EK4eVGGWV4nj6gn3daCQlzEedMunwabYvbc26+KUZbi
	TUx23hfO25W1hBUz8wEIIGcwnveJ3yzBu1Wou+9Y/PLV/cEHcMtBnde1EvbGltjjsRXFBk/8CPi
	XESu4HwcVr70yXwmmf37dRtk1bIWBLVxni60rMC6fA6erT2ZYqt37vySCjQjPiJAaAZCu6slkVJ
	O8qidQJwtTdqLLlSqZQ8ZAgfXpvW+WRMXJy/4Gx8bPkQPzAur2GAlPkwz5DGMsTyTQlZHCPugtP
	BIcTxnBoArX65hZVQTTvaoctDAc9juGPMOzTtIzknAS+vs5FPq+INkMdes4j4+aWi1L7Vzk+Yw9
	Kq7LWYpZcmlZ/Om+Rneu/C10=
X-Google-Smtp-Source: AGHT+IG6KMFrnxI51KOYugO7FGCSBaq/lcvpClmyxP06XlPfwq97MevV0T43qHWbhAawMclBkpDoXg==
X-Received: by 2002:a5d:6daa:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39ea51f59eamr11814936f8f.16.1744660843596;
        Mon, 14 Apr 2025 13:00:43 -0700 (PDT)
Received: from archlinux (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9640a9sm11987383f8f.10.2025.04.14.13.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:00:42 -0700 (PDT)
Date: Mon, 14 Apr 2025 21:59:16 +0200
From: Angelo Dureghello <adureghello@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, David Lechner <dlechner@baylibre.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/3] iio: adc: ad7606: add SPI offload support
Message-ID: <alstwly2ya6qtb3usscpwavofzpinakmtx4dugt3aoey3fyjqz@sfnxwjt72jjj>
References: <20250403-wip-bl-spi-offload-ad7606-v1-0-1b00cb638b12@baylibre.com>
 <20250403-wip-bl-spi-offload-ad7606-v1-3-1b00cb638b12@baylibre.com>
 <20250414192422.039817b7@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414192422.039817b7@jic23-huawei>

On 14.04.2025 19:24, Jonathan Cameron wrote:
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
> > +	rx_dma = devm_spi_offload_rx_stream_request_dma_chan(dev,
> > +							     bus_data->offload);
> > +	if (IS_ERR(rx_dma))
> > +		return dev_err_probe(dev, PTR_ERR(rx_dma),
> > +				     "failed to get offload RX DMA\n");
> > +
> > +	ret = devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev,
> > +		rx_dma, IIO_BUFFER_DIRECTION_IN);
> > +	if (ret)
> 
> should be ret;  Thanks to 0-day for the report and fixed up.
> 

thanks for fixing it.

Regards,
angelo

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
