Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0EA272E6D
	for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 09:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764407320; cv=none; b=pJq6MpOnvtnjN1vFY2vaYCKhkYyQkTRmExLS0X1owQq5I13Vaw9axesjwRM8SbI02PGIKGgKtWZSjds6q/HsKxnGKeqqQKdAoWv/clArmWyWJ/8SrfoA5GigNn2n9pYoXqdHKL/C/6Xa4l2Bf5fv8cgls0z5a+7cn4fzeRPeDpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764407320; c=relaxed/simple;
	bh=a/2ciAgueyoAzRNtrzfRDyG/Tv7EjC3H0P2A0wcJSrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKUXmAOf/1LmVJfadGSmcDPRbS+brmkjdDqFNc9d30I2445L6P9zbUJ5eeDY27Yq+YFfYyO4qof1soQ8ro6jioySY+tjh6K18x9axCepjnIKPmYRBHC/h3i4N5pV+SOB3Q4pQJjVRSM7u6w9l1voY1MxaR0DZfxfG8h6lQiV+8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ug8u3uGt; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ug8u3uGt"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29586626fbeso33108075ad.0
        for <linux-doc@vger.kernel.org>; Sat, 29 Nov 2025 01:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764407318; x=1765012118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wTcGOlYtSLBPOHy+HMMcIjkntz2loZLnNKt+mbGJXqE=;
        b=Ug8u3uGts3/LmG1zugUqpHhITg+iP8vAAqFAq16vIeVKBlGyX/qNtBNsrEDFuwdIYx
         s2YOOfUtHsoeVaXnv4J7vf4u2VnUnh6iCalt8K/LYvknr8bqn0sp19PUxz0NThsjDP5R
         P8WofgVjWsW6vQ7c1ZPcFK9fSv5rdxhYzvQc8/6e3bktV7Mv7o3Ll4b4BK+xSoFiQHSu
         GPuvjTDqbFeusYB+cRU02OGnM60KmD9POvbHdqUUPWlZ63QFq979uM76XOZXa/D4zwg5
         d07Eo95u36amV7lp8x7k6nta7GLst04myvse5/VXHwWIxfHsm01t60toCYUq3KUuL0Ia
         IC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764407318; x=1765012118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTcGOlYtSLBPOHy+HMMcIjkntz2loZLnNKt+mbGJXqE=;
        b=E8Xk47BpNN80hn/6xHm1i9kiTzNQ2LGe9zJrD4xLuPMkLDSC+kcW4HzG8+QxqU1kfz
         fKbu/zZdFLk/KIP1mYuOo2ZeC6taeTJJjO54zR/IObVlch78VPG1HwUuaJN67OEP/dfG
         Z/wwMf8A2qR3jwTY2vxc9BrJvYRTWpkokyF6EBpKj3S0I90//ZAMkjtIAl6IAkR2IjeC
         hxb9hdhYFL9VZ8FnPynyf5NT0GD7NHJIZkXD2GrVRC6LvAZGXmXnYGZ50otuR6vKyBZd
         nVXjY4AYcW272jwzhkATTx+xdxzleAub9weODpJxH5IsymfbPn55UIdDvpb5PZ0IizeP
         kDJw==
X-Forwarded-Encrypted: i=1; AJvYcCWSawOReunhlSMJzdLfwZGKh6mUPQdzcYx+CbEfOMrnrKGOKPbyb3645eZ3dSd4E8V8/+bD7I8UubQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Bfy6x/EIi41UKvDtLREvV7r37UA+kl8IM19GMqtvYoAdiXdf
	8OqWwKN4o4iWuCzEkba6WPq7zZyf9BEzR7eaqimiJxUMtzvRZ4S2zDOdyh3XfUxx
