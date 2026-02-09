Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A9D36680A;
	Mon,  9 Feb 2026 10:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770633561; cv=none; b=B85Mcnlc66pQ5AUCrIxVbORhDCdUJVM9Kzqg7v8Z+Lu7tgoCEGAoxdeZDPnhTcbfBB6QjcPD7YMDBArt93P8lzWlW/QWxWrcag2/m0Iv51eQ6Hn0cRWcWlTzro4MfHaZ873lkHmVHq/MziWKgMw/PVsFe7a/vBJlqIeAQ8aMf8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770633561; c=relaxed/simple;
	bh=QckGuiHf5eAEnsjLGsS2f0CZr/2Y189C6hZIA1Tgrp0=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=DCbRjVN/lfN4SyPQTMRqFdIYpS9osgO/DSIpOOcH0N8MIq2tDbC7k86iICthlbiKiQKJ0GuaVblwOYANP05KAgumoXVUtt2T1BiG8Nc5phmiwKZmca+RwO7eRRuQsXSbGCrDihg6fbG91qkRQ6XaeuiGXw4YJ66h43rMM8IOJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JiSv5bsL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JiSv5bsL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C358C16AAE;
	Mon,  9 Feb 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770633561;
	bh=QckGuiHf5eAEnsjLGsS2f0CZr/2Y189C6hZIA1Tgrp0=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=JiSv5bsLmSl/Ax7EpXpe75tymHT/zmBXD8HMZzWQqiabEtC3FxKw8j2cWHAYMM5FE
	 R6zJG9UVgSh/v9KgD+qIiPQLXeXwVjlUy1ldvvmp3ZypOBoI5zMvgWO7ZOOu+WvKr5
	 GyWZhX6q1080jajNlAtzkQ/tlSSu8gCJatAH7sEeGBvcpYl3UAfvc9I4BDP4GnNkTb
	 Y4HefdLurocwfGMYtaidaHhDT3XkCcpXJUNmAYME4Ji8YGCAdHs+6/9E0BEgKkCRsX
	 IhW4LnPhCBUGeBey6UQTDrpYxO7TFY1uNcfPajqatgO9qXDkjORKSYs4iDIA3YIvr/
	 iWmK36KvSWO4Q==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 09 Feb 2026 11:39:17 +0100
Message-Id: <DGAD7N254PVR.1PEPJM24A6679@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
Subject: Re: [PATCH v2 03/27] mtd: spi-nor: swp: Improve locking user
 experience
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <stable@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-0-c462ef806130@bootlin.com> <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-3-c462ef806130@bootlin.com>
In-Reply-To: <20260108-winbond-v6-18-rc1-spi-nor-swp-v2-3-c462ef806130@bootlin.com>

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jan 8, 2026 at 5:57 PM CET, Miquel Raynal wrote:
> In the case of the first block being locked (or the few first blocks),
> if the user want to fully unlock the device it has two possibilities:
> - either it asks to unlock the entire device, and this works;
> - or it asks to unlock just the block(s) that are currently locked,
>   which fails.
>
> It fails because the conditions "can_be_top" and "can_be_bottom" are
> true. Indeed, in this case, we unlock everything, so the TB bit does not
> matter. However in the current implementation, use_top would be true (as
> this is the favourite option) and lock_len, which in practice should be
> reduced down to 0, is set to "nor->params->size - (ofs + len)" which is
> a positive number. This is wrong.
>
> An easy way is to simply add an extra condition. In the unlock() path,
> if we can achieve the same result from both sides, it means we unlock
> everything and lock_len must simply be 0. A comment is added to clarify
> that logic.
>
> Fixes: 3dd8012a8eeb ("mtd: spi-nor: add TB (Top/Bottom) protect support")
> Cc: stable@kernel.org
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYm5VRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ie7gF9HkvAipLEiYXKYpbEN8gOe5rzC9J9sA5D
bXDfCyYWwp6OMUqqaF4dZukYfPT4XQy1AYDKmE3lOwc8yYggE7O0F9gt6DFFrwHF
7oqhu03w1FHfo1yTfFH8MxD32BoctQB+K9k=
=LCKA
-----END PGP SIGNATURE-----

--fc0a7a38aeb55e453606f857d72d473975bda1d5634dd01b9187f41a5f44--
