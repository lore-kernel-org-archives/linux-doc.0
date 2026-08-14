Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24B743BDDA;
	Fri, 14 Aug 2026 09:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700848; cv=none; b=eEu04uveYrmpoAOO1vAM6unyU8EtSLmVhUXUQsEPVZThlDJ1jywxP9SMYkVv9QaPRGVj5c5mOYBtksxhx4qzFOVOd1tjdigTHX3K87TQ6CdT+9uzM00294ZXsNjBG+YgYz7BEjzBogFhf4aBdasdW0W9/mZtkW7gRFtiek+Y1yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700848; c=relaxed/simple;
	bh=gIE0LA9qDv9D0e16yPeWQF66GtF1oZC+TmU+kYtAQa0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=uTQwLssJZDd6ayi17Bz0Mhm1YjsIIoVnxrXHVNJmijtn9UIv+ZPcdvBn5o6RvFg0VDVR5eP4tARKT1yx2P4pFH55Gxf/KCvC/1sOqshxw5bhe3TcITwKTqDSKIJvDkAm0AvlQ5nlnfsU2dtKSYpWl/Qgjfg5x3/Pd74eY4rRKNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSVa2eoB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSVa2eoB"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B7ED01F000E9;
	Fri, 14 Aug 2026 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700847;
	bh=gIE0LA9qDv9D0e16yPeWQF66GtF1oZC+TmU+kYtAQa0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=BSVa2eoB4ZF2wn6vEaCgd1kI7TdQ2p6H+99CPGZzgcHkn71GOJkXz3H367C7qfsrE
	 ulLZJW/LUkkKo8wmwsY8+0cjjCtK7ZFKUoCdEFm9X3grM7VFLyWpsVD+eLWIe+sBrv
	 Uyrpy4LiAwFEYWqi57+y6t9HDVyKjIo4AMJ2G2ssZtX7OOayCLxao21SPM9KIYPFnb
	 7IFsFZRiZ26Z1hTOt1yjdeztIVVaWibQpKRmUiEKw8jUH6liWcHxfpADLRJwpUgfXy
	 HTWZWyYL3SHa6564F5GQc3wI4VB2XYIcvXkLZMhM+dVMbaEu5eJ3Q2+TGtEQv9mT8T
	 2Qjb9BIY3gvcQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:47:23 +0200
Message-Id: <DKOKL8BG1W6I.2F1SN6BTV61BA@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 12/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-Q/N
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-12-b637cf120d5c@bootlin.com>

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3
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

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kKxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iLTAF+JV+xGNTl07VQ2YUPXB1GqMoJKLRIUorA
bymmUGYSjAiGj1zf7O/SkHZKOqdjVnU2AYD919lqC3dlMcZjOU8bzIK+uGftP2xm
RMjlqd9p6UL1ZTSKk0lveRjOMmOwcHc94Vo=
=cWBF
-----END PGP SIGNATURE-----

--4582fa21fa9f4a58a2099248de0c44f86946b288ad21dcf2d82951a18dd3--
