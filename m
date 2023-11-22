Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC4957867;
	Wed, 22 Nov 2023 16:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lG8Qpst2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0371BC433C7;
	Wed, 22 Nov 2023 16:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700669620;
	bh=b2nTl96C3C5sv3UzKTb650wEGPo53mm3yZpl9sYxoS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lG8Qpst2HZvWgqf6mkTFaP5fkgbWBooDCM0ZTYirNIL4XbSPyXfwY6ljuL8tIA5tN
	 oQTE+0RV8RgBeRZjD15Mm8Jghm38A0FhbdjMsiPcptC4dgZDSmm8HvANrTCe0+ZAp2
	 RC9ygzbxtd57rFqegIFmwfomhENk/d/GH0RhIKZb76I/0bAwSjCOVIW79OxfXu7WLz
	 gV3lCOgnLVeZfKOg49NoogyFidRBYzPkKFWcoiHHDk8hdhqU4cD2jd5bbZN7lf0fK1
	 hxka9hhTad960OppnDBTusNoe2odAKl6D42Fj/XeWOcHCDp85Nb0cX0lX+2ppZY/bS
	 XvsQpYOmOf8FA==
Date: Wed, 22 Nov 2023 16:13:35 +0000
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
	Evan Green <evan@rivosinc.com>, Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: Re: [PATCH v4 05/20] dt-bindings: riscv: add scalar crypto ISA
 extensions description
Message-ID: <20231122-bulginess-rash-08f811f54f0a@spud>
References: <20231114141256.126749-1-cleger@rivosinc.com>
 <20231114141256.126749-6-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MwP0K8Sf91YW7Tpk"
Content-Disposition: inline
In-Reply-To: <20231114141256.126749-6-cleger@rivosinc.com>


--MwP0K8Sf91YW7Tpk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:12:41AM -0500, Cl=E9ment L=E9ger wrote:
> Add description for scalar crypto ISA extensions:
>=20
> - Zbkb
> - Zbkc
> - Zbkx
> - Zknd
> - Zkne
> - Zknh
> - Zkr
> - Zksed
> - Zksh
> - Zkt
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--MwP0K8Sf91YW7Tpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV4orwAKCRB4tDGHoIJi
0t+FAPwJWXny8MqLPpIpmQrQtwO3Qntn+WM4+IITgS5uuTwgDgEAk2BRuEGqBZid
AeYQalnd3+AvWO7eHvWwQPyGs3dTUwY=
=2+fF
-----END PGP SIGNATURE-----

--MwP0K8Sf91YW7Tpk--
