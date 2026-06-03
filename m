Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F76C3B38A4
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780483507; cv=none; b=ShB59vNjCDW0NjSZdt0o6F3FPY/83kAXsJfYytGaiMPrMevmhWGwRa+4tVdr/5bOG7tvoy0CBw/ZOIbnQdItTVhFw31h7gNKfjsskgoG6X1q+Uskik8bSiiTvlJ2nMh3529PF+lrI24UtxfWpfaOo+y51i0E56thGV8CCUt3wpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780483507; c=relaxed/simple;
	bh=m2iuCXAbLy+zZsi1XTpwT94AoT4yG6Hsm2KkBLsLDIg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIht18k8ILIUfQ40HdAAJC/khvjRRFMa+Eh23F2LJ9D5NmrLhtnbERLsIlwrH4UDnQoCYXoCwNK1Hi/uvNzk/IWzwhV8pcjr7wUIiKjPzlT9OQa65JqAcydLqxHlFHlwK3i6dM1OgVSKLx3jMxVMFL/HhYeNvnt7xdn6hGPaPCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxJJDOhB; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxJJDOhB"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bef8b97655eso92232766b.0
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780483504; x=1781088304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uF6sxHTQksZQh/sifc1ca5X6iC08FJoq4YcfQBKz3ao=;
        b=BxJJDOhBoSa5uqEeGaNIG1CcZn0GYBKnCH8YigOHolg5ALD8qjKMclxbOAXbucCOKO
         QC1xWO5nG93e43oYb9KeJLO3zE0SIoGm0ju4PB5LjeUfxaw9KpWGvrAIL30qfixeuWWd
         gcLiDxyJqYo3waE7uHqJpey8Kg9EdvuofpwIbI/DrbrCZBOKilhw1sO2yp1U/Hza7rDv
         Tg+gHqXCBETgUwXCJiqUqO+XsnJuNonU684cbhtNGpu6IeOQ2LehtVGBHg4ISQY1ABxu
         CqrszOClS/jTJQW561KkA9xHCTQV3/fCr+ixamdVUrTRfEQHgOZhFslRM6jkKZOAi6k8
         /M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780483504; x=1781088304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uF6sxHTQksZQh/sifc1ca5X6iC08FJoq4YcfQBKz3ao=;
        b=oIfeAq55DZCNw7BlKTgLjSZFW084q6+ZigUK9Oemi3eZ0WfgvpTpv4QUIk612X/Pch
         nAzuN3/qYug8laYyuhrm08VIeGs2vg00DTs5YW0cwEV5JaGaxavQq7yC9LS54emNuTHT
         ON//q1RW2xlmfHTJail0nrWBHFRT9icd7LlLaapiu7jnvmBKxzSygnYrrPZPhKwNPyiu
         5IcXfwq8fcM22euYxjxFGQI8Y2SS7UY/5cR3XOen0OIgWNvBFmWDHUxmyJr4zcptTfly
         aliU3y9+k4cRR9x9aDbYm6Zxbe6t2+PFesPUQh8iXg/m55vn6creqytCrMB9fqhPJ98p
         zKFA==
X-Forwarded-Encrypted: i=1; AFNElJ8/+9gm50mzro9iNRefIqPLZzwjIW+IMCyg267LWyPUYr/1PWGkECOj7l1CiYuXav/Sh8Fsx+HX67M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbYHDivvHY6SAoZXz1LBe+K57Oyn+b+ZKfrT2m8FofLLYTtM1D
	DrF0lSDatBDUZbUTBuzjtKObhhzM1oz9TAYvAwjslXzvvHFnZBvJrJEG
X-Gm-Gg: Acq92OF5IjLQFol0nZqbJSIz4gIz034pr1hzEI8C2ReajbmaBbjGi7HqGwxeH7X2QOG
	1UC9aGc72rD4QMmFywpoP/sbi6r+TUPvZKKo9kB1n6yWNplmsWihYLcxZ/08WN4JrEmV6Lx+CEr
	VehMLbwdl6i37vdllnumUGEt9G5rFFqLRPW0CkiRyj283BODnhl8NGkcwawedJNpwiJhAYT0x5S
	El4qkiWqNE+VjtHkdYEtAtw6Qc/6yY18yOey3w/lTIY1tCBDv7cTdpBxi4ONaowBFmqj0iBOm2q
	80zYsbXAEhvfJK/QEs+OWTVKBOlUbgwAb5a8NfwMPu6ESAY9o6d3VNNsPnAUBFtjDQYzOyz6l2y
	hFW9Z2INpd1d6mHE/4qCgmv/CHd+xvoA8WwnfceCLnYno9Ahjvw8nZI+87/bU/crjPteJAUh7B8
	+v4zBHQbgWW3FUAqo1vpWzKia3i/882UTbuGfeTrpJQW6u/Oz5o++3i7f0Jbp1hBtgBGdUGiJAO
	KqMb2PaoEQetp3XzQmkZdtjr7vomddlplqzjuj00qtW7eSxYQ==
X-Received: by 2002:a17:907:2dac:b0:be1:4955:a0c9 with SMTP id a640c23a62f3a-bf09ea65889mr115670566b.21.1780483504201;
        Wed, 03 Jun 2026 03:45:04 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm968600a12.20.2026.06.03.03.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:45:03 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 3 Jun 2026 11:45:01 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v15 02/12] lib: kstrtox: add local
 _parse_integer_limit_init() helper
Message-ID: <rb6mrxl7nquyg6ewfzvhsdij2ov5mrm5owulhuwfgmyd6a4a4g@7simkr4ovkxr>
References: <20260531-adf41513-iio-driver-v15-0-da09adf1c0dd@analog.com>
 <20260531-adf41513-iio-driver-v15-2-da09adf1c0dd@analog.com>
 <ah8yR3Os8NDNll27@ashevche-desk.local>
 <r54csg73lsafo6rff7gew2eardfag3zmwjbm4jl54pjbqf6w7y@axnfog5wpney>
 <aiAEmS7aa5p1Fi7g@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aiAEmS7aa5p1Fi7g@ashevche-desk.local>

On 26/06/03 01:40PM, Andy Shevchenko wrote:
> On Wed, Jun 03, 2026 at 11:27:11AM +0100, Rodrigo Alencar wrote:
> > On 26/06/02 10:43PM, Andy Shevchenko wrote:
> > > On Sun, May 31, 2026 at 09:30:45AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> ...
> 
> > > > +static unsigned int _parse_integer_limit_init(const char *s, unsigned int base,
> > > > +					      unsigned long long init,
> > > 
> > > Why not name it res...
> > 
> > "res" is short for result and this is an init value. I suppose the compiler
> > can optmize towards that kinda of efficiency. I thought of "p" itself to
> > carry the init value, and the function would just accumulate, but that would
> > change expectations on the function behavior.
> 
> > > > +					      unsigned long long *p,
> > > > +					      size_t max_chars)
> 
> In any case I hope you saw my mini-series:
> 20260602203706.103449-1-andriy.shevchenko@linux.intel.com

I did. It looks good and it fits well here. Although I suppose that would delay
this one bit more.
 
-- 
Kind regards,

Rodrigo Alencar
