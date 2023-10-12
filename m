Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422C1C2B4;
	Thu, 12 Oct 2023 08:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSTyKbjJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25227C433C7;
	Thu, 12 Oct 2023 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697098896;
	bh=Gbx9yfCnmX9XPEWtA3eMET7ED2JBqtacGUNnM+M3sUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSTyKbjJSfkctBl/8rEzb6uSsYNnvHThaeZ65b1J2phjEEUdXBs63FfwoR4/T7ZgL
	 nyhJ6Upa6VjXMs2ucaqDRAUUepXE5tQAqAdlkyTpVTfx4T18BXHj5sEn/zsbNRLDLH
	 ZYbfqcntJd1n+Z4/oh5mgR0zje/yOS0K28y1LMqiX2EWMacsEZn1exsst57byvHu8u
	 vB3nTH9XTuwVbTRMuIkd+9WLqQIODGAWcnVISTavrfVCaVf7QK2T0m90Mv/Hy7b5Y7
	 zfokr+XUcLMDqy21mccRs902ed7naf1G7q/SJh8Rj8BKH64i6uWFQ/yYDw61ZM7aIq
	 A+Uz8ZoPF4wvw==
Date: Thu, 12 Oct 2023 09:21:31 +0100
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
Subject: Re: [PATCH v1 00/13] riscv: report more ISA extensions through
 hwprobe
Message-ID: <20231012-clanking-imagines-150a7c05f3f8@spud>
References: <20231011111438.909552-1-cleger@rivosinc.com>
 <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aGJy53Fkev1PgtWs"
Content-Disposition: inline
In-Reply-To: <11d6a463-4e00-4407-9d93-2f9d190c4be3@rivosinc.com>


--aGJy53Fkev1PgtWs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 09:15:46AM +0200, Cl=E9ment L=E9ger wrote:
> On second thought, maybe it would make more sense to squash all logical
> commits together (dt-bindings, hwporobe, etc) with all the ISA
> extensions in each. Tell me if you think it would be better.

I don't think there's anything wrong with the current approach.

--aGJy53Fkev1PgtWs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSesiwAKCRB4tDGHoIJi
0laUAPwI/1+B1oBExxGb6yOySNlV+rOwyauBbfAYtcc8BdmIfgD/SyUb8fpdpCva
Svh9QuookDdoT6A+W0p/GzyEYZwIUAI=
=rZ0m
-----END PGP SIGNATURE-----

--aGJy53Fkev1PgtWs--
