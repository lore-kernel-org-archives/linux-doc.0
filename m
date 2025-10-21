Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0131E231E
	for <linux-doc@vger.kernel.org>; Tue, 21 Oct 2025 00:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761006989; cv=none; b=rv/dNEYeasukSbtKe7yEuJQd456OrrHmsH5mfTsnUbNJxwtK1wegTtKmlViYe9py+K1q0Zh5ErgZ/6voXwI/PEOqnoYKK7612U2R+ljytFuCk3t9vU6UVX0cy7kfmAKmfh1db24vsnjaXVCk8i+U7TLlRxNLVPoCpgScIEgtIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761006989; c=relaxed/simple;
	bh=EH7CUSPwQHF6nPtGpFzbexRy0S5Tm7bI+w5y98H6ApM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sg5sEseu1bdx7+V7cL9aQuElY3ramX6rVNgk58p0iMWU+vdnRpjJS5oNTIP4WxszzDR2utG5eP2A7MLylR9PCfKLIMwwxyEhqcZN4N98pIAl5J7jphraFwBk10flDorvfMPSWRAZk2kLx4/rH7bwdhjz2Ujg8/uNAi4PIqEznGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/5WYUi6; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/5WYUi6"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-78125ed4052so6138809b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 17:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761006987; x=1761611787; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IRlpjcWAWGjhHfcS9QCWAC71fosOw+vedWLjmJk8iZA=;
        b=K/5WYUi6BDfO8y5ay6BOkBnzjyWfCmhRLHxO4qqEumu57icS/Xfhr/U/GL085qPmXo
         y9yxB23+QJFjILjXWtbv9h/jf0qEwChArdAiev54uI3gIf92nefNQm4dxnGtZ7KluQk0
         ZYw2kXy8wyi9+Y+5qQ3xfZUi1rB2zPHEj3iU/8Awdcm8DX4PH9Ndm63drQaHo8ilriC1
         pUYjLWHPEI/Ewbqd/aD9mEk8pwnDRmGq75sAquFL7Z75V6NTTwXXtZbNlxjjBnK6hM/K
         SmzS68fZmmLKPfA2Ux2apWrwB2NwAj6ITsTSHAUsdb3e90Nx73Wz+DYOmI6o8HQAg48z
         VsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761006987; x=1761611787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IRlpjcWAWGjhHfcS9QCWAC71fosOw+vedWLjmJk8iZA=;
        b=AYaX/V+Gx0fNcwwkKYQTft8dheGwiBMmhtAGC4KZOz2NdR0QkXGil25MhXbzD9C8+n
         ayB6Fq6XByLLgfRTsPaAO9USAsPOl7yhhZYOkRifum1VknU5txKYFxCs+pXY8Eh3DaEV
         3Z04oIrRNa8y/S+PWpYmPziCLCGULIVWQRE+8Ha2qpIZIn+ANTKn25wPY+bzCYrJFMx4
         rBQgqXFoitGhP4nOr/vCMh0gVAK2+a3rk3/l1hJeDTExkguL/chARwZ0YceOES634gH7
         /8XLk3oLjoh27+vOIyx7ulTrqY/YrmmwXZHM+q8h0DeiIMqPAk2b2oNCcpVvJXtwOYh1
         lr0A==
X-Forwarded-Encrypted: i=1; AJvYcCVrMlBO0d33tpLiuLfa3sdB9oXQ3C0nE9jynR2DYNKFKmhhmCuaZRB5bwLqGR9r1hYniy2O/NrAnL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk2zjFbGN1B1de8gouEJhx/SoYk17CvqnS+TXV/KF8CrN2PvLc
	tlXyUecbMY5kzMVn8hDxd5Y6Llo6QdeR5xHv6Ya5d90K3OBCkAGX+FeW
X-Gm-Gg: ASbGncs+gqWmCMJdCto7rOsQvc7FCocnPoGYDuXzI/nMKIaJTC8ZlP7M6Fp8LUhNT89
	AyLfKfTK4ynbqtUyqDQMsHAh/kxy2DjarQXEx33sf3g/x7W6Xizo+AsZjQolrWOagge1OCzBcTO
	15X1q7ojnCm3Fpnc7Z5WQ7POQmZ1EvM4dv1FKZPKCHmTAKFeMb4va1PbbPnPoMTbiPg7hg2V8dC
	1rIkGG3GSgJnIDv+qxyoJuLXxuA4007oS7WlFjCkVfaIqd1qPFrMhEymAawFVjZyjxLMeV375fM
	YMAfFuJnL5mGTFZaubOxO1iyByUxsJocwdXB99k8g9y16M0uergWK1l3s1W2xbbH2YU6Y162Z04
	Og02+fMm4PrAsSRQgSd9u9/RHlZTXAlhCsSJL+NZOlSl2mHJSRh3yLo4tQjW1kd8zcZKHJopSdQ
	DGUYjH5Lh1mWNjXA==
X-Google-Smtp-Source: AGHT+IEMvnZcSxpcwUi2wv1kb+TVT/VkjPcJxEJEJ7ojWOTGJ65Zw8PWswzDzBYCA122UQkqJnkdVg==
X-Received: by 2002:a05:6a00:3d04:b0:77f:3db0:630f with SMTP id d2e1a72fcca58-7a220c2c960mr20730043b3a.28.1761006987485;
        Mon, 20 Oct 2025 17:36:27 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a2300f258dsm9827671b3a.43.2025.10.20.17.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 17:36:26 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id E62D5412B0A6; Tue, 21 Oct 2025 07:36:23 +0700 (WIB)
Date: Tue, 21 Oct 2025 07:36:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org
Cc: linux-hams@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: networking: ax25: update the mailing list
 info.
Message-ID: <aPbVh3F18xVTKa6B@archie.me>
References: <20251020052716.3136773-1-rdunlap@infradead.org>
 <aPbUghAytyXEZAra@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Iu0xxtkt2gcNvAO"
Content-Disposition: inline
In-Reply-To: <aPbUghAytyXEZAra@archie.me>


--/Iu0xxtkt2gcNvAO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 07:32:02AM +0700, Bagas Sanjaya wrote:
> On Sun, Oct 19, 2025 at 10:27:16PM -0700, Randy Dunlap wrote:
> >  There is a mailing list for discussing Linux amateur radio matters
> >  called linux-hams@vger.kernel.org. To subscribe to it, send a message =
to
> > -majordomo@vger.kernel.org with the words "subscribe linux-hams" in the=
 body
> > -of the message, the subject field is ignored.  You don't need to be
> > -subscribed to post but of course that means you might miss an answer.
> > +linux-hams+subscribe@vger.kernel.org or use the web interface at
> > +https://vger.kernel.org. The subject and body of the message are
> > +ignored.  You don't need to be subscribed to post but of course that
> > +means you might miss an answer.
>=20
> vger mailing lists has been moved to subspace infrastructure though (and
> so does subscribing information [1]).
>=20
> [1]: https://subspace.kernel.org/subscribing.html

Oops, I didn't see that the subscribing address stayed the same after
the migration to subspace.

--=20
An old man doll... just what I always wanted! - Clara

--/Iu0xxtkt2gcNvAO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPbVhwAKCRD2uYlJVVFO
o01mAP9s3OU2TdIY6nDzQYLze/hVObQqmEg+lQqq1FfxPE+eHgEA9CSV/S7NKPAb
xtVmU00pQua0uRtIzeATVLhAW8oSAgw=
=Vbi7
-----END PGP SIGNATURE-----

--/Iu0xxtkt2gcNvAO--
