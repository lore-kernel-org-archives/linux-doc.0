Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB3A3B3C17
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 05:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785616; cv=none; b=e4/HmNYe0QtKhQ6gI5RMkSH8nWNmm6BofA7Frzl9R4HxvDGLWcGbi0Ru9bDKp/nvdm34dRJdG9ZHFxMJx5GO1D9BwsBrqYM62TrtJqtYLc8GNmQL2+z92SzbZ+3kV33Grk6YmUiHcV5GNmh6HkzYzrJ7wJL1XdR9yXZQZwCFHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785616; c=relaxed/simple;
	bh=79L6IXq0vTYjMqT4xw3+/hBfBny+QPWhqEAYp7hGdIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFeY8WigHUOuT28QPmjfdxF2FcFUGu1UH/oota3nwRJFgJzOTHhTj0rdsCLG7bw5EBAIY+kCa25mQYR3ZbfFUl/H5jMEf14eRq5lVoq2JBGxLLx5YGXJ1ujb5Z7AAImVbgi0rm14Fo3YgMRP5JVLo2kw6j8HdA3QIVGpYAk3lEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSHAGu93; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSHAGu93"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15f47e6297so29593166b.0
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 22:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784785612; x=1785390412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=79L6IXq0vTYjMqT4xw3+/hBfBny+QPWhqEAYp7hGdIw=;
        b=LSHAGu93/WVo/DXg2Em6Z6aBev79mGrKrww1yJ1wyCLMiu1Jm2iVo/3jPYz6qQipET
         rRbtx+iCVBMePVH3dtEwXLT6JyiaofMKzUIpEuFt9Rl4aqTWGCli8uGRAUSRgSDoUSdM
         r5HtU4iK2aXXQEdBzCwhxCpmSyFfVKd1dx0FKaeydu1/8hAHjfoROAQuxRgWUuQpuADu
         ZBc6vV4FF+u33Ubijeu3zeRGpyct9P9jVyhKvFUYoi/dK++NpCVXcAiS1/9Z7mFcS4gY
         1Vep1OKb3dkrtpnmaZxn7dhP6NkSiMXb9FCfl++fpxJeo9tWYQgzQSan2jmrfZjvta/S
         gq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784785612; x=1785390412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79L6IXq0vTYjMqT4xw3+/hBfBny+QPWhqEAYp7hGdIw=;
        b=U7n74LJ7A647+lmGHVXZSFhtqpxQ8RaQ413WJMchycD3W2xm9UTTWD2+Kfk/1F6Qxa
         ar5cjCyh2ByAdmbN9+Tz77liG9t2d5Mmu5dbRyVk1M5s31Xt26MPZr9ry6+4b0Qh07fL
         pQofxKcr2pJUxiam9jb+9reR2VEWMAnj+eGLN8g/f/s1236ZiE/q8ZN+wPNWOubygGnI
         KywGXVY8riCAN7/rOodABdDITF7jnpCBIzjw6jAjxDpKix4yCQWJ6TV9SfXgzA89Qbqh
         5ILsWG4OQuLhVSPPhR440jvfEL3rMdAHxvohB3Fin/ko6ezgntZ7JM5oLqtcZvnKT7Ox
         rEgA==
X-Forwarded-Encrypted: i=1; AHgh+RpKSK7TMuUDfFxNeNWhTAgFM6MYSXz2JBHstYA3GgBMfTP9qpC1KUc02cxtN+AvXiy97Aj6dlUa0ls=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiZLYBkClvT432ciMpMTEG3sehxtgwL7SyI1kVcyfpFP7vfM0s
	cgWsypxMlwIx7DmKeZClRrhBIFTBccjwPfVjowB3BfgxqQ59dT0stbja
