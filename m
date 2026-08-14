Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091D23624DE;
	Fri, 14 Aug 2026 09:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701055; cv=none; b=oAHadUx4YVji/nIeHjg7jVzTwCbstnFskhv66SwY7BpQJIZV1OLsua8JU1IN/yhUFtidxazvOWWI524HMCLta5anCPrpKWi5ewqwUzvrqqV3NMHwL6gcRxfC3onrnUPqQMAae9MEdBf0nBtxNXkhq+RpUWFryHzMzMVvDORbq1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701055; c=relaxed/simple;
	bh=H0l1bX0P5bF/3uYea5/qCNJ8xdsZ091OoFQroj+MxKg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Fxq6l6YspsDDHGGm/WDZUrP8NJevByXdDmKUuRgCI69hDd4VzrtBxKOIphDC07XZDmzBTS4KyQYaMbWovArzKKFEgdzzz5oUz/9gRjPpGwpoHRq/RC79B0zwTRrGQQGEn8X+ON+BY/J+q+rIxO/UbdDkNxoq86Jtxv49PtPVbZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mD7JoOGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mD7JoOGg"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 275B81F000E9;
	Fri, 14 Aug 2026 09:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701046;
	bh=H0l1bX0P5bF/3uYea5/qCNJ8xdsZ091OoFQroj+MxKg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=mD7JoOGg+bCqUwWzQx+ixQedBeOVQjanfMooqc1zfcQ6jIy8gcx7WoB/8K5rkoF2l
	 t7UKFlHx00P899tgTWaG80iIdvkztAeeyecOtwcV4REH+kpeaMXuLJoe5zkanE1TkK
	 k8YmAU6Zd0Qq4U8FQKbApMKxYT3f1/sgOUo9Q1h3n73ju++5go2Uo8SnAR5QxVv27G
	 u1DGJba2odaNjCfmjGo0uQjgJGCrQcw1tm07eJIJLhcxyc5vvBd/qUB20GAj5uKrpL
	 lZBaQzgXYTMufhVJ1HMwQeL8adKkv0zpzHHlZGecNpRF0LiqIA5yTWTQ04XDyW+m4X
	 rgTnXICsfksxg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:50:42 +0200
Message-Id: <DKOKNRVNIE82.3SO99KA3HJ3TT@kernel.org>
Subject: Re: [PATCH v3 15/23] mtd: spi-nor: winbond: Prepare introduction of
 W25QxxRV-M parts
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-15-b637cf120d5c@bootlin.com>

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> There is an ID collision between the JV and RV families. Both chips are
> very similar in practice, it is mostly a matter of electrical
> differences (mostly power consumption being lower).
>
> As a significant difference, RV chips identify themselves as supporting
> The new SFDP (rev F) field which forces an alternate write SR2 opcode
> (0x31).
>
> Since they share the IDs but not the names, we must hide the names using
> a fixup.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7k8xIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hpuAF8C29KVtaU3EHuv/+cbDPwhdKI1sPD/5To
uAiMO+bgZdygmwbTX2ytZg2/MQnE4jxMAYDw/epGxqDoLw1bXO660VuEMFb6kofV
67B++mdpvZubIKKYRCrJyotWvjO0+JX7DmA=
=ZmIc
-----END PGP SIGNATURE-----

--eb63d10512d69bdb04bec46da322ab820769e4ca9794a46ddfb20fe54ed9--
