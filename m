Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B91A0728
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 11:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759837643; cv=none; b=GGrhC28biLUuShYfSPQsXU2GaCY24w6YT5UYXodQ2oIxCkv676oU+WkJV+kuVWCjYzNQ3c4eVw/RCZXM0BiTNcBWty37w9tU0vYc2zgT2uej1dw6L507S2dTokPLCw3hz21ciiqmUSArmgYJZqPTt0ug4nxJrSXeElTcpDKkwyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759837643; c=relaxed/simple;
	bh=tHybA+sPs/+b+P0zGrwAATn7fve3huRWbNvhgJc3ask=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h38dIjn/Qi50GKdStCtGxACq2fv4sbFQ8GP6/xxG//MOeIeW7G9YLIgPyevMO7Bx9ebcl5Eb/aBT6iFWfP9dhtD0pWown1EJTeVtVwU+Umw+rmY9+cU1OOvj5gVJdrZ5Hd0OHbAB+QfqDI2zw+WaHE10RJm6x1R9QfwjxJqfIYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FALJvdlw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FALJvdlw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27eed7bdfeeso82429505ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759837639; x=1760442439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpCgxhORN6lEa4s+DNPc1Y/IXSmA220J4nQ7qgIWmeM=;
        b=FALJvdlw0f6fzKMr7jGOs52hp5cx3iDizPSBm+MFhbWxTyGAtKKWoUBJ3vOl+XSlt+
         FLEWhGCrxqFQAMK3Kf5M9njSA29MACI4m6OPcJ8upInIkLMsJd4ZN4VyOpYMpz+rptD8
         ensBm8xczJrCLErPMhVUOXKyGiyrGML1q+8X4uSXJYr3Sl6BWLCf7Z4fL5Nq8bJBGmBD
         vqIK35NOHrPLbf4AldCLcFdVXM1yumgz+y3hyn9mw1985uLxa/45PHAIoe5C7VgV1Ewc
         FExDBn9o/NrdAWpsMktsvupJ6oXCOpwTzhujb2XcxLpyqq4osTiVOkVv1oBdc9AiUkv9
         s6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759837639; x=1760442439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CpCgxhORN6lEa4s+DNPc1Y/IXSmA220J4nQ7qgIWmeM=;
        b=Cmerok+w/4cncfr9oBL3pEtCs7Rk8b2mbGgQ28rX0CN+dcqd/FzKo6tk/bvOUBzI8X
         pH0zNdABmGnpdR4sa0PcqIGg8bE8qqtTKPTuOH9YUTgBR6VGbB9B7U3VYm1MpLa4rvCx
         QRtG2hVlJapq5M7p2gFYbTDF7gHUJmEWP5zmTLRnIBIq+X2C1Nv+Xtv6E0Jo7QK7ZYSL
         7uduhdcGu5JlAN1zebvdYnSue4vC7XJuYw8Si802dgvQZKH4zjB6tU8BETTJ4D1n07Vv
         aOwKFmcBA9ONZgW9R83SEo4f7MwZNKQubdHLdeUPsa5nOHQbPzZMolK1bzZ0SAjt5EOt
         o2Cg==
X-Forwarded-Encrypted: i=1; AJvYcCV0JIRCui8d2LcEMLGA8Nd79u2AvC0iFsEYAjKfuIzyPEtlPLbG7BbCKIKUQ8QKI4RWsjjwhCHw6dw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhWPfeeyTHwjwHlSfm78syCsT+CbXQuvV8m1bc2PpVWhOCl7mG
	Db3AGd9it424gdOCNGe+QNm4P249STNNAET4IovcF+4T7XutL7o48E6z
X-Gm-Gg: ASbGncvuKbdzl8yjzMPyA6AvDiPcV7OBxAXpPTeFDU/IIErEp9cT+1SyzVccDmr8dSS
	hd7wqYrYisTTp8FWqOND8+Nylp2ovA1OchJixLLeqLcMLh1ZBec8v0zgb8BwGl5pwW/NyEYV7Qm
	zPbTo6jBfIYCsKrjacNR6gSrMxnz8CPPjqs0WCQMPJ/XFEKNb/BVj2FUSBy0bPXdtlHz0f+6iJD
	6PhZtc09SsAun12ca6jl4b/7Ny5kihR6x2QPCYHVL63+sS4Oy3deKQX2THrqlRCVp/P5+4tLwEs
	linwYHRz3Yy5EbDi5PmNxNh2RKGvVI++CC55y0gpDVciqb3a0cwePrya15jdkNftA67J8hFjAb5
	0cA1I9ckXEpgWnZ+EFSqMCA3SGDKZZvyDrwDgeMw3L4WMTPCM3A==
