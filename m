Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831293AD538
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 05:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777958646; cv=none; b=s57x1Mmx5VetyTxadu7TXYP8b7hDD4+AH5to14nsHnuqKCFHvYfqtP4ifLFHs+MOJtO86Ok4cWRXqs0u98Nqwd9oAFHd2ipvU4eRIFdyKqoTEHUD/VnT7/p+kSx0hlKHR++v8RKaKScE5dRJ3TccAFa2dSU3TYSfJEq9y+Gx2uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777958646; c=relaxed/simple;
	bh=61BsqqpOV7MXyITf71hmmx75LYxAa0s6VY18IOzvywo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jduq0DpIuRNoz12gelXkUH6r7f41Dp8mVYJUA6YOyRAXKVK9rPk5WZoKyD43nfWSZsMuxSucgVanV8Pw2KBccwp/Ji4YzaqtaWLF7ygNViHfs2wzXGtBycQPUaW6oiw9EG4S9T95OGkuTfAVyy8EB3ygYeYLajIhxmxbzO9vFL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBzUTkHY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBzUTkHY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso2157148b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 22:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777958645; x=1778563445; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcMI2krrZTwNwz0JiZ34uwmEGrsNtS6sWa2GlsOzqKs=;
        b=RBzUTkHYWWvCU05inZFm1r2sTCQ89KdtgNkhwVjx5xy0ADxo4WlBeFXUtR0NIG9br7
         ZPNu+plN2veE6uXqmv2VKU94X0y3CB9kGg0WqoIV7L2wua0wp8Ynrcb0nwUQzKspJkMD
         sWwy2avEuzw3+8NQbYXCwW2jGjQmddjX/7GZFUGXDC8UrC45JcFgy7vJILAef1xkHEnZ
         btqkooA32+l9g7aEzms/YeHt0cgr6FfxDNS6kKP8s9dnv1qgYqWdCqfjEKn36hMcYYLu
         YfeOu76xKO9g68bcTrj1Ko822zH/ooVblxqUxcGb+5BsGfx36fEGs2ciSibAr98bRgKP
         0K5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777958645; x=1778563445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tcMI2krrZTwNwz0JiZ34uwmEGrsNtS6sWa2GlsOzqKs=;
        b=askq0AEh9Ks4uPsAJJybEhgAeqEYqVMskj4oneNWhzxVrNbg3rArmmsJHXoSr8VVmA
         Kjf8OnGL3cQZhoIIcIH+QHKZzVPlIDW11T/MLS5rtD2mbFcRgBJKqNwRNsxezSP4sRAg
         fMY13rtDJG8nu4ZR0FL4pCgZ8T6rk0Z8J3uXMqPJqtHJ4ExDNrqyZbpQTjRSdCThe+IE
         Ud3fVr3MXXagfwzr6+s5/CA0i+1CiZBpl73qy9xGCumxJncD7UK/Yq0yb0auWs50Pflb
         xT2QdtTh0WpaA0rjiT1oouwmM+NzBMDmQyivMUihikIdOQM/dpcWbzlyu0FQdl1rF4+z
         tM9A==
X-Gm-Message-State: AOJu0Yx0MQraHQPrcmqmJpSRcwHzApnO2px9HxPfgrKgzalfTskmpPIS
	kTvX39qLxqJus49wVQNLzw9NhhGnPWgiUnWUMFhuiR6P/w3jCYV+3rP394zcjs1m
X-Gm-Gg: AeBDiesPVYHhkK7Gj2im6rHzyGwO8IaxdXO0s64OmfKd7rJ3Clg6VFPF4/gPN4fmfh8
	mxLs9L/SSEKL2DRL26lXS/pdJxqu5bUFH24QpFjWFG9hHwqWMgWMP68uDGQtvL6Lh7lshsI9OOl
	tlDRi4yTy7nm7tBnnM5Gk3H/E+5MxnM9waVNYVtu5kLUg1DvOTkEzFoIcOfMOTKdZ0Fmpc5rOFD
	q8EEQ9qEKfER1+D7HQeHG7nSnz/xid9Jbfbh9S/PwNdo7kxSo3utpDmZYoKJHG+zwQ7luiBg2CO
	H1OZ+GtaKZM7Rgi1RnRfGb3xasqAxTahF0Ho4x6ovWBfzYZ0iCw40MLwh32kZ1MvTYHN6dhJ+qV
	yCuVmwd7mvbbgRTSJ4pu/z/6N5XeHQUZkPatqc7XQoEYNCAMpm1+3Hxo75FLu9Dj5Xca3feumNH
	hlCCBh0DWMzAfcKCQz5jK1wc/XmZpDSIL+Mtem2F3w
X-Received: by 2002:a05:6a00:1f04:b0:839:12a7:70f7 with SMTP id d2e1a72fcca58-83923e98914mr1718701b3a.31.1777958644635;
        Mon, 04 May 2026 22:24:04 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbdfb0sm717888b3a.45.2026.05.04.22.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 22:24:03 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 52B704194B30; Tue, 05 May 2026 12:24:00 +0700 (WIB)
Date: Tue, 5 May 2026 12:23:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jeremy Bobbin <jer@jer.cx>, corbet@lwn.net
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] fix broken links in bpf, driver_api & filesystem
 documentation
Message-ID: <afl-79jS4RiGpx_c@archie.me>
References: <20260505014839.2670290-1-jer@jer.cx>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/SJVBFCbDAI8z/zv"
Content-Disposition: inline
In-Reply-To: <20260505014839.2670290-1-jer@jer.cx>


--/SJVBFCbDAI8z/zv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 04, 2026 at 06:48:38PM -0700, Jeremy Bobbin wrote:
> @@ -712,7 +712,7 @@ the following:
>     * - 0x80
>       - This filesystem has a snapshot (RO_COMPAT_HAS_SNAPSHOT).
>     * - 0x100
> -     - `Quota <Quota>`__ (RO_COMPAT_QUOTA).
> +     - `Quota </filesystems/quota.html>`__ (RO_COMPAT_QUOTA).

Maybe :doc:`Quota </filesystems/quota>`?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--/SJVBFCbDAI8z/zv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCafl+6gAKCRD2uYlJVVFO
ozxZAP4wdUhsaiU6QEAZa3U2NqZ/PsF1ZOlHFeqH5Y1nd8/JaQD+OSF7c+ZS5LcR
yGYUcDFJvO1lsDB3GVQOa6BxFhu0wgM=
=K7TY
-----END PGP SIGNATURE-----

--/SJVBFCbDAI8z/zv--
