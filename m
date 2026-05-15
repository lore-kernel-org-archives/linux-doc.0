Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870593EFFD8
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778861113; cv=none; b=RfHs6e9j5jTfhFSVtq0EkiK2vTBIk0p26Y5kXXrGG84nDvFvCjKjPNmylDbAXdRe/oZVHVbv/T4wT3a8PZAGq/DIDabajCOOFTwNR+LrW2lFGf/bj4ZCPYfkwoOHXJ3LG/6uJMfjBikj+jTV+IJtSLCrANdnSArhiLh1WWg3OKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778861113; c=relaxed/simple;
	bh=b5pd97Ki+/XAUp6J5p3HNpRMAnmllhdnuVwxI2OEYhs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h/8Ty5ILciheAxI4imlg7tSgkGgeEap0eT6t3UWxBYYxaOqwihYGVMFOKoH73TDajsgbOUQaZHOEyCYN8fB6iyzI2ip6VlaIe1vkMTTxiBEljx4gKhmNRSh9Q7Gf37Fcz+0E34NLyAVbG2GRqNf4YgKOyTbDDp3wTYA/6Aj8LQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp4DJTo9; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp4DJTo9"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48374014a77so81134325e9.3
        for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778861110; x=1779465910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QJEHw+NfjmamzJ6e+wpSFeRm2Y9ZjDhLNyEd/6LMzgY=;
        b=Hp4DJTo9/dal9rKDfqruemL6qWUHBIxzK+15BqFeM+cHOaTO7tTP4IUgkmaqys+1Xi
         aJCK4+0GNKj+cyXtrMq0lW5tGV2QfcQDPABZ5pFmSDZUD0Mw10f5HdB5/s0QkCFf4TfK
         qNNlhGG6hU3AeRW+5KrpkRbYDeW3nuhV5RFGI8F8Tb1ijyCDBgOMsqpjfcoGPxqkaguw
         Vocbee+LUBXPhkPd2g52aQr1HxytgMpikYSWUPKRBzTQKXn3/xNv7wrhiN9yREhq3qLY
         kqfRgzyOfjSnlhIXW7YAFV4Ly+qGrv81faAiMGugle5QPVWArhlzlr9YJV+AV5sIdCpl
         QuHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778861110; x=1779465910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJEHw+NfjmamzJ6e+wpSFeRm2Y9ZjDhLNyEd/6LMzgY=;
        b=CNr0bgUvmy493X+nwpvW61gH7ufDifMafQdcXHn1CJdgmNoPdYswu/oHFhRiKjVfHp
         uTa2RkBfBhCw7a2YJWXkntiFrRINVDMrZbWpzf6ggL7NCaeiClL7ZcuUiYIElYis5NOX
         L6rPUnVRdRvP1ZUhahFJaOKSv29SBenReWrOZ9xIrJZMz2pqhfljGmWnwxRV22JxF3Ku
         W7AHKL4+bRS0HiUId/g6ebRLMMVGFrL2Lx6NcpQcraI2wz5u+xZpDJ7thk/tFQu1QObL
         UkyODmJNP4gW9gMKLJIvLCQQ/EHHXm9S2lLfMaEKYNm5ghQLvv3wVUy+24uyxSKQI4tP
         124g==
X-Forwarded-Encrypted: i=1; AFNElJ8sIqDQa0esM/uSII1yBgyMPYhjSot3yv/5G75Qi78tnRvUfCKeh1OraRisLfKSILiaMInVnocDHac=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPKZQHRLlAk/gji5KBMvOSPmDVbjF2lRZz7E1RDE8NJoQxaLZ3
	a7mUc3RIgStePoWtg8qlBZK/cyL+VLUAqby6+mLLMcZit92hwcrqYZvU
X-Gm-Gg: Acq92OEbOKNmC53NOh7jxNlzbEz0QjqrCo0tuCfdXxsTpW3bpcwbZ8fDnISt51SCbTa
	4IS7GN1wBgKTGw1Xs7CU4JH4+0BmHV/NmKRDf/AR5U9+wcD2ZE8UUsPFazvyyM3o4LLNd3vr9wx
	x5+oxXPEQ6nZzlOiVRRYZlwrY426h27G/ZpsrEQbVOP3012vhFlTO9+Me0Mo4OFHbI5HaiUPS3X
	gQ0f9H7gva0HEHyAll/wM8NAKIlqBD1JO+gUH7AuVgzgq3m7gbQr0urXIF1dilRIICm/npD3Ovb
	o+IhH5VIBzoZ202WLMlSAK6RI+OK7nv9yEnxtyBh0aBUF/GhGt7rCrE1NQIUWaG42Y96suMftkR
	LtcDDH0oqNpR2y8DGBsgbPYAkW61+keYCy+hslsBoCNeAcas2GpRVw2C3+yglAxadTWEWVzH4G1
	nkRKcnJ/MHGZ0rkybRYFx9eb1cjCeyCuGukFlyK9Wb8/5lUsWOSdDbzMYvcNsypjPy1nOAyekKO
	UMQwAj8+8i9uvXO1ndNck45D0uFu4uMRsojYumdldlJreTRhw==
