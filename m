Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47329314B71;
	Tue, 18 Nov 2025 09:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457729; cv=none; b=dk2Yp1tpp7SzsvBDF62Z9DTFIj2BhcWdznDZ/Q49ACiZ+7itLReYa197+ht5ozUeach6qPunh3AugpnT3CPx0zeWNxqARfZM4FxEcXN2nrGLwU9TFGvy5yaPgx6RxqromZUxbA/pX05mDgjvl+oIDvVvuhVTAodl04KsvvencdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457729; c=relaxed/simple;
	bh=cicC6ikllzlcaCehJIRXdn7UAs4wGJNz+Kpn/QZMzKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=SQmD4bO7BlAgFItMUwffWO/RtZL9jVJ2kzgR9cViiiKg20kW5Y2mIU//n/2II+7ZF6C1W5y0hNr/o46R/wxiltKc3u00BIIAoUNJagM3vX+puBa4/IKsdyoXnTERhLZpbtYHo77+8oomQHKqes4R/muYcZEfJoU9hm3eTHwGoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKvfn7De; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKvfn7De"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF326C2BCB6;
	Tue, 18 Nov 2025 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457727;
	bh=cicC6ikllzlcaCehJIRXdn7UAs4wGJNz+Kpn/QZMzKQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=HKvfn7Dew+r2WEOvR3GAW70Ou1Y1OsrneyH2+TmsV34vVIywv02CrySVfrzM5PBqF
	 NXMovihAN+moLRtR5o9yi7JsmEBSAd131LyO3FjOzo1bBk6Qd50TMhmkJk8frYjhJb
	 O7uYajZEw26CTSc8O8glPhPV+VJUdWGJ+YhAiMLiYESs9I4k9r82pgvMsh1THV2ymc
	 VRQKRbJlYL4qVAcKHEviJqXzjAW/dzgLe8/WQQh62wAumb05nD4Roxs2aRlise4m2y
	 tPbXuvbP60iyXUUjlB0o9BN4qr9Pl1GFWkEtlPxTC5rKSIn2qMfV+ZQTA2U/BYGp5F
	 1/fcn6ceHt66Q==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:22:02 +0100
Message-Id: <DEBPL9ORUVZY.124RXZH34EBBB@kernel.org>
Subject: Re: [PATCH 03/19] mtd: spi-nor: Improve opcodes documentation
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
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-3-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-3-487bc7129931@bootlin.com>

--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> There are two status registers, named 1 and 2, all the opcodes imply a 1
> byte access. Make it clear by aligning all comments on the same pattern,
> for the four "{read,write} status {1,2} registers" definitions.

Not sure, what you mean. The current comment implies 1 byte access.
But that is wrong because the WRSR can be used to write both the SR1
and SR2 (or sometimes called CR).

With that fixed:
Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  include/linux/mtd/spi-nor.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
> index cdcfe0fd2e7d624bbb66fefcb87823bce300268e..90a0cf58351295c63baea4f06=
4b49b7390337d37 100644
> --- a/include/linux/mtd/spi-nor.h
> +++ b/include/linux/mtd/spi-nor.h
> @@ -21,8 +21,8 @@
>  /* Flash opcodes. */
>  #define SPINOR_OP_WRDI		0x04	/* Write disable */
>  #define SPINOR_OP_WREN		0x06	/* Write enable */
> -#define SPINOR_OP_RDSR		0x05	/* Read status register */
> -#define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
> +#define SPINOR_OP_RDSR		0x05	/* Read status register 1 */
> +#define SPINOR_OP_WRSR		0x01	/* Write status register 1 */
>  #define SPINOR_OP_RDSR2		0x3f	/* Read status register 2 */
>  #define SPINOR_OP_WRSR2		0x3e	/* Write status register 2 */
>  #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */


--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw6uhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gNfwGA1yct2Qjoy0upeSglTUwnlnUKsZqbvQ0L
oszRORaINFV179D7irHIUgQh7iiHctUXAX91Iu2y4Gjv2pgfMaztgnWcf1FzOwFh
8gIxzIhVrCn6x15YfQZvzw/Zbb6NQO44ZI8=
=G3Ob
-----END PGP SIGNATURE-----

--2eec54e9365629b0a5b17971cee8ee891bc71cb5f2eba468934e7f3534d8--
