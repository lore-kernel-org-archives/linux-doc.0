Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112468473;
	Fri,  3 Nov 2023 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rjtpyVab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CC9BC433C9;
	Fri,  3 Nov 2023 12:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699015472;
	bh=RE8ZWD1hJwBqAK06hY3k7w9DMZ3q4+OUED5Exb0EUG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjtpyVabIPSERbple6CiOhglGKnqCOMJ7l4i78/QDlkMX5ZkCqm74VZJ52poeyZzE
	 rCeTax4Ssv2VAGYIUOLh4fR0TIP82CVlr1YqktEuAnam/3ACAqJpoH0RdECxBDAoAl
	 Tgpq+My6oTfXyHfSvLtCIgp5rYQdupXN4AFrVmfWhqdOF7H1hg+Sb55DbhU61RBVjX
	 IgOjEHt7Iy5AH4gUV3sBqz6CeGuNLX0TcsU1Kr8IwCXj9dpsqwiWW2PfRffwH3dm1c
	 tXSRUf8smwiMHgraaVnr4EJXWJctROiYDV1z8swYSFd+ELyPoRRAu2w/uGG5Kvy87j
	 y3izhzNr58ziw==
Date: Fri, 3 Nov 2023 12:44:27 +0000
From: Conor Dooley <conor@kernel.org>
To: Peter Yin <peteryin.openbmc@gmail.com>
Cc: patrick@stwcx.xyz, Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: hwmon: Add mps mp5990 driver bindings
Message-ID: <20231103-outthink-happiest-35c968eb6187@spud>
References: <20231103080128.1204218-1-peteryin.openbmc@gmail.com>
 <20231103080128.1204218-2-peteryin.openbmc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YP88GGzst4icFZC7"
Content-Disposition: inline
In-Reply-To: <20231103080128.1204218-2-peteryin.openbmc@gmail.com>


--YP88GGzst4icFZC7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Nov 03, 2023 at 04:01:26PM +0800, Peter Yin wrote:
> Add a device tree bindings for mp5990 device.
>=20
> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/mps,mp5990.yaml | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/mps,mp5990.ya=
ml
>=20
> diff --git a/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml b/Do=
cumentation/devicetree/bindings/hwmon/mps,mp5990.yaml
> new file mode 100644
> index 000000000000..7533d69f1922
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/mps,mp5990.yaml
> @@ -0,0 +1,43 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/mps,mp5990.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Analog Devices MP5990 HSC Controller

Analog Devices? Also, could you write that out rather than using the
"HSC" acronym?

> +
> +maintainers:
> +  - Peter Yin <peteryin.openbmc@gmail.com>
> +
> +description: |
> +  Analog Devices MP5990 HSC Controller

Ditto here, Analog Devices?

> +
> +  Datasheets:
> +  https://www.monolithicpower.com/en/mp5990.html
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mps,mp5990

Do you expect this list to grow? If not, just use const: instead of
enum:

> +
> +  reg:

> +    description: I2C address of slave device.

Can drop this description.

Cheers,
Conor.

> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +
> +        power-sensor@20 {
> +            reg =3D <0x20>;
> +            compatible =3D "mps,mp5990";
> +        };
> +    };
> --=20
> 2.25.1
>=20

--YP88GGzst4icFZC7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUTrKwAKCRB4tDGHoIJi
0iMgAQDKhAd8C7bms72XIMlSxUwJKZNpsCRINEa3roWUPehWFAD/RGZMiHjxOKiq
xvVwJUDMqpldLSIYLM2v9as2Sw6YKg4=
=Sgyr
-----END PGP SIGNATURE-----

--YP88GGzst4icFZC7--
