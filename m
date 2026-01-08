Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660D021257E
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 02:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767837992; cv=none; b=uf5yzHn65gIbvnh+MXP7qLiYNJhxA/bft7mZ3QgXehImk1q1Qf4JU16j/1QHJnqK8e0owkkGoN3wxO5BDVUBZoJ6yPFywPlemCtn2hV1wsiZZcq9tNkubY8VEMWyXFpJA5VS4SVyW/IJ9a81itGunCBrEojf6sG+b+BhMRwU6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767837992; c=relaxed/simple;
	bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nu0Zj1Iis6Qwyw/DIxzundLZfH3Z1gTnCPZpc+9zppEAMSA7MHg5A2DrL3EICO0vXXbOQdxoqQRWE3HIMWAHiK5EGyj3HbgMQBRz41zqec9BgFjBd/eI2YuFxkgNFFIu722jfwMqiwTf1DQFDeR96lNWRgXEyAsMmR5SttXi8g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyOEAxPu; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyOEAxPu"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c2f52585fso1871001a91.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 18:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767837988; x=1768442788; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
        b=EyOEAxPu+P1xo/AN3UYaswcs2wnBeKsfjTo9CCRUKXWnBW64YTmEGs7IKLGeygCPLv
         0e2rgjorBFUif6gUgOA64jCwCF4laPmJTrAVJLj5iB7amB/GD7J6mCtY9gxf0xnpM9F+
         Ipsh1wR+bksqwLTy4vbjkIsm0VmdhgHa4kT4eF/eubI+G79oJ7n+7RwwR2EOnrJhymIi
         P/ThYywBpc+kHsS7xbaSgruE6VzqtmYkDH1uqOYCF6ID/bZ5uEZikV6ACnWwVHfPi3Wd
         6zfsOw8UYeG8SjGEajb62HzHvmp5YLv53vZUU+T4zJ3SIqp/N+IUgVA/gNq2vLXIWXiQ
         kH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767837988; x=1768442788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2v2lCPOw1jH2L401Xb6vFxPuNeZejz5XYCd6FEDhu0M=;
        b=XQly7vNhYX5vcJOJxPIN9ojl6uKlZ324X2dVFNtridoqhEkPAxJbc3trMNoLEhe6cH
         eDy+76Nc9KSEoyt1/ccf2N6CrBI+kV64KBPuD8IS+mGik41XWG8NE+qEsYUDMxcZ030z
         Z/NsD5YXFzQISeR2UPf67Xfu0bahKGpxs2nq9LnnYmIoLxZlxgdm7McINVsS4vhbc3Bv
         CndetubSN732T8mO1NbkAY9aM5azq+NTyjFwR51tbwivwqXrxpSXPQ1r4c+ZFgEyI3Mr
         SEdIcfTVZO4ttcaKe4xAn4PvRYnHihqWT7S1+Xep8eOJ+mI3yBnNZLr03A8YN0U4xoXJ
         8bIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/oUOnJCFRpgfahRyt1hgMQyYMNV1X1FiMs6wDD3mhnFFTsaQvKo1dr+7Ou5n2/E8k9Yu91pFmj0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxJ/ZWanDo3o5ypXbXOefiKh8Cp7bRWmZijAzX4EqaqBtok1J/
	lViIna78OBcHISVCPNClTGn3mc86JDw7Ia48sNsr9uvgMTmRWNzJl3MM
X-Gm-Gg: AY/fxX6JF8Q4p8VfHlFc51CvdnsCBWbxRuxqNNpB/009U0Cbu3Dvx8QKQdLCaT83BJu
	/ZBZxA58JVIfwMiVIbJ72hShPUv40M82GZZPkgtza7E5WUrj3kEk5Jlwm4a0Brv19twg0GLrQoF
	+9n7IaDwSlBJjbVDPWAA1H9PaIvg0sqvajcV0Ch6Gs7Ix7cr3M8YyWyNP3rZS/TuulQBQg7rMIM
	jprMDMGEJ2v7b0UF6NIpXq+WM6VVR5cUxFhTyruyyIQq5udEGkInKdb95TuH+g8WPbdm89HU6xI
	f5xkuj7jlIyCQvbQTkz11aF9euBDEh19EqR8a4Oy3pTCA5R6yXQoQeWz8nb1pWOdec7VbXDdv1J
	LAMhgTjHMjiS4Q4ngTSrOogN2IAsVuJ5E/3LG2xRMj8S0VW8lYkJ/wBaYqHt01IyUAbYoqenriN
	ZbtLWovc78rmU=
