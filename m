Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08031F5E6
	for <linux-doc@vger.kernel.org>; Sun,  2 Feb 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738499463; cv=none; b=e0aDx+e83rSlmeuSgt4z0PJ0aEo/T53009JjUaNAraZBMH4GBmb2vHFReITBoTl5A9XPU/o+0KLnollCx7blKKbwBTkfl63x3K+6LZ5dAzxh9yHsIkdXc6bUG5RuBJqaonaygISh5YrR/bnDUJK8iLCv4tPNoLoeWSbrhhrAAlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738499463; c=relaxed/simple;
	bh=8XkcDIU79KYn3BQikPV7cgBJWei8V9IOQLVVrLhURck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MwmOAmBDEGBSoZxkxqjDf45l5I9GCAJaxCEsh1G63nSaJGyP947oQ4Xax0e5LU4RaCmhkxTxW8NISywfjVSk2cA9vqkF4fdJbf3sBCMDeCC0kqakI2m8l4dr5hVFx9ASUmim7+ifKd6DvKbgOP61MJbdRUM6dKS0rfLlr+xYjco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NyNVDl1y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NyNVDl1y"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso3112898f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 02 Feb 2025 04:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738499459; x=1739104259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+p0ohduqaZ7edLUoQ+HYNori1GSc42S4tYMlilYNvY=;
        b=NyNVDl1yrdC+uHkOVWjqkNDP/VY/TSHsRAYBVS/tY/VB9g/UklJRQmRED5fHHW4+rt
         CkqOt3Eip4VMYEx1sWOgKfnCquoRgNW0lu8l8Of6hDaS5ZxKB7Z32c/6bzE62USEBmUN
         Qjd896Opp7mUf9XSN5e84w/5FJjAFJiY//othHygggjGTm686UHEpwzh3bDcx2bwKZ+1
         IUvz/jMqBqHmWR2QRJv7LzWyPp1PZvLDDnLcI6/wLbY2kUPKKnI9U4ILTvDH7x1L9P/G
         KAQIsrHwcafuXOLJXWB/Gidu8Hph7DZXLQwdREj7x4XBuNLIteyAc9WFP4CGVsSa/20r
         IRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738499459; x=1739104259;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+p0ohduqaZ7edLUoQ+HYNori1GSc42S4tYMlilYNvY=;
        b=OxrtzL80CrOsyBApSx+Pmn3zlb0luYcJcOwcZ9DZNFNPonYTWl/si1Z1mNArUVMB81
         HdPZakLHTVsHxL8Uzvu0L5JPI1MmH8+QNwosOFXTuEA6GlkiQD9SSiklSP9P3/XUKIbX
         /E0Lgh9jWnREhkabnRmcSccm8JQSrEe6zshBX2ghiOMLgRd9IS6gq71va6SBl57RLOvY
         Cm88YHGG2WIeA8holz7PmQBP3oe9Yv5tuAjkG2ULtU3Ty9l4VgsOOQaVv7ZiqI56LorD
         1ro+s8A2TMvdn2PITHJMCy/ltrIVG6lpsoUHNYhTgsj0nkYKQe2fio5+ulB5FxgWcENk
         vBRw==
X-Forwarded-Encrypted: i=1; AJvYcCWGA/bbLzqFTbqvtoN5RH1tRGiFtBNbrSw/eJdzPz+PpJ67bvat4rAItZybUSFHPxLuSs3Eh8ysP94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBOcN3FpU+HMC8rEE9/uq3LJK41PabH5wAhICgwzNzKCfDcb8z
	SdH/lLcBo4PFRNi2q3hmzYN6F3NUbhaKdjPd/oQtARmq5ZnJ6pwkRvvqLuT3qqk=
X-Gm-Gg: ASbGnctfUE+v3W+AFvvAcLekAGk6CnZ9fJiQqd4U6+6gbrbsqCzYBeO+V/PUFoXjAgf
	k8niLwfTuW01qUeK6dmbcWxLJfX53Lr0M15vwKet7r1eJA3LYm43H+9H817PBd6N9UeJ5jncgws
	Qtx4Cet/m33J4hHmALHkG9zflup1EbZET+AddO3uArKvKXX11mye+qFY3NUDERHaPZsw3zVqq32
	el+Km6T3fSueZ+woR0W4HlHNScA92xUzEanA+FB7vE1FCgA26n24pJKZ5kJzLd1U0/z4x/cWYEP
	Uwzr0LDFvWHVUCniFqCK
X-Google-Smtp-Source: AGHT+IG3DguqEpjs4KAq3Q5U108MHFsGzy1qjHj3g8CQKeY2xRe7mNrhaVjuu1vZih3UFfYOgwaFPQ==
X-Received: by 2002:a05:6000:18ae:b0:38a:9fdb:7307 with SMTP id ffacd0b85a97d-38c51f8b280mr19894271f8f.43.1738499459090;
        Sun, 02 Feb 2025 04:30:59 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38c5c11b363sm9753396f8f.40.2025.02.02.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 04:30:57 -0800 (PST)
