Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4E03A5E70;
	Fri, 14 Aug 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700523; cv=none; b=JyXwHdll1gZpktKuvmtKf18G43EBMT8m+io0MrJec0meg+jwbbdyCkwH5UayBPAhck13TFE9oUX7w0ItcDhnlg6tE1N1d0p5xSCpST6YCZcbPdAiA0zTF8RyDkZ2yXYnK9qP8/kArfFztcrRoFJyy1uruoWz4pSi9UA8UeBJgxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700523; c=relaxed/simple;
	bh=N9DHnRo6Yl7zS695EjdQJ7W6XFMnCyJt1gS3f3MuikU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=tKI2avgc9jPvW5lhoPvFWXJPJ5rlAscx4wPTDBlxsiox6YYvl4s7h2MHa+shidMhLpw54KsIwJUoF6TCOtJ4IkfrESTGbDctGbpjOvVHSHph6L3/FVuHmgTKKkaDMu6RsvskJ7BMSCaolqFrKMxK1ljjZRriZgZ0PHU7+mxscwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AscQCVUd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AscQCVUd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BCC871F000E9;
	Fri, 14 Aug 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700522;
	bh=N9DHnRo6Yl7zS695EjdQJ7W6XFMnCyJt1gS3f3MuikU=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=AscQCVUdc5l7JMtPnrPXsYTnyuYJ77X4Pi0M7lK/FU/5REzCyVYW/WlALQO2YlJ9d
	 vbWzjH8PLFYTrRIV/fEYyaquOhckTiNi7b3sdKTYah14BjyC5torpD+RPThtAo3DtK
	 90qjLc214UZN5b80KurI2Chimnuft2b1YQA/Hm5RkBmwrBnSfYJ6OaQD4qZztkFhVD
	 6VI5ETwVY1dVZTbp8wzIsv02E9bm8mdjFLYkO0MkHzEpXXIPcmIL7ELLnstvvLRBRn
	 PwkQ+W3YHR5LlRJrd3dL0vOxtQ4kJQDfeL/Ft9G4HuatKvdd1onDZoEWcRqk4U0Z01
	 Fsiiz+kcxm6dA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:41:58 +0200
Message-Id: <DKOKH2Z53AWN.16GH2NERDWLJ0@kernel.org>
Subject: Re: [PATCH v3 07/23] mtd: spi-nor: Move the SFDP header structure
 to a C header
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-7-b637cf120d5c@bootlin.com>

--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> The sfdp_header structure is currently defined in sfdp.c, whereas the
> sfdp_parameter_header structure is defined in sfdp.h. In order to ease
> the reuse of this structure outside of the sfdp.c file, move this
> structure to the sfdp C header (.h).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>


--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7i5hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ijBwGAnJR5F5WVhkrlmwqZ34C5fE4gUtbSczOg
hqFYERO7W3dNtZvMO6Se+c5+CO+4jH36AYD65O7dGrHfzrgJZYra9srRZes9Q6n1
v5MnhOMlNomR4XY1C3WPNOi4Kp5YEs5Pwvc=
=dKdU
-----END PGP SIGNATURE-----

--56b1efb9786cb175d1e918947477c6cfc72c594e2777dc786a0b72fca243--
