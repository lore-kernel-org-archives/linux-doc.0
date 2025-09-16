Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9395F2F618F
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 10:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758017194; cv=none; b=X6cnWJlB6fwNQl5EskRBjEVUyXPxtqiOL6tTBSKYvvHn4ULIaNnjRY3PeOVSO3xHuBZo5mzmBKVdVEIHVIkQj0+WCZrsk9zLMqvINXMUxiXdz8H8tQP3EwO6/hP8tTYal3ZTNsjaizzAKl/+YPtMwsb7RtB4fVBT3acCdscyueE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758017194; c=relaxed/simple;
	bh=G4K5UJmVzmGU0trA0faHWCoNw1ZO47dPJ1TCITM8KAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsRrhjyjIrA0YxmNNXsQRoJnpvC3hySSSFZYX87yrFvr9J83TLtKMzF++N0kTout14AWCoTgHq+o901/OxnxqaBujjIvy1EgkxKVi2srrFrInIbGgISO30u9u6CijfEjtMs0pi7YeS4MpJq0d7mO4T1QEiG5LQDHuTcJe9j5zqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mm3UcmcM; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mm3UcmcM"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4f7053cc38so3462690a12.2
        for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 03:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758017192; x=1758621992; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4K5UJmVzmGU0trA0faHWCoNw1ZO47dPJ1TCITM8KAk=;
        b=Mm3UcmcMMbw/QPI6r2vHfhdW5d+Gi65yCKKe6s6Ag2RTaR7oq8XPSjB3my7Nu69h6Y
         QNxoGhv3IMBWw8kAzEo8Zvoqf/wMYPFUnxbRvErre3yZQ/tUD+SIfpLqL3Jt/uUqKpky
         TLdIeLn0zNwYR7OUNWzicuEg6o/1Z7435OL3/K4ltfBoT/S3WzVFvmpXu8ttxcxR25tE
         4UjOnvjj6uEi24MAtL4/J5B9N11s5DxZJV0/XlDFEimCoXVAzi5UdTkPKO+e0rrNgK+b
         pV/bhSLMgl4i5lsm2rgHOy6zQvjTIOIB3LFcz3oCX2IGQmWuJaPQach4kc6myOguI1/H
         5npA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758017192; x=1758621992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4K5UJmVzmGU0trA0faHWCoNw1ZO47dPJ1TCITM8KAk=;
        b=XfNslN/O1v+YFmHCZk2j2mh7E2wUQn5N1cTnBhrdCDvUIKam3taSMDP+yqYriZY6lT
         I+nQSTCZP9VfYz2+hQwMQpeP3M39t955ieLOxuz55o2EZLBLRNClNZXrSKCOhNs7a2e/
         fKTodd0KBIYFn4xYr/lo7ekHv5AW9fOss5dM4CWSI2ywIehQ8bQp7wC74hYdysU24JZ2
         QLmKSS3h3oFJOZzMdhGMDtIOc+lSOg29o35PJ14mKJaukD4wsGAonZo39xiyRNSZrotN
         XUN33P5wAgoO4mmMtIigcEV+gmuIf5dWMG6wMnfGcF+4mUHhI9bUy6ST0Le00XPzKpY7
         0CTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkyEd1E+QEKxFysdRQLzGoPfqA1FZBGiFC+jU86Re8Rh5GhX3Fn/R/IIUruyrapkMwKH8nxAoNjXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvehEd87J9TEpHCtjbvq7cBCDEFR9tw/9FTDaZ9kC4LgmA/mR7
	UHyw7lTaUNTGfeL4u9JBNEcAVFYKYlFfRCdEhzK3iZHb63CPjwoxAJWy
