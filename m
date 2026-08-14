Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A20372ED5;
	Fri, 14 Aug 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700784; cv=none; b=T9SkUzP5rBo5YphwLU2FSlZBTnk519QQ32mo38BoAvBXyFs+s0L7ZYRSZFxG6Zps8KZ20UE2msyV3J96/KcwZlkyeoKGVnHPtA6II5da7fk1iLYlCoy8HmWGPfqnq1/5W4YofQJ5Zo+Ng0o0UfpebxgmffKgsHNOrQIYiF2ls7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700784; c=relaxed/simple;
	bh=xwCczDKneAiRiPW2bw/ZofKZ8hyf/PH41QCzEmw9exw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=lg7q40FEtnyN41Rmx0WbiwZgOP34j7vWVDO1IQewzhH/RJ9q7Y8wVI2zWBxMQN0wNdbi2uUV03E0r4yt4d/qMsoEWDtOxURD7CPlxWmTLjg4+2k2jUOhVWEzFopgCAFlrvPM1WT0+4USX/XNzeqVcIdFyxbxS3CzRmpM+1zA0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVUYFQp2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVUYFQp2"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 629431F000E9;
	Fri, 14 Aug 2026 09:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700777;
	bh=c8go0naIWKd3/PsA6BqP8tKSZiqReUZtVsTy2qqALGo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=gVUYFQp23lNAsy6iyqd+FXHyYLArzLUo/3KapC138rM9Yb2m4uEVEcsP5Jt5iatfe
	 K4Iwve8/Fa77E9iyEz9z35s5AUWY6cPgSkTnsifVMo7wdd+qzqrz0Ul+LIbPUSvZtg
	 ML9aTuzp0//WMLM+n5dB3/4833i0ccqmQygMaV9WAbdwvNf6/CcYdrOgGw/PT5t5T8
	 O95k//sez/cEgxCRxKJwYEiTo2riyKTakkhrTQsPYKYhNlqrI3rx0sBcNYW78yPDvZ
	 rlpuiD+8hUiziP2e3YPToNOmx2k3Wu6L+DEygQIdYcacHnfvczB++IOHsZJrcmNb3c
	 DqDIZQUXL7DWA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:46:14 +0200
Message-Id: <DKOKKCF45CY6.2RXHF51EW6VV0@kernel.org>
Subject: Re: [PATCH v3 08/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-Q/N parts
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-8-b637cf120d5c@bootlin.com>

--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision between the JV and RV families. Both chips are
> very similar in practice, it is mostly a matter of electrical
> differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2 opcode
> (0x31). They also do not require the multi-die fixups which must remain
> assigned to the JV chips.
>
> Finally, since they share the IDs but not the names, we must hide the
> names using a fixup.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

With a comment below.

> ---
>  drivers/mtd/spi-nor/winbond.c | 56 +++++++++++++++++++++++++++++++++++++=
+++---
>  1 file changed, 53 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 583b1669270f..8c1cad9e21b4 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -146,6 +146,51 @@ static const struct spi_nor_fixups winbond_nor_multi=
_die_fixups =3D {
>  	.post_sfdp =3D winbond_nor_multi_die_post_sfdp_fixups,
>  };
> =20
> +static int winbond_nor_partname_post_sfdp_fixups(struct spi_nor *nor)
> +{
> +	/*
> +	 * W25QxxRV parts re-use the JEDEC IDs of the JV family. Their name
> +	 * being a legacy field, it is kept for the already established JV part=
s
> +	 * but must not be exposed by the newer RV ones.
> +	 */
> +	nor->partname =3D NULL;
> +
> +	return 0;
> +}
> +
> +static const struct spi_nor_fixups winbond_nor_partname_fixups =3D {
> +	.post_sfdp =3D winbond_nor_partname_post_sfdp_fixups,
> +};
> +
> +static bool is_w25qxxrv(const struct spi_nor *nor)
> +{
> +	struct sfdp_header *sfdp_h =3D (struct sfdp_header *)nor->sfdp->dwords;

nitpick, spi_nor_sfdp_get_header()?

> +
> +	/*
> +	 * W25QxxRV chips re-use the same ID as the W25QxxJV family.
> +	 *
> +	 * Chips are very similar, W25QxxRV brings mostly performance and power
> +	 * consumption improvements. The RV family does not require the multi
> +	 * die fixup.
> +	 *
> +	 * They can be distinguished based on their SFDP minor revision:
> +	 * W25QxxJV:        JESD216A, minor revision =3D=3D 05h
> +	 * W25Q512/01/02JV: JESD216B, minor revision =3D=3D 06h
> +	 * W25QxxRV:        JESD216F, minor revision >=3D 0Ah
> +	 */
> +	return sfdp_h->minor >=3D SFDP_JESD216F_MINOR;
> +}
> +
> +static bool winbond_jv_match(const struct spi_nor *nor)
> +{
> +	return !nor->sfdp || !is_w25qxxrv(nor);

So how do we know if nor->sfdp is already there for a given fixup.
Without having looked at the code, there could potentially be fixups
before SFDP is parsed (and the nor->sfdp is populated), right? Might
be worth to be mentioned somewhere.

-michael

> +}
> +
> +static bool winbond_rv_match(const struct spi_nor *nor)
> +{
> +	return nor->sfdp && is_w25qxxrv(nor);
> +}
> +
>  static const struct flash_info winbond_nor_parts[] =3D {
>  	{
>  		.id =3D SNOR_ID(0xef, 0x30, 0x10),
> @@ -552,9 +597,14 @@ static const struct spi_nor_fixup winbond_fixups[] =
=3D {
>  	{ .fixups =3D &winbond_nor_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x18), .fixups =3D &w25q128_fixups },
>  	{ .id =3D SNOR_ID(0xef, 0x40, 0x19), .fixups =3D &w25q256_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x40, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x70, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> -	{ .id =3D SNOR_ID(0xef, 0x70, 0x22), .fixups =3D &winbond_nor_multi_die=
_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40), .match =3D winbond_rv_match,
> +	  .fixups =3D &winbond_nor_partname_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40, 0x21), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x21), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x22), .match =3D winbond_jv_match,
> +	  .fixups =3D &winbond_nor_multi_die_fixups },
>  };
> =20
>  const struct spi_nor_manufacturer spi_nor_winbond =3D {


--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7j5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h3/wGAwg4Tj0G8wcGSlgT/LlUmNDI1fg6+WjKA
+eC4wYj6pKbfGaEBzX+owo6DW5ZeHVt+AYDachmn8snBkpX+QIgr4L0Dp8ZUe4pq
QrKhbq9ypJjUct42m+7U1bNB25shIT66Y5U=
=d7n3
-----END PGP SIGNATURE-----

--50d99e62946369cc8e508aa9b5f325ff65b4867cac4514a096602a3488ba--
