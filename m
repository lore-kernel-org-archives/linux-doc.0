Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AA335F8AB
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 12:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779020388; cv=none; b=idXySVJo1eq1czKTtXe0o3jVbwNYGVszexTuuqK1GRISDSGbkslEaCwuB1XxR59/bGiHowa5CI6wunR4W2FEwQrooHZVRKEGOCtqNck/mPqNKurilF7GR74093qcVlr6rP1iX9cGm8NIS9PrGnaDP3eBvOzmK0KcTg54vu8ANyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779020388; c=relaxed/simple;
	bh=4ORFF+hqy++5JiE4nhagBY/ZLP3fzcu7areLbccw1mE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jXrTnNgN86UbV4BdDSmW8OnCcfCQUohnzX578Et5858NxdxwupqwH2CogkUH5Lyx8zrqEGQjJ+NAtGvbtl0nlFJxnVcZpndqkYrN0nAc8aPSgh98YFkZkBpl3qOUPqhLw1MtYGj+mSzdC/AaHAoliy6j+7ruWZLSUm3LLBua08w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzU00kr1; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzU00kr1"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d73422431so790619f8f.2
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779020385; x=1779625185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h1PMPeBjbxQbz6gz4zIfXl+IxRIZnCvMJpkmx9O6DI4=;
        b=CzU00kr192XRukF0XOn//ebLoA822sba79VWZX/ZgKEI9BM5lrOsl/kPNDAcEQg2qG
         jHrxUkSY3k1wD6yf49ki7EhuKnb4q2WETSvmBuyH1hZucWB/bscfOS0k4TFEJlqGHfB8
         HbKu4MCYtJNogH8iRs1FNzVgAtWEp5z9dLGVt0YioFZEAS6a4MlIj39oVWBc7igR1Ers
         4CnyEs+5vctuaFL2ima+ks/tahmyi6MJRA+RqefjW2ix8HKrAaEIyIpZY/d00HbzzERn
         xJHYhYHEM8IkMaCZFXG5iKGVbizlPJ11na4mZLfwEfBjxYND4SeOn//vGJjGGATPUytC
         0+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779020385; x=1779625185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1PMPeBjbxQbz6gz4zIfXl+IxRIZnCvMJpkmx9O6DI4=;
        b=VsHHsPOk6ty12R8HL38n/IiKoIqNxIJR3IFJe7Wa8dZRdUTSfJ9anYbUVx8c7DTDND
         hlmlS+2+eWv7tO2dplBKVxbwTnrKJ7+LguSi2dbgKZVOH3Q4UjIk8Rw03Vb11YQoSKZC
         W03c//3pmKsmyNh4pQTioV65YCCUNGWRbEfmswGwt8DqjLx8SjJtRqMAKJic9Xmt9idH
         tgjqEs0YHnyLi6jn23XqL75xehrm5sx39RuAjUcQnESlEllPsVq33E442y+SpgKbpsJj
         iPXVN/dK7M3PsTTnvU7UsxqyxejSsngl5W7Oz+HHi5qH4mGze/1a9PcoUmykktZ6o8fY
         +o5w==
X-Forwarded-Encrypted: i=1; AFNElJ/Y7hH3zPbzAz5P98OdxT0JuZ8pocY96rezeghQv3wPDt7PSvaJqYHv6zF823IME5Mj7/wrxlut9XY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDygu1c0+FCKagqMTuksDNcMyMiEaQ/1OK4W73BKe2xSS9nunr
	FIq+IGQ3nJ/1VqIz0xordrR7ENHlJB9oahPm/uk+CE2qXwZpKQHGcDB7
X-Gm-Gg: Acq92OGosA3LbBm8qvPW0w+thqtMHuhR+H+nNgcqrj6dNBqaqSa1RDbtvM6sTf6n83+
	kA6SvybkHZIPOjBkS8SfdJm7gXJu04eaKqEdHSp71sV7pBCX1FGuHR7wcGmyYf2jYy4KQetYl/R
	bFgrlvZZYHKWh7ilFLfVm9FBUNEqzOaRM5yQSvUJ922LGCCWYO//+nOq4pn3Dn/S7MyF1iCm/Zv
	wYAWj3tGpW9HexLj7rH+NWEzQAj2WWLJLmHqzr0Lnfpk4Lpt2NmJLXffIPLOGSkELUJHBP/dsQb
	OszpCgs+fHmPRcCtNgSZxdGysB0lfEEW95LXKA7b5tl0xi3lf3XxRgYKcgyTqYkwlAzua2tCRKf
	c+PQXjmZHDurMvyReyxSGtsNgIS68xPv6zfOP4Yd/IcF/R/tyoUJm09RP5ruG1vFKbDVbQIwrUF
	Bgp+LQ0dzMAucs8rSysdG1ymJsQCEyce9O/bXeE9QOMOT0t3SneBCOtnXLamlGRu5SlEADm+JNx
	oZmG1mu48RIwWUmwl8Qm+cxY7yALv76AA5EDwcCnpRK0Si1qw==
