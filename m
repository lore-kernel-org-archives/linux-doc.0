Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2E845105A;
	Wed, 21 Jan 2026 12:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998145; cv=none; b=fnV2q48IS+KV3PM1b0tg4coi2i99EXozWKLVtd+ac3qjcVUDK2UPlwUfV4TG/9NRP/Sw69l8UgqAzUiPKeBPIsZLHQraTepT51IAWazZNCAlttsITyULG9oOyK3uu8Q97htt7UtRwqsG8BuS9rdy6OGs1l2xEjUJSLfjTx8OkPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998145; c=relaxed/simple;
	bh=jXcI9VPGjxd5I/i1jVjX8oEPailXRhi0P2UEwO90yQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE5ChULaXklg3HwXkoCbD8UuQs8u5Bg0KGv7jmaANqBhNvUJuCu72qaxEtnM46Q4yZSjt22B+WPYG0lCOd8BQcAuNYT/ylMEInjBqdU/sAQNWLvmeg82earrp0S8ZPqQRRf5BV01+tZ1139VqM6n0YuA7XJas8/LeVRTEVld9ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com; spf=pass smtp.mailfrom=cyphar.com; dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b=vPo7PNNH; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyphar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyphar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cyphar.com header.i=@cyphar.com header.b="vPo7PNNH"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dx3Gz3cH0z9t9r;
	Wed, 21 Jan 2026 13:22:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyphar.com; s=MBO0001;
	t=1768998139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jXcI9VPGjxd5I/i1jVjX8oEPailXRhi0P2UEwO90yQs=;
	b=vPo7PNNH5dmTW2r4ShZMQQKYYiJGTA9MmE6k5PRW3bKyHCfYgkKAgKfox7LDe2DqEcaHed
	MlyMzyxxeztHsDsKEcFW3e++rcc7f8kC+T76x2wsKPmGehkJPTm8Q706kB2v6f3TCLVHy1
	HtctmY/Fxw84zaT6B+tQJbCjOAdtvs9YEnjsaSoQLPzTlY6hDO4BKEao6MXBVa0usFW4+E
	qyJ3Ws8oHdoQK2qy1Kt3zVIeKYzYO+EmUuP7Z7rMp65LFJc6OAYzYbIRTIvJDXN8byTUUS
	xCgV3Icj1sVV/4yLAqmnYpQbAhuUj1rH0zQ3HOXgO1Qda0BGiSEfZNens+b1Yw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of cyphar@cyphar.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=cyphar@cyphar.com
Date: Wed, 21 Jan 2026 13:22:15 +0100
From: Aleksa Sarai <cyphar@cyphar.com>
To: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
Cc: kees@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Tycho Andersen <tycho@tycho.pizza>, Andrei Vagin <avagin@gmail.com>, 
	Christian Brauner <brauner@kernel.org>, =?utf-8?B?U3TDqXBoYW5l?= Graber <stgraber@stgraber.org>
Subject: Re: [PATCH v3 4/7] seccomp: mark first listener in the tree
Message-ID: <2026-01-21-hectic-wriggly-dips-flags-EE541h@cyphar.com>
References: <20251211124614.161900-1-aleksandr.mikhalitsyn@canonical.com>
 <20251211124614.161900-5-aleksandr.mikhalitsyn@canonical.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hgeyteossub6rrp4"
Content-Disposition: inline
In-Reply-To: <20251211124614.161900-5-aleksandr.mikhalitsyn@canonical.com>
X-Rspamd-Queue-Id: 4dx3Gz3cH0z9t9r


--hgeyteossub6rrp4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 4/7] seccomp: mark first listener in the tree
MIME-Version: 1.0

On 2025-12-11, Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com> =
wrote:
> Let's note if listener was a first one installed in the seccomp
> filters tree. We will need this information to retain old
> quirk behavior (as before seccomp nesting introduced).
>=20
> Also, rename has_duplicate_listener() to check_duplicate_listener(),
> cause now this function is not read-only, but also modifies a state
> of a new_child seccomp_filter.
>=20
> No functional change intended at this point.

Ah sorry, I didn't notice the date of the mails -- this was sent before
the LPC discussion! I'll wait for the v4 before reviewing further.

--=20
Aleksa Sarai
https://www.cyphar.com/

--hgeyteossub6rrp4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQS2TklVsp+j1GPyqQYol/rSt+lEbwUCaXDE9xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQKJf60rfpRG8TXQEAvBmTjOpxvg4r9SaZ6I1Y
R89ssa0g9Bm31jmsLCdSMxcA/3dlHoJi++xPVy8O91Y3rSa14AjtR4S5YK/8S38v
vKwJ
=ArrH
-----END PGP SIGNATURE-----

--hgeyteossub6rrp4--
