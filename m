Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227933D6EA
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 14:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437592; cv=none; b=rYo6O/zjAXy0HKbxWmeMYhYo4jlsQJlBIYZHcX6T8WDWVRDSUqs35fxBpYAJbrmYo7uKimGtz7MQMJUQm7P+RlrGd5mpJux6sbgQakJ7Sx8k1jKWV7RSVJKNGzAUsKztiIsL43Xb8gQ1HRdV2uNkEHqKl7zu2me1Bfa/aJc/2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437592; c=relaxed/simple;
	bh=xcQ1KHADsvCxonwjQYEr0+LsPyIEGsxcz7IdXN2xHoI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RfzE8xxny+oS2AugGEFH1dlKNhze2CVtCPYexKt0DvAit05UuzO/5wTACgiCFyY0PLBU9v/wIw6UIwHPwTwFaw5BYlFRFAwHw+JPIC84CpnNAU5xLli9CXEBMJGmnyxmvAh1MDYXTmkCNPT8SMaxbQpZj1uhSbNiNRQzN9OoWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JzHGVfxd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JzHGVfxd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so7937428a12.1
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769437589; x=1770042389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YQfEhIs4nzCG/cpXL/L2bih36CfKuvFVEF2Nlki8CuY=;
        b=JzHGVfxd91cB9qHDp6ECpotg6e1gMMdJI/dx90bQpTmvK73biWTXac7PGJbrTwkyDa
         3LF/VI0pscEL6uv9hSzdSWFTqXqlRxHH62VD9vXySMjQ64xbGyf3ZNS55rxvHRo9eb+e
         cvLaOwsd4FbzS58UNwrEnlKpGymr1gZurkiLeJyr8862kAjvgnXQq2Ngrq3g8SmZfeg1
         TQhx3yq2TQOQl6BqJkW9fyAKzzjO0RU+xxx+hSL4c2HRWnsaY2YFLTN6Oz0Dd/vOZy7e
         bC7nK2EzRuQkHW8voALiZ2FxpylquUhyj6wF622bHf785eloSZvccsASe25J/Cr7x/Ti
         IbEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437589; x=1770042389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQfEhIs4nzCG/cpXL/L2bih36CfKuvFVEF2Nlki8CuY=;
        b=M1p9btHS+NCFQa52fGwNQurcXqWe5wCSJwYdK6FY8ATtmK7VDPQdfsi8IWgqlyWYDR
         MKY1GWMK7eyUEbTtI1qjc4tz9uWWciWsAIzHJrfIZJDvB2L9v7ARZVOADMzFGM3aXQtQ
         qpZfMPyoqEi/wIoFv8uVdjX6LcqODC0N2s8MQxTsgAFxAFdw7JNpIau8Q0dVoXwXoOOm
         yJlbhG98CC7rwQWC+Jr66rdp68NE3DHSkFwH2OHqJRz7/tnYA3vF8IfodG48J0L+B4SJ
         NRRCvnPc8nE27y2tNOEYANDFkX+Iy6bLwlXrgaUAVX7ON10lGIWp9qV1JK+ER/88jBJN
         Bf3A==
X-Forwarded-Encrypted: i=1; AJvYcCWj82uMr/7b+1eosWjcEPYubI87LoTGs5IalU/BL4s1aFb34QW7atyYsDbdm+qRn9qG3VA8MqfWH0w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb14+Tp17XiR6Mrkj6BBr5VP0Vq7RPO1c92oKJQPXp83BxqDm3
	SQQXqDNtzrKnBOMrEg7clXOT0HLKbPzIncQUqIhaThTUPMTd1TSVPlrJ
