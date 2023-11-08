Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC5A30320;
	Wed,  8 Nov 2023 14:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOouj4dW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67CFC433C7;
	Wed,  8 Nov 2023 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699455559;
	bh=rADyy5yr7+H2mZjnMvdRbduD7lwAsCfnNVr4XTzxvPg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FOouj4dWsfpzr7uI3jxC/aKkHDlSoefrYgRLHG21Aw4jKD+yk6+xED90b/4JBfL/L
	 7PTh+vFsRqMi/x30EjFg64dOrfpTwGWdVicx4fpNwaoQY+5ET1azdTK38QR7T+Ff/G
	 ozx+5nw8ZflmPwrlXXj1dngTr5myZusiD9aIwEKa1sW0WZ9x5DB/C2IL5Mngm4jeIM
	 8aHj3NqUFG1AkIwkkxs81gZsr3BWcd+OdsbrQeIBqkZRU1ULdOaF1oLWaRuoapKabm
	 cwx/SqgrQ2rAkLgVoFEcBNXnJN8vZ+aHOjlvYURgPb8+HXGB+zLCE9JaNucDkL0H2x
	 GxuI/gGwx3PXw==
Date: Wed, 8 Nov 2023 14:59:14 +0000
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
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v3 20/20] dt-bindings: riscv: add Zfa ISA extension
 description
Message-ID: <20231108-basics-delete-710d0682bf0e@spud>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-21-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JkYUf/ZcAWjBoFXV"
Content-Disposition: inline
In-Reply-To: <20231107105556.517187-21-cleger@rivosinc.com>


--JkYUf/ZcAWjBoFXV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:55:56AM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zfa ISA extension[1] which can now be
> reported through hwprobe for userspace usage.

FWIW, hwprobe is not relevant for the dt-bindings.

> Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/v=
iew [1]
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Do=
cumentation/devicetree/bindings/riscv/extensions.yaml
> index 87c7e3608217..dcba5380f923 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -214,6 +214,12 @@ properties:
>              instructions as ratified at commit 6d33919 ("Merge pull requ=
est #158
>              from hirooih/clmul-fix-loop-end-condition") of riscv-bitmani=
p.
> =20
> +        - const: zfa
> +          description:
> +            The standard Zfa extension for additional floating point
> +            instructions, as ratified in commit 056b6ff ("Zfa is ratifie=
d") of
> +            riscv-isa-manual.
> +
>          - const: zfh
>            description:
>              The standard Zfh extension for 16-bit half-precision binary
> --=20
> 2.42.0
>=20

--JkYUf/ZcAWjBoFXV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUuiQgAKCRB4tDGHoIJi
0llOAQCViniwIMqamKiIXGkYgPVn8XIdcV77SvS/CGDxg7coMgEA0h28x+pWr9FN
yF1FraJ1KQm8FDdMDJdiNn511fAr8wI=
=q5Lh
-----END PGP SIGNATURE-----

--JkYUf/ZcAWjBoFXV--
