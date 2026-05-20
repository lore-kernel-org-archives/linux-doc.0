Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66084014AC
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779302855; cv=none; b=nn0Y9sdeTKXOAySw7Q+qd3/2SeGwwwCnmfVV1aOswgQui/ONYOfYDzGQ1Vr8awtbcDj25hJpcVnEPZpaXIdsqKRSjkccDExE2lXODgmnOtAtrlEAMubUsGJ3BNARYRBsh5+TWhyITnJO4MgoPx5aAqeIBRxjLwrQ4vxSv41WhEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779302855; c=relaxed/simple;
	bh=GtWAvNoa8liocTFIE29GV3PrLzqRKVIbyQdAYPsgXsg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPb1VHBcOFLNqm63FIV8xNvi+4FpZN49s/ni0MuB6+Lx80enHAV7e64dGYRq9Pua1sabcu43EWdLfF3Inq/LqQG5iHUO01mQG+5yvbwFvPz6KF38pGfPxiilt0hrGHNEqQDUnsg2rWdOZG5XOlwk9OTPE+Ygm50+5cI5nv3N/rA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EQAVt12I; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EQAVt12I"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44e1860558fso3331759f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 11:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779302852; x=1779907652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/hEwaR6TEFLYShpta6veHoxTDP0ik8niJki4wmQa0RY=;
        b=EQAVt12IbPCrpc2rNHDrbX2HJWDPnRSLUJ3LwZMumBGjkgVcHLhN2JE9sX26byQqM1
         fJtY9osxEJydypLMFZKL9mJiMD4ffHzmJ34EkXWh/5fEUCH/OBA8ez7e01BHYSddZz05
         rzwzhq0tbdwbyM1J3Q8Mpmsx0og6xco2+KF65emtihqCh0DSxwvTZ65KsbJEurlYeIYz
         kmA7J7vdlWQvKbGaDCTNlxlDS8bu1/HnSRkBIjvPPwK/jM+L3dOfcvz2tryfa8/pFCHf
         n1w0lZxOVFwootJB/FmqRSLNDJKg6seXTr4UN3V3c+1SbJVyqm7q42tHtdzqkOGRlzVR
         s96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779302852; x=1779907652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hEwaR6TEFLYShpta6veHoxTDP0ik8niJki4wmQa0RY=;
        b=NNDMVTZmhxFJQ+43mKNTKIkzWPMTjV3kgglQVUVzzAPx/2+W5BiwX3ZFyLvad7vRRK
         D4zGanj8EDMk9Z3/cDhLGOFyfLgL9mMcZKGvIhhF31ydaEFXSkrlmaoyG27T7fAC2e1s
         +uVUiUJrGGYFnD9BGhQ/KslJQBJ1hQRq3e9OafG9D+OsAdeRlxN2+X9GlzvPtiQ9VRZ0
         mht4q0H4XIPO9JcB3/n/uxpTIVUJjAgJC37dgcM0oIcfDLiJ8GbdhNqgwTYn2B7actOu
         YGVmmkTXGmgr6+rSlT5OfatY6RCSX9ZwGZ0HYkNl3FIu5Qu8nMUCIisccBYybX5KMvkW
         7I4w==
X-Forwarded-Encrypted: i=1; AFNElJ8fUw7BxivJ79kGH5XCW1zjm1pGgxmOP1GbVOssXd3A6oJbmJtYQqzjwF6Hc9d1lu7BEd4y1NGvlw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwapzLf+7q+nXFYsauMx2UZI0ZfXNqli92viQIB+zp8Hsvj3Z1p
	d/AQmgJVS8l8PjE41nWGpjrNzI6IkfIG+HADC/Fns8lVgnLLaza/HxVd
X-Gm-Gg: Acq92OEb+zSDHQ1vhCJsiA53fJ88Zb4A1vw2EVgi2cOb8gfq8ui+UhYEWGYeGjWu0kF
	CTUQfAIKDSXS18gJFrh4s5rOqhOHU6VdRCKyVbC3MjaI8k1WXY1tpyUQLYPTiZb3kGpuywx4FsG
	EO4ZrGolAS1gV0W4XlCORYvt4GWjmF+ijP9pcqW0eXULqg3g+5CWfEwZ4Si4Wky2F4lcZZVXKab
	9zpsXAi4XT5WtKVFp1yVcp2JaAJg6QWVYV883jT8j7pkwHbqE2KUCQHMx2vcfidkoP/wmo/zK8D
	fqTDDI2D9QEtgNDEA4SJvuzdyK8spqnOIGG9G3hx8LJOcjcjYM2Q+2VTwhEfn0bTHyce7n2kYyr
	1XN88LtiyHGen4OxDrhejZgBKcQzffI/8tw1LYWJ2JIJspyAK0Imi+s5SeHkzrbwFPzfB9o+9As
	4YZwUN0/dq7c+BYvNznzMOVcl4Fd8aR1K8wkQ/Gxh3cmJhF1MJ/oFBwA1JleaUM8VilLH9MgbzV
	+hE5l0cB0CtYd5Whk6zKMlF31cbtfJayGw0fZtYt5F3uyODrHs79CPcW6W2
