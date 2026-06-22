Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A19530EF77
	for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 14:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140395; cv=none; b=klVAnY/rLlW3HmVNaaD8W6pXPCYeyW6OaBdkMI2DV96k3euCRxyCzkeG7mfhSbPj0nWjS97DED5HxBK4fX5Cc1Gua1x5gIqF9uUsn9UNKGFzTB+qWTLtzDNk0pI704ODoFaueIdGtaN5BxjwygTBMaFkoDTbCwT+3x5LvB1a9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140395; c=relaxed/simple;
	bh=ldiV49nTOJakUd/lq40ATV26AvsFUe7adDKrFWuU5M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nVyzExTgT4xVOYUbBmEBPV3jGkfsOshUYvhrUPms1GK9T0zgv3tDHcnfjmK+ykk9IG7GxsFBBCrpW9ILCabFAr1h2ZHfp94GPtisUZ+vR2TfeR00vS4U3jK8CgUYZBbXar5sdd5zXReGN5L4SjTxNRJyeDtZUkSAxPLhJzrKaIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=E7bLp4bh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="E7bLp4bh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45ef56d9b67so3598081f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 22 Jun 2026 07:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782140392; x=1782745192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zcPZNhFDsA2OPbjtRR+Ls4WcplfDzhOVh4J1exTT4U=;
        b=E7bLp4bhGmN6vmCqkqW5VNKX0LKY+J8VKXVqXJDK60dGDbt2sKYKzEwfeyv4F/Iyr1
         Kg0TjpSYOrKAnJakkdnQ1QctDCDhSHYBegysIg+lbtn/pJFNKie15+WfGkXndCYOzFif
         j2w4NDGyN0iKUgcGjKmPkgQRCgIhg4KDocbb3Cs3h8a5aWPqUZwYSBG/T3nobVt872Xi
         3z9KKGt6LGBtISRpy9Z9Bk2/Y4vaObV2lPnx6/q71QSYwz0jyApCKTODbDzU4bpOaBpe
         vJWSxKXzLmi3PG17Nkl8+6NfiQD3dwt75xESJwwu3+C19cUk9Ae7Pm5zTxrj/acE0aiD
         T+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140392; x=1782745192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zcPZNhFDsA2OPbjtRR+Ls4WcplfDzhOVh4J1exTT4U=;
        b=skvbLAXXVi/Xy15nT7GtlwU7o+wkSHgDKnD8QEFlv0dVfv1gvRudnEovNIPGpQ45R7
         Y6Atq/a1r6JSJfaZ0mwGlICjrWv+ycTF72HViy7hNGAg2KPYgLKJhzY9G+Gb2xuTTwEk
         aSNmRmSnTgpRFLJLvLobkCEZ97MzYR2ecgzjmLGHaoAKCaFOpNnq5wAjNtMjEc5YhvM/
         PW7CrGWbPMrJDhqLmp/QAmf16OnO0cFWcL+JuYYoWRV+jArBqBvcMEAbdY7Ib/Fechth
         0FKvdYlSLl2HMg8u+VfWs2QL0FeRgmew6/pxw5Bc+LwfcV6VUScigmzLkLhiHBhZU0lq
         ZY6A==
X-Forwarded-Encrypted: i=1; AFNElJ9KZvZiwBVXh0Fb0VYk1usv468j6X5HMfaR5UzW4fLwU5BuW6c0F/N6/s/sKX4h2OqOC5nsQoGIpME=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzhIRF9vNCZNTU3+dQfSh/Z5+pG67TuA6SitP2INr4NrPYHqMB
	PXUtB4o+ktWpuJ+Oj4JriRXI219S/qLIEdJJQkRLmmA9OK1ZDpb66fctt2Cz3XF2vKk=
