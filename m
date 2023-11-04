Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0293D399
	for <linux-doc@vger.kernel.org>; Sat,  4 Nov 2023 00:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tn7f16ZF"
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1DFDE;
	Fri,  3 Nov 2023 17:53:12 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-778711ee748so168029485a.2;
        Fri, 03 Nov 2023 17:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699059191; x=1699663991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2sJNKKXPJm9x85Xp1gw9eh/YkwEuLNVSDs1mZ4TLuOw=;
        b=Tn7f16ZFPoNiduf9GWv8SQqjKGPaEukI8BL3rEH1rH8aVipWZuSDFb/J6SXNqZZRrw
         CSsK+7XCq4X7zvbfFcz95U01+sqxg82X7ce2wyZ9RGTghV23A7hp8+B70X+1GVc9+Y0i
         DwS1bdIOeRVQNmIHhTanlLx5Lk9oItND0xwAtYDi59COc4RIvwUJd2Iam+NyXDKi69Yb
         brsHe3Qm4+oFLoIYHmmUERTz6V7tKYYlpkOC04CitALRU2pbm4oKaKHGJM6zp5f1B/OX
         5q0+lmsvxL5pke2e8fGQan7m5ptZOFjuOeYt8crKLRgxUJe09XPqAPHh6GMYJTGfu61e
         HyrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699059191; x=1699663991;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sJNKKXPJm9x85Xp1gw9eh/YkwEuLNVSDs1mZ4TLuOw=;
        b=SWOEWWKf+wAbTDrOF0OF9yfBpJneag4gzPZJhK3ZeVIET/a2cOXG6dPPqu/soKxcC5
         OsYR9nxd1QGbS/dIEoVBWZO9Unxg6tsb1yOlZ0/XVoz2bzZk1HY48163pizkVh5S/o6V
         HxgBjN4w8UCMIPMAicTylVfDexEvQZ4R9+lbrihtiEPqfh+NIQT3994nLb18KVvMCsfN
         06YZEfGEwQYFr3LDuQRyBNoCeoejSC4TyzHNUj/ig93aLQ/5yBNuBTyBadOYnwt7rjIV
         jWYsVPOK48exaUNrffLIGz5ynnVEYUi0G5642WurA101HxyAgcocBCAnrFNA/Q/ogB4Y
         YD1Q==
X-Gm-Message-State: AOJu0Yxl0bkq0rEcI+1ufNR0zjC4fuhgRR8B7gML+nrwVLEOiJc64nD7
	l70qdGUNWGpNxxLl+4GOhhkhxU/87jc=
X-Google-Smtp-Source: AGHT+IFq5Si0YX37/vIvMvXa6YqNkKJPOSRV7G4UfSkhe7XTceDFpxWzmmSKF+zQRDsfNj32KIMINA==
X-Received: by 2002:ae9:e711:0:b0:77a:747b:b0f5 with SMTP id m17-20020ae9e711000000b0077a747bb0f5mr1928204qka.30.1699059191067;
        Fri, 03 Nov 2023 17:53:11 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 18-20020a17090a031200b0026b70d2a8a2sm2052381pje.29.2023.11.03.17.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 17:53:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B10D6803A590; Sat,  4 Nov 2023 07:53:07 +0700 (WIB)
Date: Sat, 4 Nov 2023 07:53:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Akira Yokosawa <akiyks@gmail.com>,
	Stanislav Fomichev <sdf@google.com>,
	David Vernet <void@manifault.com>, Miguel Ojeda <ojeda@kernel.org>,
	James Seo <james@equiv.tech>,
	Daniel Vetter <daniel.vetter@ffwll.ch>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Carlos Bilbao <carlos.bilbao@amd.com>, linux-spdx@vger.kernel.org,
	Richard Fontana <rfontana@redhat.com>
