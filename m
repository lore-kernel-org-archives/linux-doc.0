Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355174;
	b=Hht+Vu5RTdFh6jRjGDTAAEXc19PpibU1+8HC7jCl5yfxy2QKUr2oPLnSM67G073ENdtI
	 bA+gYHE31H/X8zCQpBzprjBR7jE2YYzsjgTPu0wNUi+YbJ8weJyrLzSnPIW7FXKwxRPcZ
	 yl7IIPVTJLFYTuxEfV5yUmGIeftAC+5EOrVidEXEkyGp+xYyTtlCi88MOj/EUqzIENzy8
	 T/1I+8ACgbBbqsgr84/6Fcajn4RjkbTOb18Y6CTW8H8bjhONS4wH5/r1XEgjfrWzRU990
	 vc9uyUdbjKaaLsKRf5KQRUriv9d93fjrVHopIurhG3QAp2rgoASlH9iPGVFCHSQhcbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
	b=GPpngdMWRCpY6wVwLosr36FqQ/LZhewAGnvDNaCn71Kq3PcXrigfcMiAU5u1jqF00jQy
	 8WbyMZrnDdaTYbHPpQ/WUFXlUT8hze777VOcg4VcX+mfIIT2hHy/qsw5hqaDponZD7Lsd
	 p2ZloW4o0APjwMM1bgSQJG+VuC6dT3vY8BeET6+WiIk3zX+fn0vqxq0bfOJdAwsq35Aru
	 tZTlthCKBRE050W9szmH1jQ3XNelzHWxFTDcd6LF79Ope9AYBJk2g6AG84/BlnGVkR/m4
	 B6SlL5EGDbTcOvFSz8Nxy7rYcIubJqgqFiDD8ngA0nl1Sd5rHtxtlawsqdKT7bZDCyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VLkYoMCu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BE606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=VLkYoMCu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so5013315e9.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793355171; x=1793959971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
        b=VLkYoMCugVUFenq+N50Skcr47KLkpmh/XKhR+/YIdlcV+8nrK4xSn2IfwxtJjpZVpZ
         AWy+p2R1G+kEgehnqBdtlxIaJxppJQk4QfNTPyWMP8US10mnrNkoP66juo8K87JxLqSf
         AMN3cDf0R8O3jF+/1NTYIGM3PWvXVCnarI9bPo5Iw0NoerSfSJ1un7zvpuZgn7eNxlgs
         WzlPdchqPfddqkhafYPyWA3PrSveMuK90Vuo3+/i/zmSyKI/+D3ZCs5vIGrtyz40gZd5
         o7TXCCkXBG6ol77zUzCYYBFH29mlsO3N0g8neiPesRRdAl1NVSKyZBnllJvlIbmHf6nZ
         UeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355171; x=1793959971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tYDtJid68SRru4uZjKZRvvAoXLCMBoY5roZrQvhHKY=;
        b=AR8hbVXiRrOJZEQJFwrfUp0G34VcV8KGV/hZxQPsl+RE83HFnUV4nXKGFowoEAnIH5
         whe24PhDJ+S07i7hNh3KOxqdMmH1LDNNSAK2aLZcH6cLuFWtJtfKxfdrZ/PXrsvBC3Hh
         QCXcLTk1+HPPQ1cwQ1mZSST6Im2mkFG6fcV37Afe6GI/9Cdp3ERR2SJtk4DtyLcGN2mY
         E88z40NMe59gxiXFAWpMTmUjaQZqeO0WORXpXphoq6TpRcdv6pVqbXyzN1q4xH8yy4Ng
         +lcXlDbnkINEfuicrsw9pTYVhK0sVilbgeKMjA9xK78LNeoBfROw0fn8VDthuuE7/jQg
         mHkQ==
X-Forwarded-Encrypted: i=1; AKwUvByZREgJIGC+DAOhtHD/J1aVvBUtNXg0NAg4XbcZysKj5WaOgRy7HWoEhcsWV1+sLz6m/KV/+Ho+vuQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYjAJmHPPbXVoKyVTDOiGqvILjg3mbST4fgCBqTvUXn56Wr50M
	gPJ4znyWDP80wWlbazZngZMg5jN0PyLmeq5lVEECvP1n+z/xb426GTTYIn3lxwwZF3s=
