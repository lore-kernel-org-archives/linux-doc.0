Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774CB329E54
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766558502; cv=none; b=k5poLcsQezXFjLCj5jlwhn9YBJZ5OPIvy4ZTXaG3Hyrz1M9hV0tNNkMVkjoSgqEot7KouSpV7m/VIiOVp04W+Wpnx0PxElZUp8Ao2pDHSqqDGghLl/AlKhWb8gIzGVuyba6USIR+ee9z8nVRDFz7wYuGrh2CQWIkmlTxIw7pwU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766558502; c=relaxed/simple;
	bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bkita0kqAf+rBK5gx0MSpc3tu2JKPte46s5Hv2Y3/RvBicIttUyuKAAyr+EUogfQ+biadW2ktHa0+OBheeoxO+bzK0f1HG7F9XziDwbPOylyo9QB6nz9S5VbvB5iEUov/Vp5mUfTdpeN3I6gYm+zXMCWfIwlpnjnQwqxpoSv6Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDiUnGRg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDiUnGRg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-34c1d84781bso6476226a91.2
        for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 22:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766558500; x=1767163300; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
        b=cDiUnGRg7gZttst+TV1V9JkD0d1KjPsHPo9O3JXNb9QM+aX7P1r2HTXlRQfeLZfEDf
         Q/IUXll5UMRLMnBhEhLTLedaR408EpejWcPXSsuaL9ESjoc2k775QWHEssz3XRIAsCYO
         UJL/2/wk/TYbj+MdF3aYqZdr6KBPdBo8FlohoeMc0xYPBPtp0eOU4Vd8ECZ+si+1eU6m
         AVX7qqlrY2HFh9WDZ7nbKr0yyBluvEWZla/25PVnzRdbk16uBn/MsKbt7T+qeQZEBLWV
         1tIhZqqgyiaBy65oLjQ9U4SpwiWG9EQvVHuL3txgaP3cj0gOXpC5LfDbA7PKnySGhzT5
         F68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766558500; x=1767163300;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bq+vufCo8wRGet2ZSxB+C5P+sd2ZOC5WrglH1AMUSBc=;
        b=O8u8eSSFgngJsHd85hKCIcAqTJ0vkGRxjbnHLvgOzoC3nRqWz3MNd52Cz5IjiReOfx
         aHck42sBSw/lXMw0M7b7N63TCBLZubRA4SnbTukR4MKClpzDH5FMHDPmwIxi7GybtwF2
         eRgjaCU8iaGtbB/Dwi2634ULohTtuijK5q9dvYsighr2Qtz9/dSDlxcemKVz0hBLsOE9
         6sjDzdB9itlmySlxDUPeNgwLifSMRxAyyFugBtIiLFLz79Mv/nQJ10Czmnka3MWskiNp
         3ZRiwbL9yr63p1Z9S+hrMtP9cyuXjSVPDyslMMhZNRSnGijv3fvD/HfJEITHzX+nIFrt
         9YAg==
X-Forwarded-Encrypted: i=1; AJvYcCVrN0M/Jk8S4yeqrJSItvo6ZV7mVqc064iHsBz3sUQRtFcnkP5Nh9zgR3j3L31yBRPowW8BlElLjDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgm8y3NLHNRx+J3DVYwmEcNTy0QJBFO4xHakjrLNGUSI4gE1p
	fP3wYUcgxnlFRjoKuy0CISwO1TyGYWym9k6roxzRTxltB8nc6EvJkPLw
X-Gm-Gg: AY/fxX7zeLWFvgv0lDAeikDJqTnCpJSJVHkMCvMZmNw4r+Bhb/NhR9F+WkWpKaHbFzz
	01TMX14eCix8Rpjx7EelOC+a6QDfhPSw1Gv1nnmNh+rw0Xg/HHTTqWcAf9mFmur7sDrSt/5sl8+
	SnRziq0L4BZ5pSpeQRuI1qYLTqODPsm4pF1IgoJVmXyS3aJuTrcLNaQT/zMvB7RdmaKZj5tF/f5
	toFDVS6p1TTOuEiGNU2qHBauzptgzaloGrHW9dn/g0fK/tnDnO31ALbAblQtcu+IFb0XHTX5Xcz
	Nj1KLYvJrPY6JtHwA6+gnFIq0hODB5a7sOT4qkM8PQmoB3AC1E9TRJjtoPeaDXvCcFxKpGeDscZ
	R1nm2PePhd7X/L/d9NSUs7VhV6/gfnx7nfG+b5hGDWUjgKLoZ4v+eXNjuroenPnkmUgAQ//tlO9
	YBWWhV2Ocmfwg=
