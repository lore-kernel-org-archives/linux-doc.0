Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3751E7C08
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 00:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760487078; cv=none; b=jzvYntrAHHC0yYFQJ3o+D2eVlJS6Uk3jNJLfPuJPEUPT5nSVNC+JdiuZjeDRj5+MuVl0tNq0ePqGcGvnBOmiixJA5O3ovsOLzeNeLbi0dnhorDgQ0BMBjX6DwNGIdb26sYB+x2mM0/ACXT8Iinu1jAHjrU6cI+07yFLSBPWhuxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760487078; c=relaxed/simple;
	bh=s2RVCHRe5alWy5CclbuFKLZZf2xDKsC4eYF7VFxE3Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opTQg01tD16Ccvymv21HeKG6kq3+Av5rDPNXNm92QJe/zv9yzsCgctwiy+9fKQhnar7DOV/Pk82qjB75S8WDaEY758W5pChdUAqdcm3YTZxZT+T509MZ7NTqnWy5lwVJOA6eu+MYWNxJdnb2JKluKZ1v2KBT6BqiYeSzWXZ6tiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jkqF8iZj; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jkqF8iZj"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7835321bc98so5679576b3a.2
        for <linux-doc@vger.kernel.org>; Tue, 14 Oct 2025 17:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760487075; x=1761091875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a4xPFj8ssp6jJtUcJ1VmKpw8CRVucsov0suJ55BpsNU=;
        b=jkqF8iZjLOFxKMPsOVMibyqjD9eAxsjKMrianXOqnqC6dTAZMUbY/ukWL78JuRc2CH
         51ZxtDOTC7IVbbCD9Gys1uYDyMROGngoTWCgqxXMKpTRm5SxfQG4FuwitunJivcNPHYl
         nCS0c144Ifbl4YzuXoTF/zxKqIx2+Q7y6d+6WkwuN+MbuRSKyzkH7Ac3nXz9SaZJKE6B
         uep/iGLjkMomgTBPn0Nn3CUQPlKyRxVVOXea7ao0KmeQ4JDbHm0rexTHkBg7O7hs+ExZ
         ahIg4lqR1VXz1ErM6q8t33Z2ZbCqyzDx2KTstwVgeIZ+G0eanKK5O/AFY04u7iKH9Zx2
         xcbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760487075; x=1761091875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4xPFj8ssp6jJtUcJ1VmKpw8CRVucsov0suJ55BpsNU=;
        b=MX4h+i5SB6ejSnBiCZrPfu7VbU4cB/P6IEyQj/UqsN3hdVpyT4XpVaPEsjjTJ2J7hL
         A6RbQFMY+i1k/3hSsMOCJ+XplU4ExtF3s4wNeXI/cYx8io77xQcIZgPrfht8vQ6Wh6+S
         zMrJDXXpHbgkMq8lgBcoHKN8L+IIjRwLD2tucnBJw6YefmC9m2ru85vdIOXzzxuBl2//
         9+Zc6jkflp6/KgH/U7AgLs0mcK8HJ14jV/alq+34rW5PN1zGo1IImQn8crA4gtd9GzWT
         lTa3bNNciHFmGVzutVIHa82Rp1pF/hxI5rCWeBozu/i6zCquvsKBGxnotpCH/SDoOZ7x
         FmCA==
X-Forwarded-Encrypted: i=1; AJvYcCWnRe9gOa5uAWWs27Fe2NW+zPL8tjVDzMN8nlzIkWNh6RiFY+3QAfDvFEeTo3lZIoJKPvveGJkyTNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeC552f0mj2CLG8vSqyd5BfXUqYN44qKlgjjB7q0NKgSZ273UK
	jRuDsZA6aK2XQzQF/MRLX2O6M/sDTKtPUTae0aEBWRDVy/WmaXwBhlp/UAmONvMH
X-Gm-Gg: ASbGncvfOrd+aaSJAFEDEzfIfq1cIPnjnlO0v4sKgOAJrXJmnn2mAZoaIL0qz2K/6W/
	edNt7os4c4HpFkMREICC3am348esh3kRDW2IIcZucvGCcrMALh+L7aG8llhUTBPYyOnuswGufH2
	SJNoanzSGjHUsoFaMnsFgrmMHLzL/NOA8uw8wxGhe4mJ3LeI2AvxmkasKdqyJTJ5Q40DhX0AvqU
	l7DuFaBpZnpcE13V5Q1tztGnO3SqNwvPv6qGnit9tEYr0TK+PctdRjd2+AIhNp107tHiOk1Cu8d
	YUCyVdItln2S1dfZ1J8rYjDFVD4zEjsgNxTTThPwhR7nvTPzdq9l4S2l5hxWCmDGT2K7lKcjZmf
	/TSbNuUHB8c4/4h3Y02ek8HJfOs6pmujm8l98VB1TcdipHnBVUYmbBlQ=
