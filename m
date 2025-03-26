Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612724086A
	for <linux-doc@vger.kernel.org>; Wed, 26 Mar 2025 01:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742954138; cv=none; b=rqBJXvumwBL47k3hBlu58BkgUd5Dm63V5vsDI5iSgpsERisGI+QB3uFjh0ipyt3FL3pceh/rNL+4KQRxY9Afsz+4ZM9IZTQdDiXi6NvrqHUdxsBZlQ1L6G387+R7VaM5scb/hL//CqqEgzF55FSscpljiDHiJl27N2fEUFd6V34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742954138; c=relaxed/simple;
	bh=RhoGeUb32vm6SYpduUh6vVqWnZMsaqggCcYZ4Rk0eKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FgERLlERd88NGKCfb8KNbxkwwWpFmiCLmKglbeGW1B7XBNWvSt7bLyZm1i6/nY5NgmdShXY86GwAIOReQ8Ax8dCiEZfdtHSZHU4iPgJtoUlOS354E3QOzXcBml8lPgKNLGWnEHtvyX/eSO5DIpSe7r/tmn+E7EJGGRL9DB1b/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnOno7pC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnOno7pC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso131959905ad.2
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 18:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742954136; x=1743558936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RhoGeUb32vm6SYpduUh6vVqWnZMsaqggCcYZ4Rk0eKo=;
        b=hnOno7pCxMOfOzFNI2hZZF6OuB9qpf1Sp2hNJZI+41VHz/L6+Elpcd9gPJzUmVagAM
         0ZLbEfIe1C/vuT8VmuDkEkwpbtjLMFC0Be3EhfWwKkpUxSyJ/UdtGFYw6jYCdCgWldMr
         L5cd3wOLmwxNSEiKFR6pF4Mzts+Hdn0uIuTUDn2Lx/bxo8ogegB5Ke8sRf1QvFqGfP91
         bcoOKuWL/0wbMK+VQljtbDbHoIr+gI+pCX/16aM2tQjCLn7u4Wx+3emZe2p83aKUQnFA
         N2no4a7kH6kwPJ0EQvqPkrLvBBIx+LwaTtgqaYdpaQhWiSSE0JqPCUcKnbVBzaEBaKcc
         070g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742954136; x=1743558936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhoGeUb32vm6SYpduUh6vVqWnZMsaqggCcYZ4Rk0eKo=;
        b=UgZ3qOlc3kW4qxFf024Kw+bGdE5azZ0JXqPRGcKS1V7tU8+MkYgH4a/Ci+UHP9pPG4
         rLe9Qd0xz5ZSahfpmB2Io9reL0bA6LN4LEe4ew01EByerDxgTFVlpTBaPWJ5cL6eQ28H
         cl4AEu3THJ01rIB6q0wy7pu7jSj+ieslUXyn3eOLUZ3n0A3fEJ0K462p1aPjh3hFvcJJ
         ThKJH8wEFHUvWZt70LFME7y71spMR4KpVgZET4vlPC3q5Yu1mW52ecwq8MA9fa9yWFSD
         +01oxlxVJnfIzZWO+rM0k33PKdMPVYrx7Q1qwLVJpNUM5kDFP4GoU8woVrXdBlkBw5yy
         m2bQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnAbrfM+e4hEXph8bRMBVvw+3k7nY9ax8VFyMqwcbnp/XOOB041PP19ACggyprr4ZkLeIfs68H3Kc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5OerumR6Ej6hj3RVRYWsyH9QSq5EZgQu4kRAnAGdavUP0/3Jy
	rJ1AmT3+W//ButF+wEeAVrTSzGDk/L+ZEY6yOkJOb3LAHNFVV4NQ
X-Gm-Gg: ASbGncu/HKxfZ+Qv1DPrniVPQQl+4eIEcYDjCqLLiG1nfiALY/VbnCgv6FBCZX9x0Oc
	prTP7jwJHrSQ+pgBKWB6RmUrllwpltB1AjdwSxDw6Fm2/GLCYlNWXZB+z1AHyQexNwsV+Ae39ZA
	wp7RvUl062WcL/XV8R1t2TR7fz4JdQpmON7EosM+LlA96NeO8C4aQNlX8LmRi+VmImxazl4n381
	FCB4xm9lf2Y4z+f9bgxjMdcRBPN/btEzBzAJWGKIuLJM2xWKVoNuT2qjxThwBBrMGFrHor5OG7v
	3O4U9Y3cIatobNamet+wmtHU6K8CzBQvy7wB/Hd6l/O1
X-Google-Smtp-Source: AGHT+IE7D2EDUvRYr7rRqAPgLAX7soipBYpCk8xJ8LrYa/wI8aAMYAdtBnkhSDtVNtp9+5WRjLi22w==
X-Received: by 2002:a17:902:ce03:b0:21f:4c8b:c4de with SMTP id d9443c01a7336-22780e177edmr287235645ad.42.1742954136344;
        Tue, 25 Mar 2025 18:55:36 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f33f6sm97643965ad.226.2025.03.25.18.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 18:55:35 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C5BF04230C05; Wed, 26 Mar 2025 08:55:33 +0700 (WIB)
Date: Wed, 26 Mar 2025 08:55:33 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	'Christian =?utf-8?Q?K=C3=B6nig'?= <christian.koenig@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Melissa Wen <mwen@igalia.com>,
	=?utf-8?Q?'Andr=C3=A9?= Almeida' <andrealmeid@igalia.com>,
	'Timur =?utf-8?B?S3Jpc3TDs2Yn?= <timur.kristof@gmail.com>
Cc: amd-gfx@lists.freedesktop.org, linux-doc@vger.kernel.org,
	kernel-dev@igalia.com
Subject: Re: [PATCH 5/6] Documentation/gpu: Create a GC entry in the amdgpu
 documentation
Message-ID: <Z-NelWkIAtyAzoE1@archie.me>
References: <20250325172623.225901-1-siqueira@igalia.com>
 <20250325172623.225901-6-siqueira@igalia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DIB49pRixYM85JwS"
Content-Disposition: inline
In-Reply-To: <20250325172623.225901-6-siqueira@igalia.com>


--DIB49pRixYM85JwS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 11:18:46AM -0600, Rodrigo Siqueira wrote:
> +The component that acts as the front end between the CPU and the GPU is =
called
> +the Command Processor (CP). This component is responsible for providing =
greater
> +flexibility to the GC since CP makes it possible to program various aspe=
cts of
> +the GPU pipeline. CP also coordinates the communication between the CPU =
and GPU
> +via a mechanism named **Ring Buffers**, where the CPU appends informatio=
n to
> +the buffer while the GPU removes operations. It is relevant to highlight=
 that a
> +CPU can add a pointer to the Ring Buffer that points to another region of
> +memory outside the Ring Buffer, and CP can handle it; this mechanism is =
called
> +**Indirect Buffer (IB)**. CP receives and parses the Command Streams (CS=
), and
> +according to the parser result, the CP writes the request for operations=
 in the
"depending on the parser result, ..."
> +correct block.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--DIB49pRixYM85JwS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ+NelQAKCRD2uYlJVVFO
o8sIAQDkGjPRsJ2EtTpo2Ib2Qn/FWZ3h9QNmLPDpIX3hqMAYvQEAx55KZjJDXuQU
ubIbfwJlEd+9PtWYkKY/lcKCQPahsAA=
=b8uh
-----END PGP SIGNATURE-----

--DIB49pRixYM85JwS--
