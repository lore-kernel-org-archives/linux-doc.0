Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAF14399E8
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 11:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226208; cv=none; b=TUDEuoryHO6bp+dxOGN2HGgR01OJ2ZM21No5sHkC5gSlpDrgx/QYwoDS6gDapWQJgIqEXxnNoXhGKDLJ106Jgu1kkUrhQ50WA5CHSx4PeZhLwYEi1KFBIw38ojcflGJCQ/BB3OYzdezlwoJXutdTwBs1ul9xGXAdVCmd2UXjm3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226208; c=relaxed/simple;
	bh=6Hy36tKqtpWDaWpvQ0XRRybVqYi3B32kl2Aie52EHHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pADo3OinswZ6FfWtui03mzyuluE/PRzykOuzwu2kbiCoW2orokhGDEQ7fRAUDtQp5sKnJyYJOKBNxXHAYj4DD3PXQZAaQhUxr7EBqeZFMhNvRLeA2Xo8fQi72L4dMdUgu7pgfeII1xER7ZAkJ5X0Gm5tafjjtGBQfKtRqLPveg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TuPs/9lN; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TuPs/9lN"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1312010f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 04:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787226204; x=1787831004; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9V5vN05xrZ88Pts7+MbgysCv3/LZ3VVMuZVNPdkuC9k=;
        b=TuPs/9lNAxnQECGWd7Q41+BTakiLJH9upC1PIfHpPDEIBBVDnHYueE4a9jTh+pIwo5
         g3hJzb7Cbw1kDHYsGdbbIKg7XBjANoRbIZhcYqyT1Wbe62o2bK2DCbstQhvYB9iMzV8Y
         LfeKfQkViT//iipLEXXQ6y+P5idvGw4fSRNRZs6h5rUtsx5YDwyAOapmPcEq4+ZjM+/1
         Tz5bigsjECWo9dYVWn8VrB7xSfba3u3C6XfyilDEk3rBkFs2cTET5yZ7qHkcif1Z4FpB
         TLC9JNsZRj/wxkBMI3Idv7JCgL7rXOOcIkNuEDqAJC7LXRyVhiRnHdgW/l6w9zS57ZRZ
         a7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226204; x=1787831004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9V5vN05xrZ88Pts7+MbgysCv3/LZ3VVMuZVNPdkuC9k=;
        b=XgGT0zH0WTjpd+nF6j6SxUv9sk/iffV6tytMhqYYja67E16KYMuKQ13HxKRMiJG5Wr
         immKCOh0d1o7VT1HKqkoyOfLxzaje46rFh7mlYhUahLh2CLWEcTi4rD1TnJulYxQZ0Nk
         bgoWDeax0+x9BzvJiznzTvdqJAiYwuk+r/rA403CMcBtUoPTayxgTKYmk8lteAdIjOj+
         bF1EhWnM9+M32GMlrKnt9YYkHr638pfcXXWhV6SXf9HmF/zMimoBxhCEaeBxrW47Dxto
         x9JWEF/hAoKiEdST4PgwTtqcGLeHriAlz+ladRss+ycd3nCg6urafk3VMvo1O8C1xzDy
         Sozg==
X-Forwarded-Encrypted: i=1; AHgh+RoqhV4V0UP6cbD98vm2s1jrOjrsbczjflYHEcxb3kvDJUs1wMj1QS7hzf/UmzcFGOx44Ly5SPnr/+A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nUzHG5yMGSC/U6QyuO6/dIqi6V54wsDXuThuq9XjM/H9pFTa
	iscZQSimsw0LlX6gh8N+WLKnw0+7N5s7FYIPQpJsaPQtin9kxK/ryBXqIsnBxPVkC6c=
