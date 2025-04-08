Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B4D2FB
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 00:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744072442; cv=none; b=UEl7+cc1/ZTsQSTWyrfUNQAR8kjg1144VaUgxFaMHJfMR8zk261ysRo8o5XYlBWrbsWDdFx762A+JMhK5atKi4/r2NQRFzQEuzpTN5azYe4a54n2iOFWLEWbzDZfnVeqeFJWcvJVKFTj4IurtYJ8tT5tg+I8Zb8ZsfrPorrqFrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744072442; c=relaxed/simple;
	bh=NNAMqNZb2GJT+GGlS6N8epL4TW08WSeM2fctT5ad2Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hRPBiXitEubXzQyOX3XE0tqprcoQ3pA5yCqf45RpaCPpcN1+0Kpsu3ILUfBTvP90yLyCsYAgZOFCpUEN8S7gIDtssmtFpyVNHcwZFPvzGHEtre0mJPe0CFf+nlrDd1cS2uMjeuILTAfWmp+LWBZWlRUk3A9bekzUSzN105hXHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bArIR3vn; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bArIR3vn"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af579e46b5dso3203184a12.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Apr 2025 17:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744072440; x=1744677240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dVCW5xO2pSZ6us/GGUSv/D3TkZG3enm3tXUn1OxNLCQ=;
        b=bArIR3vn75e2tt9/Ts+fq2sn4Rs2tPcsWOI0BtjlA1bRJvtGOOyb/NuTDlH58SfyTA
         LusyPke/F5IZy6QngKhxQHqjh62Eyz2jAP3taH/WM6epdMY5lHNn0xNDjibVrYf+7HMG
         svzg4ShUHDuwRQHBgfiVl4o6F669Ka2jYWIJ7Bn4EJEvH3VOICi40hoNVo+cjLvj6V9t
         QzcUePoVvf36tokuDrtoo+TTd7xacTPRY29kiXetOVggUsVjHdPZr+PiJhQ0HiLul2lW
         Fz9afVTFRiC4VElxoUEwRDXhHy3eDeSmjc1Pp2DL79lTYT6fZDTkvS/m14LK0wkpLmNE
         ARjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744072440; x=1744677240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVCW5xO2pSZ6us/GGUSv/D3TkZG3enm3tXUn1OxNLCQ=;
        b=LTDU2RNoAwoqbKmOoN0AL51JSbZzezWOvWlvxX4J2aqhyfubDa/dQZBpNjaXMTD3UR
         kdffMBeFmtCjzISbBPNfkqO7Ddiv2tRnNK80dxDOt3rCVekHWVq2/t6OdZI6sb5RObFx
         Jn+o5qCmNKr7TK9ntz14jGcqzFA1GMzNOI/t2rCdNw6oTu69z6zKtyHkNlPC/MSr6n30
         hiDqpXe6KK4L56pDuO04MRAWdQ3YbsDQWVMgQZWvcuJQ3iKzLGJmj5MWVdEme3LyOSiE
         V4wdzkPc1Db1fxlexuVdSyZPeu1aoqnhTn8R9LkewUgzSs8C8nqeUE+tTlM9/2+tkqoC
         HEAQ==
X-Gm-Message-State: AOJu0YyhjePWXtb0Ldib8ZmIdi1CHPpDbG+GEnvgNz36rDaf9E97K6Ki
	qxUzmY1vgg8NMkLi48uLIZvCg/imc9veBf2sEF+pzYsqcKJ0MN8D
X-Gm-Gg: ASbGncukC71d7fp97s+ZXdLe/KARxL34ofIv/uVugB5/nuK2tFkdEr2PgyZjI9l355e
	1ilm9V1NJ9c+rNwOkN5YmcCwEhAaQi34QtJlisfjBW2/3NHqTsOz4jaWdq2QHbcLPWV2hoOOeH+
	YFi1bbbUU6k+M9nmZtQ5iMoBsZuOK6eU3dYcRLUTSlbx3asd0cgKrW5wtncnvkWfvlE80WM5f8+
	v+wvxXtcvsTua6kfIJ5khRl/mNhatzjV37rB0J80i71iF0oxzhUQjIXoiv5rad2O2o34+QqujHU
	zmApU9F0DnDGTcMm6mSSPyz6tgZ1m08ie9IgyPYYYMIR
