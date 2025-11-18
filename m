Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5652EA743;
	Tue, 18 Nov 2025 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763459765; cv=none; b=MvKGi0qT3Z/Hl6FlRaikJlrAXqRDAT9RUDuyochhp3i4nCZxngVHG5OL5B+o+AHMDC+hGt2T9S0YBSI7GKhj9Y8GQ4qYfkE1eToP8fEzx7/N/rlSXYW2isi9J/E4vxxVxS5SZ0GLmGbNoF/ZIRDlZlmtb+O2MsmOnTRElvkK9ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763459765; c=relaxed/simple;
	bh=InKlqc0W8tXF5R9A3SsxqXbprdKb3GlL1HN1svWGNz8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=QmCuXCCNLiIFQRD1VvxMwLx66FwnhS4usrB2uwwTW11MujqWp/X7NOhsKEAVGs7xEzQ4vT3mDbkBew9SfByHobdZnqRSwYV7hIUQwr6PfttWOJcYlFUHFTC6Tg3SGNYJiL9SA/g4uGkJVp9O+wrvPFmVLNcBbZjmQXgnPftKO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTd3FGFn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTd3FGFn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74A90C2BCAF;
	Tue, 18 Nov 2025 09:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763459764;
	bh=InKlqc0W8tXF5R9A3SsxqXbprdKb3GlL1HN1svWGNz8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=pTd3FGFniNK6MLhZ0bJT2ucz0lCJ/DUQMRgKkTd7UdGshX9jcf7+9mEkMDT7dsSyd
	 HA51iz62cXr62dE35v0bXcblfqULup3tQtJ6tXTm7T/OLXdnE8BcWJvKCF3QL1btli
	 KtC7mD35mTA97zMi3Lax0yCeOExSihXC6SYrv5/a1hRN6WelzzwrsylOwEnX118qfQ
	 KskM3sDi20HQMg+VR5fdVS6k44jyaqfbbvgETiLcmkWuSUZ7B7whLjg2mWNh2KGgme
	 pfxwLhieRREl1gBtnUr4YIBsPOOcRV2KOwm8bY+VrpGIOR5smuSRpVcsTrpvSaXbNB
	 t3rl9JR1DtCow==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:55:58 +0100
Message-Id: <DEBQB9D7POZD.2S729874RIZH6@kernel.org>
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 07/19] mtd: spi-nor: swp: Clarify a comment
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-7-487bc7129931@bootlin.com>

--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> The comment states that all power of two sizes are not supported. This

No it says "some power-of-two". That's clearly not all :)

I'm fine with either:
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> is very device dependent (based on the size), so modulate a bit the
> sentence to make it more accurate.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/swp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/spi-nor/swp.c b/drivers/mtd/spi-nor/swp.c
> index ede03f26de3c65ff53c1cb888c2c43aea268b85a..350fb8cd67dbafa3c62201c8c=
06bff7131143c04 100644
> --- a/drivers/mtd/spi-nor/swp.c
> +++ b/drivers/mtd/spi-nor/swp.c
> @@ -298,7 +298,7 @@ static int spi_nor_sr_unlock(struct spi_nor *nor, lof=
f_t ofs, u64 len)
>  		if (nor->flags & SNOR_F_HAS_SR_BP3_BIT6 && val & SR_BP3)
>  			val =3D (val & ~SR_BP3) | SR_BP3_BIT6;
> =20
> -		/* Some power-of-two sizes are not supported */
> +		/* Some power-of-two sizes may not be supported */
>  		if (val & ~mask)
>  			return -EINVAL;
>  	}


--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRxCrxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iNfgGA2ECoEU7mxQRsw83tLKCZBT8ecBxd8m1+
RE/n0w1TK3trhWirXvTPG7k+kyM2etu3AYC2wk7M3+JQTGKrjMmqbuX9afvPVZJg
spcTnmfWbOgOiWeB6BKsNPlhblNnVRCW+Zo=
=jVpa
-----END PGP SIGNATURE-----

--e8ea989f2eb4e3b5df39076908a83a4f02f12c51b6f783b05b0fdafd2915--
