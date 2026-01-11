Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2553199EAD
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768175621; cv=none; b=P/xjRQVnFQXz278W9HSv0mhNHnXJtv+jp2Y4UsFCu/sO8XO/4DvS6F4fBqbaXDDADxzfp0HSevsJbe5QF5tLzNGdp1QSDx7JB+3Yv/WnKQu+XxaKpdTx28dSmq4+WQywlQYZ7VjBVllAx6UZfk5xEqt0m36z/gQmUQgfiY/cjR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768175621; c=relaxed/simple;
	bh=2DhgNORQwu+2jPTvZDH84J51Np3j1to4z90VIK2ThS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr+4AvSILbP9lzlxiKZifwCUKjoTqOvXUGZpXHL9lNM7HNJKTm66Dnblt7IE0dOOJJB8qDY9JE1XqxRw2+71LgcgEzTWbnK1ak0l7TaUv5g+gggHx1m2hr6Wy5v65i3ewbZoMPxm1O2lIzLQgrrjYfrY2l/U2lmAmOL/MpVoEYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zq89J1z0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zq89J1z0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE18C4CEF7;
	Sun, 11 Jan 2026 23:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768175621;
	bh=2DhgNORQwu+2jPTvZDH84J51Np3j1to4z90VIK2ThS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zq89J1z0kvvGBVgE2RaboFo7bZxxHPVQyNiEYZNfR8AFLJXPOV+MHDviJlsvs4h2p
	 2NxN1e2D0f6wRSRd5IbvS165SO0OgxOPnZ1WQdTdwWNJIGnBYBXvkSYQOS9R3kxgP6
	 iabP6hOT9hrHuV9vqaCfv/I+nT6ttOX4MOH4LPLn3Sr/KrHSRZplwnL0qWB/TTFptV
	 o4ubMbOlHZ0WfZCk4DYL2v41nEKrJV3fGNDRGPJiFawHwBNB4FWRDWM3cNeHgH+cHm
	 rpOP4Tb56QjVeRi8d1llE6My4RVg8763C7BW8KXd0bILw1EMCiZOuilx8prFgIZgrI
	 YUpIjXNqNYgjA==
Date: Mon, 12 Jan 2026 00:53:37 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQ36HEIHQCHNEWY@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
 <20260111230639.GB170559@pevik>
 <aWQwVdF3ea1hmgjG@devuan>
 <20260111232915.GC170559@pevik>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wm24howgsyascnna"
Content-Disposition: inline
In-Reply-To: <20260111232915.GC170559@pevik>


--wm24howgsyascnna
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQ36HEIHQCHNEWY@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
 <aWFnRcjl5SogBakq@devuan>
 <20260111230639.GB170559@pevik>
 <aWQwVdF3ea1hmgjG@devuan>
 <20260111232915.GC170559@pevik>
MIME-Version: 1.0
In-Reply-To: <20260111232915.GC170559@pevik>

On Mon, Jan 12, 2026 at 12:29:15AM +0100, Petr Vorel wrote:
> > Hi Petr,
>=20
> > On Mon, Jan 12, 2026 at 12:06:39AM +0100, Petr Vorel wrote:
> > > > I wonder if this could be implemented in a way that wouldn't need
> > > > changing any lines of documentation.
>=20
> > > Good point. Yes, there is sphinx way to do it as one liner (no need f=
or any
> > > python scripting):
> > > https://www.sphinx-doc.org/en/master/usage/configuration.html#confval=
-manpages_url
>=20
> > > But the problem is that it creates links also for non-existing man pa=
ges
> > > (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst. I'll conver=
t them not
> > > being man pages.
>=20
> > Maybe we could solve that.  Do you have a list of undocumented syscalls?
> > We could quickly add small manual pages for all of them, documenting
> > only the SYNOPSIS.
>=20
> > The rest of the documentation could come later, but some documentation
> > would be better than no documentation.
>=20
> > What do you think?
>=20
> IMHO these xyzzy(2), xyzzyat(2), fxyzzy(3) are examples for new syscalls
> (like "foo" and "bar" or example.org). I don't think it'd be good to crea=
te a
> real man page for them. Instead I just remove :manpage: from them.

Ahh, okay.  Makes sense.


Cheers,
Alex

>=20
> Kind regards,
> Petr
>=20
>=20
> > Have a lovely night!
> > Alex
>=20
>=20
> > > Kind regards,
> > > Petr

--=20
<https://www.alejandro-colomar.es>

--wm24howgsyascnna
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlkN/sACgkQ64mZXMKQ
wqnNfw/+K30LFVKDz2nPoY0M7HxfHVCn6A2vfb1dQpFi7SthmYoj8DQ7dlsSnwHW
Z+d17XOGvrMFBt39cUuBcGrX4GwB5pcr/EMg54iEUgajO9HCbs54J7pGRlIs2KzB
HInWvkT0eQx2vt3pwb12e83H0c+gd/oNMoBj4NoGsv7nD+8hku7fdP6EYJIAPv0h
IzMYr/o8pvm/bEiNKmzRWlUpUbUbGhhW+BVvWweAY7x4O0EqGOPCywE5alrrZkt/
Y3TodQ8R+KCGEMHphw4vPeWyAjnPQ5sOmTFha6CLWerS6vV6kre3cio+00HugmUa
RsLNOygYuZieTzLCjgBIIDERXw+uqRnmApb3HxSirJ9BANIqa/NaueUCNKO2+h2m
Fu/LtuuP9VrbNgjdQ5uZYrrW++Imfn4/hF+0O/TJg9wSOfLXgh7AYKUYIaR3wb5d
QioceMkdts1+XfHM6ncAhCIX8CYjmbHGs3eOk52vszSZBhBErNj1lv3vav/d1z1k
vOhaTE3DX63bhe8ISS/0Ea6agenatD1M5jbgLysf0SZp8uh/KuNbfLzCLUnXrKnv
CHpxgFVJfgFG3Gj6/V3JPFddKJ2I+u0djSWOHjb9NanL/AdBpA8HTfvi2YDs68qu
jrAVHT3+FQkjmeVq6GFW5kz7GxU7hRuIe5d+jVKzuWQw77F9JDU=
=V51p
-----END PGP SIGNATURE-----

--wm24howgsyascnna--
