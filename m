Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27B47DD66
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778080170; cv=none; b=pKIg0DuFN+QJemAWvVzPSbOwRMDBzsSB6vjkL+x14gP7op1elKk2eUEBBFGMUnY483gHO37x43lRV3oPbu+C9a9vdUvlCQEcKV5s9BqFE3bbAqzwn/PfQDcW4c0BgaDie9TCNs2+MCWWbWcWUCmj13YVeLNn/GM/hci7r+8X6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778080170; c=relaxed/simple;
	bh=PtBGz2x9WQ+HNP+qaMuedUIcyx8fnxzRJan7d8nhIVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QptENxP+Nlz53BMuWYOwlms+nqcEriQIav09k5UB5M3vS1/tD3XcmCnkmixIPv3iK/M/TcyHis+V2SRz37/6K6FI9f2Qxr5KiJMnkUdc9zB6WgI3dFcJE0lkozDDlXNRCvRrFsf1bT1WMTjE7WZy5+KhSu3PR4YzYKTTIIyZFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Xnatgcey; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Xnatgcey"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48896199cbaso57707145e9.1
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778080167; x=1778684967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PtBGz2x9WQ+HNP+qaMuedUIcyx8fnxzRJan7d8nhIVw=;
        b=Xnatgcey/IP8Zx9HfCzEL2xBhxJhqTmhJP7ZDQbdZ/U5aY0kDaLlcsqYS2QdU/Toz8
         ElqL+dXp1pju7n6WGfAGfxXJTIqJFM0TKRlZV5sQv0E4tYMw05DGASELN6KYy/ithcL6
         2mYoR+7mcFzTvZMhteC2QqzrY1NIRW18G9TtIxQa3RaxbTiCx0CJg4wVKLHYu4vBU3Ez
         XbIfZFucdni8K7jEuTxqYWAlp8NVYOqbU/Dhn7nDXVAjb4Lno7hO6zkkmmrTmVLp1yyu
         V3yuaBDo1TkXp4CfgzDgBmT8P0O8aJ1DcEDB6aEwJsEVJzJu87yz+QUoEdov7fafNjXn
         XUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778080167; x=1778684967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PtBGz2x9WQ+HNP+qaMuedUIcyx8fnxzRJan7d8nhIVw=;
        b=HEbZiWv1TYnz4oPWtLnMhWCmeXLA/WTcZqLnDaUgM+jEK/rW1KZtKJwfwjKjNBTJRS
         hyoJPdbvSNQlrWxD46eiQyO2dO7Cw89CBXRQEr7/XrjysTBZAZFVdSjwQf3o629PxPHH
         T/CeIL9J6CWCK56uH4HjjsKTRAHTSTRN/L9qfviA1PpQuo8DtFyo4reHHkB3r9/6JHAh
         T0B5T8Mq8uoKhyMs5dEh+OgSXi0LYq7XmCSQH8IWYafL4MtBXxAnQHxbyO/Inca6vCR9
         7Y/iEI/q/h73Mn+hZDep274ijfoTsCRuDfJTv/gAG93i8ViLnr8JueVWOpwutNyAsISt
         UGHw==
X-Forwarded-Encrypted: i=1; AFNElJ+ob4w8JIa3obU5RJyas55tyi6Ou4CRb6imsDjqufFfGSlQX43AOF8P3BJYyFRxCR+BFrLrZhLPKnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAMhdvcXAwui/1hBTOuOFpdR0INS4BmqRHomc948NJh6BIHwac
	gfDfo2NSkZOFG5sQMCdJovAo9FuAdlm0F+Vs+2dN/C+c2LUp35d+HlAvNt7oS+5n3J/KOTr85S/
	Nhxe5av4=
