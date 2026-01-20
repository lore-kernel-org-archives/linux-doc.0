Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBD5407568
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 10:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768905817; cv=none; b=HtD0om1DpSvyDwlGVnYOgsO4Kq84ajcm8pco7Fdp/W9bN7IWtZfqMwYUNF8CxMPWjixKzJbcrIIyuHs+mNbvbMOutfdqNdYcV+g+py8/y+ViocQa1CL/LbPNtgn4OySLTzoryQ/ZkjB8C8Gjs92UDkUmR6Eva1wLg3n2TROs9AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768905817; c=relaxed/simple;
	bh=BcFm5nMU3ZMZm/UXJGhb66QTbTXnNlf2mLPBselcsR4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7eIbABrVpC7TTm+wDi0t2/kZBp4ZiAsABwWNiISczkkFnij7Z4px00d3SkMEHPYtaTvyk8erCsmj2HNHiIHBmwqnhCaJ3Dq8we1gDVRlZC+4Um0j2isgW51LXP+QdgOcHc31+XPzkQMVk1tKre04KUb+7yCr7AJk9j27tyVI5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OzOTYWx2; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OzOTYWx2"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c52e25e644so484776885a.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 02:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768905815; x=1769510615; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=utpbPPKnGbhMn+9AUOaQsN6WKnEwWEnMON4aM/d3+hQ=;
        b=OzOTYWx2ieiqzhtPVgV+Aq9aTjxIbbVrUjo7VaSxkAVDZDoldn+CPlDROS39jyegUb
         kJ6tENdIVMkdaP72SYkTYeYKs26GQ3SLoD0StTZKBj/qT3soe7KqQzVcXbdBJZWY+nS/
         1FTsJ2DovKDjf4j8Y1bfAUUlnth8hP64ncSD95yi9FAx45IMJ6TJBssXc29V/gqXrUYN
         YkrDH2RjaQUC+gpOUex8jCBHGYVJSptRltLbDgU4jOt89z+vOZXmhmEYvuiSCm+Q46f+
         LAUjMqWhI9C805CfhVo629K+cHm/d3zuUs9PC/Hjpwo4e2XkYjS1TLWNI69SH0NbSGPk
         K//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768905815; x=1769510615;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utpbPPKnGbhMn+9AUOaQsN6WKnEwWEnMON4aM/d3+hQ=;
        b=PObjDyRTDBSYH6f4sf9HnczJREirSmHS+XT3ePRm4dGYZvjp5kBKP5jiHBf79wER4k
         dOiqEA5vj8YWnwwiIb3CW6JTDgqVB97uLD7zP75A7t1T5/lLik1Q5WZXdeY3XxrVDm5F
         QxvwQ40IvqayYwmpG7xR3TogAEwMiPdAWp9yxBKfPBhuA0WTI9Zep022peRNc9HEhFeF
         0qCuQpPSUpzLvYX9ppc1McL97P9mhCpiIi+WLx2cdpMyb8AmHZGnDrQbM2vtp43kKx1I
         8Cgr0gw8ckRvuy9cs5HHtPNWR+Pr3qthDKx1mWSnU0phkaDu/8s0r6ME4PsEmkSI9atE
         5erg==
X-Forwarded-Encrypted: i=1; AJvYcCXhNo8li/gBw4SGBs8BiVuYLohJ57AxSXDb9Za4iwG4UW8hKBzdwgUaiYstsWewcc1NeQ/IcL9hoQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxVXEo2iR/ZRxx83Ym57q3z0dC8f9pOu6sTOT0gohbTZxDBUPZ
	WktAfffaaKZTxrH/5in9RhMay+0J9h74BNG7bEZljB4Gp3dENzQY0NDS
X-Gm-Gg: AY/fxX5bAzCahPZ96R3JjZ9/XDL+rCkkaoIb14HPBySowQF3s2FziCYEP/xEakgwd1e
	ckgEnErNI6kDk2sdI3u9QWmv1f4Vn7O8f/U9qELA89xTafAomcxNvVmaCEKNd48yjlSF8oLHrAY
	ZaHpS5tqU7EvdbpdG8jS+pA9m2MEWLO+yltEGY0OREAN6uLD6Pw4zxq04Xu1rqOxgIcFBFzEclM
	crQpYC9Ath3km8viMTRU/bJnqEcJbjc+yIdv7WZ64MahbgqAp1hyNYmKnQeN9r9WUtiG85DSiX6
	EacLz/V2VuDVuL993H/TE+ku11YcrHLCK+ueoQ9YPU6LgebzBtGSPMvzhjUB4/FUqXkK7CqFIeQ
	yKQ+VrGLFjEaza+AnCD2w6CP34MgdQzaquQNxcn8pPT+HpbgYNp97ck5Crif5wtH4JeF4Lkp/wg
	juuG60PenGlctkB5KoLhNzugFFBJh0vC9LuOap+4m/UZUJYiM4QlLoD4Csa1N77TqrabcHXqDR6
	KfF
