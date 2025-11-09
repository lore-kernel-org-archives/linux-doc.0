Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7519D27E
	for <linux-doc@vger.kernel.org>; Sun,  9 Nov 2025 00:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762647289; cv=none; b=K6I5Akva1Rt00w045F454PvxmAOKeC4z0qn6ncfPAA6gYXQNwdpx/xZPOxMh9x7yUyDpWzQnL5Zzg1dOLSV5CEjLfVbkNIlJopagoDTzVZok3l4pVBgxUOV3PSmAOJ09s6OYraYMv6SKnWRDc8R/7O2Kt8U9u02Br0oZPV7hr4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762647289; c=relaxed/simple;
	bh=1FCuGcDK3XvxPrggxT7rwuFXTqjvQpQiDwQgoaP+1J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHCRGUawW5pkHUrI2lO5zHtSzH/bJHrrpY93QSqjfxrW+J4KokO1z6J0ArBauhavlLgMIdHNyYW2IMuh8OEO+pG+fF9CAkXwmon00IN7byy9+Dh3MJL/PUprPx8KSP6DcPxGO0QFjF0jIspX6UNryRtOXcRfykC4h2zvY8RlOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tk7Sevt9; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tk7Sevt9"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b9a5b5b47bfso1028891a12.1
        for <linux-doc@vger.kernel.org>; Sat, 08 Nov 2025 16:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762647287; x=1763252087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qOyZsPuzX58gtWPrYkH/jLPI7MNkAhFexJpLYJoWC4c=;
        b=Tk7Sevt9ovhY2hQen8EE2Ok3xJFhtov56KzFjXL6MlygwJSCrsxPHMiGYBbOkzyKoT
         Sxuc1Yl10I5cbmiddPTIn340HPSxC8JYR9dzZixvQ/U8HvlWfjdP30SEf87ZkcIknz2J
         o2/F1xNdk305onU0LwcvCdoe1UiBulu95aprtoiKT7S7oAK6WRIvdXP1IK5LvNBkj3Mu
         X5NWQtP7tr4qjliZjklYfD7gXkjjq7lzAIpdA3mfN/j96PCiKzCmT3pQJfZ98OZasZGS
         aas8txlqkA8QP0WiubEJ51zD2B+6EwoWydVWOMoyU36C/pKvTMYX5JswH6ENzIu5VwAj
         eUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762647287; x=1763252087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qOyZsPuzX58gtWPrYkH/jLPI7MNkAhFexJpLYJoWC4c=;
        b=LgApHA2XN6AVGnnV/AL9b7qCxeIOkzHnYhzVa3Dd5vFfRcNuVtQwYqjp+R8qsY0mZ/
         ugr3+89xrz8zjeFdNcWgdtKsGXIAE0bfasoIvGxC0vVUjDU63okun7SH2GLc2W4ZxeOS
         NLlvgjZIxcA2I5W2wl26nJTRg0hU+B2TGlvM0XqGrFPqUT7dOqIz9QHjb6LRBe9iUAio
         uwgz5eliGucxI2LdUdXawyGuPkd4Cw2TR+1D9xmi616J03ZxZZ9MXwDoLNHFcJp427bu
         OUyuOpDymmH4IN0wwAkiapBzLfyRGG66/Hq+0pjGZi6vaqkZRdwVa/L6Ze5ZWU8763hd
         BWIQ==
X-Forwarded-Encrypted: i=1; AJvYcCVy5//nIHOVwB3/lPQRgHeu+II3ufdBrPMBg0jCNteZ1fo5GV4uGGxeTjSSU1sUZWRxafgCST3vZIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzknd9aPJxTdUb43EcquDjCIjGZajKYNtIqHcNGcuTyqOvEOn4R
	kGeNrHnT0HvrxefieVw9d7P/unDldKeWYPPECACqJgMgPkFgNxqqs5sz
