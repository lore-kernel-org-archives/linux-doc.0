Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482EF372ED5;
	Fri, 14 Aug 2026 09:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700801; cv=none; b=vFuP/MKQPdZdwRVVBXc7ULY7TOq87/XXjBvza0bIoegFoib3+K+cZe3XqSh5+zDLvzKdqp1G3Jzlg1qKj0RVzdksIYsBYmdQn7jch2yCzx4JVKjnxhwZIJnx/+Zm74jMtngWTuvIwP/2d63nPkR9txyJkeu+hgnWT8f3eUcqp7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700801; c=relaxed/simple;
	bh=KPg8nILUcOooqlBYT8gSbRBkSFUAig//QvA2dFcQs9E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=AADSYkW7d5IIbUFy7Uiv6tXAp3gC+Is1EO8UW7AWzQKRsLHgmxXxDhw8sjaFM5aIhKUHghMO1GDtaZJqW0HVpWsVTVLWZD02hfYSLzG7Y1GfROq3K6AH1FL1A5EzKufaMA8KBzNJ6fTOQNXAExbM+9MiTdmi5ovjJ49SGt3pMFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OoyYCZho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OoyYCZho"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 890321F000E9;
	Fri, 14 Aug 2026 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700798;
	bh=KPg8nILUcOooqlBYT8gSbRBkSFUAig//QvA2dFcQs9E=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=OoyYCZhovfVfwLEBh1P8QJ08ZdIQuVp9B3+bg6n3fdLTVpjkNeTux1fr+SAZeozkw
	 NKtluWWONlhHdev/1bXs5NWxVfgT2CiygN+2nKcZ5nPfRL798Jpq40gZMRD52aW0TQ
	 jrwacuYdHsqsgC4qZfGULVdCMFmDiEfzEDA9s3SJ4ZDu2dM1Uqjw6l1LEeJ0BW7m2V
	 xCbe2Y+oesaf8qAlujQWEHI9Ji0oTG/GdTIXixzLXnWkD2Ddmwqw1ULWY6RdtO7/mI
	 Gch1NGITt0oNSPk+gLlNCUgjbrhVkZ5auJ2ld+lJLOjPvoHPA1ZXIOEVScQSnJbK75
	 MomlPbZ2Xqqog==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:46:34 +0200
Message-Id: <DKOKKLO117YI.2IPV0PKS6CVRE@kernel.org>
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
Subject: Re: [PATCH v3 09/23] mtd: spi-nor: winbond: Add support for
 W25Q32RV-Q/N
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-9-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-9-b637cf120d5c@bootlin.com>

--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b
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


--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7j+hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jYbQF/TlNR5jmMAcwBFgrD65LTnNg2qfV4cgd7
sSkbOdDlnSLIK+BeoaAbR86FYl5gcLpCAX4k6yZ9bp5elJBfReMrm1P9Xdh0CEiJ
05jGwFtBCW/DsXwizrF5Jswovtk114ijAUw=
=TL/8
-----END PGP SIGNATURE-----

--f335931778a6064751da4e78495df9e32cacdc8b42157fcea702eb3bb32b--
