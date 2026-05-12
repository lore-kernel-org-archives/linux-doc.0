Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692F033D51A
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 19:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778612484; cv=none; b=EqaIbIGQ6oAu71ZxrvlfkxMeiEhlk4JffC+mGl4jWp1ZL1xzcccsNd+AUL1h8PLRyuF4D4a+6zBi6p80UMX+tn8qYa0goZoy+WvDOtTzObEzVVC96Qx/IkMRjG8nI/3DsZlbkfaL20lkucze3rsf68ggGctthwJEfqOfdygd4Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778612484; c=relaxed/simple;
	bh=SeD74GBi/WomNdZYaNJemftdaB+eK35ZhAEI9YJm9K4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxiLbxwOdnNrU4VNaP8rRR8o5SZqeqb1Q4MnKOcgSngO65looOBENPvtCIkj7xisuM4dBlqu3K47D5D5Pw8iypA75uXtQJMHCO019wkyCTagCI+HQnBC+d75edhfb0xZDQP8EfBMcliJaYOGLnqaQUvbn+8gIv/ldZ2JpaW9NQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m72a46az; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m72a46az"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so53470975e9.0
        for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 12:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778612482; x=1779217282; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JfVrzDr86zATEwD1OuodPd4t6Fj18Y970qlap5qDmRM=;
        b=m72a46azprArlIiQaehve9LLM/bCBXAENf2OiFcAC7x7juTLUxIudkYCYs1z1+d+WA
         K7WTmZSc3BWFpTGzqk5pBLB+yt/U7/ztVeCxAnN5RZIpl1WbD0qx29KvgAeb5/WTOFyM
         4tNZHY4xIk39z1SQiGYUwCzAR0lYyCG7wxbfWRDvQOQzZXJiQC8vCI5kov8NndsWZuI5
         MC0lBywBq19Yv9SDm83fb+8jQ4x+G8ZTwWvilfHDziJpG5Frg6frmticLdAK6177eZgC
         oFkmGUBev6+HnKFEovWML5dC8SMO2qHX1UITg4jkOfRl9eOF5eaYdA3vGJZsn8LH2BVt
         ksEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778612482; x=1779217282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfVrzDr86zATEwD1OuodPd4t6Fj18Y970qlap5qDmRM=;
        b=ECXmrXiPuWBXTHa5MyJjvS5yJF3QuxB8Zrr1zjZ9+peBVb27J0lOY0nBd3ueyxl/d7
         1klMR2AipxLGQ26krLFk2D8B0sFPDL2cDP1VC2uEn/6bLhn04jMA6Mf+rS7GGT8Aqwag
         QcBhZtrZ0+9JnHPPM1xBEYOot7tL5as1yHSoeMsPbphsmfCHQHavfuGau4n9Gu7X4PXo
         l4ldpugjLMxb2ygkpkemErN/RYtFe1ivqpjgVbDMNJWgiUudiV0mIc74BD+C5ztuGCFe
         C6uaxTfKGHM2fPSj7PdY77k73SAnbEcQVf9oZAWfP8oqFlrpWIv8pypOn+YhKJ63ZVIv
         fYLw==
X-Forwarded-Encrypted: i=1; AFNElJ9wuDTBFoUBMLFI6HcfrkzLBtV/LHYTD2BEEqVQRP12pd+PqzHOKvt71gJ4Ss79UWISt2WopHpSAxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIw7aBGFKYL5sJRe7QVxwzNiqLvNW3Fu2J2oKi/Zu0UOZZwRIu
	qvLW7EIqmEjftLKp3LTHXbjbUM7hkgJljSrJ3UHDXsJy5LnxblrxyEov
X-Gm-Gg: Acq92OENrd3QI4yA1ymkFjzL91rb6pj0hqvULUhcvug226vfnI+BFJM2/JLp9eObO29
	dwKbKy6f5VjjR70pvRgmF8H/VY0y2QEhTDUYRyoZfeKRsq+Iu2uyVn472N3Kn7vxRxpbxNVNf+Q
	bI7BMn3pa2xF4ArhJQqtJCkKPYFhJjy39AITJ5L+7a4n3S/uyK+WlXdu+OrnNU2inrpx+MDoTpR
	UEodpLYyt5GeodcZIICqs1FKLxdhpk9R2/D/ECGdBrnsvNFjB7dqS5/qoUa9giiCZUP9rROMKvS
	dctsFMwWcBg9EhgrWiuFJeZv6sAfL5tSybQuRgb0+fFVcGXS+FXiMyBkNcqv5qxpt3BIljZTHfT
	pXDBlH4Bpe0nXuNWH3cdo4GzxZw6MCLwNi9J1cEvQ/wktOAdChfAyJ/OwHxpKKpY11PDRXym/6J
	Gcw4PrjXgwUIDJ8siFT+JDvYNfCSjoCgP1TOF71HpNYVuWLM4Z9fhDVQcISdYf82CutD7C4QOgP
	YDppTkThOWE6ZKOoQ7Vv/HbIdp2jvxC5iswwaS1i+Be33aFIA==
