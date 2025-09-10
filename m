Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAD232A829
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 14:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515041; cv=none; b=PHxWW0jnrHinPCcdu2Mn4gTfjemi76WOd6VCQZ8a7DiqKKplH4hf83v1b/7iN6LdW0oUUGiNapM7hpxauTsd7cfd5vy9y8MSmpMeZdQ4/kPOAym3OYdjqyg27mNCEWLohSGKTP/5e8LtgAfEQC5k4AbZL6P9+qWnFBaNoUA+8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515041; c=relaxed/simple;
	bh=YtWkNny6zQv8H6obZQUu+9OqmAXnwGpeDffbx+GQPyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqhY1PpK6vHOkMQbGAkxkH2EUE+xiL7+9jyWcL7jQ85NjhX1xlggRX0/pQfvZI/tKzUT8ubGnOpFydiagEIQ0d/dZqs24JC62VoGmH707JSr2WNK12UzmVPxObV0WHzNF2rnnWwraMXkHMIvllPpXWRF3GYzaEw9KtG6n90ePY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OKS7Ahd8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OKS7Ahd8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso2636735e9.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 07:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757515036; x=1758119836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fx5Ezt6+mcW1cFHZMwLAbWc3FR/0c2HUuqsW00V6DDc=;
        b=OKS7Ahd8SkOGYMHQwsv5OUIz4PGECYrDs4U1hUq3RJVeB7DaDzvTkgkZ28O4aXYTYK
         gJM7tMQI376uxGjq29ZczVcIl0EF8kkESy+bYWiUpBxj2U5qsmc1jt0aPYLj55yJPgSd
         5z7zh0y3d6SmF3KEoHqYl6T+gUbec/QwZaiWezGNdCCBsVai0jr1EDDLaEHAhOD8+TQS
         cNw+n7G05OwLXyGnpFv+DFmjPmdWSNWTYZGxn9lW2IEt0Qyby/P9Lrp8DFwdP0/Ihrtu
         imJjs+ygnTN08E2zTcQoRjV+KmAZ9M8XMCZybOYUnssllw4CDjQPCZrKiEZNw7SQKJ5l
         S52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757515036; x=1758119836;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fx5Ezt6+mcW1cFHZMwLAbWc3FR/0c2HUuqsW00V6DDc=;
        b=tMK4Ai5ktNvnIa+eZciZFFxpxpDN/9nwgpj/O1GgXCz5/SZ4A9BGfF+IZ0Jz1fpych
         xnbQITh1rZp53/qFoae04O6Ut3eU7swbToFW56xFtqktie3TdNYqgsUtcMFgTtTpy1WX
         o8fvo64+ZaSOgDBRyr1mYGiO1KtQtFOV2C/ZRSM+LLcORUBg2S/kQwqlR77wPeDydLSk
         Hg80ejHVuLSWJkFigNvWxrTbQ/iBx3uatg5uKP4jZJlDyONmoumHSZcWjAlR2Wzjs+QU
         NpU3dRQspPvhgvyemYjPxjxKOty+CQTxl9dMnNdeD03pvrN/9BQpBe9offYsXf2UyDUd
         AaBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdFazsvYwcjCAfNYV2RW5G9jQTE5rWyJue7vPVj4XBfN7efawG/CKMSI3+030kXeeJ2C9l68HVL2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqjHVh7sszSDlzOtWG0loYOB7FXeUNUEm7C3Ho2dbicVHaiWWM
	dhgtQ8yBWdF3OQbq+Tzhcyl2Q4EQuO+bxoxSnQJeReFdhEswWruVWGhLDRX1BBFzJLk=
X-Gm-Gg: ASbGncuTYMWfXl+nWvpJ5Effk39SAMASN1Ovm7ql9aH8H7NfDejt31CxsQiFSbxWASU
	rxnYMHhl3gI51suP73lLc1wu5EqyS0UZnivTyATLv8mYWgvmmH19olKYeCOtzU6B69yo689Qj9v
	MnkGVQTTa/6g/gFfqQxIgQSD8AFBSiS7MeCRQcYpGILGXAenTqWJgCk/m75J5xLsbPsYnAq18Sy
	dycYl0mEFdeznApuaDuGo7ZjixN8G/bdFG1w56sAQ5j90aoO6Vvzgt0hXvgwX71cqH5J2iXflvn
	9kEktLia5qbOEVdxqw7nj5NvImeymFr/RBM3MiAEsRsmkEHrSK9dBYj/r0BjsBzhWTqBtP8zkf5
	stSE42j5BerHiaGs9P9dyKvc9rp7b+1eQkuN/9UUKq0n4ZrsUJnavhQ==
X-Google-Smtp-Source: AGHT+IExcQbJQPTtQOThjoQdjBJVQp/bFvBGdvVjbjJZ9d3l7sJ+KPSOh4xkTU1gEzWCwG8IAQkNuQ==
X-Received: by 2002:a05:600c:1991:b0:45c:b575:1aa8 with SMTP id 5b1f17b1804b1-45dddeed95emr129259305e9.35.1757515035653;
        Wed, 10 Sep 2025 07:37:15 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df820d686sm29939695e9.10.2025.09.10.07.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 07:37:15 -0700 (PDT)
Date: Wed, 10 Sep 2025 16:37:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux cgroups <cgroups@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrea Righi <arighi@nvidia.com>, 
	Johannes Bechberger <me@mostlynerdless.de>, Changwoo Min <changwoo@igalia.com>, 
	Shashank Balaji <shashank.mahadasyam@sony.com>, Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>, 
	Cengiz Can <cengiz@kernel.wtf>
Subject: Re: [PATCH 2/2] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
Message-ID: <plah2scb3k4sw5dtn2bx6iqojjd7kiyscpqpqddvgvss3iglms@pdupbdckqjyz>
References: <20250910072334.30688-1-bagasdotme@gmail.com>
 <20250910072334.30688-3-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kcv74l6kt7nrzh2g"
Content-Disposition: inline
In-Reply-To: <20250910072334.30688-3-bagasdotme@gmail.com>


--kcv74l6kt7nrzh2g
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
MIME-Version: 1.0

On Wed, Sep 10, 2025 at 02:23:34PM +0700, Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> cgroup v2 docs is a lengthy single docs as compared to cgroup v1 which
> is split into several files. While new sections are continously added,
> manually-arranged table of contents (as reST comments) gets out-of-sync
> with actual toctree as not all of these are added to it.
>=20
> Replace it with automatically-generated table of contents via contents::
> directive.
>=20
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 79 +------------------------
>  1 file changed, 1 insertion(+), 78 deletions(-)

The ship of plaintext ToC has sailed with .txt to .rst conversion. It's
better to maintain only the structure of headings and provide a
generated ToC.

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--kcv74l6kt7nrzh2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaMGNDxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgL7wEA8vVmo71lBb4+jPLRKLKc
NU8qcxCPST2ZV1d0N6+C2dEA/0NgPzA4uWZcSx44ZFGNhAa2toJ5u2NBRSJ2/6yR
uSgM
=6W72
-----END PGP SIGNATURE-----

--kcv74l6kt7nrzh2g--
