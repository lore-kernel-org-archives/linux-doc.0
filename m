Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F14A258EC2
	for <linux-doc@vger.kernel.org>; Sat, 21 Mar 2026 01:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774057782; cv=none; b=ZSkV7D3iGdSsT/S+dFvg4t8qWpzH6G71YQ+Qh7ZiIYf9INOKkjY45GYqixoHaYRQ1gEGQEXaMDdVeCKvGK/SayvNF1YJIPEqCrItsH2aKDfxYRxgkaTQaQud+UJh1jLZPimA1scIjC1quFV6xkRCZVQwMh8O9fMEtEjTFn8wX30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774057782; c=relaxed/simple;
	bh=aR4ZsgMA4L/ykHA71t1pfVqrTVdO2ihy0NJtdEerlMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EuyEhm3f2RPSomOHSZPj4WdojqeHju7G3T9TGGRfnXyHvSdbkt2EbGVzfAbCO9/xkd7dR/Q7Ib3CtaDdgtrETq7pFPNELT8RL0MU/2zhu0LPXlunRK3uVV8Suf/uOZmBjmsfmeAzo9F2seq0L00g88M8yvUgRWWZ0RCZNW+7tfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTfUyIle; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTfUyIle"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso1130387a91.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Mar 2026 18:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774057781; x=1774662581; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aR4ZsgMA4L/ykHA71t1pfVqrTVdO2ihy0NJtdEerlMg=;
        b=OTfUyIlekoh0KINdHtgYoNMJjN9cZfuGaOqrJq2eNaoFHcvGtai6tUDBt2okCEX159
         4RvLzDJkN4wSQnjDE5hmi46IoSgxmlc9eDgdZZuBQdriNYCXOdt7uU6Toamd1Zcqn984
         XW54x8dr9jo1AlLQzq5MA0v0ramXY76EKkSAYMqsKbLlKfKpi5gUXUZhTf9a9FKkqF3C
         kxjT+rXQj09CDY6v4OW5c/ILrjmQ01Ckzvh7DYPcqiVh+qsbMu/+dRXzQ18OIKtl8l8g
         0behwFoyVDbQcfB68dJO3KO6c3z+2FvC1ALJbO0cjOn5Dvb9WKJw5biMDoBqpcxiH66d
         QHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774057781; x=1774662581;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aR4ZsgMA4L/ykHA71t1pfVqrTVdO2ihy0NJtdEerlMg=;
        b=Uo6aL9nw+lG1Bc08Oio9PBWtq7ys9GacEu8pB0KB7w/Z1Ou3bYPpS1edop/Qrw9MW+
         GFuDeQhQI4EnrXMS/B2nEwaaBEz167OsudcSrc1530MYrKT6J6Ogo8mINVT4gk2/58a4
         WGJ6oE714lMlmvSDE/f7GeWF66TJse8tqb3yQK0hZaiuitif7LBi/TKZM83Mj3d+pba5
         sGrQU6GuH1kzFfBMBrPcRbGSkixG7l0OYLdGgoeYtDzwmXQTF6oDz/yh7y0yOKHlppfL
         tYaiPuUYbIgH8GLJ/uKSqpl1wEC9D5M/z4/VggXOGbSmrjP5o2fDp1eGsD9EvG2DA566
         +Ysg==
X-Forwarded-Encrypted: i=1; AJvYcCXX0dZr9Ctw/XpdHezxWnYBNxeZ4knCMoiUIWiIviAJei1tX7oHGQk7gxU46MjxSZSzBQmKrv4JAyk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9jNevzENbCG1f8ToamnNKRc8pWwPaW4Yn4GCDN6yJYGFdBCFj
	JEjysAy1U9RzDhP27+ei5fNbKYbaWNepG4ZYQU3bvRznL0eSk7YEdCO0paS+q7vd
X-Gm-Gg: ATEYQzy7vQ4B2a08YfmxmXenAb6arqEjAho7dIxT101Pz+EchoXQXz4IUeJvsWLHuAZ
	593y1Y1Go/16fL76Td6GgHCYmzHzdR8WveO8Jv5+tCkgc1GTwUZNLoiHtwVkeqiLysax4gpNGnd
	0uLK6eygCpSTfDVo4ODjIPzFuQgYz7EkPe0xMNWe0Z3TQlVvgWfxaaSN1+ToaWS0CWKvNe3HKIt
	iNwIRrsa6NT2L+8o1RZ1K+nscruXICvy0qLNVJRZl/+Hb4JQkFC0JUmNa9JS35gwWC7D/cWDurE
	g8NUZL99X7ptt3QTXTQPoruPGnYAX2z7f7hfS6ayq/HbRo1MdfJrhS/Xo+zgZZDnH5itGY25WaU
	iIJ1ZSIxrNdQwzQeWbXja+IUhiKs82QaFDUA5WREpwVd04Kwm6yhGJogLUNQutFgfFGP0k5Ynei
	YvougSEaYIcjaOFg68ERw=
X-Received: by 2002:a17:902:f605:b0:2b0:5990:cf1e with SMTP id d9443c01a7336-2b0827d60cbmr43833305ad.33.1774057780604;
        Fri, 20 Mar 2026 18:49:40 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08369617dsm47607935ad.71.2026.03.20.18.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 18:49:39 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 6A47B42706F1; Sat, 21 Mar 2026 08:49:34 +0700 (WIB)
Date: Sat, 21 Mar 2026 08:49:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Kevin Brodsky <kevin.brodsky@arm.com>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: Invalid link generation for equations
Message-ID: <ab35Lmct8nrRUKSH@archie.me>
References: <9b320e77-9acf-4f0d-8c52-6e1fc3a8cf53@arm.com>
 <abyPiqMmw4BbB6eq@archie.me>
 <07f4d4aa-aed1-451f-a129-d8112094a49a@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IGmgUggNFImv6oRO"
Content-Disposition: inline
In-Reply-To: <07f4d4aa-aed1-451f-a129-d8112094a49a@infradead.org>


--IGmgUggNFImv6oRO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 08:10:42PM -0700, Randy Dunlap wrote:
>=20
>=20
> On 3/19/26 5:06 PM, Bagas Sanjaya wrote:
> > On Wed, Mar 18, 2026 at 01:56:24PM +0100, Kevin Brodsky wrote:
> >> Hi,
> >>
> >> I have noticed that links to equation images are not generated correct=
ly
> >> on docs.kernel.org. For instance, Documentation/mm/memory-model.rst ha=
s:
> >>
> >> =C2=A0 =C2=A0 .. math::
> >> =C2=A0 =C2=A0=C2=A0
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0NR\_MEM\_SECTIONS =3D 2 ^ {(MAX\_PHYSMEM\_B=
ITS - SECTION\_SIZE\_BITS)}
> >=20
> > I think we can just get rid of the math markup, no?
> >=20
>=20
> Why get rid of it?
> and does that assume that some specific package is installed?
>=20
> <snipped>...
>
> OTOH, if you are saying that it's readable when just using ASCII text,
> I'm OK with that also.

I think that's what I mean.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--IGmgUggNFImv6oRO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCab35JQAKCRD2uYlJVVFO
o/upAQDDHDNejbW1bnzJEazdMwAd//4s9AsmVlJY3oCVWdqIQQD/bQXR90tOzyS2
jEnH1o2XrNW0RqSJvO5rerkH6XufHAA=
=+xlv
-----END PGP SIGNATURE-----

--IGmgUggNFImv6oRO--
