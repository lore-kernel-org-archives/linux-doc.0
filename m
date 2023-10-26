Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CA02EAEB;
	Thu, 26 Oct 2023 14:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rk0fmsRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F3AC433C7;
	Thu, 26 Oct 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698330360;
	bh=9Cwqw/fWKM5uYNCnpfD7cgaQ4Y+kZK35kIJsOLUSy1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rk0fmsRFU74qvN0wrURYBETxMpTCpWBiSCdBGXjfJ6eVKk1CbB5PmlEVygDG0Veel
	 uoDyi0xwJHgrVoCINq5tSt6SeMh09QWLqfXyPhRBvRssN7i6YdTbquC0+3j0aLYEJ0
	 8VgVs2kr7AFhasTjd5/gWRNXLS+B2YC1ZS7648t8tBU3Eqi232Zmpep0WLNaRfqW1+
	 3KMr2Cq2bGQTRHU1ct1pIlQruaGQVZLRLmiFuYOXUDyzimoSVz5erPRR4vXRt8LDDP
	 rZUOUBw/ErMtS+BJ5T1Z0VQwsrfnDZZbfE9EP01kCZcq8RxST7IErLQS/vQnMzfcvH
	 bjckdnconGRbA==
Date: Thu, 26 Oct 2023 15:25:55 +0100
From: Conor Dooley <conor@kernel.org>
To: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
Cc: patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-i2c@vger.kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add lltc ltc4286 driver
 bindings
Message-ID: <20231026-dicing-crispy-a10af575d3e5@spud>
References: <20231026081514.3610343-1-Delphine_CC_Chiu@Wiwynn.com>
 <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jMMeW1OsGzkZp10V"
Content-Disposition: inline
In-Reply-To: <20231026081514.3610343-2-Delphine_CC_Chiu@Wiwynn.com>


--jMMeW1OsGzkZp10V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Thu, Oct 26, 2023 at 04:15:11PM +0800, Delphine CC Chiu wrote:
> Add a device tree bindings for ltc4286 driver.

Bindings are for devices, not for drivers.

>=20
> Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
>=20
> Changelog:
>   v2 - Revise vrange_select_25p6 to adi,vrange-select-25p6
>      - Add type for adi,vrange-select-25p6
>      - Revise rsense-micro-ohms to shunt-resistor-micro-ohms
> ---
>  .../bindings/hwmon/lltc,ltc4286.yaml          | 50 +++++++++++++++++++
>  MAINTAINERS                                   | 10 ++++
>  2 files changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lltc,ltc4286.=
yaml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml b/=
Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> new file mode 100644
> index 000000000000..17022de657bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/lltc,ltc4286.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/lltc,ltc4286.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: LTC4286 power monitors
> +
> +maintainers:
> +  - Delphine CC Chiu <Delphine_CC_Chiu@Wiwynn.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lltc,ltc4286
> +      - lltc,ltc4287

I don't recall seeing an answer to Guenter about this ltc4287 device:
https://lore.kernel.org/all/22f6364c-611c-ffb6-451c-9ddc20418d0a@roeck-us.n=
et/

> +
> +  reg:
> +    maxItems: 1
> +
> +  adi,vrange-select-25p6:
> +    description:
> +      This property is a bool parameter to represent the
> +      voltage range is 25.6 or not for this chip.

25.6 what? Volts? microvolts?
What about Guenter's suggestion to name this so that it better matches
the other, similar properties?

Cheers,
Conor.

--jMMeW1OsGzkZp10V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTp28wAKCRB4tDGHoIJi
0jT7APwIvjLDbL//84boMtfvc5RAA1QcNcVO+kfVu3dhyr7v0QD/YlNzHmAB6RRB
kYtv8yYAiBRKdn612BukEd8U5pcGjgU=
=QvBI
-----END PGP SIGNATURE-----

--jMMeW1OsGzkZp10V--
