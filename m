Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3BC282F3D
	for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 08:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777190555; cv=none; b=uWRodEgmGSdKeYsLrHxxzssVCgZ83AeIraaHQc/nJ9QcARX6YoMv1zIL0CWB+hrjsmPa/vg+uxcPmOQrGR6MMvj/KtzO8PqG5kw+/QViF15omNNxNFdvFUx2yol0QsOKoHOmSowrnn/5Cnl8sKI0RuLmjfaF1PKkPfyfFcSsgQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777190555; c=relaxed/simple;
	bh=XsaRMfhCO0nZB4jMrQV6CzGmjKsoR/dI8GgJRwqoZ/k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0pcQmZ2JEogVe0s8aNZDzdSMTKaWvfr9R89adIWv0pBk2ll58nVgaJKaJdPaoegWEGOeNKxiuJYhGqcRE4hxp/Oh5nE/FCKjWFX3AgnaaGiiXj45qOZ7OyOB2F8VjW7/QSGPk3qEdxWZhu5B4jgteBWNGyV4rsitWxkzGMVjpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO0dCqvh; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO0dCqvh"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so84638895e9.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Apr 2026 01:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777190553; x=1777795353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3fGYomxVnuRzyBPEOqDgFLPn+GSFKuRtiOgJCbOKeHI=;
        b=hO0dCqvhnA+Fv3dLndByFr/KMWYZ9yqxLad0h97HIxAewYku10HU5VxrPdAQAMlbjz
         MZY/YmEYbb0XlJFE4zNNn6hgPJ13v55c8iEgzcX0pQEpdN3n3NBU9OJ47ZEIkGaMOB/O
         0Qzbp4NS2KMO5W/HyDIpbm6maShSaYzGT1qvM0EIINLJ7j+z5kfF8O9Jg4GUdW3opN29
         PgfMtbrSEBsjF5QqLWO0HFD4hblMvf4GhuM4f5oGPcjw20MjajmQQTd1ZTbhnEVSNBMZ
         01OtezbCJzV1R3cVeYiCy4aQpTBukto7tg2wkJ92PstQn4tYJ9L36YfgpoM4vfBOCpAR
         kJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777190553; x=1777795353;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3fGYomxVnuRzyBPEOqDgFLPn+GSFKuRtiOgJCbOKeHI=;
        b=bQoxflUuq/13Cyj0s/M76cinqOgUjxhLku2aUpRGmYnIiTr1syn1y4HE2187OCSXiz
         JI4WS/OqlncLwfhIYU7oSpi4reglVMW8FnLkM1B5nRp4u43gytY+H6YsAOpXrtJmKAZq
         8TWC5QgCHViWqxULaA3ulXKrkpZHXSz8cZoY6c6u9CY+A/RmXjS2pOuOBMDdRInkOviv
         91I8pq/bCjiFOCglJLVXF10SD9TQtFlo+jzOC9JDROTCpGsbjUNiS0ipJTo+zbvDPWW1
         8Ivcz5vdXoIEvGNmyoLPUQoQZsNvit4c4oonxDeljzRBVJr307aB1Fn5E4oTslgBE3yt
         Nftw==
X-Forwarded-Encrypted: i=1; AFNElJ+QMN9fLFk6EIhoBLeKERvCTSuzIVnFP1dIwzfdYI+QYHVnA9bdq8w8Qet+XQ7ZqctbtviiQ+UAq+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MgYg9VjurzZN6wOwr+e77IWJCWhRRZTRR7iB3aG6uswQ/1LE
	WHsDZYFiHCt7w0nUimh52P/ZOMZFaKqDY06JhyPNDCpg9jSt2SdvXT0r
X-Gm-Gg: AeBDiet29di5JDhgsLLeOCB7B4dzpbZPLAeedPUCRep1kVgtO2B9GAOs3qMyRNSCEtV
	yXBqyBfSSuk1vbYmB0K8Cj6FqboAVOl1f9qf83nY6mqbOo4U470jY7VDluKd4RTalno8JjKV9ga
	19+bAR2EUnc4lFGL3Bl84yIthj+rnvaVNJiZNInlOdARQ6j+KAAA030k+foHx2qzgK2x4MIijr1
	1JLcVHbYP8x1peRmbgvC3wn7vVm8178WaTxKSdT3GAN8Gaa/UrA5eIP9KNzRJ/afUBEfAV9AdbT
	HtnFgZ8v8aiOgBA25H284b47GSapZTVSiSR/gJmr9nkeWpAuXTDXC38Kw4aJf0DNO4v8MzpjI0j
	5ZL5dqP6yYA9nBq9ijFi0uN/ZCjQmF/yU1J8VNmFVORBTzkhEvWah1W8aoIuYjZgphb0UrCgM/q
	gyMQ6XP9L30hGwyemZTMPjro73vjFUo2tpjVfH88U1ZYeHyFr9/A2iUKnULN1JXHwM4f+wh+/vp
	4/oTako7SsUk7RG1e8cYMfv9T5b0z9M9LCop7R1DdtUyY7fxQktID/5ynoq
