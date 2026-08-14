Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73C3A451F;
	Fri, 14 Aug 2026 09:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701072; cv=none; b=pDjyyy+l69gUMNa0IVmVrumgrfZUwxa1k5i2VR0WJAsrwKiQNWPF0O3+iHiundXjCzgX/hITzCrkHjSmQkeREzC/cOuXYRjM3mYuclaRMv2byTONh2YYbEuWI6v8HcwexISH7U+IJeIpmGDScWYBkof6/az/U7TCqsreORb8Q/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701072; c=relaxed/simple;
	bh=pQa8E3J70a58uouK5ZkY1naDcDQ5smvxZfhEol9rE9M=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=M97u1UiSULqFoNbNN7sD7+dCtS43yGqc8ruGY/zUOIrstqRa1gWw6+Oae2MfkE8sReANpT5LgyaZC9Qd7wRgXHTdyauqU1Yut/TtSH0IlZemPf8v7CCOeEIhXtwmJETKbz6zy8bZbS49L53uwdanee3KWxiyVRxsy73M9/Ak2/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzLugo4W; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzLugo4W"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E38DB1F00A3A;
	Fri, 14 Aug 2026 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701061;
	bh=pQa8E3J70a58uouK5ZkY1naDcDQ5smvxZfhEol9rE9M=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=KzLugo4WAv7+Ac2UEJewO50+TB/otxAhNWeAR2k4F8XKL3cfgh53jEp6cMidQBGb3
	 XU/5vDLJDNZH5xxlCLPS/xozSlQEDPcao43BfsNIt9r1gjRxIKLDiEd3HAEGMrgE6Z
	 4iVQt9qXIasTBT/QlA4zylocy9Bb8ueh/uDiJOy9ZPPx8AibfDva1mKgCfDsCWmVq9
	 TZZl5Hg3wuaMvI44y1ZM4yoqyOmryZv23K04WDg3IvF02V5zIuAFToDMe4rfu+O8I5
	 A4i6kb9edJ9As4kEW/D5fhYUMs4cG5cQWG27uo6sD0MrUcfWmrVuibXK6nNmDlvEjg
	 XJWOJ8FAsP51g==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:50:57 +0200
Message-Id: <DKOKNYMTF9LY.3OHC0QB0DW0BP@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 16/23] mtd: spi-nor: winbond: Add support for
 W25Q32RV-M
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-16-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-16-b637cf120d5c@bootlin.com>

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72
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

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lARIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gKGgGA6n+bSsT0/0zeF/p8j6ZbNmEKMg8Yl0qP
t/adABc19/jvP7zCgdB/x/0qm5VLEqljAX4tZnakfmhHSuGxuT1qKMgbUTCcAYfU
0LbteIWgxV8++yeaVEviAaWigpICJoLRPTI=
=XqCC
-----END PGP SIGNATURE-----

--4324beb7adebef9a97b24096d99ea7f9150c34c6d7ffb56aea0eefe51b72--
