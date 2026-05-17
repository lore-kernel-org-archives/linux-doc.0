Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F782346FB0
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779009031; cv=none; b=VgHfKz0Xx9PCkIz3V0qGxsc6xwDzc/QyOYt8DikPAJX+L3a11Uw1JYu9Cf1m3rCpyFXmqdgUNkKdy4fENUwCsY8Hs9VmAF6jRXmj6LJXqQMzEQsR0t+RVkpcdD2E6m+DNwZw+c0yNDUfUxQF5V4ymSuBIF8vJM9E4zxsu/v0h9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779009031; c=relaxed/simple;
	bh=giZbbwb+KGFykexkY9wTcBPAz1X8drfgDFb3/DVXeog=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVBuVuuh/l2KtQHwYx5ap8z4W+aOm7tYh3YWF/HgWdfhcyBZ+YrSqRM53nHWa73tScbKiQEZzmi7wM6/pyNJBW6S9AlLRzw5FetGui5NmnDj8bB4F/eFswqh6XooH0Th1D5Nt5zwwzak1IOk1mHKbczs9EanSAP1n/ytbjWF2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdF2IBdZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdF2IBdZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso6693535e9.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779009029; x=1779613829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LhmWRu1kAEOhlZEB2pEFFWdT70xT8IhgyYEkSNuFaIY=;
        b=YdF2IBdZWg4rU9t4PVQ3oK64oST4DZ1z8hpjIhzYOwgy7Z2EbiOag+hBR71qYb2cNh
         X0j9CMdfBXxbiMQE3T+XQQC6PIPnUXLUllM4DMf9XlBQLovZ0j59PQTdCihxGjp2hMJd
         vGtciWWyfHVhanqF0lZI5wAaoP1jOuV9EssKgn6OQnFNzmXann2K1dUIrSWDb3CZg+8g
         b9cboyitGC/EfmFUTwVegrP4O8CkrJkW9V+1fJWEhy/hFpngEG8LHWp5IQaQ6CARmEaZ
         Ypg0/1FhecElngFM0ZSuUFqHFlLixvAPcxGDPqB/HjxnM8YcZHA7n15I8r5F10Kyc1/e
         5URg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779009029; x=1779613829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhmWRu1kAEOhlZEB2pEFFWdT70xT8IhgyYEkSNuFaIY=;
        b=orJNS9BOb0TrfczMuyGyOS2Ce5sL+U2BarH1luVNgWkKbFDc1WXEAOvIKOF3vtJKlM
         jExzdAJsF2YKYc8lT3ZPRz6//bZoGmuO7YuqQl6o88lhOP7fQzgY/bDPRz74kXDO+riw
         upyVLEr4Z5jXKchViPZwiEBCLemkdqM9n+cdJ8kCjYfTCLoOD2xic17Fmuv8T5bVevFM
         mRY1nCIcLnhx1NFK5laZjM+4BiTfeliQG/nelZlIwSFoks8RRdQXJkc4qfOTtp+wFv5D
         iwzsCdG0o0VsMjsJzu7HYzBWrN8nqJZm7Tooy4w5iqovNBe3Me8co1oufZS+kAYh8m5+
         SRrQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tb9mWl96UwPfJAgYQYDOnHXmDJaMFMIZEUsjoOWXFwml+tzeAsXTxvUAqd8sERJIotHsT/KoBPlw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5H1DTxR+WS8B4mYTaDj/CHxa1AHynC2q7YFxnfrEJm+aZcKfZ
	6PLzmVvvWR9bsPWkT5W7rAftDkuhCxRZOdQLSDZ2uAuQr+bjWaWx02Lz
