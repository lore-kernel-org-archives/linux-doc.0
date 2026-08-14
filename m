Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74BB35C6AC;
	Fri, 14 Aug 2026 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786701147; cv=none; b=Me9HUgkuy9Y0hRQzZQjjfe2OtuIUG1NmRN316MUq7MBeuJZWE8pX4kctfTI2yxVQjLsElDbDoeZshGoXAPc0sBZrVSj9lUe1LNMYfPhSqXSFTJiTwXvd8msH6ZpCBGohP6HQYapj1SR7uNFcMOT/Mk6Wy3m8V0TDNmbP1QlTg9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786701147; c=relaxed/simple;
	bh=RGIaFjEjGKTUS3t/KGTvWOkBKKN09Wnhe48eHpevMfI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=VDT2GIGJlZmSC0LHO9TdHbmOCw7JTz7hUvupGQ6wkXyJ50JkE013UDCAwds6ptsZlfvc7dbV8SZFkVoMY/TeRfzDLo1Q+QcMtCVX5IwD7JHH4pQJ2s7VCtcXwV+tgwtQQJxeogOJhj673zDQIzrlws1yaqtdAQ9OP/T9XZO+6j0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrurdxJX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrurdxJX"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 8846C1F000E9;
	Fri, 14 Aug 2026 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786701140;
	bh=RGIaFjEjGKTUS3t/KGTvWOkBKKN09Wnhe48eHpevMfI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=jrurdxJXZX5eIq730I6uz2WVidsRmALut/jfYfeA4huFLz0OefDZb2OoGkKhGWjNS
	 qRjFNx6QiueZYWafoNm4CkYvBSY32DVcHHQjTmFohDRp1E4iWij2jv0UqHcobs46+8
	 Qgnlx6XuJYe+4W7OwwvajReicd7W/1pqnzdWoTo4Q8U9dPS8Jt8QEocfnndQCIs1Ny
	 RCNoxrh641H4FF1FUeqsyIndTmXUsNiKxsZku/VVvOAJg4hNgOIJX/CCX7L/yhSSI/
	 3wJOkVduFhSXXXi26F83JHRLlWV6DhagSWeKAOQ8LOFQteEOTr8sSqSzgEHLumtH4Z
	 v8DBbgrgOtBWg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:52:16 +0200
Message-Id: <DKOKOYTY1313.1J88PSPUUDFZK@kernel.org>
Subject: Re: [PATCH v3 20/23] mtd: spi-nor: winbond: Add support for
 W25Q01RV-M
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-20-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-20-b637cf120d5c@bootlin.com>

--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450
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


--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7lUBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ioyQF9FmmcxzDGy3tZU+/RbpRePQhrWYonbw4Z
0St9k4B/9UP10/CmSOTWOWN1h55zjpWJAYCOhYJ3VrqpLPzXaCszJrwINrJkhJla
blFxKVsW6pLZ/24pRldSuKVuhAzifpezo2I=
=BWZl
-----END PGP SIGNATURE-----

--020a3ae608d6aaedb26dac0e7a007d292f1b85aaf719db6ddf3629c19450--
