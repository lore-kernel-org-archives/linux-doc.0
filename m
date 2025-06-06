Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54991DFD9A
	for <linux-doc@vger.kernel.org>; Fri,  6 Jun 2025 17:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749231457; cv=none; b=FrCnZ9xob2OZO6Evgpzf4JBvxSHy1xA1FrM6kgNfZRVJ9SsWJdbzvYf3koyRNklyoLtXuJvt99GiNayV76cb4c/glwVbH+L5bfkg3yci6ndVyzD5AwXwP3JTJpjq79syCLu8ZwUg9VafALTZHAkhSLWqtz7p/pSG951wt0lE+h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749231457; c=relaxed/simple;
	bh=vPIpEDJIxKfhkTcu+dZoQqd7Um5ZG/Wxw0SY+43oEc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mn5jn3iQmZdwvPZL/Zct4L9u4NFdQqAyTsNvgFJ3ZfXQCXr3evYP0nld+U6C4vZFqh5sFSwJyyWjJ2xh5nnsBE8PAGplFz1RsmQZ0/l7CrrIO0hPnDHVWPx5g0aXKsfY3agNjk/FN+zdjV0iL8+zVUWzSA4mUaQ/rOL5HI6cui4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com; spf=pass smtp.mailfrom=manifault.com; dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b=nj9ce7m+; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=manifault.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manifault.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manifault-com.20230601.gappssmtp.com header.i=@manifault-com.20230601.gappssmtp.com header.b="nj9ce7m+"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dd87b83302so10036945ab.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Jun 2025 10:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=manifault-com.20230601.gappssmtp.com; s=20230601; t=1749231454; x=1749836254; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjmgHwU8i86bDRJzXQwmHUhM8F0hM0j8Ly1R4pl+zL0=;
        b=nj9ce7m+LS9kWr33Xbps7GYPrBhf+zKcynj5dwMCfPAR0zjNQcc6m1BNkKACFCbJFd
         ZDMuElTUilOvCqtWdizp4+13QNKoG/VGJBst1IBEabO6HBHOB0++xy5UAVzsah7OHg6L
         HYL6TBWDsbon6Cl2iWF3JP8NWGH/Ac8qGYGctuSSzAFHub9JxHM4C/bldmKGinjhCQHT
         UFrZwc7LwCAuas1o0nh6GL3GLPYaK8e2PeD6C3KjkmBNxDkBw7nrCYS5YyJQFQPpmGFg
         wH0sSiLd/Lk6omwMMsXhYz5oXg/0wAOQpoBzNIKNbW20RLYFhDqOJtjJ+phmG4mHsAL6
         svAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749231454; x=1749836254;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjmgHwU8i86bDRJzXQwmHUhM8F0hM0j8Ly1R4pl+zL0=;
        b=cNgCQNER/kvUlt5kuWP6dhAxaGRz+LPX//Dc+M2OQq5cPGySLEREj+RUkSWWr0ZJFX
         Gx9vJoUMutqumt8UCTtMW008tPDA1g7+5o/7GKJeUSXv9o6ICxjYCUHMxuoPmnLkvZvw
         8bt9nDkHLjJ+40dQSkiAbtiTNb6tQWwwR3LcdOrdSRC8WZDr7nEwhyjhvGwdoYZScrFM
         WHBKJWMfr8imWVw4EM5ParbfpBfVSZu35yKVjD+BcYYa9ieWaegwXvZVk1WFecTLr4er
         KlQhFI/PJKots/aPBoM4KDJDr+r+vzqCwWMPQBRx1XmlCM63LDCmUpDGnngC8fkjOWw6
         KGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoX0jCNJXA6CcyZx6qf11ARKoi4P5iHNw4BQQQ4STOfAdiANCLWmb4keuSalWciU9VxEpw5mmvPCY=@vger.kernel.org
X-Gm-Message-State: AOJu0YycZF5Wn6O68QNiNEW5ljDniEJJKekmOdbRxfJt1zB4Aic0Aw1x
	qppDc3YiA2Vlh1+hFndN2gso7zVhJ/cM7Dixcf7id1zP4YdbNj/cr8aMbdu6ftyHaZOy