X-Received: by 2002:a05:620a:700d:b0:8c5:391f:1dce with SMTP id af79cd13be357-8c6a68d97fbmr1946565085a.28.1768905814782;
        Tue, 20 Jan 2026 02:43:34 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a72642fdsm977531985a.46.2026.01.20.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 02:43:34 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Tue, 20 Jan 2026 10:43:28 +0000
To: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
References: <20260116-adf41513-iio-driver-v4-0-dbb7d6782217@analog.com>
 <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
 <aW3dxuelYDM67pqZ@smile.fi.intel.com>
 <texwv5s2tvcy34bwr4iruj5xofmea663pwletmpqpuh66zulmv@m7qvjgqbhalv>
 <aW40ylvMwVhqNQMw@smile.fi.intel.com>
 <hgy3bcrqqsvt7pobhnzuvwzhb2taetpxltkaxpigmmlvmlirod@v6anhmrsvv2r>
 <aW5kk6K30Izckvg5@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aW5kk6K30Izckvg5@smile.fi.intel.com>

On 26/01/19 07:07PM, Andy Shevchenko wrote:
> On Mon, Jan 19, 2026 at 04:37:09PM +0000, Rodrigo Alencar wrote:
> > On 26/01/19 03:42PM, Andy Shevchenko wrote:
> > > On Mon, Jan 19, 2026 at 11:21:59AM +0000, Rodrigo Alencar wrote:
> > > > On 26/01/19 09:31AM, Andy Shevchenko wrote:
> > > > > On Fri, Jan 16, 2026 at 02:32:22PM +0000, Rodrigo Alencar via B4 Relay wrote:

...

> > > > > > +static int adf41513_parse_uhz(const char *str, u64 *freq_uhz)
> > > > > > +{
> > > > > > +	u64 uhz = 0;
> > > > > > +	int f_count = ADF41513_HZ_DECIMAL_PRECISION;
> > > > > > +	bool frac_part = false;
> > > > > > +
> > > > > > +	if (str[0] == '+')
> > > > > > +		str++;
> > > > > > +
> > > > > > +	while (*str && f_count > 0) {
> > > > > > +		if ('0' <= *str && *str <= '9') {
> > > > > > +			uhz = uhz * 10 + *str - '0';
> > > > > > +			if (frac_part)
> > > > > > +				f_count--;
> > > > > > +		} else if (*str == '\n') {
> > > > > > +			if (*(str + 1) == '\0')
> > > > > > +				break;
> > > > > > +			return -EINVAL;
> > > > > 
> > > > > > +		} else if (*str == '.' && !frac_part) {
> > > > > 
> > > > > This can be found by strchr() / strrchr() (depending on the expectations of
> > > > > the input).
> > > > > 
> > > > > > +			frac_part = true;
> > > > > > +		} else {
> > > > > > +			return -EINVAL;
> > > > > > +		}
> > > > > > +		str++;
> > > > > > +	}
> > > > > 
> > > > > With the above the rest becomes just a couple of simple_strtoull() calls with
> > > > > a couple of int_pow(10) calls (and some validation on top).
> > > > > 
> > > > > > +	for (; f_count > 0; f_count--)
> > > > > > +		uhz *= 10;
> > > > > 
> > > > > This is int_pow(10).
> > > > > 
> > > > > > +	*freq_uhz = uhz;
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > 
> > > > The current implementation is kind of a stripped version of
> > > > __iio_str_to_fixpoint(). Would you prefer something like this, then?:
> > > 
> > > Do they have most of the parts in common? If so, why can't we use
> > > __iio_str_to_fixpoint() directly? Or why can't we slightly refactor
> > > that to give us the results we need here?
> > 
> > __iio_str_to_fixpoint() only parses "int" chunks, adf41513_parse_uhz
> > was modified to accomodate the u64 parsing removing unnecessary stuff.
> 
> But why? The fractional part most likely will be kept int (it's up to 10⁻⁹).
> The integer can be bigger than 10⁹?
> 

Correct, integer part of the frequency value goes up to 26.5 GHz
(uint_max is approx 4.3 GHz). Also, with the dual modulus, the PLL can
achieve micro Hz resolution.

Kind regards,

Rodrigo Alencar
