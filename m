Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FDD347DD
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768173844; cv=none; b=RzRHqK+C61/X8JeqRRrwhZg3GoR4tfXW83w8srIkb+lzfO6GVfbAaKhIw5pBFEIaK2ntNyrVt2/tGfktg0rzx1zuk4Ba2TyHQrr8NiEX9H7rR52EW/F3Tj/fM1VbnTsAisYSRgMnRWJP2MMlM3IIB9/V+3pbN6GH6oeqZVi9pts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768173844; c=relaxed/simple;
	bh=esp/1+O9xB5FX3IqcLdPDG/hVAGf7OpJlujKVt2K5Cw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnvuhtDTmSCRP+jY/1AwC5nV+/ZgZeWauAko47vlo9/2VyXYRBaqE1QteF5CIIZt7IOmqdVObQarL+qj8VuTYijIIHPfwqTW23vt1BYobMpRLvtz34MBRrs48J0ozpG5VIgGps5lcE+C14uOMBhyEbc3AnlCeIrbfpdB4DanZ2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DktC1LAy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DktC1LAy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16A9C4CEF7;
	Sun, 11 Jan 2026 23:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768173844;
	bh=esp/1+O9xB5FX3IqcLdPDG/hVAGf7OpJlujKVt2K5Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DktC1LAymLWp0a/i3n//d6HUTJ937CuBqrgIvJTP504EOYd0YFyMfHuExPpVfi1/g
	 x8v8HO2O220gYk12b3CDuUGXIK30p1A29sHPU8mvyixz2AWHrejSxX9JfLU53lEb/I
	 wyo9tAg6882GLHMV9SPvMH/ee2xawVErOzn6UKaF8epj9v36gujF1EEIAq5TOFsO8h
	 wPBLgOdRrRDVFrsRar2kEyV0vrjE7dxOzs8QLqOVp2u+w16ZepKpULXkHTN2vzlhKc
	 7glk9xehfwnigP61zpw0+xOy85scOMSIETCHi9eorqjpVq6kw5BZXuMuzr/px0aOO9
	 xMAmEC32Wm6qA==
Date: Mon, 12 Jan 2026 00:24:00 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQwVdF3ea1hmgjG@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
 <20260111230639.GB170559@pevik>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6o5n4xgyfoaqiiu2"
Content-Disposition: inline
In-Reply-To: <20260111230639.GB170559@pevik>


--6o5n4xgyfoaqiiu2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQwVdF3ea1hmgjG@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
 <20260111230639.GB170559@pevik>
MIME-Version: 1.0
In-Reply-To: <20260111230639.GB170559@pevik>

Hi Petr,

On Mon, Jan 12, 2026 at 12:06:39AM +0100, Petr Vorel wrote:
> > I wonder if this could be implemented in a way that wouldn't need
> > changing any lines of documentation.
>=20
> Good point. Yes, there is sphinx way to do it as one liner (no need for a=
ny
> python scripting):
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-man=
pages_url
>=20
> But the problem is that it creates links also for non-existing man pages
> (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst. I'll convert th=
em not
> being man pages.

Maybe we could solve that.  Do you have a list of undocumented syscalls?
We could quickly add small manual pages for all of them, documenting
only the SYNOPSIS.

The rest of the documentation could come later, but some documentation
would be better than no documentation.

What do you think?


Have a lovely night!
Alex

>=20
> Kind regards,
> Petr

--=20
<https://www.alejandro-colomar.es>

--6o5n4xgyfoaqiiu2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlkMQkACgkQ64mZXMKQ
wqmY2w//YM6oBZFqqGKvLKj1GRph461aymTnkYdCU4LKUJbAboKAoLhvC04qrp+C
B5dwRKhi5/9ceqxZtZ4TuwIB3Q1MVnvzCCEwdkqTFFHNtIaNPwy7vjmj90q18x5u
EX7OnkRUTGcg5srCY+WlMllNWnnthzIuJBVA0L+oZ4P0WokqT8IUvf62SmJSkr9X
Ie5IUYkSFGGBmCkgG8e8N4UxgAhNBlFjStQvMxJd7KG1e3SJ4vrQCUYym1CnLs4v
5AVC8H1AjrS3X98GIyBEE10NWdRw7LpZM5Erf+opvUWcfr4ZWzWW2KuxIeqPOnUr
qEkLK++31Hh2CuJwzaKlAXvQdftvqPsSRXDDdFEdxWEv9uEpds+lfNzw+lG1y06D
D/jiLi1bSOlypj3SH5aCeZTqrl2av+55+gfn/AkXY6wfPtk0Ia5M+r7dyjmXbudc
MjCmmKiaSFY2T76UziLa/C19TZ8GXpjBAySNPCko+zo23CR9j5T97BmGHCBVnVFx
lCYjGO3qL8wlmFB98Lg4QL4vV4hRDuz19BqPHsVMOkQxgURrFtaseqGOkpr/qr9O
1g8+RC4zM7wBlpMhCAQVIH0AvIcMIb9bEJjjWbzifPgVOWgy2WOBZL5/DXmcsnR5
1Jf57kFxloJF6QiX5nc2VXsEFeGy/9FGiafdfexaiZEv/uxCrkw=
=w1U1
-----END PGP SIGNATURE-----

--6o5n4xgyfoaqiiu2--
