Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0092FFDD8
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762767392; cv=none; b=HLlWn1Mr/zjoOeZXEaI/Np9vx2pJ33CjBRx9aoMRtpc9ZjTKXuZ65VyQNxCkvSaP30/o1HG2hHg0tz6PiTCDMISUJ8+P7nm7UxLgJqhDhZGKM+on1LsBugSr61LKo75Fo7xliDXuej4IF+aT8wfKVzuSHjh35Bvf65lxrfmhF4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762767392; c=relaxed/simple;
	bh=aEtCKt3fEUhliG7OG87NC5rVJbhrYdGmWYzuJegLKXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSx6nNAhWbBby1ZmqfK3RBWRf0JGWDi9FnTzSJXdLthc6tOGshLg9+XMoSrAh+7w6YPmwv64H/1MmQska2364VhAFqDSl+bY8QlMdtOvgSVGqbUVpheB+AZD6Pm4lemVcZxK1uvIb8MODguWgGoZE6QSVNCUvcpIGZaJlbc38yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAxMBHEs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAxMBHEs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-79af647cef2so2288081b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 01:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762767389; x=1763372189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fnwk2Rq2943TMve0rH97n9BrZ8ODlnbQT+KR5R8OAPM=;
        b=TAxMBHEsAkR/hmy7u5S9s8VlHCcQa68ddZE9uWbBMl6kAHy29VuoNllmcFChyCBI//
         JzXwpcIgT/Bh9wLHOzhKlEE39/YzMvR7dATpznBWcjd+9udmhVjh3k61Gv3YRosSMvrr
         yNTDn4FPJwjBuQ/bAnc0mNlFUrUe3DD+3DvWtw6C1Tmh1UkennW6bUoSijMKeMIOlK8d
         KIdjjQoqoyJ/H/o29mjrD3GXjn7rkbvfB392SIfAmpBXmT6S8sIjzAYKcQeLeeIsOwLm
         G8nTS3mRDRd5KA+KT3S6EJEO6f+y8leyXAGMsa7a5GTuvZbHKmB/lI9NBw3ip8MQ2/gI
         dq9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762767389; x=1763372189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fnwk2Rq2943TMve0rH97n9BrZ8ODlnbQT+KR5R8OAPM=;
        b=IqvMxNf/zFYEwgEcp2MIDqqGFJVSm5J+2/1C2yp5MGT96CqXQ6AvwPoOuM65Ys1/8N
         LpiWkVVAiWV2vlVo0wG+dt8mFM64044uoB2gB79ZwqMSgS60VmHPiQ4KGLdJLYDHS6+M
         UzUzre3h67llFSLiH0eJTFL1A3xe0vrOy/Qd6AjeztD2h3GHA78w+SMiZmo6KzXzHxvG
         n11vBouRV6z9+FnkdcSgCKy9j44KLvgp4PODUWQtaP/vxmRznG5eQsS/1Dh0uDqYaN1L
         maOBDc42MBlbyWrhZfBh6xdTIVTJhg3Aprw9+SONLRE4odkkHHftscExqToZTKBGpPHi
         N1/g==
X-Forwarded-Encrypted: i=1; AJvYcCWm4ZF1i3xx6kn7bcyC15AR89wdPIkILL03lyrC6/as/XkGLsemyZ0MY6pgvA6IIECiS4ETJGDWL2E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc1ZocugWOxDdU8Wqw/kXqgeup9mtH/IIHR87oFYisLz4SaN0s
	Ncye3d/kTgKJQVcOQit1/DIVWjZSpAKli3g0ZZ1075Bdg6AoU8AEUApHQU/6L2dBaCY=
X-Gm-Gg: ASbGnct0KGm/gXYDV6RL0eVLIqod6sacuKaP/E109GVwdYQw9ZvRzrmbo+EYXlzOImA
	rgHsvAL7nu79vZna0vjId3VZgxTsDPi4INwHZXiL8BooeZG7hGtVv/6WdNf3wt06Bd9xJaU/PWl
	0bgIgiFIO1sM4gx/uy6BE8zPi/sfsLUX6/RRUNNK3u03hTgKY1CkrA0R3VJrz4PIUlxwrSe57F2
	7EGr/nICBOPbE2Q8zh3DYxolhDvbL7qYVjfozlNGY/4gKAwLrW5ZcUTnyo67yIK1J2ualRpYwQ+
	/5CwpBVcZ9EH37qxOea6Y1Idc4dlyd/n/+L9/YAGRO/1aQnYuXIx5bwI1bF3ZuS5Pg84jzk9X0j
	//YeTd+bQaRZnjxGTI88cm26KgAqihP+SU3YBzQn32rMBTau9y5gLwIE5nvWngE5iI5XuY4Pdve
	24KWMJtb286Gs=
X-Google-Smtp-Source: AGHT+IGCZ9KPYSYPJcdbC+nRldkLNiCFqKVeuzEly19j3aSotFNmFobmMMDw8xD2hgmu6x5xhMa25g==
X-Received: by 2002:a05:6a00:4f96:b0:781:2290:e7e7 with SMTP id d2e1a72fcca58-7b226b931b0mr10100881b3a.18.1762767389184;
        Mon, 10 Nov 2025 01:36:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0ccc59de7sm11040572b3a.65.2025.11.10.01.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:36:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 83DA04093848; Mon, 10 Nov 2025 16:36:25 +0700 (WIB)
Date: Mon, 10 Nov 2025 16:36:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org,
	chao@kernel.org
Cc: corbet@lwn.net, linux-f2fs-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	akiyks@gmail.com
Subject: Re: [PATCH v2] Documentation: f2fs: wrap tables in literal code
 blocks
Message-ID: <aRGyGTIyUfQGo1kH@archie.me>
References: <20251109095416.2428351-1-nogunix@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cBsjTY+9mfPUQSPu"
Content-Disposition: inline
In-Reply-To: <20251109095416.2428351-1-nogunix@gmail.com>


--cBsjTY+9mfPUQSPu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 09, 2025 at 06:54:16PM +0900, Masaharu Noguchi wrote:
> Sphinx LaTeX builder fails with the following error when it tries to
> turn the ASCII tables in f2fs.rst into nested longtables:
>=20
>   Markup is unsupported in LaTeX:
>   filesystems/f2fs:: longtable does not support nesting a table.
>=20
> Wrap the tables in literal code blocks so that Sphinx renders them as
> verbatim text instead. This prevents the LaTeX builder from attempting
> unsupported table nesting and fixes the pdfdocs build.
>=20
> Akira Yokosawa pointed out that the in-development Sphinx 8.3 latex
> builder already handles these nested tables. I still want to fix the
> current documentation because Sphinx 8.3 is not released yet, and the
> LaTeX build on the stable 8.2.x series (which also requires
> "docutils<0.22" for now) remains broken without this change.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

When Sphinx >=3D8.3 becomes ubiquitous, we can revisit this and revert
it to restore nested tables.

--=20
An old man doll... just what I always wanted! - Clara

--cBsjTY+9mfPUQSPu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRGyFQAKCRD2uYlJVVFO
o700AP0UdeB71I3fmnbrd0SE/LHIiB8IUuvQGw5oxeYWRpNPEgEA9VmAas5jDwnA
PoQ3dc093VqqeniYdAlyivLhxQr2Zg4=
=gAAT
-----END PGP SIGNATURE-----

--cBsjTY+9mfPUQSPu--
