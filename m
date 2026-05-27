Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE640758C
	for <linux-doc@vger.kernel.org>; Wed, 27 May 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887010; cv=none; b=mMkfkkVPlSODijQDO2KWKk/nOAPFHrVMVCexQCR1dhKlleuAAxmSKz2TQfau3UmV96A3fQNniHvXIfMq1dNI8OCWRO5OekFvx7ifKG5GwyglhOdrdOl0rX0z4zFXMi8/F9ZLlt9Mvh+0iK4pLX79lgjChdAl6co/UkLIMD3CC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887010; c=relaxed/simple;
	bh=9RZXmD+TnynvW3HqdFQpHhtez52J164lPzrs0JKxoMk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:Cc:
	 References:In-Reply-To; b=sTc6ZCbw146yiLUA10mtDnd35IDXvx5APwDYc6+uUTZz20kaYPzuMRooeX8SzmV8zg5uVnAGH0rT7WLr5FCpSwwSAZ+amoz0yh8f4X/3zYKZlYO/vGMM55OxTyA6p4R3ggu54xlMRzT/y3P+BjajGAPsG3qTurCMR3gvV+Ti3u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJ0I8tVP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJ0I8tVP"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 1C6D51F000E9;
	Wed, 27 May 2026 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887009;
	bh=9RZXmD+TnynvW3HqdFQpHhtez52J164lPzrs0JKxoMk=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To;
	b=IJ0I8tVPyY93p0pSbj9KTUU9/F5Uy1f9OlgrN9ol2faMoU8bhjgme5sJuHjkuO8GJ
	 AJhfc+/JNKVk/Uoo48NTHCHmg0IF4VPLPZF36MEjCnY+kY1BfHY9GrM4dCaLnxLp+i
	 E1zzPkWQLYgry5onrmOsgvZ4iH6PlcP/iLNiIucgKhhwDDt8GyocRAU/dJKTj/jwdG
	 5J+8pqudq5LL8tdEvO/zHNfwwijrspeZxLkWAeYSeyekIyNwI7iOT2J8DgKSiQuT35
	 NGQ9Et3IsD5CARXCD/W0afm6YeCLX55r2AZg7R+A7yCwH1VE9caHjq0npDap9mWjre
	 fFQkDiESatDZw==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Wed, 27 May 2026 15:03:25 +0200
Message-Id: <DITHAAHCPP0Q.2A2I62NEBHJOA@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Randy Dunlap" <rdunlap@infradead.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260526172341.773398-1-rdunlap@infradead.org>
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org>

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue May 26, 2026 at 7:23 PM CEST, Randy Dunlap wrote:
> Add a blank line to prevent documentation build warnings:
>
> Documentation/driver-api/mtd/spi-nor.rst:215: ERROR: Unexpected indentati=
on. [docutils]
> Documentation/driver-api/mtd/spi-nor.rst:216: WARNING: Block quote ends w=
ithout a blank line; unexpected unindent. [docutils]
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCahbrnhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jZMgGA8apjyVdaVecYH9nkB3LTUpLtFds0aFAr
D9SEwVMC+++3Yab4kXno50ApHYXq8lIVAX9FCn5fnzp72uUTQ+lvLdVWOqFa2AT4
AONe3cGuhMN52XPkPfZ3wJ/Y3u1XBqYkqqg=
=7W3L
-----END PGP SIGNATURE-----

--20e2ed32076c9df12bacf9f58bf0fcd3fce525c0e7ac6657a7565cf29f4d--