X-Google-Smtp-Source: AGHT+IEcWA2UfWktZbcCpiIFschO/aHiJi5x2j4q7rHzeCoKFUazByzZ83AOZ3qwppbEh6jaOwNRaw==
X-Received: by 2002:a17:90a:ec8b:b0:34a:4a8d:2e2e with SMTP id 98e67ed59e1d1-34f68c912a3mr4452690a91.17.1767837988343;
        Wed, 07 Jan 2026 18:06:28 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5fa78ebdsm6053921a91.4.2026.01.07.18.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 18:06:27 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3A85B42805C9; Thu, 08 Jan 2026 09:06:24 +0700 (WIB)
Date: Thu, 8 Jan 2026 09:06:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aV8RH7dW3Vlgne3R@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
 <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
 <aV7wTFqQQkGf4efF@archie.me>
 <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEYf5flkWFVx9elk"
Content-Disposition: inline
In-Reply-To: <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>


--qEYf5flkWFVx9elk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 04:21:40PM -0800, Randy Dunlap wrote:
>=20
>=20
> On 1/7/26 3:46 PM, Bagas Sanjaya wrote:
> > On Wed, Jan 07, 2026 at 10:19:32AM -0800, Randy Dunlap wrote:
> >>
> >>
> >> On 1/7/26 5:08 AM, Bagas Sanjaya wrote:
> >>> On Tue, Jan 06, 2026 at 02:58:43PM -0700, Jonathan Corbet wrote:
> >>>> Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >>>>
> >>>>> Hi,
> >>>>>
> >>>>> Building htmldocs on docs-next currenly produces about 50 new warni=
ngs; which
> >>>>> all of them are unexpected section title on DOC: kernel-doc directi=
ve, like:
> >>>>>
> >>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: .=
/drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
> >>>>>
> >>>>> Userspace I/O
> >>>>> ------------- [docutils]
> >>>>> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -fun=
ction 'Userspace I/O' ./drivers/target/target_core_user.c' processing faile=
d with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-a=
pi/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected=
 section title.\n\nUserspace I/O\n-------------')
> >>>>> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: .=
/include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section tit=
le.
> >>>>
> >>>> So I did not, and do not, see any of these errors; are you doing
> >>>> something special to get them?
> >>>
> >>> Nope.
> >>>
> >>> I'm running my htmldocs builds on my Arch Linux system (with Sphinx 9=
=2E0.4 and
> >>> Python 3.13.11).
> >>>
> >>> Full log (tarred up) attached.
> >>>
> >>> Thanks.
> >>
> >> Hi,
> >> What docutils version, please?
> >=20
> > Mine have:
> >=20
> > docutils (Docutils 0.21.2, Python 3.13.11, on linux)
>=20
> I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
> and I don't see these warnings.
> Maybe it's something that has been fixed between 0.21.2 and 0.22.3... ?

I get 100 warnings instead on docutils 0.22.4, unfortunately.

--=20
An old man doll... just what I always wanted! - Clara

--qEYf5flkWFVx9elk
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaV8RGwAKCRD2uYlJVVFO
o7y3AP9vdBXVQUhfBnkUwS2EJyKH40eByIN9TeEHkhxDpAjk6QD/Rcg0HryCxxCi
Pi0yAwe3msr+eCaoGiQ/7pkXxMw0hAo=
=uGxC
-----END PGP SIGNATURE-----

--qEYf5flkWFVx9elk--
