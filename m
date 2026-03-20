Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98007191F91
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 12:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010528; cv=none; b=CvRcsBVF1xtKN1k/6BAJ1wHZoNo30amYwY9N4ydCM58zaZ3Kuf+aI7TWhnlCfnr1aXGvvPZPfHzIRlnXMrLzrKyDaDTN1MXdIHQ0PBkNAhpgEESeOxln/cu27C1U4nG6WyL3txz0HCf8SkX5b1p29qGExEa6took8G/XeoCVFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010528; c=relaxed/simple;
	bh=HwklMMHuEmJBZfQL8IwNWcmQV8JTcDfhhxmPJKLQWgQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrvUVmlvUllrXExDFuFMLi7l8cFaG3Jpf9mRZmb6Tr8Ppewr3BdXBt0xLH6taPE5uMmbGS/c7oxNOHQ3cpt1qmIuw12cZJEgabCJMnDtAQVfm+APw/b1hprIBFcSYP7I3rNBtmmK+LF9VZaX8L+xvqEd2ulIHohTwM4Urmn5v6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iCbCxIz2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iCbCxIz2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso5034335e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 05:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774010524; x=1774615324; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H8a7jdeYcOkG74XhQy98mbwT2qyiDyYFpNk1yDSPbdw=;
        b=iCbCxIz2ggk6SLCwTUp2KwLgTQ+oi5S9X2nsaciGSn9BkxQO1Vrf997OhE8b7/eBFH
         dhuNaUOgT8gOu7gcPU7BnB64wf3AnS6mm5tifXuf+zNbcYE1DTvUJuB2YlTWrkdXpL/K
         0392kVJ909X9Lib3v8lgUPhTElIcMofKz1r7D7B9yg4LDt9IBf+eMLQJBm47OW+CNxzU
         rpwaDS5+MQDcNwjLUOJluR2YtX0/4ul9GrMo+ITt49B/Hsc1/XbVQ9atZjQIDqkzy3Jm
         R7SkIeRqWeRzN+NnIqTdu5rFGJRgx+QgcW6m3RyRSW0ru75epx9H9rnScQ6hhmeEdr3q
         CWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010524; x=1774615324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8a7jdeYcOkG74XhQy98mbwT2qyiDyYFpNk1yDSPbdw=;
        b=dMVMg2i35MOx4WBL8cjDls48Q6eyWR8q5foMU7Ehnu37+zygw2Q/7gVDWfQWtYTRKe
         7v3uEIOVk23hkbW++xXFqCBokkGfULjXp5xH8aBpTIgoNAt7vsXDpZNhIfkhIShyWK1J
         R86QldqW3LFrme0OHQ30peh91QCj7P010eu0iJUeSvXWoQfqaii4ySral48X6r9UyWpS
         XlJ3XRdumSFgEFipJbMHSJm25rXvnIiQjAVEUbal28tgnOQ9F1K9RDW0rfOnuVFXNAzz
         /wcUU5BEHa0/6msodUenhQTWtzAHdNq8ZrMLTnB4nwuNLWZumT/quVFbKblBMCcs9dSV
         IZZw==
X-Forwarded-Encrypted: i=1; AJvYcCVQV2ywImedGzpLDJPR5c4ZxkRk/aPUUPOvsLDiT0/9CMaCw5nk1gguz7XH3cSEeIAd6NlE2ijv8qw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5DlGOOfxt4uM3upWLIED9tyxSKo1smNIwRs+FUu0SJ5UJd1I
	o1l57izk0HVZ74FNeKsTPrdnDn0dISUcFgVEXLAiSJ1J179kYxub4KaZ
X-Gm-Gg: ATEYQzx6TOPOjOv5TkcmavswUNHS0Oqa6fuSsm+Sl13rI4nJ0vdAGhNyQsw0xjITpsg
	KOBKLN/jq6IOhkSxRgTYIfgrcu7Xl0szSvI1fSfeYy/RHe4DCfs+TbdClxhWsaWJvCGHobvdti5
	vygDixhK4yasJiwndOs5BmzG5yXrEGseVEqVfvr4j/t3ucJz+1Xx7+I0IoryOEoPE5FsgUT48LX
	Refw53Webs/JfxtGu/apWQQu4sskmFwSfrRmjsQRI4/UDMACGUCXZX43LJLc0HW2kpmcxNoigHN
	qmNJKJ75sxZ+Li+6l5jlSEB32h/yYWgOhZxavNhagAHQTDZpR8EQCESrHRnazdMvFcZhl4bACIn
	buIvImXUGkZFer+Re23esWd9M13/AC0Ka2qRnXJpdJsoMY3PYcFzqL9bIkqzYo3Qf5zRRGW1HPx
	fy2qbwp7cj6TThzMzHJxpq0jvxVTiuFLmZkbr5eu+ZbTKu+Pq6E6Tp4abx4VMfugdI2b9bAE5gM
	kPd1Pcr7yjEyERnpp7lbO+eoN55fwJTbSycrmbeWOWlJrW9v5c=
