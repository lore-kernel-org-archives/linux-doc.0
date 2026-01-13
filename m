Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E2C2FC876
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768305000; cv=none; b=IKS2ZqO3TZr6uce49QRm2ZUfAQM3HvlOmrzu+c3Ym9tQtO/6atfAhhWCrFro92ETwlOTwcmb01bp3AK83B4YMjjkTEBwYqVx53ABYjnT4wWNmYihLBDnDsQ+G+GmGaZf1TYZq+QB5OVk24VOa1WOUxnzGh/lptapspEwux5XHys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768305000; c=relaxed/simple;
	bh=jN+EvhJ6frs5MaJE5v0ZEl++swYn5X7F3CStPd7aJag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Np1uiV54skpK/GVAyiSreRx73xTCsEgNVJozk0ep0EZonCkgdttC3A6BPCbF2BfjBZrWK5Xjp2+wYAIcoLnVFpbduiHPcUT4OstlBYlURu9GTGtm1jc23LITyXbfFmU/FxCQbE6ATdVUUpq9Bdhz+4DJ2AjSuvspWerQ/arlHcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASwmePYv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASwmePYv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1EF7C116C6;
	Tue, 13 Jan 2026 11:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768305000;
	bh=jN+EvhJ6frs5MaJE5v0ZEl++swYn5X7F3CStPd7aJag=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ASwmePYvs4p74Akr1yxtI3WXNMn1oVYtWRokhNday8BBp5sFRXSzvqKCjnLGb4IZW
	 APPk2LyzxXs8p/mHM+TXKlYzZ4+A8zhOscOv/NOP9lBUDYuj0PkZ/RgVMYpjL23hCj
	 AO7pIrxgzz7+GrzNIa0rriitpsntx2h3ojEUrBjktbzMuhaVvskj/T0Q0g3f5AZVQM
	 mHqisprMkyNRQlLgAqUtwoKraXdKEw8V1nPVKSqmG4k/8e0HeZUrjXgXOzwn0xVT7v
	 1SNhzJyH83/MnDHH/x61xF6Qi2zgX71Bkxgqtz9KafK64wa6aECxmak4NU+cjKZJH6
	 rEZ+bhdM8zjeg==
Date: Tue, 13 Jan 2026 12:49:56 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing
 man pages
Message-ID: <aWYwzD82rhg6CZHV@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
 <877btm2388.fsf@trenco.lwn.net>
 <20260113110053.GA306468@pevik>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tuw22n637jbv5obc"
Content-Disposition: inline
In-Reply-To: <20260113110053.GA306468@pevik>


--tuw22n637jbv5obc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Michael Kerrisk <mtk@man7.org>, man-pages@man7.org
Subject: Re: [PATCH v2 2/3] Documentation: Remove :manpage: from non-existing
 man pages
Message-ID: <aWYwzD82rhg6CZHV@devuan>
References: <20260111233534.183272-1-pvorel@suse.cz>
 <20260111233534.183272-3-pvorel@suse.cz>
 <877btm2388.fsf@trenco.lwn.net>
 <20260113110053.GA306468@pevik>
MIME-Version: 1.0
In-Reply-To: <20260113110053.GA306468@pevik>

Hi Petr,

On Tue, Jan 13, 2026 at 12:00:53PM +0100, Petr Vorel wrote:
[...]
> > > -If your new :manpage:`xyzzy(2)` system call does return a new file d=
escriptor,
> > > +If your new `xyzzy(2)` system call does return a new file descriptor,
>=20
> > Here, once again, you're retaining the backticks.  If we need to mark up
> > those references at all, they should be ``literal``.
>=20
> I'm sorry to keep the same mistake. BTW I did not notice because both rea=
l man
> pages a) without manpages_url:
>=20
> <em class=3D"manpage">read(2)</em>
>=20
> b) with manpages_url:
>=20
> <em class=3D"manpage">
> <a class=3D"manpage reference external" href=3D"https://man7.org/linux/ma=
n-pages/man8/auditctl.8.html">auditctl(8)</a>
> </em>
>=20
> don't have specified CSS. And because my browser default has font-style: =
italic
> for <em>, I don't see any difference for :manpage:`read(2)` and `read(2)`.
>=20
> BTW I'll add in v3 CSS font-family: ..., monospace for manpages.

FWIW, in the Linux man-pages project, we currently use bold with
proportional font for manual page references, and will soon change to
italics with proportional font.  We don't use monospace (when formatting
in PDF, of course).


Have a lovely day!
Alex

> > (If you simply remove the backticks, you might run into conflict with
> > automarkup, though I *think* that the section number will evade its
> > regexp).
>=20
> In my local build plain fxyzzy(3) without backticks works. I slightly pre=
fer to
> not use double ``.
>=20
> Kind regards,
> Petr
>=20
> > Thanks,
>=20
> > jon

--=20
<https://www.alejandro-colomar.es>

--tuw22n637jbv5obc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmlmMV4ACgkQ64mZXMKQ
wqmy/A/9ECYFc9XBfc5bBGNinMvoM5W9tZ0ifXLmg0E7lWCDD6jXwp710QnFU24W
lmQm8B6Wca1Gb8H1Cdu4JtlCqGItXZMhPV6mY3imSKn45YISyfI+nqFhzK+pYAQg
2lHjPwM+B0AO/HJ0cAPE1HtPJm1sn+sO+OywqGzjHpV+cU2nOl3lTmjCPm+A0U99
fWErC6XwkIerUnjtPnfCxG3TxEu5Kn6DfyGfGyW/N4ZhSDsJNldVNzCRvU6U8Koh
bpldz1iTfwNv8cEyE0nv6RlRszqWO3P5FB9rM0RrTS4qbTMMZCoOjl3Kz8G7yus0
jLoWZsCtqZPwwqpFq59XN2ZwuYLnFwbl1Zb7off44jEDqxcNmygq2k+JCZvosVe2
0J91kTdt6OQG78kWobdHP5+RQZNGXjQQvVXLq4mBMXg0AFFlxub+HAXjR+Bsx1hd
ieRn6StisOa0UUmMORLIoSusWDlZtPjJZ/40Uhw9JfC1XaJfHDZn5Vy76V0uCq7G
0szgNAUFkprZpLX495iSPNEUOynRS/F9oxVNE1Ao3djSk5E78WP77gS2P5FBDjVZ
XbMTsM6Z33rnc5FApSGfJ2ObPvjElHQ2FNaZT8RO4B4V6l1FkTm8+7nHh3fcB2Jx
jg6aLxQ92LA79heqRpg7HfDblDMA8fC/1pkJmQuO5mt0HqPT5Gg=
=uwhV
-----END PGP SIGNATURE-----

--tuw22n637jbv5obc--