Subject: Re: [PATCH RFC 1/4] LICENSES: Add SIL Open Font License 1.1
Message-ID: <ZUWV88wRf9suUQfH@debian.me>
References: <20231102120053.30630-1-bagasdotme@gmail.com>
 <20231102120053.30630-2-bagasdotme@gmail.com>
 <2023110222-renewed-monologue-008e@gregkh>
 <ZUSrOKDuvcSL6gOH@debian.me>
 <2023110317-unhealthy-playable-d5d6@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="afQLVpNKUr+IwTwT"
Content-Disposition: inline
In-Reply-To: <2023110317-unhealthy-playable-d5d6@gregkh>


--afQLVpNKUr+IwTwT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 03, 2023 at 09:49:54AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Nov 03, 2023 at 03:11:36PM +0700, Bagas Sanjaya wrote:
> > On Thu, Nov 02, 2023 at 03:06:19PM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Nov 02, 2023 at 07:00:43PM +0700, Bagas Sanjaya wrote:
> > > >  LICENSES/dual/OFL-1.1 | 107 ++++++++++++++++++++++++++++++++++++++=
++++
> > >=20
> > > You add this license, but then never actually reference it in the lat=
er
> > > changes, so it's going to be very confusing as to why it is here.  Any
> > > way to add it to the font files themselves so our checker tools can
> > > handle this properly?
> >=20
> > There is TTF name string ID called "License". For example, on IBM Plex =
Sans,
> > the string value is:
> >=20
> > ```
> > This Font Software is licensed under the SIL Open Font License, Version=
 1.1. This license is available with a FAQ at: http://scripts.sil.org/OFL
> > ```
> >=20
> > Checking that string requires scripting fontforge, and since the string=
 value
> > may differ (but has the same license) across different fonts, scripting=
 it
> > can be non-trivial.
>=20
> And is that in the files you added?  They are binary so it's hard to
> determine this :(

Yes.

>=20
> > >=20
> > > And, it's not going to work as a dual-license, you can't just suddenly
> > > dual-license those font files, right?
> >=20
> > I was thinking of putting OFL in LICENSES/exceptions instead due to this
> > nature.
>=20
> Yes, it can not be a dual one.

That's right!

What about just saying below in the CSS file that includes the fonts?

```
=2E..
/* Some cool fonts are licensed under OFL 1.1, see
 * LICENSES/exceptions/OFL-1.1 for more information. */
=2E..
```
> > > > +Usage-Guide:
> > > > +  Do NOT use this license for code, but it's acceptable for fonts =
(where the
> > > > +  license is specifically written for them). It's best to use it t=
ogether
> > > > +  with a GPL2 compatible license using "OR", as OFL-1.1 texts proc=
essed by
> > > > +  the kernel's build system might combine it with content taken fr=
om more
> > > > +  restrictive licenses.
> > > > +  To use the SIL Open Font License 1.1, put the following SPDX tag=
/value pair
> > > > +  into a comment according to the placement guidelines in the lice=
nsing rules
> > > > +  documentation:
> > > > +    SPDX-License-Identifier: OFL-1.1
> > >=20
> > > Where did this Usage-Guide from?
> >=20
> > Adapted from LICENSES/dual/CC-BY-4.0.
>=20
> Which it shouldn't be :(
>=20
> Anyway, this is independent of the issue if we actually should take
> these fonts into the kernel tree, and mandate their use (my opinion is
> no, that's not for us to use, and especially for any action that might
> cause a web browser to look elsewhere outside of our documentation.)
>=20
> Also, for documentation, I'm pretty sure that serif fonts is proven to
> be "nicer" overall by many studies.

Any pointer to them? Or do serif fonts more readable and not causing
eye strain?

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--afQLVpNKUr+IwTwT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUWV8wAKCRD2uYlJVVFO
o4D4AQCtMjcSOoBop88UH+0ZkQFoouUH5Hxtt7s/i+MS2q3JEgEA4fklHr2mrooR
xXx+OLVk4pJPR5fiaCbohGvDdD68HgM=
=e9ra
-----END PGP SIGNATURE-----

--afQLVpNKUr+IwTwT--
