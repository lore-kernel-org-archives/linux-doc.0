Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B245D340A62
	for <linux-doc@vger.kernel.org>; Sun,  8 Mar 2026 07:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772956099; cv=none; b=gZ/8icfquPo1HFV411xfEBoDgBjJhpVZMi0uAX/0KusLLCpeFW1H2lsdQfv0W22ZpIKR4I0RhI2xdw1xm4YWGBFtXvwxiY3cpFdXypYQLTCGbfrdOvA2EH+EaUuCJCBcuLKVHM2ELlnAavMdD9mBKw9T/cAW/qIOR7H+gz3i5+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772956099; c=relaxed/simple;
	bh=5Kn1rIgXr/VfSh2FYokFQ5Xhl/V9jSbyumwCwi8VucI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RasV5S8ya+009lHS1AJgSTK1QrP60X/Yg6T4kICblOu/Q8QR4Lny7fkis7FbuUfFSIM/WbFDEthnxdR+VnSfWJ4vp6iIgf3GpkCZ49ggZxFpxSPHragHdwozxt8g6YV5jEoa3rIFsPZUeFi7qSKUV9Gt38YglotXolDgV3iBGng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLCiyfsE; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLCiyfsE"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ad9516a653so43680685ad.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Mar 2026 23:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772956098; x=1773560898; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OmbQKad/yw7sNPhRMboDHSs+lSb0BUfzcUHLjfJzC4c=;
        b=fLCiyfsEb4aFwrwUI47NuHrA0s3FSv4le9OAIXnim1UqAxzzt0EbAm4egXa2K9kUvx
         tLjjnr3AUcAfdiD6GNj5s9SQNoaefySw8qwe25FaSi9y9gtfnYvlH8UKdrweJZX7aqUw
         dSaqJxuT4N6HXiaHSpa8j7Vsy9hursjmjUWpx/IPJnuieXz2oV9iCBX5MrpJ598JPv8t
         +HThstHwvmEeC/XuRyuzgPc+C0VBVCgnd+1hj0mI19+P0OxtFjV9WXQKkeKluHxgSrq6
         VRO+mW/nSm38nXeRygpyC12U6FRSsWY2AHJH1l6Sj6+vNp4kFvivULcMF8c40KBzR22F
         jWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772956098; x=1773560898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OmbQKad/yw7sNPhRMboDHSs+lSb0BUfzcUHLjfJzC4c=;
        b=hz5s8D5OZ730ANPMAcSUj8vwlzlPT08A6y3+7ChYO3f7WtcT/1t4+YDLeeiYfj2R1p
         lgd5okrZZnnG2df78ohBHOWMlD0yni9GzazpR/tFUPow+W7xIQTrYOjNGnJC14aWY7mz
         SfYu8S5HekNPoHUxtgdIrJe3+14rgoMOfEH5OHV1X9RTLmUHcfta5OUhQSUCNBiEuB0b
         gQzZ2lLKI9beN2sTQISmUE+a0W9sfrbohRDEajjBZKV/GRyOakA5pYc/M2MxBjUOqc6x
         dooqJ7S/Goun/HZsd51oNYrocTKn2ksjgnOa4GG/dHjDb7ajN2p+OO0h+Aq5aY7NRoLQ
         J49A==
X-Forwarded-Encrypted: i=1; AJvYcCVdPz6fpgH5rV3IeguScGlmY87wJ62E1XYXcPnfX/OGEHvV93YrGcwmOAAM1SUxv4ya5MwZul9zigo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5vSKXaf7fRjAlkjpJL+eCbOghzziAgalWhOKDF1YscxPZ/MLb
	cTX7hphYRGJcWlV/i5j/NWFa2+1lOZMxdPT+zL+B35TcTCVImfQKzprh
X-Gm-Gg: ATEYQzyk3EP6bVZ3Np/nifUt4vToBq51U+8Lt2RmH9OCCMjPtr9a+hUXNks52k1UAnp
	C5WUn/OzS8d6UxlsDxanLJ12XqDQrgcoy9N94i9jwl0Dul9RMdlOs4Y6OnzPHtaiN4BS+J880ie
	3TYxJtqmRWReH7I/ASms8CZtADTqSqIOkTumGhjA2/Cae+uK7la1hqitMF/3snwNq9hgV+kTqJJ
	DAHzrwgF2EAEFQmW6/3hgQK+Fhqfyvhkeyp7FLkwPhhR0WNZyH/ZBuNWsf/2SCC0/x9SU1WCkWK
	CcQ36fP5LUFgSGe8YPdxkOJTlk/6G2d3x1BjuY4HwdoiUnUZOjTKC0GejxcICtj3kOtiiD2FO+R
	bYlRd60GfW9Rpxsx+ZgtXrgLJn91B7CFbQwJio1M1ZYUeAUQtuRPyc2QkRKMUr6FwxFiuzU/VAY
	khLNxSGPWrnk+a+Rr7Co8=
X-Received: by 2002:a17:902:cf4c:b0:2ae:6b54:27b1 with SMTP id d9443c01a7336-2ae82450ddemr76055945ad.40.1772956097968;
        Sat, 07 Mar 2026 23:48:17 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e57b14sm93468275ad.19.2026.03.07.23.48.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 23:48:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6FAFF41FD8A6; Sun, 08 Mar 2026 14:48:13 +0700 (WIB)
Date: Sun, 8 Mar 2026 14:48:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Evan Ducas <evan.j.ducas@gmail.com>, wufan@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: security: ipe: fix typos and grammar
Message-ID: <aa0pvREYJYrAZRsB@archie.me>
References: <20260308031633.28890-1-evan.j.ducas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vB29sbE/bA8VxDG8"
Content-Disposition: inline
In-Reply-To: <20260308031633.28890-1-evan.j.ducas@gmail.com>


--vB29sbE/bA8VxDG8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 07, 2026 at 10:16:33PM -0500, Evan Ducas wrote:
>  As requirements change over time (vulnerabilities are found in previously
> -trusted applications, keys roll, etcetera). Updating a kernel to change =
the
> +trusted applications, keys roll, etcetera). Updating a kernel to change =
to
>  meet those security goals is not always a suitable option, as updates ar=
e not
>  always risk-free, and blocking a security update leaves systems vulnerab=
le.
>  This means IPE requires a policy that can be completely updated (allowing

As requirements change over time ..., updating a kernel to meet ..., yet
blocking a security update ... .

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--vB29sbE/bA8VxDG8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaa0puAAKCRD2uYlJVVFO
o5byAQDwdsUfbgqZLGBn546xcdOSlCftJat4qLbiS2NcDKE+9wEAhe+mAGEuqNq3
sg2kekxxONJDUWS1X7oX5QJCwRIH4AM=
=3l/q
-----END PGP SIGNATURE-----

--vB29sbE/bA8VxDG8--
