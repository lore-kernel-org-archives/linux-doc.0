Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C2A3A169D
	for <linux-doc@vger.kernel.org>; Thu,  4 Jun 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567779; cv=none; b=jDsA26D44nYYFa4TWgPAENT14XTD+K/EewB9N5P33d65v24cY7+cY5KVJpORhW9Am+WaWflrtYxNErtUONcgddKOMrvv3eJHYda0E8pHnBnSXP/aZkjAA7sbDHLUX3xkwtKz7EDa3pmB+BsFgMCvQNjyUuaQgXVkBciMAdlFcoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567779; c=relaxed/simple;
	bh=B2CnKvGteEd3Ogga1Fg7bneFO20MG2+ueysH7w2tBBY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX5SCFceqkWA9CpmM0pCiWrS14anL4ojN7HToX1wvyXb6BBG2J7mEHd92NQundgmUHCQivAYlryqtqHP6mTmo+LgDlGLqNTnPGimV4WQ58hipvf8MwzEZyaB13amErgwO0F6cgP3LOpzAWJ6ngyIssrdVSw2iXy/SsXfD96tAEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JY4tSe/2; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JY4tSe/2"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso457234a12.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 03:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567776; x=1781172576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3GPJ5N+yj+5C24kf/hzt0wYoGPWLbKx8pufh7NjXz1U=;
        b=JY4tSe/246+USi8aySI278Od4y/o+RB8O057qGMWXJZKZiq7d+4sA7niTg7Fcv2FrQ
         hPdsB677cImBHagtDXv+0xLl/x7t1VCMRJOTEB9MVe8pIiE533+VF9yzjJ/9Zelmp1bT
         zVvUELeDW2aHV7/OrfHHqZ5qjS7fRdpfmvDo9wYUuRjzYITAV4lVZ/s/05S5R8LcqVZr
         usA0gR+BqYWcSUvIxksSPbeqIagDL03hHr/UjZyjV2PuFeclfv12Wfz4G47hxd/Vacv8
         dYaq+37yP7pPK/8bAsZIDsQYSKWk6B2bVsuPEYB/Fe6eFkhKCmMZOkMFe+R3T/M6Jjce
         umNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567776; x=1781172576;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GPJ5N+yj+5C24kf/hzt0wYoGPWLbKx8pufh7NjXz1U=;
        b=ZuhS9VZfpsaPT7OrHQHj3LrwPu8DZFAB1pbcoaJHpKTyoEIdNmunQ0+j4xV0IxwGGt
         Tf9Ga3z+EryslJncM5lyCx8S+bPsrxY+eXKM9hJ5aY65VSoDNdWfU786Vz6TVazbzurZ
         1/iTHrrXGUa/8J9vQAQwA9uG+8OVjVAmAjjq8d3Zb3KLXpamgxByZ54rqpzm+KfJBTGX
         nq5wSg2kifujd1tSHmwjINIsZXTR+h+vxG4Pv/s6ghT15zMdKJFWnpQTdPQHsFmscdnN
         OWwce00kmFwyyPHT4d0uedIvrVqjNnmO9rIe6q/y+1jF0PslYM7hwtym0oLYQEPcx/oL
         8EJA==
X-Forwarded-Encrypted: i=1; AFNElJ83CeDSWLRX9JL7Ms0Q4cg2PD7UNffNaqCXltAr3TMJvm5ReARhe7zVhlUrhner6ChBXvZpvbXHTPs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIG+7A3/QySe8lI5fZqkzg+iLWkL3Xd0dzE0mV3FWkAuJzjz6m
	bQqCVj15PniSw3542fdvS1pQ22JYoadlHxCPoPND4jzrDXn0ZY5Uk4GE
X-Gm-Gg: Acq92OEm5aOZm62Dg62HikLcnfUM2rsOK7jDfbXq8KbeMK4UQ4bYuaZC2xGTCNdEuIR
	lsb4RQ4RMrl2hsJZPgsjyCLcKS/0F2MOd5p/CJyb6z9msiHCgiUBp4nJ2vKyBPv/zGuEoS6WY8A
	5x/cVqe1WxiUlk3Xp++lyp0TcFoCESDai6d6G8zg4dFaXkC9xmcPlNhvdIFUxA7anC7xjdhGPGx
	P+dWmDsKpWS38h/LhWAGUxep3Ch/WVvmOAWXGmcZRcDheuiYmvmEPyVPPcIXp1+wbNp7nAK0Kvz
	sxX+DgCLej93Up6CvzpN8jSWjcLHFdXcwQrhZKuGLkmV6oYFlnnnWN30iF7qKDkmy0+PNVCmcCD
	D9m77KQIpTVKTntHUOhibQm0zmBIBqgEJcPuwFvCGAeowpjQbXJcBvNumFV/PTiVlggH3H2zeP9
	eTOGB2s+Qp1wuEWsm4LefUormiM2gzFOSN4GvOOidcO1il+7T954dnjPaRXuRw3i1iiNNbZ5STh
	JQU+gjqYf8YkjfaWEvuiN1vpNzTk4uFamAVTGCxyGrhMLQ5bA==
X-Received: by 2002:a05:6402:5d85:b0:67c:34bb:1bd1 with SMTP id 4fb4d7f45d1cf-68f0edd16c2mr1002189a12.1.1780567775983;
        Thu, 04 Jun 2026 03:09:35 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65851786sm2239274a12.17.2026.06.04.03.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 03:09:34 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Thu, 4 Jun 2026 11:09:33 +0100
To: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux@analog.com
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v16 04/14] lib: kstrtox: add initial value to
 _parse_integer_limit()
Message-ID: <rvx36i2ydmwhbbkdgbvh26uqchyoptzuu7tleuyarqn2skzkxz@owzwp62mzkdo>
References: <20260604-adf41513-iio-driver-v16-0-1a7d09143bc2@analog.com>
 <20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-adf41513-iio-driver-v16-4-1a7d09143bc2@analog.com>

On 26/06/04 10:58AM, Rodrigo Alencar via B4 Relay wrote:
> From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> 
> Add init parameter to _parse_integer_limit() that defines an initial
> value for the accumulated result when parsing an 64-bit integer. The
> new function prototype is adjusted so that the _parse_integer() macros
> stay consistent allowing for one more argument, which defaults to 0.

...

>  noinline
>  unsigned int _parse_integer_limit(const char *s, unsigned int base, unsigned long long *p,
> -				  size_t max_chars)
> +				  size_t max_chars, unsigned long long init)
>  {
>  	unsigned long long res;
>  	unsigned int rv;
>  
> -	res = 0;
> +	res = init;

This might generate conflict, as the code around have changed in linux-next.
It is an easy fix though.

>  	rv = 0;
>  	while (max_chars--) {
>  		unsigned int c = *s;

-- 
Kind regards,

Rodrigo Alencar
