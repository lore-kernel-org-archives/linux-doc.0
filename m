Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442B01A9FAE
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 00:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759882276; cv=none; b=eH2vP2doqThTYT/+NyoCxy6K/9qjRdteN/6eJd2pQXTSd7tJ6CoCkjN6Uq/R1ik1bGcdMk5ZHKIHMBf5ONHyJlt58Vl6r5u3lp9xr+bD0rqvbynvqBi586LZm+gs0vfKXqv0ZLV1yPEcjTPBF48ElI684I9k2n2m5iovV6MAFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759882276; c=relaxed/simple;
	bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8jxnPJ3gnFCTdzizosUAYgxl0zbCehyMhqdjg/qe2mYHJp06WBct4nfaOKXXRY6YkHC1CmiAUQxI2CTffib1bzuUe2TUg3A+U9AlPbjf+Q1rt0xkIB5lWXPCZeJxbqDEmJBvanHj6kisx4ZzhAIaVFOirLuzHfyPfP898B3lzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqPvGvGf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqPvGvGf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-781206cce18so476027b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 17:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759882274; x=1760487074; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
        b=DqPvGvGfwdmRIVnyIqALBpWdX64FDmbXB7dT3Vav6Ml3duf8skiIYDkMDlC7nl+WRJ
         mEVcw5P+VN1nNPcT5drAD8DmGBW35eqfDgtUAXmwM1fqedmZZm4UxyyVYz0jYVRcS53X
         RmI25t1t+MfBDs5AH7eroLGROTC25KcAySjpnafYuZ8hDJ3AREQV1fwsarP92qKJHPrv
         CorwO1uDYwI+AMoSih6vs7e6fb8GNfYLsLtVLktjIWum5Faw/lStkM+ViB0B+OWNR5EX
         +YAOXLQjlgE3zDrSEmDDZRqXz5QOoIszog/mvw+UhTlFoTl3ogXu35YEj4sqsAGxQbUa
         RRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759882274; x=1760487074;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZIJx91VEzutYWV6rmjWMuQo94kEzRhO28O6Sss2x0vY=;
        b=Bd0Rl98r87c7Ctxfrg9B00wGSbwOAck/UIXArJXrzLX9frhtIRJPSA+NPNc8RTv1ds
         oUnrnOdoPfobrHj8kMzN8Xqscokagyv1CVKeHte2DgEh4DImyIFf/pMORuJrhHdsMtCb
         +EXJyQNM0T4S02zjnJNxO7EWErCVMy60OX+K0oXNOpHPINqKV1d/8+Tj/9Y3L+EIFYAc
         LDjL9+8kbq95tTaGEiAtiFRxZQi1F0DlJeeWujJFCGMly4gEnVnN+ZO3hntqIOANdr+O
         ivN74WKqyuxbvkBGRTQnN/Fic3uBw7Pw2Jj2t7JzeltHd0B7h6lteQbSg0nMONd9AeC4
         YjNg==
X-Forwarded-Encrypted: i=1; AJvYcCWabyPAZvUbIyQM2mwX2w5P25RtzipOS3HGnEPGnA9716JWqlDg5yJpdJKxq/agIeEpgYe4g79PZ0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtSIvsHLa3JAAAk75U6jEhlGmdXmahFXdKwn+nvbAtVloULmd5
	GbC1HxbU38iGlafaAB6L0gF1CHOjhpyHzbHNwIOhlcpwTopPxqQado+Y
X-Gm-Gg: ASbGncuWZ2NAT6HOtGYhp1rERF9lNiGlD2CK1fm5j2gevnO5JEujV2mX87RFWrlj/aK
	0hNrXWULojC4T64Qv43i14MZD9L1GRjVhph9vRvDEyrOmaJD6Had7cwRrXk97oAePCNcDXWFYm0
	WZKIgKbASEj75JEJYDtSnxaABIUojBAjMkhGopnSq8JYQkH2AMTDX3Mxd0SC2cQ/wnLCXaC4b/r
	OxE/lJNHiHERJCT/a4Yto0dfDvwFhmEAWqeNYos4CB+4/WqQzOfkbPxGG4xl7yryAobykhZWQO4
	LwiIHzaRUdOVuDPKSNVs9/TNQeqgU4fiXbB2MbNejb7kVtomzmgtIhrdZ6EWCi8YksMreOkSctv
	BvGHmBAPPall7Kj+eWECBc227ox9Q9HCYkNyjQL0LjbcuXj362Q==
X-Google-Smtp-Source: AGHT+IFW3sow5y/lVKkATKYFm04W7RgDI6fSuHLvh6sjhQYKQ7ak+ZYw+RTchKbkNXukK9zwt+mgiA==
X-Received: by 2002:a05:6a20:3d1c:b0:23d:45b2:8e3c with SMTP id adf61e73a8af0-32da8df23aemr1423045637.6.1759882274312;
        Tue, 07 Oct 2025 17:11:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9dcb3sm16910186b3a.11.2025.10.07.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 17:11:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id A0A074233430; Wed, 08 Oct 2025 07:11:11 +0700 (WIB)
Date: Wed, 8 Oct 2025 07:11:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org,
	corbet@lwn.net
Cc: linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev, crwood@redhat.com,
	tglozar@redhat.com, costa.shul@redhat.com, jkacur@redhat.com
Subject: Re: [PATCH 8/8] Documentation/rtla: rename common_osnoise_options.rst
Message-ID: <aOWsH5Lgra60g9-k@archie.me>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
 <20251007185508.40908-9-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W+2lsue7TXY5gcQ4"
Content-Disposition: inline
In-Reply-To: <20251007185508.40908-9-krishnagopi487@gmail.com>


--W+2lsue7TXY5gcQ4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 12:24:57AM +0530, Gopi Krishna Menon wrote:
> common_osnoise_options.rst is intended to be included by other rtla
> documents and is not meant to be built as a standalone document.
>=20
> Rename common_osnoise_options.rst to common_osnoise_options.txt to
> maintain consistency with other common_*.txt files and prevent Sphinx
> from building it as a standalone document. Update all include references
> accordingly.
>=20

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--W+2lsue7TXY5gcQ4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaOWsHwAKCRD2uYlJVVFO
o7BjAQDfo1t5Lr12kg1pMMFioSkS+Xkr4egh4nTgsiztQ9ybyAEAnvnzwOgWbSWl
t5mwwHHqH9/4f2X5NKq6K97vtzUEKAU=
=VmlC
-----END PGP SIGNATURE-----

--W+2lsue7TXY5gcQ4--
