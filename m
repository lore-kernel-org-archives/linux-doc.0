Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08785241690
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763927314; cv=none; b=dBaSLWkyKYJ/VguvpK9jlXN4UkGkdOTVPw7ldakKVStP+X+VJ+TvstuqFEW5cvFW1jR8icQdbgk2EfgmYeISVbgkqeqwXu/chAxRPjYCiLar7cxK/V/N3bEFbuynyicuPkWz/1OJAH69j9nlVImihkw+NXhtbgTJIqx1ubAbbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763927314; c=relaxed/simple;
	bh=z90dP/gmrGc3E3iGgr4xN3P1DyqNNmslhpLsQcT2q7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWyCD7FrKnPNIqaZJEOfCtFNMPU8Z9PepAgLJ97QUFn9k6frC4jlN6VVhajP4QzFr+Gm+nr7SgcLBGxi87MpBDmM38uVll+iPE1NaV3ser5Zy6q9f793qVJvwczMEO2/g/fYBsVOcVSbzPM0gJ1+YopKiwhSB3OY6yymJGt/tuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRi4K1M9; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRi4K1M9"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b75c7cb722aso529519166b.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763927309; x=1764532109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tw1PE/7RiX5xgeVNMbWvJDSPG8tWD79BqHxtcrrWivA=;
        b=nRi4K1M9zlUotNKzAINsKbOf7KT4EuBMb1R6jtQ0BKsKr5JjqMTDvsDhdbit3HT1Eo
         uHhvfsYlqeX4ApR5UUMcUlAzwfwygtGxkjDygtwNIZmcqQhIaKG9Ktl3tEWxqNIs0hat
         /8xLoZeaw8aYbZbEy/0wczH4MwsHrRA4akM0uq20eLTUtta6sw+ncGBAItU7ks8PDt0D
         3OC15TT/THczhV7r0etSpu7iQrGg14bOijs2yMI2BiKF/5F4iIXFlzU35yLIa6cRU96o
         bPCTAU0Dhla78dRSlizlw/CSeuxjcBF1wN1APwt88BmaKUPMeP1w4TQQLUSfZZGsRF24
         vufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763927309; x=1764532109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw1PE/7RiX5xgeVNMbWvJDSPG8tWD79BqHxtcrrWivA=;
        b=WzuZ0DDKTkdIE+mZnoI29Qq4tMYMhQK5toq3QwcUCnn3FjV/UMcFE14z7LGAOaIoyN
         qs3B4ptLpJdXm56PS7GAxxfkVjzXWPvSS4iA5drWsF7T0qV0zR8kFZDQwTR3q2sDED3y
         hduS/Sfr3YVcKMDNnR+9DmtkTsnEYgqlRDPoeLZ/Lb4fEWtUDc7Cgj4pmTz0e0/x/vSr
         BivCqykljuixocjIA5gr9ocB3ZIRyL2XSdAxFNSbMh8WKc3BUo1BFeiPBqiojnkYOJZk
         ffjPbJSw15WaNtfEI38ORptWNE+64iiknwThmpdlsY0SbIG/49vAYSnU1wpjkcgUGtlm
         M7tw==
X-Forwarded-Encrypted: i=1; AJvYcCV2HSvsRKw2OW+A3NQhAZ7vy33cMzq6//u4t+YJZG9yGlPhjhQA4QZ2KgxxnhY+QJ7c8hVAYNVP1X4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdxQnm5ZcX3+PgHVeh420AhNUa2MT3yskbb8MfO/+cyfs2yJ9H
	ndo1rnHhUNMAOFPzF5lCAJRShn+I9RkJk7Ag63UDOCgmIkqktPHbZyHVUgM6qVSKi40=
X-Gm-Gg: ASbGncurz0By/MgTodj6180C661K5voHMznzEh/4aiFQ2hrtw/+V8Psr8b+cpocatLq
	DJF0EmxPvTRMfuqGkXnpAC/dbL/sAq3C4mMUB9sJqjIZJQfnag80Ofw0DF/q+Z6Y0p4y/FdhTu7
	3Lwpob3WqJ3q7J+N9NWxzr1DA2V97RiIGp9yxkU6icRlYWWYlcnBr1rHIdxOvOTZ2tYVkhcUpbC
	Vdm1SQCv7TbF+vlnOOOA2oHWftqWS1zzvL1+rAq0ylVYgpj/IbTLPLQdP30KwVU7hlzcCfFgaN7
	If7xS6BaOUcPhglYc7vWnMTkcHgAdHJkjiRVdpTf+pGeHqwttHPgyEoWi7Td/wmY+EFu2cM1DBG
	PwIS+H+w9sTZhLnHqSH4IAE6y03X1IT60Eom8AycOObfFPeQsrwAj3pqkAzHrPNQc7zxEwaBR7k
	Gegboqtjr/i/DR35FsKEsd5xvtA3CNqFp1ch+o0IlKFVwNEMjCcEE3are+yS3F4/hkNfQ=
X-Google-Smtp-Source: AGHT+IF4rSE58srn42tnY8ETc6zwxuPhwk117QeC9E0pzNnhNh6IzfVuWm+BbG43e5xDM79sc2H10Q==
X-Received: by 2002:a17:907:c1a:b0:b73:544d:ba2e with SMTP id a640c23a62f3a-b76715e604bmr1050588666b.25.1763927309268;
        Sun, 23 Nov 2025 11:48:29 -0800 (PST)
