Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC3C1F37D3
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 01:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762307865; cv=none; b=eZzRhlZWWWKelKaZZBDHuokEIAWT+buvmLksYU8QYq3pjOQ/yAbyGJEJgA2OguAR0usDvyGdpoKFWcZ1QQH1xtEgrk8tcIkr1gsrzvRiQEElnz+X0XyKim8cxnk8DoAfD2nXbYUmioJi/BdnHutB48u6ph2p5YMKciYnbVnjhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762307865; c=relaxed/simple;
	bh=kIBkaG4fXIkzxYJM4+SHpSYNPKawIJMW91gnWOQCLVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZaMbmBxbb7cR/PXukWLO9LIe1m5bKRQj6KhRAUUtFcaeAYjrwBvWI+ek38EQqCs5reMRCKskF/bGg3bUBeKxNcAF+Rh3kyMIumQen334iMwDMqJ8dSVjsEiH+6gWfWu+JvPhTyl6ptGGkAX9IZ6dniR6EunqRv7ByFknMxTgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RM5hKU8q; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RM5hKU8q"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7aad4823079so2738902b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Nov 2025 17:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762307863; x=1762912663; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E7QXdXPqYVzaqknJiF4d2FHnRogGGdgrOuALsEYlJt4=;
        b=RM5hKU8q5wGqp44Ozx2wgH4ob6c1Nl6e4CrhKaoNh7M5eRJSF+0+ey7ELWMx4dEDba
         XYEW7xJ8n8virjMCqsjvgh4SGRuN9qtjQIe23nNxHCoqPWbt5VtTXsoeupjv4GNzeDj0
         QAQ+YEp0SeYRGo4K3bIx+P7LvcUYMrk/6FvvEbnuCM3U7w7mD2DuyPO+V6J6KxFtycxp
         5U2QEMHPSBRApBBB9hZX6SjWLIouAaigHoRtAYKD3D8Q93cGM2RJIVdlGTgHULSqWaWo
         SNSt/DR+0ROGBCXA9z2JP6NiGJiUVJGCT4GNT+Z/JJOISFKTwniUsUFDJ0ExTKeOoG/1
         2aVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762307863; x=1762912663;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7QXdXPqYVzaqknJiF4d2FHnRogGGdgrOuALsEYlJt4=;
        b=slzb6CvErRLFAHul2sFo4PyqUjP2eU0A+DT26y0icVgmXbS490ao31gJdqQpZfs40+
         biwUXQixXCQZzB9prwfQmqn8NrqfPlrH51REiUMMeH5357JhszLupexnDSuCxyigje16
         2QvPRKUCYy1XxCBuFljOE3FXAY6y68p0hFURPLuu/ELknrzYsEBgnW3pNZ8msI4Hkcoj
         zfOCL2EsAOCP/HXydAXx90u8dB4wop/y7UFdmJSFmNPBj7rLekAaWho9GHrW0SpPUcV0
         IXmlrRKp3V8t2nEP3K0WjpdIe3FTUMFgLBtcjmR03AQ+UAe/REssQka96qRpyXCwqCEG
         g/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVz3W9MYbLhmSFRPDEJ3hr9YB2Z6I3jXqQA6pW3fc6chgEHzZVcBTX0K5ttBBB+4zlPD5mgnWvPeNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC18vZSy6wA8/KsvTjeyZ4gg3NMihqHuq1APW8hPRNCHfYQV19
	3UjW44gODEKxYuMMiiX1D2Mthg/NMntena41JjlpKj+Ui1ChiK4FF9Ma
X-Gm-Gg: ASbGncvMhguC6HCVYDr1ZZ6Sm0JQIz9T9J9iYo0WLkbkDN47cYELJWDMBnS687/zEVC
	2PFBT3dvtqaeiJ71YbEnsRQkUjRtZWBEY0TbDDeURrLMd+k+pfvIoclXbhnahmKYbtOzwuHIzWK
	Shvn7kMq2H021QeVjWcmJoSnYt/1MMoBdPDVSs9KYIwA+wV7bgpniGkvC1Noi0zzcldC4lCzBdb
	+5FSXxQfhTro1v7B7uzriJJTkUyaqCaCMtPCV4jhGn/G98Zg1YEPTGZnsHeRGxfUKgMvK8Owdlt
	jwmW93fq/BJJv2/KfCaKVAYK4V6lIdq38Ji5YPRvryLDd/qfcrOCd0f2zeSb/daUmT+L2bJ/NnR
	uDPipuSqOQdy1Cu62sW9t9Fnc9fqcvf8LAJmxhID1aRD6ND6hpUcevC0b4KZyGH0uLtNCx5uN1D
	/f
X-Google-Smtp-Source: AGHT+IFltqwlLw/qoAh/Ic6xf0NjzjzpJGPbTkKnz8JOnOsH+5MlmsP9Q/aB13ieURxS0a35dg2/8A==
X-Received: by 2002:a05:6a20:9183:b0:33e:eb7a:4483 with SMTP id adf61e73a8af0-34f83f113f3mr1764667637.19.1762307863306;
        Tue, 04 Nov 2025 17:57:43 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f7569611sm3804562a12.22.2025.11.04.17.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:57:41 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 6C941420A6A0; Wed, 05 Nov 2025 08:57:38 +0700 (WIB)
Date: Wed, 5 Nov 2025 08:57:38 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Integrity <linux-integrity@vger.kernel.org>
Cc: Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation: tpm: tpm-security: Demote "Null Primary
 Key Certification in Userspace" section
Message-ID: <aQqvEsdoj0El2Dq4@archie.me>
References: <20251104131312.23791-1-bagasdotme@gmail.com>
 <50acd6bfbc8b9006bef5d7d0376b7ce4ab35f94c.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xcdopG/xTaOcl4jy"
Content-Disposition: inline
In-Reply-To: <50acd6bfbc8b9006bef5d7d0376b7ce4ab35f94c.camel@HansenPartnership.com>


--xcdopG/xTaOcl4jy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 04, 2025 at 09:55:08AM -0500, James Bottomley wrote:
> On Tue, 2025-11-04 at 20:13 +0700, Bagas Sanjaya wrote:
> > The last section heading in TPM security docs is formatted as title
> > heading instead. As such, it shows up as TPM toctree entry. Demote it
> > to section heading as appropriate.
>=20
> It's supposed to be a separate heading.  It's explaining how to certify
> your booted kernel rather than describing TPM security within the
> kernel.

Should I keep the whole section as-is or should I move it to separate docs?

Thanks.=20

--=20
An old man doll... just what I always wanted! - Clara

--xcdopG/xTaOcl4jy
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQqvCwAKCRD2uYlJVVFO
o8AoAQCExGLWsqsoM1i8GHUP+Fgv9X24rbgRfat4KNR1jYRIkgEAv1C61BYGUewY
KxDdWXOniy2ku0+gYvy3bqqF17wYjQ0=
=iC0f
-----END PGP SIGNATURE-----

--xcdopG/xTaOcl4jy--
