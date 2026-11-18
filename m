Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987832;
	b=DvlBLaIYLkfptLJtghi7cF5AIQ2h3FcOLu7eJJM2MWLKbJh1CLDdiqhaZ7rp+LWPHeJI
	 VBXxPl2KsdNZxjIgabW5VE+M3jQJyNNeoXXm498+GxGUr5pd+8yQsvd+TSPpe7ZG0MHjl
	 rAp8zu3uciJlVLlkb+t+pXgNLV2PM2gtJ8V0tGT8YJjyBTpkGj3lerY7+veJC+NWhmgvd
	 qk/8STzSuxsBgvl9Tckc/vyyNaeB/giyPLJ4ZtXTtPcGdloq6jOKItCmfWXaKxZ/muIeL
	 94GnF2YsdYoTN90bKfFUGL8cOmlNJ8wKoGYwvPqMWat8Ajec9bWTUJzgHPmxHGbJWeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987832;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
	b=JR0j9BTSQ4BCM3GRz9iCrKVd27BWDZo+Ukvgt607n/Qg+S2tQVwkk7qLe/A9yRQw7/Du
	 YQXqYX+IjeX0AkIMgR3d3IAOeBhTn0DhvNn1GVvNm2FTTnOymLL0qnPAfc46fyaNrrCDx
	 gHYBnGfVfSBa39lMCUrwTiwN1/WO4S6Agfcr3eCdSIpv23SHD+DWWgAdVKH69hzRsVR24
	 72PV6GNZ3Kd2gTaW+M6t1eqy8MiB7wxpv3ujvADmooHRVuwuBLojJnRPJRIRBMxZq+da4
	 cH91eEt1KTFSrl+jqe7vUKKfTQv9Jf0xKBOuLOKUBp0TPSx7NJksSa50C1lCKTGUp/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WpWuB4tE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0172D606A331
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 07:43:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0172D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WpWuB4tE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso277827f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 23:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794987829; x=1795592629; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
        b=WpWuB4tEuz5eDTzgRMqfwCsaPFnT3I15+vdfIn2Uk3cbYgtMmrQdRquS/GF9Tbkq/Q
         dR0ngIvaa3Cc2RRmzlHUp7911UQhJJvHV/Fs//eh8jZA8APDItUN1P+QsT9pokDyLPzs
         2jSeF5+4MtVYpIIr020Ce8SwRIFG8QyGOjWnOtAqKBhL1IB/15f6sJeMMLMuqIEgd+Nw
         wMj4Lmu/3Bymdzbw0QpqUZGEwAdhozDReHammO9/WMYHrdbTOcVIqXhE/crYQwgMha4z
         Mb5j9p2VK+aLTtu8yCCcQbh1vp80kisF93kzJUHD+8pampEZDp6U8NIw0+g89gjuTdP4
         UC3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987829; x=1795592629;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZnHY355Lmina/i/sthQaqZuymWw1SBJp8dmE6kjbEPE=;
        b=z/A6ouklnTDHGmflF1XiLp1PqHhvRryJDYZJmF35IqX/3dOm9Sn552HfSOuq5xOXdM
         IC8DcbKN/s9200P66AtL2FSBW3xj0OI32QYgl2u0Apjn/fdETVmPlMQliRBN8UwqB1y6
         FkXpFjuclLdyUFa5JmFlpVLhhlQVDz/td6GAQDOASQcaKRe3b0oEmxu7mAgnfXrhbX0i
         X6DdBR/QqB5u1DhWzxwLwE0kyyWD99nNdfQf+tsXxxuJWCkJhLHqmql6ZQB0dY8rCnQe
         RM4UShKz3IY4R7AdI1xSNvuuA1V2PnC9+WbUHKFM6Ja1buAV9NXS1dYoRk6yasdjz3Yn
         6wmQ==
