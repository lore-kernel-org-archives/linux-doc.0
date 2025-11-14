Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247E43101C5
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763116200; cv=none; b=oj0X+QwpLQZD2qTYNTTPA9tqL4ZgpZcGyfY849N5PHALo5wOGikk/jZ+7BVOFrHwV7pSKBI+654sD0WD9kJnW4uIo3migpoQGBzGsGVucwYGfSMma/heh6IWW+6e7CpUc/MaRJHcFWSNplmpYKBhT3jzWhPvln0zOz7l+T3WEgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763116200; c=relaxed/simple;
	bh=UBbZsb4dMttftP1M96cy0ber+qZ1LFIDjn4+NP/XX9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDGgf/wv6E3xyUSLKuXELGLQEwphs9Ug+quRy/Djqydf/NanmT80IUTMgcc2/HtSwWuadSZT9h+YPbHpmunJCmSuYVMQpXk21ZRt8KejayTKQbKkvPG6zrZUBWamPRjZFX/P1H+xGBZNnKc5ri6v+mPfVu3k898vIC09BAotTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LQPgESbz; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LQPgESbz"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2957850c63bso18814295ad.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 02:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763116198; x=1763720998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=LQPgESbzX5BOqhCp4NEY+J7fatJ5kJEBi/URbCmEQTydrei7PSWmjTww9XecYsgLU4
         e5vIeUwLeBL+nBZFqkadQ1DacS/v+kZZP5L6oHR8jezQe7C/RW6J4tdOlVHcOs+RtKs6
         cLciyWQHrjyVLAoSb87N7KstdULo+RYPXk/5e7NseyzlArtaxaKSV1IvEdT5m1btAwdb
         Ig9vkPDmWfaPh67nqosHX8ckFnKR1IoNTN/TWPQcinwIctjFmoRYjIA5IaMe4PvVrT5s
         0z/pOgeZTEKX/IggHrZFlmD+8gbZVw0o2xrVw7URQ/q95QblUGXeRyoi+uAo4zKua3bJ
         i1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763116198; x=1763720998;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3y1+oIlNcBvHQ2j5491FzfotPp6frKmcPxBxDRPYTII=;
        b=h3EzN/VGJDkuTuDlBAz8fCShJWz0YvFgZqGZ7vjpCvYRC/LC7RebpytHBuNzDRaWl6
         0yDOqocUJibfSPFrjD1PGWnf3yxsU9KWFHnhuk4aGPNLz21ZWFHeNaGlviA4c1gnwL7j
         ujsDgHQqXxTtxrIEjFWYzUpToJAxgtd5gV7767ogLsL2+O2gLejF8nPNvqFphb2jo0sy
         alrGzssK/F7Xqj0PK9c8k+VSDM3NuNm0PPkLl5HWIyTAaz5LDChLZhUDVcZmTbbnZ0kr
         +YrKpj1kJgdjg9Jf6Ck2Ybkx4ST1l7MmiieLtkhnJG9L7aoYYSvMdJ4Ff0djnqNGP0pd
         6NeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnz715NhPcUF9GYeVHFBQaABZrchDzgkf86+1gQOzliXZ2A10QCpfXqBVNUpNCymfTw7kbu/jnDeI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0x2uXvN9GJE7sCYGtIhZSzLQHvB+bbl2f5kTLSSpVf+e5DAJ7
	ZTDWREmuYuUJVnlEX7/ZkqPDkvD9FIiYj5OC46QSpnLh9xN53h2f4oty
X-Gm-Gg: ASbGncv+cg9SEtXtlCVTt/Ka9CmpN65GC8tEzIrQ1jOvnSicAI4FZ/rAhhaKGedWmJK
	9Ce5r1KMKe2HcC2jA8toJq1CAUA4Co24DOPUEOu3c5ck0WPhq7jXjUQ9Mw8veGerDaUWqMapWff
	LDkJ0o1JXBNQlwcR8csDYafVW88OZ0GZJ3LJpMXK77PEyRCCWYXmpxFJk+TzqwH2hZBuOITLRmr
	okerdgBYi40ndd7x1A66TSp18jxHwlCgRMPqIEpx7USqI+MjpttsIfIazBX+WmhV836U0JgE12Y
	qYhIgPBBhiqRnq08OcFZ4HrMevzLiGB1GM5awaozhh3ngyDkdEs9EwOnjW7ECmDc+oN0Z6ud5Dc
	2YztLsYmMZ3F/G9JVAUBHtGVJXnA6bf0WgIFKVrm+bbXQ5HCtezaloDmnlRkYBgl2GyNHjGGyOv
	FScd727NpN4SI=
X-Google-Smtp-Source: AGHT+IF+0G1Z72gXcZasFEt+dR8TBz4EQdEyh5TXVK7VWrLSbxyg9r+z6DMShwpU4TKnPXmx9Qni9Q==
X-Received: by 2002:a17:902:e5c7:b0:295:6850:a38d with SMTP id d9443c01a7336-2985a52b1abmr69212555ad.19.1763116198280;
        Fri, 14 Nov 2025 02:29:58 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2b0710sm50609975ad.66.2025.11.14.02.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 02:29:57 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 95E2D4207D09; Fri, 14 Nov 2025 17:29:54 +0700 (WIB)
Date: Fri, 14 Nov 2025 17:29:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Daniel Baluta <daniel.baluta@nxp.com>, corbet@lwn.net,
	andersson@kernel.org, mathieu.poirier@linaro.org
Cc: dan.j.williams@intel.com, cedric.xing@intel.com,
	pasha.tatashin@soleen.com, kevin.tian@intel.com,
	skhawaja@google.com, yesanishhere@gmail.com, taimoorzaeem@gmail.com,
	linux@treblig.org, arnaud.pouliquen@foss.st.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, rdunlap@infradead.org,
	daniel.baluta@gmail.com, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: Fix filenames for remoteproc/rpmsg
Message-ID: <aRcEoX9saonpQuvf@archie.me>
References: <20251114065746.901649-1-daniel.baluta@nxp.com>
 <20251114065746.901649-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+twDMHafNSzP9Og8"
Content-Disposition: inline
In-Reply-To: <20251114065746.901649-3-daniel.baluta@nxp.com>


--+twDMHafNSzP9Og8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 08:57:45AM +0200, Daniel Baluta wrote:
>    This document describes the rpmsg bus and how to write rpmsg drivers.
> -  To learn how to add rpmsg support for new platforms, check out remotep=
roc.txt
> -  (also a resident of Documentation/).
> +  To learn how to add rpmsg support for new platforms, check out remotep=
roc.rst
> +  (also a resident of Documentation/driver-api).

I think "also a resident of ..." can be dropped, since it's redundant (it's
already covered in remoteproc.rst cross-reference which transforms into
the link when you build the docs).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--+twDMHafNSzP9Og8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaRcEnQAKCRD2uYlJVVFO
o5FeAP41XfZ1+B4P84roVhLdJjUIeYsbQoCOQ0JR5L2Ed+SfzQD/TQHSHzxQVA2Z
NrSRvC/d/fqFsQeTCtXU7p2M914xbQw=
=Lenc
-----END PGP SIGNATURE-----

--+twDMHafNSzP9Og8--
