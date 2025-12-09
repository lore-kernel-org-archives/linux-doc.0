Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF07A188713
	for <linux-doc@vger.kernel.org>; Tue,  9 Dec 2025 23:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765322259; cv=none; b=Pp+Ajem6CJkpUcXuEoUAbDHy4Ck25Cxhq5WawvT5lYhmyukTdc2DRHrQgI7AsilKgauX34YKkQp95QnVeUV7FBMa/BhdKbS1/zrORUEQc5k5LLUtG2Bjq+piLyQ79uqFR179ScjIzo36EMPfW4I2LLlog+jCeDgvrb4BeGmmZtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765322259; c=relaxed/simple;
	bh=wWd6wSwMhOMuipxv36uW00FN/ESfsfiOt8d2sfKRp1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HtdtbXYamonSi8VIbkoL0mEJkRGpJR/VG1MYaplF08GGMk8Oz7Kh17gGM1bsOUhrVm0Fi90TLttyEXL6kPDikmg5t7lN7J3nv1vy96AuGIBAjfFjv8Qkpc2Fq14qASx02bitJTitGIVpg4CS/TNUHYPzmtehInxbriilAe/YgtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD1W+Sh2; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD1W+Sh2"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-34381ec9197so5360802a91.1
        for <linux-doc@vger.kernel.org>; Tue, 09 Dec 2025 15:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765322257; x=1765927057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9drX+cQxeN7s6gqh5PKY7+ebi06ISr5dRrfD4+O53E=;
        b=LD1W+Sh2JVQmuokw+1+nu5M2b1Tdh0/kjfonFGDiARPCgIDFwjB2sc9AzOJBf6s32F
         /Mg0QJ1KSm+yicNYDlgAOzTPCNKVvPq/JzEBSSRJ2EzHIpxWoi4AuBdu7toKHXgbB/kF
         oO4wYnx+DHyB7YjIrQZvXUzxi6gPJUw2Imble+aKkQPe97ATmIzt/clLoVNl1q274MPn
         G6VC6IDpScZuWAVMC3AxE176/aVUoctrglmAr4kgzn/Os7SOaNvVVZW3oI9rHYDe04LX
         f5In6Q+ShytWLhjBt+C9ggRSO+T9sdu76qXOKURg8d8cz9k4zmFkWXogSz+jbrVMx01H
         TLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765322257; x=1765927057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9drX+cQxeN7s6gqh5PKY7+ebi06ISr5dRrfD4+O53E=;
        b=juG4QNnX5HU+lVo0T5FdU7psWcci4fwSCX9F4NKZpq0Thkzsoc94DKKi6A+2gVBdY0
         B2cCGt95cysG7A99S65PPFr5OnrPlZ/BEr4MdIoLM6SQC/VAUpbzRJJ6Hr/VIgTgzIaa
         Y5oB6ouXa7PCw8i88xybQ04S0/2n4AiGJrV2/Potz4Ijg7Hh0NDpTtall8melXuempmk
         aH41rpM32BuRrCrtvTeSgXjIZaw/x2Bm67dFYw1doMvE2S7LPZis+O6mkxcKaha4OkTJ
         oCwepeL4ubEY3QTn37mo8nI2bVPC4vnbhYKwVj7PpQXyzE2diSyYYEyqQtCWeuEhAedE
         LAvA==
X-Forwarded-Encrypted: i=1; AJvYcCUzK5AtLTueQXLK3fQa3dlQOlr1+D+Ya3oMNgZ1QaPraj0CTy2ppodQ609YhNC2ZU3rGryeQKputUI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5uSOfivx79SbDOic5ucdm2kNvtmw7ucBNpimsuBQO4d38pgPi
	vhXKJaZGJMbt87+VU/69Y+TlW1y3PubYpDxnfeWkP10z0Sor9WIssWDS
