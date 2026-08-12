Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55535AC28
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 16:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552208; cv=none; b=nJzTOXAfVDDR3K3DWEt46aa2H4Ou3yB1RXeYBiU2hpggniL393i5As9XZmSJ3wmwQpMDPDVrid7BrLzFEp/gQm3pBi4zTWCPCmue9LWFmBDV28Fwz/h/y3Om2IxGL1sziUdf/J+GVsxT1yFMirt0teBozM7IuNmqvocv7DevhPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552208; c=relaxed/simple;
	bh=1nxBbdYt4NyVpUfMMbPHXMdAVynnyeyFD7RDA7bfvEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCirdqVSsL4AGNSdVSFQuxncsy3aCtdO4iES7oupkiIUkFyYQwz5o5NvJzV3dU/UhSeonBvLMrx4naVH+D2Ba++6J5+pewbuuZx1vxRka1dMbYY3teqMv616SXQ/NU8MaJ8GSBbK2MPc+Vt+/idbTHgeY5lkjVolyt5ku7373DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FTi3TjSU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FTi3TjSU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so11514245e9.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 09:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786552202; x=1787157002; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=FTi3TjSUHzc/HRjywiEBiHCFvI+9lPZ4Y95+kXqA+LXmvwLYPKRRbDrhj8lEi5t+fm
         rG5Js2MukdneqsDPy/XsZVlFfnbzaDps5ATNiBq8n+suWV4CTqs0XWOnCjzxjlHTM86T
         WQTrct7l7fUkU4vub77zSd6gLndrYkJvMW88O1ZdptrTzMOuOEoY2OREbDvc0aALJMMM
         caiNmbXumWZnqnyMm6vYESGE/Ln9kqzvt/fVXOzdmGU5WNf7E81rsi5dCDjdfLva8emg
         QljOx4vZb2l8eRVPqAmL6OgvwQgRiZaOqR7UR3B+y9SNLrKslOgMmBjBdjKuNMpmTMtk
         RT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552202; x=1787157002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmkTZ3IeMxC+OXIAB9iDoircMZw2Dwc6lMPotGUqEQg=;
        b=s61zkPgTzFRMfOZNmmiB84y2AWvTfsWuUguqKqZHwN4RJOnFhAmdHC0FilJd/neGeQ
         OKL9BE/st9HwSO1ZNDNfcgHYWWfzztbWJZGxs7zH6hxvMMlCOBFFElw1kxJVWuaawNft
         S6FpVdPPNhIaoEQlKAdVc4VBebOzrMKBmXvW77pKtT5YrlXCbQhgByMdKMOgjinDPsab
         hA/hgkvi0ICqdPmGaoV7mnnHBaRuhghfLP60isaUqoBTwMvz/sOYY9tomAQ0r+cxWPl6
         E9gQ99E5V1MGwT88otEvrJWl+yLN5gsvvX/Kkh+xT8gW2LBhP4MDnaiTt4X2g+dRzr9G
         DJcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpV6vsEiGYuIe7bgQBJKK5x5w2SLJ7v92th8TBtDphnfvsZ3Kf7CJjdK02aM6nEwAbT4dm2rxOgbXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSDck7RtXO57Aguq+yTtrSKxs3dClNVa3xlbXWOI2vQ2oBHy1w
	MAdhGZmHbKuyogtOs3HH0C5OlUO28gK1QCqferisRLiqlFKoRP6Oz/R1S4H3Mg5pu0s=
X-Gm-Gg: AR+sD13eH4CEEOjCB8yGE90OZaEwPUqKXystmXINyqEKBbup+/b7Qjypz26P5fzStKZ
	E8wEk+/GLMRTbFemyANTxHEEYCmx5NNQSIZ3JuLQykVCoYGToyAG184DO/Pvqf1U+tgY3/k/s+r
	j9RsuOj3kJdXiju2xpRL5xv9zL2gt0k9hWYJcdG96DpPrbQJjqMnaF9Xmhpm9Wxyehmaddgqx/E
	TYT8HgpItzkJoIXquIXpYLL+u9g98v5DKNraSf643L9RHq+NcsY9INFlB1B2PuM2Nfy/BLt49Ul
	U72tpV3jwyXfD6Qud/D5eK0NDdfXa1yBfwoSOu/MgysXYiN7OC7z5N2hw77LG+XYq1kwXw97iG1
	x1PkdXQ7VwbJRCkqYI0WVjaD/47Rv55pBTSMJtEzRQRWw005fwzjBYnIIx1ZDIBmm8zwGdSsqa6
	bfUDczq2JNbixrJj+0O8/vT3LLJMAxwRjiuFoycdIcRb1k1BUxBIrIpXSMd6EtYwNlfBTLbEiUW
	DtMwr5NqKYb6oFLEVxFZJJrf0IJAgpe6sTp/6tIsHBRPLHUjt0=
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr92430045e9.18.1786552202335;
        Wed, 12 Aug 2026 09:30:02 -0700 (PDT)
