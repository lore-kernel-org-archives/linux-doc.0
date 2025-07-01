Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CED5B266B5D
	for <linux-doc@vger.kernel.org>; Tue,  1 Jul 2025 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356861; cv=none; b=Sb5zCzT24/1tnI82lhj6NlVp9Iu8fHcz8S+BDgGIc/z7XixAa5dCS5dksxb41DKJVL/RdjF8Gasouuntq+0jylOEI2vB2OKgCWFYyz5uxx13GMvYWotL8v/rdDFQn6GzzGAj1FPXk5RDtMkwGz+pWcprMX8/gSSMV5KaW94YxZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356861; c=relaxed/simple;
	bh=mGcOMYTXcHolXofkzg4axIdhZFPgH1PGHQ+D0OUph78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rR+i4FIkszi4LaXJmKHqCvKVo+timoCHkizPmAaBidIWYjhz233q6LH4W9y49Yf7t6IMVdakS6yks/js1Vo7P9G5xc7wZjny5Ie6D9QJftMjnanqT++yXGDORsJ5+kLZ6EHe8CP0jrxprNUs4vz2D/hFAFN6Sc50D9CH1yQ+meY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yHpEPehx; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yHpEPehx"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso10025728a12.0
        for <linux-doc@vger.kernel.org>; Tue, 01 Jul 2025 01:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751356857; x=1751961657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGcOMYTXcHolXofkzg4axIdhZFPgH1PGHQ+D0OUph78=;
        b=yHpEPehxYGGrFO3AiXxkmSwnJWf1W8ZQr+ArYjwcBjOkjy+9oRboWrNvV1N+B2/ea4
         KOVMKGDKKz+Rh5v8cIk39zAQuWzU+yuYii5KTJJkx4q6EYk+NdtbrHxTD6XSs4OPtGwR
         burSxrlVN+B8nn+f1PcjAwLk2WWELwvHE8wrd4C9QzUUMS2NGvHnI4JOS1PigK/Pe4qN
         9+SyZ3saF6sXAZ8V8gXEzmcolZyE8dIHZreLdxLnsKPFY0fsDQkMbPk4NCvQyjtIXgKq
         qw5/wO9dXZb0YSx3ZaEymJ0f0Z2pwlBbRatqP/xLTZGKNVBabfmqfhHHH2j/AzlFeRaY
         UVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356857; x=1751961657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGcOMYTXcHolXofkzg4axIdhZFPgH1PGHQ+D0OUph78=;
        b=r8rho7OLy4omaDhIlI00Jrm49LtoxywXM/0dIuiUMxSdqLbJc72cKIVms/5fHyWJCp
         rrshe1KfF1uIuQcDv0DZ5pMOsQ27SEpknkRYvRhynMhQzV869PXikN9IsrcsFSUtRC9A
         ELeN/LvOKMoPVJKzkNRotnRcuK2kXDwENBfv6ABNFxHKec/YirCzIWD4tAcgXpvOTTso
         V0fobCOtUjcl1l1/rRDadSj2+DGcpzaiDenshsSGnpLEjkFoWIJbxiA4FMH/BamG8Hjq
         dmzeGgmLUe1mZW2AgpPybrs7fJjrUL9mr5a/CU9Gu/CjJoQstMiLapdzjDK78NkExnuO
         keyA==
X-Forwarded-Encrypted: i=1; AJvYcCXn7QzGuPN1t5wiGBW3CEgSMj568WJ9p6uVMXSn/AtNvwRdm3oykqNEYPsQx+6M6HxPZmyxNNq6tds=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIsNveG2uT1nK9JDqX0/1XRojY0mpq1/UzePcudFOEGVDTUDzp
	6Gqu/2JIULZ1SKzBxg4ocdaVxGKRtaRWTI6xDb4HfjIcGcSRlCfTk4xdqH0qvJTasoQ=
