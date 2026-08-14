Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC96F37E5F6;
	Fri, 14 Aug 2026 09:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701098; cv=none; b=EPIj3v9c7JRBt0Ddn/iyuZFrPEuDEuRWiyIn9etkuQQfoe2wahV0TuKye3a3nBGXklgFWpXE14NCuKruTyOmfSq24HF3HrVOUYOxkra2kUDO0rcK5y/7wr8ST605wezI3dEsFvNQ2KmtBY87IdWUATcy6rImlr/jpcVk2L2K92k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701098; c=relaxed/simple;
	bh=yKwWlv1KBBDVcGlVvYQaRm4OQYG5+7xIMGwbAKrSt58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=EL4UU5OFwGdabuApjmRgvd/OenUTGvOkNZC26DRo8oI39ibYp7fO74CZaKBwPH4dWxgGw/HPBdndmzi2t/pN/GxqRL91xiVnnGX14gInUoQjfazsOpQS7VxJVXQWvE3afn7LkQyYCvspsT/j8/6+Ijl5Cb99hnqit6f8OcULaOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dBQ5yEWG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dBQ5yEWG"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8FC691F000E9;
	Fri, 14 Aug 2026 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701092;
	bh=yKwWlv1KBBDVcGlVvYQaRm4OQYG5+7xIMGwbAKrSt58=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=dBQ5yEWG5cMXYljpEvVc9W/72QRI2W+NaM/8gpARQFmOdu62rAaQ+RWQ8ixuTQ5WF
	 2w/gpLl9YQ8uP5i+ihSr8IqRz+sMcjIl4RDqAtyUtGBtwYdzd0uls5uzp3K5WzZC1I
	 roQnI3P/7iYgiAmpVKc3HP1vmRe/Hiqh1oSzeXsrtNMjCNpkrSiGXXz19CgzLsOYPM
	 xfxm0psvux9MBq9qR7sHjfKEMyGsPoOcsY3icAiMQZ8cab0w5oFWgb2xr7SJ5cJLzX
	 FMSHQI38H4vgt0OLrBF3ohGMNnYXjpQlRNvACwyNxJPduSFkiUHT/zxN02H4H60ptK
	 mz5Dy+2wMlmIQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:51:28 +0200
Message-Id: <DKOKOCLARP0E.12YCLA6X5CZLG@kernel.org>
Subject: Re: [PATCH v3 17/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-17-b637cf120d5c@bootlin.com>

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47
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

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lIBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iKUgF/drf5qwyJjnPwmEPk4RJL7i6CfQOL+3Nt
9b22BGkw7DuISaYohvZa9zIyAEaAoGaqAX485MjHM21TT2CXQEfM59C4EDBkCUFv
ARUz9cR0p0qznCSrqlL6H7TADS6j7z7/arw=
=xrbX
-----END PGP SIGNATURE-----

--6cc0eab69e2256015fedab41d7a75c7f3ee8870d7a32853a753f1e156d47--
