Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E3C398FAC
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 22:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764888544; cv=none; b=pk6ermnZz+rtTXJhquPiZ5+4c4Kf+I8GeOKGVNm1jnpYTuIn/2sJZX6ydaO2kzxZ4E/gFCLpmN/QmaR+pjS5yoDprj+IJufztjK5bxL7oeIxbA+WZutpmXAZB86KsDJMWSAx6/h/jXyhibIRk8kwiqIOLH1tCg08YChEXr1d67s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764888544; c=relaxed/simple;
	bh=PYaDER4kUD8JYoIbl/1d/0CikCuZKnvCluZFc/ZmVFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ngIAtX+NnFeHyNSIzGU0+GiqfNnvYvcE0xXpzMpziS2uGkpU8ZLp4JtPzGx4gslT5qc8SM2UgXzIs+tMXe54winT24aTH47ihZ0gOL+kSX81bAnPh74NpMzNXkgkD/5U4AVGg+By6fp1TmBzxzJt+K1WpEIQrajLbfAJgRa4K/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtgORKoH; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtgORKoH"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297e264528aso14865615ad.2
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 14:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764888542; x=1765493342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVei56FOpuyQ7mQPdGirhT103uEmwv58V22f2NHOUOY=;
        b=OtgORKoHtTQbwtanTau/KOWEpUexPWDknBvR+RaXiqc+BJzuyicTOfyqXf4s4nAjrk
         KcPU+VFEmpwvllr3oLh4HGrdJ8meMFqaslHMbQR6yvU8lylvJeJV+a7y3ku1ZjmTJ/xc
         p5Sr4BDCQmY/v39MBzVuXuwp3+0rxzkSZLZvObMHkjju0iLealIM7A2SAsHgGqfV0btA
         ywH9JGqplJzQ/C0SQtagZyhrjB7wVoWTlFnrGXn/yC8Kz2U3UgI+SusZKfLKmwZU2FKw
         7W9ivDJoffVBVT4NcHZCugS57LBuvvST00J4Vs3wpgJoZIcOcMwbarN+t22gIZdYj5Jd
         9Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764888542; x=1765493342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zVei56FOpuyQ7mQPdGirhT103uEmwv58V22f2NHOUOY=;
        b=aUg9NyRXxvewu/lY2cdOzHqpYWM8MCh+nEIt84ilEk0zLCYvWGXa2/YEAoexvq2EuI
         SkS5u50zVyTP6ETdIltbppsYmHTR/SULK9f4z2ZLft/+c4EuOP8MDujLmoI2isGPvhOz
         hn9zOs1KGP/Z4kNKNbuxA9ujWsF9pdpq1wQon/88dA8BJ3h97ZbJoe7CxdODT64ij2Ex
         Q9NT0kEvhtuZ6ULkO8YKYHvmsAO7h9hAUB0a0lQPH/fIsFfsAduaKRJxKcxONPzBKsCU
         C4pOZHsO0mZ1MDagspENGF1a++x0ZEneGa5A4vWVIpt5gC/x/AaPBmzAxDiUMB+12vdm
         fjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdptTLErzkVlKbZ4xXL6RftzAJSzd0Wo+CINm2UgXd5BF1NgPuR9JQw32Un3Eqt/kGR425Gdx0tNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPRLDlpucWiAAkEa52tbTr5JOIGI1yk39y8UA+WRvCQJS7LR7Y
	Hh5mxHQWLW6k8wdUrvPeNQGedBkk1Q2RJyfOBttRWHaJ82XI9fJesjVQ
X-Gm-Gg: ASbGnctvRwJuh1aAb36oN1N91UWsO1g1Z0fdecKLRAngof/BoML1fkHkelOFhRCSxyb
	/mSOicB1KtiK37Bt3mW2GDX0GkXJGBTw3AJ1oSyED/uR2GmAdONEgsPKPDSOu4fmKROLHc8U2Oi
	Nno75ccQem/GSRSx71YlpUk3cF68aF3BrtT8CucvrpUSy1v/RrvFwXDoFQfJvdkgitHsNGt0y19
	ShNDTC0DNVWkPPcDW8ZUjgd177x6u3orUPxwcER4pJa+UXOaf4eLLAwt8tqZPu5KEa9sx9ZUndX
	Io4zAyhiP/4NNekbUtl7n6W6hDTXu8cTdBDlOMhkCkKZqDOQpMBJ4v9JQPTCUnPS5qC/8DrZre1
	KvQ2qtgQoOUsyR1+/Kc7jjXoRMq6Rv6uVM+zmpyjk+TAJDUbb8ryRqvfo4rsSp34wOP96aAuk9n
	QcLPqy+V++OUPyXphgmK7Yvw==
X-Google-Smtp-Source: AGHT+IFQoGAYZi0lBm/W69LjQ9T1qpJesx8c66GkqhLdefAp9zduT5hbh3AVmgvTLithkjNM323iAg==
X-Received: by 2002:a17:902:f70b:b0:295:2c8e:8e56 with SMTP id d9443c01a7336-29da1ea4cd2mr48041655ad.44.1764888542372;
        Thu, 04 Dec 2025 14:49:02 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaaba21sm29156235ad.70.2025.12.04.14.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 14:49:01 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 3FFE042418BB; Fri, 05 Dec 2025 05:48:58 +0700 (WIB)
Date: Fri, 5 Dec 2025 05:48:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <aTIP2Wqspl-jfm7M@archie.me>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="O04uzPdzolTUHops"
Content-Disposition: inline
In-Reply-To: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>


--O04uzPdzolTUHops
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentati=
on/process/maintainer-pgp-guide.rst
> index b6919bf606c3..2e4da3de25d4 100644
> --- a/Documentation/process/maintainer-pgp-guide.rst
> +++ b/Documentation/process/maintainer-pgp-guide.rst
> @@ -405,8 +405,8 @@ geographical region, and open/proprietary hardware co=
nsiderations.
> =20
>  .. note::
> =20
> -    If you are listed in MAINTAINERS or have an account at kernel.org,
> -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> +    If you are listed in an `M:` entry in MAINTAINERS or have an account=
 at
i.e. being listed as a maintainer?
> +    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of The=
 Linux
>      Foundation.
> =20
>  .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
>=20

The text looks good.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--O04uzPdzolTUHops
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTIP1QAKCRD2uYlJVVFO
o+4WAPkBt8UBsMGFioL71xBpdU15rHOf2x+sCGVvBdHOTukDNwEAxSOzH98bZuVx
fwVTgE+XywqPuZHSSV/FDdAPu7VjnAc=
=h/dI
-----END PGP SIGNATURE-----

--O04uzPdzolTUHops--
