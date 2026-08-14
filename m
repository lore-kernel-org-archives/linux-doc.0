Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F40397922;
	Fri, 14 Aug 2026 09:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700877; cv=none; b=l/w7SdjbvG/SdpvYktH1+1JIIpkrMy/6J/G4wcGY7+eXQLG3HVu99hyb1ZPZ77vJUdtjCRRQl3Ir6dUNlUZcBBnPrh396cw414mI6zJ5kRw0oUIKkzxgGthYAUmXmjY9FjqED2wFoibfNUrKf9wUBlvr4INLFYKcjJ66LdKa7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700877; c=relaxed/simple;
	bh=pNSlvDwfkqL67d3nSwlphGmC0ZNFVWwfipL6aC61x2E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=mJwU4aMQZ1FIWIUmg19OvPhu+zPmXmBxr5Ki1V04VpWb8D+fc1iFwv+Po4OO8DYDN7KjsTKLYUftDz5UK617oLqQ32yiAhA3EdfHOGXIwxiYTvACoeqX6X7pI3kWRa7DLPwwakCxjtD4XC5q+YaWDZ/+IDRzBZ7ZU3gycyCOhJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eD9y1M6G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eD9y1M6G"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 011A01F000E9;
	Fri, 14 Aug 2026 09:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700872;
	bh=pNSlvDwfkqL67d3nSwlphGmC0ZNFVWwfipL6aC61x2E=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=eD9y1M6G5UpTxC0nnV+kvA/MXb3TuYjlwhkk+pK8Jd5HtC25z2oLcjEnqonUUm95e
	 wbQWHTFEdoocLreSTkAWOglulFANn5lBs9R/YTZnJxRc4ftTxKo88unq0BHas3PNFg
	 Pd3jFyzZA/m3JVuvARpZGWQR8+HiTUqrULxRWz3mV1qeKoMQb5cD6y+8/HSxUY26sK
	 lEEp1l0gPNgtSYvd+KMLIqLbVYot9AOhkK8ytN75/jvt0g5IHleaE3I3LCZ/B+CLRf
	 bLqt7vKiHYfsmOkZ4kF3jEV6npb2N6KaTX7E0q/7dot/1ht5hMY63OrcuJ6mZ8x/CP
	 3FB7NVpW3MlqA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:47:48 +0200
Message-Id: <DKOKLJVLFN8J.2M6H2X3LPF04J@kernel.org>
Subject: Re: [PATCH v3 13/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-13-b637cf120d5c@bootlin.com>

--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f
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

Reviewed-by: Michael Walle <mwalle@kernel.org>


--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kRRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gZvAGA9WT5E0JXnbHC7KGtcjS3UY/jU0O5hEY5
ljw/KJbO9LHU00NMKlUmQjJPd0MFAmw9AX9wQzkDDfSfzrVrHlBTWBkWAPyEKIpA
Pd+m5QkDCSyNTuMaFKy0xKkqagmn60FDCq8=
=S/rt
-----END PGP SIGNATURE-----

--750d1e216d57a1bc49f227e38f8825dd3895ca452371391da81650be968f--
