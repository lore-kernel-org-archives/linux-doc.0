Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4605827A904
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 09:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768211797; cv=none; b=YKaAi7oxVe/JlqfZ//1tjPUB6oDOQuuXxLvJuLP+mXVIj5aWCykniQ1p7rykmQHrJ1kz8+gPqqL+5S92HauM1F20wi767GfZhv95b3zMl4tDMCU0ioAEmk2EnTn3EVff0XF1Awu0g1ibvru7DoeE8CZp1wuYubUar87GRH51QM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768211797; c=relaxed/simple;
	bh=3s/FMAtzszYcu9PdHJfF317mWoWH9YpJ2wK1w4fpfk4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WIiuae1A8tNRgo0XfwIaGNBdS+nx3quh5s+ePu6jqsS10i/F/AjB++ZMBbCnKz8BMDfLDPDKuX74DB07bWVd0IL5tGV4Q1FDg05UDGvcxCT0847hfGI9d3i5YF9PD6tBLhk1Wg++vkMnPhU6vFN7dIR01dRT4DRUyI9uMAZallU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kLv8bhia; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kLv8bhia"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-88a2f2e5445so76479186d6.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 01:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768211795; x=1768816595; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MnATEC3zLg0tL86MlP2EV/1JLZWPopkEABO3EE71r+k=;
        b=kLv8bhiaFBSoPdw8udk652N6eQ3DrGMy7A8juzduVpU/b+SCTLEkYlxl0MUQdYjClg
         vFZ7q5WmR7K365Mkf3+a2O3mYsmFba8dzJ0sgM0BzDL+WhrjX4mFAq5prBzTnUchtRSK
         5j6Jlzcp63ldFzkcCPh8osqTfFcEyedyrSJVg76j1C14HVkkFXddPRc07q00sJtwhBmZ
         3JZUI/ZfAxXC8H95GQMlQ+aCVEufhjbXBl3wUoe6s1yawKQ2bZOO0W5ekxvvmVHZ5CXi
         hz1oj0XGX2AFF3qC/+98UfqUgT1xe/VZND0VodCc9vcBWq8dZwOpBFRNgLG9Tn4wAPBo
         6XJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768211795; x=1768816595;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnATEC3zLg0tL86MlP2EV/1JLZWPopkEABO3EE71r+k=;
        b=XI1hPWnnAE/oDQpvlodK81qqbzBweyFBT3KRkovVXgMaWIFC6XTqikSV1VyZCxT6vp
         9ihqyKgfDHfhaSrTqLCqSgxnKAGM8LvQKBzxKrfaExcmXFfna7wKmjQ9FaYHLSpOXi4Z
         VFo7lBlzjPPFAFOa2T/3BrTEshKL15dkeDR+oYU0ERr9oGVgiZ+lMKg7XSF43yh/ezhK
         W6FcpE3rPUuq9gmGOo3fRncRwjJaFrb3BgHcpTEqksFFIxshf/LbknAOsSnvnC1Uz5aY
         unPMyjBOVUci3LNm4BWV1XicLTmGhOi3qNxMXHY+xstLC9J463iq1X6bA35vfDAztdUF
         cfxg==
X-Forwarded-Encrypted: i=1; AJvYcCVtx0l6gdgDcMLPAvF4l6H0yuKaESmDI2uM5B3a3impabtzxaJ+pumXXTSGqq3EbVYLFoSppnCxsxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBXpGGGxj537/FTMy9OKPE9l+/tJm31MMIKtU1hs0dqz8coLiy
	/y7MAqLxbKHCze+IvM9smLj3FMe/NTJkemo+Kp39z63pYGyaEKUxwKZU
X-Gm-Gg: AY/fxX7sNZmuTN9jkax1RfMTh1l+NFyZggFuJQNZ9GdNGoTwvHwSfZJNhD1/ywxz5RX
	Ou9L04Gj0Dt1M9fN6T1PNz+THADzHWKoB7PZqSFHzLjIbSWCznUnw9E6TBQqZay6uGckcf1LkzR
	gsaZycWFl4X/K5F8N8pAVeP17cp2jUoFPMjJRb50T2+FDT1oyDTM06gKz3xCUWC84xFl9vioBGu
	ieJucWz8c97t4wwT3v02VqJzvYdIDUBWbjmOQBAJ2O4x12uKjmSlpAMgKGOI5v7eFcZLiKK6qYf
	jUZ4pmEEBw8qHuo3p0+EuFA9Q0mrhVn3uNYPGUetsPCa2BjuWENeIgsENH6rlhW3X3Q56Iuvm2E
	urvIOGoGED1kYkqolTN6B9szLRw11tXXbuAN4hlOQYF5INAMC+RSGXX7RH6/nOWN2ZE1sGpk64e
	yq86kNcrH5kJviHTBB8/O5IFwfP8iZ9FRiT/D3s/5kquWVfYS0jHh2JdeiV+Py/OXo1Rw28aew1
	z9r
