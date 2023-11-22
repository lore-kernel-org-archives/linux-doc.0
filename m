Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87E5786A;
	Wed, 22 Nov 2023 16:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HXlrH0UO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F2F9C433C8;
	Wed, 22 Nov 2023 16:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700669813;
	bh=gnjtMK4pS8juI0a9kdN4S8I0WN77dg3aOR53D/91PXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HXlrH0UO3dELezbaZOre2DyRuj73aehtvV66h0GzMuxPdyCr4QrlP19Co3jWchB1n
	 g3Zqir7OXoapnd8pFPjFdwVLpR8tKUGNpjcyPZ9B8+wmrdFc4946kzyIJ6HIk3b6W3
	 XtPuD2TC54Aw31pYBdLYPnL2DZzj01R4FlcafROoJ9M7bK7JUXXxpfQUWlwrP/4moC
	 hcytvBKK6xfoakbMmCAGG27jocAQp9DXh7Qgtrb0eOJspbz+uQFOoKCR/C/hmBoHeY
	 rcS3OQoeD1vjCrMip05pjXFZxrA5kE5wnpcPQy/07w5lZ7z2XImgdFEv0NimH4o74G
	 jynTOPEGlGl1A==
Date: Wed, 22 Nov 2023 16:16:48 +0000
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
Subject: Re: [PATCH v4 00/20] riscv: report more ISA extensions through
 hwprobe
Message-ID: <20231122-detection-antler-124b9460e893@spud>
References: <20231114141256.126749-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U/2uIv7Yhb2wSwUv"
Content-Disposition: inline
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>


--U/2uIv7Yhb2wSwUv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 14, 2023 at 09:12:36AM -0500, Cl=E9ment L=E9ger wrote:
> Changes in V4:
>  - Add a text specifying that Zkr string dt binding means that the CSR
>    provided by Zkr are accessible only by the privilege level to which
> the device-tree has been provided.

This text don't match what the change was. Here you say "only", but the
binding has the IMO correct wording, with "only" removed.


--U/2uIv7Yhb2wSwUv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZV4pcAAKCRB4tDGHoIJi
0rUqAP0dwQyCCmdgf5TjCz0Femc8nr1+zCexAneYj8slpm6vggEAuiD6EdxWLRpq
ndEmecDSWnY8Blrjc3NQy8JdQcNxPQA=
=jqFD
-----END PGP SIGNATURE-----

--U/2uIv7Yhb2wSwUv--
