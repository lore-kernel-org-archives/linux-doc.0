Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F0921E091;
	Tue, 18 Nov 2025 09:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457481; cv=none; b=OgvcItKu6uMjgFmSVJ+PtYdKKj8B981GSZz06FE9ghGwLE6Jt/8pGGwoPkZgx7hwMsPOFrRUW17EnlFDyw9+ApaXKvuw2BW+j5NOh26FqqLwspdTw/YM37dIh+HKk0MIgG6uF61AxNd0iwv82eBt2V54PR14BaNFqLzMpg2htuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457481; c=relaxed/simple;
	bh=E8R1yDsf/seLe0DPO0AuDBsiOinS7QE8v1NzUOFrc+Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=PybPlzdFCFFkv844YPd8iauWGGbQDkNd4vP+hczidJyIN5BAMO5kDhWhJeNIk8fcturyVLklPSPXQnPL9kjrHHZTY/ORMfd4x5eae/n7hg9I6p45HM4CCYfxt2hutNSMDD3mVTMjZHVdSrjaTzjt6SafE22ctJqZTte1oaG2g9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWyFZSuU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWyFZSuU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFDEC16AAE;
	Tue, 18 Nov 2025 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457480;
	bh=E8R1yDsf/seLe0DPO0AuDBsiOinS7QE8v1NzUOFrc+Y=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=tWyFZSuUKS9qOJjULaBCOQ+YOVDrbZ5a9t8QPvOlMw5DMtJ0asz2DUfuduotBkR7k
	 RaZ0LMXXNw9VQsDnVl9zthZebCV5GkD6tagZTaDcQvwXmRbvTOxzjtBJ2rlkdP4ydK
	 0mohGs6BxSDMF562T1ad/KidI2Cg1UDwCz8iFEx7to0KkoWGLBmS11WmEEALP/gjhO
	 YhWk2yqc1hrKMJBTkT+qoFWkG0iwx/kTt3TbiEBsnulA+b5dQvzWTbpPCWRR2kUyVp
	 IUjZtCeoyZD33Xz2TPRjZi8a4mgUAkIkSQh2ocEWDJn0VV/TdalooGtYyhgyyZODcP
	 RJ+Te6Zj7s2sg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:17:55 +0100
Message-Id: <DEBPI49KKW00.3MSWMX9HQL7JZ@kernel.org>
Subject: Re: [PATCH 02/19] mtd: spi-nor: swp: Improve locking user
 experience
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-2-487bc7129931@bootlin.com>

--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> In the case of a single block being locked, if the user want to fully
> unlock the device it has two possibilities:
> - either it asks to unlock the entire device, and this works;
> - or it asks to unlock just the blocks that are currently locked, which
> fails.
>
> It fails because the conditions "can_be_top" and "can_be_bottom" are
> true. Indeed, in this case, we unlock everything, to the TB bit does not
> matter. However in the current implementation, use_top would be true (as
> this is the favourite option) and lock_len, which in practice should be
> reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
> a positive number. This is wrong.

This only happens if you try to unlock the first sector, correct? If
my maths are correct, trying it on the last sector, lock_len should
be 0, i.e in that case "ofs + len =3D=3D size".

If it's the first sector (or sectors), lock_len will end up with
"size - N * 64k", which is clearly wrong.

> An easy way is to simply add an extra condition. In the unlock() path,
> if we can achieve the results from both sides, it means we unlock
> everything and lock_len must simply be 0.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> For me, this result was clearly unexpected, but I am not sure this
> qualifies as a fix.

That's definetly a bug, esp. because it will lock an entire
unrelated region. And it seems to go back all the to commit
3dd8012a8eeb "mtd: spi-nor: add TB (Top/Bottom) protect support").

> ---
>  drivers/mtd/spi-nor/swp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index 9b07f83aeac76dce2109f90dfa1534c9bd93330d..9bc5a356444665ad8824e9e12=
d679fd551b3e67d 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -281,7 +281,9 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lof=
f_t ofs, u64 len)
>  	use_top =3D can_be_top;
> =20
>  	/* lock_len: length of region that should remain locked */
> -	if (use_top)
> +	if (can_be_top && can_be_bottom)
> +		lock_len =3D 0;

Could you please add a comment stating that if both are true, it
means that both adjacent regions are unlocked and thus the entire
flash will be unlocked.

-michael

> +	else if (use_top)
>  		lock_len =3D nor->params->size - (ofs + len);
>  	else
>  		lock_len =3D ofs;


--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw5wxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/heWwF/ZUlOc2hLuhZZHqppA3A+DdCZmX8UvWPb
UD344wwQISdRs4KsLFbM6zHnJkawfwa2AX92vlDSPwHzz2XmbQZviHwbQ38znTds
q0v6z0xPWsaOOSomttrs1kgFU0GX40GKETI=
=dBmF
-----END PGP SIGNATURE-----

--79942e748942f4c32d8804fc5845faca7a0727109e277070ede628117ba3--
