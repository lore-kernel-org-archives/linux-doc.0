Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA500395D8E
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 05:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784785502; cv=none; b=IxpVSnKfUZpzl6bMUHv+1mpnheVzRECnYq1hVnqsD48Y4qvrYAZ2mr1GI8jq3AtuO++Y5eXlEp8tLDwYQg4ohNKcD+guZ8hBxW8x55rJkRJChRcVhfBnBPa0BZ4HBTu18gnTpX64F157hfefNz1MZuqvcfxaiLnwfZBUM6QTjoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784785502; c=relaxed/simple;
	bh=/v6lBhg1oIN3yUphI0k8bShUlANofncArNDCE53+BIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JB5SLdaU8lgvIAtJwjJP+922eiiLrPccKB3yO8S/OB50dJNiQI6GPncaogPdbkBgyhgkuShy9BNoFOfWzDLmPkxv6mFlvLHIsWqFvMLazdfw4FhVhjedY7MNzLY6yBZ6hqAODw21syAdQ1J3TJ+lA5t5fI/vHiRmcVXe37w5zvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji3o5xLu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji3o5xLu"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso361848a12.3
        for <linux-doc@vger.kernel.org>; Wed, 22 Jul 2026 22:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784785499; x=1785390299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/v6lBhg1oIN3yUphI0k8bShUlANofncArNDCE53+BIw=;
        b=Ji3o5xLun1yY+TY89Ep0SPDMxR8AopZ4mgGV0G4XE+oOXAQse62UmsgfhxgxQH4hq7
         qpTc6se0JWpBvewBdb7FEeD0DQsspl6SAtLdrZhygt3gXCJ+Iosme1eSV99/+yXZHcci
         1+6phrKr86MSgP+1PlQmiScVYESaLcKrJp1bVAnX7zGl9+sc87OOKjEZH9hWXrNy4qOF
         n+tajP7SvnT1I821IaBMwAVqGPucRHhwCwWLwdbC2wnioiIRcWBC8Rad0fuU8hiddKAI
         VxiDfjEZzGdZTd86jHaynGrEH96Iu31yfqPfduTWfA6Mpp0fRUN+BDYwuw8oiDgoo2vy
         fxcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784785499; x=1785390299;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v6lBhg1oIN3yUphI0k8bShUlANofncArNDCE53+BIw=;
        b=OOob3ShGtW7e6Q060UBmY3v+T2mTiKApXDxwMLBbExkFNmK+PM22agu5/hI/VTPegF
         oRNGS6EhhnDRqErgx6GpUb8CWI5Qq9wttGQPDYZcqMUBQd7b8uF3HdaxdlMXHivwqy/7
         aBnty82OdgaHoSJZkp+T2v66uWddxT2shaBXYhYFWSAlWi4j8QINpEOuWqKy5sTS/F6j
         Ozf+ktCf8+yji9CDI5HpI92e/9+4mZD0uJHw6bzkBDOCNyN9GlN0Aa9z+b36shdLphrP
         NN9Y99vSnxy8M7kSeZ6NMunK+iUOf+gcobE7lAKQxPCFn6PIe7snrfBQEjCXzM/ygwGc
         qdiA==
X-Forwarded-Encrypted: i=1; AHgh+RrDkdnsbzeQmzuEnPP4A9R7eMbdOd0Ai4C5YRo5Dns9PW+lsCd2LmAkcJVHpMWJW1QdrP22Ap6duHQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZtd8C/i7dhhF1iemiaqudaL6qXS+DncSLgJD19GtWPt5y9pQb
	k+MS4yS41vDcIuT8hl6H/jYt/f7BSEAmq8y21Q+PexJ7kbD0acrNnDGI
