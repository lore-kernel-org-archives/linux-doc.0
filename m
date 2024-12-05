Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD2F1B0F19
	for <linux-doc@vger.kernel.org>; Thu,  5 Dec 2024 10:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733396160; cv=none; b=WQnriDa5Ioc9WJjNs4iNJMjxo+NyYlNxOloncg2Pwkkpy3om1iPviKxubEdSP6mDG6EtIA5i01YymX/q6KCXkeOlhh0OXk7tWirACXwR/FNLvG6hbfCMfm6CWtf28HKmibFX40asQ840lFzbhaIK2Fz+2icXMeAAzR6w5FH/cPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733396160; c=relaxed/simple;
	bh=AF4l6aeuX2fLoxZvJW1W+KRCKSLALJ38XhIN7Qx/qOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJFD4Sya7cg3N0T8DnBrUgXqw75vhguVRYFsB1BolUfyrs+CAW5dIXuesVB4V8X1iYusl0y0u2bZqtj2r8iHSuPRjRtYVxCUw7t5tURlSmBbt+fD2h815G51vM97XAa5PPwuxHe9pWNL8pGhm0S0PA3JYCdA7AhdXjj5EFg6lX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SMBrpOtL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SMBrpOtL"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385dfb168cbso383996f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Dec 2024 02:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733396156; x=1734000956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=39akCOMWUeaE+QsrfG7LB1+JbU+2qpioUetBg6wQUDU=;
        b=SMBrpOtLFsFLYabWu8Zv2sacjyVDD8f/JHaxnY2y9jY/Y5tC8d4mZZ6BLlx+DxulrE
         w4t95llKqUItdOEHrbfQvhXiHC2Gs85PltrJDyy/rTHCIqfgfXtMw4qeP3nkZViL22Sc
         39QQrSD8r8MK7U7VDnpqJepO1yOHqF5TduxpWS7T50x8GEcd24TXw9J1yIccVVk42WHb
         HfMdHTvsJnSxWMGcEm/AZmm6V2U7P+eh3z2tGgVMlAyQusH3B4V51HPrHRktPjb4nN18
         CPa+YqKccTGjhGD90+aDYYcPPBh7rwha1HpVQgzlY8iP/owSXLm8DpgtdAlekNR0qKc5
         YkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733396156; x=1734000956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=39akCOMWUeaE+QsrfG7LB1+JbU+2qpioUetBg6wQUDU=;
        b=Q5dgoNlFJXKpw9ZiIQtoTS+6YJNJixMn7lfCXo/8vLCRh8nZIbucTiYWzDK5LVan3A
         gEHYUSM/93TAgCp4cD6uAweqIWLxMfAYEBDIET5OpQ2CEMxUmKP9EJ+VfRXcAq3c03S4
         CsY6//8AAozadFHHSoN6Tas25SqZUZBToNsB8/FKTaeG4Hch5JZmeOoEvoF5dFC9Tt7F
         X82472T43PnnrmtvFF6M1CnYCdEF9ovRUtH1TGaGCLY9qU1LOsiw+iyKKe1nv+otHiQy
         zocqnogJI0uqnsoQdO+QyHCr4MpkxKjZRwcGKXBthth2GO3bptftoTS3W2aswze3CPf6
         FUww==
X-Forwarded-Encrypted: i=1; AJvYcCVI6DGQLp3Q0LU1pDL3io5XRYsbIdfgOKD7kjyINmwnURyCQRTj6GCkUqMGeL9fQmteHupJMllVxzI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4TeyQhTYKr6Khc6vXn5sHKlqelC5HzYy34kZ1zWbby9VQq7Vi
	yWcxemyhO8sNkHWxanEHFd08gvUx2bY4rpz59RqlYv35f8tvXOes6t5hJ3imRZkH6hVP9DciKzS
	Mhvs=