Received: from localhost (p200300f65f017104d14d09407ec2ee4e.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d14d:940:7ec2:ee4e])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49981aba3e3sm4063945e9.0.2026.08.12.09.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 09:30:01 -0700 (PDT)
Date: Wed, 12 Aug 2026 18:30:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: "M, Krishnamoorthi" <krishnamoorthi.m@amd.com>
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, 
	broonie@kernel.org, linux-spi@vger.kernel.org, akshata.mukundshetty@amd.com, 
	bleung@chromium.org, groeck@chromium.org, chrome-platform@lists.linux.dev, 
	corbet@lwn.net, linux-doc@vger.kernel.org, skhan@linuxfoundation.org, 
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
Message-ID: <anye28kId4k8pxBv@monoceros>
References: <20260804115259.4065638-1-krishnamoorthi.m@amd.com>
 <20260804115259.4065638-2-krishnamoorthi.m@amd.com>
 <anSGjRK8spayFnKw@monoceros>
 <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2paxlrpjxbcfpa7x"
Content-Disposition: inline
In-Reply-To: <0f7469b8-8275-4061-b336-97cbce41ff82@amd.com>


--2paxlrpjxbcfpa7x
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/4] espi: add core bus framework
MIME-Version: 1.0

Hello,

On Wed, Aug 12, 2026 at 06:20:29PM +0530, M, Krishnamoorthi wrote:
> On 8/6/2026 7:01 PM, Uwe Kleine-K=F6nig wrote:
> > On Tue, Aug 04, 2026 at 05:22:56PM +0530, Krishnamoorthi M wrote:
> > > [...]
> > > +const struct bus_type espi_bus_type =3D {
> > > +	.name	=3D "espi",
> > > +	.match	=3D espi_bus_match,
> > > +	.uevent	=3D espi_bus_uevent,
> > > +	.probe	=3D espi_bus_probe,
> > > +	.remove	=3D espi_bus_remove,
> > > +};
> > > +EXPORT_SYMBOL_GPL(espi_bus_type);
> >=20
> > Do you really need this exported?
>=20
> Yes, it is required. Controller and slave drivers built as modules refere=
nce
> espi_bus_type directly when registering devices. Without the export they
> fail to link.

I would have expected that

	drv->driver.bus =3D &espi_bus_type;

in __espi_register_driver() is enough for drivers to not have to use
that symbol directly?

Best regards
Uwe

--2paxlrpjxbcfpa7x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8n4YACgkQj4D7WH0S
/k4Ymwf+OtbJNAPe3Ou/27KwbxJa7KENRUomWmPpgocqBVTa4ITzi7yNWHl4gAqS
n5Xc9dI8tHJ49x6eepGWEp56WN4iknHSvv4VfsYY1q3IiP0BA7wHPGNtXoWIHOAa
4o7paa8rCqvUEEnsWHx6t7NgF4d9H3ByZLukSoHjbEaMGXR8k4sAoIZl6OP1zHLL
sDcIp43PhG5JIYLJA+zNDa/GcsWt7GAOI61w0iEk642G+3Sp4LU4Aeml8sLnCZwv
z5mEpWndwlZQ5q6u+eQBlADmahJtNTb4U9cwNydL7sdyQFKIWhpQEIlpaBbpzcKH
rwtLLuNJ9v2D8mdQKMK2Yod5Qp7vCg==
=HyN7
-----END PGP SIGNATURE-----

--2paxlrpjxbcfpa7x--
