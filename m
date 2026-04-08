Received: from smtp.xn--rombobjrn-67a.se (nestor.xn--rombobjrn-67a.se [188.126.83.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C0737F8AC;
	Wed,  8 Apr 2026 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.126.83.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775674597; cv=none; b=eDrf8iuZQuQu/84R3uKM9yzrurN+zR9w7+rDU61FttKwbvfyh2vbz4OMjeGmZWo+IT3M/auFCKZtyI3311zK3tIpby8ZMMGp48yFT3d4EUQFIWrUTwaaiMHQ9QMmAOFdYReUI51G5/5f2ugztcEIHUYs3saitOf0fQLlh0Q/iGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775674597; c=relaxed/simple;
	bh=74bUTtWRj53uPbyILS51m3EgE5M2Jhjft+6Rp87Xp5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ls2LGK9Tcjy6tqPyEFb7KqzrUarv0/OV0Gx2RpP3b696tzGR3njKB9j/kajsScxbgQFHPTzHsxR15Btfl2b5Bu+yhx0aWui4MqtOSEtX4aoSzpLN9bFNAouJ6vQNWQyPkSMRmIvstSEq1i9tMTixSiThkr2CyR+5ZSVqXNu43kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se; dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b=J1bvU/pk; arc=none smtp.client-ip=188.126.83.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xn--rombobjrn-67a.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xn--rombobjrn-67a.se header.i=@xn--rombobjrn-67a.se header.b="J1bvU/pk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xn--rombobjrn-67a.se;
	s=a; t=1775674587; bh=74bUTtWRj53uPbyILS51m3EgE5M2Jhjft+6Rp87Xp5k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:From:Sender:Reply-To:Original-From:
	 Organization:To:CC:Subject:Original-Subject:Date:Message-ID:
	 In-Reply-To:References:Original-Message-ID:
	 Disposition-Notification-To:Disposition-Notification-Options:
	 MIME-Version:Content-Transfer-Encoding:Content-Type:
	 Content-Features:Content-Alternative:Content-Location:
	 TLS-Report-Domain:TLS-Report-Submitter:MT-Priority;
	b=J1bvU/pktDUB9KG8lxDmAML17cGo66TCIudOlliQ76OZMrjz62HyiVIUo17nQsx1C
	 Mi7mD8vlyPW4+f4Wdmy0tn1WlkZj2OkgleiWwGTunak8/lBOhpQviHZDEf6UrbdH54
	 DZQga3BWITor9JUYk4EY3RBg3Z9fsv/gR7dkYcylcXBafDJA8oOSrY88RdTuasYnJI
	 TT2j7kYIOx/3IWLuNMxkO4r1zqC6Nwv8lw8cBmj98+gQD/Qkjtp4Pkdb0Ro+31vW2B
	 07k5AT0rdJ3a32u2thW+lkRpVxKG2EHfV9qajFnYrOJinpovwt0nzIje2S6mxVOwCM
	 tZ7+Nqyxqpvfg==
Received: from tag.xn--rombobjrn-67a.se (tag.xn--rombobjrn-67a.se [192.168.72.9])
	by smtp.xn--rombobjrn-67a.se (Postfix) with ESMTPSA id 75883407E8F7;
	Wed,  8 Apr 2026 20:56:27 +0200 (CEST)
Date: Wed, 8 Apr 2026 20:56:11 +0200
From: =?UTF-8?B?QmrDtnJu?= Persson <Bjorn@xn--rombobjrn-67a.se>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: watchdog: fix typos etc.
Message-ID: <20260408205611.0f7e38de@tag.xn--rombobjrn-67a.se>
In-Reply-To: <20260408031212.2510235-1-rdunlap@infradead.org>
References: <20260408031212.2510235-1-rdunlap@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+rlzkhh_hpx/nMAIqn/8Ybk";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/+rlzkhh_hpx/nMAIqn/8Ybk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Randy Dunlap wrote:
> -Similarly to the softlockup case, the current stack trace is displayed
> +Similar to the softlockup case, the current stack trace is displayed

"Similarly" modifies "is displayed", so the adverbial form is correct.

> -The core of the detectors in a hrtimer. It servers multiple purpose:
> +The core of the detectors is an hrtimer. It servers multiple purposes:

And "servers" should be "serves".

Bj=C3=B6rn Persson

--Sig_/+rlzkhh_hpx/nMAIqn/8Ybk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signatur

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE52SginNFTPmg+iBb4Tha3NZK5j8FAmnWpMwACgkQ4Tha3NZK
5j/ltA//T6HOcqCdM0/2cdpjKjaM1pTVdiVlVvssrOnYUvHlSU1pv5P615Xx6DEF
zJ+z1JEWleIzmmdd3FsmrrB0896scyadmt3myF0ktuM3GtJg7lvputH+VfjENbmK
emaj1/GsLBBacFXKpDICo7efdyuBRTOyPCUsyP2bjwd9tJZwOQv6HHyRGzUBp7lU
dlLnv+TCSBvO57OKlOk1ELpcWBBL6Yz9vZ6OqniyEdXcd+8IlasNMSck29fVe+Kb
7Vm+q4rvgkocJelO7x/U19FiEUy5FGwEY1tisXNwJUrAadC4/pj89LSiecLYrYss
b3qkjiXbechaWyHsUWJTRsOxGGJlOENPgYvKjnC9/x6J7g+JtNXiwy2Y2yX08Aol
EDTQPpRxNQd/ou0xzIuwToXxQlB2mehI5BUic7dBiCVRwvrDbgU4iEPVHiat4gGV
w181fUQOkai1Jf2AuYJtBMYhyvx7xVz6+Tl+FVrgz+DAHv3Puj/kef7Ry8Vd5kXe
s28iq/+KmqyWGUhvBUXy8+667opRhQhZOJZBDZ4+AnhXLmlszQs8ZOnQOQujZSPm
krHVr5GNw+rx8bGf/WQXbPSERnpuzZx7BrASdu3em3P5AYpoenjT893wpYbpwL4h
9hRC4i+v0E0ouy72lAMVESGFfokS+ps9FfGYPD3A9NO5EtNp7wc=
=Xnfy
-----END PGP SIGNATURE-----

--Sig_/+rlzkhh_hpx/nMAIqn/8Ybk--