X-Received: by 2002:a05:600d:8449:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-486fe8a2bafmr39506145e9.3.1774010523562;
        Fri, 20 Mar 2026 05:42:03 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe7e2665sm67966935e9.6.2026.03.20.05.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 05:42:02 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 20 Mar 2026 12:41:57 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <qsquhriyrepndxwexox35oi5i7v4klb64lajuk3j3pfozkjiew@fp55l4znck4o>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
 <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
 <aabm23jCikXs1l6F@ashevche-desk.local>
 <qcloiwjlbehs4yyuttvrt46monh7isef4d5nzuwlaby6uxfael@j3trvc5jwosy>
 <4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6>
 <rygken7oujyoupeanrdnl7r7smesa7js6sn3jsafbajc4sm3jh@adeslfqwwf3x>
 <ab00clb7LL-bmJWe@ashevche-desk.local>
 <ixvzb5mni2lhz733f4fvvzhozmpezkx5s2q7sash3wv3u2g7ov@pgs6pve6kxrq>
 <ab08aHbudFWEtLi8@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab08aHbudFWEtLi8@ashevche-desk.local>

On 26/03/20 02:24PM, Andy Shevchenko wrote:
> On Fri, Mar 20, 2026 at 12:08:41PM +0000, Rodrigo Alencar wrote:
> > On 26/03/20 01:50PM, Andy Shevchenko wrote:
> > > On Fri, Mar 20, 2026 at 11:16:32AM +0000, Rodrigo Alencar wrote:
> > > > On 26/03/04 10:02AM, Rodrigo Alencar wrote:
> 
> ...
> 
> > > > could you provide more feedback here? Thanks!
> > > 
> > > I don't know what new I can add here.
> > > 
> > > My suggestion was (and still is) to have something in *_strtoull() family
> > > with additional checks added, but no limitations on the input string (i.e.
> > > no max_chars).  If you look at the printf() code the max_chars was added
> > > solely for scanf() and has no use otherwise (yes, I know about and aware
> > > of initramfs case).
> > 
> > but is it include/linux/kstrtox.h the right place for this?
> 
> Seems so, there simple_strto*() are declared.
> 
> > *_strtoull familly... then can we just expose simple_strntoull(), which is
> > private to lib/vsprintf.c, by changing its prototype to expose a error return?
> 
> Why do you need that? I'm lost, sorry, I don't understand this big desire of
> having that max_chars parameter.
> 
> > In my case the limitation on the input string is useful for the truncation of
> > decimal places when parsing the fixed point value. It would avoid a 64-bit
> > division.
> 
> How is it better than checking the returned end pointer? Just treat anything
> that parses too many digits after dot as invalid input?
> 
> 	ret = ..._strtoull(..., &end, &result);

here I would want to pass max_chars as the precision of the fixed point parsing

> 	if (ret)
> 		return ret; // overflow!
> 
> 	if (end - start > $YOUR_LIMIT)
> 		return -EINVAL; // bad input
> 
> 	...process result...

otherwise, here I would need to check the amount of parsed characters and
perform a 64-bit division if it goes beyond the desired precision.
Also, having max_chars allows for more flexible usage of the parsing function.

this is the prototype of simple_strntoull() that would be thinking on expose:

int simple_strntoull(const char *startp, char **endp,
		     unsigned long long *res, unsigned int base,
		     size_t max_chars)

that would also allow to drop the existing FIXME in simple_strntoull().

> Some (stupid) thoughts loudly. IIUC even if we implement '%g' in scanf(), it
> wont help you as you want to have more precise values. Do I get it correct?

If I am parsing 3.14159265359 with 6 decimal precision I want to stop at:

frac = 141592
int = 3

and ignore the rest.

-- 
Kind regards,

Rodrigo Alencar
