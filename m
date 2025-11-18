Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD6430E83D;
	Tue, 18 Nov 2025 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459630; cv=none; b=MHraBj3BiNuS9Q4jOHmBw/Ybf/FJhDJK4hrLfBPmT1kdbHcM96JTc7iEOVnrvWWp4rgJc0+cyiXjrwWl4RmKMJwsXdrfkPTsIHJR6uW8V+nufY3HjZdnj2dSBtGqWZi/o9Ib8OMm30V3+YHYabE55ez+U+w8YAdA//Vr/cRo2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459630; c=relaxed/simple;
	bh=ZXif0z0AwJu8pUbUj9Y78tmAWvSNRn87Ln3peA/vm8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=teSDceWL4q8Srcl0lA+KB/CjQJdnb/Hqg9Cr5KUxJ0m8y0sm1j2E4fPaznmCVjAtD7GtqiHApgzYAFsPoDHzpbvAdo0xm1RyXixECJDTKX9hZ56xzZ8tCO7xGbRIEtgYfeTucfxH8ERvubz62jBGm1dfCdZOdRD1FL4SsWfGajk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kauk/82m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kauk/82m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE495C16AAE;
	Tue, 18 Nov 2025 09:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763459629;
	bh=ZXif0z0AwJu8pUbUj9Y78tmAWvSNRn87Ln3peA/vm8g=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Kauk/82mCzEKVNxGCToy1fQYjLA5UcSeBUlso0k8v99MoDaVaeGUw7FJhQgpvPt8c
	 lmO7lYsyrox8rRUSCr/OwGc1pQcWTOjDRU2X6zteh7Q1HFDhbHK7dv7KMtFXcQBFAe
	 aUw0oJj4W/AQgBM3QCXSGe9ybXY3L5lMVSS1bOIpBCka6LrcWjOFy8qpK6/ggKgjOW
	 9cnbXJDdTz3EOOGgDuSOXrVRqq6jnQEMHDLyOlNh2eoD8+RPFnie2HGfMb7CYxMA/g
	 pu2NRQ72Ej7RKpn7qZTGqJ3s7WJBdVLbRPdu+FSSAC1RB0R1vdTOgK3QIjyPuPUIQd
	 Fe9cNMq0ShvDA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:53:42 +0100
Message-Id: <DEBQ9IUDZJ7T.33VMFGMNKPEUY@kernel.org>
Subject: Re: [PATCH 06/19] mtd: spi-nor: swp: Explain the MEMLOCK ioctl
 implementation behaviour
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-6-487bc7129931@bootlin.com>

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> Add comments about how these requests are actually handled in the SPI
> NOR core. Their behaviour was not entirely clear to me at first, and
> explaining them in plain English sounds the way to go.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 9bc5a356444665ad8824e9e12d679fd551b3e67d..ede03f26de3c65ff53c1cb888=
c2c43aea268b85a 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -341,6 +341,14 @@ static int spi_nor_sr_is_locked(struct spi_nor *nor,=
 loff_t ofs, u64 len)
>  	return spi_nor_is_locked_sr(nor, ofs, len, nor->bouncebuf[0]);
>  }
> =20
> +/*
> + * These ioctls behave according to the following rules:
> + * ->lock(): Never locks more than what is requested, ie. may lock less

That behavior sounds so wrong... The user requests a region to be
locked, and it isn't actually locked.

> + * ->unlock(): Never unlocks more than what is requested, ie. may unlock=
 less

That seems somewhat sane.

Maybe we should return -EINVAL if ofs or ofs+len aren't at sector
boundaries. Yeah it's a change in the UAPI, but I'm not sure the
current behavior is not harmful and misleading.

> + * -is_locked(): Checks if the region is *fully* locked, returns false o=
therwise.
> + *               This feeback may be misleading because users may get an=
 "unlocked"
> + *               status even though a subpart of the region is effective=
ly locked.
> + */
>  static const struct spi_nor_locking_ops spi_nor_sr_locking_ops =3D {
>  	.lock =3D spi_nor_sr_lock,
>  	.unlock =3D spi_nor_sr_unlock,

Anyway, as it is how it's currently behaving:

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxCJxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h+XAF+LvYQh8HZrLfHPPAb0cMQbaY/UsOTI9hz
7rbuUUV5f8iSpIWry/kZtDMGL0Y+UyOiAYDFTvGFNRS0ts/YJlM8SBv8yvwvvUj/
nR1cFcSZujjF3WNxtmfF7fc2jTKmk9dbZqE=
=Og9s
-----END PGP SIGNATURE-----

--531a76bd078cc9f453d1f904558cd3aa131a48eab52083aded5b7a3a6b10--
