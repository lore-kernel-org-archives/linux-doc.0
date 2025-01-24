Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08D11D5AC6;
	Fri, 24 Jan 2025 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709579; cv=none; b=Dj6doW/fhW1uOAs8+SuluhKMh0KG4BaEDBZfl6AMIlbCjMAtBYSswscRCfw0PazpXSYJWgaKx4Q0NX2odVIsLWh9RlpTPdI7hA1Nxxxp4NesCVdspQd4EW5ubmHNstEyO7WAbhPUV/FXqavjVw6tXDq7ZjFUJqOuRR3IX6MPnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709579; c=relaxed/simple;
	bh=DXHBuCDcA9qEJgCgIqOXyAz0XBN+eGku4n3QLjlmDZs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FmdMWFF5u4EniNQcp97VWeU31LtE7vnaVfAPGX5wwDp9A3BJMXuzdlZkhF4vwIsIN28kYUh/2jndcoJ+qFWPWFmPdHJGMTBUVwB2ASC6u9lkNWHM1eoy2vpW6oe8LwXBxYHnGXGqoFLQYUcSY3efYNA7NumY0Dn30N3NpYM2obA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HqiLScCz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HqiLScCz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737709575;
	bh=DXHBuCDcA9qEJgCgIqOXyAz0XBN+eGku4n3QLjlmDZs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HqiLScCzjBq0Gdj6+j40nMgSadHyZzql7KkyLS3PThKcdHAmXficTz175VRrN8LUq
	 c8DGmkQ5WhXACiW1q4QtWocJNrSeXBt1QlMdUOUcFh8WbtoIiW5W7BesYGMn+H+1BU
	 +TOLFl43iyS7z+oz11w4xuYlrKPr1K0RNHfuTA0uxOJyMWQbGwYm7lOMSkbvds56DB
	 y/RH1zdbeLQugXlp5sLjhnw9JH+ntmfeS5BTQpAFJq48SjlWq7RInmJ+WhEGAaj9km
	 jHUki84H0H+4XhIzGzsdY2N5EhwrFljwyRmIhY28nLkkqAUKfD4WLOECBK2KRlBZfp
	 B0hToAaKgdj2w==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74F2B17E0E9D;
	Fri, 24 Jan 2025 10:06:14 +0100 (CET)
Date: Fri, 24 Jan 2025 10:06:07 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 5/5] drm/panthor: Fix race condition when gathering
 fdinfo group samples
Message-ID: <20250124100607.473761a9@collabora.com>
In-Reply-To: <20250123225325.3271764-6-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
	<20250123225325.3271764-6-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 23 Jan 2025 22:53:02 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Commit e16635d88fa0 ("drm/panthor: add DRM fdinfo support") failed to
> protect access to groups with an xarray lock, which could lead to
> use-after-free errors.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> Fixes: e16635d88fa0 ("drm/panthor: add DRM fdinfo support")

Nice catch!

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_sched.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index e6c08a694e41..1d283b4bab86 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -2865,6 +2865,7 @@ void panthor_fdinfo_gather_group_samples(struct pan=
thor_file *pfile)
>  	if (IS_ERR_OR_NULL(gpool))
>  		return;
> =20
> +	xa_lock(&gpool->xa);
>  	xa_for_each(&gpool->xa, i, group) {
>  		mutex_lock(&group->fdinfo.lock);
>  		pfile->stats.cycles +=3D group->fdinfo.data.cycles;
> @@ -2873,6 +2874,7 @@ void panthor_fdinfo_gather_group_samples(struct pan=
thor_file *pfile)
>  		group->fdinfo.data.time =3D 0;
>  		mutex_unlock(&group->fdinfo.lock);
>  	}
> +	xa_unlock(&gpool->xa);
>  }
> =20
>  static void group_sync_upd_work(struct work_struct *work)

