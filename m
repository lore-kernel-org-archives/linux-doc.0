Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39D331E11F
	for <linux-doc@vger.kernel.org>; Mon,  1 Sep 2025 11:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756727261; cv=none; b=myDGZVH1XBO38E6TW+rVDScxYmkXUR0ijPeSuRBPoXAX78JjQvXW0qpf+JTeKff4YGa6jph+TZ6SrPraMslA6gqJad+ViYgajbNYWcTBrolv6Hw2okNBgyh9vn5MXWa5UaZ9zVh1gJYgDEiCJfvhqOFwFKhzTlT/lJGIjyi8iGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756727261; c=relaxed/simple;
	bh=wU+YtIjUdHrTJHGH2u24IDhC568tsl9YMJ7XuPW7+Vo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Lv6l3ZF/tUU9U3N1hNRnQuEYvkgT6LuHWwhukfEsAviVaXa53W6geJOGh0it+RtLJ/a+KQHLG8p32I5TkjrdpfgT89CfrbogK7riXejE9RRm+YEdq5z0vBhIMpqZWcYASNRqOpCDzbOIjwMaT80nrAq1x71fDiqhs6v+ph20F9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ia3UKCUv; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ia3UKCUv"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b627ea685so36294205e9.1
        for <linux-doc@vger.kernel.org>; Mon, 01 Sep 2025 04:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756727257; x=1757332057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LzQCI9Zj8RikZvzuhO8bePIhY5c3MO1QFwxFZbxrm1Q=;
        b=ia3UKCUvOMrobZNV0skq3huITz12ts7nKuDfFYFNzVNemgaambr+IywLSB9rcE0p7w
         OQA3oZTjmsmPH6NYaZ+IGgawt4HJsYNIWzlLQa/njwccuTwULqYTC3Xs9P9cm7xNz6cM
         /sNERI+y2ospYl1fI5Rw3KjbvgZlWTENsASjgm7H5DSYSxWgm6/Ch3Z2+82+hwxtKhrk
         f6ZKqv97hOwB57rbWEofL9yvwLPnRdjX22CUKeZYjkn5MIMHioANu7qbK/mRCDb2E+x3
         A+7uyVHR/p0MStV5WIPYiIHulHo0r/3S9afHKOVQa9wj92dnt432cmhIBan9s8ekL32T
         Gmcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756727257; x=1757332057;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LzQCI9Zj8RikZvzuhO8bePIhY5c3MO1QFwxFZbxrm1Q=;
        b=ADSkO5vy2Jx3z18wtdhvqdBOwJMXjMvsSVlqM9n08H5F87xP1MG5sl1DsZ+gk5U4TO
         2BcdgV/rHGT0EpvrEmm2bghA9rdIPgFwq6Z1kJ9Yw93B3cZTDqsApNdU0xAotaHUowQ9
         Y4lFr4hC0ktJ8ouHoKl2GvwBf5UToe8Li6drBqHiA867b2jZYkRNyxoOI3NPXiJdhJaS
         yAgbIYPiKR+SOlQmSmGJOEktsB38UdRe93gfhqmyeYEjjW8QSf5Bp6RSYnOaiit+QFgR
         AYW8gKfmVQcaWjnN/EPnV3dGs40Dhjeb5LKteG81KpufkTznBGN/sRbduHNApT8uqju3
         6/rw==
X-Forwarded-Encrypted: i=1; AJvYcCW91IFREVrVPA/tnyA2+twMR9d2RwimO6UJLEWtzz7UtUBYNXz1/CwK94hSSw206qPcK2X5GEh3suE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8d/7SPeG9taZc1lYtR6eohZ+/vMLbvN+NDYnZ2UrWDmNHNNkW
	kfYj+UYMBAtg+QVP3XRtmuwqNJBeQjPlWv6pT+sRsYwG9hD5XNPnxcF7BwdRRKMqGLg=
X-Gm-Gg: ASbGncsEXz0NLVPBweTMrwOoFjIX1YmwPvPnuvOvc1ZIO0NazRoMzh0wuGlUYPyZtEc
	eg59BH+a5DET57vfbOhpLBDR/yU/DtMBckaJJQ2m9YVwoTDAXHxcI4CuwoyrSzRQX0E71GMChMf
	bM1HvGZk+2w53XRsQWXfKdxSkNx9ye9dlsaECn1Mz3bJ60PowN3o0aCAoNpC21+j49/AhM9pgFQ
	cy00nrA62OzPpGLhKGg0n1KW0rqh5a36qbpJ7+mz5gBRfMra6P/cqIQXtSCA83NsVg65aQgC/s6
	gY63Pix6BSE+yDBfehjd7Htm2asLr6k+/4DPH+XunhFlGsQdEcHdU4YGf32RwDHkmUKk41fwjvs
	xdEVYt2AVyD18N/TG2MCmJ8SCCDkCzIC3txiz+A==
