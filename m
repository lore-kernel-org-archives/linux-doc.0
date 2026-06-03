Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D8385515
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780482437; cv=none; b=Dpd0BvH7jHf+x+E4HJnQO3xgEpNgQniNbcmBrhm6VlGufLWlLd4SxEE/4SwpyvpYXkVDxltE0bp0/AxkbNe1ZqdIWfA6JlifjXWXGtJ5yqLTnJEUPHnfTBBbjgFTFa2nd2eWnleL8AwtR3IuQaeojOwrdZcabRysg1G2xv3y3zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780482437; c=relaxed/simple;
	bh=Ark9em2HE+VudWaYABBUGSqA5V6yzvpN+95Dp7fRXKA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d9s04EfL0D1JNxFBN+qpwOKodaZWleZW1pO7LhCj7fnKOoCyc+4OiSS9vvQ3CRBKTPoCpWRU73XGVk3vDpoKyFbnX/M4XL+roto0rPaPixQbSO+zonaOhL8n8fXXBPErQ1VaOm2SQrydPEYyDQglKidnvdxPC3+0yB9sjbC/NE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHA6gZNN; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHA6gZNN"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68d23396ed3so6867732a12.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780482434; x=1781087234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H+8/3rc9t6wT4lr8p2D3TwP0o4yczLstnY4MzI08CwE=;
        b=CHA6gZNN8ODXOaN2r642vRk7BH81kSPVTL1m0AWIn2AeYvT0cIXJooZ3HF+BdFIzOP
         nimFmTxoHG7q5b4+pIaJ1u2JNmlmRUP0tIeg+KOjnSSkc/LTy9NL5DlUEUa+tm5j7Srj
         +cuavPNRl4mbw/SSA+uDRWM/oa8rArc2zP8f5/iimugTA3aAE1hAEOW/JMzNzu97T5ud
         0lkC3KZ9I7ri/o5Uztl3kZS92WSUOqHSKfvNx/LAIf/+tvdG+hFf3Sbt/MReIjk/d7YR
         AxD5IdPfTEdcuR5Cn720jnxrFASk4BqaOHcklSgFBSCfnf99an7WnnSJtg0EF7BYbBtn
         j+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780482434; x=1781087234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H+8/3rc9t6wT4lr8p2D3TwP0o4yczLstnY4MzI08CwE=;
        b=PIDagpyUQBa/bnfzYoyQQvuFoYmXuLE4XR+4cMj109ptMx9niXECJE8JFhqZjlfQ7E
         Yo+RVvRtxI4dWzt3TENJxihai42CnPkUFXoHL4crhY51GBbc8QiM/WB2/XviiM+MlsQv
         Y+39Cyh+g35tdAvsxAYu1/Fbhq+Pu+UZc4iJjGXnkQj1KHW/91vEketZf91F8MK+XdBQ
         CZ0ho1yONrJwIwlSuawXNOmbKRYoFG1h0E/wnkF6wPeKp9rvF6uOBMIBVV60Xhzs5Wnx
         JO2V3XyjfEClYC3RYBnEEDaH2cAzT88RcNuPjVQoiRY8PCoEZZ8T8xjut4n3wqB1PWKv
         hVrw==
X-Forwarded-Encrypted: i=1; AFNElJ/pFFhobbg72wf1vZu5mNEJnvaHUIy9UINtrCrPUDHiqOnnnwyuVpbc6Z4sFHRsNgOva5ecjxfugbo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmzawEbWaaPf//DsR6Z3r5UZeUGTsLoPE0P4lJrrAWbuOShpM+
	JGNyrhoYwVxyrO9vvANaSk3dQIeeGoxUVGXnl4LaRz3H8++ZprTEtNKq
X-Gm-Gg: Acq92OHs/ddbYHmHSGGhMJB69UwnV28nhdZh17iuEEyu9uqdWb+79lko0rVEvAyxj5k
	Xj5CUXFWOpqz2vEwtXXNK9n4p0NOY/Zmj9fM0LSAREAqIin6WeJDuniIbIqyx3h94r4olaNPxJE
	c1hOls7Ownb8gdTjNw/+LEOBRi+vMghclY7pZ+H5VioZHT+pgIBltkge/DOeNOATKRxyXVq931Q
	JpUyuX1Mk04WS/sT0NP890yDgjPEtwFA+g8zkOGqfhoR0XgTHsfwUF4jDgMSzeAYsTijYNjQxxa
	O+KZYxvjztcQ3IHSoaHTtK0xxaqehAjMAD5k6ij9TRs3xgm+FhxsTvzWRZ51fYWN+ZDiimO64nS
	rgzwt4wQj5q3PoJJeGi5WwzRKwakn95uGh/oL8gZ6hgT+P0Cq8Ods+tTyi+r1PCow32sRT1jDYu
	xpzTo+3vEVd6+5Wjt0R65srXriuHK/o8fVk3QakZjF/e698XmYfWMkr7BHvHhWI+YJi48hB0Rlf
	KhHo0DjRlFxMDSsHnMtfEQO5w+oym7dQH9YPlzrE2DjNFlyUg==
X-Received: by 2002:a17:907:3890:b0:bd8:f7f6:92a6 with SMTP id a640c23a62f3a-bf0b32b8a7bmr154755466b.23.1780482433765;
        Wed, 03 Jun 2026 03:27:13 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f1464sm130550366b.55.2026.06.03.03.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:27:13 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 11:27:11 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 02/12] lib: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <r54csg73lsafo6rff7gew2eardfag3zmwjbm4jl54pjbqf6w7y@axnfog5wpney>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
 <ah8yR3Os8NDNll27@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8yR3Os8NDNll27@ashevche-desk.local>

On 26/06/02 10:43PM, Andy Shevchenko wrote:
> On Sun, May 31, 2026 at 09:30:45AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add parsing helper that accepts an initial value for the accumulated
> > result when parsing an 64-bit integer. It reuses current implementation
> > for _parse_integer_limit(), which now consumes the new function with
> > init = 0. The diff algorithm would have the documentation header and
> > prototype of _parse_integer_limit() moved around so it is adjusted
> > according to guidelines.
> 
> ...
> 
> > +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> > +					      unsigned long long init,
> 
> Why not name it res...

"res" is short for result and this is an init value. I suppose the compiler
can optmize towards that kinda of efficiency. I thought of "p" itself to
carry the init value, and the function would just accumulate, but that would
change expectations on the function behavior.
 
> > +					      unsigned long long *p,
> > +					      size_t max_chars)
> >  {
> >  	unsigned long long res;
> 
> ...and drop this one...
> 
> >  	unsigned int rv;
> >  
> > -	res = 0;
> > +	res = init;
> 
> ...and this one?
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Rodrigo Alencar
