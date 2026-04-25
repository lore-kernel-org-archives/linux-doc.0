Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3941138A71B
	for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 22:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777156401; cv=none; b=q2YZ9ZCXXyI3LM1dAwCTnZpVcjfK1kmyy3aaG2wSWUr1qGqd/fj3TxrTEgMN3dqmgqhVWKP7PerDRmZpHcHAri5dP5ZINkH7MVGoLR5r+TnEvvtvAIjourGNTzKdlnX9r4A9q7A454SR1ZtUzRyxzWQ7M1vtX9pabIa2ZeXRLGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777156401; c=relaxed/simple;
	bh=xo5Wyr/E6BBbS4gr7hmzYlkdUcxsvL3RQCQ9QqINkVM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H0dSqB5wE3yUXVWBIisnUn7G1S6MhNDHa1ueoG73a4z9ryXaG9gT/IBnl4tygF8JFGKhUng3P77/fGxI+aQY0YEi8Ak8Mni23UJKR6edgcfFOtLPodyKytwO5A47PWAErQ34raUNcW+wRx+tkL4mns4dstizyvPd29h9gfwCh9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qmpLTdQ6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qmpLTdQ6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488ad135063so81921595e9.0
        for <linux-doc@vger.kernel.org>; Sat, 25 Apr 2026 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777156399; x=1777761199; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kxna5mGX/2SY/e7CJ7HPSsWx1DYUCM4yq1ObcxqGl9A=;
        b=qmpLTdQ6sfS6sJ/7M+tN+ZTPD3YSnmUJYIn0zXjwku+AF5N801h5kCu6cZSDD80V2P
         Dfe9rsS2L4TX+NPjcMBWHxSizq732dVPA3Sa88ToVpL6pwmHzvSZhUHHoTpT/HkhboxB
         tJOwe0bC8f6o8VHHWa9Ks0OHDOg3sLbcsktUvx2y7aIthv6Tm8HX/W5TPabjEyzIYARR
         efFDqrk98vExtzrs+rvGTq6sCPh7VfxP4c5AmCrwCHxWk05lAzamvfjQi7bNeXMpuxZB
         mQvgcy9kjRSJOIoePK7cTy2Rk1nyfZvtjoEWoKCrk7oZZWDCM++BEGJVtzMqYhj71Dll
         FkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777156399; x=1777761199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kxna5mGX/2SY/e7CJ7HPSsWx1DYUCM4yq1ObcxqGl9A=;
        b=ev6pTSQ5MwcS0x11ga1TuRswd3PpFLho0/XYiJGozrTuije3jrlQHP+1QbGvG/snWv
         SXz5jTfhlgyNHT6kykqtEeeTRfs2vbzRrXF4ZUUxZX7WeH7ABix2bbgEyxH8ytmPbQlS
         MRXo7rBsvSa97a4rOZpnKl1ga+7ZP9FEwl5lH/P0+QrONJlKuJ61FKFTO9oz1Ej4mYBJ
         SFUjy2swtyxJtFbvDzsI70SS7QzlReB8E3PKeExfDMIkt98kWkInubETOiPdaisEP0Sb
         RcXbHT+PrALYF/nkJ/OchjyBCmlgIYEyE6BAU2EUJvuZClwiWc9JhLg0Q5M+jvuwu9ip
         aGTw==
X-Forwarded-Encrypted: i=1; AFNElJ/MGsc/5eXeR8yUCg72TOD9DhWh9i+r/fgNTZXDblMijlibsGPVcqfzSoklTfpKLqksyDGyYG5j5WI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzzsc4hvOSAXsXWFQyWcut33l/QdgVr/R+e8ZvsJXeMyd4kL82P
	09SxqEyXWFGdjUkSr22Mbl5YvDYqtMkp8YMLTVTMsOxwfnc9OHvK4r4z