X-Gm-Gg: ASbGncsbSN5LxRSinpX0Qk/ya1YAOLH8A4NpjonYJvrz0Q73s4ne/7c9KwV0MEvMwaX
	033h5rNavVM2ximBlb0Ogs+fpmzXHlDwhIMSJs3lS3m/0tGyME5qgzUhJ998fk7jmd3GDxzG5I/
	eYXhbEdtA6tYibK+KXnL2XeL7vJD2wc8a1oryYKYIrdjs2tCvCDncxK0K6FsO2bT9Fn/9sQqHPo
	AaZyRz34epbPi1Q7w/43JtuaF++m438H2MM2EnILFF9UL2d5vzmineb2pe49o8mZCUHMyjXEdMf
	bboey/LOcyv9Q07uW8KkjVVuV/JE9i8iXA/P6fjJlQfew2TOesmPx95VRW3/e0vflOAc4A==
X-Google-Smtp-Source: AGHT+IEWFeYDgHF2aPKD60TtUWh5UCpHGwpxG1vz1cbPOgZ3p661GBvZaintCfTEI5JlxH7z7nAidw==
X-Received: by 2002:a05:6e02:1c0f:b0:3dd:a13c:b663 with SMTP id e9e14a558f8ab-3ddce495e82mr44503905ab.14.1749231453912;
        Fri, 06 Jun 2025 10:37:33 -0700 (PDT)
Received: from localhost (c-76-141-129-107.hsd1.il.comcast.net. [76.141.129.107])
        by smtp.gmail.com with UTF8SMTPSA id 8926c6da1cb9f-500df585606sm529431173.64.2025.06.06.10.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 10:37:33 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:37:32 -0500
From: David Vernet <void@manifault.com>
To: Dave Thaler <dthaler1968@googlemail.com>
Cc: 'Eslam Khafagy' <eslam.medhat1993@gmail.com>, ast@kernel.org, 
	linux-doc@vger.kernel.org, skhan@linuxfoundation.org, bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next] Documentation: Fix spelling mistake.
Message-ID: <nlb4qwgyrx3iyw3tzy2t7f2t5z77k7rskqusfwfnh3aa6vif7x@zcdkq5tjjqt3>
References: <20250606100511.368450-1-eslam.medhat1993@gmail.com>
 <04a101dbd6f6$2635cac0$72a16040$@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="k3ir7k5vvyhxzszp"
Content-Disposition: inline
In-Reply-To: <04a101dbd6f6$2635cac0$72a16040$@gmail.com>
User-Agent: NeoMutt/20250510-dirty


--k3ir7k5vvyhxzszp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH bpf-next] Documentation: Fix spelling mistake.
MIME-Version: 1.0

On Fri, Jun 06, 2025 at 08:17:41AM -0700, Dave Thaler wrote:
> > -----Original Message-----
> > From: Eslam Khafagy <eslam.medhat1993@gmail.com>
> > Sent: Friday, June 6, 2025 3:05 AM
> > To: void@manifault.com; ast@kernel.org
> > Cc: linux-doc@vger.kernel.org; skhan@linuxfoundation.org;
> bpf@vger.kernel.org;
> > Eslam Khafagy <eslam.medhat1993@gmail.com>
> > Subject: [PATCH bpf-next] Documentation: Fix spelling mistake.
> >=20
> > Fix typo "desination =3D> destination"
> > in file
> > Documentation/bpf/standardization/instruction-set.rst
> >=20
> > Signed-off-by: Eslam Khafagy <eslam.medhat1993@gmail.com>

Acked-by: David Vernet <void@manifault.com>

> However the phrase "dividing -1" is one I find confusing.  E.g.,
> "INT_MIN dividing -1" sounds like "-1 / INT_MIN" rather than the inverse.
> Perhaps "divided by" instead of "dividing" assuming the inverse is meant.

+1, probably worth fixing in a follow-on diff

--k3ir7k5vvyhxzszp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRBxU1So5MTLwphjdFZ5LhpZcTzZAUCaEMnXAAKCRBZ5LhpZcTz
ZDuHAQDW8/3XFM2RbdM24rGGM4R9Zkq8guM4rEpeulA7x2GllAEAzHxglTp3OZoS
E4RHfjMtOSFTIjMqhsGUXgg31cZ7gg8=
=p148
-----END PGP SIGNATURE-----

--k3ir7k5vvyhxzszp--
