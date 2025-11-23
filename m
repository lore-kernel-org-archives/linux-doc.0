Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD61C01
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763856412; cv=none; b=UpFXjf6bllbuHJhjA5vDilx9FeNYBiPUIUaWOqsoBLXD7o+Y3F12ETB7go6Nq1YN8NBY5lv4uqGvyr2zMX75i7fZuW9YM2uqlqOadrtTC9aVvN2IWcJ7OqgPk1DqF0/v/urdSVJ35foOS+u4T3rZHY3+KYk6j5YLF5tR+MhDnho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763856412; c=relaxed/simple;
	bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wc9AIDTJ7Gkvq4PML7iu68EmEbjg8C3JHEA6yByKRPGmFX5mwnpa7WalvQKMIhdI1nN8BJLwKHrR/+DkvVa5b0bzAnkYbfTxPMX02UPXepf2FYscEfGDOHcJL1tudSsvcLN2DKkN2xoFt+psVIAjxOElwlehBpEKWcfoZ+uFd8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFaXfH9h; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFaXfH9h"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso4925243b3a.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 16:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763856410; x=1764461210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
        b=VFaXfH9h7zgE1nf4gMpY8bs9LGFS1wXNGM83eO39tcl1d6guPDbhDKNxGP+sbmJJwJ
         731M5Ks1UdS3lryzGPLAOYVYxmHY6QTbhLtD4vsOb8hbL2uCKa5DxqpHlq+LaBFSS4dW
         wZ0C7okMij2p8tADFcREChXbDnWN6DerL0H1zb1gY6meJa0wZyJ8J6mJUCRphkX9X3Fe
         nR9R1/kBBWFtL4Kh6dX78yC99BDaXDmaLf5I5aqsxKZv+XLexnOVv+VjDaUNTmY6LCf+
         eSXMo4hVm/HkCNK3AAT0njcifv8LXMbb5y+RcZ92C8zBqTqR0QIQambZrhJ20FE55M01
         VPzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763856410; x=1764461210;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ozLZyyGNMMwEGx8RGNf8PFGx0IS1aWwqreSqTCHk5Y=;
        b=WaAo2vKugRYODionA9QvAfN6J2py186iDMOTMvgeEK98RagEgyEoQvF4VOrexLXetK
         U+FKfPf6LWh6taURikV6cUlpkyAbP1KCJaV3UyXRZnLjRrqDnLKA+9L1cGzwdiha/OkR
         uIsVQGVsc5tL/D3CIUTNZkHf1C1o/OX0IfRLQ6ib0HgRei2tL9nY/CECB9g6tkOmlXjM
         i7Zshj7mwnw10OtGJJznj4La+agNRLvf1b8rPv2ZUAV1Lm+r36DqdY6nKlzsmc6T93ug
         ionM9t1J/pSduaacOwNPRfkU327dQZGO+DIivRn0brG0eTut2Mtca7bzTsWKqXR+Wh1v
         3zjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjO/e5AoDMkIqMlks68g4KUW6707aFUmJJp7zjkgQtvQNG+F/GFS6ZTxVn9RTBuYaQvIp3k3/LFuE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxjXzdfByiXo27g20PYkSqrX5kur75OPDOZcLqqc8Dc57SUQgG
	LYPZAs/Q2X45BWRkeL9wsWQUMvCm69dEpoEk2Dl2P7SlrvMYDjHIAmxa
X-Gm-Gg: ASbGnctVk5D9Q7OQA291k94JLWlKd3Oz79zuklzC63WatMU6AXR35ckBAQNCcBaLA7+
	mv2dse4HxwRN+sDYWKb2YppjMErFvT64CL9cKkZxcBgqYHjvVIb0PWSA/7V4hq2q737V1+yRO/3
	6M0qBTWMi51KzmPpxeI/REgucZQBA0G4p4xZEdVvqU9qJXPyRemjbcHOBNcVf6jvi9wfQhBEjF0
	uivoZKNMkhx5D1Nc7G93Rgd2iaICIrI2PPPVryznvrafYKOpkONBcHkcTBPt3DZtpQmAnurI+xu
	MeLlvz0DxodQTMbSwEKxFitSp0IMvPhcsQ/t61e3J8TLmciQaGZg7O3W/se57LuG07XeQbcqTY1
	0BqW/nlfL2053ytsicqJNV7sW9/VKjr+2WSnz/icQKYff4isYK+4wccKatOtjgYV9mjTwolDpkc
	ELAOIn89FKYns=
X-Google-Smtp-Source: AGHT+IFZJU552j/AhWkBqyTpK8tRdxzWHD0gZIlyqJPOt/v/GyTQOH37UQYzC5zSscabwQ1EY+jNlQ==
X-Received: by 2002:a05:6a20:7d9d:b0:35d:b415:7124 with SMTP id adf61e73a8af0-3614ee47ebdmr8540067637.50.1763856409580;
        Sat, 22 Nov 2025 16:06:49 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0d65682sm10108834b3a.56.2025.11.22.16.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 16:06:48 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 14F74420B901; Sun, 23 Nov 2025 07:06:44 +0700 (WIB)
Date: Sun, 23 Nov 2025 07:06:44 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Sasha Levin <sashal@kernel.org>, corbet@lwn.net,
	linux-doc@vger.kernel.org
Cc: josh@joshtriplett.org, kees@kernel.org, konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org, rostedt@goodmis.org,
	workflows@vger.kernel.org, joe@perches.com, rdunlap@infradead.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5] README: restructure with role-based documentation and
 guidelines
Message-ID: <aSJQFDTMr-bNBvkd@archie.me>
References: <20251121180009.2634393-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xg9xUeRREvw9jP+n"
Content-Disposition: inline
In-Reply-To: <20251121180009.2634393-1-sashal@kernel.org>


--Xg9xUeRREvw9jP+n
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 01:00:09PM -0500, Sasha Levin wrote:
> Reorganize README to provide targeted documentation paths for different u=
ser
> roles including developers, researchers, security experts, and maintainer=
s.
>=20
> Add quick start section and essential docs links.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--Xg9xUeRREvw9jP+n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaSJQDwAKCRD2uYlJVVFO
oxrSAP4+dYAwBLzlCudX4gueRB9gZXhpwYYlWseCGcz2d6+y/gEA6XxTf711ac52
JV+x1TIyKnq0i2YX2x8C7+pXoMCRFAE=
=b1Rm
-----END PGP SIGNATURE-----

--Xg9xUeRREvw9jP+n--
