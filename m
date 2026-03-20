Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3B39FCD7
	for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 11:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774005399; cv=none; b=sz6KQsHAEnE4DuM88coZJO431q0wvlNWIQ965yuBDfpOZ8bWfu/xLiTr6wmBYmsqbZ4oahCmHsmvQDlyIv2iiXTQohLfoxeVRQd9ExT2U/eebWA/bgMX1vd/nDwbdle+M1ATAPW7MzyFZkLwp/Gb6Axm+g2kKn/ngjwdCl1u45I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774005399; c=relaxed/simple;
	bh=MYuFIo5PKIOTB/+RPLOxw/oWCfZXFKo2lpXW4JtUSoA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SvSrfKJ7tkHJpR7Vyqfy73k/hwKcDZkbS30I1nql8k3cfk3ifkR33cgFmeiAlD14L5LdfvbBwyQhu3HCY2HH0QZT/Mg227JC7UTPuTOzOdZDq+dwvYbXrgnkv2vIbWWqNzW+CwdnTdW3g8TTZUJfnh34OSKCoUkyXaZn0T8Pm48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPQp4JxT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPQp4JxT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so14437115e9.1
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774005396; x=1774610196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UU7k8y/47EnkOnpuLl67VB38/rE2A9EJgbrmAlOoe7w=;
        b=gPQp4JxTTiPDZ6X0T2sgvUUEj8pXY45paXdH8gkXVdFkQ5Qv9VEMKdbk1YueSxYWCW
         5ox2ygd8IPXdzlDmNvkW+iAMNziIZV1hKujUFj/fd9VMR4JYjjp03dzosdVyO3E0S6cR
         H1dGKzQL9+W5SXXXoXZtke0sF6V+jpK6bU0ep9UdrMru1qJu2IGRRK/t3JqX9yAQd5eS
         ej0Hn/YT/VjuD/IjdYbTW5VC+PGhbGJiHQfmPOZlW3O2PtXhQoAlj4BcJ+SKeugTyhnv
         voKg/rk0TCZ7Cw6WTrOrtYdxSuWVPSAm8VhYeerfbWa4TWx1V475YiP9c6npZ+uIFYzh
         kC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774005396; x=1774610196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UU7k8y/47EnkOnpuLl67VB38/rE2A9EJgbrmAlOoe7w=;
        b=onoSInsjXSqfBX4gqSwSFquFN5LUT0lG4B2xZvDN6CB4QlEM54iYhzpaPihV9q79cG
         addGjxl89XddvI/bu5huIvvvef/W/7rjPCCqG1+7aR5ENhQzDFYOuAdT/WVR0ZtGAVxM
         WTbXjJnfR9wVdilDyFPeHIerH9zotG11m/ForrxagtncTmrSxtDrepE93/jiIS9sziN8
         v79SDJRCJoc8/dzkLRmaACAM2TOQ/ekiIZceLSjOm9lXnh9WkbeJDNDOOrkt4Kf1a9at
         txAkSwjKOj+a0Xb8hNufsYH9/LdPTdqUyi5hdlqXz5Cu7VfE14KRFohaS4Duegq/8FZS
         //6g==
X-Forwarded-Encrypted: i=1; AJvYcCWxw6VuPQP6k7wGaRvUO76HL0Qg6NmYz0eg75/qEAj7MeO6idj5FagvOIh8qS7YNigwGj2YxEe41P4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUVFPncOzjalQRs0S6WR/TFSss6a1iBp/q/psRwZQGTpMrEbRi
	0rByop5wdv+ZMe2G3Nl+SWboYIu5/eW+PNrYJKozfQytYZ0p6GQY76kb
X-Gm-Gg: ATEYQzwwF6IYCe638f7wi1T+2hTGkYGj3YRLO61UfK1619dn9SOsXt5N/cPvvxPNNGN
	4ujODkkCV8L3kMDEWBfwrvGC/n3aTEIkXXIbiOr2FBoLuaC+0cUg5bgtzmHdjxhfhSpmnM3trXv
	4L0O9qFWwiy6Dk0BMjJ/jGSVAZUHh5K++jJ5WkrX1rQ1pyC/1VIa1m5mMaXZduJN1wV3gzOVtb0
	f0YONbMaA6/V41tabMp3vkciEgLxJN6Itg7gddtzmN4NMJFRxC/f0BDDmHvx/vmyy/dsZVjbXe9
	9+xzd/0KsVRpgO/oeKTzr8HMrO9uA+qjqn8ZWB0CaL8GCqXuTt5pKEF0uAANr23J2cSY4DZI39g
	kuPvo7KZP/p7ABQfMMUKxqsqShwwOD8vaAiMgEZx3+oh+FikE3CCiMX2m1FZKI4OpJ4o63ytXUH
	lhU/OYXzt94L6egYhlkQljmsalOnMiVpTtsXKFgZ0XRhLDUFcikWXk6NKn+sfB0RhmObf9fb3hK
	6S39jHj9bTLqXhTeQMwbUyzRaDHbH2FHeamKMW4oHNdeNYsPqQAuvZuZYQl+g==
