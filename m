Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B85B3B5309
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 09:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770198181; cv=none; b=Yvxs6CuXKXE7mgRkzIHP3VUZH+af5hG8C+vjJXeWB9s9JJyaU1/LFc65c7TitpajwnQJu/BoHN2wfINiHZqN0BBnWZEhhlis72qVchUI98kX9jQNCnx37ehH6pQLfQs72wYV/Tz0RKDCB75cicpjOr+P17RNrokwzL7SIJGGxLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770198181; c=relaxed/simple;
	bh=hGwBf1cUBZVW0moEL2wbt4+Dz7qCO/Yl0iuemeryZME=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eXv1uZM5yc3+Heb6p37Bu4urJ9I+nPvFuBz0c/awarxDHQmU0yrLZ9KWkKZMhQUWDcslkAROp6K5SUV+PW9w4Smo99LUY/J71fAYMtmbvsse1nY6jytBWS39uzEF7PQng6Sj5qv1Ue36Fvl/7Vi1lgtzID4Jq4GIx4/0LJTaKvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsUc+u/v; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsUc+u/v"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5594836f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Feb 2026 01:43:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770198180; x=1770802980; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s6noyEhcNwk/Aw3tl3/LJ2DrKHWXMyz7JjWPgqeEx4o=;
        b=gsUc+u/vtiNTkp9t7nP06pMtgtzz7q3dAWjPNuYNpbCLA8FFkTuoXlqh9pjxp1m9i0
         pd/DyxUr26ND8EoErfFGCkKN2mY0ynopnX9tluDGUG5lg5T3Eiz4SSypA3qaJbXL0BMF
         4A+dLTGDN3P76vBUv7eVmI/vjjtiOkt+ClOzuivj6kGHEIPVrwXLZDVbf+ieXcyInZP9
         1SoHCMa5ca75AHg8ypzP/rsAfuf72NrSGTHGlYTl5QsfxRgCBD6bWSem91LkVLnqyO0I
         ou/tZNwPejpq/koqlhmpHiAqfZ8Je94dR+xzHF/Yq7JyItPYVYB7sAu+5ANuZSNGEcmw
         bnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770198180; x=1770802980;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s6noyEhcNwk/Aw3tl3/LJ2DrKHWXMyz7JjWPgqeEx4o=;
        b=Oz70kZWiDh9CFmtnFoLZmXgSLBuI2GIhcUB6pgTsNwaMX46X6BABtVrcXPKJoCBziL
         ypjpzXqRdihv2TCWWaYevyIET5Y7Q54cf1juRjGHJs7AKdzTofYoGqPwR5UGWOxvFWa6
         Xqv+syZ5gIuzyZocn7NUVLlzpVvg/qhfz+jvV7rZfHXWZazZsYire/XMpUBVL6ax5sao
         +OjbLK6cXJg6sD012YoQ+CLHuJI/IS339LbnTcik6NfsqbLNt6B6zW3oUV+KCh5qHMfC
         F7KlvbmA7ENbU/yBZ/3veAEfgo2l7qp6Eg1Uj3si1NR/bvi5V7UMoEg8SSJwMm11HdsP
         1ZEw==
X-Forwarded-Encrypted: i=1; AJvYcCV20N17GeS5NNluMMsnmpmgPJXppXnmxBvJiTyEDV8fcheqQGYK5SODvRFU96wIrqAvAbZpGVUIrz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl4BSr2LaBTgd/a2/BXLW+xa3wj33vGYa/VWppzewDyXWbTgsn
	5IyKo0OgFbWZH93yjZk/Vuasm8wIqKokBQras0ScQa+3XaaBlSPOYOuf
X-Gm-Gg: AZuq6aJK4uHO/WvJ0cwQHTNqy+mHnJlcqCkS25v4SFN62o00+F1GISw9wFqO5nU0z72
	B4AkN1ZJqvfZULOv6QNrzlowrMpWSItMt3EODQcL1I0NlKrhsvFCOZut5rOROWqJwTbxOHCOrv+
	uqrvfVciDxRF2lY00DzUJuQ0h0iGDtg8N3QE7G9S8qiaDNsbj18Cvg+gV8KKqDEM4LYT7oznoeI
	Rkl/8OMzT/X61F7qgpKwg7xcKPBOGujrtUC1dYxe/AS8r+1U5i68H4FmWDO4NtwAJAf1YsexOGH
	rzoVlmTS4izT2AnoTf+o1D/d9m5umEw91LFfFa/Qnq3J2pOSHQTtVdfrI8LJeVhQrHtymiqKO/E
	UUKMVvNmAXFKNOZRwOiRP26DXtMvG92t0AGmMGAwku9CJxf9aCqpIaNt+JMrhgMtY1r9cGNZ58h
	TIP8LjvDUFQvYEck3+mLDoBzfyq+Kq535lQiA1ErOBtaxhid6PILTRPUoO524PnzZcZIg15sl83
	X4L
X-Received: by 2002:a05:6000:400b:b0:432:a9db:f9a2 with SMTP id ffacd0b85a97d-43618053ca8mr3252156f8f.41.1770198179457;
        Wed, 04 Feb 2026 01:42:59 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f66sm4791738f8f.25.2026.02.04.01.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:42:58 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 4 Feb 2026 09:42:55 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v6 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <7tiv33i65unu5ypk7puj3buzybykyhv2qbwp54bhcem5t4rawq@dpfedqmmxbhx>
References: <20260130-adf41513-iio-driver-v6-0-cf46239026bc@analog.com>
 <20260130-adf41513-iio-driver-v6-2-cf46239026bc@analog.com>
 <aYKkv3dq9Vkm3s_3@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYKkv3dq9Vkm3s_3@smile.fi.intel.com>

On 26/02/04 03:45AM, Andy Shevchenko wrote:
> On Fri, Jan 30, 2026 at 10:06:43AM +0000, Rodrigo Alencar via B4 Relay wrote:
> 
> > Add iio_str_to_fixpoint64() function that leverages simple_strtoull()
> > to parse numbers from a string.
> > A helper function __iio_str_to_fixpoint64() replaces
> > __iio_str_to_fixpoint() implementation, extending its usage for
> > 64-bit fixed-point parsing.

...
> > +static ssize_t iio_safe_strntou64(const char *str, const char **endp,
> > +				  u64 *result, size_t max_chars)
> > +{
> > +	u64 digit, acc = 0;
> > +	ssize_t idx = 0;
> > +
> > +	while (isdigit(str[idx]) && idx < max_chars) {
> > +		digit = str[idx] - '0';
> > +		if (unlikely(acc & (~0ull << 60))) {
> > +			if (check_mul_overflow(acc, 10, &acc) ||
> > +			    check_add_overflow(acc, digit, &acc))
> > +				return -ERANGE;
> > +		} else {
> > +			acc = acc * 10 + digit;
> > +		}
> > +		idx++;
> > +	}
> > +
> > +	*endp = str + idx;
> > +	*result = acc;
> > +	return idx;
> > +}
> 
> There is a development in the parse_integer in the lib/. I reviewed that series
> and hopefully it will go in. With that done, we better reuse the lib/ function.
> 
> https://lore.kernel.org/linux-hardening/20260202115451.290173-1-dmantipov@yandex.ru/

In this patch, I see that it updates the overflow check, but I am not
seeing that function being exposed to other kernel modules.

-- 
Kind regards,

Rodrigo Alencar
