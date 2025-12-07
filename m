Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CDA2EDD6D
	for <linux-doc@vger.kernel.org>; Sun,  7 Dec 2025 23:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765150912; cv=none; b=FUiTKMqaffoP4+3GnMWRaU4ASxSLRBUnov+HplhHxtlMPEbWqssfhOFCECDohvEcMe/SUOI6Vh1nwaGrZk8onWNEQo9WbudXDyUsAtyV4w8O/vci+b9M9KLUbKQvsatSzWRRenSRivCub6ZYDW/odAGEbtBCnNgLUsz9FQgLYkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765150912; c=relaxed/simple;
	bh=Ivhz9eJhtA2WFq6BRtgxEyW5GpZSxj/TOYXDvllThhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD7YVyIKN4QrdcVCOgbPzxs5+roFiDeZ3Zpxzqoxvq4ddngc9csGXEzRsC+SdSTPTL/JLMTEBIJPW2Prgsx51i5zrmgtT+SCwNasyXSRM7V+ZQFT4fz1o7UrQOQ+huehgkzon5YqhrdRZobzgPt+OXaS5sROYKj/Mz4qlEH0NwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IrYdDNr4; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IrYdDNr4"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-340a5c58bf1so2554040a91.2
        for <linux-doc@vger.kernel.org>; Sun, 07 Dec 2025 15:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765150910; x=1765755710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/s1e4pCE3sDAirr02IBGKlhX27TXdg67IhWqup98pp4=;
        b=IrYdDNr4rjAEHAktVTbCVq0FE1ZsOJirYFkXrHg/A7tBMMyim/JCtQgZT/Fsj1V1qS
         pnbIEE6D5NHl8Y0al5ZHh4JYrnm5oPkMqwj5S8hD100WSI0GHmGGILkOaAJEpCNjjTXt
         64nl0UsItuIr80gXQd213tvtWnAfFmUM5qDkQkSw3KSq1dcnD6PDUjU3azlEi63DegoJ
         hth2esbVksd3oo0e3Vp8mC9KCD+xtzEu993o0+kpnG9M+rlAhCWfmEiYvUfW58y3yRsk
         RkSU2v2lhu1MiQyRcqjPkAo/KvtXf+zKsgLDzmg/eJzwOJUWnjpaYIhZzc0KEaKs8qNf
         D6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765150910; x=1765755710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/s1e4pCE3sDAirr02IBGKlhX27TXdg67IhWqup98pp4=;
        b=hjFPsleRpsEMQaQ9OtpYAHTzBqdQBX8XJf7zNMY25PF3miAZu9h0rk7kSZ/6Z8iaRz
         7S5+9HR2TsYyM89Q32pXSGIO1Urzc46NR5y5HR3MrY6wwcXpA3bQyATFMmsJY+e/6cbP
         2lKAqnsJ7u27gwjeqOBMAPOLt10WN894o9A/5DAKUTPBC6JWrUL4lw15qNvF+6nmRedJ
         pGFoy4UrA2DbYxsHiaadnfvn967UcnNn5mVJ3AqAw479SOG7drThN5SqABWuLYros2hu
         nbpi8JGqEDPKCRkGLu8OAA9JVLtAWXB9IuBQkYs6wqurRtqtQuzO0P84RakOvV8ts8m/
         GKSw==
X-Forwarded-Encrypted: i=1; AJvYcCX0PImqOPCkMsBedd+dq1bmgCn/rqhdWxoCKA5OAJaSSyU+KLXpBZ6F2afRiSn2yUdE0YCrIGB1fH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlyCFDgZp4LcwySTZltWFeZRkmk0fdjkjDjH2YmCNGiCWa7iG4
	Yuz93PezbE+1WTPtHDxJC4phw/P+6MNsOd73ZeZT9DY+n9mkBCN5YA3z
X-Gm-Gg: ASbGncsIgWjtg6qjO9AZ/5Vq5QQfi5m3XZz7zB80nBLLgYPfrXTrRDdUOagG84/WEi/
	lcRvy2zIm92bTqD3gZfQA33BIhmW9yQDGPOG24+bcN5ccctQvMKBY1BPd44CBB/46pv4pnfqQBq
	3uEjJ+qiaEfkZaIDSlpGRPU3NoAQltRf3aDnoU8+e6aoVwwO4QeJtrZlo8+PcGsx04q/9v0XCYz
	YfQdS/ejzLyMLiT2Wa5/SyKmt6F2PwjFZKatsuBpSq6XyDkvHhZthlRlQBwM6LYDCWiSls+Z4uI
	k61R6JwRDdI3x+HYuK9TWToNDr2TpVwjqLdVoO9ZRFgWkKfdtIl61KvjEkUstn41yz0WNuhWl8w
	x2PsSujBbQnQ7uhSp5qYApBb9UKboqzAwHAv0lBnbXhcEKNfIKH7/7ilXGVNFdUYPWCOVblNFfx
	JTzyjIf+DumGA=
X-Google-Smtp-Source: AGHT+IEQMEwlEU/bDZBDpyHZrvavXvhWLT325cjsFx1A6f6EKDqOVRFptkQe9AcvBDwVTTccpGl6+w==
X-Received: by 2002:a17:90b:2dd0:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-349a25e7d30mr4813565a91.14.1765150910254;
        Sun, 07 Dec 2025 15:41:50 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3499ddae025sm2440547a91.5.2025.12.07.15.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 15:41:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id AB6C3421DA1F; Mon, 08 Dec 2025 06:41:46 +0700 (WIB)
Date: Mon, 8 Dec 2025 06:41:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: =?utf-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: improve introduction wording in howto.rst
Message-ID: <aTYQus43mIbI2CoS@archie.me>
References: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="txuBXE4iSgvoAZlm"
Content-Disposition: inline
In-Reply-To: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>


--txuBXE4iSgvoAZlm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 07, 2025 at 03:07:43PM +0530, =E1=B4=8B=E1=B4=80=CA=80=E1=B4=9B=
=C9=AA=E1=B4=8B s=CA=9C=E1=B4=80=CA=9C wrote:
> >From 56985c72f365c7f0e9ba8ae66ba99c198c15128c Mon Sep 17 00:00:00 2001
> From: kartikpro9599-hash <kartikpro9599@gmail.com>
> Date: Sun, 7 Dec 2025 13:53:02 +0530
> Subject: [PATCH v4] docs: improve introduction wording in howto.rst
>=20
> Signed-off-by: kartikpro9599-hash <kartikpro9599@gmail.com>

Please add patch description and also make sure that From: and Signed-off-b=
y:
identities match (or pass --from to git-format-patch(1) if it isn't the cas=
e).

> -This is the be-all, end-all document on this topic.  It contains
> -instructions on how to become a Linux kernel developer and how to learn
> -to work with the Linux kernel development community.  It tries to not
> -contain anything related to the technical aspects of kernel programming,
> -but will help point you in the right direction for that.
> +This is a complete introductory document on this topic. It
> +contains instructions on how to become a Linux kernel developer
> +and how to work with the Linux kernel development community. It
> +does not cover the technical aspects of kernel programming, but
> +will help point you in the right direction for that.

So basically s/be-all, end-all/a complete/, right?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--txuBXE4iSgvoAZlm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTYQtgAKCRD2uYlJVVFO
o/5yAP9HX5yjXcobNftbJincTQEts0jlU9l3b45aR/Rgmw0i6QD+M1K2VS5/cXTo
Y2wauecNJP+fhDD8I5KGXzoKHqk/Qgc=
=Iv7w
-----END PGP SIGNATURE-----

--txuBXE4iSgvoAZlm--