X-Received: by 2002:a05:6000:2c07:b0:45e:75c5:1a6a with SMTP id ffacd0b85a97d-45e75c51b5emr2297637f8f.33.1779020384879;
        Sun, 17 May 2026 05:19:44 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm30436836f8f.23.2026.05.17.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 05:19:44 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 13:19:38 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v13 02/12] iio: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <u6uqytictupj7kgaxadxmvuayc66cpfw2g4k4ebvdmtgpjqdfz@zlnl3arq73xn>
References: <20260517-adf41513-iio-driver-v13-0-bb6e134a360f@analog.com>
 <20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-adf41513-iio-driver-v13-2-bb6e134a360f@analog.com>

On 26/05/17 10:13AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add parsing helper that accepts an initial value for the accumulated
> result when parsing an 64-bit integer. It reuses current implementation
> for _parse_integer_limit(), which now consumes the new function with
> init = 0. The diff algorithm would have the documentation header and
> prototype of _parse_integer_limit() moved around so it is adjusted
> according to guidelines.

Sashiko's feedback at:
https://sashiko.dev/#/patchset/20260517-adf41513-iio-driver-v13-0-bb6e134a360f%40analog.com?part=2

...

> -/*
> - * Convert non-negative integer string representation in explicitly given radix
> - * to an integer. A maximum of max_chars characters will be converted.
> - *
> - * Return number of characters consumed maybe or-ed with overflow bit.
> - * If overflow occurs, result integer (incorrect) is still returned.
> - *
> - * Don't you dare use this function.
> - */
> -noinline
> -unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> -				  size_t max_chars)

...

> +/**
> + * _parse_integer_limit() - Convert integer string representation to an integer
> + *			    limiting the number of characters parsed.
> + * @s: The start of the string.
> + * @base: The number base to use.
> + * @p: Where to write the result of the conversion.
> + * @max_chars: Maximum amount of characters to consume.
> + *
> + * Convert non-negative integer string representation in explicitly given radix
> + * to an integer. A maximum of max_chars characters will be converted.
> + *
> + * Return: Number of characters consumed maybe or-ed with overflow bit.
> + *	   If overflow occurs, result integer (incorrect) is still returned.
> + */
> +noinline
> +unsigned int _parse_integer_limit(const char *s, unsigned int base,
> +				  unsigned long long *p, size_t max_chars)

	Is it safe to remove the "Don't you dare use this function." warning?
	Since this function returns the number of consumed characters bitwise-ORed with
	the KSTRTOX_OVERFLOW flag, turning the comment into standard kernel-doc format
	makes it look like an inviting API.
	If a developer uses this and directly advances a pointer by the return value
	without masking the overflow bit, could an integer overflow during parsing cause
	the pointer to jump out-of-bounds?

That return value merged with the overflow indication is a bit weird in the first
place. I wonder if we need a precursor patch cleaning _parse_integer_limit() and
removing this KSTRTOX_OVERFLOW completely... turning it into:

	ssize_t _parse_integer_limit(const char *s,
				     const char **endp,
				     unsigned int base,
				     unsigned long long *res,
				     size_t max_chars);

so ssize_t returns the amount of converted characters, or -ERANGE if overflow occurs.
Also endp would point to the end of the conversion, so current usage (in _kstrtoull())

	rv = _parse_integer(s, base, &_res);
	if (rv & KSTRTOX_OVERFLOW)
		return -ERANGE;
	if (rv == 0)
		return -EINVAL;
	s += rv;

would become:

	ret = _parse_integer(s, &s, base, &_res);
	if (ret < 0)
		return ret;
	if (!ret)
		return -EINVAL;

which seems more aligned to the code we see out there.

-- 
Kind regards,

Rodrigo Alencar
