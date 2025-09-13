Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5692367A0
	for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 10:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757759506; cv=none; b=gsNaAu2EaxCjUwHHb3pijvYVX66Axl69RTKcRk9TnoGpjuroEiMKXkBLgxKwdnGSA34GxJmrCete3SiX4rQStwxBW4aL94a2kiAQ76sb3J+o8uf1ke7Ao50n/L/nZL6AOINuXBFfbcRYwycOt783098B6CweSp5RmYjp3N4WTHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757759506; c=relaxed/simple;
	bh=kLjujwuai/vpVgO0CVp+hKYrEhCuNSFv89vDY2WVAtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMJ9uf1sKcThrEuIhD8IUxr7ZKbtGGzVxPAbY3hrf+MSXEMXy/453wXo9g4Ftguo0n5D0LjtuywTBxSUx2HB8qBvRffJIqaPBhqe6IKvO9GaF59STIhZE4qLlHUM6MRQE9NKvYEAETOA03otl/szBZPRJNt9F6hRuEUaoIij5yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ30YJFI; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ30YJFI"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7761b392d50so1483918b3a.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Sep 2025 03:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757759504; x=1758364304; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ir/ou5rnkwOqwXWRi/QtrwXILS7ZMKlDX7jKwfdf6bk=;
        b=eZ30YJFIfsiU5z3icVuoPChp1JDUYPQ+Y0xRUsbwscuJYquJBggi8FVXwgQYISVSXB
         79U3c7OyN74ajw2wtFM1MZ41L5D31jqkqyd2bUJ4Wkx6bYi0ptJivDKa0Qdd6s8JXUyD
         0o7UrZca/YX0bkhIHlnPRo7coHdjULBUHrQrwmlgzphqGaDAyilmW/cPazjLbLqb9M3s
         DlMfooEpdvAVYw22SPZiXNFwLrVbSwV6E+Fnvufx0OrTjTOijGPw0VBG5TrbNtA+R9R4
         /hnNBa78lsOlSXv7sbKlsli1nLsWE2nOCsAGNmJkOjqg4KuU+xY0SGFEouMArhrc6Yu1
         SBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757759504; x=1758364304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir/ou5rnkwOqwXWRi/QtrwXILS7ZMKlDX7jKwfdf6bk=;
        b=YOMkYdOib3+sSLwhNSKpelu4DeEJRhzJbHoVpPh+dBERBa2yvnweMf8UUeJFdSDQFR
         SmhI6IR89Vxd4QWezVYdBthWFQinPdAll+34idVgpqWGiB/yQSOPcmxx2cXDqY1Lc0aE
         8k55jTKIZpSrh+j7Et75Vt8xMAM19spF7CJSgRDnbehlW2411gPR5YfHPbfGCZeesW3o
         kCFvaWs2YZd3oSxZqtZuKXqvalwQUr/FB/+VLWIV7X7IQuyEj527gkLcIEgb4AbeINTq
         CI2D7DOOrg3b6j+GUSo5BvJ61GZSJF+WLwNjKEyiJ9RjvSKWx1o5QXChLdnGBvXmilVV
         MiKA==
X-Forwarded-Encrypted: i=1; AJvYcCVwbXyCHLwBHxabAP/QwbS/jHVuOrCSvb6s5mTlXpR2g5N8DBL4nmjSZlkCMqRBjfn8OTaxA8Iheuk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdC4KNTLrnLFh4kIDy+K68SMAF3z/CzCTbNPJBtsa643vvGLZ
	WTIGTmunts2bcWEXrzZK0MRECfWvk+wiKpH7zDONbF6hBuAa1TUH86zs
