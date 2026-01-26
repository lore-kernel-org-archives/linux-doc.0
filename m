Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F03335067
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 12:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769431385; cv=none; b=DAQ2D8RyL/YfYSImhKxlosWsqYucV0NkygL9yUeD7UDYY1hhoIsHoXoTUtHJsQPmMSfIbNgqoDXyINpcHt/mlCcl446PATavOpWjoDfXFvoZbIXZzzr4FyQpUALcquxFkdhFijlpfJy3JJAUi3QvmmM3XVDfnsVblH7z1EJOkT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769431385; c=relaxed/simple;
	bh=U+c2Hgblo3r/wja8rf5QoZTJIQ0uzSyWaG4sMBQzq28=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+x9xACIAoqE8L6ltHdBIEWhVLUOHGy/57AEK3mndYMKXo860hlvXMgAuR+quGBrjWSrwI4vkn1y4J9eS1AIWOL++p1CBRieTYkEUWh5RH6WllflIdkCVwyioRBqreg6AbIN57uSRG6H+WZpAcvcNc3451jdEWGhnv1m5uG5OLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AP8iuHwO; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AP8iuHwO"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so65358425e9.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 04:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769431382; x=1770036182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=do5TPbTmIbVmH05fNafBjej7yzR4YEVxfJZjwcPS6ic=;
        b=AP8iuHwOm5hL3BJ2pcE91GiIJmenew/V7KvNp9Nyk7C3WuJ8F9t7CLBfAyaArQ8PMn
         ge0NgJpI+rb3c5qc2TrNpE5jXcvw9IZj+wwjxTDurznVy0nVdO1+nCwdZ167tFOVA2qI
         8bTjqG841eLzgq1tbzTF4vNXA+6V4lgCKdj+vbIs+G4RYOL4ngNLb95L5aFKYgYq62Oh
         TYpPXFNbMuEeVPynfLhgWnPbRMfufTo0pkp0C5z0KXRNBpu4WiT6vTBqJ/aBUhbeYGtm
         jRGJj0F3BKEOYGsHPu11Jnl1DCp0f+uQAaS3Dg3rhORfrBsz3Wwr/CNMJwF5GSq5JxDL
         7uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769431382; x=1770036182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=do5TPbTmIbVmH05fNafBjej7yzR4YEVxfJZjwcPS6ic=;
        b=EfTUpu5KRBfaSyfVugGnxy85wySE3Hu/Fu4pF4whhJ9AM17ZvCJpdyAPY7WNx95mYL
         ssg8itn+JgEucjsVk1UDBEkJfx4/9dpsxkAAkgFLCmRXHaZ6BEaityOdNK6c3Zu7Pt9e
         XaqUEJjtxKeJW9CBOgQv8/uHq3ymfu9t/J+V8M+kvSb2t4ZBtwZ5H7IX8or+rU+PfYIP
         UqROM+bVYRGlhe/qym0kfDtBmQbfDeoLtMCpxokfwy5QXs/kTGg9w2ttDYt+HcBRcinc
         tWzEIw82+fMqoj1Z7LsdZWBfNa3gfSsSqViKi+QKn//odp+UMjrnZVmL+rp60nH0uuzY
         7VUA==
X-Forwarded-Encrypted: i=1; AJvYcCUHPoCjs/dr5T6uwKvzXLkZnVwnKOqW8DXgitX2lrn8tT4P4NCmw+bmShrT86hoTMX0nV7e+pQuUTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiwbSe9C/vyCaeaTkILWhkhxyUZC9IM5uMuwbjMOGoADgvLPgH
	jEoHwCogEJpy62AgKfmGIHGrXOjLKlP7ksDuOA5KQfOfbXQPki87Lp6I
X-Gm-Gg: AZuq6aLVFcHY7ryvhlUbFKe9dGXq7xRRnJ5GRwzHUvc5a7ZRgC1fDolRTGDv6CcCv9F
	0DlfxOLoaymEZJLebn7JTREoYp/29NlD9bi6CsBJjmm/S255AIIG2Xxanh+yqjYapAhW4Zm0WkL
	eFrcQ1XW+f/jr10tSTHWKVDzMaFbPYiOo4wKn5e4ASYsiGNO7ueI/9d7DZSz10y0sehH86UI9mz
	y9b605upSo84G3I5nTHZ8kzI2bO6gbdjhSzsoYEU2pyUHJQx/QtT0jSO1KfpV1+jMaLFALds8m4
	DsUofGk7V13VUj+bjIw4cvDnUY+hNvV9/CrzucVzEyyzAn7JNCF8F0cO1huR/rVnFavlvtUD2TI
	YqAIjilpM1MGJ2Sc3hdVFotuDA3dKy0tYIdw2kgMq6TYvO9IiKnF3o0GLQmNN1XtsNr2SrnM+rI
	LbzrrPR9V1R3Vnz/OuvXVlMeDK2hLyq4iWuRZYdtf+URyqQ3tQpaKGWQI55l2Suk/GWmjhpg+Yt
	cWQ
