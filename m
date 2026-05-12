Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6699027E1A1
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778602184; cv=none; b=sVqo9ZnyMyA3xsgbT7YT/NnNUfBn0As+3CGaRy4vbVmashVR6wmH5UnqmeGpYtIb9KDRmDdwV9tjj+J4UtUzIzh0yYamsPRDFsc8IEasAn996JpDvIxwGLFD0dgcZigLplJm1Z/jnpefGiqImR1HaTP8cK9ctM7QMUYE5xcvtfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778602184; c=relaxed/simple;
	bh=3DX+Rca1nRAlC0Y/CMzTtz4gGTTY9EHGBBklGO2y5Ks=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWhsxZt/CN5EC8egW/48WRfFy/iXhFGjhFXJxeVRqD+wKpiz4ywR56Nz7+GcEyq0F1KqoKguxJ93i0JwtpHiOApCgDEgpPJ1ipVtGXYo1krVxPrdL2n7VAYHNuRastKjKSVA13YlhDxNbH814P2EO6NYjD8rmLswyqCa2M5PPe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q90DWDLL; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q90DWDLL"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so9407118a12.2
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 09:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778602182; x=1779206982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I9hIm7lzas2SuU6DZgX10mn3CRFrGahP/pnGCzUnmz8=;
        b=Q90DWDLLHA36SrGLhW+9A1kNj9l0GqxxXpstExQjUi3OV6b7FlFWpnNBh4fqvyStRo
         /4JwjCfwgloUE2/hTFZAwdzrUqPF4SkIYd0F2qHNi/DFmzlE1K3ZGtrwlydWIjUuqDk9
         WFG+cH5bg2OPfSsw6WiHAeEJuEGWxZr/ATQY4hcwk6zgOClK77MmIJmIlkUViZncGcDI
         Cx0vNUeHKVghg1N7GcfL9kGirWjtUTBvlEWkMefE5nb774hkn0DWrIHLn7nVwDBxcWi5
         cd6iTdI57oWPYEYkyCHOHoSHOV5uk++eHdBQuPbmN1qZdWsMnP/CG94pF/1/MHXWgUMd
         ADGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602182; x=1779206982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9hIm7lzas2SuU6DZgX10mn3CRFrGahP/pnGCzUnmz8=;
        b=RVe4Nz6jligrMVomxANdLhvGEgelEMZCPfEQW95M65jhlrViNiTOo0mrmiJcEqznGF
         KL3RvUnXnZTCnK76ZpokjBpByAJ6LuHRn+tVTg03J1nxfUNsDM0p61kwVSvaUBMYGSMz
         xlm5TukdsUyxA32pBLZZ5Q0C5WV62Gwikn/ix7aF3SHnw5YHbT9KdRr2Y3LdXXV8jMxA
         zUmTnFcxhlAOLOUK41980+l0uc99jqh1JJ3JT0yGzjfXfMbYtBHg4z7Syn/KoCkGrwci
         wTGW9HS1cIfGPcXfx3RUT9lEQmFV6jsYTjjAuoj6koZmh2QxH/VFfOFy0HjaYp+M98wP
         VSXw==
X-Forwarded-Encrypted: i=1; AFNElJ95peskQvNds3DcTQZgHhhmuAfgZlMjxbpgnC/G3uk1upqR1HsIWKuNgeLhH8gNx4FeaDHKCEuIbBM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBpO0i/gfvcEdZFwnbvnYYS4Ry40lXuisONkElx3Tsb+Bx9OD
	T7ze4zJCNuuOwR/E7mijw55NvXM1DPYTsAEUAk0WRIB36r/7u6/LxwGz
X-Gm-Gg: Acq92OE9x5xa0LVyPY3kYE17TNucrA/byOFYmDcbg4yErA1wbEhUUweniTELze5rRXY
	CEl3g7rO0CAUxGEEDE8QE9xhH957PXsI//IDbQz1kOIsGyGAzzg7OvcGluDFUhi/qusfMB3oHIP
	p+loVlTKe4h762ZK6UwlYG/CBa0aR27dPe2AGZTu1xSUHTY66RstHNgSTu7loofY2b5W8Y1QZuw
	Wj8II7QeN1BNc6VmWeCNaxLqL9+ue1qRIsex+NjhR2MoLot8jQhWTeX1/A4y6nH9UfJs4oZGJpP
	WVSzPxED5oSrE0sa3RZO+jvTasJHuZgDKuMp7NW7jJXJHvt921QVdGFT63+KRTUVgrGn8wahpmy
	1TMbPCW1giQNEfMIZog3pFoIcCWKHKKyqGhk6qPRSLZB31yqTVgri+wVgLwIpWZT1bXvhvXVt+z
	nRkRAo5zl7FGsHKHIR7NoXuf1U1Gb99OO5XpnRSOHqe2KdNFMfvjVAZ05qtDVxOjXT09cowW2QD
	j14oPIIrCxoYxtTd3pL7Ca5qRNU9LQdHFMVd2DFlXKIKAyy+A==
X-Received: by 2002:a05:6402:158d:b0:677:15b6:4d6b with SMTP id 4fb4d7f45d1cf-680d02f613cmr2125366a12.26.1778602181689;
        Tue, 12 May 2026 09:09:41 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b8a939sm5334930a12.13.2026.05.12.09.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:09:40 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 17:09:32 +0100
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
Subject: Re: [PATCH v12 05/11] iio: core: add decimal value formatting into
 64-bit value
Message-ID: <ql7smsqza7liupm7fhdts73cxsltrpxsqofu5ovzpxpwvcscuv@qigi3dwukk7k>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-5-34af2ed2779f@analog.com>
 <agM6uzhdn7o8g9v5@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agM6uzhdn7o8g9v5@ashevche-desk.local>

On 26/05/12 05:35PM, Andy Shevchenko wrote:
> On Sun, May 10, 2026 at 01:42:23PM +0100, Rodrigo Alencar via B4 Relay wrote:
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

...

> > +		tmp2 = div64_s64_rem(iio_val_s64_from_array(vals),
> > +				     int_pow(10, scale), &frac);
> > +		if (tmp2 == 0 && frac < 0)
> > +			return sysfs_emit_at(buf, offset, "-0.%0*lld", scale,
> > +					     abs(frac));
> > +		else
> > +			return sysfs_emit_at(buf, offset, "%lld.%0*lld", tmp2,
> > +					     scale, abs(frac));
> > +	}
> 
> What about
> 
> 		/* Print a leading '-' for negative fractions */
> 		if (tmp2 == 0 && frac < 0)
> 			offset += sysfs_emit_at(buf, offset, "-");
> 
> 		return sysfs_emit_at(buf, offset, "%lld.%0*lld", tmp2, scale, abs(frac));
> 
> Also note this won't work with the frac that are == S64_MIN. It's UB (undefined
> behaviour), see the comment at abs() implementation. Maybe a time to add abs()
> corner case tests...

frac cannot be S64_MIN, it is always and remainder of a power of 10 modulus.

-- 
Kind regards,

Rodrigo Alencar
