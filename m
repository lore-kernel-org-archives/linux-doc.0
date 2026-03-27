Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B307D358D37
	for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 09:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603501; cv=none; b=HP5kUZu+WcsCeyNbzR9IbUpfU8s6nxclFKGX1KSVSqUZ6DDaWBVSkKCRDIj2XKCcJCa12wocBnVarJwZwoGXzA8xGc6kaps3dV++Du59cpp5YUO37uCzv+hBM41TIvzXc9osB52Ob/IR6bSCGZYSOdoYZBLA4ibAajVaUi8TiuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603501; c=relaxed/simple;
	bh=XbDQ2/22hmqqOYzwVjmdadSPPNUhgz8dkbyHcGWO9i0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpDuPkqxWBOsqqF/Q4YrrztHTGcrIW7ZSO4IiU/yf5eXm6DXCOzDlT65xdcIPhm6CltEzIwiJBnoWaBlc8HeBK3fwqnjs7NKYf7lww1L5l5ts1BZNYAW4nQo8CdozepzggZl+ctpSKPFRmwa3+n//1BM+ut54iIN1KMgXcpFog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sf7FJvtB; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sf7FJvtB"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486b9675d36so16685035e9.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Mar 2026 02:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774603498; x=1775208298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZS4t6iiMwLAGOREHrvQzMp06NE787DNbu4/2Frutpg=;
        b=sf7FJvtBz2wyq0j5MiQKmrMt6ShvyfiwGq3Ln4dUiVwcxjiGGrSfBjlVpoIa3kYrms
         UqeBpMLXlzNNgunyPgv3rtHIjxb1kS7nakg7jUZWsvC/sptbl9DX+mLTJm64QdlyeSU3
         LUdl8zk+jqOUc6nR9tS/dm5fjs1M9+MVgpQrggXcWYRPlsR78rfOAbCW+hPRT7hl084c
         RKs46C+gop4S+LHHSF8wGrK4EakH8RQcDTIQ5lFvZj/uOmL9n67nriHYAztwCm0u34ii
         YEs/y8PiZFE95JhVqyCcuzkWuhZkfKmBLJ6azZarzVQyISl1qGJH6fa7/w3WP38BtUNZ
         yZ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603498; x=1775208298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0ZS4t6iiMwLAGOREHrvQzMp06NE787DNbu4/2Frutpg=;
        b=MKJfp9IUdAmoY/CdmEmoFvH9RTHjKEq7uC3S+KY/7GCoq+L5NLXIyPKpdCqgQMY6bg
         mY28XWDai3uz/nIedtiBl64PrLyxz9Juptrhk+x6cJIckMx7RPyPpcYL+qQXbvI+uqde
         ++GsVC/i0OI8JXoJPpnCdLVve5JA8uuHjbLASzyq72ho0PPGZmRrGm8yLxHIWKFR+ris
         hOVpHJ2rGpTII1Sr3oFb5FS/VYRvJ/KICi2vT+HvxUjvD1U8Wz/DYY8jz1BAYutz+8JP
         k36wyx7vlyq17bbeHT43LTRJk+9+VqJ/vofyzUeWBSV33ZNkfAMaJET3jNAyOyVuNugZ
         Jwug==
X-Forwarded-Encrypted: i=1; AJvYcCXNx7PqxwTNFkrmXfCl5gYaOdHNyO4DeZ6wkEukDMzcNtKB41yNbuVYXwcgzb17mD8oqvDWY4QSNAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT7RUH2/y8X5eOPxa7QgTVn5B7MAutBSzJzb+u16MYwvrYKygo
	4CC8t/FlJneaayozaXgFvFh65AIBh6pXQpkfSVnfLUHp9x47lgweby2c
