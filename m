Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8392E7F1A
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762161566; cv=none; b=rnVJhByscypTQr/r3g4VQk2uQbO+5OkIJBXL0+qF0A5hFRZpGTSssWpXWxiA8HVfWykx4sTIS0QoQRr8gsyOffma3T/lGsXK76P47uxW29Nf13I98MscK3WMn+fgPNy6WJtWhOqO+RVrLZGoRKb0jrC/eK87gJ1hX5OOECOW5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762161566; c=relaxed/simple;
	bh=64WyXbZBGRcOcQoVJNm15w+ojDOMFdwYnePw0UWBpkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HvZSFU2tEDl5TLaPcQ0gD5FRKZhaDZOa9sIjr1B/dclPdt0EOSlH0CcJNIC9g3RIXOVtY9Z80iB8IqMph8L5v5wMx5gzxDv84lpaEKngc4twxMz6BiLtbwCkBLHT/m8Am58YNvIlMG9YevkkD0g+pabz7eEI7wXQd9NIgCGYidM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2HkE+tx; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2HkE+tx"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b5a8184144dso594850966b.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 01:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762161563; x=1762766363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UpnhjL6BlD7mlBTw7qWADXf7LUA4gVzRlp5FlU4tTw0=;
        b=W2HkE+txKgOWjMxbSMD2HxaD9QSklnWoP4iOIA7bHrlDjG2Z6VsxFY0zzDrLl8JSz5
         FW1PoOC+h2lLcjXgaqF6uvFUD3+VqIrcQRiyk/nQ1ibT/C7JsvLXOme93C8gwjGEvSru
         XEHjpphH7h5/wdxcasaxbiZOoK/3gRQ+MHpEMTtnFaEL3wBoOdyL047yAeYWkc9mq1PT
         boHgqitGMxnGYtA8IpUyj2ZZ1zCEQ6fxSV/FamvUmTMq5K8icjYCjJ3EzXct0dcyMy9G
         u/QYNWBXNmtAlnRh4ttJifVlwJhPWecYGNiFqmu9Tlp/PDZ6pKCp/mMgGHDRERjjKb9t
         2n7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762161563; x=1762766363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpnhjL6BlD7mlBTw7qWADXf7LUA4gVzRlp5FlU4tTw0=;
        b=GmCgUyNbXeIM6ohv+NkcuLewnMK/Fhlosihg6z8o3a1Dh7BFGveo/eLWn8P5L/l2rF
         TufN4JlYt5+nrtxfS9xSWXcFsSIHk+Zc11z9tBE3msGFSZ4F2Bh+xEQyw/sL8gnZM4+H
         cQ3swYWbbqZNp+o0eHYRm6FVl/limTccaumeMOpehnm10LhrzBtT6xsb5jI4rJPluYkq
         2kBxpSPOtLKAV48WRyWVm4cly6AwCgQ0VLAcQOvWpBFAMapxGyYTq46l05dvLONg/UHO
         n3LSp7F4Vkivv5nKw4gDwyS8CYH+FKEsB+Wd5S2ukdLXYCGYNhWImRWk/DTC7VLosr3x
         eR+w==
X-Forwarded-Encrypted: i=1; AJvYcCUrOc0iLBTJDEs1wLj/KKrDFqtt0UVQtCBLYxp7qrgrA6SkKONdYOhZSewv2RqtN18pFc0saI7xjwI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuJWPBZqkRxNUeNa2kOzjKK7TYbrOdpn3iw25eFibQbigxdhOD
	86hFFTFTqgOPZAwGzqKMq613lZM0oEZtrAUNVgA6J0fdNJByBKt8YwxTTp9lkebLaqY=
X-Gm-Gg: ASbGncvx6CVmW0drTlC5UNov4rkoAYsHqBoAAo1dfIqHIbOkB239UFhmzRkd1KgE4LT
	SMgOHIRrUI4uXow2u+A6di+jOaRJU78Yd41lgbPy2Pp53qNZjBY5NvBtc7/lII9mVo/F2RHLtzJ
	wv80QOU45GpXB0ccmBQXBsdjKPyF7zT7/2vbAKZz++F7A+I9QZ5g+V3tK3KIGBH5jLF4dKAr9NY
	F18a303xjy31h5//ICB2DHAGWdvMUWizSkPWn/3E2L/xhep4/mLyzV9/wP9jTR7szjmOk/igOg+
	doGNCfaN8eg/I0K5NSRsEHxe0syI1cnDMIXFtGxYwlN0l48idQ/5/oaQjCtRpmLtbjRIEu1jnqU
	yOid3sK3z7DAmbweGTLY0H5y7o+7mddGsxyWljRJtV3US/qvKEgkR+KjZ3qy/Pr9RDdl0ZElkR9
	H0
X-Google-Smtp-Source: AGHT+IGTDVhFKCiXTzjjSWvc/4QVd/+rs6wcNLKUEar6MkbyabgQICHVWUtg7P1teeT4t38DkqkZiA==
X-Received: by 2002:a17:906:9fc8:b0:b6d:5ef8:4bf1 with SMTP id a640c23a62f3a-b707017a5b7mr1195881666b.19.1762161563116;
        Mon, 03 Nov 2025 01:19:23 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70bedcec19sm292220466b.7.2025.11.03.01.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:19:22 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 077AB420BA55; Mon, 03 Nov 2025 16:19:16 +0700 (WIB)
Date: Mon, 3 Nov 2025 16:19:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Accelerators <linux-accelerators@lists.ozlabs.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: uacce: Add explicit title
Message-ID: <aQhzj8PXuZ_zB59Q@archie.me>
References: <20251103025950.23159-1-bagasdotme@gmail.com>
 <e95704fd-68fa-4093-835c-ca220a9c3f5d@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vShbojS9UlSxKJs9"
Content-Disposition: inline
In-Reply-To: <e95704fd-68fa-4093-835c-ca220a9c3f5d@infradead.org>


--vShbojS9UlSxKJs9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 02, 2025 at 08:58:32PM -0800, Randy Dunlap wrote:
> > -Introduction of Uacce
> > ----------------------
> > +Uacce (Unified/User-space-acess-intended Accelerator Framework)
>=20
>                              access ?

Oops, that's my oversight. I'll correct it in v2.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--vShbojS9UlSxKJs9
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQhzfwAKCRD2uYlJVVFO
o8ZzAQCHxerKfSip7s5lgPkyBTJSz5cb3DRiCat9GUPIyBO9eQEAtBXlIdZh9t0R
9j05JGLCtupdKx1f5aPG9jiInm50bgg=
=jXaG
-----END PGP SIGNATURE-----

--vShbojS9UlSxKJs9--
