Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919EF143C61;
	Tue, 18 Nov 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457898; cv=none; b=Tz+C8Ss6VLLZp5c3yiKtq25BdICaIY6ExF5dVcud6knQ5FA3QBhI7ypIclY0rStR98JNgkGJHi1FD1AWzwLHX6osRdjJ4OKq/IzZuQcr2tzhIYLGrUStemb1jbZfBxPdkBWz+G64r9JF+/rh/p1HYolBI+IyzIdx2pRrSXeqer8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457898; c=relaxed/simple;
	bh=NmJNOSPJoqOqMza75S2PgQtIk72/yiCwXMHlkRZYGWE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=MFCl07zhTndVZ+IcJzXWGraOcTRuwPTYF5vIGjGxvAyzesk4HxKcVrR+/TJoax91ONCkOg1h4diLu92bU2d0cFdo/ZxZg6seZ1+i59d8LkujbR0WYUhWjPuMKSHsL6MRpGkcjnzFOyX8DFQ+f3fFxxNOspSr2RNlQHzLT/xwj10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtbUjVb8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtbUjVb8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF5BC19422;
	Tue, 18 Nov 2025 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763457897;
	bh=NmJNOSPJoqOqMza75S2PgQtIk72/yiCwXMHlkRZYGWE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=NtbUjVb8rrlBf6MXAIYYLQfYyFh+rhiGBa51AcdEisXxuRRijzaUh0rw8UHvw5v+W
	 kMVFqw8gEeTkXnlJBRLqeiCaqEI27qCCJXEihpcrXT/vqYRgrcYvwyLbnYOdX0r/9H
	 C4A71GlwrmyeX2qqiEtcovVrCs336gO5khnVqg7u/hQm3/8ezOdKRQW0FHjCBXWq5m
	 TqqdRN4J8uElEXKjdxFohC4YquXzWuGZaV8VS3dhiLsIf6Cjv0Y5Q0ydiEgODRSEMj
	 OfIiR50dhXGvh0v4oM+7Uuq4W721O24biO68olRSHisOtbVel/5T13QNrMlZmHqNDU
	 sqpapZKxszWTA==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 18 Nov 2025 10:24:52 +0100
Message-Id: <DEBPNG5QO9WW.317J3UWHKAXPU@kernel.org>
Subject: Re: [PATCH 05/19] mtd: spi-nor: debugfs: Enhance output
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-5-487bc7129931@bootlin.com>

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> Align the number of dashes to the bigger column width (the title in this
> case) to make the output more pleasant and aligned with what is done
> in the "params" file output.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaRw7ZRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jY4AF+NjlRLWAEdX5RbxeyDY5tOP9e02LqsT2r
BMoY360YGTt5jF2d//ezdS9KC0gBNTWoAYCZsZb7CCBcHm+7XzcFhxm8PHGCRAiI
DoKPRW5CM3U3O9883ZcLW7I1EprZRBK3wTE=
=vcqo
-----END PGP SIGNATURE-----

--7d919a8f622e2132df4478c38a1eb54d3beb7198213541a56b711828366a--
