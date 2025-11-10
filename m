Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1720242D78
	for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 23:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762817920; cv=none; b=aLQWW46Xx3MiOWM9oq5tK+cY5cnXCp+ZRIbqZoqc/Ij7HW9LJmDx9AelaX8JTO8CB+65r0oHPlGDc0WRUlp8DbzDZjJkYXsxR7NDioND8i3ToCbOe9QhokhYoCx6BqtPfISyPnbVQ2MRmV89SmU3PspaUvQEAn/URNg1XoWnp5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762817920; c=relaxed/simple;
	bh=1BkOzUxSSedtqRPqjCFUt6WI3IiHiKYSTgbLQupojII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsMYxvIC6WhWbgHSLjkt70ZzejNXYCECkQzP8Zmrc+ZR+VS/NmglnGPypW4g67rbXtOyzrTn8vxkTRg3hGk3uByqntdjFyJLuz0D24vnpj9WkaI4eVwTDXYaCfHfinudMFGhqkun1yXnKODXZRHBwbc6oWgJsRZioblGYJfJc0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvXUmJ7x; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvXUmJ7x"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2980d9b7df5so16402465ad.3
        for <linux-doc@vger.kernel.org>; Mon, 10 Nov 2025 15:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762817918; x=1763422718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BkOzUxSSedtqRPqjCFUt6WI3IiHiKYSTgbLQupojII=;
        b=UvXUmJ7x3TFDhikIkdX2moxHG3ubtVqkOYHeXcup9fwnhrc4lB8/rMriAn6mOrtI4Q
         13Pqd3Hin19usfl32931uRDBiMUvdPMiXmyWoNuIGdKlmSKQ1DtgWvZ/3YIs7bM7fidx
         hXn0ywaqTTAi/07hxvy4dcCEETtYTnDVJr72bCs7X9YABlBvx8O9pp/Jv/69qbhchG+w
         1QjFrYj8BOW+3oEJQuqV973M/4dQ2vNWXdDGelvcEZbCWvkvcBrYzc/S9xErzv542kTD
         O0OPp8DxptsT2ualHN8NZlEr2B7grg1Ogq8jx+UlGlY61+BkOVVeq/rWQ4CdXI+ieQtJ
         vtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817918; x=1763422718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BkOzUxSSedtqRPqjCFUt6WI3IiHiKYSTgbLQupojII=;
        b=wMr2lNIAcb8Z4pl7X3NcbZ03VAQ7LqO+CEKxQgaBR7lUgsfMgrzVv7Srk6QmX4S7N9
         isNpqYkoD09Qgq/h4R/4k1wV6ko+way4sCNvsdoZ7f4nSZiS5qLK/EdWDHLrUg2v8AUD
         hJVT4ZQrj6auoxTNAguwHBaEAhcRpgP7CIK7DTTx2bBLbTVcWAg4o7iiZknEs8ixMca+
         DpykwysRoXLnY48LOHTWFGkKYmnE32n5xVy9GSXBFxsRYtnwipyDWO8xybENRVE492If
         r3Unt6gcL9/aY7P23nqnirM5ntRSeOzIYbhSuIB8jekOuSCmzm11+mI5uvfPP/VRa3dF
         bBRA==
X-Forwarded-Encrypted: i=1; AJvYcCWH0e3cjS5ailyMZJzzd7bIPH3hKlofgAtKT3fO+m3LsUwP3rbgKw6/2IAiuH7z/08UG792+g0VroQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIYHRFPe+x3XOP4yYK+Jt61UwjoZ1XjslteGX+9lCrRsmMZCfl
	N9nNrL9DzhZNVylpmBuvKDyMBCDpWchqCG4LkmNL6neuLM9wXwq1fm1G0mZJINwnjwM=
X-Gm-Gg: ASbGnctZTnPLlfGnfA+lUWHVL3ER1qD48sy3q05SUJLhTVQXJ4H2rIoOky6D6xjmDp+
	73tYwt5AOYIHA+qJxxEPQjdUSf7tZ652QfjjezJdCJCOH5CsQbb6sPVK+bCJKBWGLP9tDHNPPpv
	k8DaOjy3YSIYjeKbh55UOycTtrANzViL/hkzKcs0IFbhfmeQAaUBiTCFfRSGT7I8Ub7WWZ0suOa
	tnItDQgMwGuT7+rKcGDNdhRebk2x3/rfBIU2Q8WD0bvMtE/sHNze9+qKvd8Umf9vL6Dg+5uaFnN
	K/kCpXVG7ekc1WSrPTg+V68OCWTV6NBqEELdWrNQrZTGEcMk98kX4znBUsfg4uTXKekKrUgIUDU
	QvNgeZsPgJFeADzpKbjd6uaSbc3dNQVmNrQwY5M39A+JL8EvICaDC8LsJpG8d119qAfd397dfrJ
	8o
X-Google-Smtp-Source: AGHT+IEi4+N5BDziRzYZppfNwadzwEcVAGlfkTK26ZrdelRRWzwfF3onPDRQ6fnIWoeut03gtLxsdA==
X-Received: by 2002:a17:903:3387:b0:295:4d97:84fc with SMTP id d9443c01a7336-297e56be1eamr90395435ad.32.1762817918122;
        Mon, 10 Nov 2025 15:38:38 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297f2d9c971sm78403165ad.55.2025.11.10.15.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:38:36 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 7C0B741D950E; Tue, 11 Nov 2025 06:38:34 +0700 (WIB)
Date: Tue, 11 Nov 2025 06:38:34 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	openipmi-developer@lists.sourceforge.net
Cc: Corey Minyard <corey@minyard.net>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] Documentation: ipmb: Indent boot time loading steps
Message-ID: <aRJ3ehfBJRWrWXzm@archie.me>
References: <20251105125449.45643-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Mv2ump0qL64iQ07O"
Content-Disposition: inline
In-Reply-To: <20251105125449.45643-1-bagasdotme@gmail.com>


--Mv2ump0qL64iQ07O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Nov 05, 2025 at 07:54:49PM +0700, Bagas Sanjaya wrote:
> Steps for loading IPMB driver at boot time, written as enumerated
> sublist, is indented instead on the same level as its parent list.
> Indent them as appropriate.

review ping

--Mv2ump0qL64iQ07O
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRJ3dAAKCRD2uYlJVVFO
ozgtAP9FBSCB6sCH2m2OzgdgvYFnDNhf4q8lD0YGD0CZMa798AD+Oa5ZvTB46NoN
+wJXKtedF9+doRDFvq87lIIDuxXTsAM=
=iucy
-----END PGP SIGNATURE-----

--Mv2ump0qL64iQ07O--
