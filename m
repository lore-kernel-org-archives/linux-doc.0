Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8D33991
	for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 10:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742380397; cv=none; b=Nl55KmMXbrr6afEyZ5ZP/iBC71f0n+KShz4JAInRNenzH810R9iFTPdOT1xvsiqKKFhPJZWrT8kee9GCfgIhd3fST/bWCrEK/11GDv6YGw2hMdUhdi0gw1Efnn9X3WGem5HY3FIMTVnyMdNqF1aw+YvexzhcUIJjQK0h3TzgVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742380397; c=relaxed/simple;
	bh=Z692E4Us4bwCPQMfgiKqOm+CDl4LPK/+OBs3OKkVM5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0lo0n1QzAoJT+oyexwMoZkeHiaXuutxgyPPV1NN8dxNR7sbyiJYpTC+HdguAW3pFPUjPlHEc4pdW4rhSQSS85qe36nsllJndbGi3aR1Vv3ZQUDiHnDqN0IqpQ1/9FVpEM3JkqEjp0E+ZbHbLHOppjQPc+K7mYZevhuF9uJ7Ix8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XyNvGu/D; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XyNvGu/D"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf034d4abso46006125e9.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 03:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742380393; x=1742985193; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tHUFNCIIO10GyL2uIfpwlNVW74wFOFO/xZ1QWqgzYRs=;
        b=XyNvGu/DUsb0ALzvJ1GlXEioewz4XGRtj/hx2tgeh4HwsmBNiHVtrQKlp7c/oIhiV7
         MDIX3r/xOvXIUjjmlTJzQrkQG5viSxMLGX2oDkPKoU09Nmk1AXqW4CmpRSg8iMBhGC3E
         wRHALGKRiGiOm4ABLHvPGI6a+O07vjONfZKoe+fA6nbox9ptzCY10etM001XAnakZIpI
         2HtAYbaQMg4jkJ2GYk0E3bYqCPB9fNb4lhv7FrEzvkH1lAPAp0m5uImzeDNB+sReQbkh
         jmC73feY6eqt2FvIP6NZePtii3KCCyhk5kCU4niYy1nneY2XBiy1NG8Wpf3U08Slyy4W
         ObCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742380393; x=1742985193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tHUFNCIIO10GyL2uIfpwlNVW74wFOFO/xZ1QWqgzYRs=;
        b=a/XXAL5SVSDhRH2EdYCkt4BZxvKfXA1Is5c1oWwnhH0ilvQYHVtOYjeBCh1J7/xZYW
         nmOrOWQfL0WUKXQGKfjQ2Mmbr5kk5dqqGaBxsMhuxaLjcTFONG5FLYKvIbfkSjboo1FY
         Qb7AmmYgwjyf2XX7pe/3MtjYDEDUEKSeVOW2mZZwjmE4XInakbDRUESlRgiErDiaMx3i
         sDwWQKZl+y37tUna9z8dMWHXJ6ck9eC8cFETBRnlafDvVQsuXXCFXWtMbUwP6ZfLnG4B
         O9pJg6fj8uuZUZIY6s3pBtckjX0cS6rzF/k1rkzqwllaVyDIMdFFLt3x2UMHcobrp8Ya
         5wyw==
X-Forwarded-Encrypted: i=1; AJvYcCU8f3NqEoJwBAwhc70542blKEoh++em6S5EmO/OyJPgxAnNLWA8pKXtxbiHjwaUD5V4jgHbVpoXuIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGp90Te/K/gSt2vLNzjmuGovWt/O9PjvwkZYiyXO+Wipo61p4A
	ijg4rcBfe2QtF+Xv5RsseKOht9RWHEV+C0tIr2VhX69nyiCyCrq0lG/s1wo6M04sAtHdqefUoJM
	QKuI=
