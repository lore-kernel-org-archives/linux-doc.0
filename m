Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908CD311C01
	for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758210912; cv=none; b=uk49YLWJZN/st4G1AkBq+OYWKk+rvXc2CNVGQVJeSW4dzRWKJ9OaZU/CeMD6tAjWy7LjE/9ioxUmn2r39WFaBgQpTf6tNV3tQLE1c2g4+b/OWyaUNzqh3xci9jnf7gcJa9YXkAjZvyt9wSb/aDM2FGR+8mfUJokJPPHcPH47U6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758210912; c=relaxed/simple;
	bh=KSXvR4vDyVXeAomhS0D9LW+bHnZ13AdQvIjyN4BTAX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBU2u30p40VAmGsRqgN264lCkfScq4UIyteVLHqUOIagrUHTBZ8+2hn+yxNrRQXhVlYinowHJJpxSpy8FsWSPjPK9TZlKnbXzxOJEFTP1NZBvGi7Mfhtchr5ql5dFkHY42ZbDprucsO8ouFC8R76Mworxg/oEU2NeZdvgYoWVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b24e3GRo; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b24e3GRo"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso11715605e9.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 08:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758210909; x=1758815709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSXvR4vDyVXeAomhS0D9LW+bHnZ13AdQvIjyN4BTAX8=;
        b=b24e3GRok2pA8zMHBhQV3KsA5CmBwVxDLsisKI6KcIQcKaA0xcg3aSk5Uh4mNSlWYG
         YcoAdRd3mnvWMn30m2dq0G49M7wBV83ZMdNczKcIvjKvmfkuYCTeI3Tw846l3AVhMrOP
         Ea87rCkLmm753YtORjsobPMfNmdhTzMMLkRfwN+e/ZlKEb8wm0eQenQkncp8iVPE/JIG
         FvZvVJxxyZQEmO4x1LbD+wCWVw41MqZiGxJfdyu+KLqh3uChucGgAJlEKzkTwCQu6Cuz
         b9dfyf45VyW1fIOK/d9nk5G3UuytSt+xHPvSjNYrpMveZUvNhc16cHvpL/I1FSWWwGop
         fYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210909; x=1758815709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSXvR4vDyVXeAomhS0D9LW+bHnZ13AdQvIjyN4BTAX8=;
        b=aPOnrtjWpGNb2nLcwORj/kRqaE8f3pVIZWeCrY6nz5Le/D8zOokDvrYqhxCIdRnL0Y
         n3ktLaauTUg7bwPl2mM+0MW9j55mBCfAGTrJx4RoFMZkuJ4JdtOsDfscIkEkzWxm3kU9
         2LwOaP+IzXBR+uHIDOQj/KtGOLrRPx2BdfCW3EEHhl+Zveu+hCe8wMlEsG63wRFOg1h4
         +0MJhZ+WdZ2kPvLgpicQMdj7yWFcat3vpPHXuS90qhPN530R0b6zc2v4tRKsmcGK5bUS
         w7KfU6AoPOiXlbSOD+KtpEKCpFedbOrwYfHkSBDpKxEyms7opXq6/uTKq5v1PtIR6nh1
         Dg8w==
X-Forwarded-Encrypted: i=1; AJvYcCWLNEQrMeL1tf5QhpjJCmCTMrMJu5Xar7BFUrHRbCiHdHd6OkWZePU6G9MY792Mk6bSjfIEdc9Zac0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDaQbFCRRbJgRwO6ySImhxBPIk/KUIIoo9mQchUW24yqXMBwcs
	AxoOs3tUw9rG6a1s/igoTzfql9W51z2fZVf7dNbq94/ZfxenZ3uDWU7TKCiij+Tz/SI=
X-Gm-Gg: ASbGncsqNKADpI4b3w1fpBeGddv8HOpO7qKdFa3R9vIg2+PBMaDa5qbbQEKQQfZ4LIC
	Z0l6dYCe5tipQdCIYgJXr7pY916ENCGDBGmBvZcYJqJGKoHe8vQgnwpAI7kN1f4W5QsS2uxVB2N
	Xr5z487rXy/aBceD8DYZVmNEtp5z/GVTIL7bj13SZH7ODjj89akmBKD4FkOVYSw5Cr9RbaOzld9
	imCXh1gKVEk9jGjqEoZkvaOI+HU+qPkmtrGtWFXrAGdCvLW0Lr4ggoDD1rDzjYxhgeBRlbviymu
	L+tD4ZmvfzV8b7eJc23TFHw9lXcYHcAuLEwSXCPi326c5PSU8MwyhJW2eY8j8PBrU1LIQji3m79
	juwp1q1LFJCxhpAoJOWcCdT2FO+u1DoX3CdyCa/L8ybYb0hR/V83/sXpa9QpkOw==
X-Google-Smtp-Source: AGHT+IFzljLpICihOJPoX+88s+koepgYBCOQIaiqWwG2tVuTi04ktcXi7N717RTXmJ5IEmBUjAp+mA==
X-Received: by 2002:a05:600c:1d09:b0:45f:2828:6a64 with SMTP id 5b1f17b1804b1-462072dc8c7mr54100825e9.32.1758210908853;
        Thu, 18 Sep 2025 08:55:08 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46139122a8fsm86696745e9.7.2025.09.18.08.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:55:08 -0700 (PDT)
Date: Thu, 18 Sep 2025 17:55:07 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Documentation <linux-doc@vger.kernel.org>, 
	Linux cgroups <cgroups@vger.kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
Message-ID: <ul3hrtvui3wuvchludb67wy7kahsroclvppssmeuqrfwieyfv4@vd3gbuuda2xq>
References: <20250918074048.18563-2-bagasdotme@gmail.com>
 <aMwo-IW35bsdc1BM@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6pctydeiqfovq75f"
Content-Disposition: inline
In-Reply-To: <aMwo-IW35bsdc1BM@slm.duckdns.org>


--6pctydeiqfovq75f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
MIME-Version: 1.0

On Thu, Sep 18, 2025 at 05:44:56AM -1000, Tejun Heo <tj@kernel.org> wrote:
> I don't think I'm going to apply this. Sure, it can get out of sync but I'd
> rather have TOC which sometimes is a bit out of sync than none at all.

The TOC is in the generated output :-p

I understand you want this "[PATCH v2 4/4] Documentation: cgroup-v2: Sync
manual toctree" [1], which is also fine.
But I'd drop this "[PATCH v2 2/4] Documentation: cgroup-v2: Add section
numbers" [2], because that adds more places for out-of-syncness.

Michal

[1] https://lore.kernel.org/lkml/20250915081942.25077-5-bagasdotme@gmail.com/
[2] https://lore.kernel.org/lkml/20250915081942.25077-3-bagasdotme@gmail.com/


--6pctydeiqfovq75f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaMwrThsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AjIfAEAkYzzo5GOlGI4TmYO5uBa
Vpu5ot6Ox9xV4xuLqjgNxnwBAOidGMEpjKWqOOMdVGPgXCi3Yq2k2vWDf6CcVTFs
TVYM
=NAwr
-----END PGP SIGNATURE-----

--6pctydeiqfovq75f--