X-Forwarded-Encrypted: i=1; AL+hErFhSzf8D3CuD8xRSrBo0jmgv9GAFREpHgbn8cQJlIi/hBZSxS8lRSp3hQ19zL8LoG+zygCGZ4Rjpck=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VozAqrBucm6A9dGsK2VU/ys6VWhZWB1Znk3EC7uqpdg8XV7T2
	pfarUhUkJyz/uoukZSYd6kmG0Y8UNMdVPDakdARdukjkzkiLEhg1ZGtpbvMXOQcOOhc=
X-Gm-Gg: AZFdTZeJbUwCaYy9oSb4GtfkZgaKb7fc/Cabq6MXW5X469DzKBs8/3+YqSE4wkNdsJ9
	B4qXsKPuSnGVEbSOj4y0Y0UdyRsP+QU3FDa2amyrua5R2os4xz4a/xH2iVfP7FCU+0GQpm4TlZS
	8TaQGT9UW08CZlA7wNBfEpyUKV5r+hy/rTZ8PtHMrB2MA6Nr3ryDBGBifVXgtSJInWvygW+AfCU
	WP2z62Bn/2sAr4cWbNEy89ktMQFbNVxYa9pSFjgpshydhnQn/h2gUja/630/y9gmKlFLiAFZPm5
	BIC5GA7oO9SCmqdjAdQSp670S07/SSmbdBvjC5QVJ/Vwlg/UxHy9dWmyAAUvp3620W0y1lODkq6
	l8Z24HBwSM/xvuD6FAaXEpzklY02gIMcSm2ZCRBneuzkFbYlXwyxKP44QxU0Q6Vwqil885TKWp7
	0ygNMOKmpy51qtiBYYZ50mcNLHpYDCMx2mgItnbPeX8Pp5nIrkmuV4RrjmYfy0k2gcX+Z7newjP
	U6poHAYNf4eE5woQnUKqonfBq39evNisywGpUk9GKQm6fxUxM7Hm4sIi/OtnKtbjY+hZY9pM4NN
	mHe8e93u514Amnar7kOnr8ohrzsh+Uk+/H6njKGDU4NP2RNF/tMrp34GxVuzd2vfRbvJot3uOdv
	MY73GRmMhvsoCdSI=
X-Received: by 2002:a05:6000:2c02:b0:493:bd29:a6e3 with SMTP id ffacd0b85a97d-4a63c6582f1mr3348907f8f.15.1794987829259;
        Tue, 17 Nov 2026 23:43:49 -0800 (PST)
Received: from localhost (p200300f65f19a904dea20c2220232395.dip0.t-ipconnect.de. [2003:f6:5f19:a904:dea2:c22:2023:2395])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4a656c11f4bsm3197026f8f.51.2026.11.17.23.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:43:48 -0800 (PST)
Date: Wed, 18 Nov 2026 08:43:46 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, David Lechner <dlechner@baylibre.com>, 
	Armin Wolf <W_Armin@gmx.de>, Thierry Reding <thierry.reding@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Marco Elver <elver@google.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Jeff Layton <jlayton@kernel.org>, Bradley Morgan <brads@mainlining.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	Pnina Feder <pnina.feder@mobileye.com>, Mete Durlu <meted@linux.ibm.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Rio <rioo.tsukatsukii@gmail.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>, 
	"linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Alex Williamson <alex@shazbot.org>
Subject: Re: [PATCH] driver core: Disable driver overriding by default
Message-ID: <av1UwuDq9JJkEYkN@monoceros>
References: <20261116110853.3418077-2-u.kleine-koenig@baylibre.com>
 <MN2PR02MB6863F6E744D2651D2520A238D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v3mgawp7jou3triv"
Content-Disposition: inline
In-Reply-To: <MN2PR02MB6863F6E744D2651D2520A238D47A2@MN2PR02MB6863.namprd02.prod.outlook.com>


--v3mgawp7jou3triv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] driver core: Disable driver overriding by default
MIME-Version: 1.0

