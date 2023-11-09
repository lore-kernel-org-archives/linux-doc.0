Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44160DF58;
	Thu,  9 Nov 2023 07:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mgeMI91C"
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CE22728;
	Wed,  8 Nov 2023 23:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699515963; x=1731051963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WddjzKmX1Zq6Dft+Cb9D5Kh8Q0hR/VLguzB7s52lzCI=;
  b=mgeMI91CuMqUPNLtde11dcKl0t74MrZb7wMs5fSIBOnQWTe/wUJDfzdh
   LBaWVHI7R2ce1EQ9ZjtSmzWdy0CzI6p8HqYAVRbKgbuZgPRGzA+ArlJz2
   oWUgpt+DFKXnhr16uu5x30ErrsjnF2VjnDoXIO5OpcAZgOmo3iJw3NLSP
   LJDavQkhDDE6uj/xUOZXFD1quEm2IhI32sHXwoZCtqtLUMZqh5SJQBVg9
   XXmvKFL6RYWy3pVrs/NexM3wZ/2TUBILanSaZ2kMVjRWzUQ4MCs7cBfOL
   m8Zd9V1DenMWdmhooook6d8nQglfrBwbiEWHcSb805kOaoGPOKGfcW3h/
   Q==;
X-CSE-ConnectionGUID: pehoMMM4TryvWVfGDyAZqw==
X-CSE-MsgGUID: 3n9g/0hXRmuPAWEjx8nZJg==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="asc'?scan'208";a="11685389"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 00:46:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Nov 2023 00:45:14 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 9 Nov 2023 00:45:11 -0700
Date: Thu, 9 Nov 2023 07:44:46 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: <20231107105556.517187-7-cleger@rivosinc.com>
CC: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, Palmer Dabbelt
	<palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>, Conor Dooley <conor@kernel.org>, Samuel Ortiz
	<sameo@rivosinc.com>
Subject: Re: [PATCH v3 06/20] riscv: add ISA extension parsing for vector
 crypto
Message-ID: <20231109-revolver-heat-9f4788c51bbf@wendy>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VwNvAibrE2gl2ijU"
Content-Disposition: inline
In-Reply-To: <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>

--VwNvAibrE2gl2ijU
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
> On Nov 7, 2023, at 18:55, Cl=E9ment L=E9ger <cleger@rivosinc.com> wrote:
> > +static const unsigned int riscv_zvknhb_exts[] =3D {
> > +	RISCV_ISA_EXT_ZVKNHA
> > +};
> > +
>=20
> > +	__RISCV_ISA_EXT_SUPERSET(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_zvknhb_e=
xts),
> > +	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
>=20
> The Zvknha and Zvknhb are exclusive. It's not the superset relationship.
>=20
> Please check:
> https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096

You got a response to this on the previous version, but didn't engage
with it:
https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc.c=
om/#t

Cheers,
Conor.

--VwNvAibrE2gl2ijU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUyN7gAKCRB4tDGHoIJi
0q8nAP9IHpqexwos4DKWWgRyZoHjfrUhMvADJcOsVUZ9HQjsEgD/e0oPBIuq9/3N
9eHq7P5b8WbbyEX68ToKAUYvqmjg0Qw=
=9VcE
-----END PGP SIGNATURE-----

--VwNvAibrE2gl2ijU--
