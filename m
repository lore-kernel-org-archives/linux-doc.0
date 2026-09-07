Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218A4F30E2
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 14:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789998; cv=none; b=aUW082m4y3riEFcNSCvrlH3zi7P+pulDmoh4CUZXIT6RXDXVORtuNv2OM6NH+sL2tiMmJ7lIE3x2ZWSfdDC2b+c0+xE9w2BP1QnkNUl4L3JRj9SEbptU3WKm1gLMjEQYVWMzgQ3qK3ylTjgiW0GvVYgvoE9Qk5doLFwwmkX8BtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789998; c=relaxed/simple;
	bh=kAiALmTWnf8x9SsADiUwVb4eDhzSyPp2/E69JaKJyug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gadOSfPrJL2NSD99fwdLP0RPG/rY7Ebjzrtyk0TFnI1zkpUnFfnTPK6g9O04IHradaagqSXCGTpHqBDimmo/jn5iON1p03YP4dbdjbxqujv/tDAiFE5AsxyiBFYCVh/KXdDqwHR4L81aN4WopVe8eFPT77AVuaLEsUnhuuQP5lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fowv+iyf; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fowv+iyf"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4843f205a5bso2113283f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788789994; x=1789394794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hnVIlm2nSumk0PrCQmB9sy4lQ8aJwTihVNma9sBp9rQ=;
        b=Fowv+iyfr+KORHEl5atNl+7aAwsXvqtBTsM6zUgXJucKvDkMEVGUkhGuNvV6A0GKrq
         2TOLgDaQOOYq8Pa9yvJW9ela5KfpxlYYVdQ0iZSVr0+NFOSPzoMhyueP2IVRuHQAaC1L
         L71LrPhPKXdowjiGoPy8mVD08JcmohltxtUprlvQ+XuQNIPkK4IggtPxtjpCS1bEJkS+
         lyjAkHNM74Li+F/ScdA1u2GvyL/hPxMqyr4WDjLeHgK6nIRJOwuhavu+zxS7tC3aNDBh
         dnKffwS0AVynB5j/qhgiWaDINiq6K1munQ+tuO9cP+oUimRz37xhuVBbhyH31ufm7+bl
         zOtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789994; x=1789394794;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnVIlm2nSumk0PrCQmB9sy4lQ8aJwTihVNma9sBp9rQ=;
        b=IQhRrqHykNakfcCrSyFdo9DeLXJ4x64OkFAb7fKOdjCcjNKz3OYllxd8Tsv0EdaI6Z
         bI3JyT/YkPnSGhtdVXRNwNaoI7zs7xkyclE5RyNDIuvz+2ieNQG7ND7hVg8IjWG3rzGX
         3ZcuQTQW5E7l4L/wVkPrbGONeVwbVrQR0/ociInx6TqvMdfmXWfkNKCO6avfn276IsRL
         LtpcISFPKoecHPkoNYRUon/KcTYudWqtKwgStCauscyERYz1CAqmNe7IgSLejkxKAlbp
         BhJc57CtrpAOCiZ2NbHIFoEsUhI08JA+bsVluvPe1+e7c/7/DQhbcaKj7yrlZv6o3ZqW
         432w==
X-Forwarded-Encrypted: i=1; AKwUvByVyiI7T/kdzuhjuQE24swBYf7anOTvOKMfBXurCeeZH0/ZuV+qto2oFOaxZlIeFRERsIizNX1XR7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kbC5EFFHrNSd8E5lYv08Kq1+6SSioSxaLTBP3/36mLi0vVV+zS
	jEMmh69bFCCafrIldBLYjaZHsQJWycWvdDELB4m76fofhnrTXLHWBFhuMNYC8kAoABE=