X-Gm-Gg: AYBFou0s4BZPtGRlFgPA2EiyNQu7optgp/mKEb3LCfNwDpmJG7tUMdPbR0KKOA1/jp8
	yfvLVSUuDV2zbm00FotKu4G98+41KRazzAgIBnxdYVcdmrpLIzpTLuzuvwa3UVKeFSrec487T2e
	CfCQ1Tvt6SNH/bRUlpLxzo778Qfi5MVImNtnPfNemBUeaAMv8d/lyiJn1owh3ueDlbCl6YW8Vd6
	qijlC8SyMWjM9pYoXc4yoqm+mAqCtV/Gij1YjZG8UA8QmAumo+21DLZXdAHTnFoDJrYLz/a41ST
	rHedkKSiMlSSw7ThEUsQtfaEqPjZkgxXCQw2X20SGhwgFbGDMv43/guKKHuJLuJ5hT4yGDt9jFV
	k72aKQnSDxXD6F8Lar+0l6dnqPvl12Z4HoTyQXexHqARwCKsY8tcyf2nj5g3qtez4oxJlyG9R7O
	Ruo2N9NVbtW8+yg3gF0jOeGgi2HlQRyq8dUZjX41r855fHbPLApNsG4UgyHseNLeNe73Eci3d4R
	GyR/+M8XqJQHepxLP+Dd0C9nj3TET+BiaEPWTjfOcRYFRe6myMH0UJrtLrVFbeYfssC/ZLu7bRh
	984c98nXUZkDPqrxBdY23bUbRihKTwrK+liXzCJV7/CCgFxVgs82pVQ2tiFAK9rc25nQ7nbY1A7
	1nv4syrgMXiT2x493
X-Received: by 2002:a05:600c:3f06:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ac181e75c2mr35620425e9.13.1793355171498;
        Fri, 30 Oct 2026 03:12:51 -0700 (PDT)
Received: from localhost (p200300f65f19a904f4ce339f1421d16f.dip0.t-ipconnect.de. [2003:f6:5f19:a904:f4ce:339f:1421:d16f])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4abf5b27e46sm80092625e9.3.2026.10.30.03.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:12:50 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:12:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
Message-ID: <auRs-6y8ox4EWDcS@monoceros>
References: <20261028-bind_taint-revert-v1-1-7c6b9cef30c9@linuxfoundation.org>
 <auODHyLrfQylISX2@monoceros>
 <DMHL9O0EWLKU.3F47YHYEGNURK@kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p3i3dqzye2ignvny"
Content-Disposition: inline
In-Reply-To: <DMHL9O0EWLKU.3F47YHYEGNURK@kernel.org>


--p3i3dqzye2ignvny
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers"
MIME-Version: 1.0

Hello Danilo,

On Thu, Oct 29, 2026 at 09:02:35PM +0100, Danilo Krummrich wrote:
> On Thu Oct 29, 2026 at 6:39 PM CET, Uwe Kleine-K=F6nig wrote:
> > It's not part of commit fcbfaffee51a452cc8efcbaa3b88ec4595678424, but
> > conceptually we need=20
> >
> > diff --git a/Documentation/admin-guide/tainted-kernels.rst b/Documentat=
ion/admin-guide/tainted-kernels.rst
> > index 3d312bc17942..fcb8b9734548 100644
> > --- a/Documentation/admin-guide/tainted-kernels.rst
> > +++ b/Documentation/admin-guide/tainted-kernels.rst
> > @@ -74,7 +74,7 @@ a particular type of taint. It's best to leave that t=
o the aforementioned
> >  script, but if you need something quick you can use this shell command=
 to check
> >  which bits are set::
> > =20
> > -	$ for i in $(seq 0 20); do echo $i $(($(cat /proc/sys/kernel/tainted)=
>>$i&1));done
> > +	$ for i in $(seq 0 19); do echo $i $(($(cat /proc/sys/kernel/tainted)=
>>$i&1));done
> > =20
> >  Table for decoding tainted state
> >  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >
> > in this change which was fixed in commit f1850e443b0e ("docs:
> > admin-guide: Handle TAINT_FORCED_BIND when parsing
> > /proc/sys/kernel/tainted"), but that commit shouldn't be reverted as it
> > contains a simplification that we should keep.
>=20
> Fixed it up, thanks!

Thanks. Looking at a287f97d4256b5f5527f5b5a54f8ada55e1482c7:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

(just in case you're still willing to rewrite the commit for adding
that).

Best regards
Uwe

--p3i3dqzye2ignvny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrkbZ4ACgkQj4D7WH0S
/k5H6QgAjdChEcwuB16UGAH94yVcVY96eqaJTIs2lSSXrN5mF/j8+wojtf6d88zs
DBUdsIkALsB6jIBpNQ6JVgKn85jEDmiUoaOryV/lU68VYYkeS/s7FVQFvj8YEef9
iOdBZr5OwsHxvvrecVFcd1psXr8oXFYra6CYHs8Z0Cv5JXqt3DLxWjLtAgc0TVTj
hPLgALy7vx5AGw5S+Al5GMGlvCDk1ZgDTtxIWx4CUWAEPXMMwXVe0GO+0LHSqam6
/oVmyhz56OyzkBvx1Y71mPtZ1CMB8jSWENEn7ouZN0clusKo8yTdsCBwCMnNDJR7
6T5dYqDGih58q0J2wYKJqB06kpwLlw==
=ViXi
-----END PGP SIGNATURE-----

--p3i3dqzye2ignvny--
