Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199051;
	b=PRpKzr454FsI0+81a04oBnQKnKCXBmImBllbwNbHlyFr1wS8ncR3x7Xr/4z1aK4ZBRAk
	 46R7ocxdf/VFtdfFhn/LK5x7GLfPnqwrIMBEjapqdGTAZkspHw6AuxZ7bEzxUcpesfuOT
	 kcmYSxuo9UO3V5l+UO2R0FXD8Ue0VHWQuqd55Lxhl6ELk9QZDi3AS2qN0tZTv6yevliYk
	 0Bza2ku/VqmwDBVQVgs2o/2w+O/NZYuDam75qLgH0s56QlNwC7dyGWOpXOimNDx95+aWs
	 PKjStxB8Viu7Zh2vTzIDj9faSexiMDmDjouAwOhmKwhaNo8dNuPLo9ztM8jT7ifKH7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
	b=IHy6uJbhQY2k9/Tcan9mgqmT8C4HCO3qjevOe2vWA9NeaGRalUYaVL/V+00S+fra3f5H
	 sO2U4RXuU5wqgDSFOFt2HEIKcr3OEFmN2rZPOFWGcQ402B6/8D25FnXNGikXvTjDvsysn
	 /jqQCyoOf97aabneFbVvrQbd9aXnvFFWmDlHhp0NVoUbCbHHDiDI7npb/5E6Ym9eKVIkY
	 dZQ+AJmooiouHejwqzO+vza7JTryvBm6jy8SBP9VnBCHlqlWuiYIvZnnDelL8LMrvkbEv
	 bL8EjP3rtynTPZ02Ad67kq2o4Jv9ftS/+LURXnwfX/r0lgUVpakM/AizEDRaVPZw9aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZHI+PnMY;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D6606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 14:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A4D6606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=ZHI+PnMY
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso9685135e9.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793199047; x=1793803847; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
        b=ZHI+PnMYUO4N11z48C45pvIZIJWpMQLYtqa/tXxi4VJPtckafE2C8vZsmMqf8WSay0
         WkP8vzXw7KUTk+v36CyGXajDZqG5by6+RXck/9D3EACNfx4yeyKYYQCGbZWVuUnG8rUY
         5qLQe1LGWxfOMYFobc3VGIHrV+AV15yetvd7tYKfqNhVaNLNUnVgOeygrUQUPRbwHDiW
         lcID/IWXFCzR53WbNv/a/lMfGMt8NtxMv4qhxOQ+gXhSRnRitG8FLFKqq0+vRsgTDT10
         G8Oqf0Udam7YRK2gHQ+5l/UpMXkarOzmpwiZriOVr29JvpcbNa84+vP5mTUlSdzwCT8R
         2qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199047; x=1793803847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8g9t7ALU7n+7VW9gQDZGowaF3x6SIEajb/2Mc6wiGZg=;
        b=Qy2c6ybqBkYqRnBGfQ5dEDCi+/75MOaHTkgyc/Xl3NsWaJbOf322XKjpEBgT79xrQC
         +9+qLWgFPSTZwZs0JlreL3SETm7WIlC9kbP1RqDA73PClP/iis3B3vBbYe2ToJQUkWwE
         pGUqwMywAcZ+ZaMLCGGyf10LdmSSAw2HVwluQf79zA+36+d3K7CdtD1bFDAwjotIS+zk
         +2YdoP86u1Igsv/2tyG2MHIiGypR5fN7Du28KZpbnpiDXwAbDS0FOH1V8fZhM5l6KiGr
         I4FJR5XHY4CjbH6OloPoknUDipv6b4FVN3UvsppiCoD/GmEAYgHhNZpp/ORzKxIG8PVf
         8CFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQCk1HKlbiahI8K6UkPMdx1FONaZXInz3SgrSl+fyZHPGxWbPE9rpF6+uxKHBNmZf6jF6+iIrsd5w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtRmYVNV24hqHng4qJCs2Tar0v9ViODFcqBuLbjOkS7fJ97JcB
	5rcyDjsjaw+yhdFMeye5RwECg9pK3jseg7ywVDRzDPERJcWnqdCiR4aY2/HqsP28mAA=
