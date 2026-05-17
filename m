Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E1D3542F8
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 10:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779014648; cv=none; b=qI7jYfi7YS+yT4JprFRcjMFaeuQktv9hM6UIuP0AKkTnL17TZS5Uhk7rrLh8uJcDVW0JrnwAYknOClmplJyrttJYsXphdUEFlebEZ5vDufwm2gjAKpxkQhQFo6WMFnqM8SImwUEZqorIFk4NgOBibM1QJ81ELcOCZUz1Lbbp14U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779014648; c=relaxed/simple;
	bh=tlZmveqPOI0YGsJN4bEukbZ+5Bgq+D8k9OvRT/i7aSQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLbsSAuQrGEgQSGZF1muQMAaC55seaizUXtGGrz25IArs9Ad3viG9ZnkzKuQV/oC19iSmkh5bx6VrwdretgXwGvyXZ1lKjTm6fG7nUkDTdB2OO863lNWo81o9LQVFIkKuUh8oxLTWcvxdITU2+EniJeeNFIAlP3O1rHlNXqLM3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfNZx+CV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfNZx+CV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ad135063so7891315e9.0
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 03:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779014645; x=1779619445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5gIsWRNwchS9zsgu9M5QrXv9157pRu5lm3mw2NTNgU=;
        b=UfNZx+CVoYK6vURd1/JBOO0KIqwUo8bBUqBX/Ox4GcxWAa/7doVBjKKWUt3JmV4vKU
         T3+m4ynPzdF9kaT5Y42KsONbpy8zUABtjSrlwLSjwiu2ILhV2ZQVESyS6NSQlmDaCdpZ
         ZbTByK5fLoHrZprriNcsMaqLmWvEN0b/ZmUyLxURMxxRDYlIJdUknnCsx+SgOQAdoyhE
         clu9kwZG/t2BCJZqd7pqzjhtt2j9q60MZXTL62bPQJXVbqIYrmQYyrdCq09OV32NhiQP
         95X8VFOh/6BurJ7tiLSZ+EEpEqK4Q1oGnmFR+JakZUkdVMenmKUUgW7cCWI+v0qFrmbE
         LiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779014645; x=1779619445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H5gIsWRNwchS9zsgu9M5QrXv9157pRu5lm3mw2NTNgU=;
        b=FBRjU26Dtf7mnkJu1RTzSojFBBhOV0HovftkcxI1ZiUXpDBo3/mHECGDIAxJEqFLVJ
         j84d6OIgqYHnz0qpGAIJKDTvox1LM2C6gxSwqyBhT98Dkxo/vCT1tm3Fbvpjp3yFP27E
         NXELmuYWaz2eKuhEwkdO0ZGlAZlOo3VaAOAxwKRHpm5jLNio7Sp+tfNvAWA1O26aDIdT
         MZdnGtF/EhxVvyIiOG1ZfQZf7r94NRGXLoJ/DPFjVxg75pNCDVlv1VVmY8SJWnIYBk8Y
         OHE76EgqQjdhzDxcjIn+3BG4I4uaC6CzhrQQk2oh07GRZoPVnrO8RTsGSpv2Nsjx5mwo
         7nwQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6vVVZHy39ysxn1jP+1CN0Tj+4FpPjEAySy0ToJ0j54balMDI9LFtK8C7/Z0lchKjEG6CrPZQ6ZFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4m4mmf2/wuNiqkZ9Gm98IXFiP/WvzpzxWnWZ3a/VY4OTgJxn7
	qauocAZbIhaalwvwNnA8XOjXXk1QmFfgqFGfjipxh2X/QHIrkb0jvYyA
