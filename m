Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEECEFC0A;
	Thu,  9 Nov 2023 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="lmfL/xfV"
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5224E1716;
	Wed,  8 Nov 2023 23:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1699516486; x=1731052486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4pPfBmiUINhRoPJo2eY11blRCwfArWzDBp253sWlEgM=;
  b=lmfL/xfVbi/FgjXF15FlM9eSRO6rBqoTuUQ1RwH1VPBmIgKFBIN5a6+p
   dhtqBiW5BSEAPC5isoXJewBCe/nikxsx28nh82Rh1ByOWESasXcBW78KH
   Haz8plwoLjIoOmASDkShf1afE860a50Tv0i3VTlEXMgps2WUnR0ShJUKs
   QrAdaYlqSvKrX+dZB167+MBpqMpMbID2q8P51GJmt/r+mjhynp7GU0lOD
   l1F4NS90rF+odv876hBsY6tiDHQznYgCRn2hyl9p4c2qY6N5ej0nhZKRF
   t37SRElhaGDD1X/eMseLy2eGJ4Ez33IsfpOQYGPvI6L/PHkPZhGhp9YJd
   g==;
X-CSE-ConnectionGUID: se6pjHG5SuelUARNIWzFMg==
X-CSE-MsgGUID: vlGbOKuDThK6JpzYW9mFPQ==
X-ThreatScanner-Verdict: Negative
X-IronPort-AV: E=Sophos;i="6.03,288,1694761200"; 
   d="asc'?scan'208";a="12060742"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Nov 2023 00:54:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 9 Nov 2023 00:54:35 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 9 Nov 2023 00:54:32 -0700
Date: Thu, 9 Nov 2023 07:54:07 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Jerry Shih <jerry.shih@sifive.com>
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
Message-ID: <20231109-prevalent-serrated-d40eb5f71236@wendy>
References: <20231107105556.517187-1-cleger@rivosinc.com>
 <20231107105556.517187-7-cleger@rivosinc.com>
 <5EF129A2-195B-4207-A2F6-DBA1FBB9F65D@sifive.com>
 <20231109-revolver-heat-9f4788c51bbf@wendy>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LUyl317BBN37OabN"
Content-Disposition: inline
In-Reply-To: <20231109-revolver-heat-9f4788c51bbf@wendy>

--LUyl317BBN37OabN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 09, 2023 at 07:44:46AM +0000, Conor Dooley wrote:
> On Thu, Nov 09, 2023 at 10:58:41AM +0800, Jerry Shih wrote:
> > On Nov 7, 2023, at 18:55, Cl=E9ment L=E9ger <cleger@rivosinc.com> wrote:
> > > +static const unsigned int riscv_zvknhb_exts[] =3D {
> > > +	RISCV_ISA_EXT_ZVKNHA
> > > +};
> > > +
> >=20
> > > +	__RISCV_ISA_EXT_SUPERSET(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_zvknhb=
_exts),
> > > +	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
> >=20
> > The Zvknha and Zvknhb are exclusive. It's not the superset relationship.
> >=20
> > Please check:
> > https://github.com/riscv/riscv-crypto/issues/364#issuecomment-1726782096
>=20
> You got a response to this on the previous version, but didn't engage
> with it:
> https://lore.kernel.org/all/c64d9ddb-edbd-4c8f-b56f-1b90d82100b7@rivosinc=
=2Ecom/#t

Ahh, I now see what that happened. Your mailer is broken and puts the
message-id of what you are replying to in the In-Reply-To and Reply-To
headers. The former is correct, the latter is bogus & means you don't even
get delivered the response.

--LUyl317BBN37OabN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZUyQHwAKCRB4tDGHoIJi
0nowAP0W6kYqZfjp8aXoOoQXmmbdkMNZc5Iz55LCZY1/uNSHywD9EzrcQKDZ70d+
CQXwkQCx/EhZ3XtYSRbz+3Q65lor3gQ=
=zJio
-----END PGP SIGNATURE-----

--LUyl317BBN37OabN--