X-Gm-Gg: ASbGncvKaiFKpq1wqWWPagtLAQlBbg9q19XcScJCwcZymkPlTzv/OlV22VYadnEhseH
	/aElhZkG7T2vlU8M8bZOY6yXogze4fxOWucD79e+I4Bh17MnAhNXNrBvEt8uq/Y5hwFywcj++z6
	13h5Vc+IOl6OpLBKzC9tHmD5BehL+/4oFLXYQDdQwdvatRYcByHNqr5NcYygdUKqI7Rxfwt3jJr
	AzS3WDDBHc4BJzY7sV5r2wg5e/aX+4FUyyasMlQMU/AWMIx21WQapG9fB7twGBmOMeYH62MoOJE
	VdCUrFuR1yH1Eve+mBrBD0J+VF5Rc2px854Ih+sHDpMEZPYjmlDlrWl1qzx/dY383TxXvVlJTXV
	wsGM2/5whFtussihB2YSSmYqwecYgJnfhJ10E
X-Google-Smtp-Source: AGHT+IFu56DW5QsTTu7FqSRf+eX6vttphxkswrnXkXlqHZwWQd1X43O+42AXEDd8McQoAwl1ZIfxxQ==
X-Received: by 2002:a17:903:384c:b0:242:9bc4:f1ca with SMTP id d9443c01a7336-25d271317cfmr195632915ad.57.1758017191557;
        Tue, 16 Sep 2025 03:06:31 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2613fe8f9absm93210335ad.131.2025.09.16.03.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 03:06:28 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D212B420A809; Tue, 16 Sep 2025 17:06:25 +0700 (WIB)
Date: Tue, 16 Sep 2025 17:06:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux cgroups <cgroups@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Andrea Righi <arighi@nvidia.com>,
	Johannes Bechberger <me@mostlynerdless.de>,
	Changwoo Min <changwoo@igalia.com>,
	Shashank Balaji <shashank.mahadasyam@sony.com>,
	Ingo Molnar <mingo@kernel.org>, Jake Rice <jake@jakerice.dev>,
	Cengiz Can <cengiz@kernel.wtf>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 2/4] Documentation: cgroup-v2: Add section numbers
Message-ID: <aMk2oZx1zrO1XoWs@archie.me>
References: <20250915081942.25077-1-bagasdotme@gmail.com>
 <20250915081942.25077-3-bagasdotme@gmail.com>
 <duppgeomaflt6fbymdk5443glmw7d3bgli2yu7gx6awb7q2dhn@syjq5mmia6pb>
 <aMgJPWETGVt_AE9i@archie.me>
 <pmsodjam5jjih3v3fogokfyshn44izvouhihkijvfxazmmbqoo@hi7b3klfk7nv>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="72On6oC1EHsYwW2+"
Content-Disposition: inline
In-Reply-To: <pmsodjam5jjih3v3fogokfyshn44izvouhihkijvfxazmmbqoo@hi7b3klfk7nv>


--72On6oC1EHsYwW2+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 16, 2025 at 11:36:25AM +0200, Michal Koutn=C3=BD wrote:
> On Mon, Sep 15, 2025 at 07:40:29PM +0700, Bagas Sanjaya <bagasdotme@gmail=
=2Ecom> wrote:
> > > Erm, so in addition to keeping manual ToC in sync, we'd also need to
> > > maintain the section numbers manually?
> >=20
> > Right.
>=20
> I mean -- that's not right. Either generate all automatically (original
> approach) or simplify maintenance of the manual ToC (as liked by Tejun)
> by stripping (meaningless?) manual numbers.

Do you mean either I have to use .. contents:: and remove the manual ToC
(as in v1) or sync the manual ToC without section numbers?

Confused...

--=20
An old man doll... just what I always wanted! - Clara

--72On6oC1EHsYwW2+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaMk2nAAKCRD2uYlJVVFO
o11bAQDrtBYosJLsFIKmSSr8jhMAUh/P7ECdLm2/LY/49qeNHgEA/T1tlX3dC6oN
EOQkBAoHcliESjhLAgZ7r+held5mxAg=
=mlk1
-----END PGP SIGNATURE-----

--72On6oC1EHsYwW2+--