X-Gm-Gg: ASbGnctkafARQqFnTHUhVRTmrov4c0xwXaSn1MWJyjoRuhgA9pk7Ip/+L9FeZuCYlZV
	lMZdjMQlN/vFhy0SU20g7/IV9VfYHwVMscQCEyay/vBn3h5dq0/Z8JOH1zhD5Q0Evg2vt22OFH7
	uYMj5lFFdFQI0eU7DM8tRXSYnkcUV3yjpFBAEy01skuNBO/vqbZOXw8chjGOvpPYOxhWIkL3If2
	dwvFstVxpdccUfz9KWlZE/aRNV0O1myDMg3nsFcPbiTvdKQb2jwPfAvan+3AquTaydhaje+59M4
	ErbIFOHbUdGJpp2Ve6TGD9G6vfPq9TruOA1cUMkdLAffZBF5Cnu8qG0TV6Rpsv8w9dSTJcuWDtm
	ZI41t0XzGYEBahRi3UrEz3bEv8zolUioskHIUw6hWI//E5wRW61WR2/0808t60VPphFz1M9l/cO
	kddiVOWXL1PxA=
X-Google-Smtp-Source: AGHT+IEGemgHrOPAxrp/K0Hsb/9Fo4xIjYA9/mKSdR0EC0/KlZ95iIdd9wC0J43OTrvDz1XZxbnNuA==
X-Received: by 2002:a17:903:3884:b0:295:6a9:cb62 with SMTP id d9443c01a7336-29b6bf3bd52mr410275695ad.35.1764407317537;
        Sat, 29 Nov 2025 01:08:37 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce416f00sm67404695ad.4.2025.11.29.01.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Nov 2025 01:08:36 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 8A1034650039; Sat, 29 Nov 2025 16:08:30 +0700 (WIB)
Date: Sat, 29 Nov 2025 16:08:30 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Sameeksha Sankpal <sameekshasankpal@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: tools/rtla: remove undefined
 substitutions in common_options.rst
Message-ID: <aSq4DlOflzGFmDCY@archie.me>
References: <20251128151838.7985-1-sameekshasankpal@gmail.com>
 <68a739f3-5484-4846-b87f-94a7ce306e43@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wBDPOlmKClRbCY5b"
Content-Disposition: inline
In-Reply-To: <68a739f3-5484-4846-b87f-94a7ce306e43@infradead.org>


--wBDPOlmKClRbCY5b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 28, 2025 at 01:43:41PM -0800, Randy Dunlap wrote:
> Hi,
>=20
> On 11/28/25 7:18 AM, Sameeksha Sankpal wrote:
> > The RTLA common options documentation uses several Sphinx substitution
> > placeholders (|threshold|, |tool|, |thresharg|, |tracer|, |actionsperf|)
> > that are not defined anywhere in the tree. This causes the htmldocs
> > build to fail with multiple "Undefined substitution" errors.
> >=20
> > Replace these undefined substitutions with plain text or generic
> > placeholders (<tool>, <threshold-option>, <tracer>) to ensure the
> > documentation builds cleanly while preserving the intended meaning of
> > the examples.
> >=20
> > Signed-off-by: Sameeksha Sankpal <sameekshasankpal@gmail.com>
> > ---
> >  Documentation/tools/rtla/common_options.rst | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/Documentation/tools/rtla/common_options.rst b/Documentatio=
n/tools/rtla/common_options.rst
> > index 77ef35d3f831..bd5a6f32f5bf 100644
> > --- a/Documentation/tools/rtla/common_options.rst
> > +++ b/Documentation/tools/rtla/common_options.rst
>=20
> Does this patch apply to the mainline (Linus) kernel?
> This is already fixed in linux-next or docs-next.
> You should usually check -next trees for fixes like this.
>=20
> See:
>=20
> commit 96b546c241b1
> Author: Gopi Krishna Menon <krishnagopi487@gmail.com>
> Date:   Mon Oct 13 16:27:20 2025 +0700
>     Documentation/rtla: rename common_xxx.rst files to common_xxx.txt

The warnings are found on master, though, yet 96b546c241b1 is in docs-next
instead. I guess I can stable-backport it to 6.18 once it is released (in n=
ext
week).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--wBDPOlmKClRbCY5b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSq4CQAKCRD2uYlJVVFO
o+EzAP9o1DhG1OrE9fs8ZcmtnhBATe++s7trZjJ9IuOleyPNWAEApAYGBAnjQcs3
e1aJDdgGsh97IEu4DjXc15uAJjE5Nww=
=hU0G
-----END PGP SIGNATURE-----

--wBDPOlmKClRbCY5b--