X-Received: by 2002:a05:600c:c085:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488fb784843mr432614835e9.24.1777190552498;
        Sun, 26 Apr 2026 01:02:32 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a5549f582sm127037955e9.33.2026.04.26.01.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 01:02:31 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 26 Apr 2026 09:02:26 +0100
To: David Laight <david.laight.linux@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Rodrigo Alencar <rodrigo.alencar@analog.com>, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <o5m4mp6qrt6pzhns4q5vyxc3fwlat7675a46wpr2phjbveosw3@rwmdqelfnkix>
References: <20260415-adf41513-iio-driver-v10-0-df61046d5457@analog.com>
 <20260415-adf41513-iio-driver-v10-2-df61046d5457@analog.com>
 <mhfgedq2t5lqtu6535ahdmpbvib2xzp2hmyt7ezflnf52r56jh@ze6tee7vpij3>
 <20260425164006.17b75faf@jic23-huawei>
 <20260425233316.0a2e2abd@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425233316.0a2e2abd@pumpkin>

On 26/04/25 11:33PM, David Laight wrote:
> On Sat, 25 Apr 2026 16:40:06 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Fri, 17 Apr 2026 09:36:20 +0100
> > Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> > 
> > > On 26/04/15 10:51AM, Rodrigo Alencar wrote:  
> > > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > > precision). After the decimal point, digits beyond the specified scale
> > > > are ignored.    

...

> > > I have an alternative (slightly more complex) implementation of this function
> > > that handles E notation. I find this particularly handy when writting big
> > > values like 25 GHz when the ABI is defined in Hz, so instead of writing
> > > 25000000000, one can just use 25e9, or 2.5e10. I found that my python code
> > > was printing big floating point values or really small ones using E notation
> > > and that was giving me -EINVAL, so I had to adjust formatting when generating
> > > the string input to the file. No big deal, and we would not need this here,
> > > but if maintainers find this useful I could add it into a v11 of this series.
> > >   
> > 
> > I'd rather we didn't slow this one down. However I'm waiting on some tags
> > on this patch from folk who are more familiar with these parsers than
> > I am.  Given discussion, Andy or David Laight perhaps?
> > +CC David - please make sure to include folk who have been active
> > in discussion of earlier versions to decrease chance they miss the new
> > one.

From Andy's message "We still have several weeks time", I thought we would have
time to discuss this e-notation thing, but that's just a nice-to-have indeed.
It fits well in the decimal context, as it is widely used and works in powers of 10!

> 
> I can't help feeling this code would be smaller if it didn't try to use
> the existing conversion functions.
> Something like:
> 	u64 r = 0;
> 	unsigned int n = ~0;
> 	while (*s == ' ' || *s == '\n')
> 		s++;
> 	for (;;) {
> 		unsigned int dig = *s++ - '0';
> 		if (dig <= 9) {
> 			if (!n)
> 				continue;
> 			n--;
> 			r = r * 10 + dig;
> 			continue;
> 		}
> 		switch (s[-1]) {
> 		case '.':
> 			if (n <= scale)
> 				return -EINVAL;
> 			n = scale;
> 			continue;
> 		case '\n':
> 			if (*s)
> 				return -EINVAL;
> 			break;
> 		case 0:
> 			break;
> 		default:
> 			return -EIVAL;
> 		}
> 		break;
> 	}
> 	if (n > scale)
> 		n = scale;
> 	while (n--)
> 		r *= 10;
> 	*res = r;
> 	return 0;
> }
> 
> That is missing the overflow detect for the multiply and add.
> While check_add_overflow() hopefully looks at the carry flag (on non-mips
> style cpu), I don't know how the 'mul' variant works - it might be horrid.
> A bound check against ~0ull/10 might generate better code.

It may be a compact parsing but aside from bugs or typos, there is a readability
tradeoff. For the context, yes, it would be better to accumulate interger and
fractional parts to the same variable, rather than separate ones.
_parse_integer_limit() would have to allow for a custom init value, so we could
just skip the decimal point and resume. The proposed implementation reuses tested
infrastructure and follows kstrto* conventions. I suppose the most important thing
to review here is the new interface with its function prototypes.

> But I really prefer functions that return the terminating character to
> the caller - they are more useful for parsing compound parameters.

I agree, I tried something like this with the kstrntoull() approach.

> > Maybe start a discussion about whether adding e notation as a separate
> > thread after this has merged?

Agreed.

-- 
Kind regards,

Rodrigo Alencar