X-Gm-Gg: Acq92OE5nOYslnOt/WMeuE9Q9ttoo4/V0Dznlf8vkd6MSSqR0lE8nhiOFO/aS7xrFO7
	AbZnsS1PT/+iD5qmrWAzEzO9u954lE40uYYZRIidDUfGNDSFIikVXD6ikeieSv/R56+x8Svl0M+
	MRZkPG3tLYe5cEtn4SZWYYs5J72eci1QtDsp+s4J1KpbNMxJsZoOX3yzThtr5clfyiEqAJARwKV
	v9vxQc5cp10MRsqPnny4LdqAruy/kKn2RX1QHC3e+sP7CyUWJxIj7cadm6x/cBC7JUTVwBdQBni
	/hd9PV5sMiL+zYXwjdxq6z8FRy1SuHpsZOiNnwnmNdjMV2OlN1OF0WMltlIoeEAnXmtAobvNuzR
	LI3EymbvN+XmlCD3qtDdlay5fxIvejoEzc3GASnn9L440eT4/rRij5agOIziwAtmYvqwWljwkXb
	VoNwM8GLJZoI3Bv21K0MD850MjtECQyrXPdLoC38zFcJIsQuDq4nUxaOhpV8DJjDHPbWPf+voZz
	twhEoRy9W6Sl83gPswXHWq0YPQYzySJ5i1KRFM9DXrJIpDL1A==
X-Received: by 2002:a05:600c:848c:b0:48a:52d4:888c with SMTP id 5b1f17b1804b1-48fe60e5241mr161739305e9.3.1779014645237;
        Sun, 17 May 2026 03:44:05 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm28777006f8f.14.2026.05.17.03.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 03:44:04 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Sun, 17 May 2026 11:44:02 +0100
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
Subject: Re: [PATCH v13 06/12] iio: core: add decimal value formatting into
 64-bit value
Message-ID: <bhicqdxszledixf44h4ox6cdemuytyiotgha6ab7455vtmqatn@byvmhy5llaij>
References: <20260517-adf41513-iio-driver-v13-0-bb6e134a360f@analog.com>
 <20260517-adf41513-iio-driver-v13-6-bb6e134a360f@analog.com>
 <agmVYvWBmLI4A65m@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agmVYvWBmLI4A65m@ashevche-desk.local>

On 26/05/17 01:16PM, Andy Shevchenko wrote:
> On Sun, May 17, 2026 at 10:14:01AM +0100, Rodrigo Alencar via B4 Relay wrote:
> 
> > Create new format types for iio values (IIO_VAL_DECIMAL64_*), which
> > defines the representation of fixed decimal point values into a single
> > 64-bit number. This new format increases the range of represented values,
> > allowing for integer parts greater than 2^32, as bits are not "wasted"
> > in the fractional part, which can be seen in IIO_VAL_INT_PLUS_MICRO and
> > IIO_VAL_INT_PLUS_NANO. Helpers are created to compose and decompose 64-bit
> > decimals into integer values used in IIO formatting interfaces, which
> > creates consistency and avoid error-prone manual assignments when using
> > wordpart macros. When doing the parsing, kstrtodec64() is used with the
> > scale defined by the specific decimal format type.
> 
> ...
> 
> > +	{
> > +		int scale = type - IIO_VAL_DECIMAL64_BASE;
> 
> > +		int l = 0;
> 
> Perhaps make it global in the function? We have the same in
> IIO_VAL_INT_MULTIPLE case.
> 
> > +		s64 frac;
> > +
> > +		tmp2 = div64_s64_rem(iio_val_s64_from_s32s(vals),
> > +				     int_pow(10, scale), &frac);
> > +		if (tmp2 == 0 && frac < 0)
> > +			l += sysfs_emit_at(buf, offset, "-");
> > +
> > +		l += sysfs_emit_at(buf, offset + l, "%lld.%0*lld", tmp2, scale,
> > +				   abs(frac));
> > +		return l;
> > +	}
> 
> ...
> 
> >  #ifndef _IIO_TYPES_H_
> >  #define _IIO_TYPES_H_
> 
> Also needs types.h now... Which makes me think if the proposed macros are
> placed in the good enough location.

That is a good point. I left it there because they are related to IIO_VAL_INT_64
and IIO_VAL_DECIMAL64_*. I had them as macros initially, but they are not exactly
"types" indeed. 

> 
> (Note, iio/iio.h missing actually types.h, but includes it indirectly.)
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Rodrigo Alencar
