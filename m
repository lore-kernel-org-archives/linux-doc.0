Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF7397699;
	Fri, 14 Aug 2026 09:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701162; cv=none; b=cPmzR7bDbXJKe7+4grLkghX4b43KAJeRW29/i/KedH1NkmfxsMI6SpFFQM6fnJ3yH+xkh5e96kFX8i9kx4/rENjfPQDtbmIyDbetXJ6zjSskqIOlJzWKwzIH82SlwVeY6b3or+V57CVjsd45flcObS8M104gGhV31NGKFKhbeLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701162; c=relaxed/simple;
	bh=qXatzOtSlObI1NaAKiBYiFr18AMUInQma+wQu46aI+8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=T33G3JRNoJqWAbsMC9dA4susOpPrqcUa+3T9z+MM9rIudU+WiX0NEiTfH7nfLc+RizfR2Y81zHIVRzgnot0rNa2ydkiYOAuAttIZKiLs5DOcL/iXtz5q/Y3De53DhC/+IrQV8+aw+SQhybHgpeKD3pEmhKnRXC3Z2HBKQ7aXH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kq37hFZT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kq37hFZT"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4BD681F000E9;
	Fri, 14 Aug 2026 09:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701154;
	bh=qXatzOtSlObI1NaAKiBYiFr18AMUInQma+wQu46aI+8=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Kq37hFZT37KvXVkykLgDLlfoZpndrH8BENgvyImP2krHLEG1GxkMrhaoGsKcB6IML
	 49Ice9PCjHufQVfEpcGmOSl2gbElD2mGQlhHrb5ogatXwEnUghI4w7umohOcO08eUB
	 NiSW7ofCaGOGXOkbrOsbyw6ry+/4q0IWxNUk6CSw9N+YS+Y74esubopZBDsRn8mViZ
	 Pe3a56m2/vjaSsfhfeuFa+9ehJvw2QdXs9wkBHEkIRBv1gaiE9IhST22kiNvB8nl/N
	 r4MK8YxJpRYMZgYsqTRt5+7gvPw53nrqRA/aq5qwaUeNCQJjWRVRVdbGFYA8G+LGXK
	 BY5UiKBfhQa5g==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:52:31 +0200
Message-Id: <DKOKP5L9W231.2DH3ODA0MGU8Y@kernel.org>
Subject: Re: [PATCH v3 21/23] mtd: spi-nor: winbond: Add support for
 W25Q02RV-M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-21-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-21-b637cf120d5c@bootlin.com>

--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb
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


--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lXxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hqdwGA40nA8+hyOwt2ZBmiYFgGwfUj94KADxtB
2d2+GTXqoSZJS7CAN2kZjFfSlY0kHY1uAX0eMi7n0NtTlXvkyOMGIzQpoZ+gB4Es
3lMDVv8rbRd93MlFg78w1q8HlNU647vWQjY=
=3J0s
-----END PGP SIGNATURE-----

--bb679c07f9943f5c7f886e60545fdeb95be8ce31037ff00d619209bef2cb--