X-Gm-Gg: AR+sD11G7kGK8oUxRDp8N/tOb8q1BAVIlIY5QMnV94gdsXWNA2FAUv4/Ymel9FLunym
	9gp4xAok6cUBrwEELmyoNZFGPh5qU2dL6+6Scqob19K7P1CgS7xYjH1NGeZYwE8AVVtM+FrkwsZ
	TEwt53aUfNiRnLwqy51KN8x5GuA6GTUk6dxQRk8Vl6QUpUIhEH/d5aMyo0RSUN+SOsLymFlhUfu
	oAeEzIWq5DeMj8LBy2c+x7G9lU4mi7kDvHFYSRhsYz1LNGvh2dNrV0X34cgAj2M721w/pUle1rW
	pMjh6jTmVCthXfQVT3xpoOKdw5tPsrrBRg2FvFwAuEyl7qas57MpBYPbhwUYxrW+5P4q55+4MIY
	bzh8+hXAi/pQdMdhSVfaoHzFarVbNcsd4R/8/YMo2gPsHml9DgfYBWtTO9pX+EvyEt/j4dyoZqI
	bniccdIduISo3t1HM3x5arEvdq6s4ssESmax+VNCxHMk6kiAtoRg==
X-Received: by 2002:a17:907:3c95:b0:c12:6dbf:4a80 with SMTP id a640c23a62f3a-c1c50b371famr67532966b.63.1784785612184;
        Wed, 22 Jul 2026 22:46:52 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32acb462sm189632866b.25.2026.07.22.22.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:46:50 -0700 (PDT)
Date: Thu, 23 Jul 2026 07:46:48 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Marius Cristea <marius.cristea@microchip.com>,
	Kent Gustavsson <kent@minoris.se>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Janani Sunil <jan.sun97@gmail.com>,
	linux-spi@vger.kernel.org, Kent Gustavsson <nedo80@gmail.com>
Subject: Re: [PATCH v7 4/7] dt-bindings: iio: adc: microchip,mcp3911: Add
 spi-device-addr
Message-ID: <amGqyP7O6Aam12ss@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-4-7781cd74ad75@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UwOsK4L2pA/cHaH4"
Content-Disposition: inline
In-Reply-To: <20260722-ad5529r-driver-v7-4-7781cd74ad75@analog.com>


--UwOsK4L2pA/cHaH4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 09:54:16AM +0200, Janani Sunil wrote:
> Add the generic spi-device-addr property to the binding and deprecate
> the existing vendor specific microchip,device-addr property
>=20
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--UwOsK4L2pA/cHaH4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmphqsMACgkQiIBOb1ld
UjKRYg//TJFiYnH8oi750x23ZsW9YOn+zad9AJo3S7JxvsH+f6WyYi9hRyocEFbb
Ygq+efksJLOjfo1EkUbmhJ32IqK0geY4PFwJXUUqGXd7lNlMBUD3qt0rXpLw4ZW5
uwtVfC4xFfg91IhKC276Py0ccIoT9XkKrL8PKmXw4uc9x84uufYomAfDk72QhYpU
ThptLT+Ucl9D63a71AsmYy4+KuQEFc23hX+WHr36B2PTFg0ylikHOI1yyOi/uoHY
BrvnXnw15J+2q3qkS92iLzhSCGDbwMDpI8p2Jf0ac/id8T2z5R72W7PVQ4UGqCk4
l1scVduCIduHwb2P6CUT6zQar3NlELvjRWwdm3sVeExmSslXNeFYYaGoRZYX3Xtc
lOzbHhcxWZMycYe/UvWkgXWqUXKnQZTx8RfAEkoJxT2q7qZWWpOGhfK3BzKDeWco
0JGQ0ZPiFx7GWmPooul/SbBBlYCAkIudirnpw/GRJsySiHQjHJzhiFWwqipBX4o2
lKR10iAMG/gPPXdrRHrP/M7wRqo7XgwNyeWRIYiTfFnKWQsI4/dC/1JVwdJ1M4Yj
zKBjG6V/rhOCiUJ0FGBD+MwToKAXuUQ7m0MFaSq6+DmhS2VBo/ftqsb7TaDqA0IX
+PPjt18DFq4fdNPoj04NLtGzRBersW2FM5c2LMCJCrOBIDEK8qM=
=/Rc4
-----END PGP SIGNATURE-----

--UwOsK4L2pA/cHaH4--
