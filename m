Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F1221B9C0
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763513761; cv=none; b=qXJBiR84otPYSH2RbQlqcZlEHR3rHyu6PDRAwaKSebDf9GMsr+E3g0e20kiFFKboZVe8O1kE6ilkijjnCg9LfyPuh6BTKiwuIVFh75oQIJ1rklxCr/75c16dvRRYeag5a0S3YF0r+/p2V4DKloj1hB07eXBPyQ8UwCuFKc+sjpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763513761; c=relaxed/simple;
	bh=BKrNrP8BjGezbcXd8uDclY2ruF3VWM3i6lCtYxUZQK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fxqo0mtoiZEEi12LOiDp4znWhRG+U/W7W6pbSRTro0ebA/LeDamTrK+d7nUwM2NMivcu/n11dLU3TeW03rrBJ8Y4dOf1zh8p6PUWqJC/OJKv3OY5LkKJMdkwpszpy6YU2HN1/EgLU5qjMfR3vItrvfaLYGSPoBz0qUCEK0DpPPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEJc2POE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEJc2POE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-794e300e20dso271833b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 16:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763513760; x=1764118560; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo4JEq+KOie/L0hcnmnLjawlkwhdvWZpyF7Tskgs2WA=;
        b=QEJc2POEKdeXlpGAMhH/yh9wa04es9nE9uwVsto6r0yrmjKr5H/BzGo8LaFGlsQCHG
         M9PiOSCklUYE65LHioTA8Q+GzCRT7vn5fElb7WrHQsPNEQxh4iZA44wODuZIuKZvsLfN
         0x4jqubYGaIp63RHcYy7Rc+W858ZHyN58S5TGK+t3RZjQw14MDBsHUGm4YbJm7BLjLc3
         DYUDZPBIHHRR3KMFa35gyQFk0ogN+ikqpIuqMqCTouGB59JnRdNGhcgJWjfOP/pXt05e
         VIZIunOFV5428Ji4512XQigy6HjDUfadcBDD4DauYs4hdgRfWdnOoga4nvDNZcMSEuNR
         F88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763513760; x=1764118560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo4JEq+KOie/L0hcnmnLjawlkwhdvWZpyF7Tskgs2WA=;
        b=Ixvnkbcx8xW7uo4QffhsMHCEAMaZLLxzwU7+PQWIyZVstVbUCYshCFFWKVFueBN2MX
         NkPhmQPjOXYlCH0aeBZab3c7sqBvPp80TJx9WMwADdbF6bqSp28/UF+fJTJisDOdBkhr
         edfX+8YIui0t0un/7nW8f/4oPWhE0FT9xdBV63CYuOKUNU+l8h9UFbqnEw8rrPI5fv36
         3QWhHCxRVe1LWBb4aBm6Sr25eh+ma0lrS6S3DOpqKSaLeO3UCyUorg7PSpFG/YUbSFfU
         QV07Xl5fQvkZG27sR8s4P9Bsc4uc40suzTM+ywW2F04yDAi2IvRRwNko+UVY3xLy0QgV
         xcmw==
X-Forwarded-Encrypted: i=1; AJvYcCWkRamQD0sgDPecW4U0j2gKbl9VbkOVQ0LSkOe6hDgBz/9sBZlr7iNXacL+ytu7q9sx74rQP9Jffh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYt5+1ooIOGVXFvjkY8gsbyRucnx23eAB1sQyZFwn0lSJTkaUf
	LdZ53gjJHTZeuPlvwIG9gGW88rUQlaf2xnqRZMTTDGLj1+7/1FRjTD7V
X-Gm-Gg: ASbGncs/wh3jF7sCgXaroU2CmMCE/wJsiwpO//KfloNwBO8xI+d5dVY3ptGPHe4tKlu
	si/eI3lPd9/BOtEoPunZbOlxkbIYZCFnNMmWOa5RXAA515tlgVqN9rPnXaBDKGiy+/mX2ssmvgS
	gY1nVe/O8uh9FuVQavuIUYau0mck8eijxGMKubJKODWdzDgb9+dRfOctbfxy+FPRYshxfoJ4q9L
	FIMZBfepJ4GoJSZxZd6utA2x6jlHlONI8hFP/CVy5lbrnW7v/Ac+09QwffOJG+roViRNFufv+K1
	KeQ0YdfpHMPH7vNl+fDBpqIf/rrpQOXMtm+HQYfBbHjirR9IFvfwI1nMkgAXML8Wt4/5nL7AhPM
	P6qzOPet/flWNdFcb/asQXmzF1NQ33rg8zh+TcrBxY8yBQJTlk5Ku9aq59i7X9EIrEvCRCmn8Nm
	xeNlQzOC+dXPc=
X-Google-Smtp-Source: AGHT+IE/M14afXvdq5MKXj+LWlmsFFeyMGuj4xCweOKwCSV1tbS4gqr5aW8zZmdh7h2vwGllY/FvLQ==
X-Received: by 2002:a05:6a20:9190:b0:35f:5896:859b with SMTP id adf61e73a8af0-3612ed3d961mr677749637.4.1763513759747;
        Tue, 18 Nov 2025 16:55:59 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927731e65sm17728848b3a.62.2025.11.18.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 16:55:58 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 514404241834; Wed, 19 Nov 2025 07:55:49 +0700 (WIB)
Date: Wed, 19 Nov 2025 07:55:48 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Levente =?utf-8?B?UsOpdsOpc3o=?= <levente.revesz@eilabs.com>,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v1 1/1] Documentation: gpio: Add a compatibility and
 feature list for PCA953x
Message-ID: <aR0VlNp-kR8kj9_2@archie.me>
References: <20251112224924.2091880-1-andriy.shevchenko@linux.intel.com>
 <aRfWouKGA7q2ufCV@archie.me>
 <aRzBGhsLA_s1rJbM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yOYvkH9L78ohLBAH"
Content-Disposition: inline
In-Reply-To: <aRzBGhsLA_s1rJbM@smile.fi.intel.com>


--yOYvkH9L78ohLBAH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 08:55:22PM +0200, Andy Shevchenko wrote:
> On Sat, Nov 15, 2025 at 08:25:54AM +0700, Bagas Sanjaya wrote:
> > On Wed, Nov 12, 2025 at 11:48:20PM +0100, Andy Shevchenko wrote:
>=20
> When answering to the long email, please remove unrelated context.
> Thanks.

Thanks for the tip!

>=20
> ...
>=20
> > > +I went through all the datasheets and created this note listing
> > > +chip functions and register layouts.
> >=20
> > Nit: above first-person intro can be instead edited to:
> >=20
> > This document lists chip functions and register layouts for all chips
> > supported by PCA953x driver.
>=20
> I believe it's fine to leave author's original text here. Also the propos=
ed
> version is not so clear how these document was assembled.

Ack.

>=20
> ...
>=20
> > > +.. note::
> > > +     This is followed by all supported chips, except by pcal6534.
> >=20
> > Do you mean aforementioned banks offset arrangement?
>=20
> Yes. The chapters are per the stuff explained in them, so everything in o=
ne
> chapter or section is related to the entire chapter or section.

Ack.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--yOYvkH9L78ohLBAH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaR0VjwAKCRD2uYlJVVFO
o2ICAP9WHtChH9dyebnwypQSwklbupLbP3TG+lZ3z35QAY5QCgD9H1ZV6+A6Zr3O
UmiAM3izQ1UNBvZ70YamMwreBzk0pQs=
=zxU5
-----END PGP SIGNATURE-----

--yOYvkH9L78ohLBAH--
