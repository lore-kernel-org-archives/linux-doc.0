Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2263237BE6B
	for <linux-doc@vger.kernel.org>; Mon,  9 Feb 2026 15:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649670; cv=none; b=FOeRUUmikdgHRFoE46zjRN5VXIQ3B7cO99/gruj9Q1hTBelbps9Ttmpbi7WLis11SmzCZjI+WE7WNRKAMfhxi1ZPKyasdUUDkqBKStIc6uS0QoKqPG7RJmqxChQEk6AZjmW+9g9S3Vmq0VL1EabZGm03JL6Ti9L9BcjGAk7L1O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649670; c=relaxed/simple;
	bh=nKQd8+9i68Gtr8N+mWaKdJG1XrBMfVdStaWsoSmWIaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoNE1+5haVgpGkfH2rniQezlxXnKEahbODi0i1z7Ja8oczNtI/apdmVIzjblpgGDyAxU/DpDamx+9XvYJtL6DXYq5iYPSAkwWOOUETKg6hXHj2ueg0i/3VTnYGAtHfzMys7++BpaEjFSyyimsac29YMaQWt6LWGLhtx/CP8lfwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TsnS4VfO; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TsnS4VfO"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-794fe16d032so36018577b3.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Feb 2026 07:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770649669; x=1771254469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3umIUrvoVFMcqhsX0diux6puJqsZRUyyQBsPVdUoAFg=;
        b=TsnS4VfOjaHW/R5FuW4NeH/WVXsuXY5RAb+PWS/OfGS5pV2pWXJ/UhbB9ml8hyCGQY
         TNRd1YSVrN3/pSxznukBawS+UuJum4CoT6q1kgP3m0xW5qTX6qjWSgxR/ZXOlu6NAXYP
         WQ73IhzI3PwKozstsiSbMTBI9CTfV+0WkYiXPjKXvIA85tuIRUwo3eKEKhrECAziHgXy
         UffzRpFNcbaTneYTIFde3bucAAcaGmRGmmruaEEjNrjFnzShcyDILkQP2dehDanVyayG
         3T5IIbd14H8lBOMiHEYHcjq3VWl81iF949ZzsKe913a09Pr3hO5mJsaKL4BRXMBvsptn
         Ml8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649669; x=1771254469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3umIUrvoVFMcqhsX0diux6puJqsZRUyyQBsPVdUoAFg=;
        b=GT5SwH9NdxER6mREC+dhw1u7KI1Gx1UkxnGcS3WcVb5GxMCM37VgQcgUOdK3WviI5Q
         8Rw6ScLawLcL3hHKRbrCferRZl5M1M2FvMTPRPaJPT+tRbs+sVEquFV/jtMPx04GkCQ0
         7TVgusQAlIY8ukD04fcKK3y69pQrIaK1pI7SfFaDtD43Md1697ScY1Av5uCbvXcd9F4N
         GBq1FS8kqE14b0roaRomNqkH/ArRaYU2KPWVWjRTSJM/eEm7O4hUScoAjZYRwABiA1nv
         rxtgODiAuV2ybKHh0LRZvLerCP8ZyAShVklws93TUWdEOWCEhlNHAHVyWTyrf2SgU81h
         XtTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUObYktyf7csndNFAYwCTCT7s4DqmJrSBNfMGXX6wWDNzjkq9xJpIOeg3LTTY3zkMXSnp0NOPZuYi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDh+fWr5GwH5VRohUJDIB5mo4s9rGrcDarnwsl04ML33BV9lrZ
	Gq52inQF5JM5BL2Yy1uHaiG3K7ogY38aCyFi5izLNMsVe9idn/6aPlLM