X-Gm-Gg: ASbGncvuUtwE18Ykqw4yx1JifNlnM/QMm1zCQzSdsGxsc5D3HCQhdDyffxVjjRpSoZb
	HZpMqdSvVbpgU4UWBl7li9mWSkmnEMqQqIydLfc2zJcag6BaNC/wp8Y41DgwqLilAYpXp7v1Hfk
	HdFE5qVgeE/W7IaDZ+v7HJA+2CdjV+pKq5mkAi+VsEcmmIyLJNP5jsg0z3f7yA3PQiXzorYDTXU
	+UyD1iAPMs1LEe8Q8X85V+4kaBpBR/PhUupGKtOas12bCePtl13cUYWgCBphl7Enk7mI/fzMrNu
	DUwaFEFawhDcIn0s2berzpnYshf8jufGX74JWz8EUufr8bmCMeK8vZ8cFdmpch1WI3t7Vo1HtCY
	TjkJ9zVkxFZguNldNcaFnVv0mcuVp
X-Google-Smtp-Source: AGHT+IHoseuQMT7L82E1RTcFaZzcxBl/sncW7x0w5KT8BrdeT13LEqZ3NuYBc4NWEr1hlzzeJ6jwYA==
X-Received: by 2002:a05:6402:35d3:b0:608:a7a0:48 with SMTP id 4fb4d7f45d1cf-60c88e7a5d0mr14169020a12.28.1751356856720;
        Tue, 01 Jul 2025 01:00:56 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-60c8319aef5sm7256977a12.48.2025.07.01.01.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:00:55 -0700 (PDT)
Date: Tue, 1 Jul 2025 10:00:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pwm: Adapt Locking paragraph to reality
Message-ID: <askcct3mnuve3ivaghfkmxdzrni2bwoy77ytsfsi7mfketnaoq@cxbiuzacykhs>
References: <20250624100500.1429163-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m3ixujeyfvwblqu5"
Content-Disposition: inline
In-Reply-To: <20250624100500.1429163-2-u.kleine-koenig@baylibre.com>


--m3ixujeyfvwblqu5
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] docs: pwm: Adapt Locking paragraph to reality
MIME-Version: 1.0

Hello,

On Tue, Jun 24, 2025 at 12:05:00PM +0200, Uwe Kleine-K=F6nig wrote:
> We have the distinction between pwm_apply_atomic() and
> pwm_apply_might_sleep() since commit c748a6d77c06 (pwm: Rename
> pwm_apply_state() to pwm_apply_might_sleep()) contained in v6.8-rc1.
>=20
> Locking in the core was introduced in commit 1cc2e1faafb3 ("pwm: Add
> more locking", contained in v6.13-rc1) to serialize per-chip callbacks
> and device removal.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> ---
> I guess there are no objections and so will apply this patch to my pwm
> tree in a week or so if there is no negative feedback.

I did that now. You can find it at
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards
Uwe

--m3ixujeyfvwblqu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjlbIACgkQj4D7WH0S
/k67nQgAgpWqoq4/8KV3fAAkcj7a4wsaXGcaCZyk+QMz7ntMnAi5EuKpQvTGfh6k
iVEtwKlxNmdKEc391k5UGBBRBjHsXmnzMgrHt3q3RON5FcQuElQugyobX9JBVN7v
m1BdY045o5Sg3Qy0yfrIJM0N0b8Ot1u83yJ/Y5bWpivta8CHKkUW8EVL6q+0ESGC
n6IPJS1b23h5aD7GZ4i5720SwuYpeJVlWeWZxktJVpN4m96MNRRVda4gH4j6/bnS
N3kxsddBiCwJWOXPm8/mxV6UGBYFdOx1HKHbf/MoNLsDNbu8uMw7FLUCV0WZijiH
zd243jZ5Q2EUuOm2zsvl6CQ7Y9M8sg==
=4sZk
-----END PGP SIGNATURE-----

--m3ixujeyfvwblqu5--
