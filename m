Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482E32FA07
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764948804; cv=none; b=ZDwYTCkHodEl73YHIaTPfsGE3uqK+9ofgGtD7t8FGeVxFKYdXVNhWRwS9Mqhh4AnRbijm3si1QwDQnbfvAkuHz4oflo+Vc881NpmiFr2YJc5rsN+CpKigKmwWQfVsbNB9jWN3BvB09n7AKAVEMKrQTsgssEBDsQilS8eCBSPbNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764948804; c=relaxed/simple;
	bh=uriUt+w4PSoBXDDAW6w1jxXm60/AaOp3dSZv21zdcHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=erU9GUe9q/qigHM6JCqyhpLMYempaL/SgPmNfFCP+HdlFtOd4g2YBOBxYBScAnHdSznJrEadsQfFEnh770FkWIs5OYG/+qkDMUR67fj1MiDZpNM9dpqFTlHitXxcPycK3q77N5zS1SZQjTcFLqFEZIH7Y5h7bQFScxQ1KfY3Kqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=mlDs9zD4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="mlDs9zD4"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47795f6f5c0so15626215e9.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 07:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1764948797; x=1765553597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HvjppReCrCrxS3kDDkBx4Pr9nzXm5T4z6OxhhwoEdqQ=;
        b=mlDs9zD4Ej4lCf1vklAK8qWQ+1zFonFIdz/cj7dX4x0s9IcAnzcqrvOWMvQhRYpxqy
         Hr0ar8TdudVksI4h9A/U5tQxqNnQNzepMa9vFgmTaUgD0i0bpG/XoePCMfhmE4nzqcl2
         4rNOSMP20YSBfx7E7hXq9nfjDQbBoQPUfvc8QVtiCCZx4R9IgXDRYPo4v5tbsQmAgL70
         0MnH6aUszf3vQcYzQeyYKmSg0zRtykeWWQ0RPcWUo1TybuJUDzro3vrwiaVcrnj0vDNa
         RdzpNR+7ZnmF4woD0iMeMR3Av2tP0wWEAU6kuN6KS1+65c1IRW8q6W14NFi7agowYW5y
         Iwcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764948797; x=1765553597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HvjppReCrCrxS3kDDkBx4Pr9nzXm5T4z6OxhhwoEdqQ=;
        b=Rrtq97DgX7TNBSapXTn5o9JdUrnE+N0SqS15xHrJPUbaovMRPuS/y+bMTxVTL//deR
         DP1OqbItctb5bv+w3m8lDqqrFklNDsIsh33tN30Nh/5lrVJBnNKTIwZEeU2Lkuz1c5K7
         7jEFrWM6x1keG23n1jDcWx9E8VRx9oY8aECpSct0y+14UXHdsKqMOpTC+gwuewWErAgD
         CKrHpKoY7WMGjPSUSBCkMyAkP2UZpanR3oeWEQme5ns7/I9v2waJLGN2yV7vvMZaZYI2
         c7rMYKXfOE7seA/fc8zWUpNaxQGCUKiWCHB5x0WTxKg4MGU0xhvYk+f7UsekZauyrPRQ
         iLuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLEGY/kXmE+nf+FgEkeYs2yBO35Y/yTISwNjaFh8IMqMzPfekTI/jK/aShlBCPgxaya1oUS+cuiBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyiRqKVkDS52IckZ4GYKZXcjgTE/1Xk/KOrSU/guATaGWkV34d
	kva2CoTEVEW3me8OgEuACMQ69y6Yq16l8O/1RVKh4g0x5eJ2uOU2kbyIVB/jrc6vX0c=
