Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B4F19D074
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 14:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760797843; cv=none; b=Rh8dFqlZktY0yKffcdOQXGpNhx0YX/Eg+7etBL7uHiDGmGivDKruftgB7bCe88ylR4DibRHuqU5yyMXBZ75JIc8bEw37z7+0YVOmcrHQCHxkM1pcc6uKHaUIMGmfTQDww/6NXVcK2nwYpWPI4Gbe4l4oCHwdAj7oS4kHddza+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760797843; c=relaxed/simple;
	bh=H5AzUI1YR9TrA+ShwSblAD+3OTi6tR9slfhzioJEg/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uHYkc6OoUytOpv+EQhtF/4FZqkUBc7YIl7+OWgXPaG4/wccW3tprsMT32tSiQJwmemM7RB2/5mO3oa/EICPIxF/vs2hxwejBmqNUoD5U5e6b9t73PHZnmz8RVMSmuC3n22Q4kkzVp8n/ikdaL1oSfwAY/ySS0SFTFrOi+CnqQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gi+z+SvN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gi+z+SvN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so3582628a91.1
        for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 07:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760797841; x=1761402641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H5AzUI1YR9TrA+ShwSblAD+3OTi6tR9slfhzioJEg/c=;
        b=Gi+z+SvNsHkZO9AAIyWP+0DeGfslFOUz69IO0fYboTt/sdoCGN3HRsHrQEFQpekhiu
         bswXiZb+xoDAzrfqIBq0I2WKq6gk1ejJ1vcRzEKvmGRK9T9gr40h+O7AeSu0UL0qP1ck
         6GxeYIito3xbM9qsmE3aRAiGqfCbcPYycV9YhbyhdP+DyxlnIiiI8J8o/EMps1ghjKTv
         cRTJdH6BCLP1gLWYZsH4x0uT3Ssyz7qKzCfd5ahUwgLuBf0uwOsm98NOmfGBjTqlecJT
         SdokDU6gbkHid5y/PeLBBomoYu+kkg0JhPhDU2YKB/gKbGOczcFWUP/Pw/hjDA6aSyND
         JaQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760797841; x=1761402641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H5AzUI1YR9TrA+ShwSblAD+3OTi6tR9slfhzioJEg/c=;
        b=Jy9Gzx6w6XZh5Kj2WQwRbUYreaHdbntx8iz8hvdiLbvMVCGihRCHrO7FtzvVXtim0i
         TUCvcmRHf959dUXAA6YXwBafzGP+5TKbJkSGwVdyoABoNQZTZJa1CR4tX3fABdvEEB+E
         ZPs98aagEWJI51NTcoMduNSRpcZzW8BTSZSJqmaYEcL5yqLoyw7OHNNz3yIhGtzLQKtv
         3VGGYUvDKnKCHhzSdREuLg0GMfTsZ9HnxSIMRkorG7236crGVsuQSbAfY9qrm95+b5Us
         esJVfNCuQoLsNArxWEzitFmvS+r3vsASKR1Zvqs5Y5xtIQ8aOCVRbTQa4WWhnB0/jYJ5
         ltvg==
X-Forwarded-Encrypted: i=1; AJvYcCXpmAbslYbvRIOpZ0F8XtsILHmed5h/RpT6+BfQPcHoqYgErBh5zt8V9FHt+H8ThRp4DHEcmR8bSI4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzheDCRgfdjmnq2BOPcd6WEpPisua9RCdtFbYYCZqnq4U3ERGkQ
	sPwm4Nb9IDy8DOLYDISwgZC36Ui4TeU9y1DmZpzmxymFDTWenJoLXdr2
X-Gm-Gg: ASbGncvxWbk2UEJCr7Bga6A1nVFB+d1YzvpT4yYaKg4rUZ0SyWhGf2PmbHwfulnI7ay
	vDn+Jh25lpPbCljku6o0MJQg2saxKDVrSIF4PWp2nefKJ99fB+RYYf4NvrNCnhlkpnapTZNII3/
	UysEWVW/InxPAbPGKSYF7mDqfJZD2x52ccyu1jciw0v53WiVc2THVGosK8YJIxUKuY+ktENd4zH
	KOlcCb2EAjBpefXr0mYADpS7w0I2Mgfrz1N4bZHnGK2X8dAar4zxxbkzPcuA5PX1wZD6J1ctwL0
	mpg+53HwcohlAx/Nn4CSg5HCJ8JakDkYiAdF+UHJ1ftPGdA+A07X56Mtq+X65eTYijCsDEArtjq
	FjyYvE5oHvegUcF8mbL+e8XSLy4i1ObWCxO8a/xzX5uCI60BJNNUIR4cekYHVJVM01U+xPpJHCk
	P1lfGox6w1MWMKIjB+vSDQ/wZ4
X-Google-Smtp-Source: AGHT+IHWngUQc7B5DhoG9VaMeEWADlJVoOxl/VKkyFHP2uKToZpaKxsuBioQGNTpHSbiFcVbfcshrA==
X-Received: by 2002:a17:90b:3d87:b0:33b:b020:595e with SMTP id 98e67ed59e1d1-33bcf8f78cfmr9188242a91.25.1760797841284;
        Sat, 18 Oct 2025 07:30:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33bae2a4e03sm4525492a91.4.2025.10.18.07.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 07:30:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 560444241822; Sat, 18 Oct 2025 21:30:37 +0700 (WIB)
Date: Sat, 18 Oct 2025 21:30:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>
Subject: Re: [PATCH] Documentation/rtla: rename common_xxx.rst files to
 common_xxx.txt
Message-ID: <aPOkjdKXDKeIIsCE@archie.me>
References: <20251013092719.30780-2-bagasdotme@gmail.com>
 <87zf9pz33e.fsf@trenco.lwn.net>
 <aPMqTSbPucoqNhA1@archie.me>
 <87v7kcz3yl.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ybs29haJIQVP26Hi"
Content-Disposition: inline
In-Reply-To: <87v7kcz3yl.fsf@trenco.lwn.net>


--ybs29haJIQVP26Hi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 18, 2025 at 08:20:34AM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > Shouldn't this more appropriate as a fix for current cycle (6.18)? I see
> > the warnings on Linus's tree, though.
>=20
> As a general rule, I don't see warning fixes as being important enough
> to send outside of the merge window; the next cycle isn't that far away.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--ybs29haJIQVP26Hi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPOkhwAKCRD2uYlJVVFO
o3NPAQDfJXtSqbwM4/sAhpfkKAvqBkJII1d9MZNDlAgwoiq+qAEAnu2ndfw7w1wu
QyJdeJuxkPc2xpzvRc3YXL3d0wwuQAU=
=jsrl
-----END PGP SIGNATURE-----

--ybs29haJIQVP26Hi--