X-Gm-Gg: ASbGncuR2zwZ53gzJLadN7XI9d0h9NMiv2REtcc+ALG4dooC+p0bzscFw/npGLfkzN+
	KY758oqSceZrbGLmNtcP0DQV9gw80tXxkYcw0TOSUDeBxad43BDNLGDOEbWJ9apzJ11Wb7hro3T
	GokDtitAE/Sjf/YxORC7dFqQDmoQArH0gYW3zN0+ji17dK44mmV4PxIo9EUCF4cK7XrlqR0Y081
	PYMogylp4tKxJm5ePEFp7TAEJRMrfeZGvOGTVN5UV2/yi3oD0dM4/q1I0zkh5g4lCeLDzz6YBhb
	PNXkakoYBbG+gJDX6SbiyMoH+1njXx5zK+LIk5kF8JGc1kM=
X-Google-Smtp-Source: AGHT+IEwlmcO/Nsy2vMvC0TJIU6rQJVpXquecxaeZ4cOXlH7OaHP55G2sGoqGpVHjHr9T/l+vWkvLA==
X-Received: by 2002:a05:600c:4fc2:b0:43c:f64c:44a4 with SMTP id 5b1f17b1804b1-43d4378bfbamr12087425e9.8.1742380393287;
        Wed, 19 Mar 2025 03:33:13 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4453227dsm14414315e9.40.2025.03.19.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:33:12 -0700 (PDT)
Date: Wed, 19 Mar 2025 11:33:10 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hao Jia <jiahao1@lixiang.com>
Cc: Hao Jia <jiahao.kernel@gmail.com>, hannes@cmpxchg.org, 
	akpm@linux-foundation.org, tj@kernel.org, corbet@lwn.net, mhocko@kernel.org, 
	roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
Message-ID: <rxgfvctb5a5plo2o54uegyocmofdcxfxfwwjsn2lrgazdxxbnc@b4xdyfsuplwd>
References: <20250318075833.90615-1-jiahao.kernel@gmail.com>
 <20250318075833.90615-2-jiahao.kernel@gmail.com>
 <qt73bnzu5k7ac4hnom7jwhsd3qsr7otwidu3ptalm66mbnw2kb@2uunju6q2ltn>
 <f62cb0c2-e2a4-e104-e573-97b179e3fd84@gmail.com>
 <unm54ivbukzxasmab7u5r5uyn7evvmsmfzsd7zytrdfrgbt6r3@vasumbhdlyhm>
 <b8c1a314-13ad-e610-31e4-fa931531aea9@gmail.com>
 <hvdw5o6trz5q533lgvqlyjgaskxfc7thc7oicdomovww4pn6fz@esy4zzuvkhf6>
 <3a7a14fb-2eb7-3580-30f8-9a8f1f62aad4@lixiang.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2xghzya6xc4nema"
Content-Disposition: inline
In-Reply-To: <3a7a14fb-2eb7-3580-30f8-9a8f1f62aad4@lixiang.com>


--r2xghzya6xc4nema
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] mm: vmscan: Split proactive reclaim statistics from
 direct reclaim statistics
MIME-Version: 1.0

On Wed, Mar 19, 2025 at 05:49:15PM +0800, Hao Jia <jiahao1@lixiang.com> wro=
te:
> 	root
>   	`- a `- b`- c
>=20
> We have a userspace proactive memory reclaim process that writes to=20
> a/memory.reclaim, observes a/memory.stat, then writes to=20
> b/memory.reclaim and observes b/memory.stat. This pattern is the same=20
> for other cgroups as well, so all memory cgroups(a, b, c) have the=20
> **same writer**. So, I need per-cgroup proactive memory reclaim statistic=
s.

Sorry for unclarity, it got lost among the mails. Originally, I thought
about each write(2) but in reality it'd be per each FD. Similar to how
memory.peak allows seeing different values. WDYT?

Michal

--r2xghzya6xc4nema
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ9qdYQAKCRAt3Wney77B
SSAOAQDscRz1ZK2hjaZeAzcmaHDL4+BU5iqRrEbfZn7B5FsPTwEA4guBl5SiFtw1
e1egLefaDOYhMuPKh+O7ZQAYqh+S2w0=
=6EjW
-----END PGP SIGNATURE-----

--r2xghzya6xc4nema--
