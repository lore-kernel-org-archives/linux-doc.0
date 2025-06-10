Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B033021C184
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 08:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545389; cv=none; b=R3gOxPp1Ol/PEwy6cm2FgLMvLhi/mIgAX78qU7ubdVuBGM5LthKcR+EavPkfkFVAtZZh/OVgaGdy47kUaFvbpIiVWStziZiplJxPE3gyMmZndXQx3s7VID+hWGY21Pvs09fXR5uxCbEwVEUBmPgTB1Fx18pCTEvv8lbf+ug5Euo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545389; c=relaxed/simple;
	bh=K+Scp3R9nRf6sR/1Zr7gmU+Lg0HdOZVGA6Nf0zel1Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHpuocs+R7bmREv5LRkPbOjwtfISQJ3YNYG96/LxO5M+XkSfvl2lEKpifK35sRgJAHmgTJUAEU6spU+w+pMA4mCMvBDHe5Y3gusfGZhXAQlD0NIBVxPsPfTzUibgEPgbZTJfMba7fsuUh6/chTelK3io6oPAoTuBjhbZqJ0WQa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AS8JCN97; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AS8JCN97"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso4022824b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 01:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749545386; x=1750150186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7keW0GVteitisZmne7mjA3Pax3iuqyiBpu7wD1vAU+E=;
        b=AS8JCN97Y3ofc4gsyvIuJ/JMDvWjSslWJfquppv3BLS2PhahbF9+YaJjWw7Vhmkb9X
         FbkxxXEe397WeVPBqI9IHmsipPzqPWTb7sSD4XAypKlBZ9u79o9CUeGOCLZXG/gPTo37
         JnNbRBWrhGWy7t/PhBk9N4MqqVgz1CN+WdBe7q57Ovjcki3SEKVqTJQN3ywnXGsKUsDi
         EtHdeNTpkh/pHmiD+DdnDxeD5+ZVMtCrAPRMpZwtUMVaafFKtlGr6AzBeNdzNiwtNxsS
         vmcMjufEA6cDeztwYFxP6yjIWOsQIVqYmLTfJghtGpMF7ejvvj1YJZf1gFlsJohxZtrG
         Hr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545386; x=1750150186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7keW0GVteitisZmne7mjA3Pax3iuqyiBpu7wD1vAU+E=;
        b=Mkp03DrDfrJZi5OfoGREATOA7SjZt6BmxRp06V/nkEpNWycayvQ59A6ROgh9t2GDWg
         NcwpTkfHphEpX6W7pfjjRqQCCAoes5Lg7RlBG3WRLg8cd4ksRE+AUHRdcBFF//vPLADe
         QO18VrdZHf6dUVKv3osJfbgilY4xu6UuqrzhjDATF1G95Q+7erNAYpZ/uKc2fPB6J+z3
         RkZbl9db7lVf6gZVvI1ZUIltu/COF+IDd45f9qgFRbUR+9YAcMF4s50K3GCrIabui0bF
         T0aPOb+Japk9CC/7yQlDNiqxjWUUFaA8EquOwR6JNTj8Aias/kYq9bOCvwTJ6jbIyK62
         kJcQ==
X-Gm-Message-State: AOJu0YybgUsQ1Q5hj4iKqAcViQlPa2l0Vo+FwF7Xnofz0F5n6pW0032F
	86ZR11nEfHkc1RnO5LVF5lAcATH7J+vZMe0tWLxrFvQLzxtBj456GlQx
X-Gm-Gg: ASbGncv4tKJj7uEOze1pj4XvWeCSHwVN9m8h25Nd1Cv2oI85SKAWkwhLRWSol5c93vy
	C3iZU6DYdnbwcWJpUOsc/6tFSTTRmg7ezcaVq6OEYMIaX3rftSalS1PO6kVPUCUz2AHe0HpiF57
	nOaEyr91WYSEYVC6I36GKGbbom8BA3ucAeDkF10gjQLez991mnuNjRrF3tsTXxjdI5q583bEBAn
	vKkwXF/8gNG8fOsrrjpm/RoQ/2SJIqfKTqz16GdVUfefewXrb2INTv5t3WXbiz0Lq9Ps0DwfalM
	KvCNEjFK7zcQ53kxzH0lhPyBEOsWghQC46R8/K098NVIZLTmRdNW6bJQ86n3MA==
