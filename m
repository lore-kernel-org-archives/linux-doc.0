Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AF30335;
	Wed,  8 Nov 2023 15:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YngC7mUw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC2AC433C7;
	Wed,  8 Nov 2023 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699456668;
	bh=1ZBrzJ0Yznlim0qZbdAj4CfZrk/uA/K/HqKlFtH0340=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YngC7mUwJDFbFuh2azAzFrxI0s1/wo1MDg1tK6txBSU79loH3Mru2lwziqtYhOnz3
	 At5AUzufWE1EM2IPbRmlh1xJdRBGEJT0jkjhlL5v+g38IsKtFbv1bxbmGdSkjdXzIh
	 wyM4BYTFTF3o/k9bphvWkH4sq/hoEd4F6kxNC6xLsp8YJxAYeuhxzW2Vo8LSWnkqIm
	 poukWmBQjAhmiRd+hz7LKbd5aevR14HZP6DEQP71JrOAnpxHoIHc2nqKgR7I4w6rE1
	 ekMesWrgHEQjwswlu/1a1S1MGQcQhXwMto6H0uWovfdVOfQrV2Q0LG+zlWSR4jD5RZ
	 dMETWwJFs7kkA==
Date: Wed, 8 Nov 2023 15:17:43 +0000
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 03/20] riscv: add ISA extension parsing for scalar
 crypto
Message-ID: <20231108-mystify-marshland-0e35c4524899@spud>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-4-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="K8uJBevj2aI55aCy"
Content-Disposition: inline
In-Reply-To: <20231107105556.517187-4-cleger@rivosinc.com>


--K8uJBevj2aI55aCy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 07, 2023 at 11:55:39AM +0100, Cl=E9ment L=E9ger wrote:
> From: Evan Green <evan@rivosinc.com>
>=20
> The Scalar Crypto specification defines Zk as a shorthand for the
> Zkn, Zkr and Zkt extensions. The same follows for both Zkn, Zks and Zbk,
> which are all shorthands for various other extensions. The detailed
> breakdown can be found in their dt-binding entries.
>=20
> Since Zkn also implies the Zbkb, Zbkc and Zbkx extensions, simply passing
> "zk" through a DT should enable all of Zbkb, Zbkc, Zbkx, Zkn, Zkr and Zkt.
> For example, setting the "riscv,isa" DT property to "rv64imafdc_zk"
> should generate the following cpuinfo output:
> "rv64imafdc_zicntr_zicsr_zifencei_zihpm_zbkb_zbkc_zbkx_zknd_zkne_zknh_zkr=
_zkt"
>=20
> riscv_isa_ext_data grows a pair of new members, to permit setting the
> relevant bits for "bundled" extensions, both while parsing the ISA string
> and the new dedicated extension properties.
>=20
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Evan Green <evan@rivosinc.com>
> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>

> +static void __init match_isa_ext(const struct riscv_isa_ext_data *ext, c=
onst char *name,
> +				 const char *name_end, struct riscv_isainfo *isainfo)
> +{
> +	if ((name_end - name =3D=3D strlen(ext->name)) &&
> +	     !strncasecmp(name, ext->name, name_end - name)) {
> +		/*
> +		 * If this is a bundle, enable all the ISA extensions that
> +		 * comprise the bundle.
> +		 */
> +		if (ext->subset_ext_size) {
> +			for (int i =3D 0; i < ext->subset_ext_size; i++) {
> +				if (riscv_isa_extension_check(ext->subset_ext_ids[i]))
> +					set_bit(ext->subset_ext_ids[i], isainfo->isa);
> +			}
> +		}
> +

> +		if (riscv_isa_extension_check(ext->id))
> +			set_bit(ext->id, isainfo->isa);

Could you add a comment here please about how this is safe to do for the
bundle extensions?

Otherwise,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--K8uJBevj2aI55aCy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUumlgAKCRB4tDGHoIJi
0sLFAP9MVCdVD7MmVFLH6gGIQEZQqzI+aAsU4HQ1BTYh+ed1cQD/bxY92poS1KCt
K2tEapt7yzFeRtbG6p4k7yMhPuuzgQA=
=8mxz
-----END PGP SIGNATURE-----

--K8uJBevj2aI55aCy--