X-Gm-Gg: AYBFou0P5+KeDdxkv5a5tJeUSH4K9/4P7inKD8a6oaQ4VkVFY0gLztD7NNOfwH0kbDx
	U7IUCe9JP7EdFEbLwAauOJRiuBVL/S4jLMm2Pec2VC2t9XaJIc6de2x3rmnAb3scjs9zOtdZXda
	mQrHZuX47Xr7yOVaOXpnISFFdE76WaiW6BPmKX8qURRybxUJdVRsDhzdD1CexBKsvmTLilQ2DYD
	TIi+18FY7qecjB3Mv6Kb7z8gGvzjFLoTjiGms257JLDZx/tIQPPo1P89AXD5FLDYW/y23YCG0nx
	CPwt6wraGodfuplAE0+Ynja8WBoy59knmSTG2gtc6A3s3Yg1TP42HSsisNYUzArcEeC4WeMpOKF
	MSvldPw7yOkuqztC2NZvoe1+4HgpnWFpIqjJCV4GLSWKbbtlk9Pm6hc1axylnMGUQKwnvnIjKUm
	a4wi/sMm08u2mKj/gSWId7E/e39BQis6AbsePwniyEaDGkMafqOC2urjU4Cvf46To=
X-Received: by 2002:a05:6000:4014:b0:485:8a46:b3cf with SMTP id ffacd0b85a97d-4858a46b5fcmr20890181f8f.55.1788789994173;
        Mon, 07 Sep 2026 07:06:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm16866649f8f.0.2026.09.07.07.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:06:33 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:06:31 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhe Liu <liuzhe1@kylinos.cn>
Cc: bsegall@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
	dietmar.eggemann@arm.com, hannes@cmpxchg.org, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, mgorman@suse.de, mingo@redhat.com, peterz@infradead.org, 
	rostedt@goodmis.org, skhan@linuxfoundation.org, tj@kernel.org, 
	vincent.guittot@linaro.org, vschneid@redhat.com, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] sched/fair: Remove the write-order dependency
 between cpu.max and cpu.max.burst
Message-ID: <ap69-MoOmAJifgjG@localhost.localdomain>
References: <aobnZEh1hfIBhswD@localhost.localdomain>
 <20260904062013.504236-1-liuzhe1@kylinos.cn>
 <20260904062013.504236-2-liuzhe1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5sahav5mzexczfrn"
Content-Disposition: inline
In-Reply-To: <20260904062013.504236-2-liuzhe1@kylinos.cn>


--5sahav5mzexczfrn
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] sched/fair: Remove the write-order dependency
 between cpu.max and cpu.max.burst
MIME-Version: 1.0

On Fri, Sep 04, 2026 at 02:20:11PM +0800, Zhe Liu <liuzhe1@kylinos.cn> wrot=
e:
> Keep the configured burst independent of the current quota and cap it
> when CFS refills runtime. This allows quota and burst updates in either
> order.
>=20
> Fixes: f4183717b370 ("sched/fair: Introduce the burstable CFS controller")
>=20
> Cc: stable@vger.kernel.org

The change makes sense to me and it should've been like that from the
beginning. OTOH, it may break someone's setup, so I'd take it but revert
it should regressions be reported. Hence, I wouldn't mark it for stable.=20


> Signed-off-by: Zhe Liu <liuzhe1@kylinos.cn>
> ---
>  kernel/sched/core.c | 3 +--
>  kernel/sched/fair.c | 3 ++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index f78275192036..5269b8cfcf7f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -10159,8 +10159,7 @@ static int tg_set_bandwidth(struct task_group *tg,
>  	if (quota_us !=3D RUNTIME_INF && quota_us > max_bw_runtime_us)
>  		return -EINVAL;
> =20
> -	if (quota_us !=3D RUNTIME_INF && (burst_us > quota_us ||
> -					burst_us + quota_us > max_bw_runtime_us))
> +	if (burst_us > max_bw_runtime_us)
>  		return -EINVAL;

I notice this'd be relaxed rather like:

	if (burst_us > max_bw_runtime_us / 2)
		return -EINVAL;

I don't see in the current code that these BW_SHIFT'd calculations were
relevant for burst.
(Sashiko mentions overflows of the addition but I think it's confused
MAX_BW and UULONG_MAX or more precisely (UULONG_MAX / NSEC_PER_USEC),)
so even your version should still be safe.

(Without that stable annotation above.)

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--5sahav5mzexczfrn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCap7E4hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AgafAEA/lDIyfoaL+fSg3OpnbzT
kKX5pkBVfO+FBzeCudKKlY0A/jVSRzj8PL3weJy/l9NmUY9jh/ilifk5nRv6Z0tK
K/cK
=kYvk
-----END PGP SIGNATURE-----

--5sahav5mzexczfrn--
