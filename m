Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CFD5788F;
	Thu, 14 Dec 2023 14:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbNVZtIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39EC3C433C7;
	Thu, 14 Dec 2023 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702563097;
	bh=GyMtscGKySvG9oLYQyEiY2lUC4Sczcyl7+D4n6Kuh68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbNVZtIBC0vNUoSOfQzYky2npa/M9t2bWxKOFls89F2AM7500dj21eY2ZedF1g74S
	 BDAt/l8O6XXt6sjY4AlBSHNIdVHoERPlQ1cVV9hc+IzaAvXtYTGDDUSVx4L9M0vdOy
	 F/qQVrs1sfxmL/PBeDNkppUoTCqCA+opvwYgL7nGb1ESaobz84zwvN0Zt+9cuoxXEf
	 uJXWpYKEHvXIko+v1hf9SBkyuSQbMOvxc5czneQikTmztS0OD14gCFh2KDLUaDny89
	 z3J07WYjFCGfeVI1l9s4ceP0vJU0vK7f1CUv+nJITUDIV+Gtu1U5QE61imQEo7fqkC
	 bJd+Q2IJwGIIA==
Date: Thu, 14 Dec 2023 14:11:32 +0000
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robbin Ehn <rehn@rivosinc.com>
Subject: Re: [PATCH 3/9] dt-bindings: riscv: add Zam ISA extension description
Message-ID: <20231214-headed-credible-f94ffb712e91@spud>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-4-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IZDap9bRO8g0/XW1"
Content-Disposition: inline
In-Reply-To: <20231213113308.133176-4-cleger@rivosinc.com>


--IZDap9bRO8g0/XW1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:32:59PM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zam ISA extension.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 3574a0b70be4..912cc6a42eb4 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -171,6 +171,11 @@ properties:
>              memory types as ratified in the 20191213 version of the priv=
ileged
>              ISA specification.
> =20
> +        - const: zam
> +          description: |
> +            The standard Zam extension for misaligned atomics is support=
ed as
> +            ratified in version 20191213 of the riscv-isa-manual.

Is "20191213" an actual tag in that repo? Looking at that version of the
spec (because it is a spec version, but I don't think it is a valid
reference to that repo) Zam is listed as Draft. In fact, in the most
recent thing I could find, Zam was still listed as draft.

Are you sure this is ratified?

--IZDap9bRO8g0/XW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsNFAAKCRB4tDGHoIJi
0n4WAP0UHU+PgvrzVtz+qD0YcBNQ5QVXPk4viQc73jWiaOWDpQEAoUmgwnWN5N5k
kXnIAgVh6XBqwvDr3kxU571dBisUywc=
=q1/2
-----END PGP SIGNATURE-----

--IZDap9bRO8g0/XW1--
