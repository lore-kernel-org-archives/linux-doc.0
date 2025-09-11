Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58CB320381
	for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 11:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757590610; cv=none; b=e5cUN0FU7mXU0aY4ddstChblE80SWAj8tY4itUg3cr06tykhP5leYTDQLtmjxacrMffFvHQYV+O5SomkhCO8FHP4KzNjGOCuMDLMTZMd8rl2wZN9P+mvTqlD0e/1GTrJ6zWIAW7Wi4m5xX5X15JeyrBIaH2eOZsqFY7FI0MHLBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757590610; c=relaxed/simple;
	bh=/rVSsz4zURSRH6cQYurBS9NzYyNvGJ8R8I2UkETrSDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ats6HVOrtYro0zjf+3iqckjsDHz7gmESIhOSLmiwo9jvWyQBl7Axuq8LB6oe2CK5/ot9+mXhCDmFEqBYUXYs9E776F9krSgKSK6U+T3zoAPHN++xqYxX4Tuvh1c7cj69RbUyd09RLYUL3nUTAOvFOyo2eNPR+GlYHr1468DWcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VZ6NWQJl; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VZ6NWQJl"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b4f9d61e7deso441215a12.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Sep 2025 04:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757590608; x=1758195408; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/rVSsz4zURSRH6cQYurBS9NzYyNvGJ8R8I2UkETrSDI=;
        b=VZ6NWQJlM3lS7Fk6lrtVcS6dLeXoqkS9dpJCcH3EKL4AEvDcfsT0XTFIrAWk9a1XGd
         50mYu4L+9pPOGo0ORYIIB5eQuGFd7gu+fkMpHT49fBbTJm4pL5V0fLrQBrQt84vDp5+n
         gJh2Pn2CqvBoavZ9M6gDWGJpEXz932x18yBOjiNUP7Ep2TOoWR518IG95NEHDIv0dqVH
         IRukqx0f3nMgQz/rMVw1fVMTnThIhMsENtAMvinQj6pgCitKqcrxdexQW89BfMY+sncW
         QfBzO6vG0dD3zMfmjDsWXNlohQvDccLu2YqqTdJgkfLCbW4McjuOBdy+UHMhM2uDJjOc
         khSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757590608; x=1758195408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rVSsz4zURSRH6cQYurBS9NzYyNvGJ8R8I2UkETrSDI=;
        b=uLRRZ6QztNzlpMZnKPLxRSpMDv0eg89OtaPEBK9xir02yJxE/vBgFO0wX3AIwDsEGo
         MGiCO0waNtrgyJmck1U//eTOPJgb7+hAk7rpghhBAzqm8G8XruRZjkVY3098UV9EFTYo
         6ZbfiljeR5nxI1nrwgevHU7qyrICbVPZ6iaSH5t3ljEo7rrFxsms1UEGlckj++0EzegS
         1K1yEFhfURv0HFd8ghjdSu+cxc8+leu0Ye0H5pBe+yQo/54D3UqJVUuz4+jOl2KlZUA3
         QXR7p9UoFkK2m3f0EdRtU3pdohO0iSe/pd5EETQj6HSt5BjDgApukdaEAtOAOEYqsbq6
         fLOw==
X-Forwarded-Encrypted: i=1; AJvYcCUbcaffQ3FIdjpCXNy2hY2ftlIMlkPQe/7TgGFzvAkmrsg5LXnpOLvQTHfsd1VzrFZBxO6FUWPXAwA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpAS2EJN/4E8EwPRC+J8XTEAjwHF6I/EOZMRv9glW/7DkBzXws
	/VCKtF9V8yZaE2Xntmq7he+wQOAoXCocaTr/xPW643BXqL9aSNFdsyBE
