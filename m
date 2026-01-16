Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C2110FD
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 20:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768595844; cv=none; b=c1bcKB75F5YcDBNEyDy/r2UV+SldBLAmG6vaoQ3X/G93jpPGvVUA5pLZRHZNKHgV0vvtmc74MF92zuRsoLmhpWWyjlPIMkKXi+pJ87yDk0z+xzKVEjV8b7T/7GFwUlTExscRqEig+yHCNSOukyzcMqPd1RE9QBEI8mu5acadSLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768595844; c=relaxed/simple;
	bh=dExacBxv4J+Tt0alkHIVgcX70d8tVah6bijpX4sgiYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nEF2S5+B3jPqRoaujWx5H4VD14blWsYKAOv1Sm89ZbVIqOnxe74x0E1aDXB9mVLnTxmzne2rhJi1xqJ0ssoFVuEn4wJB11+yK2NjAWiYQb1SnIlIdQwup50R41s0oHneWkDDN5YoPbGQckJ7qH6Usdh+QylsbN7IkydMUavqp1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QM8MW0GZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QM8MW0GZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB8ACC116C6;
	Fri, 16 Jan 2026 20:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768595843;
	bh=dExacBxv4J+Tt0alkHIVgcX70d8tVah6bijpX4sgiYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QM8MW0GZ7kvbJm2rJxXo8uTqgkjxJxhP1563pwr7CZPBBXEahANQwS2mmm5ejun2l
	 Jtu6g1LA7v6aoTJUZRN37aUo8Cu5q7WgOGTQTP+i3/oqRk1QBMGq7airPYrJXRtYUG
	 8kDlvJ51TwhYBOqX2WO4rrgaK8NFEc33TKg2j/JvCq4bGpSWk62a3amLB+6i9WlNC9
	 ZbRUr47ktl220kG47s2JDkvejVBHOsD7CJkoEsEWCvs9pwk4p/06cbbh361ioUIDhn
	 PNc2odRDTXRn7WnxzKVT4QB6OwgH7Gqb6unvGW+iongxxDGTiivoQ/s54AXDXqGFY0
	 EtQbqwO0w2V3A==
Date: Fri, 16 Jan 2026 21:37:20 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org, 
	man-pages@man7.org
Subject: Re: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
Message-ID: <aWqg5XwPRXlzq4FI@devuan>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <87a4ydo1hf.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l5rxeiczafll3242"
Content-Disposition: inline
In-Reply-To: <87a4ydo1hf.fsf@trenco.lwn.net>


--l5rxeiczafll3242
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org, 
	man-pages@man7.org
Subject: Re: [PATCH v3 0/3] Documentation: Link man pages to https://man7.org/
Message-ID: <aWqg5XwPRXlzq4FI@devuan>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <87a4ydo1hf.fsf@trenco.lwn.net>
MIME-Version: 1.0
In-Reply-To: <87a4ydo1hf.fsf@trenco.lwn.net>

Hi Jon,

On Fri, Jan 16, 2026 at 11:29:16AM -0700, Jonathan Corbet wrote:
> Petr Vorel <pvorel@suse.cz> writes:
>=20
> > Changes v1->v2:
> > * Remove `...` (italic) from non-existing man pages (Jonathan).
> > * Squash fix for sp_SP to following commit (Jonathan).
> > * Remove :manpage: also from fxyzzy(3) (non-existing man page).
> > * Add CSS for man page.
> >
> > Link to v2:
> > https://lore.kernel.org/linux-doc/20260111233534.183272-1-pvorel@suse.c=
z/
> >
> > Link to v1:
> > https://lore.kernel.org/linux-doc/20260109183012.114372-1-pvorel@suse.c=
z/
> >
> > Petr Vorel (3):
> >   Documentation: Remove :manpage: from non-existing man pages
> >   Documentation: Link man pages to https://man7.org/
> >   Documentation: CSS: Improve man page font
> >
> >  Documentation/conf.py                            |  3 +++
> >  Documentation/process/adding-syscalls.rst        | 16 ++++++++--------
> >  Documentation/sphinx-static/custom.css           |  8 +++++++-
> >  .../it_IT/process/adding-syscalls.rst            | 16 ++++++++--------
> >  .../sp_SP/process/adding-syscalls.rst            | 16 ++++++++--------
> >  5 files changed, 34 insertions(+), 25 deletions(-)
>=20
> I have applied this set, thanks.
>=20
> Even nicer, of course, would be to have automarkup recognize man-page
> references and add the links automatically so we wouldn't need the
> :manpage: noise.  Something for another day, I guess...

We had some old scripts within the manual pages, which did something
similar, and they had false positives.  For example, 'exit(1)' is
ambiguous, since a script can't know if it refers to calling exit(3)
with value 1, or if it's a reference to the shell builtin.

I'd recommend being cautious about it.  :)


Have a lovely night!
Alex

--=20
<https://www.alejandro-colomar.es>

--l5rxeiczafll3242
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlqoYAACgkQ64mZXMKQ
wqlQ7Q//cXYiSmB4B31HJjdWZpJ6GqH50V+6228q81paqlYayoNVVQ1z7U0Kcnzr
4sCqTBQhUOxMAOcMx1CFR8nq8FSZptnhUAMg9ebX7cF2y2Ua97gZ75BQoUzT3ptY
Ul9MMaziP+DUfWKwXuqc4SXKNzFnu0U8mkP+tGLXJoNCf6W/JaaXGKXiMIJAwOhO
mVardYIPVcjy5d0AiZwSj41iAHcD7qcvYyW1ARpDtB87zJ2V3voAGhbuovAHMBsn
Yk74E/nGxcDrhJgbk+JXCOLLzEi5f3bDgvUtzbldek/pYCxIQTn1OToYiHMWqtda
Przc6oO2LTPZa5mOh/b9hAWQdPcAkO+5ZriBXSZ3wD3KUybQj61NYI7zpGxmrKX9
WD7reghiwR2rjjYUvGfkYRTP0wFoi7Q+XkKfCDsc+ue5+FDBIoaM23qNEULkoTUl
YXdIgZu0avYPkOz0DvYC70ilsyWpb0fYCX0zZepwAxlhOOt76UqRrHE8wju7g2Cp
46DgULFJsP5wQwMROIsfU5QWfJXmUHLCQNCyVpq/z/UEL0W7yHdKP6ILaFqm9B0/
ErhKzN2XV6y7WYACke65lQfn8Sdop/mUvTQ5d7c7OIZEUHQe+OrdcC/40+aQl3WZ
zR9PXm22Nioxler4PwpaE6NwTXDqDC2USLlDbnsG3zlHCBV3NGY=
=BHww
-----END PGP SIGNATURE-----

--l5rxeiczafll3242--
