Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BDB3DA7C5
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916272; cv=none; b=SMM99Xe38tIiqeLR63/LU2UyQZ87hLQyJGF1e4tKOOLgBV15S94zTC+kdK7TI9qTmWXqvjeszvF6m+iU5WWNsZY5/isz9oPGaqqxtRbmdGeyuUztGRTXgQ4xdvyYd2iGDcyuCetkySZ4gAugbDTD9aZI4C+0F7lSFOyykyhgrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916272; c=relaxed/simple;
	bh=gTnXdgMDVecZFQ0m9ML2y4y93A7dJ/ojmG/6i+ZUuuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fVMIcPsKHqwYOZcDBRKyx6LqQVCVk4JjzNBYmCPultlhthQZrLfSNAwdXEqQ9XRG8iJhXSJef9LiZpxPoKacM46zk1h2cFWYSrYzuT6mYaKG42/0y0F2lmBYgZns987thOiKK9mAjLjHI6uXD87UYM/RzF4TqQUgud4j4tM8R2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bTi15G0j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bTi15G0j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fbc305914so4398136f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768916268; x=1769521068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gpn+s9YpaeBzBoWidLlFD1oUE21mqMH9dB3U385I3k=;
        b=bTi15G0jeFkVgJ/LdWfGr6gzIfV6uUnsLr6RlZKepRrLSTqgBKC34a28IS1BxM+93L
         HV3Q52zs5y3L6Kywi9/mRKYxNmMHv6JXJtQWC05sF2XGjQgkfIzgqRs2h6zGY2jJLsJf
         XJiWkqhUHsZbevQh5ujE0tCB1wMwVUqExWycEfY9i0RZdKbpIoE7Incn7mbHZPoc78pD
         XDpc7ZwXV+79WG6nkJiUt7Wb7wpY0pBbV6uYRwzFkVYi8KiTNnOz3WwhNDuYFG80CmLy
         EmZ0HsuXB1nES7MezrViY2JCh/QpJy6CfjMh5NhQ44beVqZ0MdCg7+hnt5FWrx/vbz0D
         goeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916268; x=1769521068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Gpn+s9YpaeBzBoWidLlFD1oUE21mqMH9dB3U385I3k=;
        b=Y4NzUUjRaPvSYij9NlogF77KPWUZYcWpDEZvvlQXh5gfuN3RGcltxaoRroUYmWQXS1
         SpBBSD56NRghmb9YUd1629fF7qxDKWpvfze2gTw4rBs/c1dGEnwWUxeRjiRPQivSq4zq
         tnP6fHS8MYVwo6HhRZ462T3vFhggUbo06ls+DlmliWU3ObUkelIdXY55sYt05fZSxDlq
         vKz2Pvyowi+mB/egvCr3y+mu9NnXl5nS/S5VA9b7UjvOdmkZSruEiV+mHC+Ky6trLGFs
         NBefcRLPNCyfpEJ12UVr32wtH/fipb2WXiL8ndAYJ2rTu2sGO7qQ+cGsk6Q2F/dQkgGI
         TVwg==
X-Forwarded-Encrypted: i=1; AJvYcCWp3u3CWYdXkXdX0ufnJ99Xwi/QXQ0geNTL70onBoNaowgyqz8IMcnz1YYFJDUNNO133Qp+5p8DCrA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC5MIiZePRvas0Bhdb1XB/iFtTPEZC8xP9ehzZPx3nY7a0G2X3
	hlVyQFEcTAhhm3JABTaACpSqQq+IIjlHu0Uy7DwHUG+fLXsvpVLXKvY2X48Q38HNfOLQ4SoEpWw
	5G/0O
X-Gm-Gg: AZuq6aJKSOo7vZ1mDOs8zQPAgTMH8Kxz+7ReFhs75P+NBsaCdzA6fHwExQCp9M1SF4K
	qO/tV5lFoMq3s1ciqbzgC7nc3yF8KMnH0acMfRi5bYyfMho61Am3ASc2MBUcfcRMEcBZ3+lYqvg
	wKI0rpnOUm/Ws9L8NbLf7T0IfNjwyqFRw7wCprB/0CLuMeiH9SCwnrzY3wHL9ofVXbYC2J+8vzc
	U9CTmnkItI3SvCSklnI24Fx+icIFdNoXFgXGSIjw6oi+rMH1xy3BZ9nf76sbxny32hwbHNTDe4L
	Yqlcj41WGKd/Q4o15yovyBNiXXa/jit66186cUPKhnpNofsrZEXJ/C+oyuSnLAQ8rAH/3gXt5Dk
	LoSW+yGhuUo9fpcYixhl1pHKyIH+ib/y/liO2NEKILC0HlyPio8ABMw48ChpSTvW1OFAUXuzkD6
	ER+gbstyI9UAwJSc8MAFOjTIYpOAjhhIM=
X-Received: by 2002:a05:6000:3110:b0:430:f72e:c998 with SMTP id ffacd0b85a97d-4358ff302b0mr2976938f8f.51.1768916267928;
        Tue, 20 Jan 2026 05:37:47 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a705sm1296239f8f.14.2026.01.20.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 05:37:47 -0800 (PST)
Date: Tue, 20 Jan 2026 14:37:45 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Tang Yizhou <yizhou.tang@shopee.com>
Cc: tj@kernel.org, corbet@lwn.net, axboe@kernel.dk, hch@lst.de, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Fix blk-iolatency peer throttling description
Message-ID: <guqq2cm3mk5qf45rcman3twiu7vax4sgkrhj23jrjb26tt3sk3@bh2h6s7givfq>
References: <20260114110837.84126-1-yizhou.tang@shopee.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a7wrzm4rterhhl2u"
Content-Disposition: inline
In-Reply-To: <20260114110837.84126-1-yizhou.tang@shopee.com>


--a7wrzm4rterhhl2u
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] docs: Fix blk-iolatency peer throttling description
MIME-Version: 1.0

On Wed, Jan 14, 2026 at 07:08:37PM +0800, Tang Yizhou <yizhou.tang@shopee.c=
om> wrote:
> From: Tang Yizhou <yizhou.tang@shopee.com>
>=20
> The current text states that peers with a lower latency target are
> throttled, which is the opposite of the actual behavior. In fact,
> blk-iolatency throttles peer groups with a higher latency target in order
> to protect the more latency-sensitive group.
>=20
> In addition, peer groups without a configured latency target are also
> throttled, as they are treated as lower priority compared to groups with
> explicit latency requirements.
>=20
> Update the documentation to reflect the correct throttling behavior.
>=20
> Signed-off-by: Tang Yizhou <yizhou.tang@shopee.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

Not a big deal but it could've been confusing.


Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--a7wrzm4rterhhl2u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJEEABYKADkWIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaW+FJBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIACgkQfj0C55Tb+AgjhgEAh55N7s2KF8zIbaLqmKfv
rpGZ2vfoGKPfzLdrAdSMHfwBAJIuTXk022wa5HgcNGfMQmlSFOK1m6XMkaTX+kMG
o+kF
=O7oY
-----END PGP SIGNATURE-----

--a7wrzm4rterhhl2u--
