Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB49199FAB
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767899037; cv=none; b=caghXH+L8TLI7V2yleFN9SCeSwg2MtQrQRakiH4L1vlwfGfxlvoRygQJlB5s1h+pITeDkqRVPfQRUVWsaUxEq112M501TbStGqhwCjbqSLH5onY6HEuiRy2q28pqnxEQyANhWDXeDcgolqhL1V7qdE617/hOjZ+3aBvz8ZRZTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767899037; c=relaxed/simple;
	bh=xhgT28dkad/D1y4uVnpRXe0VRSx18poyKWXduC4zXJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/t8hBEmmjbJ1C2KZF3F0U3ZmpkSyxVjvjfB4ejPjis1fshLzhpERPZlQS0oYnTyCcaVwbfZNrlTPsxaLlzuJDJYHoFL18+MUrKLpjHlbskAtNxgt/71HxOH+D7dW/5YAacmuQTzoVgXDguW2xSBpHMJa7lI+gJn7MLMDa7hiE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ghFisv38; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ghFisv38"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so26760135e9.3
        for <linux-doc@vger.kernel.org>; Thu, 08 Jan 2026 11:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767899035; x=1768503835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S2fxq2ALIuH1OtiNQCl1rhI7NjLzA8vs5p2zuiJ3iwA=;
        b=ghFisv38O9Tzqk/aczTfr5DZ7S6uaoCSxAUpb4Olw6JbCyY22c70ZLkNV+LBHm+HS0
         EPW3pdJCGqCie7cHWVyjIdAq0GUfvs8An0KaDQc8XwelpHsRg3ybj2UjNFMj8Zr7fKqD
         kK8uZx8oqcQjgjjIHCHMYCeaNqWfUdnSd8X0eJ4gRy09Cy8AgCZ+OkVCBcCWYPaID8zP
         HkR2lcb0xudlmuRI7toZmmDDP0ChJW3V8hr7yoLFBCWZzUoH2i7A51YNqz4yTw3Hzyg+
         Ypt7HmZvS0tVJKV5GRGqX5LjSElTDsR+PvKYhqM+PmjhkadKn0R37/AlaUyPPXucflYb
         4QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767899035; x=1768503835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2fxq2ALIuH1OtiNQCl1rhI7NjLzA8vs5p2zuiJ3iwA=;
        b=suQUUISJZZESGcbN8WsXSuLFfOoFVt3Qa+A5TuAuJYr8AyIvguWrFELMUPMImXhSLC
         mhRX+mEKVcBZrhoO4mGmcTMwrIb5R465zyrlKeGkxYizQnPO3ZE74mgJ4DqCMeMPR13W
         xw8hEX1AxU899ZYoJJhaATusqUzDGXJrLfz6Wgi5bOzGVXbmXxF+CxN6CG3sVeu3gm1z
         ybq+Wck/69FtICYsMFy0FJr//SoRsIut/5NMUGQgUGoF5O5TIDSHUcCHEVy+Rj9ql0wC
         02gyCrdt2HfU1ttp8nrwsb2BC2dEbK3zEJWEOB6XxLhWwGX03YDbuFt9tSh9nSImbayh
         Fmkg==
X-Forwarded-Encrypted: i=1; AJvYcCXlAB1ztusr1M/MOHUr0YUe+WpeFYxFA1VLdjeP+SQBM2188UkrNRXIf/G/cJ7OxiMhf6XDaiA0pb8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzak6Ie/4loFfLCkXs4IHdS4yRN+ySt6Kg0y9X2H1ZCW5aCZOcM
	ddKRWt1ue74c3bv2hQ7pl7QuFHu8gMUgBO0xz9/keI3A1BVz0uUGc/i0Sj3Bpf8Qjw0=
