Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAAA2882A9
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 22:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765234725; cv=none; b=qi+Lhq8ClCZoanp0TzJpzFw8AeUDJcSfE1cNH2rZtw8SpXgOSD70sFgouCs5+rOipSyI4D9dizHy1YRW1V/0tnyE+9NkBS51IYBzjIxyfirG1cL31Z8/FEo6Sgs1gBKE3/ojjLtQ9D9MQBOcOsAwy1Jm5e3/Rd1bI3RqYlCKnd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765234725; c=relaxed/simple;
	bh=ZLpm3bLxo8h/+7KbdCgVpGcgIiI0bVhD8hJhJBQZg/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=irE9yNQpf3Fc9dg1qwbY5cqWuPisniFuDhPV7Gv9moWQtrymgRyHQ/6oVkc95+JnaBn91yjQcovFuZwLSTHHAM0BBZ7cEHvvNwgwXS7AStlP5kAdlBtGjEG0msCX9xQBWGaK6T6yXbx8ciNbypfhiJv+njRmCAOkSWP7adbH/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ww76yFKj; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww76yFKj"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29555415c5fso57340185ad.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 14:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765234723; x=1765839523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h9VGttTc9sUYPSVm1HO02xtxzY+20mVBf2Ogu8dYkjo=;
        b=Ww76yFKjgEMIl1AVvQPDjCxWRAkN9QH6RJcZ62VSYD0Fcyie0NGp9e9+eAA8fOdQqX
         4XLmU/+YOoBEOHqUp+UKdq3C9pxTzM7GBHDPytmvXwActGz1YgJF6JifidZ9jbPXSE/y
         jrJCJGDVbKQTB+h7hYJuJ/OJkG/lDt2o1gMYf8uT+OsSBUoWEGcoWUWfzfbSLUDSVTms
         5XmA2XQIziqD37+kn/4l7Gdo2hQ0vjZEUg3r2ppC3ubDGFRh0LVfAEnE8UWcHzDa3/mk
         uc9ettUGQ2QMVXfUwttYARWa1KRm0Eqxm3YBM/psvBQY9L8blIj3Tlz7mFXWK5k8VTzg
         tIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765234723; x=1765839523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9VGttTc9sUYPSVm1HO02xtxzY+20mVBf2Ogu8dYkjo=;
        b=IzbZ9ApgHfEaEMZz8hxuoK10SMpOd9JRNTZn7LWdnuFlT+rLcHcWO/0J/fAo0WAIZQ
         b60ovlK2u7Ar4wWDUxKS+gWeVB0KTV3XChuDgOhEQb/MzIVkRYqkTu6aXWMS4naSXaPH
         3GX4bKQkzlmGFQtRKcsFTJ2FzKsK3/yW4NDJbp4kBf2f+3FTmo7TiQ41MPeOmHsYxPd4
         /OIi4ce+MLeshm/1v+WrzXIGTwrEz5y3HPgyfTAqYFth8BM2U2UycEnFrLqrOcgzvFL1
         1R3Eq22PdLEKsmkIfmTRRWjGl1B4LEyKGjdWE5OLt2ZQMHOzQTurefANDn/C7BIckKkw
         E7Ig==
X-Forwarded-Encrypted: i=1; AJvYcCU7kRPD+ugITwkNpfrB80ID6LmU4r4mqW/al6RTH2Q+p+sLzJpiJ4wFbC/G3tg+DuQkP5lPxO+LG+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YydShjiNb6dViZ+dHPT4LBUylwSllonaxsSYQJukGMvMdx/V/o1
	1xgews2ombNd6iTg8K9bz6OqqOGHd2A01WXCNW5i8jN5K7jttSK63BLK
X-Gm-Gg: ASbGncvDpS292lDoaDLxIrKc1ELN6wV23wfrL88ZOfv/CTiVMwnNWDYt6sFXq8IYIce
	Iv5UZz20vrr018WFpf8YHUFlS8nMzOIhDwkEVM/CVeYFjMapbJ2BnXfBHlfzdkANyPWlraF5gNE
	sw0jRDaCG3zSSfDqvvG5Z2pGYl1xNBvpxvuVaW/NjNWTlh9NQVYvUBeiwu32FGNPhXy3K83gD+C
	9q7sythzT1vAcPRM31/z3kgnkjea4hAScOBKV/3jzS9vFGh32dxFiscreOe6B+JppyhWHXXh41f
	w66KFJNsx465XOQFLyqvX+w05opDM+L9X2Pyq+cisPJOwf6bcnV+VFI79uX7FqeDSMm6sKBflPm
	0pzKppNJTHAq15ghFhEVpdkl2+QAEF2owrOB3SYmRfmSNR3KWWaXu2JC79jjdCmuyWRwYron2g8
	GXLX44EirYUhpB1qsSNpCBLQ==
X-Google-Smtp-Source: AGHT+IFbDjFBDoelJqO+thWk4OHKSLjqNfpr9KvpQ1cLwvaDam4UNm9HiseTpN33eXmTa97wcNqSgg==
X-Received: by 2002:a17:903:3d0b:b0:29b:5c65:452b with SMTP id d9443c01a7336-29df5da6e41mr88260115ad.32.1765234723431;
        Mon, 08 Dec 2025 14:58:43 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f011sm136947905ad.59.2025.12.08.14.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 14:58:42 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 941FE421DA23; Tue, 09 Dec 2025 05:58:40 +0700 (WIB)
Date: Tue, 9 Dec 2025 05:58:40 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] Documentation: x86/boot: Fix malformed table in boot.rst
Message-ID: <aTdYIBrBQCbhFXOu@archie.me>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <aTdTRY_7TtGqWvQx@archie.me>
 <874iq0fv1h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/X9vnLdUnc8GW7cY"
Content-Disposition: inline
In-Reply-To: <874iq0fv1h.fsf@trenco.lwn.net>


--/X9vnLdUnc8GW7cY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 03:50:02PM -0700, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > I'd like to instead write the patch description as (more concise):
>=20
> The original was indeed on the verbose side, but please (for the nth
> time) resist the temptation to tell other contributors what to do.
>=20
> > x86 maintainers: please route this patch through x86/urgent branch.
>=20
> Seriously, Bagas?  I think we can figure out how to get this patch
> applied.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--/X9vnLdUnc8GW7cY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTdYFQAKCRD2uYlJVVFO
o/T2AP9zdWowPvc7EEPiFSUJpoVONaSmA0j8cEyuMB0zXmmsNAEAxmmM7qBaWzb4
9kHYjt5U2AmKwFJ8jrboCZpSovyJVQU=
=lzne
-----END PGP SIGNATURE-----

--/X9vnLdUnc8GW7cY--
