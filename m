Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA4F242D91
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 23:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762557332; cv=none; b=BVrKsv6+FUN4zIgHWgUd+OvIbArHYmHv6JVYNgtpf+NCLKHb71XbvPq1/qljwnnE5DzW85ONJcuGRZ/Uh8hHHHg09W+tRIhEgYhDkzhAGnRughMY5p8gQ8Zkvy2E+QHuV7iLo1GJHcDSip4KOgECe4ccm/HoV+xQ0C3WFt0OhB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762557332; c=relaxed/simple;
	bh=1CNW2q7rZ5eZ1hQ3d6f/0/8aleciBSs32cCPnD55gF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzN4MdjwBhPAad28SCLptdkLaBf52rDtbVHUTH54ZId0MDoLNJwsR1wHe1LpwmYiDg2Wb6gtw9uEo22BH+HbJHCJXdO/F0L3qKA+6d1jS4IfqyLrwTud/O0SzjqUCYz4ABxvcZBMQwuXZpRAM9t1NcTKDWZHTPU6CQp/tLXKRgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4VWJLrg; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4VWJLrg"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295247a814bso15878365ad.0
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 15:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762557330; x=1763162130; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lm3n9qHPKakGyAJDHeR9T+11dprM9YeXc2RscwPCjOI=;
        b=K4VWJLrgxSLsrRxVFAvj4UQ/OmcgvXFJP+pej5FUCoPjrEXmdEjbDvuWhb/JVn11n9
         +PLR1af8fB4dglUN8rNKKYY7g/hguu4zkRXm470sME+BGnMUAGAU47OEYPemX/jHFVeX
         pHTlS31qERdmTm/YAWWtPmsq+G9uF/3p/Y0AbEqam4i8NdTFTX+KlJcKPxye7IaYOSXK
         4T2FemmLRFn60Kwx0cWBWtb+F6g+r8wECL57ZaUwrsX0Ewi/ysA/IHDZPCin86Ifkcs/
         fxBS7l++hjcCBrypV4usqI4ibGp6fTqmvRERWZ6n8Mk6nt7mdRvZEiYviIycqe2ueihQ
         XFlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762557330; x=1763162130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lm3n9qHPKakGyAJDHeR9T+11dprM9YeXc2RscwPCjOI=;
        b=Nqzuc0f5WBp6Ev+4+rl3miTvNr0Rq2laqY+tSGdMOPnhD679Rc1aD+zgAk7/FIe3Cd
         VinWITOS7bNeoiRUmdS1/GEV+Fc+vRFpUfbLNTSiFlHqgpH9vSzC4AWrZT9+pFDVe+nR
         DDSovYyhEYSgDLxSsz/f+7kY290soVz93bKnUZJZjqW+l/JWsIUx3VGF+/WVX2yxCyck
         tyXcwDO2cNR4pKFbMSluhaTwCiB4PL/Y2Xkugi7XOjIY9SLiPlj8Q6aQCJWIjwm4z2D0
         BuyR2IUpcjZ3Ec/qqTYgoumTZCZfk3Pm7tGHGlfEvmDot87sSW/nVTLCfQ8SN14bOB91
         Djbw==
X-Forwarded-Encrypted: i=1; AJvYcCVAYLv8O88bqbUvoUJ7mtdNAcIzQQdDLx3tadidoTXBqc4IoI7BfEuOX0iGjBa+7y2IRTgx+9FMCMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI7K0lJTH70O7aEX+23ciEde7W4TZ8WbaaIKxeYZIKDKb+CKsn
	L51n+aS1LfE04U4GY/1zCAk/W1bv/zinEcf2w7VR+k4YaDK96VnfxQML
X-Gm-Gg: ASbGnctwC19e6V73W0ImTq0AaQ92RRRk6OSz45w6MmOA4lS4WH8nERFxuQsuqvf+b0a
	dJ4T+gPkELx0rQKz6zSS+R+WY3aRpGfERRUkeZiD8jUNZdhRrd9Bv483EakD75BBq8X5pr8oAXA
	rTL2AbodxJ3g5EyLBvfq4+40a8Dmdw1NuT/Ym28XecM89S04LI7Qwl3L1EJ/BDLvAEr/awVxuIO
	Y7PKW0KKzKNzwwkBI6zzsJHHwTclRwuTYL6bA3NaNFYUcLF7LZ8GsyHJkk9KGDW2piUPqepV0la
	nQzAYF1U8zBD4MxUBChPx6WR55HBVBuFSCc6fnV3U8Z673W4GtUEY+9IJf9dNqweTx6axFJ9FpY
	ELMgaLV34jKAP5YEOQ7otlnkZcdh4qylZ7XsydizlmiraxUGuwDPARJfhZU3Su4Tffi4MIiKA70
	XAkisSYox/hng=
X-Google-Smtp-Source: AGHT+IGED60LsdNHAG47E5ek+vWqvgFmd56J6anEw/IyiassMDG+ECL/tyhoZhYvdVdrJbsIiOQYEg==
X-Received: by 2002:a17:902:e888:b0:295:1a5b:f406 with SMTP id d9443c01a7336-297e564f99emr8849895ad.25.1762557329690;
        Fri, 07 Nov 2025 15:15:29 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca4257sm70259405ad.95.2025.11.07.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 15:15:28 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 88957423BF1E; Sat, 08 Nov 2025 06:15:26 +0700 (WIB)
Date: Sat, 8 Nov 2025 06:15:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2 0/2] genpt documentation fixes
Message-ID: <aQ59jnOE3pFyZPkn@archie.me>
References: <20251107081300.13033-2-bagasdotme@gmail.com>
 <49ff6f64-b664-4628-af2a-1b46e0fd62ad@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="haSgLIvfV15aCdif"
Content-Disposition: inline
In-Reply-To: <49ff6f64-b664-4628-af2a-1b46e0fd62ad@infradead.org>


--haSgLIvfV15aCdif
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2025 at 11:16:36AM -0800, Randy Dunlap wrote:
>=20
>=20
> On 11/7/25 12:12 AM, Bagas Sanjaya wrote:
> > Changes since v1 [2]:
> >=20
> >   - s/to set/to read/ (Randy)
>=20
> That's not quite what I said (wrote):
>=20
> > @@ -354,6 +354,7 @@ static inline unsigned int pt_max_sw_bit(struct pt_=
common *common);
> >  /**
> >   * pt_test_sw_bit_acquire() - Read a software bit in an item
> >   * @pts: Entry to set
> > + * @bitnr: Bit to set
>=20
> | Shouldn't both of these (above) to "to read" instead of "to set"?
>=20
>=20
>=20
> No changes to pt_set_sw_bit_release() [which should say "to set" in 2 pla=
ces].
>=20

Oops, I misunderstood the review. Will send the fixup shortly.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--haSgLIvfV15aCdif
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQ59iAAKCRD2uYlJVVFO
o2mPAQCtbCENoydVvPLZcPrSmiIrDBqFuvWPN0Kq1nC14RV9iwD+KCZacoHSjhsN
O6Z8k1VhZ8ialSR19Dwm+CelyQbgTgI=
=3f7R
-----END PGP SIGNATURE-----

--haSgLIvfV15aCdif--
