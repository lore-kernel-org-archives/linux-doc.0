Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF81F4722
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 11:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733397692; cv=none; b=lKbseoTCnZt5tSwdu3Fvb7QSEE5h54HKXtSpfJqXL50dlSz80L3qcanwWKBZ0OcAAHYPc5y1eChCM8TXUS0WdegBJnGcu484xxFxGqD9v0K9OOOHuGSWsYn117X2M7OeDcm9mPJFBSOKAjiG4msY7prZUFSYZCQx6cEqBLOU0B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733397692; c=relaxed/simple;
	bh=Z+/WwxxwmyKNPAh7G6a+o6WzcNTfEMn97hi7L10J+bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJH2aB577/rPrScSCG+WcY5g3SRncDFkEr8F4qV4PmUFYaBNP2tiw7yaAnJjSaoc3/d1LVeLWGYpXOPb/D98HfC08meeboh18W6CjvLExUvKtEK5WePpv61tH/LBXe71ORrTizCLV0FTJfsoyx/gjB/q9GlWNHoSMH4fWkE2FZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MwiVd77G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MwiVd77G"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so338440f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 03:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733397688; x=1734002488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C7U5yhV/8h616LjmaOHaYn3v4TRRwKNu2+eN/oyCXew=;
        b=MwiVd77GTpmtr5LBNVDCKHygawdzXJY2qUh6ischD1Y7g9/pvFMjPslbZI1m2PmKuV
         JlPHiRdVEZHanh8muaoVYg9Los5smRjwi9Jy3pTOWGLJZXRiS+m4ah5U0yUuYPiLdsSB
         1G+B1KeIkcd1Oo8pBp0JZDhwxY/L4FsJk8UChEf5R3+rvNRE6fn7CNQzLiJ6aybhhFCz
         PMBn/ghyZ6fxzjE0f7X7xCvsS5jADFGHAOpJuhQBt7DwdHKhfSInmOVbQ+lYcGRTxES9
         6VrNstwEBYLZNbDmnzqao1P86SbvEawxeDABGEAVEuDkdIERYlJHGk5uL+PpOvJfUH3p
         v5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397688; x=1734002488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7U5yhV/8h616LjmaOHaYn3v4TRRwKNu2+eN/oyCXew=;
        b=mOE960Rl0ssiRYg/AG9rNXba2DiQJfaOishTQChQWV7jw9dStGilg+4OapHA21EPBH
         YxhCqn1gDZw3QxDfHMmpoPbIpskO1693tAlIxWMLcDcdrcBThx9enB3lMylJDf1tB2Bd
         WpGjG2HrUKtsNk4kqYrx0xdssPSWhd1zBtlxDGkqpWd6JVTA1hu36uCI/1gqFyDpzahc
         MyTUkhytng67lMgNZ9ZIzgQQLyuBiYelf6Rir6tkgWXQYlHqPJnmjwrOSoucV0B+uXTY
         3wtF3OWS0gqxO84OkKPgqiEzroPPX3XCg4YS36RezqARkL7diQ74k04ozzUQQsi8uyy5
         nmfA==
X-Forwarded-Encrypted: i=1; AJvYcCWLu0z9MNZlZOx08qN34fsOHiXM1uuTvBf4TFis/7QSm/QCtAZJAkohz+qh1+itLC8ydjytDYjXlJ4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy76bRbSgWvSDKpSLh60/xDZLmTyqqv8fwAscXod/3AMKzu4WM0
	IxGOxNBoUPFsEqlEugTXpLgILDtYX3le86957nw2+WRWSoidyaKAj79B7FIz7D0=
X-Gm-Gg: ASbGncvwmx0Q0DpdOeeVttoqwgMxQhe+fCK3RfwaD7Mby5TOny/l3oBykSskHw2/yex
	Rdqz15JXECV5JU5EvSrAcxZNiax1+OdACqsrUtl3fmLH9rcnSfTbUhclXsPyJpx9z1alWJgX6o5
	DkMgZHdQjWUWTg4aIennS7x7b6Wk5LHzBkzK6EvzvqkpwdbT0ynCe1dgy0G6B6oFJ0l97a/fY4L
	4Lj6VEsDXz/sKv6QWkUSotdksQVkomE7eXZVJagAalpFc4+LHesC+/CVg3OASMDrqBhH3tT9aOZ
	umBm
