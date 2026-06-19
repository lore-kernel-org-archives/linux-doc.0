Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD722F747A
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 13:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877575; cv=none; b=pGs2Ul0r4nLQDBuEcRUdv43/xKk3Fuy3z/PfL1zsAxbjdhW9vCRMoZ4KSRMgirS4y5kdssyuO6tgobjtt2ZonaxpF3w9G0hiEXuIBxYAE7OC9Don47X+65ERr7DTYlECdSS6g2gw6MlYxU6x0X3CocnqKgznXynTtl5JOA0ZPYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877575; c=relaxed/simple;
	bh=M6XOBVqYNCyAP2+UukgzLFzwR8WmlzWVSsGzneKY1Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MT8M6cpXs+FbM+LGVky1q3bTHU5EXCVLLsa3od3WqAygTqRdc4ZZaQs4dilwxrsEuTpRViU8LXEgFwojjGjz9uymRLVdipDfhfSGRq2MeFp/LyBZm7l8Z3xAKE2qeIAbzohPnz5+L/8o9/VPZ8e5/0qFpvQZv+E2f9L5FaGIne0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TtJGaiEr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TtJGaiEr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso1524455f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781877572; x=1782482372; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IFmcgWo6u0bUP8TJiUQg2GCEaR02GLGc4w/zuv0CGcI=;
        b=TtJGaiEr+E4AM8Dqd9RNvM3VZvErBB+WUxnQQ6Pz73m7JQtitfPK/bdFXT2RIx1/IP
         Hu7Q3UAQU2FQNvTfppWMcVVi4MpQSlO6qD3JWpA7UdnBxQXyv52+bVMuPHcQGO3sML37
         hwprvGZWZUZdZeDbhfC4W7Hy7wto8jKQojuekDSEGJuZK4l5BMNisoHxkbz6NCYQEVzC
         CJKL09jBE682+PO03uJrcA+/aWo9a7DfJA/m9Myi784dQdxOKoCfxRvD0bdmEX82dtHd
         +54pV98H1++414qQTGcYndYr/3x74y+h+BJ6AsqKmnaJu1KA8yN7qYU0/g28ldsDY8kV
         ZMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781877572; x=1782482372;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFmcgWo6u0bUP8TJiUQg2GCEaR02GLGc4w/zuv0CGcI=;
        b=QDwlHAsbgMkxw+PENJtUMUcU9QYiKpUNFQBYZSnPv3XjDjkov6VPL84Sqe7q/B87/L
         ea79icPF7N2KkPv9c4wTuqpA8QpjE5+zG7zKbgzf8nmEu5ixVUh9oHBqJ2fog2+7r2Ne
         mhfjU0WWxLs0JTFxlBeo20IMAgpGUk+Y9hXptmiCh5nrXSNBINhT0un/zc+ciuwdDhxa
         ZnZqtXx20ClXmjtfxDOfT5jO0eldRcpSMChNA8D8ldUqSWoyPizF+OxFLQEFbmy81i28
         Yfx5vZ05XYC5stZnSWmebeLs7+lF03WJvPiD+eLML738d6dP6OB4B8YBxpJMKr7y8NRo
         q3sg==
X-Forwarded-Encrypted: i=1; AFNElJ/fDaRKPCm0aWHWukXFSqcduIHhywHVGvrdEU5gL0WV1muLUE7nv14tT8tkGBsdj0+wKIP1PR1I1Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9KEyS5i8sCOBbmgxCkd9WO5m0PXs3g1DCkNv2X3C8EenBd08T
	eohth24rByVymkYuGNutDYxaih9H4Kask0tEC1Lus++BrBCLNg6fqaODXVTkczPDjO8=