X-Gm-Gg: ASbGncuwhFrLAHi40tXPGSL8xHXKEyj6O0jvtgu8tmYftZPmTudRyRdFlQSXgJ2io1E
	n8ClPQ0CyZi0Es8RqfQJycypo91aPXIHDov6fbhqPXvR5ED+/QAYyOTYPr6z7Rk+tIFxJdQyIN7
	s2iZhPqScb9/8BPsimX8noaePUmmHvmPscUi2qxLAv83lkU1j9lRpYL1nJX7SAFUnNqnIyzpysV
	aY7BE0ixbRfCgW1wGc4GEpAuxfSwOmn7Kxa1Q0xYB3ZplP6HYbyIg9I5vfiBQLiY8vtObmNHVWj
	bUaVpX7FeGId6/DBpPhx5SnOUdWM91B5MdPoWIBXcWF28GcYCwP42/b1i1KLZA11z1xCHZ0wlom
	TIghYIiB7RG4QEgQPZMOffLW+MCgBwhg6x1twq4+qmKvlNu/dsFo7f9zvNdFj6CuHM7NTa+argl
	gU+G5c78zCh8RRAnZ7JV9NKGDRjHuyQCUUr1ZbKmIEc1hj3JdEeLI6pvpjtQKndz91IhtYIuLZF
	p1CCQ7Xf8qT
X-Google-Smtp-Source: AGHT+IFnGLCKOJrUV86aJjqBa8op0ySObk5Ne+xxXjyfaoT7PEDgfBBZfngK+ni+cuHs0WzGXjHCmA==
X-Received: by 2002:a05:600c:1ca4:b0:477:63dc:be00 with SMTP id 5b1f17b1804b1-4792af404d2mr113979475e9.25.1764948796743;
        Fri, 05 Dec 2025 07:33:16 -0800 (PST)
Received: from localhost (p200300f65f0066080f2a7d55dcab4de7.dip0.t-ipconnect.de. [2003:f6:5f00:6608:f2a:7d55:dcab:4de7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479311fbaf4sm82770205e9.15.2025.12.05.07.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 07:33:16 -0800 (PST)
Date: Fri, 5 Dec 2025 16:33:15 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <j6mj6stlk4ojprdpfvoa35ghsfics5wou4nh3khymmb2aiqxbr@73jzs33sbyly>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
 <aTIP2Wqspl-jfm7M@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vtqngrwcuzhli2ps"
Content-Disposition: inline
In-Reply-To: <aTIP2Wqspl-jfm7M@archie.me>


--vtqngrwcuzhli2ps
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
MIME-Version: 1.0

Hello,

On Fri, Dec 05, 2025 at 05:48:57AM +0700, Bagas Sanjaya wrote:
> On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-K=F6nig wrote:
> > diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documenta=
tion/process/maintainer-pgp-guide.rst
> > index b6919bf606c3..2e4da3de25d4 100644
> > --- a/Documentation/process/maintainer-pgp-guide.rst
> > +++ b/Documentation/process/maintainer-pgp-guide.rst
> > @@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware =
considerations.
> > =20
> >  .. note::
> > =20
> > -    If you are listed in MAINTAINERS or have an account at kernel.org,
> > -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> > +    If you are listed in an `M:` entry in MAINTAINERS or have an accou=
nt at
> i.e. being listed as a maintainer?

Yes, that seems to be the criteria. This was at least the explanation
when a coworker with an R: entry wasn't able to apply (and the error
message gives no hint about the problem then).

> > +    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of T=
he Linux
> >      Foundation.

Best regards
Uwe

--vtqngrwcuzhli2ps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmky+zkACgkQj4D7WH0S
/k7fRAgAu9daZwZT9Ip2xOeM/w1hNbVH4jYmAXzyMdo4aHSLgOOSNOXdj9mB8dMP
A6me4gwkAAbWLtJlExAl6wPwaNtTv6WobMPnNbm9Hfiee+hTjlB5OJmfgg5OKZYE
X7BVivj2MB12/jHWciUJj/m5u5G9EJJL/lUWSrdlxiEzl9ikubbFz55AKtweXSNb
DlwRMqlrZ2Wt+iXYNOmSS5xadT7Er0+D7s4sYHSbYz13raabzv/7G/p5oFpJicPo
ZBYAqtpfT/Y+aOOkic56/vlfLFFD0H9/itQBDI1TDn450dxmXPwKh01+kkyVNhGd
hVgzZjfyza9NAk+M/Qk3QZie4guEGg==
=c3w1
-----END PGP SIGNATURE-----

--vtqngrwcuzhli2ps--
