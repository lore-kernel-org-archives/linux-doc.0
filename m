Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DE201017
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 12:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407986; cv=none; b=mdkzjV/HMtncJKdMNSyEyJtzP2+7pDgyfchySWL2b5iq4RApJ292ir8KtPaVSIwH2tHWvAxI0GuT12gZs2vH1aqaQ4q6Jy28wQu21CTOIm6P9WgaqF9UQn9wUjK7My1KiHcutYJp7fex1wnNrXOI4qIQSbM+xWFjjr5zLcCdysc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407986; c=relaxed/simple;
	bh=+bbTmTeJrbH2xlAiB/U0JLeNHYnTVQWrm3zchBlFfnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DP6AdTt1UtK38b+dNvxv0i57iKIGv8WrB6K8jDvwyHbwHSVTJ8XOLkXII7RSid1nRKKsTGnieirUo2iGnnQj+vXLu10R7FRo8Qf3JW63QQK3nZhjWHwRVlXjf/iTzl4tEMKhGcw4Yt83fMPUFi1WRLnVUakto0YLVxG7eoFo3yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZkYpdf+; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZkYpdf+"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7811fa91774so863124b3a.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 05:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759407985; x=1760012785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+bbTmTeJrbH2xlAiB/U0JLeNHYnTVQWrm3zchBlFfnI=;
        b=AZkYpdf+OyU9uES/heN8Vrc6Cr8qpI8+/p0LWgwc4m00I8ieaZHElsoIbe70IPorBs
         v3aO2IpfRdTSaM+PDTV/Km1ECRVyH1trR2V+JhLJcKigVUZJnz2UgNHuiGT6sfGTvwgg
         uPFNAoPik22bHgDXNmqmn/MExL626WCNt2y1277lZYG02VjNwf/IRVpwNurZLb0FM7mh
         Q7qFHvD3eLG3GVNcqS4gRwlsWoQB2WN4BFKBsqeinasj73O1OIJiNT5uP6RuW/zb3qzd
         E1zb09LMAvbB5VqeoOqQEAUie75NoBLHsN7vZ0FBUF2P9ynCZ5dE0JPsU98Vysf5JkTf
         Q4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759407985; x=1760012785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+bbTmTeJrbH2xlAiB/U0JLeNHYnTVQWrm3zchBlFfnI=;
        b=a5reSJISr8KHyOnu/Qtgnt9UKprAIqqpWC4M4yrTmS2GruexkDNBRd0auZzcD5bBjI
         NzcvnCyoKgw24mThc8kLMFmdpoO+xJUU486UbGQ+OBN4QY9RkXQXRq4lcf3diT0O4oIa
         YmxpINhfUCIU0ybEAMg7sHhKiQuKtTMHbZgS9HDlz5fGXbz15yW04m9meFhuVfu7apAy
         Oso/KmJWlI6Rpkg3FIOGBd6a7KlV+EA7scNQHemWiu0/x1/z9uLjU7R1SSsscdM0mt3H
         VSckBA6UWMzXr2bBFb+4zcV+kG42V9SghURHrh42WdwkvILSlpfQGtD4xjoanpZRUayb
         JdIA==
X-Forwarded-Encrypted: i=1; AJvYcCU5U4dyrxIb2cU//zvyyVsse8wuN7L4bVo4OvJ/HSsNGN7dqkcqVKjaQXO7sszO8/HjrLTgx69ThDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxL6qSGAJD+1eBt1hLmgDU+mzJsQyL6x2EoWncnnGDu4bnru5k8
	8Uk7z2q2pJ2vEtksQmvG56GLlSvdkn12MQxdMdU3fNYcjCTKebPvf7oErTu2Wha0
X-Gm-Gg: ASbGnctRdwsE9GjQIe5qTKDMdMBK3davveNIJ+N3DsEZYrAsFMpwIrr53JwjBWReWqY
	v4WpWDsD/DFc/OlFgGMFEpYbkafm8aH2oltohczXsMUVNIsuVKKRtb1o6ZYek5BN5umL5j+DwV0
	AR/ZWFM5jdAxoCDYBOM0kIs04lrYCfwxVNfPh1YWw2Vl4xAhIJtcfP5Ls3yy5N6kQf9YZlaJwWd
	nE8iw80KrZUqA3goqJ+rW3U+rPGTHkYnTvSCwMbc/ynQWJPr41NRcoDnkxnFloHwK7tdoW6ZSzG
	rSuQcOkqBXV8nmUI45y1DGvmBgu38jig031vJWlGRHSjq8ptcaaNuy8pB90fCXVKPo2r3saFFxF
	vEf//KKdCvovA/+tt/Ft3Ntnw3i6iJ6+SrBDvCRvV+TsmYT5/gSv58rkGtly7
X-Google-Smtp-Source: AGHT+IFYGmo8/AnV65yu7iz/IwL9M9uNbwaMa2iqfXcXj4AuVD2vGfyvCEefUR3kFeiLUbj8UDI0ow==
X-Received: by 2002:a05:6a21:3399:b0:2f5:6466:af1e with SMTP id adf61e73a8af0-321d90cce48mr9974190637.12.1759407984500;
        Thu, 02 Oct 2025 05:26:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b02053957sm2134677b3a.57.2025.10.02.05.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:26:23 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id F19CD424C03A; Thu, 02 Oct 2025 19:26:19 +0700 (WIB)
Date: Thu, 2 Oct 2025 19:26:19 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Matthew Wilcox <willy@infradead.org>,
	Mr Tourist <zakiuddin321@gmail.com>
Cc: rdunlap@infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for
 clarity
Message-ID: <aN5va1WrQshjVWXe@archie.me>
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
 <aN3RjymBjn_VfcLe@casper.infradead.org>
 <CAOXP31FT7cZ79gAH-yOb+E8UX5sNnztL_rwjn_x-aLHdefjk9Q@mail.gmail.com>
 <aN5uu-yJZQiORUEL@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iIfencpJ5/iwWDRt"
Content-Disposition: inline
In-Reply-To: <aN5uu-yJZQiORUEL@casper.infradead.org>


--iIfencpJ5/iwWDRt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 02, 2025 at 01:23:23PM +0100, Matthew Wilcox wrote:
> On Thu, Oct 02, 2025 at 09:46:26AM +0530, Mr Tourist wrote:
> > Thanks for the review and comments provided Matthew and Randy,
> >=20
> > I have addressed the comments shared and have attached the updated patch
> > over the email.
>=20
> No, send the patch inline.
>=20
> Also generate the patch relative to what is currently in the tree,
> not relative to the last patch you sent.
>=20

tl;dr: see Documentation/process/submitting-patches.rst.

--=20
An old man doll... just what I always wanted! - Clara

--iIfencpJ5/iwWDRt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaN5vaAAKCRD2uYlJVVFO
oz5TAQDMj0QiF2FrcznmuSX4lpVtbRgcgwRvwxyjoVpbR7IPGgEAxGUNWOjsClyu
j1yNHtc6/RxTHiGE3ReBNKVc3RNshQI=
=+xaU
-----END PGP SIGNATURE-----

--iIfencpJ5/iwWDRt--
