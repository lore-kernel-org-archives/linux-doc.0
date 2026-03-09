Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB6B3A4F20
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 12:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773058517; cv=none; b=Ha7uECJLYG++fw25yDr9b8+zKyFMOMHjwqKfIbNooxbDXoNbzNrY3hl2wdoUrxhjdDEnvXEm7zMkfjZFG7nv6fxccqWl+0sF6+zZfAvzSZtM1AiiWGJgdSWFjzNqXvVTS+Nh7Di/fF7wcIpVecGyx4irJu7ZQT/BX5j1gc84NR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773058517; c=relaxed/simple;
	bh=HPiSJ93sUzqz5SidOlMS933Yx3yWvCUQ5wbilVvU0I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce0N9re/JuIsxP4ND615qWLQF9xMyN7Qq3AOzFWKnIxWOvIthyIpFnTxRlDWzdsqGJkbwwdfYGDwENFP24xFD1Xim/Qfwxjn8rPqYinhf/C1V6EHpTXegcCmhbXc45ls9VtfvfrZ/QSiqLsyb/Lj4wGO5cRC6PnieiD1Gm6sE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZIuBiJI; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZIuBiJI"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3597b474cbdso4901487a91.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 05:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773058514; x=1773663314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HPiSJ93sUzqz5SidOlMS933Yx3yWvCUQ5wbilVvU0I0=;
        b=KZIuBiJIgWpy6mCwIjphCJD+qIKaPil9BXB8C7uM0AzAKpNPZpx4/LVPHZZCrYT2Aq
         wSjOOj6j6mELkjB5DFH4zZEX9dFrcoyLAgz5ihVOPjPXgvn6lagzSwuFBpVaj5Vcyftl
         s4HIbkbcC72b3Fr1khX5e2O1mlXjcBqWCgxpieyYbP1XP2jjTJpdOk5y2DimdF4TcBrb
         eAy7ryZIaHce2TU3eDklH2wlzgyRF7zK3BUMW8HeZkV2tqR/q3zwv+3zd6VBoQPClB7p
         pxN1GbrQAHg7c814rmnXwks9OwWdzNRc2JyuoLXXdXp1zybRdrH30wr6rPrP+La9mx3W
         KoRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773058514; x=1773663314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPiSJ93sUzqz5SidOlMS933Yx3yWvCUQ5wbilVvU0I0=;
        b=haq+WkcvrWriYu5AFQglk2jNwsKOwXSpC68i2VCyBD3i5X0MkwSTzZuTBqlriIe7u2
         mT/WenLInaIgvEoRZmEtjPMxDN3TrRsTTlTVlU3NBnlUF5ct3Fx5GZvhGfMCpSMVmVUL
         OyDbTkVcg79rwydGgtJi7p5pCtugcuoKw3I0xsZoDwquxSwNCJ41QpN6Hm/PVFH8gOS6
         UJYsObXsp/+fVtOlEWvf2Y4qLUmHDmc56aIKi+7fTiI5bSiRT9tkKUvjexkLY+7i4OOU
         5w7RQbSQrCE6XG3bNDbpnEGKffz1eqAdI2WKNrlGDvSyMnh9dxwWQ/dg6PdOSigwzRF+
         f+eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7S8D5PbdWSCuwVunpwfmRalX7oQ6YeSGAlYxgTVw0N8mvPJce1TdzvES2ec6Jd9AkvLqxgInUItQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BOcVXErZerypRdfvlp+JYYjdsUy7qsXS+3c7vhbRn4LVzdn1
	3Ncpq039yAeDEQwaJybIjYd2jMPCrtHAnIIXghXes0cRWodUf7LcnztI3A9IOOWZ
X-Gm-Gg: ATEYQzzCXA4L7kqX2Cg9e7OpeEa8Xw63C/1f/c05ryE9LqWfVAunpSKw43Of4PUvFfJ
	Pxy4wrWdf9HsSrD8Q0rl0DiHO0gveaPw78sLJlV2wyE6PVV8y/Uf/Iz5eEVWUpkCd/xcQILulEb
	lewy0eb4cIl6Fx+mw5xmT2lWfK5sctPQTk9bhOt2HZ45pDGRJ1VsZdOSz/1cyM4SmYjSu8cVxTT
	A0JaVqpYxdNkgCOC3hI+R1Ei/htuibnZR2NZv4lXiFa7NGtNEPonv1RrnkzrD6lrhSQZ20o8213
	ZQ6yVkxfnG//oZOhiin3c8EgaDWc5eAsREMXB1ptv6GlG6wHWi/KCztLKNdV4PXo/ndO6zb2nFI
	uOm3dgglFIrD91QQYYhva4MpaoEVJ3VXPEeD1T0rJDpgZL9KfmW3LWubSaum3f7+k6aWYh5J7H/
	QBwFkaaKjrAqWSdeU+TBQ=
X-Received: by 2002:a17:90b:4ac7:b0:359:7fe6:7de with SMTP id 98e67ed59e1d1-359be3736e7mr9726794a91.23.1773058514021;
        Mon, 09 Mar 2026 05:15:14 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359c0154a09sm10902291a91.12.2026.03.09.05.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:15:12 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 3278B4208F41; Mon, 09 Mar 2026 19:15:09 +0700 (WIB)
Date: Mon, 9 Mar 2026 19:15:08 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Evan Ducas <evan.j.ducas@gmail.com>, wufan@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: rdunlap@infradead.org, linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] docs: security: ipe: fix typos and grammar
Message-ID: <aa65zOqsFLKzgL1P@archie.me>
References: <20260308180734.5792-1-evan.j.ducas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WlQl3PTVy40ZKrDC"
Content-Disposition: inline
In-Reply-To: <20260308180734.5792-1-evan.j.ducas@gmail.com>


--WlQl3PTVy40ZKrDC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 08, 2026 at 02:07:34PM -0400, Evan Ducas wrote:
> Fix several spelling and grammar mistakes in the IPE
> documentation.

Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--WlQl3PTVy40ZKrDC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaa65xwAKCRD2uYlJVVFO
o/D6AQCQz/ijZESqN6jyW5u4EgkfCM8QCoDE3QAGxp1yQFRSDQD9H0AwrEQ/Omij
xMlXzOiUS1xLbjwmeV9LMLCBiJSd+wE=
=SsgC
-----END PGP SIGNATURE-----

--WlQl3PTVy40ZKrDC--
