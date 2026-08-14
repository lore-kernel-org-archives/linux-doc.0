Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428633E5A1C;
	Fri, 14 Aug 2026 07:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692658; cv=none; b=SxKclNZUXYNNgG4H0gDs2en67D4DiWyLM1iaz7cUNttoWUez4J02OSj2+ddsEBVB1PirFfq/g5aG8yYz3HwUEUt5hXMMXHluPMvhYFrA9GDuhpZs/bV0si1rOeSbnPF2XrCjRr9r6Azt+DpjLm9UDyc68Z07WfYB5aWKs00LF1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692658; c=relaxed/simple;
	bh=bM8eT9aWTFiGSsSbxvoU+I54vT+vTRzOZoDrzISQlEw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:From:To:Subject:
	 References:In-Reply-To; b=jB8z8IUzMRCdFIzawPW6Gphs/Jrpf+YUfHRYYOeyDoozrjR20mJ3ccrcQ1KAej5GJgbFlr+2yoje+HzhmVVm/P+jF3o3UGVKwYBkoqBhZFUGf4AfP27ZvxjkzSjtpLrFn7AEB5d/HaNw3xiD5FGLLNzGx7tbqcUsLmYBlQllK1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iO/Tm7d/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iO/Tm7d/"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B64371F000E9;
	Fri, 14 Aug 2026 07:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692651;
	bh=bM8eT9aWTFiGSsSbxvoU+I54vT+vTRzOZoDrzISQlEw=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=iO/Tm7d/uQCepDVKVuoWLea/mDfbjx4rmPpozAMg1UcMXQ8EXZnXRnzpKYZa9m9Vm
	 WF0CMtWn2UpIRzPrymaJHWGwmwGn1BxsNvfbDk4MFYPp1ac+GbySKO9OE3lTPV45yM
	 5DyacIeFvO+F8Ns4q0RMBJErrls78gHiVZ51iWJ0nd53blNj2R2Ki2BN36jg0WanKV
	 nkQb7zBXhZ6mBVLV1uT/zyxjVQfjZSN6lBjMwAnn75089+wGbCfq0dOFcTLiAY0p6E
	 4lGilHCKk1bKm9wj/5mIGvtriwP5zNVLIYrYOpLKILju2qww4dNsxy8tGvyol0qv/G
	 zwORsu5SUz1+A==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 09:30:47 +0200
Message-Id: <DKOHON3JP11L.1VAWG1VGCDUGM@kernel.org>
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
Subject: Re: [PATCH v3 01/23] mtd: spi-nor: Rename
 BFPT_DWORD15_QER_SR2_BIT1_BUGGY
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-1-b637cf120d5c@bootlin.com>

--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> The _BUGGY suffix is not super accurate. There is a behavior that indeed
> seems strange, but it is somewhat documented. The fact is, with this QER
> field the status register is considered 16-bit wide and if one writes
> the first 8 bits (SR1) without the next 8 bits (SR2) then the content of
> SR2 will be assumed to be 0x00 and will be cleared.
>
> Rename it BFPT_DWORD15_QER_SR2_BIT1_NO_1B_WR to align with the other
> namings (_NO_RD) and clarify the meaning of this field.
>
> No functional change.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Michael Walle <mwalle@kernel.org>


--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7EJxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hW7wGAy7PRiAZxI6sAkKTAtlaeeIsZHlw7yC5a
aI4j9dY5nHEwI1xVFmGzzsDFZJdA7XYLAXwIsynQLzZLwUduvu3QWxAKyH258VXd
MpcbIucfhmBPkBUHlwll4gMV3K8xhIxSmCA=
=ZwQI
-----END PGP SIGNATURE-----

--c45a5c71f3c522245c58086c2af59588910327fe09316da7b2bf41c0654a--
