Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3628C3AF677;
	Fri, 14 Aug 2026 09:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700898; cv=none; b=iRWez1iRDC64YPuijf4RXdvqA9DuE5idpZJ4i9bAOIrpAzRgJrtF+xMtqVBb2QCyPiM1e17L4oyP3xFm/64eaJX7aln6NeiuK5sIqfPAKnRzT3mVWmaha8A/oVXmoAkzA4CTElYJBeRmhMIjWM71y8rKTIEBBBZaK1gBYEAjgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700898; c=relaxed/simple;
	bh=VWz+imdVnkbTu/11eqAcvWDbo6t8+5/hRTqaRkt03Xs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Y9ZVpZlknRvjBMw/7Y4pjqKhCwm52wxBAkU90gq6FbB4puaLoCAWjmg0KbxRaPjdp7B3dRDmVpHCdIuH324vmxVyhfx0r1pCi73LY68CWYkF0u0tMpJR91pZUla9pCbGQazVf9wl63GgnCY+m2+zHZEn2BWEutOSPHBBhEvmq3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+CZuGTf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+CZuGTf"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 882321F000E9;
	Fri, 14 Aug 2026 09:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700897;
	bh=VWz+imdVnkbTu/11eqAcvWDbo6t8+5/hRTqaRkt03Xs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=j+CZuGTflKvu56ukvMb6j8Fh+26sB80WXDPMEntQM3wu/RuEBFzds8N75ixmPI/qS
	 Se9GfVWqoD0rf+YnVRU8H7/gjG3Ol4tSFOXVPmeQEr6lwm456bNl82MiajfBD7YrlW
	 EbheSu4PvWYo3PiyKAXvdpSubjc6YlNuA5Yh5ZBAYBa70Ubd0808T7b73/nWq/l50a
	 8MYMhft7FrKPOuR7QszdOVuNwwZLgg5gs/NrFRVUSA/k7WWqhpvAysMKo+2lB6i2u6
	 /1TT+Ghd/SRgv6uwb5uwvf9juRIY5f6z+hbCd46HgGZ0WaRltPeXaQdrAVuRfXKjLT
	 BkfvTvW9x5IkA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:48:13 +0200
Message-Id: <DKOKLV5T1BNI.2CW9UBFLOD83Q@kernel.org>
Subject: Re: [PATCH v3 14/23] mtd: spi-nor: winbond: Add support for
 W25Q02RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-14-b637cf120d5c@bootlin.com>

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision with the chip of same density from the JV
> family. Both chips are very similar in practice, it is mostly a matter
> of electrical differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> the new SFDP (rev F) field which forces an alternate write SR2
> opcode (0x31).
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kXRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hWeQF9HWW8qaN8GBeNIv0SV2a0iTZpTSXMHutL
r3X5Y3AGtyacF1H9OcDzkxzubK+HQGOhAXwOSnUC1b12XjeRxcD9coh+bU1WVSpC
Iq9jvbkbTwFJfJ/cwJvxETi0KcUArg8uxMk=
=xmBz
-----END PGP SIGNATURE-----

--2256f4b7726d14d8b4ae61d3083ca8c3ffa66a7a0da8dc2b2cef6042dfd8--