X-Gm-Gg: AR+sD10hhreBaSs8WZ6Y8Od5wCzF0uVe7t4XHnizspWrXZ+i91Y6z0t8t1v6M90g9zj
	M4wtX00dQlx7uQ+CbBAbCL5VRtZrdxxTWSxrBVjs+YnTxJd40LoRYiP0QCAJSN8Q2527q1WZoiI
	VcKDD4Zdj3KN8LLjJ+0Wz7qL3sQqa2PvQTuH7ewGCKM/F9mee8zlAGNmxe3Uos4buDRURswkVcV
	md27zjDJzTRU/JcO9XeoyNqyJKmhHgb0MlmSo9L0ovF/e90PPixu4mLEDoJNeOU9B1mtZZsJdg6
	lyyZiwAnBrvJfk/Ve5CQ/Lwraz/xl4ML/hpsM+AhnChvY9DkDqNKPH9jFwoKksO5p1JuVvK935/
	7qPYxOAvsgOe7s8mqiI1ilJGLF7qD1O3T8gS/Ty5d/VszZCJO9y9mtOyskmpQuQvlYPPKkOOeN/
	8D39pDfVNX9LOUE0BOIXoTWJde+39GpK4FUe+/flua2ZQBsyxnOld+VDc/+H7ZfH4=
X-Received: by 2002:a05:600c:468a:b0:496:c9cd:e7ab with SMTP id 5b1f17b1804b1-499aa172377mr164276785e9.5.1787226203746;
        Thu, 20 Aug 2026 04:43:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa1111a7sm139337275e9.6.2026.08.20.04.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:43:23 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:43:21 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhe Liu <liuzhe1@kylinos.cn>
Cc: tj@kernel.org, hannes@cmpxchg.org, corbet@lwn.net, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	skhan@linuxfoundation.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] sched/fair: Reset incompatible burst on quota change
Message-ID: <aobnZEh1hfIBhswD@localhost.localdomain>
References: <20260820033218.214259-1-liuzhe1@kylinos.cn>
 <20260820033218.214259-2-liuzhe1@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ljyugzshyqxvbva5"
Content-Disposition: inline
In-Reply-To: <20260820033218.214259-2-liuzhe1@kylinos.cn>


--ljyugzshyqxvbva5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] sched/fair: Reset incompatible burst on quota change
MIME-Version: 1.0

On Thu, Aug 20, 2026 at 11:32:17AM +0800, Zhe Liu <liuzhe1@kylinos.cn> wrot=
e:
> A burst configured while a cgroup has unlimited CPU bandwidth can prevent
> a later finite quota from being installed.  For example, on cgroup v2:
>=20
>   # echo 100000000 > cpu.max.burst
>   # echo "50000 100000" > cpu.max
>   sh: write error: Invalid argument
>=20
> The quota remains unlimited because tg_set_bandwidth() validates the
> existing burst against the new quota.  Recovering requires userspace to
> know that it must clear the burst before retrying the quota update.  The
> same problem affects cpu.cfs_quota_us on cgroup v1.
>=20
> When changing the quota, reset the existing burst to zero if it is
> incompatible with a valid finite quota.  Preserve it when it remains
> compatible or when the new quota is unlimited.  This lets a quota update
> take effect without depending on the order in which userspace writes the
> two files.
>=20
> Rejecting the quota would retain this ordering dependency.  Clamping the
> burst would instead silently choose a different nonzero policy on behalf
> of userspace.

Why not clamp the burst_us to quota_us? That's quite natural to me.

> Resetting it to zero provides the existing no-burst default while
> leaving compatible bursts untouched.

Like Sashiko said, the user configured values should not get lost, the
resulting burst value (0 or quota or whatever makes sense) might be
applied effectively (to allow configuration order independence) but not
overwrite what was configured.

Thanks,
Michal

--ljyugzshyqxvbva5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaoboVRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+AjoWQD+Ih8SefrHPjy8wrrXINmL
1u5UhSH1rtRrBGNDUF32XLsA+gPkVJm6O80wMNqFk2Qzcn5wiQvR/pkjhJ9IU9G/
OksL
=fx8D
-----END PGP SIGNATURE-----

--ljyugzshyqxvbva5--
