Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1934379981
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563125; cv=none; b=cO8V/pMDhR/RUrNZnyVCvqT/znRJmg7j4OCyPR8vJjclbeRwWkUr9hE1+vcbDofoxvPeKCY5tSAWawjT2NOXnmSJy9uLxp3uVpTM+WurY11JKRWUJOrubYKwLB6/wUPnINNp9tklU+FrFlDRgkXHiZuCD5vutgOTq3nYyLCcLME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563125; c=relaxed/simple;
	bh=RcBKDPOtj7S5hNjct9LipohyYjjr620KRbP1CONDhD8=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHkYVfpqDdQrDgfRjk/EzXBpsHhvhtBONZpeIXzqsX7GRFoG47MnUCPSsucprxj4iE4N387/+0SVERivIFWksC50jl7SBxbtSZgTjPx7swufmw8wk0WaEnY/BK+f+DXXXanDpcfBMBNiiIkLN6Roy+lvDJcK8Fx5nG5VmUY4FeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8+vtq1N; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8+vtq1N"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-88888d80590so27662596d6.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 03:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563122; x=1769167922; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yEOmuVT1QFTVBveM/K8hKMfzTNfuh+uIuEbcu4VdEn4=;
        b=K8+vtq1NvV79E0BFJY2MpKitsDtMDrlHB2HWBmeDuVu55OBDGiaYEa97zPSyw/uKy1
         rtryvWhgbEBEbblcSfxRvgscOISG42TuR+Z2D7OIIJ/+1xNKQoTI9blSu2jDvjI/B1DA
         bLDTJtlNogUfH8CsHrX7ddWpZ9cXldMMCNdOp4nICoRPTl88in6l485c5nKUdUJJinJ2
         Y2MQw4UcwYAyu5/EhhJiODPWBSkbsCgDZoXgM2Rb5ku+hlk5D/kkdX2t+y879wCZog/y
         pnyXdkW2sKUlBX1v/nVCgPRTSjt3QyoK5ldB6NNAVKX+iIRLia9Oe9SRzoWwLs6enL3Q
         foog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563122; x=1769167922;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yEOmuVT1QFTVBveM/K8hKMfzTNfuh+uIuEbcu4VdEn4=;
        b=Hc9Y2Km0EggFiKx+SBZ+rMLKJkY867pR4K0UsCyOhyoUySOmFDbxVcD7NzF16vhK4P
         X79sPTKxKamQrtI/VHH8n5ZsDbOTOu4CFp4NUBg/seyj18sLCM1frYyAaF9vkC0jg6ZI
         J6qI98PVB0ZQ4j/YMqG3FeeLKy7cAYSCXL0lipKoRFSMQ6XEdKCu9hK3PdkZN2h2K1yv
         HCtefHL1zHZDlMkBJdhw4hbpb1Fnp88uPSd4pmWKxyyXojyHqHgoH3uAEV/DjTQJzGvQ
         vo+xP9ClDZP3fWiTTU/+vqAw4Eru3LmKV9iEEUt/JZaNMh6EO4yK6wpsgaoxWT9O/LLF
         k4/g==
X-Forwarded-Encrypted: i=1; AJvYcCXyEk03UT3sToWQGPbSTpYx8HzmaadHwaIwgmFRoo2LmkOf/oBVns4elsNWcs2zgmkMA2QNDPVBpfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQNeEHe60GITpOjjb9lQG7qRMLz3pxD19Vy3EAUmTnoKJLYsrI
	MXkqF6Ud7iX8+ZvJc+MwTTflbvO8/lMPzp9lKpTEVQjtPEzgAlj0Pz1E
X-Gm-Gg: AY/fxX5qt8A2JlZ0bMTgFDid2RfpTtWqnS1nvWML53iww+x6okm2133CLLlMonlZMqI
	k62VVOrF4prmqZlGakkBq/dWeoiROlQb+z/OFCjTznd0b9nXU1lLYrRTbq2LKHQPREOU9P/AUoz
	lbBiQvpE0ATzijB0rqJUeXR65Iwn7ogO1qPT10hi1xTChK+buc59D0a9iKaaXCr1rU1c44RIQgP
	uKhlnIUhDfzljJOm5aX2hAc1Dr+MEDEud43RI633KjDgJTN8s57/EhNo/HtJ9aYWIcksvhWeal7
	1+SbKrDQamkT/VMFFVII4gUO4Kjs68wNaJvC/CSpG5eVov3lxWDyuX2JAYKKZZch4iF0RiNHe2h
	GF7GeN9KuMvDMcl36fLa/Reeqf/aFARu/e/QjiO314dCoeqhRsk+3DGcEhqp0GKRbKiuxwHPZwd
	ITGK7vQw7KVXIz/DM2k1uHhUMsr+oyY9gAsc2Jb4Mou33FeqO8YEdofm6u244SIBw9XrXR8yr+Y
	cjH
X-Received: by 2002:a05:6214:dcc:b0:88a:589b:5dac with SMTP id 6a1803df08f44-8942e421060mr35417396d6.6.1768563121515;
        Fri, 16 Jan 2026 03:32:01 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e5e4a2dsm21136756d6.11.2026.01.16.03.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:32:00 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 16 Jan 2026 11:31:51 +0000
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 2/6] iio: frequency: adf41513: driver implementation
Message-ID: <zgz6g7pvzijrt77lwdi6q23lgkscm33imcdfbnu7mxvzarygst@ve3wi5l6dv3d>
References: <20260108-adf41513-iio-driver-v3-0-23d1371aef48@analog.com>
 <20260108-adf41513-iio-driver-v3-2-23d1371aef48@analog.com>
 <aWFPEa9HI4wmYLpn@smile.fi.intel.com>
 <6hcqrcy3meskddrklb3jtlpca2snrs4upwms56lhq7mkes7krm@vdiaqkfc6lgg>
 <aWTTs1n_N0dVjpbV@smile.fi.intel.com>
 <lwqhf3pm5xewtx4hhq7ei2yil4skmtkstqfifif74u4e5jmtzh@wedhpibvjepw>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <lwqhf3pm5xewtx4hhq7ei2yil4skmtkstqfifif74u4e5jmtzh@wedhpibvjepw>

On 26/01/13 09:32AM, Rodrigo Alencar wrote:
> On 26/01/12 12:57PM, Andy Shevchenko wrote:
> > On Mon, Jan 12, 2026 at 09:56:25AM +0000, Rodrigo Alencar wrote:
> > > On 26/01/09 08:55PM, Andy Shevchenko wrote:
> > > > On Thu, Jan 08, 2026 at 12:14:51PM +0000, Rodrigo Alencar via B4 Relay wrote:
> >

...

> > > > > +#define ADF41513_MAX_PHASE_MICRORAD		6283185UL
> > > > 
> > > > Basically I'm replying to this just for this line. 180° is PI radians, which is
> > > > something like 31415926... Can we use here (2 * 314...) where PI is provided in
> > > > one of the used form? This will help to grep and replace in case we will have a
> > > > common PI constant defined in the kernel (units.h).
> > 
> > Any comment on this?
> >
> 
> will adjust as suggested.
>

I am finishing putting the V4 together and I decided to leave as is.
doing (2 * 314...) might lose precision, by not much (maybe negligible)
but it does, as (2 * 3141592) != 6283185. 
And that it is part of the reasons why PI is already multiplied by a
power of 10. I suppose there would be multiple constants defined:
- pi in micro radians and nano radians
- 2*pi in micro radians and nano radians

kind regards,
 
Rodrigo Alencar
