Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD44274B42
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 20:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767991958; cv=none; b=nIM1yianrNJpK1WY37eWGtd2FFYOGLsj+evt+LbMSMHMBBmnbMK/aLQ7AyrWdqjQO1iX0LUhVl8HgRydGxxV9t17oXAlumZVrYjQ+IPyWoX016AhQweoRxIdadej7Enf9mUaNZd0LQqo8jfmjY1g1flmu30LxD8MoRFZiBwahig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767991958; c=relaxed/simple;
	bh=QopkUPGPAYEgT9k/jNbvDAqgc8Tt1DWIJ5XxLMf7jKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W36+oZKk40QqPRCLVGK2hFvuG2q9qa+EteOajAbZF+5BNHiMC/nSqFfJwuByJrvDKUAmsTkQsZ8iRly3X2FFYgp9Iodxr6ynRsKyUa5ccOtkssZSAMtdsZKr8WsiG64LtiaRugbnkYNLx6a1GZePBiF0wBtxz9PjTOUm4fc5Q3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P4ZPI3we; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P4ZPI3we"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1553C4CEF1;
	Fri,  9 Jan 2026 20:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767991958;
	bh=QopkUPGPAYEgT9k/jNbvDAqgc8Tt1DWIJ5XxLMf7jKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P4ZPI3weU8ytG4dkkaIrJG5C+fozZI5iMxR1RbYrwGq8ldJ0K4oYeDhO8VMuWXWuw
	 d752tkmhDs6jBbwLvxH/ABsOOEQleWPuWAMUToxMRScWwIkZ0lfyrY0EDiC4980QF0
	 F2/D/1fJRDALo6iIKKhF3kZSc3oVflxcs/8/E5cE9bkYNTWORiiub0gZMM2jlHHFKw
	 oZM50Mc0IQX0w/J0OVwd1+QGtMkB5IUsTVlT3jK1SMPm90sya9HusWweIph8Z1OIiP
	 3fK8N80CWA+OdV/e/sezY/fQ9PaMwmvPexBDLcfGCyvFaMLUhhZa4xXvWkW3bc3PKP
	 82QhUevzUslGw==
Date: Fri, 9 Jan 2026 21:52:34 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWFnRcjl5SogBakq@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kiomj56tvl4l64uk"
Content-Disposition: inline
In-Reply-To: <20260109183012.114372-1-pvorel@suse.cz>


--kiomj56tvl4l64uk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWFnRcjl5SogBakq@devuan>
References: <20260109183012.114372-1-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260109183012.114372-1-pvorel@suse.cz>

Hi Petr!

