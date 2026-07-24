Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772223033E6
	for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 11:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893043; cv=none; b=lRyxchQSfrnUcwRERcil2+RFM/8v3uPYKC6JEF4xZElADxwkqMapZe+G9LcMkQgEXPKbxbW9dUBXGc0muq5Bj6gRy3sqkt5ApBAwXGK2f1SgVSbDF6laO3s7qCTOUVm0gctzDAzfl0tlZzUBWiZQ895qbMu17zdjb7GeFGXer2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893043; c=relaxed/simple;
	bh=xcWZOqGe5UB3iRyHQ/Bn7KvU+nYEUSQMIOafwhwar9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B5gXVr8USQyPqU+zzUYB3Gb7hazzrPVk7TnUWH66c0NMy1dZfT63bNYZsBCXcxi3zHcz5Yvk6XoimbJB9u//8CkNpeMGMB4QvD8LX5K+lNak5EgqHAkqcq4k7K9Ugt0aoLGgon92Jy9oeoz0dJx/20v6bP/SqgafEdwnV4u7+X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Nza9XfkQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Nza9XfkQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso274912f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 24 Jul 2026 04:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784893039; x=1785497839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2VXrUDMP1SAnoPCI82/gt3uddX2wzGr26vVs88fJ+U4=;
        b=Nza9XfkQY+yIb78ymOdPHtvYy7O0j18IgpUCmiSQOMMSbLBB8iz3xkInzUFneJkgEx
         Lp6k3YTXWLaRsf42UizI1I6pJmIqJ71vlD/Z1rrMpwuBjUmlcB6hTIv5ca5H1eG2ex2m
         C4w5Ef+V5fHhi3mSzvaWKdofu7iFOE6WjxEmMOy9yARJ5EmQ9i2si4cbvWdsA8TcGSPI
         3dnDyb2Rw0NbWQz7Lg2OcP8aQrMSwN/kuOBy5EMaPqowb0tyMogMJgSUWuUM4b9THwiM
         GnIzk7oTs8UaoRaN7oEp/JvmnoiLG3jSA0ZmGJmoXDLscvqJjGsVMm5QFj2VHdW2teZZ
         MBCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784893039; x=1785497839;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2VXrUDMP1SAnoPCI82/gt3uddX2wzGr26vVs88fJ+U4=;
        b=Tr51GE5LV0XrXM3fZAnZj71nLuCcXkA2INUOfmi+mG6KoEqXVXcu0OqHWhoJZlUhzm
         JKnhkUdrZoaJvoLtKys6VFQaBYoVYoFWZcxvp/3ZXS1LsMAmm6+IIF62Emw3RPlYDWrR
         yknQEN9kVwjuP9nvbgKmBXnZbTX4dh9HfccVYfnGvw6ThFwIxt4Lhb9Tno3/XL+zTk5g
         UU7RdkqXyd0DxXZVkLX6FVrggvsjv4hDlSO49PrfYOQTxOE4MATYoapqOMyhmmF5etMG
         6jykiQvWXnjIZxTFSoaxP7YsjiNuOPj8goGrH1y6pp3p6oW8p9O45YXz3HNTgMxf1vEl
         VAsA==
X-Forwarded-Encrypted: i=1; AHgh+Rodjzu3qio4b3sxNw1xMnzj+/pC4eFj20BhPRe38g2hj91O/J1cYxI4txhagmh1J1DHtU43BIbDHd8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiD3soboUMhw1ZtYc7RpL0/d9s7+nXmDzqPx5cRsVN0UTTmMMN
	tM9+cH9wzarb4dNaPHGDZOAElFvKeYyNq3WyTEbnwGt27WW1gTi4NepTppOJJracoJk=
X-Gm-Gg: AR+sD12Q5STeHvMkwtK1mAoQgUIrtXINwwXXVjC4IUumEY+e4xoIGlHUndRBTSf1t9O
	upm7xJX/zJ2q61MwkXtmgnQceYPf7T3xUC8nG3ipPw4Nn/BCqJNy1kxRC8YOidPfaFO/s/SzFVq
	XpazfSL1Lha2nS8kxJKE95an+hei+UYdVh4xVHL9PisKn2FWLdmQVQeixSBytN/IKHa8xRE7ZCt
	4xqnQUSBpf9SzvtGJtxaVN2T57Tv2tEPI7xLnpQj8LAtC2XkPyjaG1+PCD4nIKX61w+eKm6j3Kq
	BYXnDGZvmqwXiCcfFYtRSBYroaAAxhgYus5IZac65A3Vqlp1/gDKezK2gKicObGU4t12Y96asee
	pYZbt9ovnMHMCRhXAJxKSKuch8d+LPqNcF/tCQ4Z/L4ywsva/VzSBUOsrGCoP6aQQuD9bDOqDSH
	vhLj8mEg==
X-Received: by 2002:a5d:5e8b:0:b0:474:57f0:49f8 with SMTP id ffacd0b85a97d-47f8da5fb70mr8046931f8f.4.1784893039584;
        Fri, 24 Jul 2026 04:37:19 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c63bd3sm22374761f8f.27.2026.07.24.04.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 04:37:19 -0700 (PDT)
Date: Fri, 24 Jul 2026 13:37:17 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shaojie Sun <sunshaojie@kylinos.cn>
Cc: tj@kernel.org, skhan@linuxfoundation.org, hannes@cmpxchg.org, 
	corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Docs/admin-guide/cgroup-v1/memory: document memsw
 limit constraints
Message-ID: <amNM-C0Iwy5ys7Ta@localhost.localdomain>
References: <20260723124354.9472-1-sunshaojie@kylinos.cn>
 <20260724102148.268505-1-sunshaojie@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="husqcnxr7ijg2a3g"
Content-Disposition: inline
In-Reply-To: <20260724102148.268505-1-sunshaojie@kylinos.cn>


--husqcnxr7ijg2a3g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2] Docs/admin-guide/cgroup-v1/memory: document memsw
 limit constraints
MIME-Version: 1.0

Hello.

On Fri, Jul 24, 2026 at 06:21:48PM +0800, Shaojie Sun <sunshaojie@kylinos.cn> wrote:
>  Documentation/admin-guide/cgroup-v1/memory.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)

The file has an obsolescence warning at the top (and the number of v1
users is expected to drop in favor of v2).
I don't think it worth the effort upkeeping this one (with such pure-doc
patches).

Thanks,
Michal

--husqcnxr7ijg2a3g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCamNOaRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgxgAEA26ymIQ/BnCxewbG8e1Oe
cjdn2YKp35DngsIUX9+799sBAPC/N9gqzhtytFzMKWbe/nu3q1QKuzf78DNBx4nn
4Z0I
=3Wi2
-----END PGP SIGNATURE-----

--husqcnxr7ijg2a3g--
