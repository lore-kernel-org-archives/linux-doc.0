Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985CF3C1973
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839298; cv=none; b=m1i+nparPj1CrZth+DHPw58dfI5qqtjidXleN+vefkw9jfr6zSAXH0ae59dS2v/z4H37yEQBfLT9g4YGEAJe7gLG0YyJaSU6Gi/sZ9q+dp852QH5V6OnZVj6M0LdnP66VBMtqRli/9oGUfl554NkY6BpV6zSNVp4JQ3XfOrl0lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839298; c=relaxed/simple;
	bh=XTU3GZzTxPoqO/NCvfqbI9XRN0RZRKYwxhKHOqFhT8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=noxe4i7BvuQeBbZB3ooCVlS4qA2o1A8ciSQdE9IQMZzdAttv41xbKyhiU9jeW/iVCJ/xvWBfxaFV45X4PagnyEa/nngv02h3Qv8kxsU+YXhMxn+zqVbffJQGzngHO2ewFBcHg5ceV8gY+fMcJFNVLeAQzXnDdjrfaskJAPR6i+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=DDaMxoFd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="DDaMxoFd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493a5d32e8cso29464555e9.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 10:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782839295; x=1783444095; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9qwsJL/V5cXTs1YYwm/4hgyvuOLQs7ZaFMiDXmAVm8g=;
        b=DDaMxoFd3f0AxJkaRsJ+6sWV2kruspJqZKka8i/rm+oLMELWrT0nURmlTmvS6u5l04
         otE8AMz+VkbUEm6XFFnYlV3FUa0x5rqMlgK6Kp7fPE9GewBrgdfXIF7FlLSBEJI4VdNw
         fkyCGq04UbjfFDIBjsSNnFvY/zxx+3kaoHt6k7KokUKuHtUCfDam4Y9nDn9ad6R0qRnT
         T7JBpebtfSA2l4ADzTktpLnnKDUCfluMpngSctbaZ4Nlf+8O8Rw07Zj/L8p1Wq6hApkG
         HcEqNSoUKzXGM4RMiXTQtztIBQRbIEbBzMXV/6SlaFNVixNOrSaoOfpCtg9G//SMHUL6
         Cx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839295; x=1783444095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qwsJL/V5cXTs1YYwm/4hgyvuOLQs7ZaFMiDXmAVm8g=;
        b=YlBQvY2Gshk7rkJACPzS/DKZmD3Lq17i9Pdx3zP6rL6uwAiub3TxwZ7e6d5A5AvdNK
         z9EhrMiZSNv540yScr4qdG79RbSwq6FWU1Tx5GnF9m/ZQZ+jp3gIZmHwND1fscyu3MzR
         P6QI2aMK59+x9pF6Hom78AhPsxlaQYEgs+9X3oQxdUg1oD7DGtXjcgg4mi1peGiKXZk9
         T3r6XaK6JH/CL10MMoWpJsopy83yWaBwQCjddbE9QtE68V0gv/7G6uRlZ55CymoiQW5C
         jKUU10UIgLc2tpi4RXFAEaXHLWsEidNGglEgXo32uwfcfFgLquBL1OxuWFvKwXEnkwL4
         Xf3w==
X-Forwarded-Encrypted: i=1; AFNElJ80X4uoNxhTAI2Okdlx4KXKvAY2pT/Ij9yJ5+a3v/OtP460zj3Bk6r0UEbefsuem0IuM+iW3l4Y7+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuPCIAsXWY7Rj4dfvqCWJAokRXzANUgsuQoRujTC7ZECMNuZPE
	73/QemWNV/dEJew4aWG7zCDDSHiry7yr/57kfsGhtcYteqT1HAW1MjxdE37a3t7hilQ=
