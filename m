Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73CB3859D4
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774262087; cv=none; b=U857aL+2F/EqLlHdDgJRNgxZq9opJFd4FQsGa9Gi9hcKcgSEx8exyfP44uteqqayfK1D1dTUNpE4UBU01Hx0oo5P21jug8PADPipABvPmG4Cz5y/KeZwsaqjpAHsDoKiZoEtF9///3rBNrYqIw6/QR9bUIv83p5mhx2RXiyLXMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774262087; c=relaxed/simple;
	bh=mZ0McTWcGztL7qdM6zf7TJThxnCQDdRXIOTXjADCJGs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iQ20Hs70dcgvv0eQz1Z0ILbKnmOOdAun+IFWZA8wK1IM4FIBbEN+HmSTiLugIgxJiev2j2CAYy+N1HPRf0xAgT8V8zZseDOQgBVVpMADOzhq6H6R1ViFsGCWZc/DsipxL7YtdBpd56aVRT72fechL/bUfUDVHuH/eWk9UWXBR5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnz63AHs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnz63AHs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43b3f91a7abso1719f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774262084; x=1774866884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUqIsDJo6AEfyjgSHUzAgFLd+VFu9ll5ZcHVDadW1X8=;
        b=fnz63AHsrX9ozrEeV992GJJLxUcx5KIIrsPMTuBEQCACkeMdAK8MX+SBS9unjo4WpT
         717+ugih3+eR63no1P2b6hesVzzT07XATJnR0rtkK60JkmmxrK1PBTwxRzpcEB6fvNdV
         4EQCt5k5gTvnL5WfKLejeq6pXpZiesZZ1K9l+F4KcwTxR4vkoWP5XzWvLUphiO2Zf0HU
         K10uqjgjmcWo8EAwZqxQWUIrTOFXt/0JuyuRoAk7++oE/i0a8kUqCdvhuRea+F8KmE01
         XCPMyZCw+MbI9rGSqMIqBYfjFrRTIdEp6wyVp4y07VnmJ32gHs++jJHRlqa/ZXy4GSfF
         4Bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774262084; x=1774866884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fUqIsDJo6AEfyjgSHUzAgFLd+VFu9ll5ZcHVDadW1X8=;
        b=hRgI+rXaEyw/IOdAJKpPivEJVfXkjU0wTdsvXOi4oFxnE4Ald7hurywWBA4eIG3Iz1
         wOFSgm9U+V06vfPqwbkXzzgN5dYBtlGf54uvchyRBKrPe3y1fVJ3x8WBXK76pLKXJ5HH
         MBf5jQ9vUmjhy15lhSU5/ZTWHe6JeesE+hrgYB6y2czwhx0xmRi1rGcH5Rh5bQU196yQ
         LooQvqJaniuvVzB5NlKXsZbXm5mEpnl2X+K641+TKs8o8QyzUT3mQ29xV47uwH1NeghR
         FOOE+hUzPQwVjOYxj9KdbRKImSAJRFBtlmpXoAGL9FFhhKy6zldT9trWwlSl60oUSmns
         1/AQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5OZ0k1s65kcWIRJpfGNcl5I7cgbD38kpwypqYU7pW2tNM1B/ga+WHKz8d6ZkM7b2ODQocCr3/IR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbu1eRYWaZgT0/DJjrT/9P9UsG/J9oPTtB6FEDTNHfqQvykGD
	Bf8fqUa3nOqLGb+3FD7SHjAT1Ch4kV1NmZVoCv5VMCdKa3Ln82Bf7yvH
X-Gm-Gg: ATEYQzx6uULaykSRvfyEt+Z4obqfHYBSJeCVXV7L6bEYmgdAlx6DyyWHdTlqWS88+aE
	XCvRk0CpaK8drL9oxNsgmL05PDEGvsuucbdFQOZVA7ICRoSn2vwXU5EGbG2KOY4MzhHPz5eOSaM
	1w88v/R3Gcu0/+K/hn53WXVtgTNnIk8VC6Q9vZwyp2Yks/2k4rzpstFJ1Q0IJrMpqftRUNuGrfh
	2aO8m+PrgIJwm7ubmNAxU/xTqW2UdOQx1X8fGOKfNhszaGZaj971v25wQJHmr1eQR8Nl+wXEjeB
	56qb8TCJQs5HcOp8FZdQAZvSY9csBbNUg3eoq/viR61nT/qhChhEgdQ8XjFH4SOyABCiISGaSNE
	TqMM4ilN7IeKfPaVN+iIrF5zS1JFHHfOIv6A/TZuaO9s5LppUVvpBz9Ok32Z43wNn9/CkhT2w65
	8GGI3b2auwAGnTfAoG7/sJCasEaCAIder55iHacL9ZSCXzpkoJjxvUni8IHncpRjAseBAt3EQKV
	UoeIP6g7BzTJrDsEJ0HWoV1qeia9oEeoSMDMz2ME6qTOlJClFA=
X-Received: by 2002:a05:600c:c8a:b0:485:4453:401d with SMTP id 5b1f17b1804b1-486fede7336mr170383695e9.2.1774262083711;
        Mon, 23 Mar 2026 03:34:43 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff118bb4sm124482435e9.2.2026.03.23.03.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:34:42 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 23 Mar 2026 10:34:37 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH RFC v2 2/9] iio: frequency: ad9910: initial driver
 implementation