X-Gm-Gg: AfdE7cnQoY50ds1wv76TIFPieGA/wazKEESVOsxUstNtRoSiVb4c3VnyruWb4k7Jytj
	RNiHdyxecdso2s5o+U1kaGIO7pJI4iTHRljgUNnmQXmpwv3hMkzr2h2MrkxQE7bed8rGUoMjpTi
	BBpCXyAgfVPHABdNQgpdkhRqCekcjb9WetaUT41I1TWpoJqOPqrZY/tW9xTsFTugvzkRCt+wwUe
	MsV83bdyl8Nb9QnrSD/XaubfsvTTcRy9lmZkuno57Yf/g3HabxzKYaHSFiy01kD+DYVgungMAvC
	jfoPqRPZVvv5xTX4lGexzEGv+6f+o5qv0fMtKj+o+jkecmTJgRi6QBRzg+Xgmk84MgJTRfiH5SX
	6C59mkrylssM8jJ5FyU1QifeGM1aTSmJGhaQuALmj1sOjyOwfjz74Q55+v8K4w3uhoITxJRElwL
	zQXEVno4UvQnLsSJ9KrgyRCjXUhGUp64+xODCYWko/H2QoRnemyUYb+8xsS10OOK5MFJ+FIJHb6
	OA=
X-Received: by 2002:adf:f6cd:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-46507102de3mr5698705f8f.11.1781877572252;
        Fri, 19 Jun 2026 06:59:32 -0700 (PDT)
Received: from localhost (p200300f65f47db04359fc0e70763236f.dip0.t-ipconnect.de. [2003:f6:5f47:db04:359f:c0e7:763:236f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650bc429a1sm8133882f8f.30.2026.06.19.06.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 06:59:31 -0700 (PDT)
Date: Fri, 19 Jun 2026 15:59:30 +0200
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
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
Message-ID: <ajVKfBKPuNk9zN7b@monoceros>
References: <20260614-s2500-mac-phy-support-v5-0-89874b72f725@onsemi.com>
 <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vgihchiky4pi5wmr"
Content-Disposition: inline
In-Reply-To: <20260614-s2500-mac-phy-support-v5-12-89874b72f725@onsemi.com>


--vgihchiky4pi5wmr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v5 12/15] onsemi: s2500: Add driver support for
 TS2500 MAC-PHY
MIME-Version: 1.0

On Sun, Jun 14, 2026 at 10:00:28AM -0700, Selvamani Rajagopal via B4 Relay wrote:
> +static const struct of_device_id s2500_of_match[] = {
> +	{ .compatible = "onnn,s2500" },
> +	{}

s/{}/{ }/

> +};
> +
> +static const struct spi_device_id s2500_ids[] = {
> +	{ "s2500" },
> +	{}
> +};

Please make this:

static const struct spi_device_id s2500_ids[] = {
	{ .name = "s2500" },
	{ }
};

> +MODULE_DEVICE_TABLE(spi, s2500_ids);
> +
> +static struct spi_driver s2500_driver = {
> +	.driver = {
> +		.name	= DRV_NAME,
> +		.of_match_table = s2500_of_match,
> +	},
> +	.probe		= s2500_probe,
> +	.remove		= s2500_remove,
> +	.id_table	= s2500_ids,

Tastes are different, but the idea to align = is usually screwed by
follow up patches. Here it's broken from the start. If you ask me: Use a
single space before each =.

> +};
> +
> +module_spi_driver(s2500_driver);

Usually there is no empty line between the driver struct and the macro
registering it.

> +
> +MODULE_AUTHOR("Piergiorgio Beruto <pier.beruto@onsemi.com>");
> +MODULE_AUTHOR("Selva Rajagopal <selvamani.rajagopal@onsemi.com>");
> +MODULE_DESCRIPTION("onsemi MACPHY ethernet driver");
> +MODULE_LICENSE("GPL");

Best regards
Uwe

--vgihchiky4pi5wmr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmo1Sz8ACgkQj4D7WH0S
/k50xAf/Zh/5TUve8B01NSTYsEN/FHNN2Ll/KSVNoRTgKx8ImFNr2/o/BEgi6GhK
pfNVfy1Xf+GanFXibebKU1VQX7LuHvcyYGXnkzwA+qObF81/JvZWwiqHK6NykReC
tPMNc83BEKNMA764MoqvoZaSukhGUvby5CBMSqupfKgxZ+c/b2FC6E8Hk977oKEZ
J1nZQGEdCQ+b2/m4sQLbwxIZpra7CFVd9q6ke8JkqV29pA0koqFQwfaB1r0LGIIr
jTGPN/so0SIMhZulEk/kK3T0f3Z71a3YD7xc3O9tJE5MYexsTK49ZJNV+aGtvirE
zLZ+IsKQC1b+FCzKBDKhYFsysIB2Mg==
=Joyu
-----END PGP SIGNATURE-----

--vgihchiky4pi5wmr--
