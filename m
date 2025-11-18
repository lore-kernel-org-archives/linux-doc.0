Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2931770B;
	Tue, 18 Nov 2025 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457812; cv=none; b=iv7f0xAV3QoI+MKxKv5aW4m+5m3anGwG7qAy8FCTDYJiJGNBrCuI1pqWunNWP3R8ZAsB3fpMc3+fONYDgEU6XJteM3PuQfddNaKRmJS+okpvzPdwuGTMwMuHIzAPsgu6wwASrw5svfQ2x7h5tBgxUe4uIiInD/BPA6DgLHoGVUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457812; c=relaxed/simple;
	bh=Ur7GqI/JGoJRmJTT+SHEbWofQ7DFK7vjTLSNIa5LdQg=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=ncgC6/137bJF4yONeoFnkUptpBa93lbEe1M0g/jA89lVJ0W0NvxoN5VmVh1YJ6s9CF7DeGSnMY4bpwbbWSanxPoP9PRlP40LyEgSu4ivXb/smJPVv/WfE2D2VNlrDB04E1HVeCGUwvqFOm58/QOC6QoAcnox3Tsp9ipg66nXma4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V8pNQcEs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V8pNQcEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9A1C116B1;
	Tue, 18 Nov 2025 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457811;
	bh=Ur7GqI/JGoJRmJTT+SHEbWofQ7DFK7vjTLSNIa5LdQg=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=V8pNQcEsCtHtZAN8yPxDx65hENqMKKu6mV7JJpMaZekZgYg0hgk2rSFyZ5wIzRVQ+
	 9e+Q9c70IZbWqQ0CmgXlR62KztFlTuEvIMhPqPTqHUN4k7U8lHXKoypxku+hTJnJj3
	 XWWivQxHMy8gr1jxjAQ1P2cMoJg5SGeEQzxDutZvtKrFAp15WsREPLm25sZ5tBbmam
	 2fOg9vE/FgbGJ99eK3ucJEJEwgHVWlwkTdimKEnRTDQYzu5V35/Xw5pE/YffFE5k15
	 k+tegbYsS3DX8/Kw4vKbeTu9X2oppclgHRbwmuTzHpx4DmRX5yMv75o4IqEvVLjJJE
	 uFA1INPEb88IQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:23:26 +0100
Message-Id: <DEBPMCJ6KJ31.PW1MCZGO961Y@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH 04/19] mtd: spi-nor: debugfs: Align variable access with
 the rest of the file
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-4-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-4-487bc7129931@bootlin.com>

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> The "params" variable is used everywhere else, align this particular
> line of the file to use "params" directly rather than the "nor" pointer.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw7DxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ilSgF/WV/ElgLnOhJm+jclfoXenNI9cj7EiFJl
elNdXG9O3e+LFe0TtVuDWmCxa7evqZqTAYDJPZtdSQ6HUSnk5PKUsVC/wyfJt/Sl
65g45tGBX+h6oE22Ec8wKbakqwmnBYbpQpM=
=GtYk
-----END PGP SIGNATURE-----

--1b1e7d949062ba2cb68a4d076cd4c99b47beb362e5dd8532b6b19d963810--
