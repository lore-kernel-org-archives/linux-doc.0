Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA32315532E
	for <linux-doc@vger.kernel.org>; Sat, 21 Sep 2024 09:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726909898; cv=none; b=sI7JTVbACWOEhxVSFsJ3X7a8v5xraw5JgvH1GlB7MRCpqAZWGTa+CBILoZlg3JnmhZhM3w5nfhbOO55Kk8/kiuGDYEUT4SdBn9gLxTGSk9H4KNkzvR/NdcRqSkkV+WQcWcGAcFMkNtnxfpBAcJbywNXA3G3bLKESGfBXDK9baEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726909898; c=relaxed/simple;
	bh=LpJePFkpOCrmRcm2bsO+S0TBF/81jncGa0BOoDbOWMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dbl7u0GOPdHoxcI3LQws6R+pWgutGa/QdbQE3rijj3FrLdiVuTtV+NYSrpZf3Gp0GqhC03LMV3Be4wTCCdle4vZIRa2uT5OY+BsY8nb9lUJLSKT5r675t7KDpglKLoV8UIzSIiwui8fzuuphyj43XX8UrWwIwNaRn9ZLPcJG8gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XaZKm2dB; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XaZKm2dB"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374ba78f192so1958652f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 21 Sep 2024 02:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1726909894; x=1727514694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=C+92qmWOWTsTas7qxFq00TXpzuJdYrOV4QtxxZMwe1U=;
        b=XaZKm2dBv5HUY4/EEmQCJIUGMHQ4CeVCcMeCBRv/7r4dGPocjvRrDllm+9khqqlfiN
         U1b44TufL6gh+wBAUyt5YA+oyVoaDGogH1kt3EJrS4nZoZ/ew/yFq4roBLEbeeWyJbxT
         pvL763sYKqQ46woOOhQKtdPhFHmA7xlpE9EB8Y2GDCjbxbcn5Fa/Uqnp8EwkTx3KvbvG
         oK2KiQ864VjeXm3XQ55y87bxb7q2uATZFTTI5dJvm33I5b5bkJPGe3g4MGRTERhUfI04
         lTahfcj81KqD8lKZX8+EpW6mTSKesBEVfCvxq+VYrIsh5svyTQDnvXezX7G2zzEnh27U
         bOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726909894; x=1727514694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+92qmWOWTsTas7qxFq00TXpzuJdYrOV4QtxxZMwe1U=;
        b=Dzqmc2S87zG4CNUGpisvWbh9utcs/t6TVj/ri0Z3Bm/cxBcYZH0ztutpCSjCd+0ZU/
         n8awKy+ReqNsa+f2MGKva/+qtHMsZOETSmQKlDn2P2L25fJtnaFQHEwfpefEaTYhlvzm
         HNxgAxhW85ri1YLtpwnRhn+WaRMrcyJxgYIg4Ma+UufwbwaocVU/HUgZiEYouUcz7xoX
         arClCJSwprIx6V45OV3Y0fNVErcWPDMag+loAnjx1Ae1no1VZ6TdzOuJUsSKX1j43hBZ
         tA+2IkxuEQjcqjPT9WFP1JnOvFmkFcisvuNDHL9ARVZqRUW66JlqtfvkzrK5es8+VOWP
         MjYA==
X-Forwarded-Encrypted: i=1; AJvYcCV4TYugn+w97+7hW1fjKEQsrBOyw4q52N77SX6eoaHF4jGos+LibR7ZKJvNWvwMBWNzXrioiB+jCbU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW2J4OOc8aJ3PAYohOFELUA08mBHUV9OhdLC0U/+SgN9Rfd20u
	NS16nHsEzcJ0zFpq/ZND5DJBpTizqKdrpzIIH6+7lqRLelLAdb2YgdPLNZ2ex1o=
