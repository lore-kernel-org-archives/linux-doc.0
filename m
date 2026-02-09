Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86A7309DDC;
	Mon,  9 Feb 2026 10:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633334; cv=none; b=Ff26T/yxZNpJA2p1XJzKrrkUnoiPBDS1a9MSIUYythSD2Uc2Q8e6Et9UQYKeJ6rQsNgfUVT5zdS5KV73dluCRmOs/nfkqhTcztAsoCa69Jb3GCg97ve8VvgdSpudLE/pT3Uc3iIfUkIu/IqT3XG05Ir4V+ZD8MFPLV8dgRyq8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633334; c=relaxed/simple;
	bh=/bNOPCYBtU5g2VEtSzjHAvVvYEboead4Gup6Z+g/KcU=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=IqtLziWsZ9cijlSWql9joi8K2DE2FmRW4ANoLKELObqyxl3HKDqaLSCJ88iTqskez02UXxBmlK54ucvdEJ7qqQkl2PK2SGb3S+vWPtyUEJ3hyLBtEv2x2AIm9IbrxZJhSWEhOaZiB8x+3pPpFMMDu4YOz3PWHKg5ZlvG0ggAQXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q/VARoXi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q/VARoXi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CF5C19423;
	Mon,  9 Feb 2026 10:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633334;
	bh=/bNOPCYBtU5g2VEtSzjHAvVvYEboead4Gup6Z+g/KcU=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=q/VARoXiNhqEtJtFZX03KE+w5iqC7Gqb3nfnGbLkTqliCyvJ7watodXxZe3xzcCYt
	 2hGFhFxe947De4bAYjkQo5croIVrpDQ5isnlFO+M2lxjzqhuxENwUKI3cbSykWATr+
	 a7B/Rnp8HCHgXjg+cKB8tqYNzfSfVhIOdjhXwAa2bcVeUohgXWYAasTY/6qH5z2gqL
	 SpPsUzL/gMiZc2iKPZ5Ixi5vxysGqzJCOiLd2LbLTYaeMjjW4O8X+XnnYxPc42ObtB
	 WCIrCcSeOzUy7cZu0tKYgga4XGIIKoRf1Sc646YikSPk0SVjTBS7Rm1HHulDd7jKiW
	 VjgAT2KSDsPuw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 09 Feb 2026 11:35:30 +0100
Message-Id: <DGAD4QNHS6Y6.3730026F5DQMR@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH v2 01/27] mtd: spi-nor: Drop duplicate Kconfig
 dependency
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com> <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-1-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-1-c462ef806130@bootlin.com>

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 8, 2026 at 5:57 PM CET, Miquel Raynal wrote:
> I do not think the MTD dependency is needed twice. This is likely a
> duplicate coming from a former rebase when the spi-nor core got cleaned
> up a while ago. Remove the extra line.
>
> Fixes: b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYm4chIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hiRAGAj7ZLzvHoJDioJ45NYzayPCD24tVI2RHD
dgHTmnL3g0Uv+IsOnM90sfC2ebfOjBokAYCfjZAAjBQVkrqtdqnxppUdAtXvzWOE
BsgqyAxjtwAqLW5Uw9prI/J2Oy/jSugLRks=
=ebxr
-----END PGP SIGNATURE-----

--ffe11d20c927c8af468912e59a114fe515f8eb2c90b98a4c698f79f585f2--
