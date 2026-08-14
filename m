Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9924146C4A0;
	Fri, 14 Aug 2026 12:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786710382; cv=none; b=WnnamlZFOID5D/zXVSPVtZ9dtXmmujGw9tnZrqyABiN9MH7xWq2MVGs7UyPncQWm1kbEza+Eb05Yn14L2eZvPCcjHFOiniRTDdqYjJxCGopjCZ1gBL6ItwPo2BwFieucPYsbNONCNFi55m48kCtvylTqJw5KMPHpEDfodYqIxBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786710382; c=relaxed/simple;
	bh=oetNebrSGRQc4Dllyrq6sTFIBqE5Ra+p99/CTCHyDLY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=c8YNMWxhVElw5Av+6OuBmdA8vRnfLyZ5iQh8Y23qh1b/NoIxmthzTIwvtmkbmQzSzmKvPF4/qvcN/3Ty+hkPUC7wlmNVZ1L+sbU2QEj3OhXJo17VMf9ceRjkMQD/n2VCDDlcUqSg3VXMR0KOkgnITh4tuYc3qJUSgX2qs23eR1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwo9yToL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwo9yToL"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EC01B1F000E9;
	Fri, 14 Aug 2026 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786710381;
	bh=oetNebrSGRQc4Dllyrq6sTFIBqE5Ra+p99/CTCHyDLY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Fwo9yToL2yXnsfdj3rJh3xAwZudSd4QCinvuvnQ+swvN5DgcWQBrw0c1g9YSIjc78
	 rgEUsvo5ebdEc4MbS/YTeX55/PetfsYqxWUAweuyy4q0uDsA9vMVcyJ75R9nPo2yow
	 IsziJrpDkQzkJq7s4MFSd8jCOxFcMsoEGWCXPrlfHYjhnAvY5nPKNtwnjidSOUXSTx
	 5U1jVXttCaE08H9AUyOzf06Zubv3mwi1U9zXwMmVJsj4jEIexv4O1YTxUZpRHs6im9
	 8QEs7SDHlHGbtM3sv6iiF8Q9DQGltyfXUwAe0kKfEoHMDfjvOth6K4VBKwiD0IzEEd
	 oBAiikKrHqRWA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 14:26:17 +0200
Message-Id: <DKONYW7IRL1X.39T3OTS81X2EG@kernel.org>
Subject: Re: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> Revision F of the JEDEC JESD216 standard includes yet another
> supported setting in the QER 3-bit bitfield: 110b.
>
> This setting implies that the QE bit is bit 1 of SR2 (which is an
> already supported case) but this time it makes it very clear that both
> reading and writing to SR2 is supported, but not with the usual
> opcodes. The write operation uses an alternate WRSR2 opcode:
> 0x31 (instead of 0x3E) and both the reads and writes manipulate a single
> register at a time.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan8JahIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gCnwF8CPY3iwBhPpvrL/4ltGBFslvPWFA5y+gT
YTrDOpc9A5NxMg+5e80b7474K05FiJAcAX0VEIaIbdQAc1G70hMh0XXH6ZyWu/qg
l9PVRN5pQlW86mnyXDGSqTxzbFNbYxnErjs=
=7QDn
-----END PGP SIGNATURE-----

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355--