X-Google-Smtp-Source: AGHT+IFV5E3ga/jxa4eXGMk8POq04Bbel4E3r0fgnVOV8eR2jCM6IsYm+TrLRuBiPpwnTwd1oYZTXw==
X-Received: by 2002:adf:fcc6:0:b0:374:caf6:ca2f with SMTP id ffacd0b85a97d-37a4318a753mr2912540f8f.45.1726909893833;
        Sat, 21 Sep 2024 02:11:33 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:a0b5:bea5:b768:cc22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78044dfsm19461798f8f.94.2024.09.21.02.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Sep 2024 02:11:33 -0700 (PDT)
Date: Sat, 21 Sep 2024 11:11:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Guillaume Stols <gstols@baylibre.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <mmarek@suse.com>, 
	linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	aardelean@baylibre.com, dlechner@baylibre.com, jstephan@baylibre.com
Subject: Re: [PATCH v2 01/10] dt-bindings: iio: adc: ad7606: Set the correct
 polarity
Message-ID: <7mk56pxpgnlu637xo7yypzfdienyh3doch3l3fkinpqbwihf33@nu7v35gdw5zn>
References: <20240920-ad7606_add_iio_backend_support-v2-0-0e78782ae7d0@baylibre.com>
 <20240920-ad7606_add_iio_backend_support-v2-1-0e78782ae7d0@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fon5yzoippkxiyy4"
Content-Disposition: inline
In-Reply-To: <20240920-ad7606_add_iio_backend_support-v2-1-0e78782ae7d0@baylibre.com>


--fon5yzoippkxiyy4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guillaume,

On Fri, Sep 20, 2024 at 05:33:21PM +0000, Guillaume Stols wrote:
> According to the datasheet, "Data is clocked in from SDI on the falling
> edge of SCLK, while data is clocked out on DOUTA on the rising edge of
> SCLK".
> Also, even if not stated textually in the datasheet, it is made clear on
> the diagrams that sclk idles at high.
>=20
> So the documentation is erroneously stating that spi-cpha is required, and
> the example is erroneously setting both spi-cpol and spi-cpha.

I would expect that the communication with the chip is at least
unreliable if not outright broken with the wrong polarity. So maybe add
something like:

	On $MyMachine dropping the spi-cpha property reduces IO errors / fixes
	measurement readout / improves somehow differently.

to the commit log?

> Fixes: 416f882c3b40 ("dt-bindings: iio: adc: Migrate AD7606 documentation=
 to yaml")
> Fixes: 6e33a125df66 ("dt-bindings: iio: adc: Add docs for AD7606 ADC")
>=20
> Signed-off-by: Guillaume Stols <gstols@baylibre.com>

The empty line between Fixes and S-o-b is unusual. Assuming you resend
anyway, please drop it.

> diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml b/=
Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> index 69408cae3db9..75334a033539 100644
> --- a/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7606.yaml
> @@ -29,8 +29,6 @@ properties:
>    reg:
>      maxItems: 1
> =20
> -  spi-cpha: true
> -
>    spi-cpol: true
> =20
>    avcc-supply: true
> @@ -117,7 +115,7 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - spi-cpha
> +  - spi-cpol

Adding cpol seems unrelated to this patch. (And you remove it again in
patch #2.)

>    - avcc-supply
>    - vdrive-supply
>    - interrupts

Best regards
Uwe

--fon5yzoippkxiyy4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbujbUACgkQj4D7WH0S
/k5zDwf/UzSdDFwznnAQVwNU4Up1WB/17Sc+fFsZK7NmAl7vGDK+ucYNoVFnLlpj
8rnZS4oVghQvHP4XVec0RdAN6IUraFrp65HErNSk1w/ggR/AyjQ+tkksGzWzpcQu
NOm257ZP6D5f8CaSqw3C2z613vDtCLthp4Fnhr96EGM0d4Dz8CEB0/Afd5r8Axda
r0nMXbg1xGlhoOnEUxKSOJHTtiFlyVx1nke+odinSs26zkmlY+suaeoTSDIQTw9d
dFO+w2ICYF0qoTrDK2hOiIeW6pfUzkcmbAEhgXHTgWXvxnaMpxJtLUy7KqaAyIkE
TehREFAYgFWvNzKEpIz/Ny6tGNbp7A==
=LDVO
-----END PGP SIGNATURE-----

--fon5yzoippkxiyy4--