X-Gm-Gg: AY/fxX6kbf3mnDEtrfvZc5rBlTQz3Y1UPDXldghfBuK2oEGHVd76L2tMvaagQGRdV0Y
	3O3oBux+xyuk3CYluXXyt6g9DgPWaa0fBsiUtGsUa3qlgqkgmogPRqGzZfhGORFImZ9xxA2QPLi
	EvErxzaXZ6gTP5gzLAkKZeDxm/XQnX5KMagOs+bBXIHOjfEqjemUSBS+ViIx9rqFCElXxb0NAWY
	Aa37IO0Ja7R2ajccq054xmvAzqY5rh/vs6WObknieyZnEPTgHRlXaeojFPSkY61mA+/TR1TKeNd
	JG35JkrvyxV9a4QoOYy+xYV3CJ+oRzWMr6BZJskeT7+jgzAfgIfKxczrLaEjFOL2mzkbv5NkZ9u
	lcRvSU5s30CHC9xcAn/LT/bi/hjd85fPVAEu4YDbZWBSHMNa0RMVqbbbgPQ3w4DmB5EjqSQ7VZm
	4zBP/5/PrcTSF9TfsnUnqqmT1ZnH6E3ws=
X-Google-Smtp-Source: AGHT+IHKBn5HwApDCk9pjRfiuMOygdOPqiU/qGu+fBNW2y9CtjCYUhbtVuWgL2X2bFThHx0vI6yGeA==
X-Received: by 2002:a05:600c:b86:b0:479:3a86:dc1e with SMTP id 5b1f17b1804b1-47d84b41007mr86003605e9.36.1767899034659;
        Thu, 08 Jan 2026 11:03:54 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d8916436bsm29433825e9.18.2026.01.08.11.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 11:03:54 -0800 (PST)
Date: Thu, 8 Jan 2026 20:03:52 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Chen Ridong <chenridong@huaweicloud.com>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Sun Shaojie <sunshaojie@kylinos.cn>
Subject: Re: [cgroup/for-6.20 PATCH v2 3/4] cgroup/cpuset: Don't fail
 cpuset.cpus change in v2
Message-ID: <gscfzr3lfd2gynec3ci6puz2cyvftrv35udrzzyfi4kjdicfcp@6vdgm645fmmj>
References: <20260101191558.434446-1-longman@redhat.com>
 <20260101191558.434446-4-longman@redhat.com>
 <efdcd90c-95ed-4cfc-af9a-3dc0e8f0a488@huaweicloud.com>
 <6eedf67b-3538-4fd1-903b-b7d8db4ff43d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="blzurjhfhk33az2p"
Content-Disposition: inline
In-Reply-To: <6eedf67b-3538-4fd1-903b-b7d8db4ff43d@redhat.com>


--blzurjhfhk33az2p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [cgroup/for-6.20 PATCH v2 3/4] cgroup/cpuset: Don't fail
 cpuset.cpus change in v2
MIME-Version: 1.0

On Sun, Jan 04, 2026 at 04:48:06PM -0500, Waiman Long <llong@redhat.com> wrote:
> Before the introduction of cpuset partition, writing to cpuset.cpus will
> only fail if the cpu list is invalid like containing CPUs outside of the
> valid cpu range. What I mean by "never-fail" is that if the cpu list is
> valid, the write action should not fail. The rule is not explicitly stated
> in the documentation, but it is a pre-existing behavior which we should try
> to keep to avoid breaking existing applications.

The justification for such behavior is that when the configuration
cannot be satisfied immediately (insufficient resources in ancestors),
the original user's intention should be stored somewhere and if the
conditions higher up the hiearchy possibly change, the intended config
is effected transparently (w/out the need to re-write values by user
again).

So I appreciate that cpuset.cpus.exclusive writes fail early -- for
sibling conflicts -- otherwise the order of creation would need to be
evaluated post hoc.
For illustration:
	a1/cpuset.cpus.exclusive=0,1
	a2/cpuset.cpus.exclusive=1,2
	a3/cpuset.cpus.exclusive=1,3
If this was allowed and a1 was rmdir'd, the (new) resolution of conflict
between a2 and a3 would need to determine which of a2, a3 was created
first.

HTH,
Michal

--blzurjhfhk33az2p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaV//jhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+Ag2EAEA1kVYbvQJlJ41fvGL47iG
M8FIlLpc0GtmcjU3WMUkTlIA/j40WZ0IMgCmmmKhTn3BCHibQbXnnB6/V4tPlv50
p1QO
=Ngzr
-----END PGP SIGNATURE-----

--blzurjhfhk33az2p--
