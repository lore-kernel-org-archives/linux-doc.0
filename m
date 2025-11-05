Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C2D2F5A2D
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 23:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762385032; cv=none; b=jp3EiuufZcmaC41mLXBvCclTfAjoa/ko+0+IVEB594q0ZCLl5NioMPcXa8lsQRH8l7BVVLpTELEWN21nV0ma9CDKeabcWyDySXb4BkdHb8vFQX+kOj8+yKPvjEjie5fBom7T5rdN4OHurdroy48a1jWgik1mJCK4QbBT2Fa+uRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762385032; c=relaxed/simple;
	bh=Al3oGioELwHK6+eex1SyHV0FyTUyYiQOvc+s/ABh5bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmvMfXOXaFbrCnRNsz0LBDfK3nwxuIYxSf/BcgLzkCHFfDQpd0kExUccRwTWAFf00x9RMC8jrpYMJ3zOu03/vvl/9mJLpwseMj0xiu/s8R4Fjtf7o0UORgCwTtMkedrIJnVvocCnsMM+EMT1/K4LoVlpag1kUrSxwfzRfOLzKrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfkuoZwz; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfkuoZwz"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-34003f73a05so473126a91.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 15:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762385030; x=1762989830; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kubJeXUo3UmeVih2lAdYf2/Z0P2HnIw8/BtS+HNWHsg=;
        b=MfkuoZwzD0cXS5npPq828F5dLtwJ0Y+VmVm0uUVNnLUJddFsj8SxXIa4/T0/sgTqWG
         M3PyQvcI7Zq62Pt9JbN23MPp/+JTzxCH3SVmxv1kRmyJDJiQAiW6sA1FwmIhSMsI1w0g
         JzVbsbJCtPz7yZ7LVBdXUPq2RvYR4+cscPJyvR6kIn/PsKkE8HmJf8+HQJKx12tS65Qn
         aq71G5LzUm3+Fc3UkpNEWW0a+rn2dsujoVCaXdxU/uqu8tCpPecPKmOKxCxtbjh4pIRt
         OQXT/Dzvf9Hrfgs0utsHKMUfS6pTG9Y2yRAWcO7b4ip8yvseZDjTmHF3nuEwVJBTLVsq
         rfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762385030; x=1762989830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kubJeXUo3UmeVih2lAdYf2/Z0P2HnIw8/BtS+HNWHsg=;
        b=NjRESh0CGiU21jwFK5WFLcnl1v95R9rOzCJ6XeQPLZuBU0GCs9d2hHABFV4Fe2Ryu2
         bWEmDTiB8bOlP29aC1jD1PeDfL5HiymWx429iQKJjAbeg0ETE9rf8vMp8uml3N2+WoyX
         F9Q7bIXJ4+7UqQCFdIH8Spe0AZGAzQ9xtl18cC6/VgS07FOpfEOmt5301R3Rb3AdnAr9
         VEq81Objj9mAoT5KqjX4Z7xEjFee0iO6d/uEE64Ed6LaqgR1qzsQ2b/DmQCorOFnjv28
         QsT0cnUAnk7wjRN2WPovnKbAylxFQb0UpOiAmsdXa/bVAMK8s5xRtPeCEAZ9YG4ds2DD
         xTog==
X-Forwarded-Encrypted: i=1; AJvYcCV1xYOfg8uEv9sAbj9NzGkj/xZb/u/CKgpDMQVRL5Ry3jmaX11QuvIanQF1kdEZhvGFQCtcFLiMs7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiYGXbGaBZltMh/xrGsTY/xxhbyGlWNJ/bnDNRbGHOkjis+hPE
	2nR78gOEd9vH+WlEnf+y+kT4GyJWfR9ULpogBIgaK0gxY6wOgKPbSoq4
X-Gm-Gg: ASbGncsejbcZKhJWwk1P7QIo5barGRI/G+H409YkLP5A2u2Hw+lTnNtz0UnGHX6wysQ
	K9zyaTBwDi9JfDokxd3ezY4YWIsnJlsKHI8pp1ySdTCUllar5IhHne/2VY8urHYSSZmdEq7z43G
	205af6k49uTv1vpAQfcR6p581a3RSzo29IxfkhMtnKH3TRHzh+LNCl51JrU0x9RcRMc7m8Gy+Tj
	RYwwoeSPhmT3TWzlVXS56k0PvwS1GrYwo/OLiWJW7EkXjYIWW0/YCgGb4hRnjCw2xwy/kt3QGaj
	I6Ea4m6PP9XhxK4kHTfPcaPsV8JOKfOes6ryRteqX8usUetc3cOTpEcwBQPkd3NHIKKlqzFWnp1
	tGvzW2Srz3c2YzorNq06n2FptvwUjodpLGX5Yw6YOwCgCh6jlv6TEdrj38n4zsh3fQ/Vo5MiqEL
	E+QtNjbKnu50jnol3TxrGeDA==
X-Google-Smtp-Source: AGHT+IEcGzkdAa/JmxgIi83wsydvd0gXDWv6Dhw6hmBafbUdgTVKt1GnX2x8UlV59wQ8wCiPzufLug==
X-Received: by 2002:a17:90b:180f:b0:32e:4716:d551 with SMTP id 98e67ed59e1d1-341cd0d3850mr1372807a91.6.1762385029921;
        Wed, 05 Nov 2025 15:23:49 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d048e1d9sm361918a91.6.2025.11.05.15.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 15:23:49 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 871BA420A685; Thu, 06 Nov 2025 06:23:46 +0700 (WIB)
Date: Thu, 6 Nov 2025 06:23:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Integrity <linux-integrity@vger.kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: tpm: tpm-security: Demote "Null Primary
 Key Certification in Userspace" section
Message-ID: <aQvcgoOU0AHxKf9W@archie.me>
References: <20251104131312.23791-1-bagasdotme@gmail.com>
 <50acd6bfbc8b9006bef5d7d0376b7ce4ab35f94c.camel@HansenPartnership.com>
 <aQqvEsdoj0El2Dq4@archie.me>
 <a8a5b95e06e2d5d1c04aab8933f25cd07903a3e8.camel@HansenPartnership.com>
 <aQtLerZYehQRWdqe@archie.me>
 <bbba0752a40859a114bac987d279a8b268e5e5eb.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JHfvFp1iNfVh4sFH"
Content-Disposition: inline
In-Reply-To: <bbba0752a40859a114bac987d279a8b268e5e5eb.camel@HansenPartnership.com>


--JHfvFp1iNfVh4sFH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 05, 2025 at 11:33:39AM -0500, James Bottomley wrote:
> On Wed, 2025-11-05 at 20:04 +0700, Bagas Sanjaya wrote:
> > > Why might it need moving?
> >=20
> > Just to tidy up toctree then...
>=20
> I'd really rather have the files in the doc tree grouped for ease (and
> reminder of) maintenance.  The two headings belong together in one file
> because if someone updates the doc for one, there's at least a chance
> they'll notice the other might need an update as well; whereas if we do
> separate files for every heading the tree becomes very fragmented and
> the chance of something being missed increases.
>=20

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--JHfvFp1iNfVh4sFH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQvcfQAKCRD2uYlJVVFO
o2ziAP9k9lD+4G6TWabjWQjhgcM0by7e5E3t2WQFaS34n6XU1QD/b+hf+htPHhCU
NSmPw4fnv0FZwoxw6cdfsOIYZV5dQA8=
=OkY8
-----END PGP SIGNATURE-----

--JHfvFp1iNfVh4sFH--