X-Google-Smtp-Source: AGHT+IEgCZoyx2O75kxoEMfoJk/QK1exkq2h58uTDwsgQiSgm5wW6qFv0Xa6ZtRpSo46krMU5VkaMg==
X-Received: by 2002:a17:90b:6c7:b0:34c:a29d:992a with SMTP id 98e67ed59e1d1-34e921d6cbamr13205903a91.34.1766558499526;
        Tue, 23 Dec 2025 22:41:39 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9223adf5sm14661068a91.14.2025.12.23.22.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:41:38 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id ECD6A420A81F; Wed, 24 Dec 2025 13:41:35 +0700 (WIB)
Date: Wed, 24 Dec 2025 13:41:35 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [REGRESSION] Unexpected section title false positive warnings on
 DOC: directive
Message-ID: <aUuLHzk5jdyBAxD7@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ZYU0AtWDRBkFeIb"
Content-Disposition: inline


--8ZYU0AtWDRBkFeIb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Building htmldocs on docs-next currenly produces about 50 new warnings; whi=
ch
all of them are unexpected section title on DOC: kernel-doc directive, like:

/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers=
/target/target_core_user.c:35: CRITICAL: Unexpected section title.

Userspace I/O
------------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'U=
serspace I/O' ./drivers/target/target_core_user.c' processing failed with: =
SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/targe=
t:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section=
 title.\n\nUserspace I/O\n-------------')
/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include=
/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.

Ring Design
----------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'R=
ing Design' ./include/uapi/linux/target_core_user.h' processing failed with=
: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/tar=
get:28: ./include/uapi/linux/target_core_user.h:14: (SEVERE/4) Unexpected s=
ection title.\n\nRing Design\n-----------')

These turns out to be false-positive as touching the source file in question
(e.g. drivers/target/target_core_user.c) and making htmldocs again makes the
regression go away for the corresponding docs.

Bisection (with git-bisect(1)) points to bea467aa5da1f5 ("docs: media:
v4l2-ioctl.h: document two global variables") as the first bad commit, even
though that I suspect that bdd1cf87847ff6 ("kernel-doc: add support to hand=
le
DEFINE_ variables") may be the actual culprit (regressor).

The full bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [7f3c3a0a9103dc92c823f27db3284ac2914e7558] MAINTAINERS: Add doc file=
s on real-time support to Real-time Linux
git bisect bad 7f3c3a0a9103dc92c823f27db3284ac2914e7558
# status: waiting for good commit(s), bad commit known
# good: [9448598b22c50c8a5bb77a9103e2d49f134c9578] Linux 6.19-rc2
git bisect good 9448598b22c50c8a5bb77a9103e2d49f134c9578
# bad: [5188f6bd408f937d81c0c37eb59ddc1035cd912c] docs: admin: devices: /de=
v/sr<N> for SCSI CD-ROM
git bisect bad 5188f6bd408f937d81c0c37eb59ddc1035cd912c
# bad: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h=
: document two global variables
git bisect bad bea467aa5da1f51834501da3ac3c40204027a221
# good: [82e87387f6e2af9f69a7528733e953fd22e815aa] Documentation: kernel-ha=
cking: Remove comma
git bisect good 82e87387f6e2af9f69a7528733e953fd22e815aa
# good: [bdd1cf87847ff6aaadd53a185209d2bb2db72165] kernel-doc: add support =
to handle DEFINE_ variables
git bisect good bdd1cf87847ff6aaadd53a185209d2bb2db72165
# first bad commit: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media:=
 v4l2-ioctl.h: document two global variables

Mauro: Since you're the author of regressor, can you please take a look on =
it?

Thanks.

#regzbot introduced: bea467aa5da1f5

--=20
An old man doll... just what I always wanted! - Clara

--8ZYU0AtWDRBkFeIb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaUuLFgAKCRD2uYlJVVFO
o83XAQCJcTXukZzv0/X0PWBYI57OBqNpUtvshGIWlzzmT8UfxQD+Ip7xjplmoYLi
6BbKfNq/aBq8OqXAEbKfzatPtLOg+gU=
=AUip
-----END PGP SIGNATURE-----

--8ZYU0AtWDRBkFeIb--