X-Gm-Gg: AfdE7cmyiZnTsHqGyUtx+AszX+IBUmWAFTwvqXkzAhQv9vp5TYn2RZFf3ELz2B5pfTV
	B5Zvt4M4kbeVqaIklxwWCGX4zhvgTlpdzpfZN3K5VOPA/kaC3g0QVKjQbphyDMKR7sHGcUWR8r2
	IeZPjDJItl4LQPhLuRVy95ZEuMSIBTJ98sm123zVww6itgkNqZdVZQv887vqTXlb6fKUBizblG8
	Wk+nMWixl43Nd1MBefQYgen7l2yT0NBtJ2Lk22r9nwMLHe56FxIpInqhC+QS2GqmroswBOxD2Lg
	USJSqJkgW0/KK05QPThAd5WAfoLJvcy7bgCM1qHMQugr2VU14Jvwk/Vy8PF6M6tJkG0idzL5ptN
	n05eG28kZUX3ZwaB0bEqF6AF1g7MlWU+1a6eI+HXthWAE8FPnxl/EGUUZCr89ZUtIwna+H8nQqM
	Yk1L9m3O8DOa/8elWsqWnTYRf+XLiq
X-Received: by 2002:a05:600c:3496:b0:492:415c:8ac2 with SMTP id 5b1f17b1804b1-492415c961fmr246774685e9.36.1782140391947;
        Mon, 22 Jun 2026 07:59:51 -0700 (PDT)
Received: from localhost.localdomain ([62.77.90.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924944fb71sm205787465e9.14.2026.06.22.07.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 07:59:51 -0700 (PDT)
Date: Mon, 22 Jun 2026 16:59:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Doehyun Baek <doehyunbaek@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Yosry Ahmed <yosry@kernel.org>, Nhat Pham <nphamcs@gmail.com>, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
Message-ID: <ajlLhFnMZGoVxLE6@localhost.localdomain>
References: <20260620122751.388770-1-doehyunbaek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7z2vuj6kqtgqe2kl"
Content-Disposition: inline
In-Reply-To: <20260620122751.388770-1-doehyunbaek@gmail.com>


--7z2vuj6kqtgqe2kl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Docs/admin-guide/cgroup-v2: fix memory.stat doc details
MIME-Version: 1.0

On Sat, Jun 20, 2026 at 12:27:51PM +0000, Doehyun Baek <doehyunbaek@gmail.c=
om> wrote:
> Fix minor cgroup v2 memory.stat documentation issues.  Correct the
> vmalloc per-node marker now that vmalloc uses the native NR_VMALLOC node
> stat, and document zswap_incomp as a byte-valued memory amount instead
> of as a page counter.
>=20
> Fixes: c466412c73c3 ("mm: memcontrol: switch to native NR_VMALLOC vmstat =
counter")
> Fixes: 5ad41a38c364 ("mm: zswap: add per-memcg stat for incompressible pa=
ges")
> Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admi=
n-guide/cgroup-v2.rst
> index 993446ab66d0..ce6741f78f4f 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1570,7 +1570,7 @@ The following nested keys are defined.
>  	  sock (npn)
>  		Amount of memory used in network transmission buffers
> =20
> -	  vmalloc (npn)
> +	  vmalloc
>  		Amount of memory used for vmap backed memory.

The vmalloc change looks OK...

> =20
>  	  shmem
> @@ -1735,7 +1735,7 @@ The following nested keys are defined.
>  		Number of pages written from zswap to swap.
> =20
>  	  zswap_incomp
> -		Number of incompressible pages currently stored in zswap
> +		Amount of memory used by incompressible pages currently stored in zswap
>  		without compression. These pages could not be compressed to
>  		a size smaller than PAGE_SIZE, so they are stored as-is.

=2E..but what do you mean by this?
As I'm looking at the code in obj_cgroup_charge_zswap() and
memcg_page_state_output_unit(), I'd say those are pages and the docs is
thus alright.

Thanks,
Michal

--7z2vuj6kqtgqe2kl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCajlN2BsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AiYqQD/Yrcx9m1Cd6p0RIJlgi6p
Pw+UTZoClU4K345dMUKxS9oA/iffuwIIMbqckL/HpyJUf1dxbIeOVfV/GJ9kehOF
i2kH
=yZlU
-----END PGP SIGNATURE-----

--7z2vuj6kqtgqe2kl--
