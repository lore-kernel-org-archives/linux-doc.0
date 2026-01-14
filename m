Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5542BD012
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 03:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768359807; cv=none; b=KXHhxFJZKXwi8poWDWN0F6oTGHJ1Hxef6sZcIhRSr0EzKW6HgOU6jkPZGSolbG0iUP3WRwZCfSCk3GbjqndZR02vSjV7jEj9mGPZP5Mz1r51L8HlXj02eqG885PGw25LW4pT8K6V7IytLtIsLumTQ9cJFtLwjIGWzS1+7I0tBDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768359807; c=relaxed/simple;
	bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pYB3g9XjALj44GlK8PYMEcg0mTkVMw09xSYSt2Nu4VSIAH+trV3i5T6HbuCMibrV/GG9xx3uefEldQ4BNZRiC4Ly8WBpnGhZWFom6yylqFNtx5KzFtwVgsyg8J/OGJ/Z0yWITxe2LoBqYYOlh+RJ41r70UUV2hdHZnlss4+peEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frWbCYxO; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frWbCYxO"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09757004cso74878555ad.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Jan 2026 19:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768359805; x=1768964605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
        b=frWbCYxOr4GSgVHWjRIXcK12KuBAZ//fIOZ66WEzSAHZxpmct9Mafr7qo9W50Y4ott
         +T579NIkb0n0SCffZtH3l17B5gxXq2OJDnPTfN+fWyO2OP+0/CdPVesX2XHZmPwGl8g6
         xEsy4frEEaA+GUw+Xstlb3JpFXKHGHBxAR6pXS5KhbU5a6Ur4Kw9DZ8g8/QV4km45Pk+
         /7mJlzTnZ4b4eLNoW+BqFTVd4K0X/jop9V7idOD3N/vGIoW0ITPH3y6CkLY0cVi2Ht63
         ehVy7l9MLNLEBFuu2j6UE5kevqMfm3MOSa29vN6sljnybore9QqPZvO/zalVXhp5pvwD
         U/+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768359805; x=1768964605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/86G10alNluaILsBZIVi2R5tCLcoFOd0FRhcRELVDLM=;
        b=efoW+PeRsXHgpb1Z6HObA80q/dpvQj+PjjHXGWu5H+aAttbbh4L5ed+nqqHiOLJuRi
         Ju0kgOrSJGERU0j5CzipC8CedZqeLlzM9vE6FPZbF4Uww0eup1OYB978lKFBRpRvILmQ
         cT/jvlQDIiFW3lD6dNudjQ4xprSBxKVtgFZPKY7peCNjLpaSrilc+MMYtkwwMagxyx/1
         h9I4tCS/hhBCUTtIejMm0FGn/VWG/l+BXjFS/qnT5HDT9QmeZmSgxUzxKjhJjdpx+M0P
         e/CQuGUa7burAK66uHQd1gUVHsewd+QH8SdXXwPLmOoF6qgaEaabaTFM5HAja3/tpIqz
         eZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpPY8Ds5y6R8njqVkBkOROyffXoiHKNywu+8e1pFaAO0mhSEThkseJrF23AxHQ3w0ImkOla0bjcpM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy002MFRuydE75u7hTX3l7pj1utllaPzzo+UtVk9YsDS7rdkQBV
	QCMTCXy8pBV7Vtec2Es4KjOMr1ixy4+fjL+1Sgq7rbe5joH/dmKRm+8g
X-Gm-Gg: AY/fxX6AKbFgUCdUyOYWhRPbXZPfCqhIqHwsV3sRWZmjJdW48DbKA0/dtbQgGs7oC7N
	UWRAgUZEi6dS9ePx24B5UsOXDQUJxpmsX7mtgLt0akJs+GqcZXsS6dh5zyFyWyWAyvKQe+P9kKa
	unG1nRfv/1ubjMjwOyPz3XhyuwGGB41an4s6mHHTEKQZYuUiKwylnthTapIDs2LmQCxxVC81bbe
	tFZfkyMQ7R0lI/ejOBNUwFzZiYNY2qdqlfwUGu7JswficbxZFVp9DKSUCsbmQ1MOW05WSnVf9MX
	Ckek9yGKzeFgvlhLtr3XBcc3FtcJdsyes3a0euxkbKcCmOs8HqXKfw3Psjgw/RIpFucZguCYv9D
	FcWZE9OR+Xe+OmxxxU9SmhSreTL3C56mYdZIe6I9mcUlVzFHjxIccrA1culSdybOcNJrRzskSpb
	jTv5JpYvI=
X-Received: by 2002:a17:903:11c4:b0:2a0:9835:c162 with SMTP id d9443c01a7336-2a59bb75480mr5784705ad.22.1768359805240;
        Tue, 13 Jan 2026 19:03:25 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2f8asm215237495ad.57.2026.01.13.19.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 19:03:23 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 4B6D242BEE9B; Wed, 14 Jan 2026 10:03:21 +0700 (WIB)
Date: Wed, 14 Jan 2026 10:03:20 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aWcHeGPUfS6nE2sC@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
 <87ikdecsj0.fsf@trenco.lwn.net>
 <aV5a6PCVrkRHwqt3@archie.me>
 <966fffa3-a91b-425e-b915-891299832e36@infradead.org>
 <aV7wTFqQQkGf4efF@archie.me>
 <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2vKEEDcQdj8x5oXs"
Content-Disposition: inline
In-Reply-To: <863b3969-71eb-4bf1-9e32-895e53d8bf8e@infradead.org>


--2vKEEDcQdj8x5oXs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 07, 2026 at 04:21:40PM -0800, Randy Dunlap wrote:
> I'm using docutils-3.13 (Docutils 0.22.3, Python 3.13.11, on linux)
> and I don't see these warnings.

What Sphinx version? Mine is 9.1.0.

--=20
An old man doll... just what I always wanted! - Clara

--2vKEEDcQdj8x5oXs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaWcHdAAKCRD2uYlJVVFO
oyhDAQDcGjOTWaDOU8Vur6ZivEcg/g6GixiW14r6sgwKCmBrAgD8Dinx9IblwjYP
PvVnp9Rn+sIEUl/Rae7KeIA5jA48CgM=
=h6Tb
-----END PGP SIGNATURE-----

--2vKEEDcQdj8x5oXs--
