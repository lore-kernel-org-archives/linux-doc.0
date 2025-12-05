Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C9C2F4A06
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 23:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764977160; cv=none; b=k+mAwhxG46GwRWKVf/Q+QRNTK1KxlxT1ig0oeQDk4Z4phxJ91SEH25GpI5Rrxd9aUEP8pCud8S6GJG110JChkA/zBhFVS93K63DN7K+AYef9KbErlrlelZfOGrTDV9LdtwDJoETwyRLGFSWOAUbJFBHMVZiJtZ0oIX0Gds9rOko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764977160; c=relaxed/simple;
	bh=qlNEkwYKv1vQTd++FLISVJ8bOkz/dL1T96etWN9GhYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bsC+uQViSPYNyK7dnKjGnyR/sgtb4k8LSRLOJKlvYyu5hArFHVp+7jSb2K1ka+L/tO7d3KDVct4ym6bj42uaMIsfhAS2FsdQdBueY8m3Y0cRQ72dvg34AX3ts8BSkas7IsFynolCik+exWwobGUP//hxp84NnJCspPB9UWL+wyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Viya4EVL; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Viya4EVL"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297dd95ffe4so24919345ad.3
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 15:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764977158; x=1765581958; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hSF/yu3VFVDGkcYFdhvW0MhYzJSwlaK8gCP4q7vZ3MQ=;
        b=Viya4EVLPPB0r/P84zBNsXT7jZ/9MbjfCsGcVHGMtToh2bzQJBT4tJOwYlHnSCfUJ2
         ctPtEx2xpHlwN1vYSvfURZe1ETr30Jdqm30yE5mG02fytX4wNyJWCP74hX16lNC2sQP9
         iJYOJMkDrDuJl9Clm7GbiYC/Eg7u+pNStUTKYCBQW3BgjfO0CvLDaXyK9y1P2ZcBRxqB
         NkPYeIw+RlsiPhMzRWpZbNxU0YkUZbbMFq5CePBmXnTrUF7UROLxbWUBT0PyWLlDLVeD
         sUvKwYliYox2ZEyKSFnI7McbxufXl91NPCPnoDCHQ6Q/BiyGjdjIqVWHFVpRi6xYIS2Z
         7hOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764977158; x=1765581958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hSF/yu3VFVDGkcYFdhvW0MhYzJSwlaK8gCP4q7vZ3MQ=;
        b=dv5Wo//r2GDjf7UT0w0qnhVyiLU8XAkWvXlmXf55lpm6x91/VyW7A7nKJIbHqN3hSZ
         +z++JBnVuj30rQZdi/m7adPFlemsxvhGsK17uALswBw1KLiQ/WLmvfDGdnHwGE0uJxPa
         dAlG5RYZyRdYzlxJGQh56uCipEPlPTWpzkEArnipBMuKw29aPdQ4Zy9F8l21KM9TBeHp
         HXShJo5DvcC511XB0GEJfkD65CAdhSGvzj9w8UtO/H1yZd9IdXNjyhCvBKEQYh1TzIut
         gLVslEZ6c4Laj5t/bzbfHQHkeGnXx71tpR02FPI2mMK9vPoNS8DBO5IJdybTkPHu7qao
         QcaA==
X-Forwarded-Encrypted: i=1; AJvYcCWw4WbXhjli7+x9m6OpsLjxBeNaAbeV3Cfo/b0Hg12SyuG2YDY+u02AnaS4iW+o072YoUpwlfyvwK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCTV5XHM+sEKuEJmWP56vm9WYl6lrpjtjI0dOLYhDYY7kpHQLO
	B7wCPHG4ynds3SAmGKP21IY7NaraFYyv3e2weIlOqCfJEBWUtKXu1ztO
X-Gm-Gg: ASbGnctmwEnFzKqOVxCF11Xu2B5YogUIqwwjYvKj2SGOghJSRB7N1e4eFfqy9MmEHZP
	nMHJbESgncpqpiLpgCKcI0fLm8l44O6qmfQ54Dv4IVZ2F6Xj81gM3WA3w/zRglagGLcHECQT+Sn
	ctzNO0yv+cd++0twtrA1baiWHVSxC4fXpYRUTKtGY5BphVBbwnsdnYoiIi96xb2XkcwY0VqwaIr
	3qbFaNzowGcjecyKnr7UPwy7Gb2wQ7zAbtqRWOUDSlRkTgx9Hr1F2FFyHUyBVkED26v1zcntZeK
	/dUHKWaKXan6xoC+7WmSSxJPBv9UMEt+SS2mGIc2E/Z/UEyYrdnfkIAB3cZtiEErjRs65n2Dvcr
	5B9Sy5rGMxqSrwiG8Ijd0ppOykwiGnO6T8hg2iamc1vSAVla5ocivESBKbmdog8dLmWfNDUucem
	1fAg+KkvtFQYA=
X-Google-Smtp-Source: AGHT+IHj4JLcI0Wlf6zxtpUhiv4AUqRI/9XrHb/nwyIARlhRM1OVlSqgG0Th2WsNuda+KQCnrRwgbw==
X-Received: by 2002:a17:90b:278e:b0:349:3fe6:ab8b with SMTP id 98e67ed59e1d1-349a26ea32emr448812a91.36.1764977158005;
        Fri, 05 Dec 2025 15:25:58 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3494e836bc3sm5474353a91.1.2025.12.05.15.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 15:25:56 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id B172C4218349; Sat, 06 Dec 2025 06:25:54 +0700 (WIB)
Date: Sat, 6 Dec 2025 06:25:54 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <aTNqAni657TyZIg_@archie.me>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
 <aTIP2Wqspl-jfm7M@archie.me>
 <j6mj6stlk4ojprdpfvoa35ghsfics5wou4nh3khymmb2aiqxbr@73jzs33sbyly>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edMuGlwA+LYoZAEL"
Content-Disposition: inline
In-Reply-To: <j6mj6stlk4ojprdpfvoa35ghsfics5wou4nh3khymmb2aiqxbr@73jzs33sbyly>


--edMuGlwA+LYoZAEL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 05, 2025 at 04:33:15PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> On Fri, Dec 05, 2025 at 05:48:57AM +0700, Bagas Sanjaya wrote:
> > On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documen=
tation/process/maintainer-pgp-guide.rst
> > > index b6919bf606c3..2e4da3de25d4 100644
> > > --- a/Documentation/process/maintainer-pgp-guide.rst
> > > +++ b/Documentation/process/maintainer-pgp-guide.rst
> > > @@ -405,8 +405,8 @@ geographical region, and open/proprietary hardwar=
e considerations.
> > > =20
> > >  .. note::
> > > =20
> > > -    If you are listed in MAINTAINERS or have an account at kernel.or=
g,
> > > -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> > > +    If you are listed in an `M:` entry in MAINTAINERS or have an acc=
ount at
> > i.e. being listed as a maintainer?
>=20
> Yes, that seems to be the criteria. This was at least the explanation
> when a coworker with an R: entry wasn't able to apply (and the error
> message gives no hint about the problem then).

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--edMuGlwA+LYoZAEL
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTNp/gAKCRD2uYlJVVFO
o992AP0Zx5zgv0hDIvmlxjIQr3GERGyBVur9nZOvp2m+ZV0TmwD9Eb3fj2esQ5g1
WyD5agka81GjlZbaSKKwwsXAxOC1HQI=
=XUcw
-----END PGP SIGNATURE-----

--edMuGlwA+LYoZAEL--
