Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95CE360EE2
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 19:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779478289; cv=none; b=JyBVs74oahX3iy1CENp3Vi/avA3x8Yp8gG3lFc2QlDcV8MzPmpdtvPby6fwAc5QfIJDLpe25uXvYCUZD4vKRPytIImCuX0bR7DM4pXKFXjn19wD2aKEQdGrMvu4l7Gutx66tfAdFGnw3XsJExXIUbkYyc+13HwOMj3bno6rKt88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779478289; c=relaxed/simple;
	bh=8jHhQVtZLf2s9mzspgVjoAGFPusQaLC5ypquhUiXMb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q4ZGuz8vJi0oPftls0aarsWpwViU15szbFCegYTZGoU4YFlsoAkMigvKRkwdtp/xKP1Z5sf4YZmzcl78QawmUXbYm4eyq8sVBphzCZm8ePMd2LyCZO/jRnC1/2xa3Ma/RCk3OX8WnITMy/CgMwJvENnjnfV7Nrc6GuW8NQYZbIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViPCM7gA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViPCM7gA"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso80899525e9.3
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 12:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779478286; x=1780083086; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzI3ngdD17nd9oUvnoIHtzlnEtfXOINJERrYeNFi9Y0=;
        b=ViPCM7gAPmef1qfOGlHPwrGM0dVKw3JkmNr+ow1IaPeuCjNdylYn9MlIxkllenn+h9
         kG6FlQoDszXqvPbd+x9o8spg1OwnhLHXZq1rC7eW9nnPasf56AkYUVz8/jJbyexWx9F0
         rRhWZ9/fECiS/dbA6JUepdY74B+oO1RkzoQfIeEkFU3/j12ATCTGBfAcssPODyITeE+v
         YtMPKHhBvoB96VPsbXW+ah1dRWMKrORJjMZsaQ99i9DQRPEqEASdsXUeISzz3dUfl9RC
         u70ri04B+/Aw4paVFYRV7HZ4aqKXh9cCaJZ7qqWMvm8vhAFpsi6uVAOJasxkAKeh9Ori
         0+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779478286; x=1780083086;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tzI3ngdD17nd9oUvnoIHtzlnEtfXOINJERrYeNFi9Y0=;
        b=Re23xrJzzc3rcpuyVoQRipdepK6tj0LXh1a3Z1tWID0heqPls1J+ipN/oAwipJ1F6F
         JIiXvYmNmRrdLU4E3NV2OTSzMo7bCY8i37Jv2Q3SgvcqcqrNJCAhK6RxMWik2+KlIgE9
         HNlFVeEUsG3wmTNwQWe90bMICmejhcVrKKu7c0BoU50uHhTu2F5+GBxtTCfFrHml3dRM
         z2Nj22g2iA20tDY8JCaBKbgkOP5ZoV+xm+ZkOEIh0/7Kqiz5/AGcs98IwrBeI1+yHU6k
         bUy+wJc5UdrEAWdroUZI5F4PbIx0uQzTZrwP0XtpiIKJY69Sg2FFhpwgJwuGkKjd1jd/
         GHdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Fn8kno5IvqxDh1Et7nrMFde+o2K68qu/RLj/AcICb9LENj23ChZcPJcUaQi4HeF9sB4BqQGU/j8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0UYsU+yihTq5c8OXyS7KT07D7KGHx/ncLt276QilUCrppqoeb
	5eCAxRqi7WXOy52xFKe2yos0TOpHaQiLmoqgZrPNFflj5s9rgxx2zuRN
