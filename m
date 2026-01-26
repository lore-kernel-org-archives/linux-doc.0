Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D900E22A4D8
	for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 15:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441452; cv=none; b=n5Z8Gw73amaC3ipr7FuNORpjxHNtnQMKhhLXkIzxKXgi4NQOVJBYbjWHAKvtFnSLFP7I/KJ8BQ0JE2shPPw6DRVRzINNmeW2nSNtT3oBRpPA1xYg2pbNbolmp6rkYmsSUt+piTiDgDSdeVC2UoSs0BpQ0rw7v7zvkDoAR5WL+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441452; c=relaxed/simple;
	bh=MvvziUr4xaQ+5ePGg8faDANvROblVFNwXkByQwc0oPo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3/TaufglVlS/CC7KxGop8lMuJttaKowYKQs5HDXMh94kaJOS6s39tlMjbGhjyPttc0JxX4JSFnZroZMdbcM4SDautO2AttqxZ3VVsg38ohDlHLwf7axlqloYxxariXk3G8QS7U5Jt1IpSgxQPlrODD1ljMobw2g6OWTBqOd3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHhhfVIA; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHhhfVIA"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8715a4d9fdso574525366b.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Jan 2026 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769441449; x=1770046249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/RN6DWG0RynJN5xF49LNlsi86bwuZ6LK/+l0lViTxg=;
        b=cHhhfVIAs2L85kEWhAi45tuk/0f7amS6jwIn2Ui5HTjzT7l7NajhQq7KB413FD5wdC
         HsCtf8eqiidsc+EdKDGyLnJEFR3iw9oSCg+4AkPNCdGgSTp1Lxv5Ikc6UoUMzZc+p8VY
         wOMQaJvM4YSAesQdOPvG0tJRBuhwIDdUa2j59Z5NWUE3lFFEQlOjAXAOCmLGJf6YW34O
         2PGCrFgkyl4K+JVVKg0SqFt0Xr7z9VccuSGToLotLBGSLKDviQnJnP24CAQY+q2kq8xg
         L3sr1NW6PASbkHUq8takkStOCHJi4f/33xn9GSNPK5APpAYA5xeVJWCyMOa/WcpC27vM
         WSdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441449; x=1770046249;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/RN6DWG0RynJN5xF49LNlsi86bwuZ6LK/+l0lViTxg=;
        b=KMuOlQCOBEcLpEFyLCbtqPWwt35PkBKQEVAY9B99Je9xmyeUmPTCgQowY6RKZp/Kfu
         6evDjvboCDIvK0sZfi4sRtjoXnMNkXNncwJsKaBtolHlVqt/oBUGbGZ9wsf1DnqSNNfI
         66ET0vDvQfTGvA3a60bD+/DM5SCDSWbb0s0vmogfbNZEpdrupSYzwh96qg2yvM7CVAbR
         rm57GEMDI/3QIMZDDZjPZLvM0cJh1pshhWI1Uy7vnofk7Mgni/A3EVUzzPydMkZTGraE
         jIFeCfBqlwCY+fst/RA6/pwtvkapxHwLVP1Sp+7pw7QOQfP/VM5niQZVp3UdxsedY3x3
         pJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkPKtv6ZfvKRzNJtpf8Trv/8UDP49/eLQU6bqSoofChR8/h21GK/ylsIqWGJQ4GWsR7C65700CO7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd8hblNxtQVe4UMll2bAtHsTGiAfa5uZVH63g4q02Y7StzADXs
	voibYuL/SxI+wl2Z51tiYFj003KCNnfIBjJAAs9WQQxf0keBPWfbMH7+
X-Gm-Gg: AZuq6aI5Y9HoTMrl5q9BgZKFUYjrOV9+EMDxZk9Sa3iIZKNwSG1zAIcs2nCfmEtJrTa
	7mgI+8TbIUxXAxcKmb1m2H8t+3GmRAb8vKRajIzVA2yB3te8tk5HiZzEj4PKGhBcbgAMzFBT2ds
	l22i7yWRKtITglRI8ImLRaFA3AY1PMlln/SeCQYwwz8xg+3qkiD7ffoadCW+Jnsu9vxezbN7ODA
	LIndQetQi8cnrJkNUkHQaSZz4/exoA5tyF/H7bwT+5Uhkno1AUUaBYUgOOzP6vpUyh4a3P5o7Ap
	BqPr3OZbBHbUs1s+A5zVCTXaGJs8cM2v7aqeUHBbpekEWyCX7xTyeyLJyZlTLcc/lDuJ5HzAI8U
	/mifdGCyFIlGgXAxl8OgfOK3eTWL29YEoqTEtn6F0atfQ+fyEE9LOsMsm4iCwEwTELa9rPkWfP7
	300IvfcSsa8Li0qR+dqD3z2ntuV7rJTaGhGhGBTXTVBtG5KFO8QAv1rCxsWyDuzBHDyWTw/AVzy
	Mnc