X-Gm-Gg: Acq92OG3Swc/Y+k+4+X5FY1sw/SymHdP5ublOpGzW6QypLdYWjCFxyShfPcc4avFGzV
	cNujLQUc7hSL4SNlbhUiOGx1KBthZk9I5silRfvTuFDXiRqbr9Y6tMlp3UL/7OdhPAUIfCTAtWB
	GXry4YpA/C/Go2GExhI7Th1g34a+pyuBz8e/E0VrrlWIb0nTi/d9DbsqliV3j0t7ER7iqsIn2Mm
	bgDneMu9HWGAsNc8KHy7WF+7TSsteW4q0j5bpfVHVF0iNa+KSrhnszU1rFnk01lQilsOvI3mvCu
	YjQq34co7JWY/kha5aa4PrBqtNRRa11ZrGuZx/EDP5ApYl3WhfnNXZT3s0bM22pYGgzKaalE7r7
	dgX1KEA7DKzXtq1QbVtTk0UkfDA3lsLF15ZmYDkXFIACPB0lh1na2VZGdNwVPOkg9KbDieW2UnN
	dixiFxDMe7kw0zsf8qEmOEGaYU8AefE5fESMFlz2dwRA3F4+/ixdU/lRKSro7aQzXeVLkhdeoX/
	n+hNZyNxiAV/YBvMJP++T2oUNzD81urbFHorQiah7P7tLiNWg==
X-Received: by 2002:a05:600c:8901:b0:48e:526e:1040 with SMTP id 5b1f17b1804b1-48fe63021f9mr136814135e9.23.1779009028470;
        Sun, 17 May 2026 02:10:28 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19b1dsm27206239f8f.17.2026.05.17.02.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 02:10:26 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 10:10:21 +0100
To: David Laight <david.laight.linux@gmail.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <uychuflukrllg3nfzzcuu4xmfi6f4trb7326yq2lg2nrbo6zpw@xjbatdimgaal>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <kwjoyikbygik4futknqpua2tlzokradms25n2dmfa5czyj2uts@4rdfl6zlul2q>
 <ex6p5qpgsfvm5wzalpwo7whcj4m4uxzscpzxvb5ihfu2prx3fj@7skhmz3cbshw>
 <20260515202142.5dc561e0@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515202142.5dc561e0@pumpkin>

On 26/05/15 08:21PM, David Laight wrote:
> On Fri, 15 May 2026 17:05:06 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > On 26/05/13 10:41AM, Rodrigo Alencar wrote:
> > > On 26/05/10 01:42PM, Rodrigo Alencar via B4 Relay wrote:  
> > > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > > 
> > > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > > precision). After the decimal point, digits beyond the specified scale
> > > > are ignored.  
> > > 
> > > Hi Andy,
> > > 
> > > I am starting over here, the other conversation is getting hard to follow.
> > > This is my new proposal...  
> > 
> > +cc David
> 
> I just wouldn't do it this way :-)
> 
> You end up with more code than you would get if you just converted the digits.

I am not sure about having more code, most of it is reused. The rest is input
validation and scaling.

...

> > > This function now becomes:
> > > 
> > > 	static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> > > 	{
> > > 		u64 _res = 0;
> > > 		unsigned int rv_int, rv_frac;
> > > 

integer part is parsed here:

> > > 		rv_int = _parse_integer(s, 10, &_res);
> > > 		if (rv_int & KSTRTOX_OVERFLOW)
> > > 			return -ERANGE;
> > > 		s += rv_int;
> > > 
> > > 		if (*s == '.')
> > > 			s++; /* skip decimal point */
> > > 

fractional part is parsed here:
(combined into the result so we can just skip the decimal point)

> > > 		rv_frac = _parse_integer_limit_init(s, 10, _res, &_res, scale);
> > > 		if (rv_frac & KSTRTOX_OVERFLOW)
> > > 			return -ERANGE;
> > > 		s += rv_frac;
> > > 

input validation on the presence of digits:
(similar to checking rv in _kstrtoull())

> > > 		if (!rv_int && !rv_frac && !isdigit(*s))
> > > 			return -EINVAL; /* no digits at all */
> > > 
> > > 		while (isdigit(*s)) /* truncate digits */
> > > 			s++;
> > > 

termination requirement:

> > > 		if (*s == '\n')
> > > 			s++;
> > > 		if (*s)
> > > 			return -EINVAL;
> > > 

result is scaled according to (scale - rv_frac):

> > > 		if (_res && (scale > (19 + rv_frac) || /* log10(2^64) = 19.26 */
> > > 		    check_mul_overflow(_res, int_pow(10, scale - rv_frac), &_res)))
> > > 			return -ERANGE;
> > > 
> > > 		*res = _res;
> > > 		return 0;
> > > 	}
> > > 

That above looks straightforward to me and the tests in the next patch are thorough.

...

> > I have a v13 ready with this. I'll give it a go soon...
> > 
> 

-- 
Kind regards,

Rodrigo Alencar
