Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212B4238D5A
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 22:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765233483; cv=none; b=F1FcNcuFF24Jl2sqieG5CaRb8Ca1MkX/WnV7DnjPWMTfDiekrBRa9lUqujbUlL47PGzt2lif9Rg+RWXFYTkMcVB/phJND860OGymRlCWR9HQgjLFvzrh41tO8ALza+EMOihz7zENtorG26PyiNwgYvwOPkPw0ydIiKLc6YYByL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765233483; c=relaxed/simple;
	bh=psWVymBZRTxDCh275Fkyui9KH6GnViEgmmM5EnYsMlM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/xj2kDvxtXoq1wIPXLJSGKCg0YhofJ+gjUrC7RhOnTL6yL+JT20pCDvDuubtbtMEXBYJjulLpPvypBsLGr//JZS6vwBnB0okHWu7kzY3d8TBU5MQH3NkCFnuk4onIredwlQRoif89z4YJDa+5CRzdr+O6UiCATj+AKw7UzR28s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jxlpkwki; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jxlpkwki"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aad4823079so4451493b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 14:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765233481; x=1765838281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h4/ehmIIwjMD9KdHcf2XxY+ixLWZ9pwMrN4qmwrkw/8=;
        b=Jxlpkwkizd/z4ymVko3YVZl8jU1Lfu7+CuxpH2kGG4g82CtB1hWekosiqvCFr3+Vlb
         YqnmjUo2mo9c2RRZMzwqcaRNpTgGWpn6Nl6c48nMB8sm3q69osJpn6BmfUgsEswBnqBP
         j0PWeIInWj5iZ4Q4yLAYOrsPFLI0ymsiFkYhl1Q6i1bvPaakeY0BenRUg8PYqECj6prN
         fIshrwZs5bmfWqjry7SxOFGHUE4WCbcn2MS6lDzOBRksR38NzXUtFNPgkC64g4lhIJwe
         jCBfpo2uJ9Lxc/KQQTg+A4AWO9LU1x5Ucdz4fDdokYwD6LMNDAHRm5HY4ky8ZjV4WZ1A
         0Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765233481; x=1765838281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h4/ehmIIwjMD9KdHcf2XxY+ixLWZ9pwMrN4qmwrkw/8=;
        b=FiFnnHOS7WDwmF6/rroV4qADLeC4utO/8fhhbHS/6O3JTf4WvUDuDez2P6Kcqpujng
         vuwYBDIPsyp6awgDeuliNtbhhPPs5XLUgYgVuaAc/Faj4aBzKbKPou7Ob7EdlncANP3e
         wysDgLqdW803y9Xs8EbGr/kZblQLZEx8KOHmSaSQA5Q4JERY1esL03bjU7uHMm2O6OHk
         kR8oS/CKnTYrqiAQ+YQG3cy66mKGNRtQmjm7iYIDp8cRJ+xgOpbTGHAwkVys2HFKdUJp
         Q6WWcWojyx/Kdlp07z+3uB3b7csg++vlXAmL/T6+T8i/VdbU2kdjAKl9UKAPOi4aD7TL
         Od8A==
X-Forwarded-Encrypted: i=1; AJvYcCWkUbY2Vk0Fq+zXxQnZu6dQUMvxC7DgWTM8OZxM/2bjGbLgP3C+g+YUmgn/JUP9wy1ZJN4v1B8SCZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6xbfC4GkT/avNYSafl8e4vLeTIuSSrTFFFKtEIMNSBHXFAe3a
	PTNjpNyRxyUnd8pGOSV6iKFbZN0hoe5yI9zrM3DT+jTx/nX34bUXoDJh
X-Gm-Gg: ASbGncvCRnB8D980ImsZAILP7W5ntJjq0TgRxzGyv4K4AOlq1fkvoXHUeFAiWGrDDYh
	LAsCC0Pdsl96+bWHffJ2BAJATzbddEGw6lGUJMynou1cxdLfPlvxTCCA0UNDroybJ1ex0F6tYNG
	tUc5ZSkW0e9NLS3zewo3VLlDZ0bZZ3v506BHpHB7cbJT7ZRDGkJt9UDTITCasDCWT8mVkZb4juT
	jN+1pRcVWqYQtEAbzIM5t7HnrKwLrl1nDDxewGIToK3EjkmoSPbscJXcL+3QYhr4KNhbRiaZAmH
	sEzR9PhkAk46ohH11VtoudDzYeu3ODe4rWUFMmp6f2T1MsP1cbGNQ9+ZKqesdqNwG0dS9qPkvuy
	5NgL6MI238P80Ts+qHrIeLa86Y55HryLINJapMXDALx1Eb/pjrkXQGHMmQoEcng0jhqPMmssaNv
	pOGZQy31Gw/0Q=