X-Gm-Gg: ASbGncueMkSOYuPPVP+L6+oQTOAEK8j+H9iMFLPTBaqk31jgftVHwZAbsFf3GRZOy9d
	oHo4j6xVTGviRBwTsKKYDAbR4p4PIsc9YGRhYLiZuhe+j08Xh/7EhdZiLKfJ3T29dlpWuCyRsY0
	H3Ux05mFaId9hFGFa+ZNZPOQC4GTZDHYztZQ1RrK+0+VToVSt11ZnPN7fN9tvtQfiwYfCfIQ4hX
	VPdq1OQYZhpJmgBcgIzl+BlmkfTiWZ/IRruMPqCfvtwaEOY9lyJGTaJ+9iI01aDeedg4iXwdFFP
	jFtm
X-Google-Smtp-Source: AGHT+IGoxjZo6bYwAfvD7E5XX5REfxfUUf5BngBNE8pXoqpmil0EuvXVzWoDcm4jX8QY3WMIzJJ3Ew==
X-Received: by 2002:a05:6000:4601:b0:385:fb40:e57b with SMTP id ffacd0b85a97d-385fd3cd413mr8375393f8f.15.1733396156499;
        Thu, 05 Dec 2024 02:55:56 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59ce34sm1626705f8f.25.2024.12.05.02.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:55:55 -0800 (PST)
Date: Thu, 5 Dec 2024 11:55:54 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Maennich <maennich@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] doc: module: Fix documented type of namespace
Message-ID: <mfgqf5xpjnyud3qm4hwycbnz23mfik4pzry3h7fi2k6khokbgd@facrmygrrqnh>
References: <cover.1733305665.git.ukleinek@kernel.org>
 <6fe15069c01b31aaa68c6224bec2df9f4a449858.1733305665.git.ukleinek@kernel.org>
 <Z1FbOrGjaVsGKIXa@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s4byhypekrqelq3e"
Content-Disposition: inline
In-Reply-To: <Z1FbOrGjaVsGKIXa@smile.fi.intel.com>


--s4byhypekrqelq3e
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] doc: module: Fix documented type of namespace
MIME-Version: 1.0

On Thu, Dec 05, 2024 at 09:50:18AM +0200, Andy Shevchenko wrote:
> On Wed, Dec 04, 2024 at 11:01:10AM +0100, Uwe Kleine-K=F6nig wrote:
> > Since commit cdd30ebb1b9f ("module: Convert symbol namespace to string
> > literal") the namespace has to be a string. Fix accordingly.
>=20
> >  In addition to the macros EXPORT_SYMBOL() and EXPORT_SYMBOL_GPL(), tha=
t allow
> >  exporting of kernel symbols to the kernel symbol table, variants of th=
ese are
> >  available to export symbols into a certain namespace: EXPORT_SYMBOL_NS=
() and
> > -EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespa=
ce.
> > -Please note that due to macro expansion that argument needs to be a
> > -preprocessor symbol. E.g. to export the symbol ``usb_stor_suspend`` in=
to the
> > +EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespa=
ce as a
> > +C-string. E.g. to export the symbol ``usb_stor_suspend`` into the
>=20
> But C-string is ambiguous. Is it now okay to use
>=20
> static const char *p =3D "my constant C-string";
>=20
> EXPORT_...(, p);

I didn't test that, but I guess that won't work. While you could argue
that p isn't a C-string but a pointer, I agree that the wording isn't
optimal.

So maybe make that:

	... the namespace as a string constant.

?

Best regards
Uwe

--s4byhypekrqelq3e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdRhrgACgkQj4D7WH0S
/k6ScAgAiq1T96IbXljeMhp7b9YEjRrmFkHTKaVWu4HRW3yp9BpvdoiYTyhgZT1X
OhqZY2I08zkWjVz4cEjc9A8QN68/TdWjx44YBrpQvOwFg5hCIvbSKoQpVekPqObN
drj4yRYugMhF/ZDQgvD6e1dsewoziKP9XaZ9EoueAOzgT9WzqDjGzyxb1OWxY0CP
Hd6iob3658ku+8iGz3poKVCkvRdg9Rj2C7BXrrW68xmo3Azm97J4iAcwp2pwdIgn
Hoc/8FVTOc5E3Ui2oFToXRC7kS5YlaW4kU52q6c9x6p40SkHcieslUT5Rfhvj+hs
mhixOW7BEAxbCvYv9uNb+Yptv+YaaQ==
=PJT8
-----END PGP SIGNATURE-----

--s4byhypekrqelq3e--