X-Received: by 2002:a05:600c:8184:b0:489:1c1f:35f1 with SMTP id 5b1f17b1804b1-48fe60e1451mr65158195e9.4.1778861109715;
        Fri, 15 May 2026 09:05:09 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe67688sm21102505e9.5.2026.05.15.09.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 09:05:09 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 15 May 2026 17:05:06 +0100
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <ex6p5qpgsfvm5wzalpwo7whcj4m4uxzscpzxvb5ihfu2prx3fj@7skhmz3cbshw>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <kwjoyikbygik4futknqpua2tlzokradms25n2dmfa5czyj2uts@4rdfl6zlul2q>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kwjoyikbygik4futknqpua2tlzokradms25n2dmfa5czyj2uts@4rdfl6zlul2q>

On 26/05/13 10:41AM, Rodrigo Alencar wrote:
> On 26/05/10 01:42PM, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > precision). After the decimal point, digits beyond the specified scale
> > are ignored.
> 
> Hi Andy,
> 
> I am starting over here, the other conversation is getting hard to follow.
> This is my new proposal...

+cc David
 
> ...
> 
> > +static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> > +{
> > +	u64 _res = 0, _frac = 0;
> > +	unsigned int rv;
> > +
> > +	if (scale > 19) /* log10(2^64) = 19.26 */
> > +		return -EINVAL;
> > +
> > +	if (*s != '.') {
> > +		rv = _parse_integer(s, 10, &_res);
> > +		if (rv & KSTRTOX_OVERFLOW)
> > +			return -ERANGE;
> > +		if (rv == 0)
> > +			return -EINVAL;
> > +		s += rv;
> > +	}
> > +
> > +	if (*s == '.' && scale) {
> > +		s++; /* skip decimal point */
> > +		rv = _parse_integer_limit(s, 10, &_frac, scale);
> > +		if (rv & KSTRTOX_OVERFLOW)
> > +			return -ERANGE;
> > +		if (rv == 0)
> > +			return -EINVAL;
> > +		s += rv;
> > +		if (rv < scale)
> > +			_frac *= int_pow(10, scale - rv);
> > +		while (isdigit(*s)) /* truncate */
> > +			s++;
> > +	}
> > +
> > +	if (*s == '\n')
> > +		s++;
> > +	if (*s)
> > +		return -EINVAL;
> > +
> > +	if (check_mul_overflow(_res, int_pow(10, scale), &_res) ||
> > +	    check_add_overflow(_res, _frac, &_res))
> > +		return -ERANGE;
> > +
> > +	*res = _res;
> > +	return 0;
> > +}
> 
> This function now becomes:
> 
> 	static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> 	{
> 		u64 _res = 0;
> 		unsigned int rv_int, rv_frac;
> 
> 		rv_int = _parse_integer(s, 10, &_res);
> 		if (rv_int & KSTRTOX_OVERFLOW)
> 			return -ERANGE;
> 		s += rv_int;
> 
> 		if (*s == '.')
> 			s++; /* skip decimal point */
> 
> 		rv_frac = _parse_integer_limit_init(s, 10, _res, &_res, scale);
> 		if (rv_frac & KSTRTOX_OVERFLOW)
> 			return -ERANGE;
> 		s += rv_frac;
> 
> 		if (!rv_int && !rv_frac && !isdigit(*s))
> 			return -EINVAL; /* no digits at all */
> 
> 		while (isdigit(*s)) /* truncate digits */
> 			s++;
> 
> 		if (*s == '\n')
> 			s++;
> 		if (*s)
> 			return -EINVAL;
> 
> 		if (_res && (scale > (19 + rv_frac) || /* log10(2^64) = 19.26 */
> 		    check_mul_overflow(_res, int_pow(10, scale - rv_frac), &_res)))
> 			return -ERANGE;
> 
> 		*res = _res;
> 		return 0;
> 	}
> 
> The new thing here is _parse_integer_limit_init(), which is a local modified
> helper that accepts an init value, so _parse_integer_limit() becomes:
> 
> 	unsigned int _parse_integer_limit(const char *s, unsigned int base,
> 					  unsigned long long *p, size_t max_chars)
> 	{
> 		return _parse_integer_limit_init(s, base, 0, p, max_chars);
> 	}
> 
> with init = 0:
> 
> 	static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> 						      unsigned long long init,
> 						      unsigned long long *p,
> 						      size_t max_chars)
> 	{
> 		unsigned long long res;
> 		unsigned int rv;
> 
> 		res = init;
> 		/* ...
> 		 * the rest is the same implementation as _parse_integer_limit()
> 		 * ...
> 		 */
> 		return rv;
> 	}
> 
> That allows to accumulate the final value into the same variable, which makes
> things simpler and decreases the amount of overflow checks.
> 
> The scale can now be a bigger value, like 0.00000000000000000000000000000000423
> can be parsed with scale = 35, resulting into 423.
> 
> The truncation loop is still there... I think this implementation is better,
> and I am not sure what is the input limit that you would consider ok to allow
> non-zero digits to be truncated once the scale can now be something bigger than 19.
> As long as the output fits into a u64 variable, the parser still works.

The truncation loop is at least stricting the input on digits!
Any comments on that?

> 
> I am also adding new test cases for that!

I have a v13 ready with this. I'll give it a go soon...

-- 
Kind regards,

Rodrigo Alencar