X-Google-Smtp-Source: AGHT+IFuLFEVaBKjtteXCwWewOH/+gRPw45xPON9LRTRHYiCY+rJaUu96pc87bDjs8RB3JH1IDPiZQ==
X-Received: by 2002:a05:6a00:2d90:b0:7e8:4471:8ca with SMTP id d2e1a72fcca58-7e8c6dac0c1mr7598231b3a.43.1765233481322;
        Mon, 08 Dec 2025 14:38:01 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2a062ac40sm13934722b3a.25.2025.12.08.14.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 14:38:00 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 57CC4421DA23; Tue, 09 Dec 2025 05:37:58 +0700 (WIB)
Date: Tue, 9 Dec 2025 05:37:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Swaraj Gaikwad <swarajgaikwad1925@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	"open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <linux-kernel@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Cc: skhan@linuxfoundation.org, david.hunter.linux@gmail.com
Subject: Re: [PATCH] Documentation: x86/boot: Fix malformed table in boot.rst
Message-ID: <aTdTRY_7TtGqWvQx@archie.me>
References: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cdx538Ru7srwppVz"
Content-Disposition: inline
In-Reply-To: <20251208210113.24057-1-swarajgaikwad1925@gmail.com>


--Cdx538Ru7srwppVz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 08, 2025 at 09:01:12PM +0000, Swaraj Gaikwad wrote:
> Building the documentation with make htmldocs previously failed with the
> following error, causing the "Assigned boot loader IDs" table to not
> render at all in the HTML output:
>=20
>   Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
>   Text in column margin in table line 2.
>=20
> This occurred because the ReStructuredText (RST) simple table header
> defined the first column width as 2 characters (=3D=3D), which is too nar=
row
> for data entries like 0x10 and 0x13. This dimensional mismatch caused
> the text to spill into the margin, triggering a docutils parsing
> failure.
> This patch fixes the issue by expanding the column width in the table
> header to 4 characters (=3D=3D=3D=3D) to correctly accommodate the widest
> entries and alignment. After applying this patch, the documentation builds
> successfully and the "Assigned boot loader IDs" table now displays
> correctly in the generated HTML.

I'd like to instead write the patch description as (more concise):

```
Sphinx reports htmldocs warnings:

  Documentation/arch/x86/boot.rst:437: ERROR: Malformed table.
  Text in column margin in table line 2.

Fix it by extending the first column of assigned boot loader ID to fit
the widest entries, which are 0x10 to 0x13.
```

>    Assigned boot loader IDs:
>=20
> -	=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -	0x0  LILO
> -	     (0x00 reserved for pre-2.00 bootloader)
> -	0x1  Loadlin
> -	0x2  bootsect-loader
> -	     (0x20, all other values reserved)
> -	0x3  Syslinux
> -	0x4  Etherboot/gPXE/iPXE
> -	0x5  ELILO
> -	0x7  GRUB
> -	0x8  U-Boot
> -	0x9  Xen
> -	0xA  Gujin
> -	0xB  Qemu
> -	0xC  Arcturus Networks uCbootloader
> -	0xD  kexec-tools
> -	0xE  Extended (see ext_loader_type)
> -	0xF  Special (0xFF =3D undefined)
> -	0x10 Reserved
> -	0x11 Minimal Linux Bootloader
> -	     <http://sebastian-plotz.blogspot.de>
> -	0x12 OVMF UEFI virtualization stack
> -	0x13 barebox
> -	=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +0x0  LILO
> +      (0x00 reserved for pre-2.00 bootloader)
> +0x1  Loadlin
> +0x2  bootsect-loader
> +      (0x20, all other values reserved)
> +0x3  Syslinux
> +0x4  Etherboot/gPXE/iPXE
> +0x5  ELILO
> +0x7  GRUB
> +0x8  U-Boot
> +0x9  Xen
> +0xA  Gujin
> +0xB  Qemu
> +0xC  Arcturus Networks uCbootloader
> +0xD  kexec-tools
> +0xE  Extended (see ext_loader_type)
> +0xF  Special (0xFF =3D undefined)
> +0x10 Reserved
> +0x11 Minimal Linux Bootloader
> +      <http://sebastian-plotz.blogspot.de>
> +0x12 OVMF UEFI virtualization stack
> +0x13 barebox
> +=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20

Aside from Randy's comment on the trailing spaces chunk, the patch LGTM.

Fixes: 1c3377bee212 ("x86/boot/Documentation: Prefix hexadecimal literals w=
ith 0x")
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

x86 maintainers: please route this patch through x86/urgent branch.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Cdx538Ru7srwppVz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaTdTQQAKCRD2uYlJVVFO
oxaeAP4xpDb6vNMVKDzzINY48mg9jEZVy2+v7OdYcZFcaS466gD+NTmA7mRFEVkx
yNzinl+WRI41l4j6RYWMWfakVgfGnAE=
=CNxQ
-----END PGP SIGNATURE-----

--Cdx538Ru7srwppVz--