X-Received: by 2002:a05:600c:8b56:b0:48a:599a:3716 with SMTP id 5b1f17b1804b1-48fc9a45891mr1464025e9.23.1778612481673;
        Tue, 12 May 2026 12:01:21 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d1b100sm17867995e9.4.2026.05.12.12.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:01:21 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 12 May 2026 20:01:14 +0100
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
Subject: Re: [PATCH v12 05/11] iio: core: add decimal value formatting into
 64-bit value
Message-ID: <b6wjjzv7wpyv3cpgftltu7sppttmrvrqxcs5b4gre5d7goknqd@vlhenvjct6la>
References: <20260510-adf41513-iio-driver-v12-0-34af2ed2779f@analog.com>
 <20260510-adf41513-iio-driver-v12-5-34af2ed2779f@analog.com>
 <agM6uzhdn7o8g9v5@ashevche-desk.local>
 <ql7smsqza7liupm7fhdts73cxsltrpxsqofu5ovzpxpwvcscuv@qigi3dwukk7k>
 <agNoKbcwT6_spC93@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agNoKbcwT6_spC93@ashevche-desk.local>

On 26/05/12 08:49PM, Andy Shevchenko wrote:
> On Tue, May 12, 2026 at 05:09:32PM +0100, Rodrigo Alencar wrote:
> > On 26/05/12 05:35PM, Andy Shevchenko wrote:
> > > On Sun, May 10, 2026 at 01:42:23PM +0100, Rodrigo Alencar via B4 Relay wrote:
> > > 
> > > > Create new format types for iio values (IIO_VAL_DECIMAL64_*), which
> > > > defines the representation of fixed decimal point values into a single
> > > > 64-bit number. This new format increases the range of represented values,
> > > > allowing for integer parts greater than 2^32, as bits are not "wasted"
> > > > in the fractional part, which can be seen in IIO_VAL_INT_PLUS_MICRO and
> > > > IIO_VAL_INT_PLUS_NANO. Helpers are created to compose and decompose 64-bit
> > > > decimals into integer values used in IIO formatting interfaces, which
> > > > creates consistency and avoid error-prone manual assignments when using
> > > > wordpart macros. When doing the parsing, kstrtodec64() is used with the
> > > > scale defined by the specific decimal format type.
> 
> ...
> 
> > > > +		tmp2 = div64_s64_rem(iio_val_s64_from_array(vals),
> > > > +				     int_pow(10, scale), &frac);
> > > > +		if (tmp2 == 0 && frac < 0)
> > > > +			return sysfs_emit_at(buf, offset, "-0.%0*lld", scale,
> > > > +					     abs(frac));
> > > > +		else
> > > > +			return sysfs_emit_at(buf, offset, "%lld.%0*lld", tmp2,
> > > > +					     scale, abs(frac));
> > > > +	}
> > > 
> > > What about
> > > 
> > > 		/* Print a leading '-' for negative fractions */
> > > 		if (tmp2 == 0 && frac < 0)
> > > 			offset += sysfs_emit_at(buf, offset, "-");
> > > 
> > > 		return sysfs_emit_at(buf, offset, "%lld.%0*lld", tmp2, scale, abs(frac));
> > > 
> > > Also note this won't work with the frac that are == S64_MIN. It's UB (undefined
> > > behaviour), see the comment at abs() implementation. Maybe a time to add abs()
> > > corner case tests...
> > 
> > frac cannot be S64_MIN, it is always and remainder of a power of 10 modulus.
> 
> Okay, but what about input of -0.9999999999999999999 ? Will it fit the signed
> frac type?

For the scales considered here it would not be a problem (*_PICO = 12 + *_BASE).
For the max scale of 19 it would probably fail the parsing of the fractional part
with overflow.
 
-- 
Kind regards,

Rodrigo Alencar
