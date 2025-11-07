Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526E1D5CC7
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 05:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762492481; cv=none; b=Vy8Xymkvk9eqxHXJwIS315dCR+yR+2DRJCulsnFuxpCmLqBZwzbERenHjgDUMwF12SNWGTNx3ft0y98slVEMjld3lx03TOvGM5cqmoMaLXbQkjih/SGBTrlRffv6E2uH61ImsUiVW910DglbJ6lwEr4hlMu8JQlRsmOO/HmTD8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762492481; c=relaxed/simple;
	bh=wFgazZHwRKDC0b+E3ALvNq+/41+FCsmrjBSYyzfDEw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFRCI+gWC2Ss9cbY8WOHcFi+2w5hBLEaKGzpgU3tghgnLdYOEdkbSnsMXQL89GWgCAeGtzwtZBWoI5vOzeAOy1nFHuag7kNTStwvEfDvBnb2I8ck0AXsEvlztR57TVobzORzTr0qsKDkI96LMkxpJT7VLA03G2LAWT1U1VfhKVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnSfq41C; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnSfq41C"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso256283a12.0
        for <linux-doc@vger.kernel.org>; Thu, 06 Nov 2025 21:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762492479; x=1763097279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EXckxvr0vYaJfRakg7xejcSzoqy5VEAgGRFPyHXgVxQ=;
        b=HnSfq41CLTahIk5kp8BDreZbdURDM6OuuCDsv2Cf1TUYDdJmV/m2J1JJE9uA+4l04e
         GBG8/WEOAghLkfwXjpaSFOEeJW6ti4UdUcGKurb0PnO6AcD+8a7pYjwDEYGVD0G6VLoJ
         MmFaujU8Y300trDYhvjF7/wLFq8CsmTtRtjqYPUm682oZyJkSefyTk4ZhOAsE/JF7qeq
         +MaoAOSSnHi/dI5a05I0TFYagoVasxO1fZ/+u6i0nTLdAZ1zSY70K8xcnZPW+oFmjNl+
         cnw/ieaji2AUPkKChIzxnHYbphoOmlZkH6TJgSDX6AnRUDi1fjBuBgEy6WGDfk+oWAZV
         AbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762492479; x=1763097279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXckxvr0vYaJfRakg7xejcSzoqy5VEAgGRFPyHXgVxQ=;
        b=Vmf9c1zXCRPH57ozzxvFjk5s2NBhzc1dh2uf2tSvIIbfi++qBpTpazKumEjpqyujS2
         7AEphcCw3BCv4CQwTWYEmXJG7J293PEpaSe81vXNC8BmHRrcuqX05s0DK+eGhKbSVrnG
         qf7kqEIOx59wOdZ0Z7jCD9NEgAC8SXgN8UXqWWc5lvfZsxqq25l1kKtZLsVivsXGwljp
         zYr+ytJr034LPma2loQ9dURoY0fe8mJtow7/qno9rCzzELzwHMnaPy92dnAL/FcMqHKE
         +MHCico1ZZqxwXNHvgfpZdsH0AnHtYMBx34NAgjN8rIq4WUrIM/Amy0JqYiYrQ6V/Rnw
         ZYnw==
X-Forwarded-Encrypted: i=1; AJvYcCX8uo7PWkFKoxp3sXuTyYimwlj1nn3St9GcFHwXkxy+pkdJ4qYnAjcUFOM4aNPyvXmOMBmVrpT3+Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4tBKXmw/xnLUrsTuxJyY3bqZzla4x5U6FBbuVBJB+SlNPq1XN
	NEeWcY+fJfWk8PRiSq/T/8CQ8/dmGu/LY+zGk5AEPfcyCFaTGIVidJc0
X-Gm-Gg: ASbGncssoBMN62mZeOtY9WU2ETJKhtnwgGwupMqWI22GhlArN7TyWOeUUChBG32vESp
	bp0oOvWbo6fvJ/s0lPHC4y8dbFcS+d/CMQujhkue6aBdsZQZcAggzjNLpRTb625UeZC1vgKuNPY
	HoVVhgOs9OYFD8M4bwZe+7qKeoBfq345tIei3UdtGAEVsTntlvrfWmVV3/NstzZYCTD2WciHMfh
	T0xR9soEbQ1DJ1JGJ89R+WMK/MzT6cajjp6ZUR2a/2GmlmizDVgi5Kt0F2KHxrM6EPlJbVzLk7p
	1LSmFy7HYCtw1Co+FE++MqUTvtfT/hSE+u8NVy3Vq3qHsBRSwdsqFbLMTCzbKvvhSMEaIXdaxh4
	D1QWZ5XDzmoEE06FhqnHaf34I0cuy+vozLTrLtIbCIoxsVAm/lg3GzKIaYl1yhlIY+brK+zR8xJ
	jP5ygymxijJ/U=
X-Google-Smtp-Source: AGHT+IH+frnSJQgDrVAXIYJKyu7mYXKAiPFwbWjawyyleHXAbYs2NV3FQSsq73qfRHjXOM8oDAMAIQ==
X-Received: by 2002:a17:902:c943:b0:290:91d2:9304 with SMTP id d9443c01a7336-297c03a5e59mr26729835ad.4.1762492479156;
        Thu, 06 Nov 2025 21:14:39 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2964f2a9716sm47872335ad.0.2025.11.06.21.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 21:14:37 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1354842EFE93; Fri, 07 Nov 2025 12:14:29 +0700 (WIB)
Date: Fri, 7 Nov 2025 12:14:29 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux IOMMU <iommu@lists.linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>
Subject: Re: [PATCH 2/2] iommupt: Describe @bitnr parameter
Message-ID: <aQ2ANX6V3F1qfKdE@archie.me>
References: <20251106073845.36445-1-bagasdotme@gmail.com>
 <20251106073845.36445-3-bagasdotme@gmail.com>
 <9dba0eb7-6f32-41b7-b70b-12379364585f@infradead.org>
 <20251107003541.GA1792527@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x3hfNvsCBYLDwZJH"
Content-Disposition: inline
In-Reply-To: <20251107003541.GA1792527@ziepe.ca>


--x3hfNvsCBYLDwZJH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 06, 2025 at 08:35:41PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 06, 2025 at 03:48:10PM -0800, Randy Dunlap wrote:
> > > diff --git a/drivers/iommu/generic_pt/pt_common.h b/drivers/iommu/gen=
eric_pt/pt_common.h
> > > index b5628f47e0db40..54c16355be2842 100644
> > > --- a/drivers/iommu/generic_pt/pt_common.h
> > > +++ b/drivers/iommu/generic_pt/pt_common.h
> > > @@ -354,6 +354,7 @@ static inline unsigned int pt_max_sw_bit(struct p=
t_common *common);
> > >  /**
> > >   * pt_test_sw_bit_acquire() - Read a software bit in an item
> > >   * @pts: Entry to set
> > > + * @bitnr: Bit to set
> >=20
> > Shouldn't both of these (above) to "to read" instead of "to set"?
>=20
> Yes, that's right, Bagas could you fold that into a v2?

OK, thanks!

--=20
An old man doll... just what I always wanted! - Clara

--x3hfNvsCBYLDwZJH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaQ2AMAAKCRD2uYlJVVFO
o07hAQCrjQK1FVbRPucfTlsUP3cQYw/+poMRTLSUUh6cilN7yAEArVh7GTezT4vr
RzS5LgwIZmkWSYMZpirFqHJfOD+03gA=
=3Jmb
-----END PGP SIGNATURE-----

--x3hfNvsCBYLDwZJH--