X-Gm-Gg: AeBDieurDpoKk++xTs1z2a/RdilTRbq38mvzjVaP+FGxFIfChsVzrnKTMWcx3CDsH/8
	MqWpHVMlGVfayTHf4qWkQRuJRGZwz3Vlo5VMCR//8eMzxxgbCiemrYln2S6HffmrgzqOp7xU270
	VpL0G7T1OT9WFydpoKsixYkNRiSdstYi7euRVRI2xL6t8OvDpP77FAub8PFAL8FpqcXGQI3i7bi
	LTRTC4OnknYmK4de2mTWg1guUrNZdLSOu/0r4OEHP6yY+FkrUo5/+iz03XAT3/fTmTiyFdb9LG+
	I+NStFeTOlUnfWAcvKJuaIhLLqwGTCS3PrOOx9kAJPk4febgN7sGaCk5uFlKZhmj84deeUTQ3vs
	lz+XTXaL4FPFdvPmVBNg0mAQFRWGcbRzQ2eo21i/SekIo7sszdtBYGOHr0Uph83EEgO+VC6J8zJ
	lsdvtWxqJ6H8nQA33l1hK5WYatRvwFoCE782Aa2QZZTvfxz1TGK4dffBIcF3dcvqX/V0hSJUsAq
	Fs=
X-Received: by 2002:a05:600c:48a1:b0:489:a4:e58a with SMTP id 5b1f17b1804b1-48900a4e881mr307679065e9.19.1777156398539;
        Sat, 25 Apr 2026 15:33:18 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489fec8f7cbsm393443685e9.11.2026.04.25.15.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 15:33:18 -0700 (PDT)
Date: Sat, 25 Apr 2026 23:33:16 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, Rodrigo Alencar
 <rodrigo.alencar@analog.com>, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <20260425233316.0a2e2abd@pumpkin>
In-Reply-To: <20260425164006.17b75faf@jic23-huawei>
References: <20260415-adf41513-iio-driver-v10-0-df61046d5457@analog.com>
	<20260415-adf41513-iio-driver-v10-2-df61046d5457@analog.com>
	<mhfgedq2t5lqtu6535ahdmpbvib2xzp2hmyt7ezflnf52r56jh@ze6tee7vpij3>
	<20260425164006.17b75faf@jic23-huawei>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 25 Apr 2026 16:40:06 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Fri, 17 Apr 2026 09:36:20 +0100
> Rodrigo Alencar <455.rodrigo.alencar@gmail.com> wrote:
> 
> > On 26/04/15 10:51AM, Rodrigo Alencar wrote:  
> > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > precision). After the decimal point, digits beyond the specified scale
> > > are ignored.    
> > 
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
> > I have an alternative (slightly more complex) implementation of this function
> > that handles E notation. I find this particularly handy when writting big
> > values like 25 GHz when the ABI is defined in Hz, so instead of writing
> > 25000000000, one can just use 25e9, or 2.5e10. I found that my python code
> > was printing big floating point values or really small ones using E notation
> > and that was giving me -EINVAL, so I had to adjust formatting when generating
> > the string input to the file. No big deal, and we would not need this here,
> > but if maintainers find this useful I could add it into a v11 of this series.
> >   
> 
> I'd rather we didn't slow this one down. However I'm waiting on some tags
> on this patch from folk who are more familiar with these parsers than
> I am.  Given discussion, Andy or David Laight perhaps?
> +CC David - please make sure to include folk who have been active
> in discussion of earlier versions to decrease chance they miss the new
> one.

I can't help feeling this code would be smaller if it didn't try to use
the existing conversion functions.
Something like:
	u64 r = 0;
	unsigned int n = ~0;
	while (*s == ' ' || *s == '\n')
		s++;
	for (;;) {
		unsigned int dig = *s++ - '0';
		if (dig <= 9) {
			if (!n)
				continue;
			n--;
			r = r * 10 + dig;
			continue;
		}
		switch (s[-1]) {
		case '.':
			if (n <= scale)
				return -EINVAL;
			n = scale;
			continue;
		case '\n':
			if (*s)
				return -EINVAL;
			break;
		case 0:
			break;
		default:
			return -EIVAL;
		}
		break;
	}
	if (n > scale)
		n = scale;
	while (n--)
		r *= 10;
	*res = r;
	return 0;
}

That is missing the overflow detect for the multiply and add.
While check_add_overflow() hopefully looks at the carry flag (on non-mips
style cpu), I don't know how the 'mul' variant works - it might be horrid.
A bound check against ~0ull/10 might generate better code.

But I really prefer functions that return the terminating character to
the caller - they are more useful for parsing compound parameters.

	David

> 
> Maybe start a discussion about whether adding e notation as a separate
> thread after this has merged?
> 
> Jonathan
> 
> 