X-Google-Smtp-Source: AGHT+IETMe2PLBKyan12WmIjT9Pp7mgNsqBOWO9c5iKtI+qO4i1i+ps8nfGb0dt//dwm/9gZu57i2A==
X-Received: by 2002:a05:6000:1ac7:b0:385:df73:2f3a with SMTP id ffacd0b85a97d-385fd3e7b1dmr8860701f8f.14.1733397687912;
        Thu, 05 Dec 2024 03:21:27 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38621909639sm1729318f8f.72.2024.12.05.03.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:21:27 -0800 (PST)
Date: Thu, 5 Dec 2024 12:21:26 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Maennich <maennich@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] doc: module: DEFAULT_SYMBOL_NAMESPACE must be
 defined before #includes
Message-ID: <td6actwt6wzbutyo6ujv5wmpoieyovtbpqqcmq45twfzhwyca3@hpybcti24ndw>
References: <cover.1733305665.git.ukleinek@kernel.org>
 <3dd7ff6fa0a636de86e091286016be8c90e03631.1733305665.git.ukleinek@kernel.org>
 <Z1Fbrbjx-mNTnV0k@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lnvca2nzg45imhwr"
Content-Disposition: inline
In-Reply-To: <Z1Fbrbjx-mNTnV0k@smile.fi.intel.com>


--lnvca2nzg45imhwr
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] doc: module: DEFAULT_SYMBOL_NAMESPACE must be
 defined before #includes
MIME-Version: 1.0

Hello Andy,

On Thu, Dec 05, 2024 at 09:52:13AM +0200, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 11:01:11AM +0100, Uwe Kleine-K=F6nig wrote:
> > The definition of EXPORT_SYMBOL et al depends on
> > DEFAULT_SYMBOL_NAMESPACE. So DEFAULT_SYMBOL_NAMESPACE must already be
> > available when <linux/export.h> is parsed.
>=20
> > -within the corresponding compilation unit before any EXPORT_SYMBOL mac=
ro is
> > -used.
> > +within the corresponding compilation unit before the #include for
> > +<linux/export.h>.
>=20
> And how do I know where it is included in the current state of affairs wi=
th the
> dependency hell in the kernel?
>=20
> I suggest to reword it to something like "before any global inclusions", =
the
> best probably is to repeat the piece from pr_fmt() / dev_fmt() documentat=
ion
> (if any).

Well, "before <linux/export.h>" is the accurate thing you have to
ensure. "before any global inclusion" is the safe and easy thing to do
to achieve that. Maybe:

	...
	within the corresponding compilation unit before the #include for
	<linux/export.h>. Typically it's placed before the first
	#include.

?

Best regards
Uwe

--lnvca2nzg45imhwr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRjLMACgkQj4D7WH0S
/k7omQf9GWJS+w/6eUGX8w5lUcFNMd4opPGpRx2I2KIu8nWrZ7dX8jYsyjpt7nlM
0WGUvgcmhbeN2klAa0Yr1McFAeAwDtgA+JkTx5afHiynNVsO8YZ58Hh6udTIsj0f
zdYxrPXlGqhU8MFYQZl7r7eNWnfDyNAFWhKRuTu3MaTwvMrG2JpqZK/xyV34YHka
LFkFG5aukOZSI3SqKj+dFeXZfNKiMQi5znyqiKAC02RFUuZjPgNPgG3XSWUK8Z9B
sZX75AoA3ij/xXccc/7hlsc9AkeqCcImj64NnLgE3f1aZInOpf1LPDwAQCBnorm6
d/Ex1FvbjBY9EwzJI8XXItYlqY2yIA==
=gXBw
-----END PGP SIGNATURE-----

--lnvca2nzg45imhwr--
