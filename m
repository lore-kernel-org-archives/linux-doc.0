Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719773CF962;
	Fri, 14 Aug 2026 09:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701132; cv=none; b=EphyXHqsXRSmv841Q+R0b1d+MEJOOC7e+4ZrLb5lLcoPOJ9Oj7oD8N3zaIBEc5LGDVB7E/soZFmjboCY2FgBG9i5l4isA6wHWDvuW3kRfWXivLMIj/Y9lpnfX4h0MXgbnRQMAsaYCtxmjO+EwhYiqIMcdmoduh755BlWQKh1e3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701132; c=relaxed/simple;
	bh=ZjEgGR5UyWYuC7bo2ZSqxrX75AbIZW8r7AMwacJ8Gpg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=lfg5/iaK/X+DTKImcidswDEEQfn2jMYgR6yavyDRGxKAlZYMzGim20+HYyLtc479CCAMEJbRHeq5iLJ1QHNwaB1oI6ekJJC0MSAAgLE8PaUfhjHxwxu8Ul4sRoZ5bge3ELbYTjFaLSynOE42kzVTmRJ8gYn8bNoAfS3zWXAIrNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZlWQFvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZlWQFvd"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E55931F000E9;
	Fri, 14 Aug 2026 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701127;
	bh=ZjEgGR5UyWYuC7bo2ZSqxrX75AbIZW8r7AMwacJ8Gpg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=bZlWQFvd5K5vEmjVtWpPPlAdDSghRgoIDySJsrGGMrOTzGQRKBRtoeY41MsOuRwC0
	 0zwT47TwJcQlmI1mZxjX3ebrura5kVDYzGKW3vpXbzd4OH4au269l4x0pto7o+FpSp
	 wWcPwPmybTx+N8vyMVLfVNxep2vIwHaNUilEAnkqu92nAu1NS6NSBN0vrnuRWpViwi
	 NhdSmb2BhyBPwvECbXvO6hhF6ICwiSKEdivSuxWqzNQdJMsgCTSMmvPouLDAvLfSVa
	 puR1VyGb6Zv7lLECCqaVjp7Cl6jopHXmakScbP02hYMSkk81RqA30WdolAhMkIx+FQ
	 Ma6RrwmdI/N6Q==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:52:03 +0200
Message-Id: <DKOKOT054B79.38O3IU11OM7J2@kernel.org>
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
Subject: Re: [PATCH v3 19/23] mtd: spi-nor: winbond: Add support for
 W25Q51RV-M
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-19-b637cf120d5c@bootlin.com>

--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a
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


--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lRBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hexwF/Xjzb2Rja1m6yDd62MiqWfltIjUxRULdZ
Rn9z7fjBCRh3U+RLj4qPsOUfbmpdqXr9AYDVlUFEVq3Czdq3DVTVZ391yNcpj7EQ
vL+LDChqzbbiJhSq+QjO0rzyb5EAIgs65oM=
=PwCl
-----END PGP SIGNATURE-----

--ffffe9e9efb85a61a6bb44b1ced817c7a224b86fc079b57f44b3b3f0bf3a--
