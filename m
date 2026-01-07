Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502C5221DB6
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767829586; cv=none; b=gaO4V/wJEgMyqTnNuo/4NZAzO14vh0RdpT/v/uYOmYQZtfwSQiYLSx1e62CU+6PMOebNVVNhLUznq/uJFf2S7vY931/UVDdbgkX2SCLnfvKqgXSSF/J8ZjWaE4e8Oh0V6+VAtaXdbQuAxRJ2ATrzEeLUd2Ec2vjwbHJUCeZXo30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767829586; c=relaxed/simple;
	bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bQMgSvCZ8NGNy4b1z9spBNC4PVKISH2XKyT2AQ1QsnNJjYDeB46MMCWXwscC65yLLsAzO//BEKQkh2Z7DjXQw3U+MszUd3i3nY3ZP24ByVfOgsX9WgV6qWZq3iQY2OHgcFPxVNZAmyLANjTq6jSpgRrqDBe/FIBEVUtg4Yl/VMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddaq+9HZ; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddaq+9HZ"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso2866925b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 15:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767829584; x=1768434384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
        b=ddaq+9HZQZKOVb0M3Z6eQh3VW5cLxQHA3OmOfd9NRrYFdzr1xTDdUSq56+QFu6/Xc0
         axbnoW6ThykfX54L/AhzViuv9NMecf9QfmUgGFzQ5303JTYPaNDHw1OLnbf0QJB3KmRA
         33BqrfyCQKAxvh//0cjuOr/NC46xKdpeF3xfhs2agdpPNUUm4pNmAU2smIWFmXL+2YyU
         CQq1oRRD4Z2BV0pYlzJ/dXC+H77ixGkEvtcVx564n0qaGxXhSkZkwXlAcvZlHmPlIz6K
         UBAIAJWHOn0W1YooXtfG5RCSGMDFXLGZqvWL5hux2d6PB0bgh4jf56Usi2nwdWNXszWd
         m6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767829584; x=1768434384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lkCo2Bcdh2eobJrag13J+RX/0T+fcr6NPLzhfLUZeI=;
        b=wJxfFmn1h0JxtyHG6Ye9o6tRZN9DGvW1/wD7ZRU/4C2B4yZKnvO+Q5W5yC997yg50s
         hSuzjtPGdRAhHEQVazHoVTiaC92Bd8871BiSSWV/ur38cOKY7O3AsLdKI3HSp9vncurY
         f6ag7wLlRWQcV1/a+o3qlpKNlvkfmEKHlMSbUll5dQYWhHV5qCKXa758KDHNCuVTvdOa
         82m1SRRDYv7lDVqxmbEyqtvBHxFoiuK+/esblP7wYSmEImHkTJZqDXIUFFQKYxilYfai
         yw6ttr3yJ0zEDIxybUQR3TPgOW3p8G6Q+4yPCFslbGcvwlAh2aEqbeK1MS2uLDvWJpr+
         Cfkw==
X-Forwarded-Encrypted: i=1; AJvYcCVLwOQYbfoWJ5uz/pbkiLZ+17TOhbpR8RV5l9t8jh5eBFxAIHsYXYUKCa1YLS29Hqbs9Ul/mhSZS24=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf8lmGgK2oYWyS6SRqA2GaB4RyY2Sl1AB3mbknGbv5AIYOFs/y
	B3BpQr5v2EDNRsIp/DaTor4tHDEqR1IL3WHghMwU3+mX4VpbuZt87yYd
X-Gm-Gg: AY/fxX5Lls34fZhz4B3YUbQXIUdUJONz5QCi+e81nA3unRfIwMuNe7MR0eV0LMPLItk
	MjTCVyY0KVCOJyAN6H/HG4ppvChtNLP9SJbTcrGGmvto0gvlkxP4+xIcLygEsObSLsJLoW7/M3w
	ssaVw7VeE5uQlOSK3gOSkxGAZ7+/4djFYzWOyoQNWmybDXOxSCzWDJQmpwfK5ggEUncSmwkG5nL
	0CTBximKYowAnl0am6Ec40oGbm12rE3YaCqkoL/GB181jh1K3Bev1hr/H5x0Dnk/unS2rriRlQY
	HxyOLyib2u68PCvo+g7JMoTYOHXKmy7AV6g2V4922Zak7E5hVsLVznqSpX6p08pRuWkzSHKGjc0
	I8Gw2qB9KitfeqYXhoY/aHvNaiEznwEpO86lJAtWmmTgerodqbcToj9P+Rzp86obhWI+k/N8j8c
	8IQOOyk2roAGQ=
X-Google-Smtp-Source: AGHT+IEuDYmNMp5sGDX6zmUVtDt4gxTdUsbu3GSb//0p0hx6zc8cYvZZp5jNv1GBUYp1AmXY6DK5Bw==
X-Received: by 2002:a05:6a00:12cd:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-81b7f6ec17emr4090626b3a.42.1767829584411;
        Wed, 07 Jan 2026 15:46:24 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bab0da0bsm5782245b3a.13.2026.01.07.15.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:46:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 2948C42805C9; Thu, 08 Jan 2026 06:46:21 +0700 (WIB)
Date: Thu, 8 Jan 2026 06:46:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aV7wTFqQQkGf4efF@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
 <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hv2YtufuJ29ReXgO"
Content-Disposition: inline
In-Reply-To: <966fffa3-a91b-425e-b915-891299832e36@infradead.org>


--Hv2YtufuJ29ReXgO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 10:19:32AM -0800, Randy Dunlap wrote:
>=20
>=20
> On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
> > On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
> >> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >>
> >>> Hi,
> >>>
> >>> Building htmldocs on docs-next currenly produces about 50 new warning=
s; which
> >>> all of them are unexpected section title on DOC: kernel-doc directive=
, like:
> >>>
> >>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./d=
rivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
> >>>
> >>> Userspace I/O
> >>> ------------- [docutils]
> >>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -funct=
ion 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed =
with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api=
/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected s=
ection title.\n\nUserspace I/O\n-------------')
> >>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./i=
nclude/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.
> >>
> >> So I did not, and do not, see any of these errors; are you doing
> >> something special to get them?
> >=20
> > Nope.
> >=20
> > I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9.0=
=2E4 and
> > Python 3.13.11).
> >=20
> > Full log (tarred up) attached.
> >=20
> > Thanks.
>=20
> Hi,
> What docutils version, please?

Mine have:

docutils (Docutils 0.21.2, Python 3.13.11, on linux)

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Hv2YtufuJ29ReXgO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaV7wSAAKCRD2uYlJVVFO
o9t8AQDhw/m4nIujYigOdA2aNi2jne6Vev8KUsOHYlY7yCWDJAEAviAWbCThgrYO
VA0SnKeeFVAPM8V/w7O6kLO2o9OwygU=
=rb4s
-----END PGP SIGNATURE-----

--Hv2YtufuJ29ReXgO--
