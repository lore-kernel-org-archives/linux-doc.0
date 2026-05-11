Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D60374E6C
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 11:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778499594; cv=none; b=D/SWGfjaXkA6HWQZkdhcSp3eijmeIjhXTJKkbsd6qu0CDjWSGfXiZPp+gpM7eyJdM0gHm337vYrV1RCVG/ES9PdlO+z6HPaixETuJdMLgROWuLIfQd0ocCV7q7pgCOcywSqKphpjxjeLNKK3KeBuzBr2djRT9lLRRSztNC9po1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778499594; c=relaxed/simple;
	bh=JXwoxY9aO+DdJZo6FW5QgM56rkq1xPTTIDZwqNN6ABM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B78Y7BxOdZMI8dj4EDzS+YzcSE/33QP6RhCaBb2y7s1ShFPuYqYZolR1qsGxFjkzNrQDcYY+1d61a7HemQKEp4DnCoQ0ax90rptcZqgIc9t2JwXi6orMkC/EKcVwSD1AcCxNFyUk9SSgB+JRF3LTFI1rQaEizBpifHEwFbUNUoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=awtrweLH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="awtrweLH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48d146705b4so52473165e9.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 04:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778499591; x=1779104391; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JXwoxY9aO+DdJZo6FW5QgM56rkq1xPTTIDZwqNN6ABM=;
        b=awtrweLHbVfJ+6Bw9y4sECp2qtc+IrEupfd3CpIoOpE0Z3Z0sUOd+m/G+/IKQL713l
         rozCh97r0ERbJZI5AMmUiU7wg9ugEJyDfHOc7QeOzEGlhvlp3li7annLpI5vDiRZRWXi
         zRwUgc2o4pO6DRu/H3+Vl847g7KCc7CHRafUXphKNcDne6tQGRc0Re5fAv4bBFcSt0Jq
         LFuDRKryDDeydy3/fQOhOXv0r5WI3wuPbN+lHaFGpxBJqZUzf9jZzHa9B5wjEFKcwc1M
         ZW/+h7abq5nxSyYLoHJ3Ths2IUdjnA3ZzlZeziRjGMQygDdjQUcLRzBIor4DKvDFH5U5
         TmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778499591; x=1779104391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXwoxY9aO+DdJZo6FW5QgM56rkq1xPTTIDZwqNN6ABM=;
        b=dS+XZGf6IoZdd2xJSHCn/tfz1H7dbEovMmPgP5+jUqigCRyX0LqAOa02isuaZJVQpj
         KKFE20414fl2d1BUHKNuu4cGsR4qSnMpbSFn56hJv7YmsVIsAm+0HXbJN3dw/6mY/iA3
         K6Dn6R/5xYLv2gH/gDWoFT3fDNph/JGjmuvOdR9Fab6pu9389IOZozJZzMER36M+fxqP
         ZehiCOpaEsSttXmGa0+UaYHCx6d3lmf0oNzJdVJjfj+CJI4uMF8ynOdMWwZf9Pd81nDG
         1beBFn2uEwhYlk/jpZALwQiU7MIdN0f5/9xwLng2qsuDvu0BitGe/2BVVCIGCDFGa+1x
         fY5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+zK9Re0vS8oKJtoiFBBwT8uAUR/kJXqVeMLHVDTaZEf9xtCLi/I17gyZcjokKOcUbX/kuE7tuAl8k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70dQtLX1w4xmud4/DQqLeE3l2dX0OupejLc5Xu6TArfTKx0xS
	7+1C+W4pQK/EUygsZ+aP/Fdzb9PjJTEYk/EtBFkbV8Kr54Kiv1jsXGwpIL5N1p7ppRo=
X-Gm-Gg: Acq92OFuD6vgrmamE+qo/eAEo6AF6N3Ncv137IXncPftinvwAwnyQTOmZhpO/yzmaiu
	5MBeY85ASbFjXmAzCq/Qr2sih4I1McdxLpFByJ5Uv45jTVIxzJ9x2FcE7TeEJoGkgcj4jTSgB7j
	Vfoeb40HIiZz+G/kIc1SaaAVkk6WXXWaPTfa/o6rd77zCfJ5guIXAg6oqbXFPuir9e+SBefo/tJ
	xACA8NGRFVeL+IX651grO+5p0kcx/dlAaQqkWJssM4yr/UgBcd+ZRJ/qzHJPOGTSV6OUqhYsUlT
	yukl3RtKIpHsaC0ypdkDqhjXHIcTmIStjmXKERSQp1aplWbiuaZLYPFtAbuHBDZghFp/GtB35pl
	aE+4tehVAUhcVOqjg/Q4M5F0wlYvX7BvErUiOi2aWSZFlB/bW8qS7CQKoR760dXZpzm41dyo9Bo
	3E0x+NqJx5vhmtGWwP6B0dKX2w5jR8lbhXoA/oL3lF2ivgrZwj
X-Received: by 2002:a05:600c:83c5:b0:488:c683:be89 with SMTP id 5b1f17b1804b1-48e51f2a759mr342964415e9.9.1778499591165;
        Mon, 11 May 2026 04:39:51 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6db0b08asm83235955e9.8.2026.05.11.04.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:39:50 -0700 (PDT)
Date: Mon, 11 May 2026 13:39:48 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Subject: Re: [PATCH 0/3] mm/zswap: Implement per-cgroup proactive writeback
Message-ID: <agG-gNEclOVf-9WA@localhost.localdomain>
References: <20260511105149.75584-1-jiahao.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o3jizhh4qfyisfpc"
Content-Disposition: inline
In-Reply-To: <20260511105149.75584-1-jiahao.kernel@gmail.com>


--o3jizhh4qfyisfpc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] mm/zswap: Implement per-cgroup proactive writeback
MIME-Version: 1.0

On Mon, May 11, 2026 at 06:51:46PM +0800, Hao Jia <jiahao.kernel@gmail.com>=
 wrote:
> From: Hao Jia <jiahao1@lixiang.com>
>=20
> Zswap currently writes back pages to backing swap devices reactively,
> triggered either by memory pressure via the shrinker or by the pool
> reaching its size limit. However, this reactive approach makes writeback
> timing indeterminate and can disrupt latency-sensitive workloads when
> eviction happens to coincide with a critical execution window.
>=20
> Furthermore, in certain scenarios, it is desirable to trigger writeback
> in advance to free up memory. For example, users may want to prepare for
> an upcoming memory-intensive workload by flushing cold memory to the
> backing storage when the system is relatively idle.

I can imagine the zswap writeout can come at the least possible
moment...

> To address these issues, this patch series introduces a per-cgroup
> interface that allows users to proactively write back cold compressed
> pages from zswap to the backing swap device.

=2E..but I see this series is not only per-cgroup proactive reclaim but
it's also age-based reclaim.

The per-cg consumption and limits (and regular memory reclaim) are all
measured in sizes. This age-based invocations don't seem commensurable
(e.g. how would users in practice determine what is the desired input to
here).

Could you explain more reasoning behind this design?

Thanks,
Michal

--o3jizhh4qfyisfpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCagHAARsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AisVgEAue3WyVVGY7GBg1v3Zt8e
eeD5pIl0nLnXPUEjlLTIJNUA/2WZU04Y/56uL4zU3y+755L6om2vsL3DmWWaCGB9
0zoN
=7Raz
-----END PGP SIGNATURE-----

--o3jizhh4qfyisfpc--
