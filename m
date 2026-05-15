Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378F638B7C4
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 19:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778872908; cv=none; b=unRElnZT41YwmF3M3p+5Q6VDklWdLxL9gFh0L4xiX3ifit3phpcXwf/K6j75nHR3JzedFYOuOCit42K2hcIJ1ps/zsQi2F3LTZo9L1IJnOlK9fibQ5lB3EanvUuUCYugD+P6A0XiDgvUu61beam1ri7hLQBGBsQ9+zAzpuJWsWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778872908; c=relaxed/simple;
	bh=PC+eYExL43HQD6QN2u2W/QZPE1OoN9bOyL9f4JUb+X4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OpC3wPAkriKc2KhpgDsOmWiYWTFtr8inCNmPxzDEKiGPdIdLeJ1IgYXkMyEC/+46LIuO+/DUc4BEQwlptSbYWZ5TThe8OBa9m2SRvRNYir9gu2oTEaDUQcU1BH/CWwy1HcF8E2H56k3PZdwZ+8T2lyNQhhPpRnFofinkLyeX02g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbQcTri7; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbQcTri7"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44b052142e1so62786f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 12:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778872905; x=1779477705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tCrd21DK6hlmbOR3hhmA8HZohwWInKchx0V1//iPLP4=;
        b=MbQcTri7TzuCO2iz4Iq1tdVusJxTeWv7inUDRNp2Hy0CMn2klZkrtZtc/y6a9lXlrg
         s+4U5ovCC7868guFHT7nm0XyWZGfsR+/uc9iTO8OynZeBEIybrjZEK8iktoslyNrfyy1
         4rutqWFCdD+LYOT+PR+sN5xxT83Vlx6iItHDWHbgirrelGTcOB7iDEVjyBf8nm/X9Amz
         A0lHo9uk41X/1WPla/oH9s3zt37DEtIQCd+zZQkiC8yuPXr6q706cnvGconREEX1w773
         LqnAmxoI1rPNb+UanJJObZJ9/L5FhFyjU/R4Y1SPQdJKbUe6DQmhXByT15kWSVcgBx9B
         uPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778872905; x=1779477705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tCrd21DK6hlmbOR3hhmA8HZohwWInKchx0V1//iPLP4=;
        b=UvQLKEcehD/0pJGNLTXI6b1tnWpY046NWvEAqHwja5EH27rFR1t9z2AOEgL8MjRNvQ
         BG3umb2tFir50z8mS2sSFtZFe31PJOa3tdiEsxKmbquditYk8Yck9WnFnIrZTtJPH7S0
         vQcV4UYpAFV/rO+dT6d9La7pCafE3WcUi8lL5JyUmlvgZjemCKahPwwTXgwlPsWlD2I7
         52zLdEnIr2BGAs8rQPeDpsPLVm7+UV3/Ps3B15wLTTguEowmlOwK3s6QiZFamVrPx8OD
         joz2P31GAvHecyuMNBCTBnlp380qX0emD/obUowQRWnujrNB/UFnU8QoR45jZNb92E8y
         VU/g==
X-Forwarded-Encrypted: i=1; AFNElJ+/yZ98vHkI2gxFFtMnf6jlGLsSeEJEnD7wbw9agQMyQOXtiKlWm6plFd8r4Wl42phyXye6ArUfJck=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS7bSWOt5hFvJ1gQVRg0gannkNYRQnBzM4gqj9WwLQDpemeoN7
	TwCLwIq9efktTScEjPWJ/NvmcMiZm8U4XEELYt7Qgiw8GeegcIq9VxgM
X-Gm-Gg: Acq92OFdMWVJPsC/5pv3ieDHCqvpNpVdDpvxR4XTPevqYWUNuaGbB7oauo7eh0peiPj
	KzbXMu0hCHpqL1fanAM2lqYkION8CmTFJ3lthuqWL6gMGiHEiklJbavMYFijjHrsCAYJ2upvzCu
	rBXBa4jC9vPXpBDAyVR1nhqsIqe4yVgk0VR9Ns1sjViDI8zXIt2AYMeMqqSX1NOXH1PgAhW/a6z
	sAG5G7bH4Xh7iQ8zj6egTGfLLsATOVoBXK98QvmdemX7jF1vk04GhcksSm+uL2K3Ga5BMD9jAR9
	W4+JvnL7/EPpmRogLKKscMWII1qOT/LnPqn5FMUdV2RAgLu6Lqu8HG7w0aA7QBEZ8qZbvLpp/4X
	63ebv3TTT2mGBuG8jA7q2iiszQ9uzAVgmGBE7r7QPKGAVJY1xIMmcJoHXSYoZzuAFefL2n0ZizN
	j1/BDVIBPESYSaDk9wjGK+ZmwAI+jsia3FPULxAmkM6Y6z6VEcI8wDcE6Pl5Hj
X-Received: by 2002:a5d:5c84:0:b0:44a:fe14:3738 with SMTP id ffacd0b85a97d-45e5c5be136mr6962053f8f.10.1778872905360;
        Fri, 15 May 2026 12:21:45 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm15064400f8f.36.2026.05.15.12.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 12:21:45 -0700 (PDT)
