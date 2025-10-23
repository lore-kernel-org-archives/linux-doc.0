Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1900301713
	for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 08:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761208997; cv=none; b=OLTN+jBgXFwvE+MCl/Up8KYc5q/DFQhV4ebIbAackPqPEOuyCKoYMvS2PwO4f38LnIc1MUlESaweWQEVbPyZGTasdjn6gl6kkBfCFY1O8ZfljuZw1+NdwYb/nqB6EwtwGNYHyPbBMEG4RPUxY53RgLd7Dx/6qFYfhiXAthQxFYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761208997; c=relaxed/simple;
	bh=h277j0BdJAJJfrnn3LPaDfuaMi5C0Xtj1wAoSJszDQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tJwj5JiQpUujJ7I8wz2Qt5GQBfZwoBk4ZXI2NdK0jNk+6BVPKzvy/qJEfFWtWxbtHH29upumtvB10sN+cSesV+zFdvxqdMe0Cj+n0hX8sF6+F3bp0yu9dwb5dVT11eFZBR/0Vm4ARmRIbhCvUdcqxI5u8HMqRSRmjyTIX2uWSxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AJjFc9O5; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AJjFc9O5"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-781251eec51so450951b3a.3
        for <linux-doc@vger.kernel.org>; Thu, 23 Oct 2025 01:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761208995; x=1761813795; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KqheznwEahoAcIc95fCF8gQr8sHNf2ct8iY0MfSeg6g=;
        b=AJjFc9O5UZLxwUqH5yBwCk4w0whgnAKEYXROjOGZwucwIMD8k04nBxjBxte0aZY8NL
         E1+oAJwO0iYWuzKZ45foqRGzebxOSm5+4M1koj0jxxDntetjG/en0wMr4Ufz5BczRs8t
         5e23RVZPdMjoDm/FW4u53FMltS0HHnImtwB21Hj2GE6B+sU7Ws85iTm7xNSFDRvW9tD/
         AeWa8yRnmsiyNM6ZKl26R59nDcWfllI9i5zYs1driEyPMLkc6SXVi3wuSbnfPI0FG95p
         CRHi9eY+JOWvlHLRgV73oDrvOHgRAPZqNHGigmFUYr5ib72OyLXpgi9NqyLPYDIuDsiV
         T8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208995; x=1761813795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqheznwEahoAcIc95fCF8gQr8sHNf2ct8iY0MfSeg6g=;
        b=p180BDSVRUVLqpcneerVod2kWbJeNUxnBJkjiJTr0LvOYMYQ4auDIWpFaghX8qfkeG
         e79e9oeDDvwYdCqqHQ9yCyU12379apgbw9uqjT8L1VSSwWofEvQMR/5Uuc04f8BA5IJB
         3qfx20v8zX5eCBI7a/pOOEklEl/mS1Jg+t/tC7+XlNoMckoKShbgS4WgAYItn7ef9xIs
         dGnNRrO5akUaEUtmGm9g3kbbd6ug4BSwTxGylDDfCN6W6JARZmBXdfqOy7MYyrXN06mr
         AiYBPaUG9oY8biRtTu0ztcxtkikAA+738MUg93Fif7/nZnHdfAJxlSXKaZ0NxvrdzGWh
         76GA==
X-Forwarded-Encrypted: i=1; AJvYcCXm2TdqocCKiEsBnXxHR1yJimXUVnkpXjB3zwjaRcjlyfvdkC7/6sxqj9uEUwRXbY9uA2tL+qyNZqw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWerSnVxT7qVwx0CHQLpRB9Q7WOaAkwtyQ3rCrLKdGzgV6Jowc
	VvswbRw4IlhWmMEdAKXB8L6XG8dwxcRirSkVoq6iXLOXRUXUHrG5c8GA
X-Gm-Gg: ASbGnctlopaNkIPsOfoLeCayF0PZJgsUpIkRp3KXZAfqFiGXUtCtOqWSOIgfPcI1lgN
	un9z1BB7kw/9WV4RSwf82/fQ4Y1b1fLErGumAoBIfKYKRA2hS0HyeAOaoblE1kBbTm7HBNuphOx
	Cyno1Nr2bxha1I9uLrKNSXSv5FfP72gkxEsE7hvY4jLvxc39Wr4P0LgUYUfqHr5nn7chsv+yo9C
	hZHy+Mp2113aflaSz9pC//1YXtzFny5eTfr0W+UPYhR8Vhe0o2dT+Apt4IVT0XaUuFj8M9eeTqh
	2c7lE0x3MR8KTjN6jy5BupvXYrreRYKU+MczOx+h0wZMsHLX8N6x8GhFddR3EiJvqSWHPihBd8J
	bv86gS1/D+WPkfVa87fOBNSbf9ocQcY+uITxg3AP6Znct6Ss2l4wbt5UH3jSoj2Kk4KDhiuQRkm
	nq+ZOEh6XM4nU=
X-Google-Smtp-Source: AGHT+IHEOgGN5yNyJpbzAdkY2kAXHAbs03hm9RTq1jzAuwC08hoEOkO/K6ScXyZjbWhH2WaZz9e7+g==
X-Received: by 2002:a17:903:1c9:b0:278:9051:8ea9 with SMTP id d9443c01a7336-2946e117e69mr21542875ad.40.1761208994856;
        Thu, 23 Oct 2025 01:43:14 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e21fbbdsm15563255ad.99.2025.10.23.01.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:43:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 94D994206924; Thu, 23 Oct 2025 15:43:11 +0700 (WIB)
Date: Thu, 23 Oct 2025 15:43:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Avery Pennarun <apenwarr@worldvisions.ca>
Subject: Re: [PATCH net-next v2] Documentation: ARCnet: Update obsolete
 contact info
Message-ID: <aPnqn6jDiJkZiUfR@archie.me>
References: <20251023025506.23779-1-bagasdotme@gmail.com>
 <295b96fd-4ece-4e11-be1c-9d92d93b94b7@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sYkyoOFIpjBoikjz"
Content-Disposition: inline
In-Reply-To: <295b96fd-4ece-4e11-be1c-9d92d93b94b7@infradead.org>


--sYkyoOFIpjBoikjz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 22, 2025 at 09:21:43PM -0700, Randy Dunlap wrote:
> I'm wondering about one thing in arcnet-hardware.rst:
>   it refers to www.arcnet.com.
> Did you happen to try that web site?
> Looks like it is something about AIoT.

And it's membership application form, though. (I'm on the err side to not
enter my personal data there.)

> I found the ARCnet Trade Association at
>   www.arcnet.cc

That's ARCNET Resource Center.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--sYkyoOFIpjBoikjz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPnqmgAKCRD2uYlJVVFO
o1d3AQCRe0oF2MekWkvylVGpjC6ok/H13SiWxWu7yovWlHyVCAD/eYNUs9+dyZCa
NX/jHGU7SuQ8ikjpge0Y+EPxhi4V2Ac=
=jNqa
-----END PGP SIGNATURE-----

--sYkyoOFIpjBoikjz--