On Wed, Nov 18, 2026 at 05:51:29AM +0000, Michael Kelley wrote:
> From: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com> Sent: Monday, Nov=
ember 16, 2026 3:09 AM
> >=20
> > Driver overriding is useful only in a very limited set of situations
> > and then only with very few drivers that are designed to support that.
> >=20
> > Disallow matching via driver_override unless the driver explicitly
> > allows it or the safe guard is disabled using the
> > "allow_driver_override=3D1" kernel parameter.
> >=20
> > There are many drivers that don't expect to be force-bound and often
> > doing it anyhow results in a NULL pointer exception. To make debugging
> > such cases easier, add a new taint if such a forced match happens.
>=20
> As noted by Alex Williamson [1], there's also the new_id mechanism
> that can force bogus matches and result in the same kind of NULL
> pointer exceptions. What's your thinking about covering that case
> as well?
>=20
> [1] https://lore.kernel.org/lkml/20261028094139.12ea7c16@shazbot.org/

I didn't look into pci's new_id a lot. It sounds as if it should also be
guarded with a similar mechanism as the one from this patch for
driver_override. As my experience and testing capability with PCI is
limited, I'd not add it to this effort, but leave it for someone in a
better position than me.

> > Implementation detail: device_match_driver_override() isn't a static
> > inline any more. It grew a certain complexity (e.g. a pr_info()) and so
> > was made a regular exported function.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > this is a rebase to current next of the series
> > https://lore.kernel.org/all/cover.1790612298.git.u.kleine-koenig@baylib=
re.com/
> > . It combines the functionality of former patches #2 and #3 (#1 was a
> > fix that was already applied). I also addressed sashiko's comments. I t=
hink
> > this matches what most people want in the previous discussion.
> >=20
> > As the rebase wasn't trivial and I merged the two patches, I didn't
> > apply the review tags I already received for v3.
> >=20
> > If this patch is accepted, a number of drivers that are supposed to be
> > force-bound need to get their .support_driver_override property set. I'm
> > aware of the following:
> >=20
> >  - spidev_spi_driver in drivers/spi/spidev.c
> >  - stub_driver in drivers/pci/pci-stub.c
> >  - uio_dmem_genirq in drivers/uio/uio_dmem_genirq.c
> >  - uio_pci_driver in drivers/uio/uio_pci_generic.c
> >  - uio_pdrv_genirq in drivers/uio/uio_pdrv_genirq.c
> >  - vfio_amba_driver in drivers/vfio/platform/vfio_amba.c
> >  - vfio_ccw_sch_driver in drivers/s390/cio/vfio_ccw_drv.c
> >  - vfio_pci_driver in drivers/vfio/pci/vfio_pci.c
> >  - vfio_platform_driver in drivers/vfio/platform/vfio_platform.c
>=20
> drivers/uio/uio_hv_generic.c also probably needs to be in this list.
> It's used for running DPDK against the Hyper-V VMBus synthetic
> NIC device.

Noted.

