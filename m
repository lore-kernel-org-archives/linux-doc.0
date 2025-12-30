Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49EAEB640
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 04:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767069472; cv=none; b=oD+tEATGu2G+qTKxMEonHkRJZUatxRgRVSvkaNj+SDnt3uWRppHa2xnmRRbom893dDbibV30wumkkumLbj0qkIb0cJoKThBfcphjeN1+NBF+80cFORd2TOGr/lmh1HspUbKPGH8b0lAr5cagIXGt5TjwN8OPzpBduoL53tqUKJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767069472; c=relaxed/simple;
	bh=9WiL6/NCK+gqFidZHQ72YVioxLtwStViQlGLlgdo/EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CIFEaoylgickXaFPEOPRPjzHm32fDzQcsa/+rXkOAZAQo7G+U+0ImnSmsvMZvIhOgzB4gz2CoIsxDLob1N5cMdUEvhTcLt63QwIDUMUVRp7upgPIom5yX41qG6ARKNMmhCEsK09otIg4JQ4O0GK/k2W+pHXHdNbYN1MF5vPjFd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVxlQXNG; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVxlQXNG"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a12ed4d205so84684915ad.0
        for <linux-doc@vger.kernel.org>; Mon, 29 Dec 2025 20:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767069471; x=1767674271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+WzwNYNhRdBeULGjK+If30c9dR6hyS9om5xAgt9QlM=;
        b=gVxlQXNGRBONeeeJbCUaUy+RIpEtYO9GFYOXarx2LYUpzKR9AC/ljXJNA+9tArCeSQ
         9b8xKUgmvDLGfPvsldJZHTvz1l58+XeCteHMY90SoCOgKy0DgD02rNUpLbE4kz3QXN9p
         gNksukb2LHlSgliMi1EgaLjqD+lxZsqAUFnSwgI96AvnP/gF+GYvBFwnrRPSlrjWIKVg
         0kyiYn9NKIwRzjLlBzNWKFbFV1SOX3YaCHMw1f05/h6QLvqjg9UYRZXPNb8/W4/Mc50c
         1uZOOe4NKvSdjAFNOYT3fgDotepmJmotypec6EDYVdNL2v6bhTmNc0i/2JDlfZ/tjoed
         hMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767069471; x=1767674271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+WzwNYNhRdBeULGjK+If30c9dR6hyS9om5xAgt9QlM=;
        b=wOtaoQA5mNGLKi2af0+uTMMaWo1VnVwzf9AhPRjcidDkYMTebOQb5ZWRGcU4U63p42
         1V4VzLo78Fe4rdTWjlJzQMWrIh4dzMPdCE0tkvg3l8CKWkmOBASgke9FzB3b3MXdoz6V
         w9UAqz55qL0ry2U5QAFfKiXWL7fawNtMNzOy52tfO3E20MIMNBzyA1LqPjgx3kM1EKze
         wNdsfApajoDwT+Tgg5pcHmb6aBWYbnzQ0vOfHdp0VEFLLUAOeGZg7es9NoOc6mJBRUa/
         S+4iSsScnIbcvoEf7UGyaYSKvqmTuZeZP2/XODUNLTTU9lN48kOHnYpXLAfho8pDlEEQ
         kpcw==
X-Forwarded-Encrypted: i=1; AJvYcCV7qRoVn6GTPdYZj1RUVSjtNGIZU3z9319bnjA0VJ4yRvAuh08fSdwOasBjISLBxdxJ4u9MQMqGMNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDsLYMP3b0XR0TdxfUOQDQONnDwxAqB90x1GnAeXTvvkU/wqDx
	b2VrgSunO2KPaCtOmiNcI9k0c0Rx6UngAXQqTjKdb1qrn9Tvi9pzPNpM
X-Gm-Gg: AY/fxX69mlV8lA5R0KwPQMZOlB2iknDUGfFia0+i4PrjHH2zm/zYNS8eEXxPEmn5mB1
	2Wtlz7Ps0dTRQUlyQFnxokzck78n5h2WCUFXEoRUezj7Wcad9xXTOfNS7zijqaGqIB6A7xgNsPa
	/EtaytTRCP7yKtxrDPXOk2s6BcRqvwG1SQHyUQETO6EnMgx/Gp7uOIV0zt5DC4R+elZS0mbJdCX
	IblNtZk7AJObd/ZJ/fRLusnOlpH/127HUpwnwaqwdl+jeIywvRCylOok9kPZUgnU2UyQCttRzQh
	bqXK07YtK1r3RYTjntkI5k49yoW+a1lEqeLHVtdOpM52aDpMhBWlEqnnKvjwFGBIE+93oHML7hq
	HE0pXdEF342yW3ztTLsgQtCkLsq4mNm9FOt1J2/ySdMDpojUPrdsnj6QQysCGRZTnPdbE5g1orj
	ck+BWO6inQS6w=
X-Google-Smtp-Source: AGHT+IEKeUoWYu2GFVgDFphydhGZMiQ90h/N0eJheHWd5u/8DmEeLaYgUO7ghOlfSva0c6ncPwEjiQ==
X-Received: by 2002:a17:902:cece:b0:295:6c26:933b with SMTP id d9443c01a7336-2a2f2205155mr305888615ad.1.1767069470488;
        Mon, 29 Dec 2025 20:37:50 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d7754asm285954025ad.100.2025.12.29.20.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 20:37:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id EC9BF419B84C; Tue, 30 Dec 2025 11:37:46 +0700 (WIB)
Date: Tue, 30 Dec 2025 11:37:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com,
	Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com,
	thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 18/33] drm/vkms: Introduce configfs for plane format
Message-ID: <aVNXGrqgNJsnyMsw@archie.me>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-18-ba42dc3fb9ff@bootlin.com>
 <aUyMiJvJX1KhffVb@archie.me>
 <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/cvQIoAKPEfuZFWr"
Content-Disposition: inline
In-Reply-To: <8bed1d97-be75-4918-b033-698d3a49e61b@bootlin.com>


--/cvQIoAKPEfuZFWr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 29, 2025 at 04:33:47PM +0100, Louis Chauvet wrote:
> > @@ -202,7 +202,7 @@ Contact:	dri-devel@lists.freedesktop.org
> >   Description:
> >           List of supported formats for this plane. To add a new
> >           item, write its fourcc code prefixed with '+'. To remove,
> > -        use '-' prefix. Use '+*' to add all formats, '-*' to
> > +        use '-' prefix. Use '+*' to add all formats, '-\*' to
>=20
> Hi, thanks for the fix!
>=20
> I only have to escape the second wildcard? Not the `+*`?

Yup. Try make htmldocs without the patch and see.

--=20
An old man doll... just what I always wanted! - Clara

--/cvQIoAKPEfuZFWr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaVNXFQAKCRD2uYlJVVFO
o7xDAP4oC24X/814znpE6C9oS8vLeRm3x+JFWHtZczhWkK9uigD9GiLsaigPdyYr
VIPUugXHtCVB3MOHE4qqkFF+7PCK6wc=
=AfbL
-----END PGP SIGNATURE-----

--/cvQIoAKPEfuZFWr--
