Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1333AB27D
	for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776414990; cv=none; b=G7LgM3K9WvhgpXhswOsTDSANkSelNGqOoAHY22O2VE1pgfXdwGwReAchtKEQnq3nbqOzYdFCn0fma5rU3oK/GY8/7+P4rA2vQWuk054C6ShYUHaIU54HY5PvFxAg/Grq/YzK86ZOVqycOPIcgUs5e1TPJ8c1tv4+gSjGe1bNxxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776414990; c=relaxed/simple;
	bh=+6x6QSjg9WDHOM6OfwMMX46Jbd5d/tcXlvODjbQmQhI=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wa5FdIXAWLdNZgGsuP41KbvpJYmApv3IdJHXZzoNEyqvFNdsPB+aWpwxew/TMeqnJKoQhK/CJO6Lplyu5d4MEP7/uGqaPjFGuGhbrAPRz0im+EusSLeTtsGrs60A6ULKYpNRHyHT+ZTKkAwjKpHRN/aLeI97dMhC1XentnhQFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CmPcXyVm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CmPcXyVm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so444499f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776414987; x=1777019787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CS4QQsQN7RmaHyI35F2RiAWiiiGHkRaNuLXPNb9Rp1U=;
        b=CmPcXyVmMFW/Ru5XQk+qJiv+A+2qOWiw7Xoh/2hhpSLmc0TsrJBuFPc++U+w+ubDQw
         O2qpD1ve7P6vJQTJIjQw/mZ4qdiiLQxXM8FZ1c2egt2vwLjCNxrBThJeJVmHwMD1Ilid
         fO0kZ1G0B8d0iStwhLTuGe1Usq/9Lf1pa1k8CMEc9AZxUtGbR9nV54nqtkys3I5Lcsl7
         17s08aj0xJGfR9BGJ630rAWEiVF11oH6FIJRLFfjnsrYjSQyfCpPmmBvklDOIyJnbUwU
         N3eX6bP0kR5M92glv8SXxBAKLxBF1L7cWcTg4Ytt5yKbjqd/RKKzejpgHafDUgGcEZbo
         FzoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776414987; x=1777019787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CS4QQsQN7RmaHyI35F2RiAWiiiGHkRaNuLXPNb9Rp1U=;
        b=BmauADV9sgO0vNjcimC4KGR2jQ0c4vv5aV7ZO70CEsdMvx+xcvGL6yMEZkXszenI+3
         bwrjFLneOx87nrkPxQx1OTNwVYpOvMrBagwQlUxYDO30t5FZEpNQ0ssON/6JT9Lxs1Gk
         sIPFSivebWnIn1ZQbMYNgsIZCwhjwxAMQk216q0y6aEsmhklhmssQDyndIHEkhHBsqKg
         NsGgPSS+mviYT2dzhokUJBOi3/+Z8KK/0dB9whCKuWh47rtTonzBJh/uaFgKuMBR34r3
         Y4V8j/RD0m2Y8qZ1pusJd7AnEie7o6+j0v8RZTA1FdDtOeM9DEuucNRh95l/ZyriTdw6
         3VSQ==
X-Forwarded-Encrypted: i=1; AFNElJ97sfC1N37w3XgFpVzaCe1A0lHW+VJH85j1jBXeDgl8A6YHVQ6xcFAk5aEPp/ObHIiWb4si59xLjMc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGMQRTR3/4y6bqMOfmPu4V8JG1tXbMzd3mO3ath8LesLtvTZg/
	TCc3I0qcviGZT168SJretjgagmsnOVDlDNBdt6Sld3qmOt6ppkrGMt/QVKRXyYRX