X-Gm-Gg: ASbGncts3Rsp1PQKDbfDQcknUg97PE0T5onZ9+oQyHqNeDmihuqMrvr/R77h8JDEiux
	GxAVCw93W9VdssdPbnf55Qse+09CQwRTxLYdactgEbfqd8yA+AmF0n1EZdHV1BQgCH5RqsVfYp4
	BHn4Iz9YiL9r2rQ7QOAaJPvmrKpkabeurCMh29OQ2acXYGBLx1AhJCDnc652qvnLCu0e0FaZ0kQ
	oibGgealxu1ia7qcrcXXWkPjvQinoci+tr2xWAKyQsMK9yOuiPKAbqPMyhDOTKUWK5haCzQQzJP
	POL9bYOaY5/VnB9W6CPs3tyUPLYOax6tYADW8c8tKdq4QS7kiSngch5U0jP9HJwVEiZmkgllUlQ
	2rjad8gd746RrjqsjVLZ6SF6kqA==
X-Google-Smtp-Source: AGHT+IGODxcwXdfHAsRfp0VXOV718vy1zFbFo7MXwhCxvdkM6aonShv8X7Ss+ZzUqwEpBGF+WUBA0Q==
X-Received: by 2002:a17:902:db01:b0:24d:e8f5:13b1 with SMTP id d9443c01a7336-25171bc0549mr238763465ad.40.1757590607913;
        Thu, 11 Sep 2025 04:36:47 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53adsm17096545ad.25.2025.09.11.04.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:36:46 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 2100341FA3A1; Thu, 11 Sep 2025 18:36:43 +0700 (WIB)
Date: Thu, 11 Sep 2025 18:36:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux EFI <linux-efi@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Hugo Osvaldo Barrera <hugo@whynothugo.nl>
Subject: Re: [PATCH] x86/Documentation: explain LINUX_EFI_INITRD_MEDIA_GUID
Message-ID: <aMK0SnY9NMby4X_F@archie.me>
References: <20250910015738.14848-2-bagasdotme@gmail.com>
 <CAMj1kXHCi1pr3XNzwe7b7EFBkPGjkppeNWNSvy4wU1VBHj9kfA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/CycQuWEbUcN6Xks"
Content-Disposition: inline
In-Reply-To: <CAMj1kXHCi1pr3XNzwe7b7EFBkPGjkppeNWNSvy4wU1VBHj9kfA@mail.gmail.com>


--/CycQuWEbUcN6Xks
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 08:46:50AM +0200, Ard Biesheuvel wrote:
> On Wed, 10 Sept 2025 at 03:58, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
> > +PE/COFF entry point
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +When compiled with ``CONFIG_EFI_STUB=3Dy``, the kernel can be executed=
 as a
> > +regular PE/COFF binary. See Documentation/admin-guide/efi-stub.rst for
> > +implementation details.
> > +
> > +The stub loader can request the initrd via a UEFI protocol. For this t=
o work,
> > +the firmware or bootloader needs to register a handle which implements=
 the
>=20
> ... which carries implementations of the ``EFI_LOAD_FILE2`` protocol
> and the device path protocol exposing the
> ``LINUX_EFI_INITRD_MEDIA_GUID`` vendor media device path.
>=20
> > +``EFI_LOAD_FILE2`` protocol with the ``LINUX_EFI_INITRD_MEDIA_GUID`` d=
evice
> > +path. In this case, a kernel booting via the EFI stub will use the ``L=
oadFile``
> > +function on the registered handle to obtain a reference to the initrd.
> > +
>=20
> ... will invoke LoadFile2::LoadFile() method on the registered
> protocol to instruct the firmware to load the initrd into a memory
> location chosen by the kernel/EFI stub.

Thanks for the wording suggestions!

--=20
An old man doll... just what I always wanted! - Clara

--/CycQuWEbUcN6Xks
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMK0RgAKCRD2uYlJVVFO
ozStAP9mQA9cCfHsaQldql/hMVFcwMOShKbDfTeC6DADNy+HuQEA8+ArAu2x9zYZ
ON+dh6RUyGHdAxdwM2QwtIT8cv91UQI=
=SYxy
-----END PGP SIGNATURE-----

--/CycQuWEbUcN6Xks--
