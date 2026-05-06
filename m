Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EDA4657C0
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778075648; cv=none; b=uuJqCQ3b2GRM/glIWjzjY7h8N+pgbR7YvfZZnDekkMz4it3wOnIGKJOW+eIzg83vl0nMn42RbMUg14DQmSGyh2i6A28AX9jMx0kvniAKNYUI3ie9kGprCjuzxNKQDz+brYUTps5w91SJxQS67+1Lo6mJLCd05D/RgB4kPl+EpLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778075648; c=relaxed/simple;
	bh=6KlB82Gzxw6Ep4hdvTnTO13cUo4z1IlE435VWxqkbhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhdyplJ4Qnk5kaZgj3lbLfYSIaq0GsFicbUEIOh7LNUOqVTuulNha/8nSsoH0wusW8V7nvO6SL4Ie/Z+xpNva99IYhEVJorMqBh+tfhxLB9V1rnY4pzL3OsAsbChooChTR76g+U+vW72ZL92JQo4wUd4Im3gXAj+hhRYpTJdJAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AmC1CSPt; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AmC1CSPt"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso69778645e9.0
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778075643; x=1778680443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6KlB82Gzxw6Ep4hdvTnTO13cUo4z1IlE435VWxqkbhM=;
        b=AmC1CSPtD90l14uOt/dZlSzXuFtzGtRWgvFplLurCwwjAVxJquPNO/vF6nxFvcXfN/
         LQSeKVJX5FCRgKX5EGUpi6uemWTBtN69d1arDcoqA23j5iOnahrLtMaJpgHc3B4rRBqB
         rhaMwMWxO1Vt5KYUFZdq7an9sdYYxoqnwIBh3QlSYvZ5XL3n05psuvqO9stkwbdaxkwp
         eziocMkxqfwZHH6vUYOKHWQvmQwhAYJif1imJ++9Amdg11Me3fI4VcQS+lg34gvCJ+8H
         ZAl5S+2GQ8Vt1LKQghlf4oavfmtI961bu9j37Fc4u6x5HpgJMXXa3ANFKAk/mzf77LI9
         ui/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778075643; x=1778680443;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KlB82Gzxw6Ep4hdvTnTO13cUo4z1IlE435VWxqkbhM=;
        b=QeTp+Qc45xouL7pGGzWb28F2o9BTzJvLz8vBB3OHG4P7lN1UZI74uMtNpoYSFFygjS
         x5iEPpDs6QQbsb6fjqhCaAIqEU0Hw9PsPyE0L+yGAUG1Gzqh7gLYuzhu0tiuUmByoFII
         OtktNuhrPoJUQU6smoZ1afiMmlZgluheHCuxmKln+rQywhErLqW2oDJPO/o3zLJfYNgq
         JMkz8X2skP7X64NQ5/agm9Uhii5gYOmBVBBaWZQfUwnAVynJm4QmYWLKPzZHDNN0KiMV
         PXaNcOdUYuEG1oHLAa3FAE5N+DLxReJch3iG3gjQQpCmcWiwGMRSCFkTct63sLqLpaLm
         Rh8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+W+9fPzkDcdwn5Pq98n86ddmEq9Czfj8jHCTjNXvc+Kb4Kw5yOjQuaDgmilDpP95GCPwYLlmjQUb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIzw1PhVilWt+WyBuO426iiuZp8cv6xyZIQk3NGm2lWIhldDaZ
	wckq51zfxlKI0AgCn31AIWCpklpGNzR/s2BAUDbhfEQqrFexB8hN3jc/oJndLQXMtSo=
X-Gm-Gg: AeBDieupN/a6qHHwXvnFqPPHOq5O/ul2jn2qRP4h2UVFBdlLte3LThA5EoGoOJrd5Qd
	DpxcKNiz0JJA3GLkgeceUFsmn/yHJ6TG/NRtIBBKKPiSd4oNzzCkfQfk8z0JT0zd+ZkJJQgk3HY
	11nbtPIAQSTpW7ebqX3henO2pPujz66zJtZQkufdfBf4cUJTo4MZUsR8/e5fx+ZVBsNhEWXyBRV
	ccNGA6psCLOcXNv2S2deOFg7vEJenJhoDebvb48A2w2S5ct7eC2aif95qp3i8wdSzaSchd+cMs3
	AuOL7x7+wdfrtd9s0KQMboHBrPqudYMc91h7ZpR+UHNsci2nGNa0ny9wsb7IlX2kFID/ibT5wn3
	xDK3MV2+jkIR3Ffly6VTGClVV8sWjDIF/egE3h6zhuMERGDm2pbIHGFRgr8h/y/gRn0gPbcXu+1
	Fj0t35ISNgV4HNbL08ECf8V+8eV4iMnMLzksplgEVBMx2IX/Y3rGoYOeujmrM=
X-Received: by 2002:a05:600c:c082:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48e51dd3a1bmr46595295e9.0.1778075643420;
        Wed, 06 May 2026 06:54:03 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e530b19adsm17343205e9.3.2026.05.06.06.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 06:54:02 -0700 (PDT)
Date: Wed, 6 May 2026 15:53:59 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Maarten Lankhorst <dev@lankhorst.se>, 
	Maxime Ripard <mripard@kernel.org>, Natalie Vock <natalie.vock@gmx.de>, 
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	kernel-dev@igalia.com
Subject: Re: [PATCH 0/2] cgroup/dmem: introduce a peak file
Message-ID: <aftB-cc5EhDXxCGA@localhost.localdomain>
References: <20260506-dmem_peak-v1-0-8d803eb3449c@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="reykr6qmcqnxtkqn"
Content-Disposition: inline
In-Reply-To: <20260506-dmem_peak-v1-0-8d803eb3449c@igalia.com>


--reykr6qmcqnxtkqn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] cgroup/dmem: introduce a peak file
MIME-Version: 1.0

Hello Thadeu.

On Wed, May 06, 2026 at 08:58:23AM -0300, Thadeu Lima de Souza Cascardo <ca=
scardo@igalia.com> wrote:
> Just like we have memory.peak, introduce a dmem.peak, which uses the
> page_counter support for that.
>=20
> It can be written to in order to reset the peak, but different from
> memory.peak, which expects any write, dmem.peak expects the region name to
> be written to it. That region peak is the one that is reset.
>=20
> That requires ofp_peak to carry a pointer to the pool that was reset.

(It'd be nicer to have generic data in that generic structure, at least
some void *priv. But see below.)

> Writing a different region name will reset the different region and make
> the original region peak get back to its non-reset value.

I'm slightly confused by this fds x pool matricity when there's only
a single slot in cgroup_file_ctx::cgroup_of_peak.

The intended use case is that users should maintain one fd per pool and
not mix it up?
This stanza would better fit to cgroup-v2.rst proper than the commit
message. Or make it simpler and start with non-resettable peak file
(like memory.peak had started too) and see how it fares. WDYT?


Thanks,
Michal

--reykr6qmcqnxtkqn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaftH6xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgWBgEA78n1QkHtqLX1e7j+HqA5
/0hULtuyP0LvN9r2E3h2FskA/0/p9uNIv1XoJqaVguIXjyHW7Kp9SnAM0puHxrMQ
TzMA
=pFLa
-----END PGP SIGNATURE-----

--reykr6qmcqnxtkqn--