X-Gm-Gg: Acq92OEIba1UculUwJmwPoT/qDqZfAUitw/DF0ZP+xnPno/P5js29+x1tfMAnc2EGYP
	BZf89koLzestLYAeUTttjLOu3wNjwL0UmFuC/VCHBWR2aiG2i2dngJMDYC26l5YETWYoZDUjejV
	vuVdtlzA6lXnwdw0cHd+Tdg9RCzhswr0Wm2ET2Q7lTF5WrK4sgbl5R7/j7q5UJ5+Ocgqqfgjm/D
	FTImYq0z6aa3S6Mhvx4ABnsmvYbjiZHC9QORvoAyod99KGfEo7ZjK+sHBD0bWW+vVfjS2A1iv0X
	KqoIAH6FaEIRf9n82H7YeQ671Z39rDcHNIxY2P/cq0O68TopYQcX1MMEaD+5YysgmwuTr9qGd2q
	6hZSVyh6/EjwVz42OVBH/td/sSVaQbQIoEx5BCdrpphmQAMJWgdM0PIcnQGdgMNE3UKmVemqnPL
	i8PL+JlH9f/UDrmz0SJHGSVhtLW7Z1L059cQ==
X-Received: by 2002:a05:6000:29d2:b0:43d:7c6c:a0dd with SMTP id ffacd0b85a97d-45eb38be1b0mr6092356f8f.35.1779478286163;
        Fri, 22 May 2026 12:31:26 -0700 (PDT)
Received: from strix.localnet ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd04dsm6349837f8f.9.2026.05.22.12.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:31:25 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 22:31:12 +0300
Message-ID: <6270885.lOV4Wx5bFT@strix>
In-Reply-To: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
References:
 <20260521191458.177046-1-rdunlap@infradead.org> <13240501.O9o76ZdvQC@strix>
 <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5103908.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5103908.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 22:31:12 +0300
Message-ID: <6270885.lOV4Wx5bFT@strix>
In-Reply-To: <503916c8-da3b-42dd-812e-356f519be47f@infradead.org>
MIME-Version: 1.0

Hi Randy,

Am Freitag, 22. Mai 2026, 20:44:24 Ostafrikanische Zeit schrieben Sie:
> Does this mean that you will be merging this patch since you merged the
> original patch?

I am new to the kernel development process, so I don't know what's the 
preferred way. I guess for me it is easier if your patch gets merged as-is.

I can certainly submit a pull request myself though since I made myself the 
maintainer for this thing. Does that go to linux-doc@vger.kernel.org or the 
soc list?

Cheers,
Stefan

--nextPart5103908.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoQrwAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiDioP/RTigdRsyhr4ft6Leuqv
ez7BwUb7lJR4Ro/eGhoQetLrzr+fGS3DbF+ke+6vJj5PzhkKYtEYLwHrI6KuyWYp
aiUgnRwk0H2LKyPPvCqiRfAdMIP5RHxTSs7Q88MqeULG/rkDz1yFtoqBa1Bb4Z31
mkXab6G56xU0sK0nrltB2NJZe8LH11ihNFI5JnIetQpWE2nWuJfXX8kZ/eTKxfEn
d1f3bw3RuzP/slO3v0iWJ0pwvodejT0tCe3DolI5fq8nBqi2UaC9/UlJE31UPYRz
/sZ+8sCzoKJf1EEOlg/+BBCw+AlXCvRmwSuwAfJ4e0dMXByVq0wOWxbWEJq2SLIQ
L7IDgE7Xwpd+9NnNbO1Tpa9lT78FMfBTq0qY4QYiPVca6Ia2vNyH8TEpOrB+LoIU
y9L7Fu/2XH2Yx571pkAHqkfo7DygHWeUosuweiONRilInjF5ssfmFNd8xp3Hrl1w
YnOBRXsJvu6DfDEoex+kKFwiUL2BZpxcTnKw35ZlDvfYbjJnNGI3fWh5WyIUOov3
6dOwIr0xOfRlMuWf5jerU2pIF/NmRMBCZR8v6QlvOizzBHVHokwOJs96OBzZyxaG
wikm6wApAHc6AOxYuwxRAWdq/yWijTufkyWOS9j/9kUYoIbqGo5GrwSd76VqTusU
1E6ofI1fcKjhJ8cej47xHywp
=XwM4
-----END PGP SIGNATURE-----

--nextPart5103908.31r3eYUQgx--