X-Received: by 2002:a05:600c:8b61:b0:485:3471:cffb with SMTP id 5b1f17b1804b1-486fedd8164mr37626435e9.15.1774005395763;
        Fri, 20 Mar 2026 04:16:35 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.131.netskope-rdns.com. [24.206.116.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b647036e0sm5667505f8f.21.2026.03.20.04.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 04:16:34 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Fri, 20 Mar 2026 11:16:32 +0000
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, rodrigo.alencar@analog.com
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 02/10] lib: kstrtox: add kstrntoull() helper
Message-ID: <rygken7oujyoupeanrdnl7r7smesa7js6sn3jsafbajc4sm3jh@adeslfqwwf3x>
References: <20260303-adf41513-iio-driver-v8-0-8dd2417cc465@analog.com>
 <20260303-adf41513-iio-driver-v8-2-8dd2417cc465@analog.com>
 <aabm23jCikXs1l6F@ashevche-desk.local>
 <qcloiwjlbehs4yyuttvrt46monh7isef4d5nzuwlaby6uxfael@j3trvc5jwosy>
 <4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4mtdzxfj656sjr66npabfvrr7yd7q26l2unhsihjtniz4ossfj@g3qnzonoary6>

On 26/03/04 10:02AM, Rodrigo Alencar wrote:
> On 26/03/03 02:16PM, Rodrigo Alencar wrote:
> > On 26/03/03 03:49PM, Andy Shevchenko wrote:
> > > On Tue, Mar 03, 2026 at 01:27:07PM +0000, Rodrigo Alencar via B4 Relay wrote:
> > > 
> > > > Add kstrntoull() function, which converts a string to an ULL with a max
> > > > character limit. The function is an alternative integer parsing function
> > > > that does not require a null-terminated string. It becomes a better option
> > > 
> > > null -->  NUL
> > > 
> > > > over simple_strtoull() or kstrtoull() when parsing integers from a buffer
> > > > with custom delimiters without having to create temporary copies.
> > > > The function is consumed inside the implementation _kstrtoull(),
> > > > promoting reuse.
> > > 
> > > But this will not properly convert 0000000000000000000000000000000000000000100,
> > > for example, if the max_chars say set to 20.
> > 
> > Why would I want that? truncation will happen in the case and the value will
> > be zero. max_chars can be zet to INT_MAX/SIZE_MAX if you want to get 100.
> > 
> > > Also kstrto*() have a common idea behind to consume the only \n and allowed
> > > digits. This (naming) doesn't fit into the kstrto*() category.
> > 
> > mmm ok, but include/linux/kstrtox.h is the right place for this? how about just
> > strntoull()? I feel like a safe_ prefix does not make much sense if it is
> > only to differentiate from simple_strto*(), which should have been safe at
> > the first place.
> 
> Also kstrntoull() does not really match kstrto*(), as the 'n' is often used
> to indicate a stop condition on amount of characters, which would not need
> to require any termination character at all.
> The 'k' prefix was add to 'strntoull', mostly because the function is being
> added to the include/linux/kstrtox.h file. Other names I could think off:
> - bounded_strtoull()
> - bstrtoull() - 'b' for bounded
> - bstrntoull()
> - strtoull_bounded()
> - strtoull_limit()
> - safe_strntoull() - emphasizes overflow safety over simple_strtoull()
> 
> Extras considerations:
> - Single-letter prefixes (bstrntoull, lstrntoull, etc.) are too cryptic
> for a public API
> - safe_ prefix is subjective and doesn't describe the actual behavior
> 
> kstrntoull() is still my first candidate, other than that it would be
> bounded_strtoull().

Hi Andy,

could you provide more feedback here? Thanks!

-- 
Kind regards,

Rodrigo Alencar
