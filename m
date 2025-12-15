Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ED13314A8
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789977; cv=none; b=b6m1fQt3suuAsFO5bv8dYd0Ao5Ca6COVBjqjZz3oAbGc4zc6mtVpNHhFj3XO/3ZBYXAvqvlgabhBY0jrLBiJg5FZISOIknhzQ5uyHbIpSa+eeXHnrHIXxpWXSdgKYACg2tYfPP6s0Tq32YjqKiju5J900HWVvulCUdcwSggndZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789977; c=relaxed/simple;
	bh=z6JBVVpYTLKQYsp6P49h+E3D5NtloPxytMIPj3+CkBU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lppEqNFUBrnWKUO5KVwJH2BictXu8/xkjsqRpetD3U4gHiWRBLlrkB4imDubqoBHeaSp4pJAzhZATSfudu7CNPyAAaBMhbw58r++x9z9TrCt5hdLKwvOJIPvXGa/JTYJfTd2VugqPv4XYLS8DiGOlbucbZhyBmpWls51md3R2Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7M9KKBg; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7M9KKBg"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bb710d1d1dso4653335b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765789976; x=1766394776; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aR0q5gZgzi5K6sLzSLf9sKZOIrpuIZwxmRjvvPcUdsg=;
        b=b7M9KKBgGPToQJYsAJamNY5Tg3zjoWQP+14nRP0nZfoT3EYQsrCOJB5K17hHrKTq8J
         8MtbNxxB/eJESOHdH2FGml10uLlaNhVzP6EDwC9PF5boNwehHq7x76/sczxjqVOJpT6M
         MuUwXR81gkD+WATSUqrZvxw9F98rB6i3w+Sz5Vo5AmL8CA4hxNTOwCGrklwLhGLgIcQp
         +M4JWHr1XWAdyVCB9U4kliRWF/H0QrYfw2p9SW6Z+DmyEbguk5vBGoHdCtz/Mw43BU7t
         NalA0SX1snXBmr+pVkYZ6695TxQgVJJEoVBYUBzzlItBw+yW+UUI09m0ccw18K66Al4o
         FpqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789976; x=1766394776;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aR0q5gZgzi5K6sLzSLf9sKZOIrpuIZwxmRjvvPcUdsg=;
        b=mFPNFGpsFwH+Z3+sshDe58+Z+Z8Pfogh/Qk9KZN2kilYLVLW/XrhchPZpi54D3cref
         mbFRHagSxyVyyIOS7HeopiDtIAlu2nUDofluYuBHc47oBjEDJoLNSZtWTHO+q1rWSE9i
         Dj5CuIctF0kFPeKyVRZtmkvkhQLhWXI1JMKTEzTlEr9/aFKCf9MLBUuzg6JYP/BFhvs/
         zBCZ7M/IoT6RgIk7Yh4YMiqwEXho9jv0USIH4mhWjjxhGX4YpuHMVWL0HIYMLxiI80a7
         uz/ov5SfqCPlOyPLDKBBeuOOyCsUUbdnbRXyT228zrT5pxnva0aQ0ymbIHGCBFP2vyaU
         yXuA==
X-Forwarded-Encrypted: i=1; AJvYcCXQb//NGe9OhsX0MX/nhwfRz3V08Hl+DRYKTwCJcOwqXN6qeRUtgVHaxzYOolemmMn55NL7ACKiqX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgXSydl38lYMIknh+3s5V8KzA+AOnuDFhGmHlcHXEb4K82drp0
	BakyXcAk1Z38D7dxaRqYESoXY5NF1stS25tYuz+tEn/rAeVsQHg6xmnn
X-Gm-Gg: AY/fxX59MTwwED7Wb6tJPIBoZF6VfZoGwv3flr6rAdI1kCaV6PmjnUD2tUSnWSTmO56
	JLhcLxUSoEHYtFrb/8t7nhgosaU/3dp06rVvHD52+Vnhwr6B/9qm/S7PbEAHCT1DjZl2egJ06le
	FBZ5s6AfT77av0AEyv4HREaEk1AeWiJkERvz6CgdJk4mF7mtCiwuPzNCYQl8IiAcHz/+GEAhrUQ
	mTSK6SGWgLVTqX0JxOeDNBsy7t47UVFt50T+K1l/rWOFqmAdHinSgupjawUUjnSMHgsAxfPvxoj
	b2HLjltWBdaGp/YuW6YFXsIFxJxJbXDOxzTCorLZSoh3/7dBWHm+Scx/BEjtd/cPIRTqRjiYknT
	rPfHGidaV5zh9i3jZ6q/gFD38uulRb2RhsONfwdSHJ/Gc2lYsEdIXl92tUDCoaVIBCoU01RjAiV
	M9zWOag9y+H68=
X-Google-Smtp-Source: AGHT+IEo9HFyRxBh3H58peELrcoKXuQEto6liK2jEeLWBCANq6VtutrYLACJVBWT8TeJY4kzXM3I9g==
X-Received: by 2002:a05:6a00:339b:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7f66744724emr11597719b3a.12.1765789975604;
        Mon, 15 Dec 2025 01:12:55 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4bf7be436sm11997902b3a.0.2025.12.15.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:12:54 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 9F95D41902F7; Mon, 15 Dec 2025 16:12:44 +0700 (WIB)
Date: Mon, 15 Dec 2025 16:12:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Crypto <linux-crypto@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Corbet <corbet@lwn.net>
Subject: kernel-doc comment with anonymous variable in anonymous union?
Message-ID: <aT_RDASKMW4RI_Yf@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qEoMnYBTe+dXSVaM"
Content-Disposition: inline


--qEoMnYBTe+dXSVaM
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

kernel-doc reports warning on include/crypto/skcipher.h:

WARNING: ./include/crypto/skcipher.h:166 struct member 'SKCIPHER_ALG_COMMON=
' not described in 'skcipher_alg'

skciper_alg struct is defined as:

struct skcipher_alg {
	int (*setkey)(struct crypto_skcipher *tfm, const u8 *key,
	              unsigned int keylen);
	int (*encrypt)(struct skcipher_request *req);
	int (*decrypt)(struct skcipher_request *req);
	int (*export)(struct skcipher_request *req, void *out);
	int (*import)(struct skcipher_request *req, const void *in);
	int (*init)(struct crypto_skcipher *tfm);
	void (*exit)(struct crypto_skcipher *tfm);

	unsigned int walksize;

	union {
		struct SKCIPHER_ALG_COMMON;
		struct skcipher_alg_common co;
	};
};

Note the first member in the union, which is an anonymous (i.e. unnamed) va=
riable.

What can I do on it? Should the offending member be deleted?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--qEoMnYBTe+dXSVaM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaT/RDAAKCRD2uYlJVVFO
o09iAQCiZd1XPtjXzmtyrrBrzCiDsiuOIlgzXMzu6/NeoJKQdAEAqhyJNLilw7Bb
BgN14Sa2taVF0vxRRwQ4frrJyKVVeg4=
=ly+T
-----END PGP SIGNATURE-----

--qEoMnYBTe+dXSVaM--
