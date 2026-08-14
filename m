Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3173CB559;
	Fri, 14 Aug 2026 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692677; cv=none; b=Tfi+O7Rc7WLVJGCYbkW2whz2/RpDp68K0Q1s8y5N/7WRsRuUGWiqnPo+gD4cz98s8gu5U1kRJpKWt051O1CPRJBDdrJ3+g8+i4XwDvdL3ccSmT/Bui5BQz/n340ISiVkCxSZDfQLOkHFei1dg98YqYN7nEFsgkDW2WBZXpnWrb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692677; c=relaxed/simple;
	bh=0zo9sxbBLmwRt2AyGVz8Dgdllov4byoOwzEtt6rHrTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=gy2puqm+C/egKugPt+Lk91rfGRf99a/m+l8qpQI+0xMUcB65r7LNqCW6MNB2oIeXpzIR2BAl7WNoQcH0Dg/fvMhhu5WDWAUVw37KkTUWwyjUkxd6D7xJwSvIgVX4zI6PW+O5OpOWFkQI+n4JTXGyGc0sLCEDyNuFPdz0g5EkZsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X12yDsDi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X12yDsDi"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 19E4A1F000E9;
	Fri, 14 Aug 2026 07:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692670;
	bh=0zo9sxbBLmwRt2AyGVz8Dgdllov4byoOwzEtt6rHrTk=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=X12yDsDiMbHtt/bGkdH7XJbOzteI/GIR+Iphjvc/5cc1RT2hOIdu2YtPDYIIuUG54
	 9Jl8eBRWsRXt8FDcncFIAWD8XFoQaJDpuW9zOBEKaZV+AP7rc+OTS99/pyL9fkvr4S
	 ZVgrJ/NW0Qo94bRE7XOQ3yRq8i46lUHUl7h/UBu68dVT2Qq9Nc0bLnG2qUq9nZP5FR
	 8IjKCd4aayIgB1ovqwm1DZAuRGVDfZIVMl6vxZy6K+MMkDHTQc6xUUvfulQJZW08+J
	 kiROBAk20PClPRt283tjTFruK0No25mgiWjTKedxJt4b+qrwsevJ1dIDSoFmLb4vfq
	 FQzRMHChb6KpA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 09:31:06 +0200
Message-Id: <DKOHOVZ9UJ41.2FS5JYPQ2WBTU@kernel.org>
Subject: Re: [PATCH v3 02/23] mtd: spi-nor: Create a structure containing
 the flash opcodes
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-2-b637cf120d5c@bootlin.com>

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> Create a structure named opcodes in the flash parameters structures to
> store all the flash specific opcodes. They are typically discovered
> dynamically through SFDP parsing. Move the die_erase opcode
> inside. Later on we will add new fields there, like the supported
> opcodes for accessing the status registers, which are almost vendor
> specific.
>
> No fonctional change.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7EOxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iv9AF/ei4fT00bM+8IDv0p1cB10M3pfUjHCZXi
Me21vMHQevWnoKPF0AzJwAPkSJX6wafWAYCdNi+JduCcouDow6Sv/VLow6gV401L
Vxa7jGZI+EUS2H30EglWavMyaqa5pHsJyHw=
=xrLA
-----END PGP SIGNATURE-----

--946133623287925df966d0c0119e3cb2093c8911f76f7be5842b18227371--
