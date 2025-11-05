Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6732315D2F
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762347912; cv=none; b=aADXNCUFMIgefAlvFqGzlhlcl8a8jyTQKirmSbjefPcBiWnUmfMswW54iUOZfcfL+fUddHvc3Ss4vtgPCDxdXyIhhaUhpOC757NVUN20vcjHLRYvG7bRkteWrMbyv5CHPFvC4lfo/2ChRBwcfRyjVXR9M4FoYzgJfDrm5r0dQXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762347912; c=relaxed/simple;
	bh=T18DZcLDJ4iW9NWZ98GTcG7+6skVqrRFN0ExrM/Sb/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kmzrnh2mQ131VZQ7253IiPNovpqtf+ufdxppZrJaE2rCs5UtCnp6otDidwfeuZxIP01TikNSkHy45zJ1I57C6VcVWpXdlj6qkwgwFtF3yw5jFmUmdli8n0K0ze73Ibc5lbvBVXND8zdzWrj2JizQ3/CroJ35NNJo1QTg11OtXAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SoK/LmT5; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SoK/LmT5"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-640aa1445c3so6344210a12.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 05:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762347909; x=1762952709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T18DZcLDJ4iW9NWZ98GTcG7+6skVqrRFN0ExrM/Sb/s=;
        b=SoK/LmT5baAQMppt0UEGT26NU8s8xC1bwkBPBXmCRS+6mTW1uFUvw8RYDC63FxPSvu
         Teyoy8Z4MJdokGKd3alA2lTKd11hJXVfu5jVQEER8XR4e+M/8cl3IW6mW7AffTLgAxCA
         agBxWYnbdwbzj2MQmpUMsmQlr1fr+8A/BxAb9njIzLOfet+wPKc8stMNDa/gmLcWvKVB
         pFczFUUeR52T7U2AppQRnSIsBtxu/ZlNNYnLVSsetEUYgFegPg8zpd33EDxScTPmG9tT
         j+1Rt/6qn05Q46KmeqI4j7eJWP5Y2GRTLrdtlE+X1ynIw2tR4QjEVPR4nxz5RsEIBukA
         Rwkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762347909; x=1762952709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T18DZcLDJ4iW9NWZ98GTcG7+6skVqrRFN0ExrM/Sb/s=;
        b=DwarZilEaMPBpXnFNHmvlmJjCrYD1301qvSEoCipGWjVbPLZctRbzpBXU9joNZCTct
         /bN854kv9WvUJZEdz428Gc+QC2DtOrwYfYFPNAPXoWWw15McK3w/wsnAdp3p0ckqKaFQ
         AsZpCToe7+YXOEoD/JvabC9C/J1qaIUQeIIWCksTlAB02RBKgtCSNwwaCuH+XMzgPlAR
         iUlS1hXaGl1J3pEsiRzi4Mi3Gr+Jkzw7aMvs26Zo8PkksuK2xCRrDps0uzBX5RtHStDu
         TS3laEHBtY9zYtFIrA96Z69LQcUsKpd4GP3KFqO3SiQHnogojtAEDAqMgGVVQWpJsFY3
         7ciQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvGFTtRvlbMGnvS5l7GgGY41Jhb2tOPLgSoc7Pe5MAux04SMIuplbritcOV3hrZ8V9qoasBwHuK2g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0z8MBTfMoXF3/SgqaifFQ+PoHq/TH+itPdDVhPJBWPT37pCBX
	lKoRoLZAB5OegkkbInKi+tc/3iX0X309WZV+AyMPVcOrFgdWEGfKoR5J
X-Gm-Gg: ASbGnctB85UZcmSoQTEDGN4B6gOKytGaG93Qi7FrFe/Er723sbUFj+y0QJjmgSsFPIk
	akvldhMPHkpXXJjG/yk/FWCWambOVkty7Olh3Wd/J75Cy9bSa2rYI+7if6gfWJ2PD8oe2Xh1pOx
	n3uMXrb6NHkHPJmLGnoV2sBwzlXDyxjybo8+l7O/VFra3QYQvdSOStnc26ZWJxCfS7NZs8jg0hq
	dMPxk157P+gJKqk6gUPntjfblBHnBp/OfpZzyy1h9wfREw48iqf6NBxhREH7kr2plVVqKCLn34V
	bSp40nXqKSRStzQLbm5OEBFwJMdEsI0zfrEwcpg+AIOYsWU9s2vmaE3YcHis/5dvFj3rTih+QON
	8ust0N49JxGxSckxVY6UhSW2So2DDPbHm5T4BRfKg2iRkMTV/8Y029H/Tsd/saRHwRSvatNekPp
	t5N+oHAbbvOvNCFYvkRWtvBQ==
X-Google-Smtp-Source: AGHT+IGj8go6rjWgqNQQ64cZZhW9FRYYxudEXDJQJ/dK1gfP8sGhNhnNMndZrHdTo9uz3vE0ZrnJKA==
X-Received: by 2002:a05:6402:1e92:b0:640:96b8:2c36 with SMTP id 4fb4d7f45d1cf-641058b31fdmr2429862a12.11.1762347908832;
        Wed, 05 Nov 2025 05:05:08 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a7f1besm4735640a12.33.2025.11.05.05.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 05:05:07 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E27E5420A6A0; Wed, 05 Nov 2025 20:04:58 +0700 (WIB)
Date: Wed, 5 Nov 2025 20:04:58 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Integrity <linux-integrity@vger.kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: tpm: tpm-security: Demote "Null Primary
 Key Certification in Userspace" section
Message-ID: <aQtLerZYehQRWdqe@archie.me>
References: <20251104131312.23791-1-bagasdotme@gmail.com>
 <50acd6bfbc8b9006bef5d7d0376b7ce4ab35f94c.camel@HansenPartnership.com>
 <aQqvEsdoj0El2Dq4@archie.me>
 <a8a5b95e06e2d5d1c04aab8933f25cd07903a3e8.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QskFJ2QVT72EjNQc"
Content-Disposition: inline
In-Reply-To: <a8a5b95e06e2d5d1c04aab8933f25cd07903a3e8.camel@HansenPartnership.com>


--QskFJ2QVT72EjNQc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 10:32:50PM -0500, James Bottomley wrote:
> On Wed, 2025-11-05 at 08:57 +0700, Bagas Sanjaya wrote:
> > On Tue, Nov 04, 2025 at 09:55:08AM -0500, James Bottomley wrote:
> > > On Tue, 2025-11-04 at 20:13 +0700, Bagas Sanjaya wrote:
> > > > The last section heading in TPM security docs is formatted as
> > > > title heading instead. As such, it shows up as TPM toctree entry.
> > > > Demote it to section heading as appropriate.
> > >=20
> > > It's supposed to be a separate heading.=C2=A0 It's explaining how to
> > > certify your booted kernel rather than describing TPM security
> > > within the kernel.
> >=20
> > Should I keep the whole section as-is or should I move it to separate
> > docs?
>=20
> Why might it need moving?

Just to tidy up toctree then...

--=20
An old man doll... just what I always wanted! - Clara

--QskFJ2QVT72EjNQc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQtLdQAKCRD2uYlJVVFO
o+6AAP9RnFzd6g+8cWhQW9FCU9xkHNA+6kqWT7hczLp0ZgU2XwD+K77KdNT5XQDB
Cf/1lclhwyBE1+e/tpzOPOF4iiXCsAQ=
=bLps
-----END PGP SIGNATURE-----

--QskFJ2QVT72EjNQc--