On Fri, Jan 09, 2026 at 07:30:09PM +0100, Petr Vorel wrote:
> Convert mentioned man pages in docs to pages online in
> https://man7.org/. Use new extension sphinx.ext.extlinks + format
> custom CSS.
>=20
> NOTE: Keep :manpage: (plain text instead of link) for non-existing man
> pages (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst
> (including translations).
>=20
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi all,
>=20
> @Michael @Alejandro (or whoever is responsible for man7.org),
> feel free to shout if you don't like extra traffic from kernel.org doc.

<man7.org> is Michael's website.

> @Jonathan I chose man7.org as it looks as the most complete and the most
> up to date man page collection.

FWIW, Michael has been following recent releases of the project quite
promptly (faster than distros), so it's reasonable to use it.

>=20
> Kind regards,
> Petr
>=20
>  Documentation/admin-guide/LSM/landlock.rst    |  2 +-
>  Documentation/admin-guide/initrd.rst          |  6 +--
>  Documentation/arch/powerpc/dexcr.rst          |  6 +--
>  Documentation/bpf/prog_lsm.rst                |  4 +-
>  Documentation/conf.py                         |  9 ++++
>  Documentation/dev-tools/kunit/start.rst       |  2 +-
>  Documentation/process/adding-syscalls.rst     | 30 ++++++------
>  Documentation/security/landlock.rst           |  2 +-
>  Documentation/sphinx-static/custom.css        |  7 ++-
>  .../it_IT/process/adding-syscalls.rst         | 30 ++++++------
>  .../sp_SP/process/adding-syscalls.rst         | 30 ++++++------
>  Documentation/userspace-api/check_exec.rst    | 10 ++--
>  Documentation/userspace-api/landlock.rst      | 46 +++++++++----------
>  Documentation/userspace-api/spec_ctrl.rst     |  6 +--
>  14 files changed, 102 insertions(+), 88 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/a=
dmin-guide/LSM/landlock.rst
> index 9e61607def087..8b1e8ba36b719 100644
> --- a/Documentation/admin-guide/LSM/landlock.rst
> +++ b/Documentation/admin-guide/LSM/landlock.rst
> @@ -143,7 +143,7 @@ filters to limit noise with two complementary ways:
> =20
>  - with sys_landlock_restrict_self()'s flags if we can fix the sandboxed
>    programs,
> -- or with audit rules (see :manpage:`auditctl(8)`).
> +- or with audit rules (see :man8:`auditctl`).
> =20
>  Additional documentation
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

[...]

> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 1ea2ae5c6276c..e6b972f1f1b02 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -38,6 +38,14 @@ doctree =3D os.path.abspath(".")
>  # Exclude of patterns that don't contain directory names, in glob format.
>  exclude_patterns =3D []
> =20
> +extlinks =3D {
> +    # when adding new section update also custom.css
> +    'man2': ('https://man7.org/linux/man-pages/man2/%s.2.html', '%s(2)'),
> +    'man3': ('https://man7.org/linux/man-pages/man3/%s.3.html', '%s(3)'),
> +    'man7': ('https://man7.org/linux/man-pages/man7/%s.7.html', '%s(7)'),
> +    'man8': ('https://man7.org/linux/man-pages/man8/%s.8.html', '%s(8)'),
> +}

I wonder if this could be implemented in a way that wouldn't need
changing any lines of documentation.

I'm thinking of something like this shell script (sorry, I don't speak
python):

	$ echo 'syscall(2)' \
	| sed 's,\(.*\)(\([0-9]\)),https://man7.org/linux/man-pages/man\2/\1.\2.ht=
ml &,';
	https://man7.org/linux/man-pages/man2/syscall.2.html syscall(2)


Have a lovely night!
Alex

> +
>  # List of patterns that contain directory names in glob format.
>  dyn_include_patterns =3D []
>  dyn_exclude_patterns =3D ["output"]

[...]

--=20
<https://www.alejandro-colomar.es>

--kiomj56tvl4l64uk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlhaowACgkQ64mZXMKQ
wql0cA/7Bt4n+lZW55Ai+LFlBXH/STQVIbnMMKfiQtH17iok5Hyet7jCZPtPEZ+g
oUUWvGs2HCDjeUFZ9icR1THuTLbzN3vruPpMCPEjK5A2L9Y3QyiSQmjMxHyh4fnz
wJJro05l1wZlGsGgb+bVhOXJlKj1Ng0l3KiBUrVKHIWH8l+Bv/v11Crtq9p+Ku9/
3qdFkn1709Tl1OnF46gsWNPxZBZHJr+tA9GvVKT2NS1WuPKJy6c3R64puoXRXV2+
g3URqNy3EIrc8a5VTYTmRlxRWGQj9eumND94QObGrnp3ZCCMEkv2D7GVksKqC4Fo
rnrZkNRt5iFlUGAws/9+vY4xIMi7N88NYo3YNyeX5CgeuMNCQeXs7O6XgLlLPSpR
5lCL87Vqdx/us8gqmev0ZW68v2AAgn8XELeJBCLTYxGX7HoZXAZzGNaU8ujrbArx
1lcpEe6URHV6H1o78G5XQaDm2TPlSePDXbAUn/ceib0bbIt2fDir8DTeJaI5Vynt
iX+VwFLA8Il4rXNj1qTsdFFtI54djZWhIbxaEIgtBF8fbkik9Ye0BqIbijPB1XBc
LhZBSytmfph1KjdCrn0G7zEHLh9Rw9Q2A5lVJP0URntg5auW4gHCfJvp8FMK3VhQ
eSEJH2eSwSGUq36TCWTKXA/vPB6EEWNtNUkT64qgNQs2euV5tBc=
=Cq8i
-----END PGP SIGNATURE-----

--kiomj56tvl4l64uk--