Message-ID: <grjlyz76cmjy7t3ytwycaklauipbqcj7adjr2t7k3axwlayowr@4zbuzehcrpvs>
References: <20260318-ad9910-iio-driver-v2-0-e79f93becf11@analog.com>
 <20260318-ad9910-iio-driver-v2-2-e79f93becf11@analog.com>
 <20260322165058.6c4b193e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260322165058.6c4b193e@jic23-huawei>

On 26/03/22 04:50PM, Jonathan Cameron wrote:
> On Wed, 18 Mar 2026 17:56:02 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> 
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add the core AD9910 DDS driver infrastructure with single tone mode
> > support. This includes SPI register access, profile management via GPIO
> > pins, PLL/DAC configuration from firmware properties, and single tone
> > frequency/phase/amplitude control through IIO attributes.
> > 
> > Signed-off-by: Rodrigo Alencar <rodrigo.alencar@analog.com>

...

> > +#include <linux/array_size.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/device.h>
> 
> Generally can avoid including device.h in favour of more specific
> headers.  There are a few exceptions where we can't such as actual
> dereferencing of struct device, but I don't recall seeing a case in here.

I understood that the usage of devm_add_action_or_reset() would justify
the header.

...

> > +#define AD9910_EXT_INFO(_name, _ident, _shared) { \
> > +	.name = _name, \
> > +	.read = ad9910_ext_info_read, \
> > +	.write = ad9910_ext_info_write, \
> > +	.private = _ident, \
> > +	.shared = _shared, \
> 
> If there are only a few of these, I'd put it long hand rather than
> using a macro. Tends to end up easier to read.

Next patches will leverage the macro as more ext_info attrs will be introduced.
I suppose we can build the foundation for later extension.
 
> > +}
> > +
> > +static const struct iio_chan_spec_ext_info ad9910_phy_ext_info[] = {
> > +	AD9910_EXT_INFO("profile", AD9910_PROFILE, IIO_SEPARATE),
> > +	AD9910_EXT_INFO("powerdown", AD9910_POWERDOWN, IIO_SEPARATE),
> > +	{ }
> > +};
> 
> > +static int ad9910_read_raw(struct iio_dev *indio_dev,
> > +			   struct iio_chan_spec const *chan,
> > +			   int *val, int *val2, long info)
> > +{
> > +	struct ad9910_state *st = iio_priv(indio_dev);
> > +	u64 tmp64;
> > +	u32 tmp32;
> > +
> > +	guard(mutex)(&st->lock);
> > +
> > +	switch (info) {
> > +	case IIO_CHAN_INFO_FREQUENCY:
> > +		switch (chan->channel) {
> > +		case AD9910_CHANNEL_SINGLE_TONE:
> 
> I haven't read on yet, but if you never have any other cases in here,
> perhaps us an if() as it will reduce indent of the code that follows.

Similar, other channels will be introduced here so additions are easier
to review.

> > +			tmp32 = FIELD_GET(AD9910_PROFILE_ST_FTW_MSK,
> > +					  st->reg[AD9910_REG_PROFILE(st->profile)].val64);
> > +			break;
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +		tmp64 = (u64)tmp32 * st->data.sysclk_freq_hz;
> > +		*val = upper_32_bits(tmp64);
> > +		*val2 = upper_32_bits((u64)lower_32_bits(tmp64) * MICRO);

...

> > +
> > +static int ad9910_cfg_sysclk(struct ad9910_state *st, bool update)
> > +{
> > +	u32 tmp32, cfr3 = AD9910_CFR3_OPEN_MSK;
> > +
> > +	cfr3 |= AD9910_CFR3_VCO_SEL_MSK |
> > +		FIELD_PREP(AD9910_CFR3_DRV0_MSK, st->data.refclk_out_drv);
> > +
> > +	if (st->data.pll_enabled) {
> > +		tmp32 = st->data.pll_charge_pump_current - AD9910_ICP_MIN_uA;
> > +		tmp32 = DIV_ROUND_CLOSEST(tmp32, AD9910_ICP_STEP_uA);
> > +		cfr3 |= FIELD_PREP(AD9910_CFR3_ICP_MSK, tmp32) |
> > +			AD9910_CFR3_PLL_EN_MSK;
> > +	} else {
> > +		cfr3 |= AD9910_CFR3_ICP_MSK |
> 
> For this, be explicit what value you are setting, probably be defining a max value
> that the field can take.  Whilst just setting the mask is the same it doesn't
> convey the same meaning to someone reading the code.

This is just the default value from the datasheet, ICP should not really matter
when the PLL is disabled, so removing this should be fine.

> 
> > +			AD9910_CFR3_REFCLK_DIV_RESETB_MSK |
> > +			AD9910_CFR3_PFD_RESET_MSK;
> > +	}
> > +	st->reg[AD9910_REG_CFR3].val32 = cfr3;
> > +
> > +	return ad9910_set_sysclk_freq(st, AD9910_PLL_OUT_MAX_FREQ_HZ, update);
> > +}
> > +
> > +static int ad9910_parse_fw(struct ad9910_state *st)
> > +{
> > +	struct device *dev = &st->spi->dev;
> > +	u32 tmp;
> > +	int ret;
> > +
> > +	st->data.pll_enabled = device_property_read_bool(dev, "adi,pll-enable");
> > +	if (st->data.pll_enabled) {
> > +		tmp = AD9910_ICP_MAX_uA;
> 
> Defaulting to max current seems unusual.  What's the motivation? Normal instinct is
> go minimum if no other info.

ICP_MAX_uA leads to 111 in the CFR3_ICP field, which is the default value when the
device resets or when it powers on. I suppose that if we are not touching that
property, there would be no reason to change that.

...

-- 
Kind regards,

Rodrigo Alencar
