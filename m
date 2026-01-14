Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B4F11CBA
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 20:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768421038; cv=none; b=km5IIfOLSQ3s56YQMkuBZSBsPdbPhtXccgq3ySsZU+2PFTCbex86rKjtwSOqiWEzki3kq7yLmE5W/sp+maYnjpV8j639DdW1GhKII7mrYV4izAktNHj3tLdLbvBflfg/wDJ5Nebtfyj4gdB0X2AtPyVg3ycRMWcCUs0Ll2aTG4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768421038; c=relaxed/simple;
	bh=YJ/9RtyTWrF94lAAKmtfJmz/kZdaef1WQ/WEPV7Osys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOsB06cym+SduaRfwS6Szzj3t47u3MK8NxD65WBfHVpPrURvsml2PkzKo99+YD7lCtJmwPqzAqMf/NNjYpRhjc3H1Eg65R5VAUAO5jc2Yi9gvQS623yejTCoxcKvfNx++Zsl6fpWrVsSh0K0RXrnndCWQUwlWHV3rxcNBqxVbSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxITzHBy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxITzHBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B66C4CEF7;
	Wed, 14 Jan 2026 20:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768421037;
	bh=YJ/9RtyTWrF94lAAKmtfJmz/kZdaef1WQ/WEPV7Osys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pxITzHByi3BWrq3G3uL377+UKo+UySLnAa9hn6sDlCnropp0I32PhPcTR4dDIfuBn
	 lW8byRqQOEmPztdz/ZXHo66rhajo9iE71OkbI7T3CH7vu6HtpV07TZDgBR3ucHbiLr
	 FGApm3SiA+8C1TkKi8ZpWa+r6bZQKaKHUs/QQwrwcTAgkpy2Uebr2wOkR3Joy3UyNv
	 qllhlXMkYCW7ZboRNjgN2zUSmYN+xvP8b+yx+6eVAxh06Lf0STGDL2DjIcCAPXwzgt
	 YismXD1HyCQNp0+n80pVqGtBqoDVnoHpbjz2aMTVBQ6myQN0gm2Sq7e4QcvkwaH/Za
	 dFjlcAipUGg6w==
Date: Wed, 14 Jan 2026 21:03:53 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Askar Safin <safinaskar@gmail.com>, Michael Kerrisk <mtk@man7.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, man-pages@man7.org, 
	pvorel@suse.cz
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWf1cM9SsMuH-Rxi@devuan>
References: <aWFnRcjl5SogBakq@devuan>
 <20260114195334.3958694-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eucl3b4psmflgfaz"
Content-Disposition: inline
In-Reply-To: <20260114195334.3958694-1-safinaskar@gmail.com>


--eucl3b4psmflgfaz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Askar Safin <safinaskar@gmail.com>, Michael Kerrisk <mtk@man7.org>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, man-pages@man7.org, 
	pvorel@suse.cz
Subject: Re: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Message-ID: <aWf1cM9SsMuH-Rxi@devuan>
References: <aWFnRcjl5SogBakq@devuan>
 <20260114195334.3958694-1-safinaskar@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260114195334.3958694-1-safinaskar@gmail.com>

Hi Askar,

On Wed, Jan 14, 2026 at 10:53:34PM +0300, Askar Safin wrote:
> Alejandro Colomar <alx@kernel.org>:
> > FWIW, Michael has been following recent releases of the project quite
> > promptly (faster than distros), so it's reasonable to use it.

Hmmm, he didn't publish 6.16 yet, indeed.  I hadn't realized.

> I don't think so. There is still no open_tree(2) on man7.org .
>=20
> I suggest using https://manpages.debian.org/unstable/ instead.

That would be okay, although Debian is sometimes also a bit laggy.

Arch might be more up-to-date when man7.org isn't.
<https://man.archlinux.org/man/open_tree.2.en>

IIRC, Arch has a good track of being the quickest distro to package new
releases of the Linux man-pages project.

In any case, I think either of man7/Debian unstable/Arch is a relatively
good choice.


Have a lovely night!
Alex

>=20
> --=20
> Askar Safin

--=20
<https://www.alejandro-colomar.es>

--eucl3b4psmflgfaz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmln9qMACgkQ64mZXMKQ
wqmskg/+Mp8psziBXoPNx3IOtWj92sNnOhr8b9lOQmddn1gb8w6jcWa/sb/i4Ius
rxHasl2Q6mNCWzb+JvCJdPk+ubHPNckaczyN/fWxZlBmX1p2Ave2+b17HxGISM0a
ucGIqr4AkmWd8MRyhmoKEKX+2Ui7uuwFS7pme2B/fcAQBVTcoQoT/L+rrkQS8Xlw
fiMmuDq77m8u3sfXXElnVBSqWHkNCvQT4HRjaBnZSyyY+KfN3jM8ZPpZDaD7ENDB
OjqFSF6aycGT953oUSs4yP5NJzIR8kdL08f4X+YWUrDoK/CMWDSi7ayVCavz4B5V
If8WtnCbJccF6VuPRC1bkE678NZEiyXIUGPQGpKLqK/9DAmnHJyuYZuGR4Cx7QJm
CpXUmwTtXz0k8cXR8yFWvPUHxmQsuvaNUKvK/Xxy+meVwgOysT1RaIAJhM+g+oYV
dzI/DL2O0vQcCGHZudykC8N4dWElzu4JF5BbPXM31jAiLtKDUolbdtJnrHkzhuQ7
M5ZCJeAZOxAeX6VR9XzAuD9dgmVYASg8CyQ1mGXrhJJfjwOEX5zXPY/cM7L8Kyr2
2Y5qO85Lm7GOc2FzQ1jVlu3dGSel3RfjgaNHDMA9ddMQmcrXerS+bcQ6zNxnwvzy
EsxXFHc6KXfm7Tzv29qmpVQyfyDEKB0gsYbBGnOfgp84Bm048cQ=
=BH00
-----END PGP SIGNATURE-----

--eucl3b4psmflgfaz--