X-Gm-Gg: AY/fxX6WhYzjy5bvnRKwb2aodcg66bMqtQxstbl6oWjsUErVFJn+AdLHEJ7ab27Kqbg
	qURcaBTtNwPdt05T9Fx6abEE3XdFIMp/HjqgFAW5Gm8ybw826ogbFNBEruGbtxy7TTaT9uquvsU
	0nC3FPurCRGT/yTR/48kTghxQ6ZMts93E5W7O+MSbGJ10RdlCTBcnn8tXXsdDSW90rwl4SVR67Z
	juDgkr7qOnHKI25N/N8gbidAWmyegHAx2iF+hKWkWDvhwbZErwulRj/e9TfdgPmRyf90ePoJKNt
	0T8y7WRfmj+6Gv707d8/A1EKXWzxxmGxo0x+22Sgff/M2d0hpC91XUyDX7ZiPAOyVGLGEJyafs2
	t/CU1bKlfDyOYeU+tHf/mnDO4tuzzBu+48A0orNzcyOsvUpjcQ3rt5Pwfs60s4i+K/9J7grbHkq
	yLfvz2bsLJjYQ=
X-Google-Smtp-Source: AGHT+IHKGYt3C2bg1vfaEXUAh0LaDPX9AX0z5x0OeYSPiW2A4Nbm4zQwOlrSf02DQyS/BrNAlYGfuQ==
X-Received: by 2002:a17:90b:1fc4:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-34a728a7fe5mr324152a91.22.1765322256927;
        Tue, 09 Dec 2025 15:17:36 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c358sm162513695ad.5.2025.12.09.15.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:17:35 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1DFFF4218609; Wed, 10 Dec 2025 06:17:33 +0700 (WIB)
Date: Wed, 10 Dec 2025 06:17:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>
Cc: bp@alien8.de, corbet@lwn.net, dave.hansen@linux.intel.com,
	david.hunter.linux@gmail.com, hpa@zytor.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, skhan@linuxfoundation.org, tglx@linutronix.de,
	x86@kernel.org
Subject: Re: [PATCH v2] Documentation: x86/boot: Fix malformed table in
 boot.rst
Message-ID: <aTiuDARL_NKWcnh8@archie.me>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
 <20251209085330.9124-1-swarajgaikwad1925@gmail.com>
 <aTfjlAKBNeX6my4g@gmail.com>
 <a0a141d8-7e22-45ba-9bc2-74a3f0285cac@infradead.org>
 <438a873c-0ca8-43cf-b705-e224d5c57d05@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="461yd5ESX/+Hbsqd"
Content-Disposition: inline
In-Reply-To: <438a873c-0ca8-43cf-b705-e224d5c57d05@infradead.org>


--461yd5ESX/+Hbsqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 09, 2025 at 01:10:41PM -0800, Randy Dunlap wrote:
> FWIW, I would have done it like this:
>=20
> ---
>  Documentation/arch/x86/boot.rst |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> --- linux-next-20251205.orig/Documentation/arch/x86/boot.rst
> +++ linux-next-20251205/Documentation/arch/x86/boot.rst
> @@ -433,7 +433,7 @@ Protocol:	2.00+
> =20
>    Assigned boot loader IDs:
> =20
> -	=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  	0x0  LILO
>  	     (0x00 reserved for pre-2.00 bootloader)
>  	0x1  Loadlin
> @@ -456,7 +456,7 @@ Protocol:	2.00+
>  	     <http://sebastian-plotz.blogspot.de>
>  	0x12 OVMF UEFI virtualization stack
>  	0x13 barebox
> -	=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +	=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
>    Please contact <hpa@zytor.com> if you need a bootloader ID value assig=
ned.
> =20
>=20

That one looks nicer.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--461yd5ESX/+Hbsqd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTiuCAAKCRD2uYlJVVFO
o60QAP0ekT6S7A1o5Fgb1uR4+n8KePY48+lM+5tTfVRuO6XCfwD6AySTNdH9PDaZ
OhRf6yM/QoCTvSuHVtraYlU629gt1go=
=hNN0
-----END PGP SIGNATURE-----

--461yd5ESX/+Hbsqd--