X-Gm-Gg: AeBDieu/k14O+k0Nbruyy4b2b2ct0QFhFOWVV+VH6hw0V8LxTc7DMgk1iqRdcAC9voh
	2DvVkGeCtssfFjlaWZSgiWb3sQJG+jPpvWu1JPMzwNxV2aoZUO7LP43S38icqcEllSKmzTOSqB3
	Yd8xnfL0by9AyFrVcIrL7vSWPSfyIhN9bx5ea2NDd8LT44Hws0+eIklHT5K/IiCjVd8gi3CjBjq
	jiuBn5X4CQq9efsTKtdVR5s/ROWiOtMQ7eqJDP2sGKRKZvoEWxuPlMQUXC1fWO1Z4WEqpIs3ExT
	HxNcx0GZaGFHtd81DN4SinSANcb1A4kLvCkYwv0VFKVfYqpyld1iBXmcq8rfxVAWKieYaZ7iMMm
	6WuMhnSeFXFJo6546/z9zgEhyjj3apyru9YTf2GKbIGJj0Zqhx2iTPEmMcJ1qafj7iDg5d25jPK
	ix2yQoKZrc/qThpEAo4GiD6H5I9hHJwNzbKnInCaaIqzev5gbqsF4l92gtE2M=
X-Received: by 2002:a05:600c:8906:b0:488:ffad:6728 with SMTP id 5b1f17b1804b1-48e51f46d7bmr49899505e9.19.1778080167469;
        Wed, 06 May 2026 08:09:27 -0700 (PDT)
Received: from localhost.localdomain (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5312df8dsm18475835e9.18.2026.05.06.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 08:09:27 -0700 (PDT)
Date: Wed, 6 May 2026 17:09:24 +0200
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
Message-ID: <aftQijvIHNZo_UyS@localhost.localdomain>
References: <20260506-dmem_peak-v1-0-8d803eb3449c@igalia.com>
 <aftB-cc5EhDXxCGA@localhost.localdomain>
 <aftNsqrv2sGPOPHX@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjfnm2wcpgmp3gca"
Content-Disposition: inline
In-Reply-To: <aftNsqrv2sGPOPHX@quatroqueijos.cascardo.eti.br>


--pjfnm2wcpgmp3gca
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] cgroup/dmem: introduce a peak file
MIME-Version: 1.0

On Wed, May 06, 2026 at 11:18:26AM -0300, Thadeu Lima de Souza Cascardo <ca=
scardo@igalia.com> wrote:
> I used void *, at first, but as the only current use is for the pool and =
as
> mixing different uses may lead to misuse, I thought it would be safer to
> use the type directly. This has been pointed out before for other members
> of cgroup_file_ctx. See [1].

That mail reacts to union overlaps and pointer vs embedded struct
allocations. Correct me if I missed your part.

I agree that having properly typed pointer is safer.
cgroup_file_ctx sub-structs are for generic cgroup files. But here
somehow a specific controller needs propagated to the generic member.

What about storing also the `list_head *watchers` inside `struct
cgroup_of_peak` and each subsys would manage it as needed?
(ofp->watchers =3D=3D NULL could also substitute ofp->value =3D=3D
OFP_PEAK_UNSET)


> I started with a non-resettable peak file, but as memory.peak can be rese=
t,
> I added that feature too.=20

At the same time pids.peak has survived without reset option till today.

> If we want to merge a non-resettable support ealier and need to take
> longer to discuss how to work on the resettable support given the
> above, I can resubmit. But I guess we can see if we can reach an
> agreement sonner rather than later.

What kind of users do you envision (i.e. would they need resets at all)?
Anyway, the behavior should be explained in cgroup-v2.rst since that's
where they'll look for it.

HTH,
Michal

--pjfnm2wcpgmp3gca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaftZoBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIACgkQfj0C55Tb+Agf3gEAnS3SQwtU72d+vybPMvLs
abYBuiDKjsiW+4zy1RFNTAwA/36oWRqQ1pjGEuPTFgTxHnl4+5Ls3E65Byjp41wO
W6cN
=obKI
-----END PGP SIGNATURE-----

--pjfnm2wcpgmp3gca--
