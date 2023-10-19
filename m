Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACBF17985;
	Thu, 19 Oct 2023 10:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eK1Xp6sF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF24C433C7;
	Thu, 19 Oct 2023 10:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697711057;
	bh=8w/zkHRa1JdAqlwq/E0kRF19C4ENGGq0dlrO06vTgUQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eK1Xp6sFnz1B6gliEaZ+xBeCJf1peb9IMNOhrsL4RWq+dnvbEfuuC2dsJk/JRRkXM
	 J3ZkFfUpKW4V5Vd7PCpdXcGP3ZN0OCHdeGIWhNBkfTBlxN+CFqPazcwS9gJ6H7w2DQ
	 ovFyEaelYdJh9ij0CwFsJXmMpZ2jZVgkvvxfUpyp73ptRTAneUOMqEjsA1ukabD6rd
	 vwhSOg/c5khxXZ24UZ2iXryyq1gWZcZst41KXM57jeVjBWmmfB/iyJZzra+VrN+J1q
	 wo91KM3ZtTml7zOAIxrJ3M9F3zqBX/plEF85/b19XJo/0XoIbvKA/JtA2OEgGPaqBS
	 R3M9RKhLdYPLQ==
Date: Thu, 19 Oct 2023 11:24:11 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Evan Green <evan@rivosinc.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: Re: [PATCH v2 01/19] riscv: hwprobe: factorize hwprobe ISA extension
 reporting
Message-ID: <20231019-smith-purging-627c50cfa3de@spud>
References: <20231017131456.2053396-1-cleger@rivosinc.com>
 <20231017131456.2053396-2-cleger@rivosinc.com>
 <CALs-HssL=wNwj9nRuZwpZhy1CB9p9-X=OqgwBw9zvgA7hA4fEg@mail.gmail.com>
 <20231018-scrap-bankable-a0f321d97a46@spud>
 <20231018-flagpole-footpad-07a6228485f3@spud>
 <CALs-HsteDO0PvAKKQje7wU0f4z8w2V3f7WiHh5+LvQeVaSua1w@mail.gmail.com>
 <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MSxFgo6sxF0bjJRN"
Content-Disposition: inline
In-Reply-To: <0b2cbc89-7892-4c43-898c-03757eaaf3b7@rivosinc.com>


--MSxFgo6sxF0bjJRN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 11:46:51AM +0200, Cl=E9ment L=E9ger wrote:
> Indeed the comment was a bit misleading, is this more clear ?
>=20
> /*
>  * Only use CHECK_ISA_EXT() for extensions which are usable by
>  * userspace with respect to the kernel current configuration.
>  * For instance, ISA extensions that uses float operations

s/that uses/that use/

>  * should not be exposed when CONFIG_FPU is not set.

s/is not set/is not enabled/

But yeah, definitely more clear, thanks.

--MSxFgo6sxF0bjJRN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTEDywAKCRB4tDGHoIJi
0iLiAQCVvbdU9kMXk61P1KCsz7hQbLc/FDPWHPqbM77la819uAEAmKVIMjRr/pbZ
zKR82CM26DAk6y9VBR56NcHWjJucaA4=
=NmdN
-----END PGP SIGNATURE-----

--MSxFgo6sxF0bjJRN--
