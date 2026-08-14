Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370953A0EA2;
	Fri, 14 Aug 2026 09:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700828; cv=none; b=cp43gP+8wi40r4VIrgDcAdwC2T7BuvIsK+Kk3pk65/XMYBpLCRajbrFCLZ7xb74fKe9rwEVPWfp607gA+R+EOYDzODaSuJu4FcVTrd+cW4yUi3ssuqqAHHHubvrs8nZGdaM79Qpjc+V4PW/joZWRr4IV+Pnn9fw/CLRRhi9Hjds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700828; c=relaxed/simple;
	bh=4VNfwjyAnAmmzvSoAragiapp5OE9k6P2HCDQUcYZ/nE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=t/ShyaAwJuNqKsNeeoG51FK2wHs81S+8Cu9yNAOMVE/qItUElRoqnQOB7NTT9poMdSz8XUnO8v5IyoZTUVistp7UhDaDBtzgK3rOevuyVdCglH3tTDwhUnnMk4d3x85oMLHyXKE+J2ttFRdPF28MqL1ar7DHyqd2UzuWCwcy0KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaE4hbRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaE4hbRF"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4AC421F000E9;
	Fri, 14 Aug 2026 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700826;
	bh=4VNfwjyAnAmmzvSoAragiapp5OE9k6P2HCDQUcYZ/nE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=KaE4hbRFYnXB9fWew8qKlYmOTI45OoJACudCeD7ZCDSEtTYAlBGWbn1Xd4dU6qdFi
	 B4Z2eNUqqGbXSpu731qIqHVc6lijvlqqIxADlSTn+SM1A7lHtklDeZNBX0TMuhpLU9
	 iEW7Ha449bNdRRkpCqpchVMrDCQicyijWaam3oH6Mdt/8xwrBEanJjCqhhc6i0e+2w
	 KDXC66zMQDKXDo0lfStCOTAWodPu2SgTevFw6EZMA0lvRs+6D6LKnLd+syDrtWO5fo
	 dw6T2MuDeV/WS55nzvH4R53i0nwJlAv8ZZIwIgTXz6O9J8Fvhfp2gxCDpYDl/+hTjE
	 kbXOPk538L+4g==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:47:03 +0200
Message-Id: <DKOKKYUYF350.2OY5OV9GH1F9E@kernel.org>
Subject: Re: [PATCH v3 11/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-11-b637cf120d5c@bootlin.com>

--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d
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


--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kFxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/inygF/QCxPNRTnZxAAYYBX7VV4otFVPDHl8UQn
3KGmBmWPJPi29sCxeM/SPxHfYh3R+ZXsAX9yNNX5lN2Qb2MM+S4vZR0rO4+sqdQp
5A3vaxGZmoFaystAJTAyMqUcLm66ZtuAdlY=
=jllR
-----END PGP SIGNATURE-----

--6a177f5a691e43c4aae7999c0349948d3e6064f8fe63dfc5058d81c1e62d--