X-Google-Smtp-Source: AGHT+IH0O4ZkQ2YHVX46lUYZ8xCc2gxCMjSWxlXrU84lXHEdxwk9FtWekPg/E84Nq3t3E+yY+gv8GQ==
X-Received: by 2002:a05:600c:1385:b0:45b:80ff:58f7 with SMTP id 5b1f17b1804b1-45b855c489fmr56725645e9.36.1756727256836;
        Mon, 01 Sep 2025 04:47:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf33adf170sm15932215f8f.33.2025.09.01.04.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 04:47:36 -0700 (PDT)
Date: Mon, 1 Sep 2025 14:47:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, jic23@kernel.org,
	Michael.Hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, broonie@kernel.org,
	Jonathan.Cameron@huawei.com, andriy.shevchenko@linux.intel.com,
	ahaslam@baylibre.com, marcelo.schmitt1@gmail.com
Subject: Re: [PATCH 15/15] iio: adc: ad4030: Add support for ADAQ4216 and
 ADAQ4224
Message-ID: <202508310754.Y4V0Iq26-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <006ac88a667ce0d2c751946b562af83d0f27a44f.1756511030.git.marcelo.schmitt@analog.com>

Hi Marcelo,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-adc-ad4030-Fix-_scale-for-when-oversampling-is-enabled/20250830-084901
base:   91812d3843409c235f336f32f1c37ddc790f1e03
patch link:    https://lore.kernel.org/r/006ac88a667ce0d2c751946b562af83d0f27a44f.1756511030.git.marcelo.schmitt%40analog.com
patch subject: [PATCH 15/15] iio: adc: ad4030: Add support for ADAQ4216 and ADAQ4224
config: x86_64-randconfig-161-20250831 (https://download.01.org/0day-ci/archive/20250831/202508310754.Y4V0Iq26-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508310754.Y4V0Iq26-lkp@intel.com/

smatch warnings:
drivers/iio/adc/ad4030.c:515 ad4030_set_pga() error: 'scan_type' dereferencing possible ERR_PTR()

vim +/scan_type +515 drivers/iio/adc/ad4030.c

8017880dd8ca3e Marcelo Schmitt 2025-08-29  502  static int ad4030_set_pga(struct iio_dev *indio_dev,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  503  			  struct iio_chan_spec const *chan, int gain_int,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  504  			  int gain_fract)
8017880dd8ca3e Marcelo Schmitt 2025-08-29  505  {
8017880dd8ca3e Marcelo Schmitt 2025-08-29  506  	struct ad4030_state *st = iio_priv(indio_dev);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  507  	const struct iio_scan_type *scan_type;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  508  	unsigned int mag_bits;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  509  	u64 gain_nano, tmp;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  510  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  511  	if (!st->pga_gpios)
8017880dd8ca3e Marcelo Schmitt 2025-08-29  512  		return -EINVAL;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  513  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  514  	scan_type = iio_get_current_scan_type(indio_dev, chan);

	if (IS_ERR(scan_type))
		return PTR_ERR(scan_type);

8017880dd8ca3e Marcelo Schmitt 2025-08-29 @515  	if (scan_type->sign == 's')
8017880dd8ca3e Marcelo Schmitt 2025-08-29  516  		mag_bits = st->chip->precision_bits - 1;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  517  	else
8017880dd8ca3e Marcelo Schmitt 2025-08-29  518  		mag_bits = st->chip->precision_bits;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  519  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  520  	gain_nano = gain_int * NANO + gain_fract;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  521  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  522  	if (!in_range(gain_nano, 0, ADAQ4616_GAIN_MAX_NANO))
8017880dd8ca3e Marcelo Schmitt 2025-08-29  523  		return -EINVAL;
8017880dd8ca3e Marcelo Schmitt 2025-08-29  524  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  525  	tmp = DIV_ROUND_CLOSEST_ULL(gain_nano << mag_bits, NANO);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  526  	gain_nano = DIV_ROUND_CLOSEST_ULL(st->vref_uv, tmp);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  527  	st->pga_index = find_closest(gain_nano, ad4030_hw_gains,
8017880dd8ca3e Marcelo Schmitt 2025-08-29  528  				     ARRAY_SIZE(ad4030_hw_gains));
8017880dd8ca3e Marcelo Schmitt 2025-08-29  529  
8017880dd8ca3e Marcelo Schmitt 2025-08-29  530  	return ad4030_set_pga_gain(st);
8017880dd8ca3e Marcelo Schmitt 2025-08-29  531  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

