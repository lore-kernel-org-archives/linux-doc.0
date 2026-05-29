Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D941E0B9C
	for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 13:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059695; cv=none; b=IjrgIqmLTywQV1oOxHeruWLARU8gi+mFbKDXc+MvSo9e4Bti8E7866ZxrHGyV/lzCeX0LqUm2trMKNpKlLw54v4IsjyR+Ep3dau3aZV930p8/p+z3VfkRhZq+GQ0TC6hi9rOzH3dnFbTXuqH7vH0YY0QiiwktkVdUeXREDcRf3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059695; c=relaxed/simple;
	bh=TKlBWJ3ijSz9GFQ8lE7XQuNEddJ05fSbljPGAX3zb4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1VKfMCL+JPMDmkCBTvnClGqGqAAsYJCf/eqS2TWxRgdHeTMJGIhG2DD02YQF1FSItupXAX4KIc0nuC1NvMmVvMCuH+qeAr7mW7EsQsKazYsqyufB50zPB72a7azna/ftR74lFaQk4cQOtRWCOtjXG98ByZgM/3arxYASJeQto0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NkT0LDab; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NkT0LDab"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso71228155e9.2
        for <linux-doc@vger.kernel.org>; Fri, 29 May 2026 06:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780059691; x=1780664491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TKlBWJ3ijSz9GFQ8lE7XQuNEddJ05fSbljPGAX3zb4M=;
        b=NkT0LDabAIFtPWo9hVTwhgsqk0hG+2VqdJ/gKD00bz9obSX/pNrkS7TKQ4NDetk1aw
         zwyIFqfvHYX9tUuanFns67wSgJOF8Q0pxlH/F9OSnFX6fg6o4WDRHVi/CMix4iSZO7eg
         MC3W49HD/YMOS7UnVWcysg+0NF71VVC052N5bnJeOLdqMRi3wd6A58QFYSYSJu7I7ODH
         bAkwIs+5Auc/BqLeZ4sWCy6wgBtBDocf46fUboukgqHM2A+HObJOGPfoJFsF46/jZGE0
         Pol4ymQF48YwhOQgsmS6Nlj/SG/FbtRvE+1Fkl5BmQofrKpoSxy3NtuOhmezSzny+Dtu
         E6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059691; x=1780664491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKlBWJ3ijSz9GFQ8lE7XQuNEddJ05fSbljPGAX3zb4M=;
        b=BsynDounAs9URv+5wX2qE/mc6N5ZUkosMlsyzWlzCPtbn2sFsAkuJWdz48LY6I4hjv
         suv1qjd8LXTLZzNf0tyvQGLkrSDUZQX6Sh+fx8eiTySZODUAPj/sgdiuV/MltQCRmilq
         vq6WRk+RTTnXPHzG6dgxTbYyoA8C1PGVZioiKLPG0yVVYwVa6x0IDTuV8DjRgtqMLlfK
         3yklheiEHIcaD0sKvJY7Z8LWLxUZXOrD0trz8AHPDFo/likbKhA/RD+41+YmAfrPFD1M
         1t6FdbYk5TYIvpk4ERgLVX2V0TB/t+EgQw+0Eo/9dlKRd855h5KhDk0ZKZs4XK596Ued
         oeEw==
X-Forwarded-Encrypted: i=1; AFNElJ+9WV/cIAHAk+IWfjHusDD53yd4Hd8pckIMhZjuacCON4x/+E532A0tBLArGeFYbWUN22ZEX2Hm9w0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEvv8QITVOtI87Sp/bOpyFHuqWPFeGDN3b4aLJ4zjUioYP2vco
	5QrpNDylxrkdmrz5YR8i3F5Scs6gTQdE7D1DLwQgiqPRkmwqmvh+KlfiDHB6eZE6s1g=
X-Gm-Gg: Acq92OG2HBRkZ/AyyRA2zgUl7RrlVinzxtnuKDu1rqSdFB8LhtHMJ7ZzyXggBtQ1qpu
	9tPgvRWVJrAwP0KDMN8FQC3C0M3wHS6kDxQPwtCFHQdrzUYj8u24cfUS5xVwHK7qmKVuhZvChAH
	TPARfZXg+mejmRVava2fgryn1AVVChTKZ7lGi0iwP/a2YgMuJ7tglupPBTKNaOgt5cHH2wySsMi
	OivjmKnSXmMfNXCL/ahC9CzhJ8mwPxkFYUZl6480bGEyxeqHblzDc9EVQ4bczs2+0yCkUgPS8Jf
	/P3aFEA2ohmwGPToG8lG6rr4wwg5zMI8Y+3ImNI1dNOGie22rlWzbc0GRMVN/7vOTR+38BhK6+i
	9N8fHpeXQpEQIXqv49fF0hMqCzfM9OS9LkL+nyoY69+QYe3Bacx64OPI+MDpKdcjbz1r7tevZB3
	qrQ8bZGa2HY/2f9UjfzBa+TLQomLmE/Mvh++rJ1ILLZp3J4jAf7iMnQ1xHwmQ=
X-Received: by 2002:a05:600c:560d:b0:490:4ee0:82f9 with SMTP id 5b1f17b1804b1-4909c0920c0mr38130535e9.7.1780059690792;
        Fri, 29 May 2026 06:01:30 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909ca6575csm70478955e9.4.2026.05.29.06.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 06:01:30 -0700 (PDT)
Date: Fri, 29 May 2026 15:01:27 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>, 
	Natalie Vock <natalie.vock@gmx.de>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v3] cgroup/dmem: introduce a peak file
Message-ID: <ahmOBo02TA8u8RW2@localhost.localdomain>
References: <20260514-dmem_peak-v3-1-b64ce5d3ac38@igalia.com>
 <ahCISfTlN10gD8e6@localhost.localdomain>
 <89901220-0a43-4668-9d20-aaecc72c58dd@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2z43jkempbrnq7gp"
Content-Disposition: inline
In-Reply-To: <89901220-0a43-4668-9d20-aaecc72c58dd@lankhorst.se>


--2z43jkempbrnq7gp
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] cgroup/dmem: introduce a peak file
MIME-Version: 1.0

On Fri, May 29, 2026 at 09:34:28AM +0200, Maarten Lankhorst <dev@lankhorst.=
se> wrote:
> > Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>
> Reviewed-by: Maarten Lankhorst <dev@lankhorst.se>
>=20
> With your r-b it's ok to push it to the dmemcg tree?

Please go for it.

Michal

--2z43jkempbrnq7gp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCahmOJBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Ah7GAEAt/V3wEPGggC+JULstS3y
dmXXZPqpxAaQogu6yCs89g4BAMQxskRRFxPIHcGypjWfGqkYS3FsM2hfhSaRrkTr
5X8P
=a4Ed
-----END PGP SIGNATURE-----

--2z43jkempbrnq7gp--