X-Gm-Gg: AYBFou23B/cbPo76y75ImjpevU7h+am+bMyRCR0adqobcV4X3LN2X94Dysn+VKy+uk4
	jRwiAz5vDn/ou+SXtUUcJB/pdnT61b5Pzz9EQ8rErJIZQDrUPFvcYk9qUhFj+9e0pHuHMQpLqld
	CTykZOatsQJEzSHM3aD+eqACJ9B/fj63pG1hGg4oVP0nAW9x1t4KI3VzsXe3Oe4dvr9CLVT+1wg
	QqoS/tbcnNVaOjls7mQCqgVwWVoCCjx8R7g6ZnDdB/uLjjaCYOLt0g8Fp9rfCQlQKKDmNe19hXF
	r31u9QAkEdLm8xh0OZWnH5c/HDQqH4+OfuS+qE9QME2TBBLogH2FmhHmhSqpLqjurHpjAlfbBRG
	1SG1vidw2eUxIoqqd8OunAFUNwDCPYHk7ucUQzZ/VB25i4N0FwtBoyhAFeIo1KosvK9wxw1MJVo
	tliPL+PZmkPp7GFznxowtopB0pgpGcjSvF1FL4k4gkBH5iRl+I4pqztwzfTWpX1zFLV0PJAna5d
	Sffxzg4SOCPCOjZ0LV692Uu221Lg3XfTTp4lTh5JsbCT2jT/By9BoaPmxotn2YOPH8O+0YwzD37
	E6fh7OR+G5qt0SIKgXiAMj1TPGEcmPxKWcs=
X-Received: by 2002:a05:600c:3510:b0:4a4:7a8d:c436 with SMTP id 5b1f17b1804b1-4a96667dd75mr52332595e9.11.1793199047357;
        Wed, 28 Oct 2026 07:50:47 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a97cebf858sm57250745e9.12.2026.10.28.07.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 07:50:46 -0700 (PDT)
Date: Wed, 28 Oct 2026 15:50:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Alex Williamson <alex@shazbot.org>, 
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Bradley Morgan <brads@mainlining.org>, 
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Thierry Reding <thierry.reding@kernel.org>
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <auILBqh9Ccv7ztid@monoceros>
References: <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <2026102437-vista-unsoiled-b089@gregkh>
 <at34UOuYv3NtX36R@monoceros>
 <20261026225950.GD1685504@ziepe.ca>
 <2026102849-turkey-series-ac07@gregkh>
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
	protocol="application/pgp-signature"; boundary="dvdgfsb6jpiy7bdt"
Content-Disposition: inline
In-Reply-To: <2026102849-turkey-series-ac07@gregkh>


--dvdgfsb6jpiy7bdt
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
MIME-Version: 1.0

On Wed, Oct 28, 2026 at 02:45:18PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2026 at 07:59:50PM -0300, Jason Gunthorpe wrote:
> > On Sun, Oct 25, 2026 at 01:48:04PM +0100, Uwe Kleine-K=F6nig wrote:
> >=20
> > > The more I think about this taint, the more I believe the commit shou=
ld
> > > be reverted and replaced by a some stop gaps for driver_override. (Be=
 it
> > > a taint or better yet
> > > https://lore.kernel.org/all/0f7446324f6a0c8f0153d6532d92a6eeecd6a308.=
1790612298.git.u.kleine-koenig@baylibre.com/
> > > .)
> >=20
> > I also think this patch is way too broad and should be reverted until
> > something better is designed.
>=20
> Fair enough, I've sent a revert for now, will get it merged before -rc1
> is out.

\o/, thanks

> I'll rework this for a later release, thanks.

Please look at the series behind the link above before investing time
here. I think most of the ideas are already implemented there. If you
voice your preferences there, I can rework accordingly and rebase on top
of your revert.

Best regards
Uwe

--dvdgfsb6jpiy7bdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmriC7gACgkQj4D7WH0S
/k7RWwf/cwXDsUHX0jhgjipjJFi1+cjW14UhDdlEnrd0BnzhDhCcWYdtX4Jokju7
CvB5Oiyfrbzutn6NGqwDb2r6lwabIE+FUkSwqOYBh0v9DeYZc09PyetAJUrJc1P+
ykWQcL5z1tPk5gkQDnk/OMUtvZXVwgH9T+CJaYjJ1zX5KQEqpM1iA0orv6blUtcV
QoHhDAdbFR9S/jZ/4rdCfk08awpvM3VqeV4VW0n2VR/QwFLZ7NS45TRo8EZdRHiI
enU/kyx10Vep14yRZmuVr3Xw5rdSN+ylwbNFFKzSLcL/Vz00iyhlIOgvlsS2wy69
vU6dhHVeUJVTb8Y8hxbTBePHR0MSsQ==
=kVFg
-----END PGP SIGNATURE-----

--dvdgfsb6jpiy7bdt--
