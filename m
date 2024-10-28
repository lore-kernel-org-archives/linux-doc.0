Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6611E18C90B
	for <linux-doc@vger.kernel.org>; Mon, 28 Oct 2024 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730095904; cv=none; b=uhDKzy9Y1n6BkB7fWgR8sM4kfzwi7gcU1c1BheRccRJHAOVYrnlArJUNBmbCBHU5GwKNJF7qRMJ9A2wvKSPPPQyv6fsiXMGPZAWDZXMrqPqKKccKXtiL8g9zprmI8RDYOU4XoXquHj7IOvsnSUnrwCGLvqt7bKy01sRsHCjT8Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730095904; c=relaxed/simple;
	bh=jbuTbPN2jVKzp69xgs5KjAtQm+Zh5HKjy+T4XhAJERw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0qVuhKzyspT7U/j+USU/D+7PhGDacSpaqOS5tbThL3ASw3MCsdvSLx+3CNP6ZVFvLASlc9rGz3t8J9s5Q9o+LAKZSzrOuGfEh3fPY7v7z18yd36Jr/U+iDWkm/+K6hyAGWwOePAE4fTmK2q8xHE28hupGMH9/n7x4ZG3Pfhswg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5H/rUM4; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5H/rUM4"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so3119497a91.0
        for <linux-doc@vger.kernel.org>; Sun, 27 Oct 2024 23:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730095902; x=1730700702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbuTbPN2jVKzp69xgs5KjAtQm+Zh5HKjy+T4XhAJERw=;
        b=W5H/rUM4nurrPTaXV5tKSO7nGjmwC+XMPFaPlnTQS9kh7FY8X76VdDWKWmMtNRPmUm
         KTTjhZgtLps2gZLK80QpiKXd0ARy1+jDwaZiIOWwO04sYjBZgJeuFBOrnFkOnLSeVrzW
         8oTpFLhVSn6/ZyyM8aIW/t1YXj14Ox0y4E63ODcdNkvGSDHzHwHyRUpEHRHKI4ZKPsrM
         Wj1vf1zB/ixQ7ISr3B7p9TEdfTqaVwYmgCEUDvkHeGPoEpElqXWHxdwZbzG0V7ruahek
         F3tZLXf3UyBi60ytOPpJ8Ge9V44Rb1VXgYeRTTQ8Ati5p+wMUsOwjS0Xjrs11Df4mI4y
         0VGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730095902; x=1730700702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbuTbPN2jVKzp69xgs5KjAtQm+Zh5HKjy+T4XhAJERw=;
        b=cW7iUy3CZ7xFzMb7ttbylgx3/tHdcP/BdvFGxse8rR5VK4os1UyVgFzrqR1gUdlnnV
         7Vt9nMEjqqz1pyPut9DXJprWMw+sGb8aDMihY7KNgvdTjNRetiTdK780NueeF9O6GRnE
         7P7A7L86/DSrcfMk8M4ADt/BvR3f7XnYDgE9dABGreDlP6MpsBRCSnQobvqR9tkC3DeT
         2zy9dYv60oTi7b5JSXPiAka6tZoxGqT+GfMNjmGq9QjX3O0q3GHsq46pUYPaLr7Wz5Eb
         kVqDuGRsrzRP3MK6m6xq0nUmGU9j9yJx7KvTDAJ9P0pS57J7g2T7AP9RV+iYg9oPUDLZ
         ZKKg==
X-Forwarded-Encrypted: i=1; AJvYcCUdtqlGSO0jndz8yY+I0Q0W/VA9Z41q5Fl1W3pkl6YQBC3601WXQW1ErEOM7f+T7qx69/ySHzKS8kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0UrAFYnGfBkfY0SjzME+Bu6wAXl+6mfLbN7VpzZJQiiVYjgyt
	KjcGhCSTI8Wl8K8fcT/Axyq/oW/J9ahJyRJ/sq57I+qYtDCzZMfX
X-Google-Smtp-Source: AGHT+IG3UFg+q/e8fdl3GI/kVoudZOs1rz1KQ3OaB+SGwaxDn06pcGwHTnDQ0u21xR5lV5tr/XuCNw==
X-Received: by 2002:a17:90a:5601:b0:2e2:e743:7501 with SMTP id 98e67ed59e1d1-2e8f0f533e7mr8222044a91.8.1730095901680;
        Sun, 27 Oct 2024 23:11:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e5864e6sm8216108a91.47.2024.10.27.23.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 23:11:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id CE89E4229D6A; Mon, 28 Oct 2024 13:11:38 +0700 (WIB)
Date: Mon, 28 Oct 2024 13:11:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: patches@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: admin: reorganize kernel-parameters intro
Message-ID: <Zx8rGu6Pgy83RLz6@archie.me>
References: <20241028005356.214369-1-rdunlap@infradead.org>
 <Zx8ML4Q6GyGPw-sy@archie.me>
 <8b13719b-522d-48ec-92fe-6c98d651f947@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dHSCKawrK9nG6pkb"
Content-Disposition: inline
In-Reply-To: <8b13719b-522d-48ec-92fe-6c98d651f947@infradead.org>


--dHSCKawrK9nG6pkb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 27, 2024 at 09:27:50PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 10/27/24 8:59 PM, Bagas Sanjaya wrote:
> > On Sun, Oct 27, 2024 at 05:53:56PM -0700, Randy Dunlap wrote:
> >> +This document may not be entirely up to date and comprehensive. The c=
ommand
> >> +"modinfo -p ${modulename}" shows a current list of all parameters of =
a loadable
> >> +module. Loadable modules, after being loaded into the running kernel,=
 also
> >> +reveal their parameters in /sys/module/${modulename}/parameters/. Som=
e of these
> >> +parameters may be changed at runtime by the command
> >> +``echo -n ${value} > /sys/module/${modulename}/parameters/${parm}``.
> >=20
> > How can users get support for parameters not documented here? Post to L=
KML
> > (and hoping that they also Cc: relevant maintainers and mailing list)?
>=20
> That's probably the best option currently.

OK.

>=20
> >> +KMG suffixes
> >> +~~~~~~~~~~~~
> >> +
> >> +The [KMG] suffix is commonly described after a number of kernel
> >> +parameter values. These 'K', 'M', and 'G' letters represent the _bina=
ry_
> >> +multipliers 'Kilo', 'Mega', and 'Giga', equaling 2^10, 2^20, and 2^30
> >> +bytes respectively. Such letter suffixes can also be entirely omitted.
> >> +
> >=20
> > Metric suffixes?
>=20
> Hm, it looks like memparse() supports all of these suffixes: K, M, G, T, =
P, E.
>=20
> So the heading could be Metric suffixes along with some changed text.
>=20

Agreed.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--dHSCKawrK9nG6pkb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZx8rGgAKCRD2uYlJVVFO
oz2YAP98uCC3FPwW3EGkHnpcMof/YVq7xRBuMEbJyKq5avR0sAD/SLsSOVuoTORu
d1HBbAHZnW9Oguk+sac8nimHlSHGPQo=
=TZ/X
-----END PGP SIGNATURE-----

--dHSCKawrK9nG6pkb--