X-Google-Smtp-Source: AGHT+IH44vhk9d17Lw4GXZ5yzA6My6EceoSjc9zLI8SRcAEeP+70+Ts8xj+ACG9aEOYyI9bijbzveA==
X-Received: by 2002:a17:902:ce0a:b0:26b:3cb5:a906 with SMTP id d9443c01a7336-28ec9c97565mr36083695ad.16.1759837639170;
        Tue, 07 Oct 2025 04:47:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d12608fsm164155715ad.33.2025.10.07.04.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:47:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 865214233431; Tue, 07 Oct 2025 18:47:15 +0700 (WIB)
Date: Tue, 7 Oct 2025 18:47:14 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] Documentation/rtla: fix htmldocs build error by renaming
 common_options.rst
Message-ID: <aOT9wttB8cQvFDdj@archie.me>
References: <20251007083228.17319-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YjlEHS0UDQisqRua"
Content-Disposition: inline
In-Reply-To: <20251007083228.17319-1-krishnagopi487@gmail.com>


--YjlEHS0UDQisqRua
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 02:02:26PM +0530, Gopi Krishna Menon wrote:
> diff --git a/Documentation/tools/rtla/common_options.rst b/Documentation/=
tools/rtla/common_options.txt
> similarity index 100%
> rename from Documentation/tools/rtla/common_options.rst
> rename to Documentation/tools/rtla/common_options.txt
> diff --git a/Documentation/tools/rtla/rtla-hwnoise.rst b/Documentation/to=
ols/rtla/rtla-hwnoise.rst
> index 3a7163c02ac8..cc2721315552 100644
> --- a/Documentation/tools/rtla/rtla-hwnoise.rst
> +++ b/Documentation/tools/rtla/rtla-hwnoise.rst
> @@ -33,7 +33,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-osnoise-hist.rst b/Documentati=
on/tools/rtla/rtla-osnoise-hist.rst
> index 1fc60ef26106..a11c485f127a 100644
> --- a/Documentation/tools/rtla/rtla-osnoise-hist.rst
> +++ b/Documentation/tools/rtla/rtla-osnoise-hist.rst
> @@ -28,7 +28,7 @@ OPTIONS
> =20
>  .. include:: common_hist_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt

For consistency, though, you may want (in separate patches) also rename
other common_*.rst files.

> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-osnoise-top.rst b/Documentatio=
n/tools/rtla/rtla-osnoise-top.rst
> index b1cbd7bcd4ae..c7bc716b2899 100644
> --- a/Documentation/tools/rtla/rtla-osnoise-top.rst
> +++ b/Documentation/tools/rtla/rtla-osnoise-top.rst
> @@ -30,7 +30,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  EXAMPLE
>  =3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentat=
ion/tools/rtla/rtla-timerlat-hist.rst
> index 4923a362129b..547dfc7ace58 100644
> --- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
> +++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
> @@ -29,7 +29,7 @@ OPTIONS
> =20
>  .. include:: common_hist_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  .. include:: common_timerlat_aa.rst
> =20
> diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentati=
on/tools/rtla/rtla-timerlat-top.rst
> index 50968cdd2095..3740fd386ea8 100644
> --- a/Documentation/tools/rtla/rtla-timerlat-top.rst
> +++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
> @@ -30,7 +30,7 @@ OPTIONS
> =20
>  .. include:: common_top_options.rst
> =20
> -.. include:: common_options.rst
> +.. include:: common_options.txt
> =20
>  .. include:: common_timerlat_aa.rst
> =20

For this patch's scope, LGTM.

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--YjlEHS0UDQisqRua
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOT9uwAKCRD2uYlJVVFO
o26DAPwO4e7EjANEwcmc6zau/qLSOmqV1xhe8ihZQO2SN2a7QgEA2X3LzAtWqe1I
Kid1Ufu3MBRc5B/abDTix3q8NM7L6Q8=
=FDcR
-----END PGP SIGNATURE-----

--YjlEHS0UDQisqRua--
