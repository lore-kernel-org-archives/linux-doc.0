Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D803C401A14;
	Fri, 14 Aug 2026 09:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701206; cv=none; b=mvOmacFyNB0A14RbScu78SYYsXbOvq4AEDyhvBeBA0bAbBCVBxgwzne3zwA+XMnhByrNmmb3rCQT+qrxC8FFUIbPq+pUXQZ12Z5gZvDjsjHuMeK0i/JDh82PMw9qH3pcnPfa9EXrZxbquN8+G6LbvdCeT6AHXJQBE+msjXWVekk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701206; c=relaxed/simple;
	bh=bAXGcyr62NKtmgcYXABYv7zy7fLE4WFMwMzbW7IRjrs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=HDctI3aNSjRTv7Kx8Oo2qrWuw392pFlGez4O2d6bNtJlV9GZo3fSxMm1+TAgGO/tyXdIGwjsmGURsRB+bOU9qcTZ1OWZ6bA3tUURwmf53QthoQz8oZaCO3UM0twX6E+GT6X9IF3QjRi2+xSKmfPS1EpBj3UeuVSs8nODjaMLs5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AN1gpVVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AN1gpVVa"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 6183C1F000E9;
	Fri, 14 Aug 2026 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701190;
	bh=bAXGcyr62NKtmgcYXABYv7zy7fLE4WFMwMzbW7IRjrs=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=AN1gpVVakaagM/Z3Jzlba6UgmkWSCBDYKD4gAov8q2QiEMV8xFOMwyvluWCaPZw99
	 CWa0QGXAqNAK6HfGDiHVb6TlhtvdyMrUnBywzfclJ6+RP0+VEURKQyKYwjbIIVrzSV
	 AnGaRM0Dr6/ouEVOnq5EqaZv/+pVDVdRH1KbhaioIm2KLb1qNRZllZtgSKNsHUoVDS
	 Y5WG6Wi9gZfjOPHoPleR/82hkyGObaOsjs7uGZJpJN/K3HMWs/Os6DGEGUgX7wUxa1
	 fjjOhG672ZH5YtilASJu+Nx9DRd+D6Fqv/RI5j/x6n+76moZrDitNAS42H5qJm5b3l
	 JyMK9jWUSRTBQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:53:07 +0200
Message-Id: <DKOKPM4GS867.1EU3SKAU14NLG@kernel.org>
Subject: Re: [PATCH v3 22/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N/M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-22-b637cf120d5c@bootlin.com>

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> I currently do not have access to any chips from the W25Q25RV
> density. Yet, I successfully tested the entire JV family and all other
> chips from the RV family. They all behaved strictly identically, so I
> propose to nevertheless add the missing comments for the sake of clarity
> and completeness.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lgxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j4JQF/YHpRbiRbgPvXL2wC3ddX1BhUDUPTmRge
K9EROeaUmG7Xrxd44kHGLMA7Ow9UPZz6AX9f1X7fLl40ZAyVk7oGsiZdO4cQaX9R
acapbzyzCQFACvUxdZpTPKjKvqlRozpQGrQ=
=A5R1
-----END PGP SIGNATURE-----

--98cf7b1d1e452ec1706c2a26c20583123b5d65d3478fd36a5214653605af--