X-Gm-Gg: AR+sD13pbeavZMTNyUbr6JiMQ/1uunwTickkXr5REOp9+6U7RzjKGWmg//6hzEOToHo
	/4+cQiGN3+jSCu9YYnO+W8uK77Xj/TYI90nREdFJf+N3CC0bWwgh3dAHzOcCg+raStEc1N/KpVz
	QAF/msUmjKUoirfQJT+MF6Oow5UBJPIpfPjkAJh56rf/M56Q392v9yvB3JHDiiQsiQTkD/cTxnD
	TG/cgWK0n1YUfSbp8gWhK2tZLmrli2aQHqZfb23OMkpi/o/77qQ/wCED+lGKe7VdpdOGLv22HEv
	NqosvSfOe2PyjaeLOkLv2+x/SHgtKQQ8m8nkGa2pcmUEKIMLKXggNM9SbM2hqef/kkAYXmuIwBR
	QJxMYpIs/pFNV4YmQlx+tL6wTH0PkSpNCn1x5EVsbhMY4jZ3aLGEhc6GeMVuzz/YQ/HeSvIsKcC
	ByYyhltWGPXbfmwePe2A3L5tLMwmAvLTjaAlh0TUs=
X-Received: by 2002:a17:907:3e06:b0:c19:6d4a:4261 with SMTP id a640c23a62f3a-c1c50c9aa33mr70460666b.63.1784785498617;
        Wed, 22 Jul 2026 22:44:58 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac8c3esm189241366b.23.2026.07.22.22.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 22:44:56 -0700 (PDT)
Date: Thu, 23 Jul 2026 07:44:52 +0200
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
Subject: Re: [PATCH v7 5/7] iio: adc: mcp3911: Add support for spi-device-addr
Message-ID: <amGqVEUujfo7errO@gmail.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-5-7781cd74ad75@analog.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MtfhSntS9TW1Vu1E"
Content-Disposition: inline
In-Reply-To: <20260722-ad5529r-driver-v7-5-7781cd74ad75@analog.com>


--MtfhSntS9TW1Vu1E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 09:54:17AM +0200, Janani Sunil wrote:
> Read the generic spi-device-addr property when determining the hardware
> device address. Fall back to the deprecated microchip,device-addr
> property and then to the historical device-addr property to preserve
> compatibility with existing devicetrees.
>=20
> The device address remains 0 when none of the properties are present.
>=20
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>

--MtfhSntS9TW1Vu1E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmphqk4ACgkQiIBOb1ld
UjLb6BAAsp7UZzSbFXMXGJBLOP8h0fXtzzfybl4Icf9WnS1tdMe9GfD0PknCvRRB
0CSbaxYBOVTFks+BWKYX0VgR+2hQ8bEl6UyHHOn4SQE/nunRyxMufzh9UZ2VAANf
iCg5geMkIYBgXNhW+LRgeVW03LyIPMUVdlrS3M5ef1297/e3BMgI6J7DJ4ppQ0V+
ZB67bGDEnyDlCHcSkO4PR2Qppbhr5ZLMdWnBBveHaIUa44jSDYD5Df5+6jMnLwE7
Y9qTbcxzzXrrxucd3GI8h05metm+adbUgSsTDMjprd5kxt4JzEnBhmPJPLMWBjRN
QqcbbtS7y+AXQHGcVCytNHbgD3Hw6fQD23yaYtz/H8pNAF7sTpux8BgYsz0BaMcl
yDZhsSFJPoAtJcol85vSc5TNPJby7Humys6289Q2B8qbi82uXK12rH7D/XNbpHqt
D5W0XE1hKlN3BPKPF6AmPLO62wpdmKRmDavjERt8YA4tWhdZkZ8cosvKhKIEXeIw
VZ2YEsr4LQJRSgWGLtbmUbg97vUyBMZ6/LeZUDova0Zt1IbmEI2FAOnHXbtqb+Lu
aosMxoA2doxH7nE7zPWcqQAc00gTQj8FzHXPdsKiIMn/017AqFVyIfquxCNHAWcw
MsAbqJWelsA2qe2ygt6uJnhoJxsIuRMrfgnqRPA1t3KPzy647QI=
=Nsy1
-----END PGP SIGNATURE-----

--MtfhSntS9TW1Vu1E--
