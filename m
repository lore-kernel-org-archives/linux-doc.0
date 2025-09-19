Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BC51A3178
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 06:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758262385; cv=none; b=KjSLj+AczrNhRQ2BWzee6oFjcMXm8fNX7SalJ9BkvphSU3sq6su8gg3Bgo0YJJGENduABRQ9Fk6Dq85RIvQHQLD+2nw0/oK+vpi6unlEYIyqUT3c6skNpF3b8nf/dE3eAR5pBx8N9uO6Xmgzt2+l1R59mSMJJLSr1KOWWvqkItw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758262385; c=relaxed/simple;
	bh=QaU0XZrFsINteJt0IIMDvEMBnerjNmnmQy4PXU2LX/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGcKDIkCbuCXiXfJNnRIKm7paM9BXdwEfQCGdQUeAfz2YTMtT0Qggo1jtggHtIs3b7dz37sxheQi2kWnUvHsiWPEHDak4b9IM3uKVM97T9H3gDTvFtM2FVGgFFMxu1D3CL/Ymlw73OEyLDf41dONdIVbFDURLfJfqnWKvdgE+dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QpMXdrC2; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QpMXdrC2"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445806df50so14781095ad.1
        for <linux-doc@vger.kernel.org>; Thu, 18 Sep 2025 23:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758262384; x=1758867184; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QaU0XZrFsINteJt0IIMDvEMBnerjNmnmQy4PXU2LX/E=;
        b=QpMXdrC25/0ld1j/5QNBgRE+YuuqHy5fapd4SXRjsQ5R70ZKw3W6AnOyBIQGLhPzHo
         2A9UNgCJeeiNiJluVYyiu6VGASblAxdpzryTbFtFLrslMqTrdb2av1qnONgcazarmCdT
         f/KrR+o/2xr0kfuo6ZusfFta8M6p0l8J2d+nOls+J6NuwdcG3t2vnN9TzM+HodxjwMAb
         WHwb9Ddt09wsKiDvjWBNLEsDQCSqmcZYFENhSWlk2x+wk/ztErbey/ivB1a4JahfpgMT
         vLNzuqnlg3DeCkHM8BUTHyftTGrsxhhyb5E+TRXvT+hBj3lmNT+WEeXCJeDoJOxgunUE
         yLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758262384; x=1758867184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaU0XZrFsINteJt0IIMDvEMBnerjNmnmQy4PXU2LX/E=;
        b=kqDGmTjwXrlSxs3N38MvUNzLePrqsAWAborzQO0r5HMVqrl4y6gmLyLHyZ75LN3NHw
         VSmrH6Zy5PkDeNiwyom9fBQu62IcOV/UBgy6gcEyS0egyfGI+Ma62tjRTYJJfF8pwxfX
         zIgRSXkEAxC6jCVumXXv1GyRPk6tFCooVNS0b7lMRog0bn3VWX1KfOH0wxo0IAqOy0Rn
         smU6a8PR1iFpORA1QIhuDKXdM7nxJHwKCGeXMt5DZauLeTZgMSK9zjVczHaHcqQbDUnJ
         3yoPVt3Vo/10OIokL0G3Vo6c8/3WbwH8cpQ6TZ07y0U0YQFANSvj0Hqbwqg3FMJPPVzu
         NfPw==
X-Forwarded-Encrypted: i=1; AJvYcCWI5CQS5FuS84n1IXWcpSc2y/PtsdwBkn1V1vgYmm6feXhNo3SS19bh5g0qdqNbESFOxkE88niBCJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVQfC6qwnGaTMFJ4xfVqY5K+CjCO1KHTqpaZgoGH0FUcXU+grZ
	0kZrkD2VBhxKOEY7SPe21kJeD6cZ3YY3De3Ylyj1gOfKjMfsWw+JUnV5
X-Gm-Gg: ASbGncuIMXyeLtVQpFp8L6/BxXpnc+SJXnYEtPQ1SH+U/NBPjAuaXhVRqdUFUF9i4DR
	4XMDRhgZngiUK1hd20b+HNsdnOppSPwl4Uv6OnnpdSCL/85tPaQM4LIiAT1zLiZ82j+4G7BNhtW
	j/bODJA+fUTOW+vawrLvdBRFP29z3ewjuQluWAvhruXORri2M6bAtlCCCGu+I2zXNP96ZxlU2gO
	l5O6+F8LEYeiDTzAwPcGcfFR770zNVpnQ1+JMtsWPUhO5h8lDD8WrnC1asBNynOFWmDCjttjezj
	3AT/GR8TF+FwtlAs6Zp8sqRfEoy/a2TNblZtxz9BeQuHhTlgClOOOY4LwWHEJOx0eC3gKm+Zv2i
	7wrCM6pL48fPR4Hr1LWIYDymdFuR0+Z+2
X-Google-Smtp-Source: AGHT+IH1zlcrCsnnWY05Td89Szx91jOSar9oJ32+Ot2pPsbfIjo96otYgzFoT3ZIJABk2eJTuUWEZw==
X-Received: by 2002:a17:903:3850:b0:269:936c:88da with SMTP id d9443c01a7336-269ba53910bmr30423905ad.41.1758262383441;
        Thu, 18 Sep 2025 23:13:03 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b5524c329e6sm368477a12.42.2025.09.18.23.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 23:13:02 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 32DDE4227234; Fri, 19 Sep 2025 13:13:00 +0700 (WIB)
Date: Fri, 19 Sep 2025 13:12:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 4/4] Documentation: cgroup-v2: Sync manual toctree
Message-ID: <aMz0a_7_8AfpwoWT@archie.me>
References: <20250915081942.25077-1-bagasdotme@gmail.com>
 <20250915081942.25077-5-bagasdotme@gmail.com>
 <aMwtI44JEXFuNPA5@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ifSAKz44nzz4QM1K"
Content-Disposition: inline
In-Reply-To: <aMwtI44JEXFuNPA5@slm.duckdns.org>


--ifSAKz44nzz4QM1K
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 06:02:43AM -1000, Tejun Heo wrote:
> Hello,
>=20
> On Mon, Sep 15, 2025 at 03:19:27PM +0700, Bagas Sanjaya wrote:
> > Sync manually-written toctree with actual list of sections in the
> > automatically-generated counterpart.
> >=20
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>=20
> This doesn't apply to cgroup/for-6.18. Can you please respin?

OK, thanks! I'll do that in v4.

--=20
An old man doll... just what I always wanted! - Clara

--ifSAKz44nzz4QM1K
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMz0ZwAKCRD2uYlJVVFO
o3x8AQCm6hbm1X92Lu/K21794EnjnfNjcuWONZ8nr0ikKMbNsAD+OVrnNOuylGrN
CZEmONzzDLJ8o4kT0W8HNPNzsJBArQM=
=WWlA
-----END PGP SIGNATURE-----

--ifSAKz44nzz4QM1K--