X-Gm-Gg: AfdE7ckh4A0vQf4E3kQSGDscDCwtflBJ12a29+3xMWGYrzk4J1XyuSFPxv+AqQPcvmt
	ynCqsyNqMFekVgCKjxL18PVni+XzrnegPx81hnN9/cRDCaXzyE1hP3oIH2IuqkAEyt8Jf4vpvbR
	mUmXsJRdwhw4vB6DsOUN9s+CmJMeFhGGN1zdIpujqz1CB98VfNU7fEFYIJ+rw6kE6lW5rafM8nj
	tI5RiuuaRx6dFX6LSNideUxw53QjnKAi1dVC2SdjLoq/PmcsgxgOdMp8ytiClvL860qvxmqN0lz
	kpyiZrK6euKiaZ2bumJRuhYV1+5m82GdmeHvcxPLmIl1CQJInGXfKgpv0MxrPkxcjanVT9S1duf
	tm8M/scgeYhKJ6dHf82gTLD8XAu+WN1wCGB0KwyGVR9pdYB8DINeeYY7Glo5NlNE6U2TA9jhLcQ
	mfiRlFk9aZx5Slcqh5KzJxolwGdlwkxStdfDwyobBmaK8Wlvu8wOlkT6ytMOOu4G9RNPDBW/t3C
	Owg
X-Received: by 2002:a05:600c:8216:b0:493:bed9:b53d with SMTP id 5b1f17b1804b1-493bed9b678mr2175265e9.31.1782839295000;
        Tue, 30 Jun 2026 10:08:15 -0700 (PDT)
Received: from localhost (p200300f65f47db042a9b551def0a6b94.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2a9b:551d:ef0a:6b94])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493be4eee27sm8674355e9.12.2026.06.30.10.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:08:14 -0700 (PDT)
Date: Tue, 30 Jun 2026 19:08:13 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Selvamani.Rajagopal@onsemi.com
Cc: Andrew Lunn <andrew@lunn.ch>, 
	Piergiorgio Beruto <pier.beruto@onsemi.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jerry Ray <jerry.ray@microchip.com>
Subject: Re: [PATCH net-next v6 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Message-ID: <akP3jrbFLBfS5UqV@monoceros>
References: <20260629-s2500-mac-phy-support-v6-0-18ce79500371@onsemi.com>
 <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ntx7bzi7dfhkiyke"
Content-Disposition: inline
In-Reply-To: <20260629-s2500-mac-phy-support-v6-12-18ce79500371@onsemi.com>


--ntx7bzi7dfhkiyke
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v6 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
MIME-Version: 1.0

Hello,

On Mon, Jun 29, 2026 at 10:23:42AM -0700, Selvamani Rajagopal via B4 Relay wrote:
> +static const struct spi_device_id s2500_ids[] = {
> +	{ "s2500" },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(spi, s2500_ids);

For consistency, please make this:

	static const struct spi_device_id s2500_ids[] = {
		{ .name = "s2500" },
		{ }
	};
	MODULE_DEVICE_TABLE(spi, s2500_ids);

(i.e. use a named initializer, a space between { and } and no empty line
before MODULE_DEVICE_TABLE()).

Also the driver should probably have a

	MODULE_DEVICE_TABLE(of, s2500_of_match);

Best regards
Uwe

--ntx7bzi7dfhkiyke
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpD9/kACgkQj4D7WH0S
/k6pCwf/QtIw3bESK2sU/WMtvyyN/Abtx6fXW06GvQb6J8/Pp/DEz3MY7edpNCJK
0gDMu5RmoFvl6UIJ1rnjlwuETiSQ8W9VN93JWaUm212dxEho9GpPJ+JqkB1703AS
yHiC55snCYwK/u/sGhSBEO9tZX+Kv5oipsznoQOEUwci40Kc5fZfRhLFWdze/Y/M
O0PINCia51Hs6WRhTU1X3P7oywz7Vk4YhmykaK5FrdBL1HjiH8Un7C2KjEq0vt87
QZJ8Q0rZ2cZ/w9liMwdBKXjiCl1haQuliCLTrDN7u+KzKsjSg5JeL/QJCgaAwznH
d15YeQi0JeqfHWlWVAFdiRlLfp5W/A==
=Oe8T
-----END PGP SIGNATURE-----

--ntx7bzi7dfhkiyke--