Received: from HYB-DlYm71t3hSl.ad.analog.com ([2001:a61:123e:4501:38ae:e5e8:159a:3b69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b765c1379ddsm997748466b.0.2025.11.23.11.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:48:29 -0800 (PST)
Date: Sun, 23 Nov 2025 20:48:27 +0100
From: Jorge Marques <gastmaier@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Jorge Marques <jorge.marques@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/7] iio: adc: ad4062: Add IIO Trigger support
Message-ID: <egfjokiqoo6dxh6m3dhjtj2jtpbnw6p7pxxllth2unycl5fdf4@lirpbye74rtg>
References: <20251013-staging-ad4062-v1-0-0f8ce7fef50c@analog.com>
 <20251013-staging-ad4062-v1-5-0f8ce7fef50c@analog.com>
 <20251018171425.7515d39f@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018171425.7515d39f@jic23-huawei>

On Sat, Oct 18, 2025 at 05:14:25PM +0100, Jonathan Cameron wrote:
> On Mon, 13 Oct 2025 09:28:03 +0200
> Jorge Marques <jorge.marques@analog.com> wrote:
> 
Hi Jonathan,

> > Adds support for IIO Trigger. Optionally, gp1 is assigned as Data Ready
> > signal, if not present, fallback to an I3C IBI with the same role.
> > The software trigger is allocated by the device, but must be attached by
> > the user before enabling the buffer. The purpose is to not impede
> > removing the driver due to the increased reference count when
> > iio_trigger_set_immutable or iio_trigger_get is used.
> > 
> > Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> 
> A few things inline.
> Thanks,
> 
> > diff --git a/drivers/iio/adc/ad4062.c b/drivers/iio/adc/ad4062.c
> > index e55a69c62694a71a4e29f29b9a2bfeec3b16c990..40b7c10b8ce7145b010bb11e8e4698baacb6b3d3 100644
> > --- a/drivers/iio/adc/ad4062.c
> > +++ b/drivers/iio/adc/ad4062.c
> 
> > +static irqreturn_t ad4062_poll_handler(int irq, void *p)
> > +{
> > +	struct iio_poll_func *pf = p;
> > +	struct iio_dev *indio_dev = pf->indio_dev;
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +	u8 addr = AD4062_REG_CONV_TRIGGER;
> > +	int ret;
> > +
> > +	/* Read current and trigger next conversion */
> > +	struct i3c_priv_xfer t[2] = {
> > +		{
> > +			.data.in = &st->raw,
> 
> If it is safe to use addr on the stack, do we need to have
> a dma safe buffer for raw?  I'm not sure for i3c!
> 
All buffer should be dma aligned, I will use the heap.
I will use a separate buffer that is written once (CONV_READ or
CONV_TRIGGER, depending if gp1 is routed or using the IBI fallback).
> > +			.len = 4,
> > +			.rnw = true,
> > +		},
> > +		{
> > +			.data.out = &addr,
> > +			.len = 1,
> > +			.rnw = false,
> > +		}
> > +	};
> > +
> > +	/* Separated transfers to not infeer repeated-start */
> > +	ret = i3c_device_do_priv_xfers(st->i3cdev, &t[0], 1);
> > +	if (ret)
> > +		goto out;
> > +	ret = i3c_device_do_priv_xfers(st->i3cdev, &t[1], 1);
> 
> Add a comment on this. I assume it's setting things up for the next
> scan?
> 
yes, the next scan is triggered after the reading of the current scan.
There are 2 registers that can be used for scans, CONV_READ and
CONV_TRIGGER:
* CONV_READ: Stop bit of the previous read (without write address),
  triggers the next scan. Allows roughly twice the sample rate, since
  does not requires writing the address every transfer.
* CONV_TRIGGER: The conversion is triggered by writing the address, so
  every new conversion requires writing the address again. Only this
  registers will issue an IBI data ready.

That means, if GPIO is not routed as the IRQ, in the fallback using IBI,
CONV_TRIGGER needs to be used. v2 will also use schedule_work to avoid
the IRQF_ONESHOT being triggered (next conversion data ready), before
the current irq_handler returns.
> > +	if (ret)
> > +		goto out;
> > +
> > +	iio_push_to_buffers_with_timestamp(indio_dev, &st->raw,
> > +					   pf->timestamp);
> > +
> > +out:
> > +	iio_trigger_notify_done(indio_dev->trig);
> > +
> > +	return IRQ_HANDLED;
> >  }
> 
> > +
> > +static int ad4062_triggered_buffer_predisable(struct iio_dev *indio_dev)
> > +{
> > +	struct ad4062_state *st = iio_priv(indio_dev);
> > +
> > +	pm_runtime_mark_last_busy(&st->i3cdev->dev);
> 
> Take a look at the changes across the tree recently.
> Now pm_runtime_put_autosuspend() calls pm_runtime_mark_last_busy()
> internally to avoid the need for this pair.
> 
Ack.
> > +	pm_runtime_put_autosuspend(&st->i3cdev->dev);
> > +	return 0;
> > +}
> 
> 
Best regards,
Jorge