X-Gm-Gg: ATEYQzwF5g5nWZGOUbx5l792b03zCjEXFBxN9ZhSIWfYpirmQDBBD/Ee1u2VuHZGHf8
	APdEI7chxNazNnD8UsBR7mvix0xnLI+Aivo0nAn9kWwl9GGiFV+Qx73nlAJAC8lpIfhKhrNbpvX
	FLrT64SfZar1R9ldaDFOwLp3yh5rWPsISmT3x9E4wcYk9fZ5ajTvqIuiSVA5FexEY8rAx4f/YEE
	8TVIHvRqAoVa6gwE1i77VUefczfouXZMiY5y/VrseILHMKnclr+cCCMNTTBi0uu+n4CYiK/FuNp
	pCyGVBKW/jhNFSqZzKTALaG4pCrk3JOIAEDlhCXWIPOeRBq8T20s/UOKgoJo1p0JU0YmnuCX7HU
	1TaiQnCilUls1QifyFjkZLrp2ZymBMZiiG+td2ZeKtGls2eMYBoL273/a5ipZg5TS7FZy8GdbMI
	/AtKgf7/F5Lzdt9fTe5hsQVMFom5B7K68OcsvgYj1r9/bN9xcIkhckmnSqUrnArhljEaQUQv2Jt
	a9lJR7a55ysKmQAmFDbCquPoF1gvgiec91oGNaNuroeh+utb2w=
X-Received: by 2002:a05:600c:4612:b0:485:445a:87d1 with SMTP id 5b1f17b1804b1-48727d6f733mr15472495e9.8.1774603497832;
        Fri, 27 Mar 2026 02:24:57 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d23679sm167318985e9.9.2026.03.27.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:24:56 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 27 Mar 2026 09:24:50 +0000
To: Petr Mladek <pmladek@suse.com>, rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v9 2/9] lib: vsprintf: export simple_strntoull() in a
 safe prototype
Message-ID: <yn5equz3nlcp52347yfpa4sdfxhkno4l3a4gaugefsz3kzebz4@idftkp7txr6u>
References: <20260320-adf41513-iio-driver-v9-0-132f0d076374@analog.com>
 <20260320-adf41513-iio-driver-v9-2-132f0d076374@analog.com>
 <acZDneLrIPOmU5ci@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acZDneLrIPOmU5ci@pathway.suse.cz>

On 26/03/27 09:45AM, Petr Mladek wrote:
> On Fri 2026-03-20 16:27:27, Rodrigo Alencar via B4 Relay wrote:
> > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > 
> > Expose simple_strntoull(), by addressing its FIXME, i.e. its prototype is
> > slightly changed so that -ERANGE or -EINVAL can be evaluated by the user.
> > Flow of the function is not changed and error value is returned in the
> > end. Unsafe internal wrapper is created to reduce amount of changes.
> > 
> > --- a/include/linux/kstrtox.h
> > +++ b/include/linux/kstrtox.h
> > @@ -148,4 +148,8 @@ extern long simple_strtol(const char *,char **,unsigned int);
> >  extern unsigned long long simple_strtoull(const char *,char **,unsigned int);
> >  extern long long simple_strtoll(const char *,char **,unsigned int);
> >  
> > +extern ssize_t __must_check simple_strntoull(const char *startp, const char **endp,
> > +					     unsigned int base, size_t max_chars,
> > +					     unsigned long long *res);
> 
> Sigh, naming is hard. I personally find it a bit confusing that the
> name is too similar to the unsafe API.
> 
> IMHO, the semantic of the new API is closer to kstrtoull().
> It just limits the size, so I would call it kstrntoull().
> 
> Also I would use int as the return parameter, see below.

Thanks for look into this one.

kstrntoull() was what I used in v8:
https://lore.kernel.org/r/20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com

There was a discussion around the naming:
https://lore.kernel.org/all/4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6/

please suggest how the function prototype should look like.

...

> > +/* unsafe_strntoull ignores simple_strntoull() return value and endp const qualifier */
> > +inline
> > +static unsigned long long unsafe_strntoull(const char *startp, char **endp,
> > +					   unsigned int base, size_t max_chars)
> > +{
> > +	unsigned long long result;
> > +	const char *cp;
> > +
> > +#pragma GCC diagnostic push
> > +#pragma GCC diagnostic ignored "-Wunused-result"
> > +	simple_strntoull(startp, &cp, base, max_chars, &result);
> > +#pragma GCC diagnostic pop
> > +
> >  	if (endp)
> >  		*endp = (char *)cp;
> 
> IMHO, we do not need local "cp". We could simply pass the endp
> to the new simple_strntoull. Or do I miss anything?

Basically the unsafe version drops the const qualifier and compiler
complains that pointer types do not match. Maybe an extra warning can
be suppressed there.

-- 
Kind regards,

Rodrigo Alencar