X-Gm-Gg: ASbGncvfsNE4pq6uAwS7bAOtYz3UqZbmCP7mE2CR4ZHHyHtOk8cPsuOcGFBuDEZlg+S
	/+/H+n+Si7vH/tDbhNKWWdCrFbT1o8OmXmGMSNlDztOETvCA8o8/w6/Oa7MRtWbQ1MCFmZ4CIIO
	/khQ2VpVWF0Bii+PuX7CK92PTENsAJLWympqwpC6UgFQKZnWOECOTLhVP6Ee9mBH2KADodUm4Wk
	O5fYmPpbj0PC8tI/7p+G8Q7LxOw+pRLH+/3iHRK1TclL5czRddI1kq+Rq2i7TZTV4OKse4MkZB7
	EXwbOvOcUA1rLazLYiopBlOPyIlrd2ejChzodAjPojtrI2Tt/n8EKM/mW9jSiaW1ORacVN72N5D
	xkQPpuol+uxTtMX/s4kiLQ/VKzw==
X-Google-Smtp-Source: AGHT+IE1M/1765Yw0DM9+sKSZqF04QztVs/dVj/lsNzSSoRC0dhJ9gntacDaXmIdc0UtyGw2H3M2AA==
X-Received: by 2002:a05:6a00:a8a:b0:774:52b9:b17e with SMTP id d2e1a72fcca58-776121a116amr6003596b3a.30.1757759504326;
        Sat, 13 Sep 2025 03:31:44 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7760944a9a9sm7622198b3a.78.2025.09.13.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 03:31:43 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 4A1184206928; Sat, 13 Sep 2025 17:31:40 +0700 (WIB)
Date: Sat, 13 Sep 2025 17:31:39 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Simon Horman <horms@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Avery Pennarun <apenwarr@worldvisions.ca>
Subject: Re: [PATCH RESEND net-next] Documentation: ARCnet: Update obsolete
 contact info
Message-ID: <aMVIC1w5-Lm5KBXX@archie.me>
References: <20250912042252.19901-1-bagasdotme@gmail.com>
 <20250913085926.GI224143@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hOK/4Qme/73oVSs"
Content-Disposition: inline
In-Reply-To: <20250913085926.GI224143@horms.kernel.org>


--4hOK/4Qme/73oVSs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 09:59:26AM +0100, Simon Horman wrote:
> + Avery
>=20
> On Fri, Sep 12, 2025 at 11:22:52AM +0700, Bagas Sanjaya wrote:
> > ARCnet docs states that inquiries on the subsystem should be emailed to
> > Avery Pennarun <apenwarr@worldvisions.ca>, for whom has been in CREDITS
> > since the beginning of kernel git history and the subsystem is now
> > maintained by Michael Grzeschik since c38f6ac74c9980 ("MAINTAINERS: add
> > arcnet and take maintainership"). In addition, there used to be a
> > dedicated ARCnet mailing list but its archive at epistolary.org has been
> > shut down. ARCnet discussion nowadays take place in netdev list.
> >=20
> > Update contact information.
> >=20
> > Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
>=20
> I think it would be good to get buy-in from Avery (now CCed) on these cha=
nges.

OK.

> >  Because so many people (myself included) seem to have obtained ARCnet =
cards
> >  without manuals, this file contains a quick introduction to ARCnet har=
dware,
> > -some cabling tips, and a listing of all jumper settings I can find. Pl=
ease
> > -e-mail apenwarr@worldvisions.ca with any settings for your particular =
card,
> > -or any other information you have!
> > +some cabling tips, and a listing of all jumper settings I can find. If=
 you
> > +have any settings for your particular card, and/or any other informati=
on you
> > +have, do not hesistate to :ref:`email to netdev <arcnet-netdev>`.
>=20
> nit: hesitate

Thanks for the suggestion!

--=20
An old man doll... just what I always wanted! - Clara

--4hOK/4Qme/73oVSs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMVIBgAKCRD2uYlJVVFO
o6VhAP9ZHl+3iy4x+Rd15oqUntPdAeEv9b3hRwXxVnaB8WxFSAD/WmtZ92mVhxV/
pPCAWlZCduMo6eJb8etByHzxQAp7GgU=
=rMpI
-----END PGP SIGNATURE-----

--4hOK/4Qme/73oVSs--
