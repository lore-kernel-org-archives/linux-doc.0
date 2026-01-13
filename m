Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8AF277818
	for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768344344; cv=none; b=kh6oMdHIxyG0F0ri0Y25K3YZsydmSZJLohZYdKu6HyQawFtOjW6UzuKtx4IhQLioG+bGzNbDJTLXlIZRuG7VYuuSnomfL9rLshw9S+6qGH6kqRX/mBP0cLzIJ0sfBHhT8QKh9kx/6ijV+gUqeWYuzPQMBWrphrLJzxY93IBG7V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768344344; c=relaxed/simple;
	bh=OSAPb0X0rmvZiV2wXNRKbIJTmO7hsN5SCy3PsVINcLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQqg0NYzlE/ZVYYhylRwWdUP/USvU/7ZP/xR9BBaJrdyVD+tpzcVOZvnik0f2f2TsGHbVCLlRxkidx0VuqzJQ6akQFCs6z2DzDuzKYF8uwLGu1E8twfcY9fJ/BupHDXj7R2c/za22e31yRg46jVRhkcU2RxD9FWBAckKsetzK8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr7N1pqA; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr7N1pqA"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81f5381d168so2424519b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 14:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768344342; x=1768949142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJwCd6SZ2NrvK21po8YmNoi0HiWxgby2JNrwXj9hGzY=;
        b=Nr7N1pqApx7/jsqzjit2paqkJ8gya9wZayvB57zONpVtQ7XsMqGMXXvCQmQuPO8RkV
         YK5IpAObsXbAZklN7s0NHEiLL4wsHcGTdvCiE8u7j5ynENcSaTT33LEvK+b84ip4+dbi
         sy07DJ7tQDBWy40qHMDIOWN6d//NrK6F48+poI4Uejx7QNsYGNdNKVWquOCmXpbo3BLH
         Rskis4uZKLf/FvU6OhSTt2/rmN9hX0Ey5bRssoTmnTofPhE5myWkAzG34+lEw1Okh3Vg
         8/C6T7lG37rN3CI/P4Ziq6m2z79sBy6o1k9wua3BQP8YJspd0Dce32G2/qZjhuGmnrl+
         FQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768344342; x=1768949142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJwCd6SZ2NrvK21po8YmNoi0HiWxgby2JNrwXj9hGzY=;
        b=mt70xbQg4K+3xZ+tdhtahfw+763ooqnAroW7nIOvIpgqqOc7LkPrhjo0WdUcP3+vW1
         viKJm4vB4iawtc/+jxzbmpXVEB6FtzgbAu08sDV3FObpJiqjEervtjafsUT+UaUBcsiZ
         d0ItGIidGBAq8JK0VYHgmoQ5LZ0IgSSQd30HQWG4NmupU6ggMJNL4h4+gPv+PWLjFs0M
         TklWrk/ZaJZ/L5qAKXZntvf1DwC1GGQ9oR964peDUkI4aa9zQ28rvdpjKHaoRIpJj5/c
         u4R8V6WBu63cLN/s9cWoRkBJOG50v5ZGgX0qbqbMJGxOaSDvwUJVy65qaMnb9Mz6iUgn
         w7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK6AbABUWqyjQo2PeERf3GcmKgBWZbkxfJ6sUPe1v7L6Qbta/IkhSquNxBNPTJVqYXFQcQx29t2oA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcb+qOl7IPQ8zYFY642tW2hGg12ZgCfiNBPTYxIBqqItltObWm
	9lp882h6BJus+fTWkFnccJ16YZPcLJoqtZPsgB+OvFEd6K8mSye+5y1S
X-Gm-Gg: AY/fxX61XkLQA3VAal4gYB7RiD734+MvyLkCaiu0TRAeeaLTAd9RR59kry2lUvL2DBd
	ZCW2dnE5fq+lWisBTpvgdXE6SoE+D0VxF5/1wtr3YpJfDwa3vYGR/PzLBFI3PkGlprMC1bYUl8Z
	LUtFa2Hzu4SoP3XwutMdkPfuzxsdYoVg/DokItRB/uH0QntWcK4la78tnn9YDN+NVaXRosvWMbo
	cfVJgd0bS9n1MiuG3B/CwkLiGel4DmauMapjAYXrNkuVYm3Gg1RddapTVRoHDcTY8ekEN0L9fs1
	3Xr+EuCF8JI2lNI65KkRKqMkpJfukdO9qeUrNKBah6SftwlBEbZ33TVr45EqXNylbI/JVQHaiud
	2M39Bf17KX1qs89BOLmIzjfvFn1jdF3zRim0GPpgxtFo5BoRJFLrOkR+iPUXhB6dicyhNJxgCrG
	MzAR/AKjA=
X-Received: by 2002:a05:6a00:4516:b0:7ab:5e68:e204 with SMTP id d2e1a72fcca58-81f81d3ab82mr454066b3a.29.1768344342051;
        Tue, 13 Jan 2026 14:45:42 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f44a94e98sm6145133b3a.69.2026.01.13.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 14:45:39 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9EE3D42BEE9B; Wed, 14 Jan 2026 05:45:37 +0700 (WIB)
Date: Wed, 14 Jan 2026 05:45:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Petr Vorel <pvorel@suse.cz>, linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>, Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: Re: [PATCH v3 3/3] Documentation: CSS: Improve man page font
Message-ID: <aWbLEeeVuY1X-YjA@archie.me>
References: <20260113113612.315748-1-pvorel@suse.cz>
 <20260113113612.315748-4-pvorel@suse.cz>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rwnCSDOQih/CPcEH"
Content-Disposition: inline
In-Reply-To: <20260113113612.315748-4-pvorel@suse.cz>


--rwnCSDOQih/CPcEH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 12:36:10PM +0100, Petr Vorel wrote:
> +
> +a.manpage {
> +	font-style: normal;
> +	font-weight: bold;
> +	font-family: "Courier New", Courier, monospace;
> +}

Shouldn't font-family be the same as Alabaster's default for consistency?:

font-family: 'Consolas', 'Menlo', 'DejaVu Sans Mono', 'Bitstream Vera Sans =
Mono', monospace;

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--rwnCSDOQih/CPcEH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWbLDQAKCRD2uYlJVVFO
o/NgAP9BSpWey8UcUP2/zF1VAmDwPYa7H1z8Gbk1qrPPdw7QpQEA7atJG0Fv7HWW
zIvZm0Km65cvGpfMuDpDkl+iwweRNg4=
=ObqY
-----END PGP SIGNATURE-----

--rwnCSDOQih/CPcEH--