X-Gm-Gg: AZuq6aIa7U0v1JqOETDmwdwHl9hW53xHdi0CMiI39Xytj1IwG9Yl71b6XejGqHWdfPZ
	M+Iegz6ZJKIEkT/eL8OIqmAOkpZjUorxi1p1eoKGBB+xaxO9ditb2xN/8m/vGsdOd1Gl1LtHVOn
	O+xyvA4n4zs3QPoh5380obe32b6hQ0pRfUT079LLYBEc69hGMrU1609q4xTrV0YM3mxjxMfGwGd
	ynpjhPOHPUFsIDwBNmSfUcAej3/ebew0JiyYI7oQI0gfjtdMuVxh6KJ2eY0x5/UOCgSO5cIwYXo
	G8eLmJGvNwt/liisp/lGMrPLArQ2waJV31cX8Zg6r6gal1B5fPenDy63ddoQcRS5dl7G3X9Oelh
	1XIfPIr8cO1uw7ZyjoqM547u+TxAlw0LXi78jVF9r9AXSvoFW5l4eJbSCflT9BZgG1oI31cE5XX
	1DcVY6OWwy83UbWvLnOE8IkDn5JGrvyw45Bu/Q6oIWIiIJzMq8mFMN3H0fWo9mKMqNaz+niEo2z
	CJu
X-Received: by 2002:a05:6402:35ce:b0:64b:6e20:c92e with SMTP id 4fb4d7f45d1cf-658706b8ba8mr2823359a12.10.1769437589051;
        Mon, 26 Jan 2026 06:26:29 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6584b3eac76sm4997626a12.13.2026.01.26.06.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 06:26:28 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 26 Jan 2026 14:26:20 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <ty6hptfh65k2rkqo6c6mg5z6vismuvyqsu3emvqarr2rbhpvcz@kn6tzjk5xi2o>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
 <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>
 <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
 <aXdtpkL5QUhhB_hh@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXdtpkL5QUhhB_hh@smile.fi.intel.com>

On 26/01/26 03:35PM, Andy Shevchenko wrote:
> On Mon, Jan 26, 2026 at 12:42:53PM +0000, Rodrigo Alencar wrote:
> > On 26/01/26 01:49PM, Andy Shevchenko wrote:
> > > On Fri, Jan 23, 2026 at 03:53:07PM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > +static int __iio_str_to_fixpoint64(const char *str, u64 fract_mult,
> > > > +				   s64 *integer, s64 *fract, bool scale_db)
> > > > +{
> > > > +	u64 i = 0, f = 0;
> > > > +	char *end;
> > > > +	int digit_count, precision = ffs(fract_mult);
> > > > +	bool negative = false;
> > > > +
> > > > +	if (str[0] == '-') {
> > > > +		negative = true;
> > > > +		str++;
> > > > +	} else if (str[0] == '+') {
> > > > +		str++;
> > > > +	}
> > > > +
> > > > +	i = simple_strtoull(str, &end, 10);
> > > > +	digit_count = end - str;
> > > > +	if (digit_count > 20)
> > > > +		return -EINVAL;
> > > 
> > > Not really. If we are talking about decimal (only) cases we need to also count
> > > leading 0:s.
> > > 
> > > 0000000000000000000000000000000025 is still 25, no overflow.
> > > 
> > > That's why I recommend to have a helper, maybe for now locally here, like
> > > 
> > > int safe_strtoull(..., unsigned long long *res)
> > > {
> > > 	...
> > > }
> > 
> > Are you suggesting to not use simple_strtoull then?
> 
> Nope, I suggest to do an additional step before checking for the range.

You mean, conditionally skip leading 0's when parsing the integer part?
e.g.

/*function entry and arg check */
while(*str == '\0')
	str++;
/* then call simple_strtoull() */

simple_strtoull() is not overflow-safe, as it does not use
check_mul_overflow() or check_add_overflow(), only checking the
amount of digits is not enough. Previous implementation of fixpoint
parsing didn't care about that. 

> 
> > Understood, leading zeros can be ignored only when parsing the integer 
> > part. Also, would be nice to have truncation of the fractional part
> > while doing the parsing. How about:
> > 
> > static int iio_safe_strtoull(const char *str, const char **end,
> > 			     size_t max_chars, u64 *res)
> 
> > - max_chars = 0: ignores leading 0's and process all digits
> > - max_chars > 0: process only initial max_chars digits and ignores the rest
> 
> I'm not sure why we would need that. It should parse the whole line until the
> first invalid character or overflow.

"process all digits" and "ignores the rest" would be for digits only, so it
would stop until the first invalid character is found. I suppose proper
overflow check is implemented with check_mul_overflow() and check_add_overflow(),
while iterating over the characters and accumulating the value.

Kind regards,

Rodrigo Alencar
