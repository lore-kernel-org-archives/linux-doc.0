Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72D0343218
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611632; cv=none; b=CGoWULbCvu8HCZa2C5VwahKrQWbRB5AhIx3DbOsEjbCHwhskU2q2L4WFDZ5xTo06oE2IrWNxdc953oH1lx57xUJO/og2LHL01+2sVGva10qiqsC/k1p2xe5E/myjek2jweklMhl3/maSDQ85tCrljBeqKJ5qfZHjUDTS+4oTkFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611632; c=relaxed/simple;
	bh=U4Vw9TFefxHy667IjfemK0KK0KGVnSeJFdgB3++3kP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbWLEWXpDe6kyRzSneNWcjzEy2vGXdbIZQkb6kG4VUGjFmvAwXRP5joI3lQVgkFy9vYs4onHIuy4mirgGYbqntVc1Xtq50/NZV7YgNJl04qY42GdlhD32ID4igsrWL/b6ivHJDt5RBGD0vQwXQnIaRB99JuoIeZfDzJSh+LAjA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gL9GascR; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gL9GascR"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29091d29fc8so6823185ad.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 03:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760611630; x=1761216430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4Vw9TFefxHy667IjfemK0KK0KGVnSeJFdgB3++3kP8=;
        b=gL9GascRemtrbu/pBAvJ9Hy8Tm0TW1APBuRhTUv3keyrzLCsdkavLp8x5FTg4rgYpZ
         ohaDmNHJNLmWs7gI3HQBJ8UinogKM/qCxMt6kQ6bmEslqhdje+2W94qWZ26AUBvPV7sA
         qsO7M7o1sQz8k3NcQLXivIYC+3wyrIZoU/2B4UnBQge214J6QioT+lmgNjvnhdd9o3rB
         nKbv9TrnfkJxUJtm/oO/aH70YIq0mIfAYSmegnVMFTwyQ+9d18DAotLvIfp0vEOEkxn/
         fITZdLa+taQs8vLutThX2arM6FPOQ+zF3f3RtQR3Tsio7kY6dhWct6YcrqA0BKlE+XSw
         +/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760611630; x=1761216430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4Vw9TFefxHy667IjfemK0KK0KGVnSeJFdgB3++3kP8=;
        b=Yb68gVQqad+sDLRqsQjIUKmZpp9IXSCb/PHR0aznl+mN+C/DMiwTS4MA2FZVh/g42+
         8V+fZm49kIPGnznJD2KaHka+KrdF7kRSZwNGU1d2ovB4YKv2B7ETXUTFDb6jY0I15lQq
         fG0O+2nAUdd+V6uGniGd7tl1t2K0v8eYGk4bXItla0UYqy8tbUpDvFQWhsLTRR24cWrM
         abPGSjyxGF8pT6Y450R0cfgqbnITPobn/Hz60XKen6Mohf34AoevHEN7CmDJJFmN320I
         uxeGogWhyL6mv2TpvRvM1FpSlS3llNa/K87wxufltI6feXCcL36lxTrnQx8xPxrP+97m
         xcVg==
X-Forwarded-Encrypted: i=1; AJvYcCVIix7ruIHUYbHc98sWgaCjXSMQxLHje3Pc2cPi7MbxonxJmRDXtkbECUAoaq9+Ni0bo+CEDPJ6nk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjgCTDcqbZl6+Bnq/0sKjqvFf+Hmn9TsaRit42JrRLr+pkvmDM
	iDGQmvYfsgyKOFerkB86YTP6Pa80HZDNG7yDx91wqxp4mUPJJZmrGy3aGmljGHkf
X-Gm-Gg: ASbGncv72mOag43nmv8ec1QzrBpmuay1hjukvCQHKekFnmcX7FMYwK0bIlYKFemOpxT
	r6yHLkxrnZuToLFfWr0gPwjVN9mPAmEN1r7A1wmp7R+UZZTSsvAKur6t8KK6B9v4kbBW4KSAL0X
	Wxhh0EK6vWDuGFSPWtkEVcUAFP8qgDcmEhkYP4AxWXuqF2VFXWPOVkyBq+DepakFYTYv/tj20Nk
	SYh0F44VcDdr9jvx5nky6uRrWEaln68KktdIiI7R7Hl4TR3NQLWc4oexvvIg5UmjY6tDc0bpMXg
	kICOELlg2g27BMFeAdGw6UPnE+GJQVg2eJ6JGE9bUinm6tfShRQTCb658nhPIFjU+OZaAZIe1I1
	i55nq3W2siY/+pYdFgfpsA82l6MJmGT2HnrlDg+zgvfCvcWA89CYdwi+ANKqlq7UyAESEsOonq+
	WeEo8=
X-Google-Smtp-Source: AGHT+IHTuRp5je6WAU5xPxz34jRwwCQlRmcYtd63dQHcWlBJO1BdF4M1kQCtuddlLGvoLVhgrUMy2g==
X-Received: by 2002:a17:903:ac3:b0:272:dee1:c133 with SMTP id d9443c01a7336-2902723facfmr344914025ad.22.1760611629900;
        Thu, 16 Oct 2025 03:47:09 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909934fde5sm26007355ad.41.2025.10.16.03.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 03:47:08 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 9286F40995B9; Thu, 16 Oct 2025 17:47:04 +0700 (WIB)
Date: Thu, 16 Oct 2025 17:47:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tomas Mudrunka <tomas.mudrunka@gmail.com>, corbet@lwn.net
Cc: cengiz@kernel.wtf, gregkh@linuxfoundation.org, jirislaby@kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, mail@anselmschueler.com
Subject: Re: [PATCH] Documentation: sysrq: Remove contradicting sentence on
 extra /proc/sysrq-trigger characters
Message-ID: <aPDNJ3f1H_65infk@archie.me>
References: <87wm4xbkim.fsf@trenco.lwn.net>
 <20251016101758.1441349-1-tomas.mudrunka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fYTqeHXCD8CdoU8f"
Content-Disposition: inline
In-Reply-To: <20251016101758.1441349-1-tomas.mudrunka@gmail.com>


--fYTqeHXCD8CdoU8f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 12:17:58PM +0200, Tomas Mudrunka wrote:
> Hi. I am author of that sentence and this is NACK from me.

Oops, I didn't see your review when I send v2 [1].

[1]: https://lore.kernel.org/linux-doc/20251016103609.33897-2-bagasdotme@gm=
ail.com/

>=20
> > I'm not sure this is right - there is a warning here that additional
> > characters may acquire a meaning in the future, so one should not
> > develop the habit of writing them now.
>=20
> As you've said... I don't see anything confusing about that.
> The warning was added for a reason, because there was discussion
> about some people writing extra characters in there, which might
> cause issues down the line if we refactor the code in future.

Any pointers to these discussions? Or do you have any idea on better
description on /proc/sysrq-trigger itself?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--fYTqeHXCD8CdoU8f
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPDNJwAKCRD2uYlJVVFO
o9KxAPkBTuPUaUuBs6BBHv8+0HhycpaDuHMgX2T2NaHa+3O3OQEAzy5RJ2R7rtkg
k3VhSpHck6n708zue7aH+EZxpD2w0gw=
=Kjn2
-----END PGP SIGNATURE-----

--fYTqeHXCD8CdoU8f--
