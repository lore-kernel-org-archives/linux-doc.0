Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A73AA9E8
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778595156; cv=none; b=Fz/C4nn+xR+9+cozkdWBpeem3Eim5P+49RpgJXH9pHS7jCGwUawZJJlyi4vTQR8fOJgKRwieYK8TNmVUrdbMdoQDEAQJel4a7aV6o7nTTmWPv4ExfcWLD53PAwZOu3AGx2PNnwlI9KmlrSsJ6KrQvD8nAFv2ZAn3AnSxx7Q+19U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778595156; c=relaxed/simple;
	bh=Q41Oo0zRbrO8B/Db3XFSemV5+e5K2mKQ+CxGfpoCaKE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJxKSTMn/Ls6zOZITuhFyOTxcJPx2I5spiJYkuJDlOPGnirA2tvZB2VyAy1Dn9GjFVsOAlidog4SKE8TMF5qLNfFTadSJaqOABuGRQpls5jx2gm9UQji6Gcz8SjrGaUuEyCjuVm2fOJFThe/N+XbNKe1zPjypX2wXvPVSaktyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FfG3zEAH; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FfG3zEAH"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso5675095a12.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 07:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778595152; x=1779199952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RF50yWKLYOkstrjwnDzYRTiCpEdjsFZwr52Zl8yZOCY=;
        b=FfG3zEAHF8hTgHUZVrUnXltviGM4Q4osSwBDz4eUGoQFcxOlS4i1fY0pLIF+XllPfw
         ryY8NkT6dsFCSA/yav4VJBnENgdXI6UezVUaFFv2qZsOpGwpaFxXf5aPaRDkLx3AM5yF
         5WSiWQ5QYO/uO62OIESAQUTHQOxXcv4ddYxuuNFUIPu1jFzLie08qmXe4WHx3FxY2f9z
         kp64eDFvn82rZse8tRx371LxTB5JfNxWBcEvyLbUDoJI8ShoUbkdqulhKssITfNeysiK
         j2beEOAvkSKjBXCWsdahP4A1WJncIRopykNISGwkwLYd5X9sTjGXON2aJgupcKqMXcZ+
         PXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778595152; x=1779199952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RF50yWKLYOkstrjwnDzYRTiCpEdjsFZwr52Zl8yZOCY=;
        b=nx6fPuVTxhuh+endDn9F5879wOD+gpc8eQOypciy7AxF+rInG2nCIkT5Jd8jeRKWE+
         +abGPRL3W9K/9TvxV96WfuWfYvmUTCfeV/gY6rqBFdmPFC1r/Qlwr/nfOMC6aDTGUNT0
         Qj6lXMEYKBbSEZBGd2B3R+ZQ49NjoihobtI8ea+ojj9bQG2KoF2pCp1Zn3h9hsPJiP6d
         TTcOY8KFmyDa2fEmPi2GEJfQdycXLnpLwO4/J9Yv7bl35gEijHs6mi7LmbvptGD2X+Mj
         afU/iO2tHno42kteSeCr6gGkKAFoCJOC+IVPRHguqe1Ro76hGVxZ9CseJUf7mP0Y1Nxl
         Qkow==
X-Forwarded-Encrypted: i=1; AFNElJ89mQR6r/N9P1Llz/GtaDhHE6VszsbZsVr7MqjBaq0tIz+4XDiX5o7Erg413wdOIehZuwjEuRAEnzA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9TCfpJ4jyVPvJHIHIkLEHk8VYL/wdJIe76lYgdlv08DOCN/h6
	QXt7FElgrA5tX1Fx5Im3JRHrIMfovcxSjwX1MI3nDnQew/A55C3irQTt
X-Gm-Gg: Acq92OFBXYGuPmw5oIKLZn6TXlneBEb3xHjl3Rv/DuXclOrBMwqssttpdOMuqx72kgP
	oWzjogH1DbpAp76AA1RuA6nf3d6YPLV9DkGYjzWarQIHS6Lb0uB6qpPOMWBUY7M0ny+L/w4lvYj
	w9xttYb62rvZj5nKCeJhfk1zFpNM4JSnwFnYYtybPv1kwcdNq+/6/VU41ZAA+Z9dF7e0/NXxSn7
	2nvpT0fe8CHDSlL+0xnGdS/bi+i9ZdGO8Muz0BOUn/ekGuXr03CbOwDIBcAYVwwf6ThN0WFHdQG
	s0kuzhD7KuePiLp8G4TkQVIEGQSHZQVInmBOARS2ml4o9GtnbIsJZ8e+M3x6T94ywNJEz6A3e6W
	ddT7JY2pHR3N99bjbD+SoJjQynCF18qhzYOo3J34wmA9CWgsks/80a3M52WlRS6BHXto0jk/liw
	G3YrIl2+vreKEN2jTw331FQH5Gi5pZRNecVZCg87kb+MyRpCu7GUQhxgaY1k8qz34AFuTr5esw5
	2SCg9KiEKymgzBXQXwSHNgvPRQdaRLorVSGFIhHT9gVqBlFsOTErqxQmKX5
