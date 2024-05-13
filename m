Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64937147C91
	for <linux-doc@vger.kernel.org>; Mon, 13 May 2024 09:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594019; cv=none; b=r3QaRxW8TLgLE4qiKSX6udMasOO64Ha/hpcxklEovMJhoI/1D7NhbmPwmtJH4D1BYtRM3ZjZ67nnSzWut2ECC6f6AuTs2gJM99hSYsrnstS6CQCe7njS/TaEtEEsjPjiky2Enyvv2s0Tuo+FUPOdqAKOA2HFULA/ZZNaqraFqOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594019; c=relaxed/simple;
	bh=i/en6ZbB6UMSBD/Cgy4DMjGCvdTj4Mlfrkn+r4+YUuU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7HqODy1WKYa9QnYgQI7g7xsdIC/kW4bKFb2oJCK5jhA6iZLRyt7h+qK66PNO0EnprCnBA9PJAPsiqIdYj3JRsAyZQugwCfZsjtYYI4jD65iVFaEHOpYT4xDkBXUnCbEzHqDhOHww37zCp62Xa2rEJXYmOS4Jzxrqwp6bc8g8eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=gT1ZEMVL; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="gT1ZEMVL"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1715594013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U9d5yV7RZnKbQ+yrwoHvT7lsW0ahTL+XkZW4PkQbYqs=;
	b=gT1ZEMVLALmH0lcTb1NDBminwgifQSVL7rNA8tvK5wPlofnuzfvs5vNUvJS13VSktqDy+m
	qR93dzZ0zIIRIBdO12gP42aWzLvCgZ/Z2MusuabNBBn/+ZvYzs9dQ/8ZyV19EI/KP5HUyR
	HZziVhpb/3SgS+u8t9Qc4R9OZIN5pFDsWD6hd4X/DadOJkNENuK9y6rMYiFJV0/zDZI4bi
	QySrh/Mp7k5F+I3mM/qiCGjhs9AbIvGqE8pJqwzpElrXl3HsKBoNSbeeLKmV6jwNZvVDf4
	UXdixBFj2KE4ySHO4oz7vuFkDyqWkxxqK5nu4bZspZCf24I7JOoT4iOtHUtCFw==
From: Diederik de Haas <didi.debian@cknow.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
Subject: Re: checkpatch doc suggestion
Date: Mon, 13 May 2024 11:53:29 +0200
Message-ID: <2161177.vmPJLRX1GE@bagend>
Organization: Connecting Knowledge
In-Reply-To: <be8b3af7-18bf-4bc4-9951-413d6bfb6796@gmail.com>
References:
 <2996994.g7u86YH9XO@bagend> <be8b3af7-18bf-4bc4-9951-413d6bfb6796@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2237044.IkSnUXpV0p";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-Migadu-Flow: FLOW_OUT

--nextPart2237044.IkSnUXpV0p
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Diederik de Haas <didi.debian@cknow.org>
To: Akira Yokosawa <akiyks@gmail.com>
Subject: Re: checkpatch doc suggestion
Date: Mon, 13 May 2024 11:53:29 +0200
Message-ID: <2161177.vmPJLRX1GE@bagend>
Organization: Connecting Knowledge
In-Reply-To: <be8b3af7-18bf-4bc4-9951-413d6bfb6796@gmail.com>
MIME-Version: 1.0

On Monday, 13 May 2024 07:08:55 CEST Akira Yokosawa wrote:
> > Thanks to your hint and some experimentation, I managed to add id
> > attributes to the various ``dl`` elements and can directly reference the
> > tags :-)
> > 
> > But I noticed 2 things in the generated HTML documentation:
> > 1) The id attributes are all lowercase, regardless of how I defined them
> > in ``checkpatch.rst``
> > 2) The underscores (``_``) have been replaced with dashes (``-``)
> > 
> > So instead of linking to checkpatch.html#BAD_FIXES_TAG I have to link to
> > checkpatch.html#bad-fixes-tag. I was hoping that I could get the literal
> > tags names (including underscores and uppercase letters) as id attribute.
> > 
> > Is something rst/sphinx always does or did I do something wrong?
> 
> For authoritative info, I'd suggest consulting the reST reference for
> "Hyperlink Targets" at:
>    
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlin
> k-targets
> 
> and "Hyperlink References" at:
>    
> https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#hyperlin
> k-references
> 
> , and other related sections therein.

https://docutils.sourceforge.io/docs/ref/rst/directives.html#identifier-normalization
taught me the reason why those conversions happened, so I'll use the
normalized version in my patch submission as well so that there's a 1-on-1
match between the source and the generated id attribute in the html docs.

> HTH, Akira

It sure did, thanks!

Cheers,
  Diederik
--nextPart2237044.IkSnUXpV0p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZkHjGQAKCRDXblvOeH7b
bigfAQDz2RPz4e76+frBkoUFowvqeLqTgngokD+IjsjUE9E3DQD+P7GrfORSzqwI
x37bPWJeI+YewUR21K7MX7hyNgFWowI=
=8ivY
-----END PGP SIGNATURE-----

--nextPart2237044.IkSnUXpV0p--