> [...]
> > +static bool __read_mostly allow_driver_override;
> > +
> > +static int __init allow_driver_override_setup(char *str)
> > +{
> > +	if (!str || kstrtobool(str, &allow_driver_override) < 0)
>=20
> If the kernel boot line parameter has a bogus value that doesn't
> map to "true" or "false", kstrtobool returns -EINVAL and
> allow_driver_override is set to true. Seems like a bogus value
> should default to false. If no value at all is supplied and str
> is NULL, it's debatable as to whether defaulting to true is OK.
> Seems like might want to insist on a value that indicates
> "true".

Well, the default without passing allow_driver_override=3D$anything is
false. Initially I wanted to have just

	allow_driver_override

on the commandline to disable the safe-guard but sashiko wailed about it
(well, more about how I implemented it). Maybe I'm going back to that
approach.

> > +		allow_driver_override =3D true;
> > +
> > +	return 1;
> > +}
> > +__setup("allow_driver_override=3D", allow_driver_override_setup);
> > +
> > +/**
> > + * device_match_driver_override() - Match a driver against the device'=
s driver_override.
> > + * @dev: device to check
> > + * @drv: driver to match against
> > + *
> > + * Returns > 0 if a driver override is set and matches the given drive=
r, 0 if a
> > + * driver override is set but does not match, or < 0 if a driver overr=
ide is not
> > + * set at all.
>=20
> Additionally, returns < 0 if a matching override exists but is disallowed.

Yeah, that comment is just taken unmodified from the old location of
device_match_driver_override(). Indeed needs adaption.
=20
> > + */
> > +int device_match_driver_override(struct device *dev,
> > +				 const struct device_driver *drv)
> > +{
> > +	guard(spinlock)(&dev->driver_override.lock);
> > +	if (dev->driver_override.name) {
> > +		int ret =3D !strcmp(dev->driver_override.name, drv->name);
> > +
> > +		if (ret > 0 && !drv->support_driver_override) {
>=20
> Using "ret > 0" seems a bit odd since the value is essentially Boolean.
> Suggest using just "ret".

ok

> > +			if (allow_driver_override) {
> > +				add_taint_module(drv->owner,
> > +						 TAINT_DRIVER_OVERRIDE, LOCKDEP_STILL_OK);
> > +			} else {
> > +				/*
> > +				 * If you hit this warning and you need to
> > +				 * quickly workaround this check, boot with
> > +				 * allow_driver_override=3D1 on the kernel
> > +				 * commandline. The right fix is to set the
> > +				 * driver's .support_driver_override property.
> > +				 */
> > +				dev_warn(dev, "Suppressed driver override binding to %s.\n", drv->=
name);
>=20
> Maybe "Disallowed" instead of "Suppressed" in the message? Even better,
> could the name of the device be provided? For example,
>=20
> "Disallowed bind of driver %s to device %s using driver override"

dev_warn() emits the device name.

> [...]
> > diff --git a/tools/debugging/kernel-chktaint b/tools/debugging/kernel-c=
hktaint
> > index e1571c04afb5..56215e0f5112 100755
> > --- a/tools/debugging/kernel-chktaint
> > +++ b/tools/debugging/kernel-chktaint
> > @@ -211,6 +211,15 @@ else
> >  	addout "J"
> >  	echo " * fwctl's mutating debug interface was used (#19)"
> >  fi
> > +
> > +T=3D`expr $T / 2`
> > +if [ `expr $T % 2` -eq 0 ]; then
> > +	addout " "
> > +else
> > +	addout "Z"
> > +	echo " * A device was matched using driver_override to a driver not s=
upporting that (#20)"
>=20
> The messages in kernel-chktaint usually word-for-word match the text
> in Documentation/admin-guide/tainted-kernels.rst. Any reason not to
> do the same for this one?

no, will adapt.

> > +fi
> > +
> >  echo "Raw taint value as int/string: $taint/'$out'"
> >=20
> >  # report on any tainted loadable modules

Thanks for the feedback.

Uwe

--v3mgawp7jou3triv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr9VzAACgkQj4D7WH0S
/k4x8Qf+L/hWtqlrgV77gKjkQ3o8g15MeCaKb8qCFvTvBbXXBo8rkw7NzS3wgss8
dRpsoTD8At5OtGl/6aGkB4RuygBxQg27jXRPPKVG1AilLnzSVM3hIyOpy3BwR/BD
/t1iXYWgfyEjnS3/s0knXZjJKQtRMhSmurudhbU8ecCq4sxjj4QqYAB5/cUitW8P
rVVRhzXG4rTyA1J4MH3NLynXrDW4cMh7GYZyRCO9qLYRNq1XEZDYxKWRYzk9B8Xb
Aa/QqtZSgnUNkoh3cwwkAJdFWjLh417nVzFA5e7YRIRMqzbR7Au9+b40/vS++4d0
a+EPr7Jty/qPVQ0cG6+31pQCliB06Q==
=V3Pv
-----END PGP SIGNATURE-----

--v3mgawp7jou3triv--
