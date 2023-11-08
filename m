Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CC42FE2F;
	Wed,  8 Nov 2023 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q3j5TevN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6465FC433C8;
	Wed,  8 Nov 2023 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699455440;
	bh=LKL1hs/khI8hKTDotLj4TlzooB07x3t7D/CuzzZG+Oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3j5TevN8fsXBPvYnztlof7HiDniQcTKHv3coqsz0QT785G+eoPCtqqMYWpbFO96M
	 gMvkHunctwfdJGhNwCe8dw1uq3Yxe5U9MJ3CYnAM4u2jwcGEtl5NnZSs1PNQJTdjzj
	 qv1n3tARR6K9+GS2VGWHJS/G/+j7qLxDQg/RFlUal9qLJVdqA1pCnOGhrkpsKjIfR4
	 3AZi5nGl5SRtY9i92JjRacjWwn2fyh9kLusChllojkFy1489ygIO8+CGvotGnX8rcZ
	 JVOwoZxO4xvjiKsPRZgJTqaqAV9w0BFyxaEvM/rSYEudhIiDJ2x2sDxIINRNh4+0ji
	 +R8XiS//Kmy4w==
Date: Wed, 8 Nov 2023 14:57:15 +0000
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
Subject: Re: [PATCH v3 05/20] dt-bindings: riscv: add scalar crypto ISA
 extensions description
Message-ID: <20231108-grower-handwash-63526d449e9c@spud>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-6-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IXI5peX4j7nYK3nr"
Content-Disposition: inline
In-Reply-To: <20231107105556.517187-6-cleger@rivosinc.com>


--IXI5peX4j7nYK3nr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo,

On Tue, Nov 07, 2023 at 11:55:41AM +0100, Cl=E9ment L=E9ger wrote:
> +        - const: zkr
> +          description:
> +            The standard Zkr entropy source extension as ratified in ver=
sion
> +            1.0 of RISC-V Cryptography Extensions Volume I specification.

So the topic of the seed CSR came up on the U-Boot ML in the last few
days:
https://lore.kernel.org/u-boot/20231107212431.GP6601@bill-the-cat
I think we need to document that having zkr in riscv,isa-extensions
means that the CSR is accessible at the privilege level to which that
devicetree has been provided.

--IXI5peX4j7nYK3nr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUuhugAKCRB4tDGHoIJi
0jq9AQCA7EiDhuy9EermqoTOWmWVVqY7W1Mxzc1nVYddhZ9YVAEA5v5PcwTZ0QpO
ppUXycCAScJGAc/3pFd+DuL0WqaXxAc=
=fV9h
-----END PGP SIGNATURE-----

--IXI5peX4j7nYK3nr--