X-Received: by 2002:a05:6000:2401:b0:43d:7275:c1eb with SMTP id ffacd0b85a97d-45e5c5dadeamr41206197f8f.39.1779302851879;
        Wed, 20 May 2026 11:47:31 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3acf7sm56929827f8f.12.2026.05.20.11.47.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 11:47:31 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 20 May 2026 19:47:25 +0100
To: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v5 12/13] Documentation: ABI: testing: add docs for
 ad9910 sysfs entries
Message-ID: <vqqvn2cgs3fbp5mq6xfac7iyosaqfrvgngqur4x355a3at7slo@ylrtd6fhi33a>
References: <20260517-ad9910-iio-driver-v5-0-31599c88314a@analog.com>
 <20260517-ad9910-iio-driver-v5-12-31599c88314a@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-ad9910-iio-driver-v5-12-31599c88314a@analog.com>

On 26/05/17 07:37PM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add custom ABI documentation file for the DDS AD9910 with sysfs entries to
> control Parallel Port, Digital Ramp Generator and OSK parameters.

...

> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_offset
> +KernelVersion:
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		For a channel that allows frequency control through buffers, this
> +		represents the base frequency value in Hz. The actual output frequency
> +		is derived from this offset combined with the processed buffer sample
> +		value.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_frequency_scale
> +KernelVersion:
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		For a channel that allows frequency control through buffers, this
> +		represents the frequency modulation gain. This value multiplies the
> +		buffer input sample value before it is added to a frequency offset.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_phase_offset
> +KernelVersion:
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		For a channel that allows phase control through buffers, this
> +		represents the base phase value in radians. The actual output phase	is
> +		derived from this offset combined with the processed buffer sample
> +		value.
> +
> +What:		/sys/bus/iio/devices/iio:deviceX/out_altvoltageY_scale_offset
> +KernelVersion:
> +Contact:	linux-iio@vger.kernel.org
> +Description:
> +		For a channel that allows amplitude control through buffers, this
> +		represents the value for a base amplitude scale. The actual output
> +		amplitude scale is derived from this offset combined with the processed
> +		buffer sample value.
> +

This will become just offset with altcurrent channels. I noticed we have a IIO_PHASE
iio_chan_type, could we have a IIO_FREQUENCY too? Parallel port needs actual raw
frequency values in that case to be written to the dma buffer.

Then we may have buffer capable channels for the parallel port:

out_altcurrent120
	offset
out_phase120
	offset
out_frequency120
	scale
	offset

Problem is that the math for the actual frequency output is:

	f_OUT = f_FTW + (f_RAW * FM)

where f_FTW is a base frequency (already scaled), FM is a
modulation gain and f_RAW is the contribution from the parallel
port, which is the already scaled:

	f_RAW = RAW * f_SYSCLK / 2^32
	f_FTW = FTW * f_SYSCLK / 2^32

so the above becomes:

	f_OUT = (FTW * f_SYSCLK / 2^32) + (RAW * f_SYSCLK / 2^32) * FM
	f_OUT = (FTW/FM + RAW) * f_SYSCLK * FM / 2^32

if I make:

	SCALE = f_SYSCLK * FM / 2^32
	OFFSET = FTW/FM
	f_OUT = (OFFSET + RAW) * SCALE

That would work for a IIO_FREQUENCY channel type, problem is that both
scale and offset would depend on the modulation gain (FM)... I suppose
scale should be setting that and offset assumes it is constant to act
only on FTW.

I suppose we can keep altcurrent for other modes as phase and frequency
can be attributes (knobs) for them. However, in parallel mode we are effectively
pushing frequency, phase or amplitude values into the buffer.

The polar destination is a corner case, but can be solved when both
phase and altcurrent channels are enabled. When that happens we can
change the scan_type with has_ext_scan_type = 1, so the 16-bit data
bus is split between the two.

With the above, all of those *_offset and *_scale custom ABI can be dropped. 

-- 
Kind regards,

Rodrigo Alencar