X-Received: by 2002:a17:907:9618:b0:b87:1fe6:f223 with SMTP id a640c23a62f3a-b8d0a739f51mr338158666b.6.1769441448930;
        Mon, 26 Jan 2026 07:30:48 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b75dbe6sm642381766b.50.2026.01.26.07.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 07:30:48 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 26 Jan 2026 15:30:44 +0000
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v5 2/8] iio: core: add fixed point parsing with 64-bit
 parts
Message-ID: <shsikp7hinoxzj7pzxopvmvgpaak4dioekh4tyvns4kv6xp46f@z5vgnisqskco>
References: <20260123-adf41513-iio-driver-v5-0-2dce812a2dda@analog.com>
 <20260123-adf41513-iio-driver-v5-2-2dce812a2dda@analog.com>
 <aXdUvRZ9NmP5Nh95@smile.fi.intel.com>
 <byitgzjli5gsq5v66topve7ip3inkk2udwhuihjdp6bknnkmos@tv226l7tek7s>
 <aXdtpkL5QUhhB_hh@smile.fi.intel.com>
 <ty6hptfh65k2rkqo6c6mg5z6vismuvyqsu3emvqarr2rbhpvcz@kn6tzjk5xi2o>
 <aXd_0uNVm8c_Fhwd@smile.fi.intel.com>
 <n2ms3esyxlegqibu4nluut3x4c4bkjxt5xrcd4gw35xxb2tipb@a2v73y25kroc>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n2ms3esyxlegqibu4nluut3x4c4bkjxt5xrcd4gw35xxb2tipb@a2v73y25kroc>

On 26/01/26 03:20PM, Rodrigo Alencar wrote:
> On 26/01/26 04:53PM, Andy Shevchenko wrote:
> > On Mon, Jan 26, 2026 at 02:26:20PM +0000, Rodrigo Alencar wrote:
> > > On 26/01/26 03:35PM, Andy Shevchenko wrote:
> > > > On Mon, Jan 26, 2026 at 12:42:53PM +0000, Rodrigo Alencar wrote:
> > > > > On 26/01/26 01:49PM, Andy Shevchenko wrote:
> > > > > > On Fri, Jan 23, 2026 at 03:53:07PM +0000, Rodrigo Alencar via B4 Relay wrote:
> > 
> > ...
> > 
> > > > > > > +static int __iio_str_to_fixpoint64(const char *str, u64 fract_mult,
> > > > > > > +				   s64 *integer, s64 *fract, bool scale_db)
> > > > > > > +{
> > > > > > > +	u64 i = 0, f = 0;
> > > > > > > +	char *end;
> > > > > > > +	int digit_count, precision = ffs(fract_mult);
> > > > > > > +	bool negative = false;
> > > > > > > +
> > > > > > > +	if (str[0] == '-') {
> > > > > > > +		negative = true;
> > > > > > > +		str++;
> > > > > > > +	} else if (str[0] == '+') {
> > > > > > > +		str++;
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	i = simple_strtoull(str, &end, 10);
> > > > > > > +	digit_count = end - str;
> > > > > > > +	if (digit_count > 20)
> > > > > > > +		return -EINVAL;
> > > > > > 
> > > > > > Not really. If we are talking about decimal (only) cases we need to also count
> > > > > > leading 0:s.
> > > > > > 
> > > > > > 0000000000000000000000000000000025 is still 25, no overflow.
> > > > > > 
> > > > > > That's why I recommend to have a helper, maybe for now locally here, like
> > > > > > 
> > > > > > int safe_strtoull(..., unsigned long long *res)
> > > > > > {
> > > > > > 	...
> > > > > > }
> > > > > 
> > > > > Are you suggesting to not use simple_strtoull then?
> > > > 
> > > > Nope, I suggest to do an additional step before checking for the range.
> > > 
> > > You mean, conditionally skip leading 0's when parsing the integer part?
> > > e.g.
> > > 
> > > /*function entry and arg check */
> > > while(*str == '\0')
> > > 	str++;
> > > /* then call simple_strtoull() */
> > 
> > Not skipping, but counting them.
> > 
> > > simple_strtoull() is not overflow-safe,
> > 
> > Yes, I know. That's why all these additional checks are required,
> > 
> > > as it does not use
> > > check_mul_overflow() or check_add_overflow(), only checking the
> > > amount of digits is not enough.
> > 
> > Why? Can you elaborate how checking amount of digits is different to
> > check_mul_overflow()?
> 
> consider U64_MAX = 18_446_744_073_709_551_615 as the limit:
> - 19_000_000_000_000_000_000 contains the same amount of digits but overflows.
> - 18_446_744_073_710_000_000 contains the same amount of digits but overflows.
> 
> to catch those cases, we need to check for the overflow, everytime we read a
> character and accumulate:
> 
> u64 acc;
> 
> while(isdigit(*str))
> 	if (check_mul_overflow(acc, 10, &acc) ||
> 	    check_add_overflow(acc, *str - '0', &acc))
> 		return -EOVERFLOW;
> 
> *res = acc;
> 
> acc can get weird results if not checked. 

Thinking about it again, that check could be done only in the last step
(20th for u64)

Kind regards,

Rodrigo Alencar
