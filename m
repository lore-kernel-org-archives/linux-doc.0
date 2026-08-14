Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8003A0EA2;
	Fri, 14 Aug 2026 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786700818; cv=none; b=UPeAh9cEVCd+d0QreE1yI0WtHCYoFnpciO58fEergPy8peqGv3ctSR6wBdXijgvRZJzRPwKATPW0dDDEUcSbpKEQv2aRh1PAAZGjNPW/w8m6f+EixQFSiJ2op1/t3YyHE53/5g6cosOaCmfsF6pU2Qj3aa2vc3NM6z/kHKhDNxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786700818; c=relaxed/simple;
	bh=0AZFghz+RNQCbq2ZIEb8z7RSEcxe+KsWfb8rITQo3NQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Up/hPbCGHNYgKWk1cowaMw1gz1exLYpU1/dip+dR6XN2psWbsYghCqcv8P19VR5qv6zwDL6WTGi+LWr+CrWtrRXYSsa5mjqEq4W82YWdnyjw7IMHVd2S0ThVG3pBN4OkuDGuYZtftnfSmJx5N4Z1PezuHIhcdRVt4feTzlEM0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FS/lIb9p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FS/lIb9p"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C948B1F000E9;
	Fri, 14 Aug 2026 09:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700815;
	bh=0AZFghz+RNQCbq2ZIEb8z7RSEcxe+KsWfb8rITQo3NQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=FS/lIb9pReWZN+TBA9qUqNXEeoyBSx11+UkZvshZV3Cv/XOvCuwib9zn3PVyDW1/9
	 X3iRNEvnNmQEXwIJWkdzIDezyGojOIBRPUFbnXC03aE5IF9ZtnMVnX1ppkpbRBF9E6
	 GumPsLr2iIE+Ci7x7VR1i5RKsg9Gei1WvYx0DLx48dTi68L1PpISOKHRZzgUKXIhNN
	 Y8wDzt22pWopz0wslvEt+ydn3aa9PNwmX5PolYOGM4vvWpusk24yvz4aJJE0DukW89
	 Sm7ds2t0gUcjtjqlq8GN40H5A3QujKevyn4AWA4FVJEtLTJIy+3Ar+XAWE/brBo9EN
	 qEVZ8tNZpf3SQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Fri, 14 Aug 2026 11:46:51 +0200
Message-Id: <DKOKKTM4UCIG.14QV6331B2K7U@kernel.org>
Subject: Re: [PATCH v3 10/23] mtd: spi-nor: winbond: Add support for
 W25Q64RV-Q/N
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
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-10-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-10-b637cf120d5c@bootlin.com>

--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130
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


--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7kCxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iQhQF8Dq0tnx9H3Tajs78NLFbZ6ehFxTFzeQVV
wHXTXMvleJrsJjYRFYlSCT3a6sd4lWUwAYCrA5ptxBmrpjFIMiwHNB91GFyHB/1x
WCnpHPFLC7pb0UwBhbLXY8gO2kf2+GTyeig=
=vSOF
-----END PGP SIGNATURE-----

--6d7a27eaea88826756201dafa9b49ce1dd6f000b339f2049eee656850130--
