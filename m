Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17792942C;
	Thu, 12 Oct 2023 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="urQU7ZEW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB551C433C7;
	Thu, 12 Oct 2023 13:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697118552;
	bh=TmOqnjvyOI2L8Zeo6zptoTqnsmqtFR/n+cr6F5E1VIw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=urQU7ZEWSZCHSvrvcyNPwgHYzBV5LbkjoMRy3qy6NOSn+hsN07UkhK6aa5K9Kr+PD
	 M8GgpxEPL8QT2FAQITy8f3mmN7nNJi/bxLNyIbXHn5ll98FVqHQuLeX0lIiJ04CqcE
	 Z5MkBprebVd7xsr0vLf0HPeaLeoC4I0h3vtdeMdR3vO79D+2vbQRlAGHRlmAhdSprE
	 /fRxQNIIgmZwG0IRNmIW1LsoNKw0TdnIW3o8vBY9FLER7fGCTrP79bg7l4//XG0YR9
	 jwmB9p3Nn9HxINOuUO9icsd0ZH+N4/AO6v2g/SW1/Oi/fB1eImSwcIYmmByQmCFz64
	 Clo5tjOEpBYdg==
Date: Thu, 12 Oct 2023 14:49:07 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH v1 07/13] dt-bindings: riscv: add Zfh/Zfhmin ISA
 extensions description
Message-ID: <20231012-destiny-saggy-52f9cd1fa1c1@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <20231011111438.909552-8-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VaxcIaWMAYAGRs6f"
Content-Disposition: inline
In-Reply-To: <20231011111438.909552-8-cleger@rivosinc.com>


--VaxcIaWMAYAGRs6f
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Wed, Oct 11, 2023 at 01:14:32PM +0200, Cl=E9ment L=E9ger wrote:
> Add description of Zfh and Zfhmin ISA extensions[1] which can now be
> reported through hwprobe for userspace usage.
>=20
> [1] https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view
>=20
Same here about using Link: tags.
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 4002c65145c9..4c923800d751 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -190,6 +190,19 @@ properties:
>              instructions as ratified at commit 6d33919 ("Merge pull requ=
est #158
>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmani=
p.
> =20
> +        - const: zfh
> +          description:
> +            The standard Zfh extension for 16-bit half-precision binary
> +            floating-point instructions, as ratified in commit 64074bc (=
"Update
> +            version numbers for Zfh/Zfinx") of riscv-isa-manual.
> +
> +        - const: zfhmin
> +          description:
> +            The standard Zfhmin extension which provides minimal support=
 for
> +            16-bit half-precision binary floating-point instructions, as=
 ratified
> +            in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
> +            riscv-isa-manual.
> +
>          - const: zicbom
>            description:
>              The standard Zicbom extension for base cache management oper=
ations as
> --=20
> 2.42.0
>=20

--VaxcIaWMAYAGRs6f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSf5UwAKCRB4tDGHoIJi
0tr/AQCk7QGlt1DYuTkfC7/Ie/4ZKgXSAGkWae7Uj/vh6N0ZcwEAgktjiAMJzZJZ
tGX7mGWegrW4LYC30dq8Xxa0W/UutQ0=
=gQ6T
-----END PGP SIGNATURE-----

--VaxcIaWMAYAGRs6f--
