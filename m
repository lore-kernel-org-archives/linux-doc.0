Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F374D25A2CF
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 23:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768175934; cv=none; b=mACJcd84FTY2mtZt80ThsAik7aCelkud2lcNvZRwfqXghoCKhU/y31BGzDacnvRq7rwM0IKuD5AsrEDrnWjrigqdcblw7tUSaqAHlGaU+s8z22PwQkSn2DWVIooG1MSbRCwzA5SmFzrboPNm9WJvQrfTy7d8liVy5FGRI5/ObWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768175934; c=relaxed/simple;
	bh=guzZRGS03gDm1FIP4x/SwMCFhKek4PdXMSa0fn/iZSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MKOY5wR/bdgxAcQBCphxqK9/fkMHQSfXKtdqxGbgLUnYndUaLOpGlrnNCor0jfTvcJ0T3Bmlkc7zaNv/L6U2mJLN5GJvRny5T+i34ZiqbDFCvoSutBEzD37aPwyynfI4iDpl0tjggHlwqpL9rWp34BGX+DvbukKhzDlMaTZyFOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/II44Qk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/II44Qk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACCDC4CEF7;
	Sun, 11 Jan 2026 23:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768175933;
	bh=guzZRGS03gDm1FIP4x/SwMCFhKek4PdXMSa0fn/iZSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/II44QkYYwH7es0EE6DW6QgWnbwLkmd0TAWzDrob7Ah8DKIL5bJQrl+NO9HmLcOW
	 C78/8alsW7Wq8FKJsew5Y+r8i/Gj5ZggfTORUnN0JL//1fp76SqRp3F2V128EtSVNZ
	 tYvc2Pe6eQoGO/TRLtqPW1B/ud1+tRdS58toRf8hZ4NLkaD5bw52WTNqtMMhoDa6CN
	 ye/9rNi44mrZ1+gE8KVVCB90bBoGDCs8Dsu+mASDpRct+dNdUvngPHgiW9vU15O0qI
	 E1v7Po9uw366Yp4P85SBEtHWjxuKL45oChKaCUMMgOg6nxj4GkfCG87X7x0pu9leKk
	 87cehbeQY1h/A==
Date: Mon, 12 Jan 2026 00:58:35 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 3/3] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQ4tqMVz-1WUc74@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-4-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nciy6rnymfo2kgf2"
Content-Disposition: inline
In-Reply-To: <20260111233534.183272-4-pvorel@suse.cz>


--nciy6rnymfo2kgf2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 3/3] Documentation: Link man pages to https://man7.org/
Message-ID: <aWQ4tqMVz-1WUc74@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-4-pvorel@suse.cz>
MIME-Version: 1.0
In-Reply-To: <20260111233534.183272-4-pvorel@suse.cz>

Hi Petr,

On Mon, Jan 12, 2026 at 12:35:32AM +0100, Petr Vorel wrote:
> Configure manpages_url to link man pages to https://man7.org/.
> https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-man=
pages_url
>=20
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Completely rewritten in v2.
>=20
>  Documentation/conf.py | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 1ea2ae5c6276c..16d025af1f304 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -51,6 +51,9 @@ else:
>      dyn_exclude_patterns.append("devicetree/bindings/**.yaml")
>      dyn_exclude_patterns.append("core-api/kho/bindings/**.yaml")
> =20
> +# Link to man pages
> +manpages_url =3D 'https://man7.org/linux/man-pages/man{section}/{page}.{=
section}.html'

Nice!

Acked-by: Alejandro Colomar <alx@kernel.org>


Cheers,
Alex

> +
>  # Properly handle directory patterns and LaTeX docs
>  # -------------------------------------------------
> =20
> --=20
> 2.51.0
>=20

--=20
<https://www.alejandro-colomar.es>

--nciy6rnymfo2kgf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlkOSoACgkQ64mZXMKQ
wqngmQ/+Izq1xfgmmhcigvvabKHce1ynQI9iStFMjU9WNvYjQ75kcamOX5FoMgLg
M8ybY2EEHhcowe4sY3APFNXC8k5cW7Mq3m9aVhx+RDRQE4qR49tsdvQTjMCLuTOR
e0oHDVW2PpUyRi4kD2gaATnui2PiX+q4zVJs/wwnI281PSpBOk9SjmkR9Jx0QV5/
mrwrFqw2oNbaRKZ6gfCJ8+gzcySirEBmxeN6O81WPJc5V7kjh8rChsnKHAbr2zlU
zusznr3FR8Ue0GZBI8TOXnNQpUT7bs2T8AEqKrN14Mq7uWdulggyx4OkmaKV7KVw
5J06kERQPgM9K/htIrzZzOnruueN9Np1HX4vrjEVH36v9CtKyKdWoJhicLKJwSaC
4/A56Mz/hz0F5AFL4lMJUYXukEXTBNYJWvO/XmoFs43ND+uAQDnn+SiAUbOUam4Q
hDaABSPOqVhtMJ3m1rKgl2jWHDLy6xALFQ/BzrmyT0kSV4SbNV/cCi4BApx682/D
y9GzeagRiGwm7Sx3GCJ/J+hIxB3YXWh1tXdjmsUJb4UFFiJRWkpWVra4ICy0Kg8J
QPflLmpfPAhVcVx5lfFW3F8t0MJvQzGKb5S8P/WItrLXtbEuqoUH9vCr4ZsdDTbh
S6CyCJ0Gj8GxUsPr63g6RyGmtvM+ChPdFIwxY9NaNhA4nAUfMIE=
=H6i7
-----END PGP SIGNATURE-----

--nciy6rnymfo2kgf2--
