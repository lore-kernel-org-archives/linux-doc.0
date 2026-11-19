Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119456;
	b=xcUJ6S5Ncd3mIAecjCDnJjHzoewU6e2409dTrdRDX2ciG20f8bwRf9eyDrwZRqlu0YSw
	 MbMt00Tr8EhTL/J6A+fGLxqSPpJc5ea+Z8o94kBXlylU6idTXrBccUNTh6yuHorWD8eFl
	 ooMaOs3ycG2t6CLBQPCA8UFMeGhVGy6JbmEq/q2BfGO5YnY6y3gGOVlfHLAlg0M63DLtA
	 STcZdPPR0ChCEMArCUgelqLRoznM+BRDmU1R+w+iasjKAws/WseE8aMGt11Qd4QV4t5Lm
	 vUFGVjPBMtekx7IoqGcLdnXLzQEUkri8Xpnf/VoFSdnTRvLbLoymx3n0IVjBuE/O4vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119456;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=XKumCsCaH0lj1dxSbsxBeXzvCOozfBVKXT4C1iY5aH8=;
	b=MXI4XaiN/VUlDZUt8ISK1Tj7lBJvzC4IlfISqOHepdJiXmr312TjBYT0yWJ/AOuYI3vg
	 yJDDADFZ+xVu2+Ad2SOAHYrgJ1vyUphOE7vOuGcPHIKAqaRE/k6ZqbmkDsY9pMOZ/oC0h
	 OEey1S/96pDA7VjP9UyJtgm9DXdJnrRnh5R70r1s2l3vZKdsnWJuEnuj0UGaa/uznmgp8
	 APW1RfO5cZVikWE3aMlILDRqE4Gl8CS7mEvG+pxEv4KSEg+vIMcD+Ti4c7FcPd9LBi6nt
	 XTaImtGDtrcjZvquD6tfgcL/SfV5GXipyYV39IDm2PNQkuIZN3YGf3KBrNTYh1f67WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAh2ouit;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0BC606A324;
	Thu, 19 Nov 2026 20:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HAh2ouit
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CAD61F000C0;
	Thu, 19 Nov 2026 20:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119455;
	bh=XKumCsCaH0lj1dxSbsxBeXzvCOozfBVKXT4C1iY5aH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HAh2ouitAFQ5kfBDvfqdyjrFEdUpe/89ciImmGG6bRtTXD28LE/6tX3z0CpBDECwR
	 fvwOEJ0v9jswcEXvtVPUySbrChR5BRJNGEInU0R6ysGxQJIj+3K1wqYWVZubGYVKfS
	 Qdu9je1lI2Nska9swcJGS8GER1FZkbzCK9z9ZxjLMEWA0AIa1nC0Ph1+R3cXLy45bw
	 ophWAN5UvLq59KrH2tIcI4ZPOLs5xLeaninEu59x9+3o34UYMsz4wlIqRxQIJMtBmS
	 wSDkVRbPR2uXZE05bNgXYjyFcOi/SXcId8Sukj7u7GRUju6WgVKR03XHcuOmVWz70a
	 F7hpN17wqmM8Q==
Date: Thu, 19 Nov 2026 20:17:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: arm64: Document booting requirements for POE
 at EL0
Message-ID: <4a860ab6-c43b-4ed5-b4b3-d831bd15b7f1@sirena.org.uk>
References: <20261119-poe_booting_rst-v1-0-bbae0ab68498@arm.com>
 <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wlnQNiizsQKfjQKB"
Content-Disposition: inline
In-Reply-To: <20261119-poe_booting_rst-v1-2-bbae0ab68498@arm.com>
X-Cookie: I'm into SOFTWARE!


--wlnQNiizsQKfjQKB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 19, 2026 at 06:02:43PM +0000, Kevin Brodsky wrote:
> Add missing boot requirements for the kernel to enable FEAT_S1POE at
> EL0 (POE is currently unused at EL1). SCR_EL3.PIEn controls trapping
> for both PIE and POE registers.

> +  For CPUs with the Stage 1 Permission Overlay Extension feature (FEAT_S1POE):
> +
> +  - If EL3 is present:
> +
> +    - SCR_EL3.PIEn (bit 45) must be initialised to 0b1.
> +
> +  - If the kernel is entered at EL1 and EL2 is present:
> +
> +    - HFGRTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
> +
> +    - HFGWTR_EL2.nPOR_EL0 (bit 59) must be initialised to 0b1.
> +

Looks like everything I'd expect is covered:

Reviewed-by: Mark Brown <broonie@kernel.org>

--wlnQNiizsQKfjQKB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/WVoACgkQJNaLcl1U
h9ARDQf/cOmSUTuflIn3yOghuYacUiaUjwsZFmbPD/VKABjZujTKky8uaLd4EVWv
LppAEajdN6b55IEpLqB2VD63ct3lnse7qMLb+4vhjDB660t1OGM3cHbA/Qckgqdq
yyTKqqxhIxTKYJltSnN+StsU+94avJKp51zteYqFMV08O+jkHA7VJidBYHVahHSU
7IqEJQ9eXgcJR1xwl+PtJCzv6yUQ8Z1CLwD1eE0H/BHDqtFPFIuh72BGycdHSgDy
6+EOoytYdv8lbwRFqeKHQVY5Phe8SbEkp/cw3okfO2RpxjQN+ialT4PJmL4BYdfg
s+1hiKAxyGIGl6g8QtMLH+CKkwUDfA==
=+P7h
-----END PGP SIGNATURE-----

--wlnQNiizsQKfjQKB--