X-Gm-Gg: AZuq6aJNm6XMbpq0yyffDEs3qcwrzoFlJisHrmMXTgbqHFk0TX1yVUxHXuZi/Cu9C1O
	Tfcz8K7skDF1vUzaJ3+0ip7uag5tqhkHDsMgNkPCb20uMIlKEzkCaLfNWZyO8nPis7ggHVhC7Gb
	J85872aQl6dOxT/xu7wwfvfDRRBsxXSr90TmBtBuge/E6CrgrRa5l+7Favq3fKj8Czxai+X5q6M
	ekgep7gRaB12xP7nVWPB/Qiv33ofVDr9vAR0yXrnk2ew3fLnhXPDyEWr0Eel5kJo8M/rJrXRRe4
	KqCX3Z7Ua8k9by0OWzoKnQgmKS4TVlZLFPU++OHXgOFd2W9MyA3wz8CQHTEdZ8bnMTz1bI3jzVu
	i3bgAfqTje2MuJoq/VPykELp0eJIkrFEry3H6fqvX2Bfz0LKBd6VkGX4F6lVWk7DP0J9eGtTfR/
	zAwN2Xfi1qInpAIPFlktY5
X-Received: by 2002:a05:690c:399:b0:78f:c2f3:141 with SMTP id 00721157ae682-7952ab20ff0mr124248997b3.35.1770649669011;
        Mon, 09 Feb 2026 07:07:49 -0800 (PST)
Received: from localhost ([2804:30c:163a:1300:9b68:dd2c:feb4:459b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7965705d5a1sm7741137b3.46.2026.02.09.07.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 07:07:48 -0800 (PST)
Date: Mon, 9 Feb 2026 12:08:15 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v8 8/8] iio: adc: ad4030: Support common-mode channels
 with SPI offloading
Message-ID: <aYn4Xxj9TIXvYn7z@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1770403407.git.marcelo.schmitt@analog.com>
 <1f05069e25e9ea28db2cef9fa3856456be3c2614.1770403407.git.marcelo.schmitt@analog.com>
 <aYiXjCpiMQ_h9Ao4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYiXjCpiMQ_h9Ao4@smile.fi.intel.com>

On 02/08, Andy Shevchenko wrote:
> On Fri, Feb 06, 2026 at 04:02:42PM -0300, Marcelo Schmitt wrote:
> > AD4030 and similar devices can read common-mode voltage together with
> > ADC sample data. When enabled, common-mode voltage data is provided in a
> > separate IIO channel since it measures something other than the primary
> > ADC input signal and requires separate scaling to convert to voltage
> > units. The initial SPI offload support patch for AD4030 only provided
> > differential channels. Now, extend the AD4030 driver to also provide
> > common-mode IIO channels when setup with SPI offloading capability.
> 
> ...
> 
> > -#define AD4030_CHAN_CMO(_idx, _ch)  {					\
> > +#define __AD4030_CHAN_CMO(_idx, _ch, _offload)  {			\
> >  	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW) |			\
> >  		BIT(IIO_CHAN_INFO_SCALE),				\
> >  	.type = IIO_VOLTAGE,						\
> 
> >  	.scan_index = (_idx),						\
> >  	.scan_type = {							\
> >  		.sign = 'u',						\
> > -		.storagebits = 8,					\
> > +		.storagebits = (_offload ? 32 : 8),			\
> >  		.realbits = 8,						\
> > -		.endianness = IIO_BE,					\
> > +		.endianness = (_offload ? IIO_CPU : IIO_BE),		\
> 
> Hmm... This is interesting. Does it mean it's designed like this for any
> offloaded SPI case? Wouldn't be better to follow the same endianess in both?

Yes, as far as I'm aware of, the only SPI controller supporting offloading is
SPI Engine. And SPI Engine offloading pushes data to DMA in CPU endianness.
It would be easier to deal with only one endianness (BE in this case since the
device pushes out data in BE). But BE is currently not an oppion for offloaded
transfers. Making it IIO_CPU for all cases/setups would make it unsuable in
some setups that don't have SPI offload (e.g. raspberry pi only supports 8
bits_per_word would push data in BE to IIO buffers). Ideally, we would check
what are the endiannesses the controller supports for offload tranfers but there
is no offload provider other than SPI Engine so driver have been having it like
that so far.

> 
> >  	},								\
> >  }
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
