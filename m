Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10852FDC24
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 07:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268584; cv=none; b=gGBti4rLP3Ol6lq9rpelPLq7PGikfAURwx1C13wepH64Qr9tPEkT1rAyvKHNL8pXQOTnu1vohfUy7jkDRBBhlXkAmzLiCG9LGd1LmPIIlOneDC93eX2WLAJYh7ezgl9wQNsSbyK9vofv/P9EuGrymZb6jFVwkjkKgk0L/9mtPp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268584; c=relaxed/simple;
	bh=7ccBLgFEC7dh2afh+ptzbIu09DTxwapC7nbQtYBNSiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cOlP/sRdQlTc58feCefGcrJfEcRSNTIlSygxx2D14fIyfCzHvomiwJHO9rnU2pwnmznX31oFj8qxKGhkK4ABvYlOk9uu74AECjSybHD+/7t+EllSdjwNb2o+sY+EYGAJHqb1ZtFrLu0OuWiPBgLS183MJ61c08HJbp0tu8F5RPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Urc4/gz0; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Urc4/gz0"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso752519f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 00:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758268579; x=1758873379; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e503uYi31si7FxNgvQI9cCy05i3B7jWTsXXdNcfAPKM=;
        b=Urc4/gz0hdBVhGx0eAXMCBmHb5wyqmmNp/JCi8yehCLuXxKJEJ9UKkz1STtG6TuZqK
         xP0a3JBcmJo4CCSQkBGyRigT34wyemFV+8pogjkxv2vDDA4h6q9Q9/4qNpzdrppCVLYA
         xZtCkBwoWxUJKrCZLKNQLk29Igdg3bXbg/QU2y2be//ubETr6hka4B1VZpFyTpubJu+J
         XxKhynRXHIIw8RCPe+7bytBp2EyniCRMs8orCanejQabobArkYMRxj3SpyFmRWU3w6De
         ZRxi9zf2O8xT407Km3bfUJIw4boOT2w/+uMs4hF8wI8l4N8UR6ytWXS/ow115JnrMGhy
         x6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758268579; x=1758873379;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e503uYi31si7FxNgvQI9cCy05i3B7jWTsXXdNcfAPKM=;
        b=DVzgKoA7Wappj7K7XIyCGAtB3XUj3v8CvaWrAN2F94058jaBT/h3wrPTl6JCQh8Acp
         5pnRRBEaHlEgtAvEG/j7lPBgJ7l3fMaOp0iN5l97wU7qkxVbodg7/uWzL5KuGRg6VF1h
         qKxE3QajgZxy9d5ZynfXBsdcRwOQvtgIbQ20HyqimRsHLKUq8VL7V6k3tErF3LEcyG/E
         57ezmKhC3OzHti98C6r5TFwfoAl6Lh0AFhA0dbRJJ6Zlku2+Qx0fc11YkEAKFllS/3sa
         bxipuf7tolcG0owgBNey0dHh/G3ZUWIX+d3xj4Hz5L6qVl1W+k8hYDL6KYUNOLfQYtMv
         +mHw==
X-Forwarded-Encrypted: i=1; AJvYcCVwwCaOg/Xz0NGgpbPbvGuw4iwY0ti8lPnbjMGWHEdQ4IcauY5svS7pUluNysCND21Ppm1MDvqBks8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxJ1SnGFt+5RTwswg7YFrEG2cgcOAUbcF/l83B7iYYsjijg0uM
	Ksn7uZfrttz/Hp87PpM9+rCMYfuX1t4IEIOmRRgNXscr1oD/jvSBgD5LUXSnhavhlhI=
X-Gm-Gg: ASbGnctdzXbAIcYog/DVLxeiM33kzuDO+CXL37wL25/8Lpr8I8JOyw6w/U/aLV8iaoL
	NPi3glvxjls+7hNCUYgimQyLNpRFho02MQPID8ZW3x5ptwCKKLa1DmSpg+G4KZVlWns85iFDh1N
	hbmruhj9362lVXZ/LLn7XUx5Ruh0Wc4cmfmuyZ1zhvMLlzRRxDfuxFVfu7gQNzyU2Fn1NqrZ4kT
	ZeJlFoa4xRYR8COu9P65nExSgj1ZKtzGMCn2fu9WLmCzbFPi4+o+sGSlMgze3P3HngCmWOZzM6Q
	8EkSS8x0nx2dUToREcx2coCisyeYF7hwJl0ClgZYUJvrZTVCelOgC51Go9z2dkJ3CjqECPSAX4o
	9tKcSYT2hiTldxKDclk0CigAehkU49cIPT9XFZ81tJdI=
X-Google-Smtp-Source: AGHT+IHQdbdvJcdlZ1odGX9276uxFwXiMh4AQ8Ux9QXmXyA3pQnyte0qOr5U4+PiwJeFdw4dbYpkyg==
X-Received: by 2002:a05:6000:2881:b0:3eb:dcf:bfa4 with SMTP id ffacd0b85a97d-3ee868a75b0mr1446794f8f.54.1758268579005;
        Fri, 19 Sep 2025 00:56:19 -0700 (PDT)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbd64dbsm6409147f8f.50.2025.09.19.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:56:18 -0700 (PDT)
Date: Fri, 19 Sep 2025 09:56:17 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, Linux cgroups <cgroups@vger.kernel.org>, 
	Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4] Documentation: cgroup-v2: Sync manual toctree
Message-ID: <irevezhj5fuuc42fwyhnbj7ki2bsxwxiu7z2by2ot4goab32gx@e6a7eyrudwaq>
References: <20250919074347.33465-2-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="id2skixzp2ud7lyu"
Content-Disposition: inline
In-Reply-To: <20250919074347.33465-2-bagasdotme@gmail.com>


--id2skixzp2ud7lyu
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4] Documentation: cgroup-v2: Sync manual toctree
MIME-Version: 1.0

On Fri, Sep 19, 2025 at 02:43:48PM +0700, Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> Manually-arranged toctree comment in cgroup v2 documentation is a rather
> out-of-sync with actual contents: a few sections are missing and/or
> named differently.
>=20
> Sync the toctree.
>=20
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> Changes since v3 [1]:
>=20
>   * Keep the manual toctree and sync it instead (the same approach in v2 =
[2])
>     (Tejun)
>=20
> [1]: https://lore.kernel.org/linux-doc/20250918074048.18563-2-bagasdotme@=
gmail.com/
> [2]: https://lore.kernel.org/linux-doc/20250915081942.25077-5-bagasdotme@=
gmail.com/
>=20
>  Documentation/admin-guide/cgroup-v2.rst | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

Thanks!

--id2skixzp2ud7lyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaM0MnhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgxXgEAwIBmBJj2El9uDu+ScgTj
Hhpx7G+THHfpcIEoUvjKhNgA/2QlaHXdxJyHXYesHnmM+kA/4u73m8acdKfTpCdS
HHwL
=WVGN
-----END PGP SIGNATURE-----

--id2skixzp2ud7lyu--