X-Google-Smtp-Source: AGHT+IGk5vwSRKILK2xDjXJ6bLzKhYaiLSyNBFdR3SGeLjR7t271sb34TCIopQQOQ3MimqCrffFJLg==
X-Received: by 2002:a05:6a00:2e9c:b0:740:6f69:dce9 with SMTP id d2e1a72fcca58-74827e9cb14mr24263720b3a.0.1749545385774;
        Tue, 10 Jun 2025 01:49:45 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0f2e77sm7156034b3a.176.2025.06.10.01.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:49:44 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 396D14209E8C; Tue, 10 Jun 2025 15:49:42 +0700 (WIB)
Date: Tue, 10 Jun 2025 15:49:42 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Dante Strock <dantestrock@hotmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify
 terms; added note.
Message-ID: <aEfxpkzGUENMhotX@archie.me>
References: <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
 <87ecvtc772.fsf@trenco.lwn.net>
 <aEeqcX78zipEGJkl@archie.me>
 <PAXPR06MB822465B8887324D12F1F96A5A76AA@PAXPR06MB8224.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ndOIbFwSF4iJEPtY"
Content-Disposition: inline
In-Reply-To: <PAXPR06MB822465B8887324D12F1F96A5A76AA@PAXPR06MB8224.eurprd06.prod.outlook.com>


--ndOIbFwSF4iJEPtY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 07:21:16AM +0100, Dante Strock wrote:
>=20
> On 10/06/2025 04:45, Bagas Sanjaya wrote:
> > On Mon, Jun 09, 2025 at 08:37:05AM -0600, Jonathan Corbet wrote:
> > > Dante Strock <dantestrock@hotmail.com> writes:
> > >=20
> > > > diff --git a/Documentation/process/2.Process.rst b/Documentation/pr=
ocess/2.Process.rst
> > > > index ef3b116492df..70f8a6603454 100644
> > > > --- a/Documentation/process/2.Process.rst
> > > > +++ b/Documentation/process/2.Process.rst
> > > > @@ -18,17 +18,17 @@ major kernel release happening every two or thr=
ee months.  The recent
> > > >   release history looks like this:
> > > >   	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > -	5.0	March 3, 2019
> > > > -	5.1	May 5, 2019
> > > > -	5.2	July 7, 2019
> > > > -	5.3	September 15, 2019
> > > > -	5.4	November 24, 2019
> > > > -	5.5	January 6, 2020
> > > > +	6.10	July 14, 2024
> > > > +	6.11	September 15, 2024
> > > > +	6.12	November 17, 2024
> > > > +	6.13	January 20, 2025
> > > > +	6.14	March 24, 2025
> > > > +	6.15	May 25, 2025
> > > >   	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> > > > -Every 5.x release is a major kernel release with new features, int=
ernal
> > > > +Every 6.x release is a major kernel release with new features, int=
ernal
> > > >   API changes, and more.  A typical release can contain about 13,000
> > > > -changesets with changes to several hundred thousand lines of code.=
  5.x is
> > > > +changesets with changes to several hundred thousand lines of code.=
  6.x is
> > > >   the leading edge of Linux kernel development; the kernel uses a
> > > >   rolling development model which is continually integrating major =
changes.
> > > I do not object to these change and could apply this, but it might be
> > > nice at some point to rephrase this stuff so that we don't end up doi=
ng
> > > these updates repeatedly.  After all, we'll be at 7.x within a year...
> > What about not hard-coding first version number component like below?
> >=20
> > ---- >8 ----
> > diff --git a/Documentation/process/2.Process.rst b/Documentation/proces=
s/2.Process.rst
> > index ef3b116492df08..47bcc6248a1338 100644
> > --- a/Documentation/process/2.Process.rst
> > +++ b/Documentation/process/2.Process.rst
> > @@ -13,24 +13,12 @@ how the process works is required in order to be an=
 effective part of it.
> >   The big picture
> >   ---------------
> > -The kernel developers use a loosely time-based release process, with a=
 new
