Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B7C3CCFBD
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784283385; cv=none; b=TY5cEkdFf63L68+sUVzFmd78NXBSy7qluTGDI7hknuK1JBuMGqjnkS6gnBAlHUpdfWDVsuqe7TF5aofPLXkx2town7fDMxmyYBmKWV/cIuuY/cwycWZb7Y7OjDJwpHOOEgaOAqNqzSPEurss90fpFqw1ntIEUtH4PXOb+xxKnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784283385; c=relaxed/simple;
	bh=hJPm9iqBdyF9fz55pXV1INazHSp1cnxZ56iCsIUIk1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FhmKRIGz6+23Y7c0OBan0WiWqHv8FgtYGCBGJ0iuTNh5iNpa9/JLBLoUh3p9l4Rm82ptkw6IhW23JuvKyLB8fN5xX/TLv9AH6SDOiPgGBNKBmJi0D52fdTcJZZ3fGO+g8rPJcnTTFMPhmoxsK4yUzK+HMJHCHgp35LjLKEJ8U0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mb85Gxn+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mb85Gxn+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so1715505e9.1
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784283378; x=1784888178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+1VRHnRFzcRYtA8WauFfhEf2N2Ejt6vNnuWMikeIIGc=;
        b=mb85Gxn+/5oBom/IJJfpoVZwV0IBh7tj00FEXjbvWeaNqA4LkxBltsly2DzAloNViC
         RzKVZmMC3t9buApE3Da8nOxtqnF/kw4AFRukiz/wm8fmn09UsvMQ+Xa9j0gmm0Kg6TmE
         X4Y66wb0a7/5UeZUlxFSyYTmD8jnbj3rEr5MPkAW0TgRpfwg2kkD82t6ZjKS7om2qY21
         7CQX1aN23/raumJ3Sq5j5lagIIyQdjkwLyamKDjzKrB/4Gyuj5STwEcfm4jlRsy2A3Kq
         dCq2Pw4QVqxwFAQcFJ3yafgW8ZfuIdACKEIGbos7Yf5gCJNljgR5ggUBRFoCEsCJY0UT
         mvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784283378; x=1784888178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+1VRHnRFzcRYtA8WauFfhEf2N2Ejt6vNnuWMikeIIGc=;
        b=byRgmlI6+S3a+fMTx42d4zV2CyHZXqXPP5RVSkYdHp5X2RMTHg5O36fTay8mQH0/RD
         XcWJPnNwNNIKWb8t19wKJM/PdiwOetU+3f9GnTZcpUYxWmZ74bKsNgTEFr959ckFwvou
         bY9vOvuuib2JjPGmaGjG9rf9wf3DaatxXQZHhjg8zUQPvgjNYaa4lG+G1a2vYEFR/SX8
         QYg0x294HHWow5FpxAPqXTHoDH6e68y9JwwDiJlwyQDGSP0jvvdrb8ptBPMfUOivAdaE
         3LaN61DyESDIxvn2iQHQV9vX5n1p8gXSb1jJdL43TbcOvt5yXT36LTVegkte6qyrbHy7
         8npg==
X-Forwarded-Encrypted: i=1; AHgh+RqC+13zjxWW2RXYNl6YUrCMz4yGNUCdi7GUnlme1FiBTu0W+qCFp73otUiQ8lMluSpbbdtn0CURY/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDwV9R9CQkKpVIzpHB3KXDppPfIQGYQ8ajz88hGjzSWtiVmyO9
	eNrZT7ZuKz2pVnR9v2sWrlesly3qHL0GHXP9V6zwyar62ezvFivVabTdFbpvj69DBMlm49WiIzJ
	/74MQ
X-Gm-Gg: AfdE7ckvXliEIhvN7z/h0LrypAJ3ALbl932vmM7fIstxzMTSTovd6+IkI+Qz7h3kJTL
	WAQ4ZT4QueRA/DMcetsFNpmt7sTz0NlUzfgy5ZJWZqymCeAVyd747nzDfvQ0xfVKIlHQA2skQqZ
	omW2PBg/wt/I+Cot9zexuqXyZz2TuyDYpIUrAd8e8v6//NPaXtTqBB4TpF5K7Yh3X7frDVmVJCb
	MP5bm85wXlzotAppa0jskzC6EL5BsWvllY0EUvAS8aTG+i2U3wov2xwuTn0U0OIQ1wfQe6t1meU
	/C2DVF4uagRyS0HXZ8DPJuZjSpFlNOZ5ff9U0BGJUxF//SS7QMYYRI6+ZExWExPT9rm2QYf777W
	GpPqRlyYg1nCr+Iqq/n7Rz+3i4/uJbB+CeNZbUmifm4EXiRbxyMQVZttk6AOBnObbGkJJFhK2u5
	Lp+an4m00aueOvzLvSfAA938/52QDVUdE+JDB8ORtRtg9Wh0kj+Eu69UScEEyCZE4LZWaAZucKR
	OB2
X-Received: by 2002:a7b:cb95:0:b0:493:eccb:8cb2 with SMTP id 5b1f17b1804b1-4954a514021mr16031675e9.30.1784283377582;
        Fri, 17 Jul 2026 03:16:17 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2eddb8sm74812655e9.14.2026.07.17.03.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:16:16 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:16:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] pnp: Documentation improvements
Message-ID: <aloAhMQE2mWwwzpY@monoceros>
References: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aycqgezmejv7vzgp"
Content-Disposition: inline
In-Reply-To: <20260609145117.1355753-2-u.kleine-koenig@baylibre.com>


--aycqgezmejv7vzgp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] pnp: Documentation improvements
MIME-Version: 1.0

Hello,

On Tue, Jun 09, 2026 at 04:51:17PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
>  - Consistently use named initializers and simplify sentinel
>  - Skip assignment to .driver_data if all are 0
>  - Use consistent spacing to match Linux coding style
>  - Fix prototype of probe function
>  - s/pnp_id/pnp_device_id/
>  - Drop non-existing .card_id_table
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>

Who is supposed to pick up this patch? Is this still in someone's queue
that I can expect to get some feedback for it? Silent application would
also be fine to me.

Having said that, the patch still applies fine to next-20260716.

Best regards
Uwe

--aycqgezmejv7vzgp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpaAO0ACgkQj4D7WH0S
/k7XdAgAreQpTMmz9W8D5BP7yY73J2NA48FTN8mGsSYo8WzrQm1V5PTISdL4uONz
MfcS+OFYW/rpxStzvu2RadiGDqA1UjKyW0Mqa5djIqr6ABrQjnT5Pd8Vt1lCOU0H
iUh6qjDZ0C1G++PpqcFlEqvERThV+zRM6MmAJaB04Cw4HFo1WZq3iT0nj3Dh5156
8ziXGqRpFespea90OPrejSYIjCc7zUi7pzn3SYNPUq4mj05jS8G60mEYcto/JNyL
iVWXbGc6uABQRu2kpJHSpehQVGIRcxA76//ehH63Q3N4pB+bBCr80WFXnJx04Z/W
zzK+51gR9aH1NsHUeFlrkEykWG3Nig==
=WYhm
-----END PGP SIGNATURE-----

--aycqgezmejv7vzgp--