X-Received: by 2002:a17:907:8992:b0:bd3:7c7c:b817 with SMTP id a640c23a62f3a-bd37c7cbcd3mr1081866b.1.1778595151498;
        Tue, 12 May 2026 07:12:31 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcfb7b17d1fsm344049566b.41.2026.05.12.07.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:12:30 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 15:12:24 +0100
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>, rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	David Laight <david.laight.linux@gmail.com>
Subject: Re: [PATCH v12 02/11] lib: kstrtox: add kstrtoudec64() and
 kstrtodec64()
Message-ID: <dxjg2sdyxb7ieb4abmeyyye7qok6cczrxabpsjyjhcbehwoec3@sbbqoo4wmzre>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-2-34af2ed2779f@analog.com>
 <20260512123953.40d80bc9@jic23-huawei>
 <agMnWzMjW1LwCSyT@ashevche-desk.local>
 <sj6cpjhakyfvv6rgox6cnhl2u2tgaecugcok6fw2l7zgku5wtc@aqx3ul72vgca>
 <agMvlS3-0wvGmBwh@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agMvlS3-0wvGmBwh@ashevche-desk.local>

On 26/05/12 04:48PM, Andy Shevchenko wrote:
> On Tue, May 12, 2026 at 02:21:14PM +0100, Rodrigo Alencar wrote:
> > On 26/05/12 04:12PM, Andy Shevchenko wrote:
> > > On Tue, May 12, 2026 at 12:39:53PM +0100, Jonathan Cameron wrote:
> > > > On Sun, 10 May 2026 13:42:20 +0100
> > > > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > > > 
> > > > > Add helpers that parses decimal numbers into 64-bit number, i.e., decimal
> > > > > point numbers with pre-defined scale are parsed into a 64-bit value (fixed
> > > > > precision). After the decimal point, digits beyond the specified scale
> > > > > are ignored.
> > > > 
> > > > Whilst Rodrigo has already replied to say there will be another version
> > > > I'd like to request final feedback from those who were involved in the parser
> > > > discussions.  
> > > > 
> > > > They got very involved and I'm far from an expert in the right way to do
> > > > this stuff.  
> > > > 
> > > > I don't think David Laight was +CC so I've added that.
> > > > David, Andy - I think you two were most involved in that discussion:
> > > > Any objections to the end result? 
> > > 
> > > I already said a few times about the naming. I do not like the kstrto*()
> > > be semantically different on how they treat the input. Second point is
> > > to avoid code duplication, but this one is less of a concern since the
> > > new code is in the library close to the other potentially duplicate code
> > > piece and hence can be addressed later.
> > 
> > I suppose I reached into kstrtodec64() and kstrtoudec64() because it aligns
> > with your expectations for kstrto*() semantics, no? Those include:
> >  - overflow check;
> >  - extensive input validation;
> >  - optional '\n' in the end;
> >  - mandatory nul-termination.
> > 
> > am I missing anything?
> 
> When we add scale we basically make that not true. Moreover the code in this
> patch makes scale == number_of_characters which I think a bit fragile, however
> it's about the fractional part when the amount of digits is equal to scale.

That is not really the case. It is being set as a limit, so it does check for
truncation and zero-padding.

> To make this work as expected we need to add an additional call like
> kstrtoull() (and perhaps drop that \n and NUL-terminator checks) and see
> if that overflows or not. Since it's a fractional part it must have less
> than 20 (decimal) digits there, so we check the rv (or how many digits
> were parsed successfully) and compare to 20. If it's more, we got too many
> decimal digits.

For overflow it checks the KSTRTOX_OVERFLOW flag and leverages check_mul_overflow()
and check_add_overflow() when combining fractional and integer parts. The amount
of characters is not really important there. The scale cannot be bigger than 19 and
that makes sure that int_pow() does not overflow. The code uses _parse_integer_limit()
due to the nature of input and to avoid 64-bit division, kstrtoull() at any point
(parsing integer or fractional parts) does not make much sense.

> 
> Maybe I'm missing these checks already performed?
> 
> > > Having the test cases is a big benefit, and that part I like the most.
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 

-- 
Kind regards,

Rodrigo Alencar