X-Google-Smtp-Source: AGHT+IGfjbR1JItQWWDS/6nxRJ8tfrCJBireKBKEmFX+tFc5HJk5PzGCIGvKimxXJ2znJZjE+wGwRQ==
X-Received: by 2002:a05:6214:3bc7:b0:880:498e:a63e with SMTP id 6a1803df08f44-8908417a374mr295137846d6.2.1768211795213;
        Mon, 12 Jan 2026 01:56:35 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2aa5sm135606526d6.19.2026.01.12.01.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:56:34 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 12 Jan 2026 09:56:25 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/6] iio: frequency: adf41513: driver implementation
Message-ID: <6hcqrcy3meskddrklb3jtlpca2snrs4upwms56lhq7mkes7krm@vdiaqkfc6lgg>
References: <20260108-adf41513-iio-driver-v3-0-23d1371aef48@analog.com>
 <20260108-adf41513-iio-driver-v3-2-23d1371aef48@analog.com>
 <aWFPEa9HI4wmYLpn@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWFPEa9HI4wmYLpn@smile.fi.intel.com>

On 26/01/09 08:55PM, Andy Shevchenko wrote:
> On Thu, Jan 08, 2026 at 12:14:51PM +0000, Rodrigo Alencar via B4 Relay wrote:
> > 
> > The driver is based on existing PLL drivers in the IIO subsystem and
> > implements the following key features:
> > 
> > - Integer-N and fractional-N (fixed/variable modulus) synthesis modes
> > - High-resolution frequency calculations using microhertz (µHz) precision
> >   to handle sub-Hz resolution across multi-GHz frequency ranges
> > - IIO debugfs interface for direct register access
> > - FW property parsing from devicetree including charge pump settings,
> >   reference path configuration and muxout options
> > - Power management support with suspend/resume callbacks
> > - Lock detect GPIO monitoring
> > 
> > The driver uses 64-bit microhertz values throughout PLL calculations to
> > maintain precision when working with frequencies that exceed 32-bit Hz
> > representation while requiring fractional Hz resolution.
> 
> ...
> 
> > +/* Specifications */
> > +#define ADF41510_MAX_RF_FREQ			(10000ULL * HZ_PER_MHZ)
> > +#define ADF41513_MIN_RF_FREQ			(1000ULL * HZ_PER_MHZ)
> > +#define ADF41513_MAX_RF_FREQ			(26500ULL * HZ_PER_MHZ)
> 
> We need HZ_PER_GHZ. I think it's easy to have one be present in units.h.
>

26.5 GHz is not going to use HZ_PER_GHZ, so for consistency I think it makes
sense to keep HZ_PER_MHZ for the others.
 
> ...
> 
> > +#define ADF41513_MIN_REF_FREQ			(10U * HZ_PER_MHZ)
> > +#define ADF41513_MAX_REF_FREQ			(800U * HZ_PER_MHZ)
> > +#define ADF41513_MAX_REF_FREQ_DOUBLER		(225U * HZ_PER_MHZ)
> 
> How does "U" help here?

not much really, will remove.

> ...
> 
> > +#define ADF41513_MIN_INT_4_5			20
> > +#define ADF41513_MAX_INT_4_5			511
> > +#define ADF41513_MIN_INT_8_9			64
> > +#define ADF41513_MAX_INT_8_9			1023
> 
> Not sure if we want (BIT(x) - 1) for the limits as we have non-0 minimums.
> 
> ...
> 
> > +#define ADF41513_MAX_CLK_DIVIDER		4095
> 
> Sounds like a candidate for (BIT(12) - 1).
>

limits for INT are taken from the datasheet as is, so I think it makes to leave them
like this, as for CLK1/CLK2 max divider, indeed I can make it (BIT(12) - 1) as it
refers to a 12-bit register field.
 
> ...
> 
> > +#define ADF41513_MAX_PHASE_MICRORAD		6283185UL
> 
> Basically I'm replying to this just for this line. 180° is PI radians, which is
> something like 31415926... Can we use here (2 * 314...) where PI is provided in
> one of the used form? This will help to grep and replace in case we will have a
> common PI constant defined in the kernel (units.h).
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 

kind regards,

Rodrigo Alencar
