Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93193E8C5C;
	Wed,  6 May 2026 08:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057485; cv=none; b=gEPh6hxsmc7u06W8bzzRlsCWawDiSVeRPBoeXXZGr7BLinqAd+OLlEd3wMoGSfMC5SFRSZDB4lRHRyJUkABUASS7FcUoAgp78uKTrrXlrF3cdDWrGp0SMcy3xGwZ5/CtXkjqFrihpsF4IDKSMF6jkAFKpa1Colmx6/rPPsPtMuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057485; c=relaxed/simple;
	bh=x4Kzu3DSvB+xMkONDghyst4p2G5CH0NY5txEKz1Gx90=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=rGHmoWK+N0wnu5GJWKucH9fs98EQnCnNCCGlwwl1mSVJjds25Q1pGf8NiJe4HbQD1vooApbjY8wNEPgO8CConlg9BodkmVEuLJi2V8PnGFpUIFS6QoSuqv6+eJJBySogIHqDnB/LcSuQCH1BPBAPuQsVBQqu6F7a9qZHpwS8d1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WcceAVYS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WcceAVYS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059BBC2BCB8;
	Wed,  6 May 2026 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778057484;
	bh=x4Kzu3DSvB+xMkONDghyst4p2G5CH0NY5txEKz1Gx90=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=WcceAVYSZ12uRJJaHje+a5bxMGIQ1tnXWVnzlaPW+MWT+kPfPvlZegPXY9SCCeCCh
	 q9BSm5PZLCJh0rH9WN6zQoYr6XVVjkOAuv6A0EWIWmvJ8QOmAhahtTc8WYXAiutfyW
	 RxPLZrEb0mk72rUHPP0iP0x+Y2MJLivT9ZrmWuOyK6ccz183JPgdZVN1+I1sadbGZU
	 V34XgZOt/DhmKjXmIQL45poJNT0OuD+T5icrTc+Dtr+PTxOLUcFyz3RK4lV5a64nlk
	 Sj2YM7pq8eF+9x22vJE4HwDop8rWsMCG8lAxR27gcUDWq+LKDaxkHbfYKcytRAlhlg
	 inmo6FFd2sF0w==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 06 May 2026 10:51:20 +0200
Message-Id: <DIBGRTZ3BUEE.1GIAWVBNNXUY5@kernel.org>
Subject: Re: [PATCH v4 16/27] mtd: spi-nor: Create a local SR cache
Cc: "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Sean Anderson" <sean.anderson@linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com> <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-16-833dab5e7288@bootlin.com> <2vxz7bph25qx.fsf@kernel.org>
In-Reply-To: <2vxz7bph25qx.fsf@kernel.org>

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 5, 2026 at 6:14 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 03 2026, Miquel Raynal wrote:
>
>> In order to be able to generate debugfs output without having to
>> actually reach the flash, create a SPI NOR local cache of the status
>> registers. What matters in our case are all the bits related to sector
>> locking. As such, in order to make it clear that this cache is not
>> intended to be used anywhere else, we zero the irrelevant bits.
>>
>> The cache is initialized once during the early init, and then maintained
>> every time the write protection scheme is updated.
>
> What is the reason for doing so? Do the reads have side effects?

I don't like that a debugfs read will issue a SPI transaction, at
least not these informational files.

If we ever want to access the registers in the flash, we should have
a separate debugfs file/interface.

-michael

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCafsBCBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iM2QGAodj/4y+LGqm9YV53c2/YGEkzVsrj3w+i
ZSJBiz7L5WD3XKx7Sk0eqi30Ua6/rNXAAX4xUXCEN7Aa9xEbN6KJYu5i4NPEHL9c
5M8DqAkASm6gWJKeJXmnWRzFrjL9IVizs50=
=f4lG
-----END PGP SIGNATURE-----

--a4c0add991cee5d4c94cd50ba1c744ab3647074d71e77d29746d9541a0c5--
