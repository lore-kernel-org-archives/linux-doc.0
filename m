Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C983A8FB;
	Thu, 14 Dec 2023 14:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hvw/Rmva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94130C433C7;
	Thu, 14 Dec 2023 14:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702563140;
	bh=kURWfUajABccOzK2w+kJIDkLS9dQkFuhmyqOgcPhtJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hvw/RmvahaG+vJo5uCzSEKnmWfsd+/U85LYZrRyvzhp6UKXlQ1yeeAuNFUnNwVRX4
	 faMVtWMdLfoiMbxF2UrVXJY9j5g7EGRj7vjWzPlvOd2/qJfcweIVDO/Zav9+pTLVT5
	 KD9paXFbuWHEl+qO3p45SWuYLD4ikogILu6GXApdBVB3b7LGz3QfULj3y0C6minr8W
	 TEqF32ejdsEb5MVuzWSx5I/PQQWzAxr3yu4zHXFIhLcpf/SiRDrb0ZZDGOXDtxCVWO
	 7tHe8IfSwKq/MQZZJt9moqTupXXNYjs5Iy82kL20rZlpRIwJ1lfr3BYJduNqMklMU+
	 u0vlaMrAMT8rg==
Date: Thu, 14 Dec 2023 14:12:15 +0000
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
Subject: Re: [PATCH 6/9] dt-bindings: riscv: add Zacas ISA extension
 description
Message-ID: <20231214-plywood-little-4fc5f6866938@spud>
References: <20231213113308.133176-1-cleger@rivosinc.com>
 <20231213113308.133176-7-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WsH5yL1is2A3wdVm"
Content-Disposition: inline
In-Reply-To: <20231213113308.133176-7-cleger@rivosinc.com>


--WsH5yL1is2A3wdVm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2023 at 12:33:02PM +0100, Cl=E9ment L=E9ger wrote:
> Add description for the Zacas ISA extension which was ratified recently.
>=20
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--WsH5yL1is2A3wdVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXsNPwAKCRB4tDGHoIJi
0l8pAQDb06YZM3zu81dwFpDCL6dk+ww9ScWul2gsUo2Cm8U2NgEAjczxPKOsp6/v
ARmSuUG56RnA+IZRScFD0UD7oxDG8g0=
=SBUH
-----END PGP SIGNATURE-----

--WsH5yL1is2A3wdVm--