X-Gm-Gg: ASbGncsGLttAhJZ3POQ/LDLSemG+4lOdya68fogCa6vQ6pXw0cPaOAHWGHmA6sw9+9o
	3Cg1g6Yb4pP+EoaPgGtqXgr/KjCkw/IiQRd91J2FcVgN0/uRRerhJ2NjdNPDGTx7I8hB1Ze4WWn
	AIbzozK2qNIDPuhwpq7ePPYrtIos7UBc/ZMVxrHI3cLE1Z9Suc69UMBOT5Ir0cXMyNdZYBIzIlO
	AGKxBfenvwmMp3LkUuyvzSP3Av6KxrkeQbfHzMuXeT6q1eBLAcvsOAxARBt/MCeijGjzXMpB4w1
	un5oFtdtFWYKhrpwq4uY2zmVqJkgVvGQZJzcaqshZshDXAvAh3JAbfrJctGc9RtXsoDX8jMPguA
	nXbYkIJsnmbi6HcpYD2PmuS3mvwMFg9hyADa4Y8nO/4U3x26OSN6OPpRz2kah/uLRCQEieuXsg0
	A1
X-Google-Smtp-Source: AGHT+IHt4ugnoYmkZJtOdgGe/nXVblQJbMdRzISLr0DnNLkqVwecareOvsSo44fUYCtZKT8sACUBrw==
X-Received: by 2002:a17:902:ce0d:b0:295:9db1:ff41 with SMTP id d9443c01a7336-297e5647238mr47731855ad.21.1762647287029;
        Sat, 08 Nov 2025 16:14:47 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm19440425ad.55.2025.11.08.16.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 16:14:46 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 34938420A6A0; Sun, 09 Nov 2025 07:14:44 +0700 (WIB)
Date: Sun, 9 Nov 2025 07:14:43 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: pierwill <pierwill@gmail.com>, tglx@linutronix.de
Cc: bp@alien8.de, peterz@infradead.org, jpoimboe@kernel.org,
	pawan.kumar.gupta@linux.intel.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	pierwill <pierwill@users.noreply.github.com>
Subject: Re: [PATCH] docs: Fix missing word in spectre.rst
Message-ID: <aQ_c822L9lSTtwl5@archie.me>
References: <20251108192216.28534-1-pierwill@users.noreply.github.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IThEY7CiLhqP6dQ6"
Content-Disposition: inline
In-Reply-To: <20251108192216.28534-1-pierwill@users.noreply.github.com>


--IThEY7CiLhqP6dQ6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 08, 2025 at 01:22:16PM -0600, pierwill wrote:
> Corrects a missing word in the hardware vulnerability docs.
>=20
> Signed-off-by: pierwill <pierwill@users.noreply.github.com>

Please use your real name in the SoB line.

> ---
>  Documentation/admin-guide/hw-vuln/spectre.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/admin-guide/hw-vuln/spectre.rst b/Documentatio=
n/admin-guide/hw-vuln/spectre.rst
> index 991f12adef8d..4bb8549bee82 100644
> --- a/Documentation/admin-guide/hw-vuln/spectre.rst
> +++ b/Documentation/admin-guide/hw-vuln/spectre.rst
> @@ -406,7 +406,7 @@ The possible values in this file are:
> =20
>    - Single threaded indirect branch prediction (STIBP) status for protec=
tion
>      between different hyper threads. This feature can be controlled thro=
ugh
> -    prctl per process, or through kernel command line options. This is x=
86
> +    prctl per process, or through kernel command line options. This is a=
n x86
>      only feature. For more details see below.
> =20
>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

The diff looks OK, though.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IThEY7CiLhqP6dQ6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQ/c8AAKCRD2uYlJVVFO
o0iBAQCmU+NZb0KYYIqdpTu7kYunqTRjcy+KI4Fqp/SVJGwxVgEAtwAdzG0GCz/R
5ipLLTmXNI5IQbzgXgY1R18NayWVcwA=
=5BpY
-----END PGP SIGNATURE-----

--IThEY7CiLhqP6dQ6--
