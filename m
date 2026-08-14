Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894AA3A4F3B;
	Fri, 14 Aug 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701119; cv=none; b=l/jX2lF5s7vEJPsDVcs1H6xBC9ms6M05p0qmOFGIMNwCgBQ5g9YO7e8mQWxiP0hbe3OdCNMiCiqbU3GlFyGTk09nU0ArazGfHJVLDJhG+DeTk4kMpTcXvuX1jnoXFD6AC0Z/K7j5xNx2sG/GRlSN/bk09JbmUrq06XXummzD6hU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701119; c=relaxed/simple;
	bh=61kbslNUfc37Cgdoe1F4MHSwOraOF+pEaxJZP3gL7KA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=utfur6ufQy/qK5km2c8b/lwAR6NMpqwypQHppnV/M+DwGDgBH6FK8M6dncHTycX/FZ6Bo9gCwIaIKPrbxc66B/F6TUmMhRUBKZPgYLcXnC4Anu02jhFa3AlceC37SY7FmISNV4ok+Q6q+fGXp84Esr8iIhEdeABn+Phwwcy/SZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HzbeYaMh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HzbeYaMh"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B5D7C1F000E9;
	Fri, 14 Aug 2026 09:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701112;
	bh=61kbslNUfc37Cgdoe1F4MHSwOraOF+pEaxJZP3gL7KA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=HzbeYaMhXfcbxgDrC6DNBOOekW6R2XBD1evVqTjGdZ16BANlXghy523zJY3v5+cBm
	 o59CRSOXQHzYG+DbDL9xpD2HhkcYR2o1D5gUVWSi6Mlq7fKmxkwCi7t73Dwr+zSe2T
	 IRGYWdMcmEJhR+M8KXRjTKgNFwpGoo5+Zcj2Mg62T15BPGifWO5OyP14aEGNwyCJc1
	 1b8qeqI++OcdyqzDdm6r6Lc9VXy7O2dCAbyO6fAkKxcRXr0t69PekLczHlT8rlrsUk
	 Rhk4wf/pLBxjigd4NCinQHLW4DsqHqCEL0xoiwemsOu7jwqic38Oa8XG9KhOlgyeNI
	 Iky78L4uxg+lg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:51:48 +0200
Message-Id: <DKOKOM0RYY5Z.1CLGM0HL98EQU@kernel.org>
Subject: Re: [PATCH v3 18/23] mtd: spi-nor: winbond: Add support for
 W25Q12RV-M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-18-b637cf120d5c@bootlin.com>

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b
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

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lNBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iQZgF/TNaGzxbJHWYd9NeWOmEEWHqltAjSi72m
Gk+Z9MG6cWe4QWSh9oycWrU7qvf/niFzAYDdM4496O1nmLD5oEQ02CEugyCdSoYr
pInj0pa9MaJ+nDG+iXfqcyFDRnppXAfDd4E=
=eg8Y
-----END PGP SIGNATURE-----

--25c043042098ab638b37ff1a1e7c89f9b0d43f74a07d0066446c6e132b4b--