X-Google-Smtp-Source: AGHT+IHbPb7jAB6bG5gA+ssW+syN1miIlO3Eol5acTuEOFj3bBYBEl53wvFv+mcNuveMyIkOC8tFxw==
X-Received: by 2002:a17:902:c408:b0:224:ab0:9b00 with SMTP id d9443c01a7336-22a8a873e0dmr184178205ad.27.1744072439496;
        Mon, 07 Apr 2025 17:33:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c2791sm87618245ad.80.2025.04.07.17.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 17:33:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D0A4B420A696; Tue, 08 Apr 2025 07:33:55 +0700 (WIB)
Date: Tue, 8 Apr 2025 07:33:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jelle van der Waa <jvanderw@redhat.com>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, James Addison <jay@jp-hosting.net>
Subject: Re: [PATCH v3 1/1] docs: Disambiguate a pair of rST labels
Message-ID: <Z_Ru84ecc13jE9ZZ@archie.me>
References: <20250407195120.331103-1-jvanderwaa@redhat.com>
 <20250407195120.331103-2-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+RnCner7coqiu3Bm"
Content-Disposition: inline
In-Reply-To: <20250407195120.331103-2-jvanderwaa@redhat.com>


--+RnCner7coqiu3Bm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[fixing Jelle's submission address]

On Mon, Apr 07, 2025 at 09:51:20PM +0200, JellevanderWaa wrote:
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/=
Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index 07cfd8863b46..4a5ffb0996a3 100644
> --- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> +++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> @@ -347,7 +347,7 @@ again.
> =20
>     [:ref:`details<uninstall>`]
> =20
> -.. _submit_improvements:
> +.. _submit_improvements_qbtl:
> =20
>  Did you run into trouble following any of the above steps that is not cl=
eared up
>  by the reference section below? Or do you have ideas how to improve the =
text?
> @@ -1070,7 +1070,7 @@ complicated, and harder to follow.
> =20
>  That being said: this of course is a balancing act. Hence, if you think =
an
>  additional use-case is worth describing, suggest it to the maintainers o=
f this
> -document, as :ref:`described above <submit_improvements>`.
> +document, as :ref:`described above <submit_improvements_qbtl>`.
> =20
> =20
>  ..
> diff --git a/Documentation/admin-guide/verify-bugs-and-bisect-regressions=
=2Erst b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> index 03c55151346c..d8946b084b1e 100644
> --- a/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> +++ b/Documentation/admin-guide/verify-bugs-and-bisect-regressions.rst
> @@ -267,7 +267,7 @@ culprit might be known already. For further details o=
n what actually qualifies
>  as a regression check out Documentation/admin-guide/reporting-regression=
s.rst.
> =20
>  If you run into any problems while following this guide or have ideas ho=
w to
> -improve it, :ref:`please let the kernel developers know <submit_improvem=
ents>`.
> +improve it, :ref:`please let the kernel developers know <submit_improvem=
ents_vbbr>`.
> =20
>  .. _introprep_bissbs:
> =20
> @@ -1055,7 +1055,7 @@ follow these instructions.
> =20
>  [:ref:`details <introoptional_bisref>`]
> =20
> -.. _submit_improvements:
> +.. _submit_improvements_vbbr:
> =20
>  Conclusion
>  ----------

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--+RnCner7coqiu3Bm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ/Ru7QAKCRD2uYlJVVFO
o+rBAP9jd22ZvWs9OU2xVcXeSf7f/XkG4LiqEkrNvO0oWixxHgEAwpVX9RvuEdug
41pXfDitqRFIekf4CehHvVXV2+i/uws=
=Lp+Q
-----END PGP SIGNATURE-----

--+RnCner7coqiu3Bm--