Date: Fri, 15 May 2026 20:21:42 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <20260515202142.5dc561e0@pumpkin>
In-Reply-To: <ex6p5qpgsfvm5wzalpwo7whcj4m4uxzscpzxvb5ihfu2prx3fj@7skhmz3cbshw>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
	<20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
	<kwjoyikbygik4futknqpua2tlzokradms25n2dmfa5czyj2uts@4rdfl6zlul2q>
	<ex6p5qpgsfvm5wzalpwo7whcj4m4uxzscpzxvb5ihfu2prx3fj@7skhmz3cbshw>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 May 2026 17:05:06 +0100
Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:

> On 26/05/13 10:41AM, Rodrigo Alencar wrote:
> > On 26/05/10 01:42PM, Rodrigo Alencar via B4 Relay wrote:  
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > precision). After the decimal point, digits beyond the specified scale
> > > are ignored.  
> > 
> > Hi Andy,
> > 
> > I am starting over here, the other conversation is getting hard to follow.
> > This is my new proposal...  
> 
> +cc David

I just wouldn't do it this way :-)

You end up with more code than you would get if you just converted the digits.

-- David

>  
> > ...
> >   
> > > +static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> > > +{
> > > +	u64 _res = 0, _frac = 0;
> > > +	unsigned int rv;
> > > +
> > > +	if (scale > 19) /* log10(2^64) = 19.26 */
> > > +		return -EINVAL;
> > > +
> > > +	if (*s != '.') {
> > > +		rv = _parse_integer(s, 10, &_res);
> > > +		if (rv & KSTRTOX_OVERFLOW)
> > > +			return -ERANGE;
> > > +		if (rv == 0)
> > > +			return -EINVAL;
> > > +		s += rv;
> > > +	}
> > > +
> > > +	if (*s == '.' && scale) {
> > > +		s++; /* skip decimal point */
> > > +		rv = _parse_integer_limit(s, 10, &_frac, scale);
> > > +		if (rv & KSTRTOX_OVERFLOW)
> > > +			return -ERANGE;
> > > +		if (rv == 0)
> > > +			return -EINVAL;
> > > +		s += rv;
> > > +		if (rv < scale)
> > > +			_frac *= int_pow(10, scale - rv);
> > > +		while (isdigit(*s)) /* truncate */
> > > +			s++;
> > > +	}
> > > +
> > > +	if (*s == '\n')
> > > +		s++;
> > > +	if (*s)
> > > +		return -EINVAL;
> > > +
> > > +	if (check_mul_overflow(_res, int_pow(10, scale), &_res) ||
> > > +	    check_add_overflow(_res, _frac, &_res))
> > > +		return -ERANGE;
> > > +
> > > +	*res = _res;
> > > +	return 0;
> > > +}  
> > 
> > This function now becomes:
> > 
> > 	static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> > 	{
> > 		u64 _res = 0;
> > 		unsigned int rv_int, rv_frac;
> > 
> > 		rv_int = _parse_integer(s, 10, &_res);
> > 		if (rv_int & KSTRTOX_OVERFLOW)
> > 			return -ERANGE;
> > 		s += rv_int;
> > 
> > 		if (*s == '.')
> > 			s++; /* skip decimal point */
> > 
> > 		rv_frac = _parse_integer_limit_init(s, 10, _res, &_res, scale);
> > 		if (rv_frac & KSTRTOX_OVERFLOW)
> > 			return -ERANGE;
> > 		s += rv_frac;
> > 
> > 		if (!rv_int && !rv_frac && !isdigit(*s))
> > 			return -EINVAL; /* no digits at all */
> > 
> > 		while (isdigit(*s)) /* truncate digits */
> > 			s++;
> > 
> > 		if (*s == '\n')
> > 			s++;
> > 		if (*s)
> > 			return -EINVAL;
> > 
> > 		if (_res && (scale > (19 + rv_frac) || /* log10(2^64) = 19.26 */
> > 		    check_mul_overflow(_res, int_pow(10, scale - rv_frac), &_res)))
> > 			return -ERANGE;
> > 
> > 		*res = _res;
> > 		return 0;
> > 	}
> > 
> > The new thing here is _parse_integer_limit_init(), which is a local modified
> > helper that accepts an init value, so _parse_integer_limit() becomes:
> > 
> > 	unsigned int _parse_integer_limit(const char *s, unsigned int base,
> > 					  unsigned long long *p, size_t max_chars)
> > 	{
> > 		return _parse_integer_limit_init(s, base, 0, p, max_chars);
> > 	}
> > 
> > with init = 0:
> > 
> > 	static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> > 						      unsigned long long init,
> > 						      unsigned long long *p,
> > 						      size_t max_chars)
> > 	{
> > 		unsigned long long res;
> > 		unsigned int rv;
> > 
> > 		res = init;
> > 		/* ...
> > 		 * the rest is the same implementation as _parse_integer_limit()
> > 		 * ...
> > 		 */
> > 		return rv;
> > 	}
> > 
> > That allows to accumulate the final value into the same variable, which makes
> > things simpler and decreases the amount of overflow checks.
> > 
> > The scale can now be a bigger value, like 0.00000000000000000000000000000000423
> > can be parsed with scale = 35, resulting into 423.
> > 
> > The truncation loop is still there... I think this implementation is better,
> > and I am not sure what is the input limit that you would consider ok to allow
> > non-zero digits to be truncated once the scale can now be something bigger than 19.
> > As long as the output fits into a u64 variable, the parser still works.  
> 
> The truncation loop is at least stricting the input on digits!
> Any comments on that?
> 
> > 
> > I am also adding new test cases for that!  
> 
> I have a v13 ready with this. I'll give it a go soon...
> 