> > -major kernel release happening every two or three months.  The recent
> > -release history looks like this:
> > -
> > -	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -	5.0	March 3, 2019
> > -	5.1	May 5, 2019
> > -	5.2	July 7, 2019
> > -	5.3	September 15, 2019
> > -	5.4	November 24, 2019
> > -	5.5	January 6, 2020
> > -	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > -
> > -Every 5.x release is a major kernel release with new features, internal
> > -API changes, and more.  A typical release can contain about 13,000
> > -changesets with changes to several hundred thousand lines of code.  5.=
x is
> > -the leading edge of Linux kernel development; the kernel uses a
> > -rolling development model which is continually integrating major chang=
es.
> > +The kernel developers use a loosely time-based, rolling release develo=
pment
> > +process. A new major kernel release (a.x) happens every two or three m=
onths,
> > +which comes with new features, internal API changes, and more. A typic=
al
> > +release can contain about 13,000 changesets with changes to several hu=
ndred
> > +thousand lines of code. Recent releases, along with their dates, can b=
e found
> > +at `Linux Kernel Newbies site <https://kernelnewbies.org/LinuxVersions=
>`_.
> >   A relatively straightforward discipline is followed with regard to the
> >   merging of patches for each release.  At the beginning of each develo=
pment
> > @@ -46,13 +34,12 @@ merge window do not come out of thin air; they have=
 been collected, tested,
> >   and staged ahead of time.  How that process works will be described in
> >   detail later on).
> > -The merge window lasts for approximately two weeks.  At the end of this
> > -time, Linus Torvalds will declare that the window is closed and releas=
e the
> > -first of the "rc" kernels.  For the kernel which is destined to be 5.6,
> > -for example, the release which happens at the end of the merge window =
will
> > -be called 5.6-rc1.  The -rc1 release is the signal that the time to
> > -merge new features has passed, and that the time to stabilize the next
> > -kernel has begun.
> > +The merge window lasts for approximately two weeks. At the end of this=
 time,
> > +Linus Torvalds will declare that the window is closed and release the =
first of
> > +the "rc" kernels.  For the kernel which is destined to be a.x, the rel=
ease
> > +which happens at the end of the merge window will be called a.x-rc1. T=
hat
> > +release is the signal that the time to merge new features has passed, =
and that
> > +the time to stabilize the next kernel has begun.
> >   Over the next six to ten weeks, only patches which fix problems shoul=
d be
> >   submitted to the mainline.  On occasion a more significant change wil=
l be
> > @@ -99,13 +86,13 @@ release is made.  In the real world, this kind of p=
erfection is hard to
> >   achieve; there are just too many variables in a project of this size.
> >   There comes a point where delaying the final release just makes the p=
roblem
> >   worse; the pile of changes waiting for the next merge window will grow
> > -larger, creating even more regressions the next time around.  So most =
5.x
> > +larger, creating even more regressions the next time around.  So most
> >   kernels go out with a handful of known regressions though, hopefully,=
 none
> >   of them are serious.
> >   Once a stable release is made, its ongoing maintenance is passed off =
to the
> >   "stable team," currently Greg Kroah-Hartman. The stable team will rel=
ease
> > -occasional updates to the stable release using the 5.x.y numbering sch=
eme.
> > +occasional updates to the stable release using the a.x.y numbering sch=
eme.
> >   To be considered for an update release, a patch must (1) fix a signif=
icant
> >   bug, and (2) already be merged into the mainline for the next develop=
ment
> >   kernel. Kernels will typically receive stable updates for a little mo=
re
> >=20
> > Thanks.
> >=20
> I actually think this works better instead of removing the version numbers
> entirely or updating release numbers every year. Might be worth it to look
> for other pages in the documentation that have hard-coded version numbers
> and changing them also so that the version numbers don't need to be updat=
ed
> with every release.

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--ndOIbFwSF4iJEPtY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaEfxpgAKCRD2uYlJVVFO
o2szAQD2xDZLqIovKFlpwZjI46zBnvj8MsQBsYI66TnN7fTGnwD+LulsScPZaZCw
uDAJufBvNSVRTW5pwQt/tONSoEw+igY=
=toyz
-----END PGP SIGNATURE-----

--ndOIbFwSF4iJEPtY--
