Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471332765F8
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 23:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757546826; cv=none; b=Huu/2kzwc5ejngbs23e4nzPkFkL08fz74IN0U2hL7QOXZAUw46bzT/6BsvnDGrMR3a8iDbRYN6x7Iy01yTF2oKrBz+PUeOPr02SpZ6zVeWhvplFAB7Pf2W8y+r9r+G3+bjxu7l5zeSndxXYsMAg1mSONYateD5jLZtCGWDwD0tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757546826; c=relaxed/simple;
	bh=Rso4kMNY++0mX+1Zk731FKkeDHtrEi4q28Veb4zHENY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRlQxBgmg5FgE9SfGpYxI+HCCeScAc2T6oTkzetd0oHpV6kcRVGxyKMXYHSIjZ2WUzJ6eY7OmnhNGotDsMi/invu/ePOz1PQa5RYlejIX6qi6QQ2ZqMYxXq9wxHsV7dVVL82KqKfUQue9LAWnfc89fIMt5UApbWxXYIgvbBoP3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDZjflnT; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDZjflnT"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7741991159bso194164b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 16:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757546824; x=1758151624; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z00uyoYaPpbnnyjTQiKQAeAb5AJf67lVttafJphDMJg=;
        b=XDZjflnTJn4qE5VdkvpfubzrBvIxzx5tJhsrqJYv6IvCWhH+pAwALxZErqNkzPuTrL
         ojtHVlFS1w3dCINqZPDK0sz9IIBHRMga9V1mLk1AKnIJkLC0iQ4enoqrn75GbcssgsT3
         oXcH7ZDAyuJ/OrtpyDTIc+nNhKdnpT9FSf59QQuza3FXaeOulu4oYyPMPF8S1ITrJ17Y
         l0uMzoBKq/muNdYfYrsEoCP5qCA0nxgvZXP5T5lu3loDXMMuJxuJQUULB8dBZ84Im2aQ
         J50JtYlnQIURqXs7wyZ9eiu8a9WFEkV7IFefBhDHLRWH9eTZKmhk08/P3A2Tp60ZYPzO
         U1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757546824; x=1758151624;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z00uyoYaPpbnnyjTQiKQAeAb5AJf67lVttafJphDMJg=;
        b=ulfDj5HClaeOsM7MVEmTw4YWj2bIuX8CrRa40Z/fi3hWFkge2xXMxFJvfaC67QdRyG
         pLYgr6dCwhpkpHV2CphqNQDGX337CvxXicH7mjjmKAzMnQJJi9aVN8hlcxK6v546f+8Z
         YNGRwdXpezyNtAeoglYfxhmNLHLzB99KCeO2fGRKxhXNnrJZSdZsjzVrMkrhEnE4Z8lA
         UYErHlCDj9hd0a/1Cp3NOzMv+iXeEKxT01+PIjfxo8wxZT8HRIAvyqMiPAT29A0fIOUu
         k/B05rmlEqHEVxE0EhFzRr8v+yEIV+SX49Isp4yCy4LrEnSl3nL/u7m0579Q9tl9Y+G5
         hptg==
X-Forwarded-Encrypted: i=1; AJvYcCW025zfIpnZWlcXytisuivtaNW39fOOmAFRbiEzE/VFKaTQuBwc/vKnLzIVpqMM0t5oTeM/u+5CmTw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYeM0h4iDY5BBPByxdejIroQHuRdhYCOxrwUDyj5w5zRW5QpTl
	DGpRAUTd4SamhCNbDQXhpOcuebpqFuKy0xKwix1gQJfvy40tX6X/Tem3
X-Gm-Gg: ASbGncs79QuG2ud8eZgkvftQ1gXPUgjlQekSxUJKnQ5RHqpQzfYRvs6R4nrnD0KUd/q
	qctUhQZsSgBzDH+W6Ir9SSs7C+KT/HhFe9AD0m1gtypb05x+iRHCNnCTzlNFRM8ItJpmaswuezV
	V5g1ZFf3ONYw5pMXJ7g8fx40ZFMDl24aZl2h03CsVl854uwnhvHtszUXj8wv6JEYbcdmFTwCZyh
	qVjXhWAdp6aHXCDbjR/Xx/B9mRnV9budyfvwlP9isw1BThBOzfxjxP7WAxd0mg+KZWj8v8EEZSu
	6UlnN8mKqjgBxog7/q0uPD6t8OTnL69Rjgn99Q2D7newy87MmMR/okmkG8vj2Bhpw+Qk16RYVaG
	/CgJlTf2zpVksaY0U+o8mBxrtrw==
X-Google-Smtp-Source: AGHT+IGSdFMet7QzaqJU44i0rtMUiewSHAuR0CqaJljLhbdxhTDCAcDD4IqcG5WSei/TU75yGs6IqA==
X-Received: by 2002:a05:6a00:8c11:b0:775:fab1:18ba with SMTP id d2e1a72fcca58-775fab11ae4mr3595184b3a.26.1757546824265;
        Wed, 10 Sep 2025 16:27:04 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662d2395sm6288491b3a.88.2025.09.10.16.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 16:27:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C7DC941FA3A1; Thu, 11 Sep 2025 06:27:00 +0700 (WIB)
Date: Thu, 11 Sep 2025 06:27:00 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tejun Heo <tj@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>
Subject: Re: [PATCH 2/2] Documentation: cgroup-v2: Replace manual table of
 contents with contents:: directive
Message-ID: <aMIJRB2-G6zZDZMV@archie.me>
References: <20250910072334.30688-1-bagasdotme@gmail.com>
 <20250910072334.30688-3-bagasdotme@gmail.com>
 <6geggl3iu2hffdop43rtd6yp2ivd26ytfn4xdclurwce6mapal@4ve46y652dbj>
 <875xdqtp7m.fsf@trenco.lwn.net>
 <aMGq5tNNAk5DsJWo@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dLjR6Upv5iA7nyab"
Content-Disposition: inline
In-Reply-To: <aMGq5tNNAk5DsJWo@slm.duckdns.org>


--dLjR6Upv5iA7nyab
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 06:44:22AM -1000, Tejun Heo wrote:
> Hello,
>=20
> On Wed, Sep 10, 2025 at 07:24:45AM -0600, Jonathan Corbet wrote:
> ...
> > I fairly routinely get patches fixing manual TOCs that are not updated
> > to match changes elsewhere.  We have a nice system that can manage the
> > TOC automatically for us, it seems best to me to use it.
> >=20
> > That said, if having the TOC in the plain-text version of the document
> > is deemed to be important, then it needs to be kept and manually
> > maintained.
>=20
> Wouldn't it be better to have some automated script which triggers on
> mismatching TOC so that these get fixed up. I think people (including me)=
 do
> read the plain text version, so it'd be a shame if we lose TOC in the sou=
rce
> file.

In that case, I think we need to standardize these manual toctrees (perhaps
using custom directive?).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dLjR6Upv5iA7nyab
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMIJQAAKCRD2uYlJVVFO
o46MAP95YJS79Vxocx2+Wr21CjPGuK8+il4Kna7PGwSba9gVPQD8DKHHYG83I+XS
vgMpfToA++8RL+VVaRxBn/3LsveIfAg=
=iQTb
-----END PGP SIGNATURE-----

--dLjR6Upv5iA7nyab--