X-Google-Smtp-Source: AGHT+IFTkZqU6W0i9x4o7gHHf855IUQXK60dpfIB19LKQCkLF97EE2hReMjwVrJQ/kLGoXvNC2k8xw==
X-Received: by 2002:a05:6a20:a106:b0:249:3006:7567 with SMTP id adf61e73a8af0-32da83e39cemr36265067637.35.1760487074508;
        Tue, 14 Oct 2025 17:11:14 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67d7fbadf2sm4244123a12.16.2025.10.14.17.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 17:11:13 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 657784235ADC; Wed, 15 Oct 2025 07:11:10 +0700 (WIB)
Date: Wed, 15 Oct 2025 07:11:09 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Serial <linux-serial@vger.kernel.org>
Cc: Cengiz Can <cengiz@kernel.wtf>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anselm =?utf-8?Q?Sch=C3=BCler?= <mail@anselmschueler.com>
Subject: Re: [PATCH] Documentation: sysrq: Remove contradicting sentence on
 extra /proc/sysrq-trigger characters
Message-ID: <aO7mnXCajeIdUYON@archie.me>
References: <20251008112409.33622-1-bagasdotme@gmail.com>
 <87wm4xbkim.fsf@trenco.lwn.net>
 <d6cd375c-dad6-4047-9574-bac7dfc24315@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LIbl/zC8wYYsbIAH"
Content-Disposition: inline
In-Reply-To: <d6cd375c-dad6-4047-9574-bac7dfc24315@infradead.org>


--LIbl/zC8wYYsbIAH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 10:57:45AM -0700, Randy Dunlap wrote:
>=20
>=20
> On 10/14/25 7:55 AM, Jonathan Corbet wrote:
> > Bagas Sanjaya <bagasdotme@gmail.com> writes:
> >=20
> >> /proc/sysrq-trigger documentation states that only first character is
> >> processed and the rest is ignored, yet it is not recommended to write
> >> any extra characters to it. The latter statement is contradictive as
> >> these characters are also ignored as implied by preceding sentence.
> >>
> >> Remove it.
> >>
> >> Link: https://lore.kernel.org/lkml/7ca05672-dc20-413f-a923-f77ce0a9d30=
7@anselmschueler.com/
> >> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> >> ---
> >>  Documentation/admin-guide/sysrq.rst | 4 +---
> >>  1 file changed, 1 insertion(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/sysrq.rst b/Documentation/admin=
-guide/sysrq.rst
> >> index 9c7aa817adc72d..63ff415ce85d66 100644
> >> --- a/Documentation/admin-guide/sysrq.rst
> >> +++ b/Documentation/admin-guide/sysrq.rst
> >> @@ -77,9 +77,7 @@ On other
> >>  On all
> >>  	Write a single character to /proc/sysrq-trigger.
> >>  	Only the first character is processed, the rest of the string is
> >> -	ignored. However, it is not recommended to write any extra characters
> >> -	as the behavior is undefined and might change in the future versions.
> >> -	E.g.::
> >> +	ignored. E.g.::
> >=20
> > I'm not sure this is right - there is a warning here that additional
> > characters may acquire a meaning in the future, so one should not
> > develop the habit of writing them now.  After all these years, I think
> > the chances of fundamental sysrq changes are pretty small, but I still
> > don't see why we would take the warning out?
>=20
> but the following paragraph says:
>=20
> 	Alternatively, write multiple characters prepended by underscore.
> 	This way, all characters will be processed. E.g.::
>=20
> 		echo _reisub > /proc/sysrq-trigger
>=20
> so it is confuzing.

I guess the whole "On all" description can be rewritten like:

Write a single character to /proc/sysrq-trigger, e.g.::

<snipped>...

If a string (multiple characters) is written instead, only the first charac=
ter
is processed unless the string is prepended by an underscore, like::

<snipped>...

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--LIbl/zC8wYYsbIAH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaO7mmQAKCRD2uYlJVVFO
o6ZYAQCwhB3aB0i96VC/SB/7tmP2XGyPcKpB3u3fe4lIlhflcwEA8e0cuJK+EduV
PcWc2iPDLvugWW7GlPMI0DUffFJ8bwE=
=saSJ
-----END PGP SIGNATURE-----

--LIbl/zC8wYYsbIAH--
