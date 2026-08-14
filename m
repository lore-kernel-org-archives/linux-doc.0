Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94594367B8E;
	Fri, 14 Aug 2026 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700494; cv=none; b=M+tcAVZo5HOcY0rPqZ6ambD7qkGfy8RgwOX9ETTI4FXeHqQjfP+ji4vSuqCAc9MrGGiUHSwCQSIdeyitHCffVK6gwLFU3s7vXumxp4eYLGNBQveTlGg28FgPT3/jbT48RcBqQzyt+iBUCOJhub539vJYebhL2oaP7fjlKYyGPWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700494; c=relaxed/simple;
	bh=Mouec021QwWhkbvOY0xKG8WDEVSG2UIkRZWo0+Zu9ws=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=HanI0gfxNIh4FNV9On0ZJ5+L3/5uKfctvBqoNIn/hlw4Ga7bnn31h5MGzulVuPTT+KrWQMe2oq+EoauqJplWhnIuOtM6LgTePjWBbOgFF/FLVGjah+pGu2c29L2CB1vfx/rquZWuJy4r74eJpLSbg//XA/jHQd0khN8odRbFfvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGoG2tUl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGoG2tUl"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A218E1F000E9;
	Fri, 14 Aug 2026 09:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700489;
	bh=Mouec021QwWhkbvOY0xKG8WDEVSG2UIkRZWo0+Zu9ws=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=XGoG2tUl6NlXa9/xnTaPSgJ4dGFq9SGZYiBfte/zOH9ZACYrjBDsEzE9FwgSCgXJh
	 deEJG/J5CnlzReGiM7eY4BhFybQeo1ldIBntGCiQa8ncYmW13qXbnOP2f9leRmyRHh
	 Zq0m1U2MUJLeoJUAhIOfuhYz0e/IhG8QozVTdaijix4kpgV3CyjgkgnGNM1joqRvGz
	 O/+QEJr/A1hB0+A0RGpMJckmFZm/h7SUosytF4s4BVQIovlLKjAKxRacnOANE0xGXl
	 Rm4x8XWhnQLWJ3zuR2xVUR80+4exO1YgUCEizZEJaPgMWt10eeTsA43AC6NbFLQgVr
	 Ze8XhUpt5aCXA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:41:25 +0200
Message-Id: <DKOKGNRZQ63P.3E1LM63BEAQ5Z@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 06/23] mtd: spi-nor: Create an indirection on the
 part name
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-6-b637cf120d5c@bootlin.com>

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> We currently print through sysfs and debugfs the name of the part if the
> .name field, which is legacy, has been filled in the ID table (otherwise
> "(null)" is printed). These IDs had an interest until manufacturers
> started re-using more and more extensively the so called unique JEDEC
> IDs. At this stage, a name that was tailored for a chip sold in 2016 may
> no longer be relevant for a chip sold in 2026. Still showing this name
> through the various filesystems may confuse people, removing these names
> cannot be done since they are now part of the user ABI (because of
> sysfs).
>
> In order to allow overwriting the .name field (which is part of a
> read-only structure), let's create a spi-nor pointer which will by
> default point to that .name, but which can be cleared in fixup hooks to
> make sure the name is hidden on newer parts.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7ixRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gfkwGAn+E/Z3W8sOL6jUWx8OfIMeOInPNl3KQP
A0KLjLQEzYH4B7PTsNTZGIGh5Rve79nAAYCjnFw9/rBYumr2UMeVS0p8GuSvLHef
wxYQbofkSnJjUcKzPvSbO3QsWRzABFlFCDg=
=dYL5
-----END PGP SIGNATURE-----

--b5a6263ea0d299267e24cdb2e9460d5a701c512cffd28e15b6d40265832e--
