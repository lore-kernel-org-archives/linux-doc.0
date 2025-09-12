Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA519155A4E
	for <linux-doc@vger.kernel.org>; Fri, 12 Sep 2025 02:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757645721; cv=none; b=awy6xJaRCovFvRIOUnX08ZDFROKOHT0Gg7/cvqGirOv2X+TSU6Tt0QfzcUSMRXbONuVGPDyZ2aJbkckgkyNWprMwqm2F9iaWDZ37RFPsZcCgiOMIAmUtTKYBksu9onMVLy7lmkW86y/yNldBxDLfSz9fIypbeK5GmL0Hg5IvVGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757645721; c=relaxed/simple;
	bh=8dUblNqD+QvR3lypM6+6pgQKaz5acFHh70UWBGlz9eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmLY8HHc/Bz8HQNM+vlo0nTW0/jMHBwZNlqLeDDGmYApNbcp2VBep+yi4cuDzZsWNHO6zcSiuXeO6T/E0acuF/mDBug0FNn3Zmw6R4+HVUygD6xv9A9goKqfypTW0uVz0eZkaG9kCpOTdSZywcvc9d4BtXKC9ZEeY2/pHCY61/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKoIXlND; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKoIXlND"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso955866a12.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 19:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757645719; x=1758250519; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8dUblNqD+QvR3lypM6+6pgQKaz5acFHh70UWBGlz9eA=;
        b=VKoIXlNDVjjQcM0nV8J6JZHH10HMkxnCiF5gnIodzWTX5ioxi3aujvaz4MP4X1JgaE
         gMg3L0M4m5Ykn4sFNfDpBvLAijNPWD44+UVuscgXpHhJn4lJfPIGnvxIedOYeS/9S800
         qiA0A7DDRCTduJa5zK7HqOBc1dv8EeKJUKMqvrH3WJ3FXiUMqZ4ObrA/PHTEE3ntiTjQ
         CfSkB1+OuOl84NrRiTB7BPkMGo2Kt0Eku4xt4znS20bqfufpJdSc7TadRbgcUq2OVSyd
         wMdGS81EkZuHLxsXzB+e1DQAEEY6csky8ch9I4XocMIjQG1Aepm1Hd/CUTXkFOzoMwRw
         lS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757645719; x=1758250519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8dUblNqD+QvR3lypM6+6pgQKaz5acFHh70UWBGlz9eA=;
        b=chRWP7ggjZ9WIfRasWznT1ShiPzSzHXLyvMyRQR1jReHxbYUUmLUuMj5AIXyg/M0fW
         SwwNt18UNvfY6w35OsUzh6pzHkMDSA55M4PEjXTC4Klvim75acZIqSVd0Ivjj+ZddRKk
         xeEtWow7uAeFnJp6SE0ypi/5wTOonXBuIge02xFaHOtpuMqQk6XHQs10TlA05WMj5vJE
         wN1jw2RfviH/QEVvBBVUbjSAssfDGv2ml1bEQWQrFp0lNimKKM0VKNov+xiCO6qlK6U3
         TpcS4Cydz1848NDg1HXShS7ooNU2j6Gm2HAFa+SAQnVyX+Xm0p5jJO6NZttt2O7UWOov
         0FQg==
X-Forwarded-Encrypted: i=1; AJvYcCWveFP1ipjKkjlEwb+mEcZL3JxqNEbcryD2hlf797PxnL0GcJCNBsf+/oBQ43maoFGAc045Yt82RYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlKwMlDOaJ1VM27WVY7tIpV+vLnaPqIerSkfbfYDkGvyFjvTrp
	ZIoGhWNiQGMexsJX3nacgJqmd+sGaB/Uoe+NuhZFYIwlyU9VnWTEyQMf
X-Gm-Gg: ASbGncujnzu3bQQzoftZQUhM048pA5ONNsLbWKgqU4lJExxfA1UtsRcPNjZ+vKCfM48
	lNPR5VvvFoKqtwjm7h+Z+murjF/P7b0jXd4RNraOMdrIVBwHoRWOxucZ3GCKsu9oFjKbWjDbjAX
	TgpKO8/6jKd5oj77uYHC491eW7HX5EcNEhZGQR9wTfyhKPFSkfgES6vaYJBE9WJg/G8EFcjGlO2
	vbb6/fBcXy7gDBmhLRFEUhYmbI2rDUCDV2J4/hAK0U8hgwsjasJN0QcGy7d+gdGGhRm6i0YUKAj
	gk7yVhXkIV5UzyfamdG0ombYDaDt3K7DSyps2NJL68HCt7QYmm4bXoLgCxAb7Te7IUL9hxq389L
	emt9Edk2qJqZVnfoAqgSWADhqgA==
X-Google-Smtp-Source: AGHT+IH5JN5qNkoNcsYWg6dw0fXdbfeF5sEn0cts8H3wCmJnWb9B3BmToRmZiDopftsOn3Mj7ikpQw==
X-Received: by 2002:a17:90b:17d2:b0:32d:8eb1:4e26 with SMTP id 98e67ed59e1d1-32de5144a8fmr1650790a91.30.1757645719140;
        Thu, 11 Sep 2025 19:55:19 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd632692bsm4479084a91.25.2025.09.11.19.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:55:18 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1BF0941FA3A0; Fri, 12 Sep 2025 09:55:15 +0700 (WIB)
Date: Fri, 12 Sep 2025 09:55:15 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>, Tom Zanussi <zanussi@kernel.org>
Subject: Re: [PATCH 5/5] Documentation: trace: histogram: Link to ftrace docs
Message-ID: <aMOLk7SAOrjogIy-@archie.me>
References: <20250911042527.22573-1-bagasdotme@gmail.com>
 <20250911042527.22573-6-bagasdotme@gmail.com>
 <20250912095827.3d5a3feb80d5c6c44667328f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0lyQ/UvkQaG+h1EJ"
Content-Disposition: inline
In-Reply-To: <20250912095827.3d5a3feb80d5c6c44667328f@kernel.org>


--0lyQ/UvkQaG+h1EJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 09:58:27AM +0900, Masami Hiramatsu wrote:
> On Thu, 11 Sep 2025 11:25:27 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>=20
> > In brief "Extended error information" section, details on error
> > condition is referred to ftrace docs. Add the link to it.
>=20
> It seems this does not add the link. Can you make a tag and
> link to it?

Nope.

What the patch does instead is to convert :file: markup to proper
cross-reference. I will fix the patch description in v2.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--0lyQ/UvkQaG+h1EJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMOLkAAKCRD2uYlJVVFO
o+jSAQDIDumTK8LVsSWKsUI3RUgdsGDqRYt2dirDbpbLNSnz0wEAhsnSBv69gyj9
k5kn7BpHmEuJjj63nZFMXRa0UbXj8Ao=
=+PaU
-----END PGP SIGNATURE-----

--0lyQ/UvkQaG+h1EJ--