X-Gm-Gg: AeBDietQ2kesl6ygEPdkFA+7Hly2z/dJhRCyCRoznsrGm6rJqXJ0FiTBm/LVQWAl3bL
	a+mBl3+dT6Nasu6JgSXv1laVlc6kYuEKPCB/sfSrYuDJ5JofCYCCP3MUygTOjYB/G+Q2TuFViBo
	KoRQ6rbGQslyfbMn/JHxKhkFfCcd0RYyX+E694gch3/KxSx9d9P4QFdCWvo0kQUO+0L77YJuoIY
	uoksjSVJa/Do8Y+UZk4/GWyYklp4CQry/7QXzO7ba4iva4Lu9M4SYqBrPW1YMnk3NoBQhMcYui0
	RosB5/500T0wKZWS5noiJjkdQxtcYuSg9pTtbyL2EsEgD69CHsymrKTA8bbettcO8u8X9sRlBId
	mZyDyf/EXd1xDMQy15pAuuD4ARsjcj2Z9Y8a1zpu6VLdmmiZAOts4Kbrz7YMLNYXjwZUGZbSi+W
	Mmf+9bhydEBetN5RpPuuse4ob1NbQgsbBkJWBWpITTVfxUttFs3g8R7DOKK0Qy6472+TtV5u7KF
	vKbhIfy1Wihqv2JEmfmTxLdBlx9RCo0ceViYVeWbZ9mOazaEdT8dITo3krkudTVm+PU6erD
X-Received: by 2002:a05:6000:2308:b0:43d:76d8:5794 with SMTP id ffacd0b85a97d-43fe3e14f8dmr2894776f8f.36.1776414987239;
        Fri, 17 Apr 2026 01:36:27 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc0d51sm2911996f8f.10.2026.04.17.01.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:36:26 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 17 Apr 2026 09:36:20 +0100
To: Rodrigo Alencar <rodrigo.alencar@analog.com>, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v10 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <mhfgedq2t5lqtu6535ahdmpbvib2xzp2hmyt7ezflnf52r56jh@ze6tee7vpij3>
References: <20260415-adf41513-iio-driver-v10-0-df61046d5457@analog.com>
 <20260415-adf41513-iio-driver-v10-2-df61046d5457@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-adf41513-iio-driver-v10-2-df61046d5457@analog.com>

On 26/04/15 10:51AM, Rodrigo Alencar wrote:
> Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> precision). After the decimal point, digits beyond the specified scale
> are ignored.

...

> +static int _kstrtoudec64(const char *s, unsigned int scale, u64 *res)
> +{
> +	u64 _res = 0, _frac = 0;
> +	unsigned int rv;
> +
> +	if (scale > 19) /* log10(2^64) = 19.26 */
> +		return -EINVAL;
> +
> +	if (*s != '.') {
> +		rv = _parse_integer(s, 10, &_res);
> +		if (rv & KSTRTOX_OVERFLOW)
> +			return -ERANGE;
> +		if (rv == 0)
> +			return -EINVAL;
> +		s += rv;
> +	}
> +
> +	if (*s == '.' && scale) {
> +		s++; /* skip decimal point */
> +		rv = _parse_integer_limit(s, 10, &_frac, scale);
> +		if (rv & KSTRTOX_OVERFLOW)
> +			return -ERANGE;
> +		if (rv == 0)
> +			return -EINVAL;
> +		s += rv;
> +		if (rv < scale)
> +			_frac *= int_pow(10, scale - rv);
> +		while (isdigit(*s)) /* truncate */
> +			s++;
> +	}
> +
> +	if (*s == '\n')
> +		s++;
> +	if (*s)
> +		return -EINVAL;
> +
> +	if (check_mul_overflow(_res, int_pow(10, scale), &_res) ||
> +	    check_add_overflow(_res, _frac, &_res))
> +		return -ERANGE;
> +
> +	*res = _res;
> +	return 0;
> +}

I have an alternative (slightly more complex) implementation of this function
that handles E notation. I find this particularly handy when writting big
values like 25 GHz when the ABI is defined in Hz, so instead of writing
25000000000, one can just use 25e9, or 2.5e10. I found that my python code
was printing big floating point values or really small ones using E notation
and that was giving me -EINVAL, so I had to adjust formatting when generating
the string input to the file. No big deal, and we would not need this here,
but if maintainers find this useful I could add it into a v11 of this series.

-- 
Kind regards,

Rodrigo Alencar
