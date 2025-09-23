Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F65621348
	for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 23:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758668623; cv=none; b=dpZ4R7dI/qFfoWfCr6HrRtXDt+a6zVGO9tLC3LU1slCPOVWW/6nr1yZcf21wnwpAJKaFhk6gPpox7Bq/bzqLCuh3lbO+qW056xLsed+oR4/rIOH4NZWGHFMWV0JYoxo2j770+GmBoyLzuu7UT+6MOB6SmH+NwLG7STxxmk93Xco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758668623; c=relaxed/simple;
	bh=MHMaUS9naR0vIV9JTYsRgzOChzGdvox3pKFEbqzWur8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLUWhacHbLRQiSsO6ccIRhERJ5y08ql6p1uBmoT/hlBwCQA8Xjz9ow+Odu6Rsy7JJ6awBNivUYhoAjXwW0B1mSlhzYIWgY3dKQnkDYJD5K9Mkz3SSOM5CYz2Zh5hYtcCNMuOeiAdnoQeC45qAi8JFvJlBTiQZFPw/NuB0Eff1xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbcKmYAX; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbcKmYAX"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b5506b28c98so3901003a12.1
        for <linux-doc@vger.kernel.org>; Tue, 23 Sep 2025 16:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758668621; x=1759273421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MHMaUS9naR0vIV9JTYsRgzOChzGdvox3pKFEbqzWur8=;
        b=MbcKmYAXBLu15h/Rf1JsS4T01Zwm+caHUe0qeeBr3sBHR3+KTViCOqwPpfYzfIRNqB
         enRFr+5SY5W2JuQEpQmk5w3XV/EUDpiRvzBqumGBWVCkkuwEbv+TGkwq5V3G5HwIbJ3d
         8K5NleZraMpVMaN8zACO8UYeM6NMCq74qnQCuxtNoMgvY3RvI+Q7H/ircBktDzx82aEG
         4h/dM+JHAzQ+PsNTQe7sIg2l7ahP3sgBq4PutHadWUFHUAmq0nX5Bcdf60vSPdL2TZsS
         cYA9yURRY7GUK3Jc79E9nJ9VkidyscqdBwBEFhTAhbZom16lai4Y3W+8U0Dw94ugcZzC
         MTNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758668621; x=1759273421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHMaUS9naR0vIV9JTYsRgzOChzGdvox3pKFEbqzWur8=;
        b=VAwzwxxUeJ2yz5kWDdPl+xxURdN46D4I2AOV/OaQd2Hy/YxadQREwMMC0B9J97iTAO
         8DmwQ1AJ0wfJANvVl4wn4etFIYtWbiiwEGMsGG+vbURtGERNy/py4nhpOuJzr6lbNl+5
         ALuAe7xcXuhMh+A8W9RgN+HZPtM/s+wOaAocRtFDeLXzIioDvWeX5OmE4rUoNVEWDQ6f
         7AtUZUC1SB6rLq0StRjFvDk5JE8eOqBvwKvxKqlGSEn8sZoXSNJTfi9eIUz0c+osf29L
         rvXslHPYu21feC1lX5j23VHzj/aPtpr1O46cEfAHbagVt0F2VdvjeBvuC6Hi2/hBnl0Z
         eyQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXpW5N3XLGUHiun5uAKU4oEptTMhv/hsKM7MdhqQIF38vw7SoNePtvvZnUEDbiW97/T/S7ghEBrWY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy42/AhzjZZjz3GWP8AQ1M06Ut2oQYEgDTyPZibnyXpj0DxJVBB
	X8cdqp+ATAaVjm7NRaucVpu/CYD7DdaG7Sn58BcM8/m4jyZiMndqrmzn
X-Gm-Gg: ASbGnctD9nnAs3u4ZeSHhKGJyXx/Xq2dcXndFKrsYhjUbYMUG7+nmmrqB9QDEKV3pqb
	WQAUhT/Mv6PStMtFoqUtk+ByaXBL3hJwV2sjc532n8smU2LzKGotZJrg7WNIn2JZhjiW7Xt7eb1
	zgpvWy4KC2c9pVHLUSq4lY0Nf2E5qLQn2LrvaLh6KO4CtOTWQ0Jg7ytAn1YLJkeJEqiB4HA/5E5
	PGkTOkZyMnTyXZRUGR9kY+qbo11iSliVQ6YI9rYj6AuMnI/z1Cpuu8S398h9d+mOlKTu2aBz3eN
	N09DdAucJ0ao3E4anV5+DG3epI5ASjJTStBQe5QH6fKhSLqQyoa/DHxCXARSWomDWmEKMpyU3N4
	bazs5tB4Xct4Td5ievdtk9zv3Y8xiXJE6
X-Google-Smtp-Source: AGHT+IGB29W3TqgK5gfHdx17rWs6QdlKifvPHsUNAQVltUUYu2zh/Zwdpk0V6cpL4DLVztirvIJtZw==
X-Received: by 2002:a17:903:2352:b0:254:70cb:5b36 with SMTP id d9443c01a7336-27cc0db9ba4mr41304715ad.8.1758668621281;
        Tue, 23 Sep 2025 16:03:41 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-272435b6822sm103636345ad.125.2025.09.23.16.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 16:03:40 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 1DAC6423FA7C; Wed, 24 Sep 2025 06:03:38 +0700 (WIB)
Date: Wed, 24 Sep 2025 06:03:37 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux GFS2 <gfs2@lists.linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	Miklos Szeredi <mszeredi@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	James Morse <james.morse@arm.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v4] Documentation: gfs2: Consolidate GFS2 docs into its
 own subdirectory
Message-ID: <aNMnSapfyfwga0Oz@archie.me>
References: <20250911004416.8663-2-bagasdotme@gmail.com>
 <aNJ9yJ7XT4Pnsl9E@archie.me>
 <CAHc6FU7aGJZZzN8zhtnwDgXX9gVMh_fbi+sUpJ7tg1MWMa8XVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TJFNCLqvXEgyfWhu"
Content-Disposition: inline
In-Reply-To: <CAHc6FU7aGJZZzN8zhtnwDgXX9gVMh_fbi+sUpJ7tg1MWMa8XVA@mail.gmail.com>


--TJFNCLqvXEgyfWhu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 23, 2025 at 01:44:18PM +0200, Andreas Gruenbacher wrote:
> On Tue, Sep 23, 2025 at 1:00=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> > On Thu, Sep 11, 2025 at 07:44:17AM +0700, Bagas Sanjaya wrote:
> > > Documentation for GFS2 is scattered in three docs that are in
> > > Documentation/filesystems/ directory. As these docs are standing out =
as
> > > a group, move them into separate gfs2/ subdirectory.
> >
> > Hi Andreas,
> >
> > It looks like this patch isn't in 6.18 PR [1]. Should I resend it after
> > merge window (and for 6.19 instead)?
>=20
> Ah, I was already wondering what had happened to that patch.
>=20
> Can we just put this into the next (6.20?) merge window?

OK, I will resend after 6.18-rc1 is out.

--=20
An old man doll... just what I always wanted! - Clara

--TJFNCLqvXEgyfWhu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaNMnRQAKCRD2uYlJVVFO
o0qlAP45w7y0ijoPca+WRWWR7uDsyafheW+piv5hf202bJQxhQEAnpSuvMubtyMj
GGi6LPIrwatrZPCjfKwexwl+kv/kRQQ=
=XR2A
-----END PGP SIGNATURE-----

--TJFNCLqvXEgyfWhu--
