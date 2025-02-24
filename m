Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805261078F
	for <linux-doc@vger.kernel.org>; Mon, 24 Feb 2025 00:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740357800; cv=none; b=PCd7cAH1SU06Bx/tbb6WaHn4uHjDQxsXPqjdy+Ealo/G3543QjLSzhnlthGbZ1sIsc54s6jjVcxyxPCC9ty+MFceZlFEWT6RshWoHSnkxrEom23QcS0lu8ialF6PigjS+RoleVB7e25lz7gJ9RqHfxyC1LMPFRXfW8jzlBo7+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740357800; c=relaxed/simple;
	bh=M6RnLG5GFoz7fVUOXsQ/7PMY4Ccerrx/ARqhzO+YlEE=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=odE9/ujrHqLYxW1lDmaDEkkFEntnAgDb4ECo8zlWvPE7HNmvwer+JpAYni4C8y5YBTXZ3wV9ef97Iqrb07R0EmK0c8W3IF70+stf2Z38JiymdDfkUMWAhpYEnQZYJ//YNAfJWMWJIjSpSkvPavuU4+9hzL8PIgg7ylVHXxjyUS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKfoKjO+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKfoKjO+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-220c665ef4cso63944465ad.3
        for <linux-doc@vger.kernel.org>; Sun, 23 Feb 2025 16:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740357799; x=1740962599; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M6RnLG5GFoz7fVUOXsQ/7PMY4Ccerrx/ARqhzO+YlEE=;
        b=RKfoKjO+ZOxsq1Eh7bl1a7egiMRF9MPrszul7hyo2qCjUqSs3T820BFOten6FzmcBD
         AT99RKwL4gAopHs7LNelU9IVHBWRa3UhjZxzzgWNXxPRlRjMewJNlQyi6CJO258jZV9+
         7lNwBI3uDQiFSadfYfWtpTF1aaoZ5dU9g26nJ04a0kjHP++s1EPvkw9nHs7wg4Fk+fIG
         bQRvibxXCxCeGmFnjQKANRXWBLyseLxtXWl4Wy72FJmZp4TnkF1qjQJH5bTreFpetuTF
         3W4eP+ci0eHizZMQd7KLbYO+ZjezM4kN7lD/FHxZA7h3SOD2wUP1c/OrnHs1HIxViH7H
         xyEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740357799; x=1740962599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M6RnLG5GFoz7fVUOXsQ/7PMY4Ccerrx/ARqhzO+YlEE=;
        b=KABR5SYvLjDjRsviRnmmys9eFnOsLXZXWgy8cCpW/eOvxaucyzap1VRq1R8o+t8kT1
         EYOD0AZIRyQDzz3NvgUcKzxmv5A72AwIsH45f9UfU0kNmcTNRQnDWId97VwYKOE1fqc5
         /7BKafnKMbycysYibRc/sgeq8E0UR7kumq6xB+SEPyq7X/3K1GIu6wl5eU1JWtF2dLMR
         X/Y52F56nuHEiw1AegpD8GERbn1qSO2cFphsiAAqFLUuDfVx/3FSM7rrOhmLyJtH+8wc
         ctmUnX+BVDhQM1jPcPFFCnpgWne7sHCZl4EYLIj+cEw2+q/EDkWSxCjYVLJxwJM0s1b7
         Xu2w==
X-Forwarded-Encrypted: i=1; AJvYcCVFkca20l6sMhyr4dDQUyY60HnatCD30NZLGlSwffGZYbACj5LWZPoO5w+hP/4wMRCjRNzadl6TMrk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV+XBaZGKxGq1RpEmIx320UPTmHvARMvJWFAajQRlCp26KcsVE
	nMmccJzeXG5lSJif4dW6orFsfcYTpexmUNtFYhwCbQEG1DpL6BeMMxEp0w==
X-Gm-Gg: ASbGncsp/3J2ZaCjGps4sP8zZHrm4tbBMcQebNdOuUjGf6g295jIhRIld+fu3EaKDfU
	bSKkEiEORJZzQuOAQb5A+LN1To19sAzbK08cglDaOwrlhFY2ejRwq2f80BwZ3PexJwRTGKnxAmD
	9exw+EjcbICp3gwGjwIpaM7bh9YSOoDb34u+jIX/S/nUTklIPSoLBMb6tXyWDeXHsMgg3akAQvG
	zBmd3g5ZggZq7aDbjnRWBBvcGsR9S6UX1MdT6DZinIl/rGLGxrZz4QHrL114qoZSHwKmjGfCoOM
	jEw02lTJ4L5QVMks8wBtSE237w==
X-Google-Smtp-Source: AGHT+IEhUWBAfg/KxcK8BX7ZDWMtBtNFNRXd+Ckvnq7KEsa079bEr1BTLiOxZBo2yG0FujjoL6h3fw==
X-Received: by 2002:a17:903:41d2:b0:21f:33:ad2 with SMTP id d9443c01a7336-221a003892emr166429405ad.52.1740357798510;
        Sun, 23 Feb 2025 16:43:18 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53666dasm169870815ad.89.2025.02.23.16.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 16:43:17 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 5CF424241846; Mon, 24 Feb 2025 07:43:15 +0700 (WIB)
Date: Mon, 24 Feb 2025 07:43:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: James Addison <jay@jp-hosting.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Disambiguate a pair of rST labels
Message-ID: <Z7vAoyqMRPFHiDox@archie.me>
References: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5v1X+TKslsSwCawB"
Content-Disposition: inline
In-Reply-To: <CALDQ5NyCpKKgoaphoV+aM+s6U7Y=iA-umO9LfuUXAM0oi=x5XA@mail.gmail.com>


--5v1X+TKslsSwCawB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 10:59:39PM +0000, James Addison wrote:
> diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
> index 07cfd8863..2d1b6f750 100644

Looks like your email client mangles the patch (the header above should
not split). Please resend, preferably with git-send-email(1).

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--5v1X+TKslsSwCawB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ7vAngAKCRD2uYlJVVFO
ozIWAQCCwWfVHPYA/1iTuSKEx+OLHCz62t5V5LOltr6ayecoJAD/YytZm5IeIORk
dq+x9XOPaU/5esaMDgnt1viFeV3BaQ0=
=7CVD
-----END PGP SIGNATURE-----

--5v1X+TKslsSwCawB--
