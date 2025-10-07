Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7CD38DD8
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 02:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759803796; cv=none; b=LssfspEuAA59ZN9iz+Z79xeZ3g3FTLAYYVrlr7waulSu48YSVG8ZUdUuU30ptuhYIHrXm2aMTdLL+TuJ8eypZ5TXwbuAJuXUW70WqtV09mLqsQl48UXV9pcwnYHpnc97p9/ecpgmdi5Dsc6lCZsDVfgGPSLSTXUkWYYz2+wL0R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759803796; c=relaxed/simple;
	bh=VFmeDcTP2xUAQewFWw/R0BKl+XcGbbncNDnV2L/OXN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QbOywl/as7jALi5uGtvvbs9ofpkoW3edNc4aXfcJDrV1WCfjgwOR/rNA+ptTLh+DbAUnDPbSQxdihw1eFhd1eF9uKQ1UAx/FtG75RTRf4jmErHjPeKGEFpX4yHLI65GCgcHW6l4Od3d8vIe2MWIK1+qEbd5X1c+h/qbcxBWvrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dsUbabb6; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dsUbabb6"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3324fdfd54cso6608551a91.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Oct 2025 19:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759803795; x=1760408595; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmeDcTP2xUAQewFWw/R0BKl+XcGbbncNDnV2L/OXN0=;
        b=dsUbabb6l06KJXGCdPtZiVMtWdwnBLSbSQsM1Rk5pumQuR/OkOgFCKVg4GQxwFDGMS
         mBWrQKCqrj0pK+6jFR6HWD52gXGSAgL2LOl6TDduNamn6NH8S18yyAaYDZlfizrvjU40
         1xSrp3nibSL+PF29vEbKn8tRaB6MQRLYzBXZaUZz1JKRwySPFYH3wOY1HAD/NOUrRXdc
         tpcpSns+N2l7Ky5dPi8MQldx1qpyQPsF1Aql9UOrjo8B6MIvnlIKSsQ36tKBuhNNvxms
         tV1r9M+Mh8Z4wY90kX54phHFNpUHHHKv9WPb2eSucGx312kuwHLTT/pBGA8a8q7p13g/
         OR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759803795; x=1760408595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFmeDcTP2xUAQewFWw/R0BKl+XcGbbncNDnV2L/OXN0=;
        b=lpIaSLLti/YqLHEha5Roml5V+Qn1NnoZJw/v/dSCpkPbPhMO3J3KmunGZm1nnQqTxz
         wCpCWhUx/j6N/4MFad0+DXqtbRXnTNfIQiTcPhz6FHK1NaLEjaBygAtojfCeV459Ci3d
         0waaAU95n6UR0NqEV96om6EubOs/xAyqj2s7ZtE9zemWSv43vdxKkdOQY3BjNgwaYpEW
         5OenU4VZS2Rtii6+UJWWFOSaeACGGSqGTB0CBAeTXG8IyOsKJVXCnXuBGvb04S5ulEoZ
         4w+LIOyo91FLu6p+Gg2fDWbz8JUAp837CM01K4s0IApj0Jf7mM18Wiv+N9bFQeOBYwR0
         F2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkT+Qg0zxXJVXujRbxcsjhp3bykWOpC30YJelYsurZGVCPmwzYr/JFTUUGSLYfOoSW2xhEmhX8tUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7O/PtrJyLgUrTkX0Eas6W+WPBZT94vjQYQjXR3MA9S3N2ebx
	JVk0fo9f28WuuVZsmduF61zxjXnMo2Fsrb71RMvf7ayj0+hq8yAgVOyx
X-Gm-Gg: ASbGncsxyl2zQeJNKbRLGanx/KNjv0YyE3GFmlN7PwTmuzfWZkYn0V3I0V+M6lAyTx+
	W0ZsEEd5XpmJUeQ+hSpBGB03Wgk2wz8se3aFPmMnRrVo4EYyzCkDEBmUXhuZlNLzKSlgEgDNx9u
	etAChO1EanzLUBfHDV09jRegri4RD9qyyTLoOWHQ3oMK3pp8fD44eTH3A3lPRRKR2kZy3lzQ6QE
	Mru43jqqrE86Z8JuwJgaUdJXpTWkyh2aRpjx4pr3xxnzPFjPK6khbKUQaIfFetseThYr+3CqC4B
	NtxQOCYWqHkod6gvpTuuyl6CygSDspy8jcSxuZjoMNYdT9LV7m2BXEykGvvVXSirSWrvF812TEs
	7lavTLejB/rHKiY6VhUG4vAkAGYN/Biu2Dy6CaM2dF5zTo70uMA==
X-Google-Smtp-Source: AGHT+IFOWjODpkm0RXk0UNQxPxlDwgwSSLwVcoAanx1LQC/FF/GVJT5hQh4wQ4RD5szE0at/zJ+BUA==
X-Received: by 2002:a17:90b:4a84:b0:32b:ab04:291e with SMTP id 98e67ed59e1d1-339c279971dmr17239314a91.25.1759803794482;
        Mon, 06 Oct 2025 19:23:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a6ff26f8sm18166635a91.13.2025.10.06.19.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 19:23:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 8DC154233432; Tue, 07 Oct 2025 09:23:10 +0700 (WIB)
Date: Tue, 7 Oct 2025 09:23:10 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Roman Kisel <romank@linux.microsoft.com>, arnd@arndb.de, bp@alien8.de,
	corbet@lwn.net, dave.hansen@linux.intel.com, decui@microsoft.com,
	haiyangz@microsoft.com, hpa@zytor.com, kys@microsoft.com,
	mikelley@microsoft.com, mingo@redhat.com, tglx@linutronix.de,
	Tianyu.Lan@microsoft.com, wei.liu@kernel.org, x86@kernel.org,
	linux-hyperv@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Cc: benhill@microsoft.com, bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next v6 01/17] Documentation: hyperv: Confidential
 VMBus
Message-ID: <aOR5juzHnsK2E40z@archie.me>
References: <20251003222710.6257-1-romank@linux.microsoft.com>
 <20251003222710.6257-2-romank@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BxWMTnibnAgGT5v9"
Content-Disposition: inline
In-Reply-To: <20251003222710.6257-2-romank@linux.microsoft.com>


--BxWMTnibnAgGT5v9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 03, 2025 at 03:26:54PM -0700, Roman Kisel wrote:
> +The data is transferred directly between the VM and a vPCI device (a.k.a.
> +a PCI pass-thru device, see :doc:`vpci`) that is directly assigned to VT=
L2
> +and that supports encrypted memory. In such a case, neither the host par=
tition

Nit: You can also write the cross-reference simply as vpci.rst.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--BxWMTnibnAgGT5v9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOR5fQAKCRD2uYlJVVFO
o7mVAP9gyGXv/aQVGaS5iH1wf6rUETBzEy69Mg8TYKRf5l2JsQEA5cnv0cPiT81i
pUA3Vos9PED8kntZHhKYkra64woP1wo=
=xXE5
-----END PGP SIGNATURE-----

--BxWMTnibnAgGT5v9--