Date: Sun, 2 Feb 2025 15:30:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Esteban Blanc <eblanc@baylibre.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Esteban Blanc <eblanc@baylibre.com>
Subject: Re: [PATCH v3 2/6] iio: adc: ad4030: add driver for ad4030-24
Message-ID: <4e0118d0-0992-4d71-8dfb-8b75c0f51a17@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250130-eblanc-ad4630_v1-v3-2-052e8c2d897d@baylibre.com>

Hi Esteban,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Esteban-Blanc/dt-bindings-iio-adc-add-ADI-ad4030-ad4630-and-ad4632/20250130-191153
base:   ffd294d346d185b70e28b1a28abe367bbfe53c04
patch link:    https://lore.kernel.org/r/20250130-eblanc-ad4630_v1-v3-2-052e8c2d897d%40baylibre.com
patch subject: [PATCH v3 2/6] iio: adc: ad4030: add driver for ad4030-24
config: um-randconfig-r071-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021354.T5JOCCcy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502021354.T5JOCCcy-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4030.c:263 ad4030_spi_read() warn: calling memset(x, y, ARRAY_SIZE());

vim +263 drivers/iio/adc/ad4030.c

8cfce061c9e580 Esteban Blanc 2025-01-30  242  static int ad4030_spi_read(void *context, const void *reg, size_t reg_size,
8cfce061c9e580 Esteban Blanc 2025-01-30  243  			   void *val, size_t val_size)
8cfce061c9e580 Esteban Blanc 2025-01-30  244  {
8cfce061c9e580 Esteban Blanc 2025-01-30  245  	int ret;
8cfce061c9e580 Esteban Blanc 2025-01-30  246  	struct ad4030_state *st = context;
8cfce061c9e580 Esteban Blanc 2025-01-30  247  	struct spi_transfer xfer = {
8cfce061c9e580 Esteban Blanc 2025-01-30  248  		.tx_buf = st->tx_data,
8cfce061c9e580 Esteban Blanc 2025-01-30  249  		.rx_buf = st->rx_data.raw,
8cfce061c9e580 Esteban Blanc 2025-01-30  250  		.bits_per_word = 8,
8cfce061c9e580 Esteban Blanc 2025-01-30  251  		.len = reg_size + val_size,
8cfce061c9e580 Esteban Blanc 2025-01-30  252  		.speed_hz = AD4030_SPI_MAX_REG_XFER_SPEED,
8cfce061c9e580 Esteban Blanc 2025-01-30  253  	};
8cfce061c9e580 Esteban Blanc 2025-01-30  254  
8cfce061c9e580 Esteban Blanc 2025-01-30  255  	if (xfer.len > ARRAY_SIZE(st->tx_data) ||

These ARRAY_SIZE() checks work fine before ->tx_data is a u8 but really
is should be sizeof().

8cfce061c9e580 Esteban Blanc 2025-01-30  256  	    xfer.len > ARRAY_SIZE(st->rx_data.raw))

Same.

8cfce061c9e580 Esteban Blanc 2025-01-30  257  		return  -EINVAL;
8cfce061c9e580 Esteban Blanc 2025-01-30  258  
8cfce061c9e580 Esteban Blanc 2025-01-30  259  	ret = ad4030_enter_config_mode(st);
8cfce061c9e580 Esteban Blanc 2025-01-30  260  	if (ret)
8cfce061c9e580 Esteban Blanc 2025-01-30  261  		return ret;
8cfce061c9e580 Esteban Blanc 2025-01-30  262  
8cfce061c9e580 Esteban Blanc 2025-01-30 @263  	memset(st->tx_data, 0, ARRAY_SIZE(st->tx_data));
                                                                       ^^^^^^^^^^^^^^^^^^^^^^^
same.

8cfce061c9e580 Esteban Blanc 2025-01-30  264  	memcpy(st->tx_data, reg, reg_size);
8cfce061c9e580 Esteban Blanc 2025-01-30  265  
8cfce061c9e580 Esteban Blanc 2025-01-30  266  	ret = spi_sync_transfer(st->spi, &xfer, 1);
8cfce061c9e580 Esteban Blanc 2025-01-30  267  	if (ret)
8cfce061c9e580 Esteban Blanc 2025-01-30  268  		return ret;
8cfce061c9e580 Esteban Blanc 2025-01-30  269  
8cfce061c9e580 Esteban Blanc 2025-01-30  270  	memcpy(val, &st->rx_data.raw[reg_size], val_size);
8cfce061c9e580 Esteban Blanc 2025-01-30  271  
8cfce061c9e580 Esteban Blanc 2025-01-30  272  	return ad4030_exit_config_mode(st);
8cfce061c9e580 Esteban Blanc 2025-01-30  273  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