X-Received: by 2002:a05:600c:681b:b0:477:5c58:3d42 with SMTP id 5b1f17b1804b1-4805ce4bec4mr79129435e9.10.1769431381877;
        Mon, 26 Jan 2026 04:43:01 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d3fda30sm108016795e9.1.2026.01.26.04.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 04:43:01 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 26 Jan 2026 12:42:53 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
 <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>

On 26/01/26 01:49PM, Andy Shevchenko wrote:
> On Fri, Jan 23, 2026 at 03:53:07PM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add iio_str_to_fixpoint64() function that leverages simple_strtoull()
> > to parse numbers from a string.
> > A helper function __iio_str_to_fixpoint64() replaces
> > __iio_str_to_fixpoint() implementation, extending its usage for
> > 64-bit fixed-point parsing.

...

> > +static int __iio_str_to_fixpoint64(const char *str, u64 fract_mult,
> > +				   s64 *integer, s64 *fract, bool scale_db)
> > +{
> > +	u64 i = 0, f = 0;
> > +	char *end;
> > +	int digit_count, precision = ffs(fract_mult);
> > +	bool negative = false;
> > +
> > +	if (str[0] == '-') {
> > +		negative = true;
> > +		str++;
> > +	} else if (str[0] == '+') {
> > +		str++;
> > +	}
> > +
> > +	i = simple_strtoull(str, &end, 10);
> > +	digit_count = end - str;
> > +	if (digit_count > 20)
> > +		return -EINVAL;
> 
> Not really. If we are talking about decimal (only) cases we need to also count
> leading 0:s.
> 
> 0000000000000000000000000000000025 is still 25, no overflow.
> 
> That's why I recommend to have a helper, maybe for now locally here, like
> 
> int safe_strtoull(..., unsigned long long *res)
> {
> 	...
> }

Are you suggesting to not use simple_strtoull then?
Understood, leading zeros can be ignored only when parsing the integer 
part. Also, would be nice to have truncation of the fractional part
while doing the parsing. How about:

static int iio_safe_strtoull(const char *str, const char **end,
			     size_t max_chars, u64 *res)

- max_chars = 0: ignores leading 0's and process all digits
- max_chars > 0: process only initial max_chars digits and ignores the rest

on overflow of u64, the function would return -EOVERFLOW

> that will do all necessary checks and returns -EINVAL, -ERANGE, et cetera.
> In the below we would need check for the error codes respectively.
> 
> > +	if (precision && *end == '.') {
> > +		str = end + 1;
> > +		f = simple_strtoull(str, &end, 10);
> > +		digit_count = end - str;
> > +		if (!digit_count || digit_count > 20)
> > +			return -EINVAL;
> > +
> > +		if (digit_count > precision) {
> > +			digit_count -= precision;
> > +			f = div64_u64(f, int_pow(10, digit_count));
> > +		} else {
> > +			digit_count = precision - digit_count;
> > +			f *= int_pow(10, digit_count);
> > +		}
> > +	} else if (!digit_count) {
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (scale_db) {
> 
> > +		/* Ignore the dB suffix */
> > +		if (!strncmp(end, " dB", sizeof(" dB") - 1))
> > +			end += sizeof(" dB") - 1;
> > +		else if (!strncmp(end, "dB", sizeof("dB") - 1))
> > +			end += sizeof("dB") - 1;
> 
> Now we have strends()

strends() would not account for the acceptable '\n' before the end.
I don't think we would need to test for " dB", " dB\n", "dB" and "dB\n"

...

> > +	if (integer64 < INT_MIN || integer64 > INT_MAX ||
> > +	    fract64 < INT_MIN || fract64 > INT_MAX)
> > +		return -ERANGE;
> 
> This needs to account the sign, right?
> It's fine to be UINT_MAX I believe. But I haven't checked the current
> implementation.

Yes, UINT_MAX should be valid, will add test case and adjust. Thanks.

Kind regards,

Rodrigo Alencar
