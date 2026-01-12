Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3047190462
	for <linux-doc@vger.kernel.org>; Mon, 12 Jan 2026 00:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768176008; cv=none; b=NrYg68pB3TUTIvB+mh3veMNsy6EnF9nfU+vh5KiZpFwsOuo0ltq0L3iGlxaegnXmDBJha0eVK/IvM0ow0Ew0k1OUnKOtDM/EVHlD95/oHjnz0v4gqspA5C4SYkXCfQjU0rfzD+XK4PGAv9/a10uFbr0a+vqilC7da3bv2St/QHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768176008; c=relaxed/simple;
	bh=Q4bFSbY0ZqjkdSUln+RX5j0192tqvGGOLLrS8Omc+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UoHiAOxiNKXjSpwHVvqGfg4LquXXohzPUTlyxdo1Q3RnDD5FUywYccU/co0RCekODDk29wvT0VXoaoTsZgUulgqEz9Hic87CEh2GfvMCKikE9VVd6EG8YTZlHejkZybkQ5YuRoNhA6VBVrWzk9jHPX9EeG+7ZlXnq7OWT0gKBsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=swx3tk+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="swx3tk+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B34DC4CEF7;
	Mon, 12 Jan 2026 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768176008;
	bh=Q4bFSbY0ZqjkdSUln+RX5j0192tqvGGOLLrS8Omc+HQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=swx3tk+PE6XE9zLxSLuy1rdCSp3/QLR/CZUg6ylkPl5X/8jiDJqs+GngjZYiXaALh
	 RVp/8pytUh6QtUH8ABo9k/mc8MfqAgr3HMoa/ZPV5VxDTHaKLIMwAvqExSIhbDhTSK
	 MI/AfS3Sbgiu6CMdroWWLRq4kPAFIydoqGXqg8OHwceqXEIMnzTI/n0l7lL6gTi11w
	 WXdbx/RMJlP0PeBpHFzJPnb2vRK5AOWCMFxdOT/DfiPRYm8LlS96kh0yAu15ASvAul
	 5E2EWAHMue8nOT5W2nz30Y4nwG9j0ec4IubGbZVaGZlF1zThgJljxysHsvUkDvZxI5
	 Gk1aoKPNh6VYA==
Date: Mon, 12 Jan 2026 01:00:04 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 1/3] Documentation: sp_SP: Add missing man page section
Message-ID: <aWQ5ZvzGiD08UeRj@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-2-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zq6npku4pzv4a4n4"
Content-Disposition: inline
In-Reply-To: <20260111233534.183272-2-pvorel@suse.cz>


--zq6npku4pzv4a4n4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 1/3] Documentation: sp_SP: Add missing man page section
Message-ID: <aWQ5ZvzGiD08UeRj@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-2-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260111233534.183272-2-pvorel@suse.cz>

On Mon, Jan 12, 2026 at 12:35:30AM +0100, Petr Vorel wrote:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> New in v2.
>=20
>  Documentation/translations/sp_SP/process/adding-syscalls.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst=
 b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> index f21504c612b25..28f680652383d 100644
> --- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
> +++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
> @@ -172,7 +172,7 @@ describiendo un describiendo un movimiento dentro de =
un archivo, ponga de
>  tipo ``loff_t`` para que movimientos de 64-bit puedan ser soportados
>  incluso en arquitecturas de 32-bit.
> =20
> -Si su nueva llamada de sistema  :manpage:`xyzzy` involucra una
> +Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra una

Reviewed-by: Alejandro Colomar <alx@kernel.org>

>  funcionalidad privilegiada, esta necesita ser gobernada por la capability
>  bit linux apropiada (revisado con una llamada a ``capable()``), como se
>  describe en el man page :manpage:`capabilities(7)`. Elija una parte de
> --=20
> 2.51.0
>=20

--=20
<https://www.alejandro-colomar.es>

--zq6npku4pzv4a4n4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlkOYQACgkQ64mZXMKQ
wqnt2BAAtOFqLUif54ska/PTAPamTmaB94bT1sFKAof2RG1ZH69s7v1dPjaHwvJ3
pLlLng6K7+HqaD64s+l+FlswZtgQSIfOIvPzxQg9q5ScrkWoEt7nDk9AKARABvWg
OqOAA5PbW8Xn2TtPxDaJN1YIQ9VI9fdh6xOPF48nw2VfZDRr9tKUXPRhrYM2+cLD
HSoLnl7pGe+GggAd+d2vGjJpEXri31tqAeWKAheRHXOybexDEWqqRJps23dhw+Ki
X61z3SxxniDZPecPCsHNKI5Q0VR24QVSEv/WzSrhliJRCTL5FYciYauDr9SqjZnA
0QMcy3uPmhIwbvWecQ6QhPc+SUmGhpFQLiA7My/qiu36cKfAdoRCDpAt0KbwxlYA
fRZPbDq1L8sD3N4u0OM01Km9QznEO7HOCegRtwkdCvuzzsQbJ8CbMLd8of7i01tI
ByzPupYN/efwz7JHKs3D5DBAt2qpV4EfP4KaNFSqYLtO8u8WWslPPtjeTC/D2HMO
jRi8aj+RVXJiCcxo01BNmO2humcppVojHhcFw9GI5tWUmXRe+QT+R9TjHOMxnLVj
h/o34h2vB2hkeYAVbfCf77EHCi+ssa3fiv/aF19YqJkSIg8RXH5SOPWat5hhqGnk
Ttlw6bL4Y9jUfZ0upHWWBECroBYiK9NcU9LE6eju44zbAt2RCok=
=h2O2
-----END PGP SIGNATURE-----

--zq6npku4pzv4a4n4--
