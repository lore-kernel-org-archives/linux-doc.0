Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B069F218AA0
	for <linux-doc@vger.kernel.org>; Sat, 18 Oct 2025 05:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760766548; cv=none; b=jKZ8omsUa2v5WE7Z5Bxz/2giSphAGDef561kAzEOPk0L/0A+oJeY0y/U3VBJ3ae2lvPTLo2Nxky4Irhmr5FEB+ET2hcZJFL6oqh23CsQ7luzU/yaBwIPRWZ+jUbGyWRtH7xAhmJynoPaApPXKD6XZGUVjrOaOlqjgK8S8E779Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760766548; c=relaxed/simple;
	bh=1Vv6tHhTnCUCOqqa0sQAoxcLS2MLC5PRxzjfcelt2PM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fqf1T+eRfawn7+5R19X8IRXyy7yut+8/VgEQ42OIdqyy/lDZ2kwPmGl0RWu9IAJSqPpWl8tywNuaa4dN4SDyECC6lhclvhVmjIFq3KLoD+hWyXtcfBTIh1GK8o+DR6/rX+7jzI/gB5wWVVMcSwDIDVGyBp9pJBFckxEvXnXRvt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmaLjMen; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmaLjMen"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b5526b7c54eso1738280a12.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 22:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760766546; x=1761371346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vv6tHhTnCUCOqqa0sQAoxcLS2MLC5PRxzjfcelt2PM=;
        b=VmaLjMenvYjtMGE+sxS5Hf7p7iAAvSGw7cJzqDVL/p2IPJeZKtvUzF0KcoChzVwo6R
         z5BLBWO4ZbUqmguiAGHe2qfyvrmgftjApF3+ecl2YpYcdA9sIOfgjLZwYOlwkaMAq2aI
         0rQdYzGtD9vSwinVOCE9Iu/gd8lOnzPq+VtqD3Nvk32lPP99GSJbhUtHJGHXqk7OrnzR
         xrsmRg3scZByh/oy8W+VTtoHX5kDfuO3TA/WmuFbe4aDxenR8VMsqPqYMNFvAOVjtZJY
         ec664tUkf1l7pfMM0FClgLxEW9AMdamjGiV70ACBtpW1TI9QsfZeWf27CcxDi2kJXjx9
         rU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760766546; x=1761371346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Vv6tHhTnCUCOqqa0sQAoxcLS2MLC5PRxzjfcelt2PM=;
        b=GklBm7pXyT37MdaDP5ZEttPFfGpDuucvr431qQ0CIJSQAcT/h8ozanm2HCYdYNNmYJ
         S6EmCT78TmAxcISTi3wzHZMb70EAckNyTt33c3E/XiUUuO9kDJ0rso7mUh9JTmtDYtAx
         i3FtfHhNCViWhDU7CnwfP58DmCix7xD0smh9JiGhfo+bRswA5q8XDw+++lwL6xpcOONY
         JQ1yFsz2/pGMsVC0hoWxGubMp+OxBjS4LbKAghAxsStsggmVvEkHptxbSPSdMRHZpLSF
         c+nOG2TeCQNaVeYfuQoIyXRPalAzqN2ZtK9HDBnn7/mOlFYV5uq/NuqGtdvm7gfYTf2T
         LOOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtjqL+3jGP3N898j3gAQ6xPVFT9/fvC/C7zOOJWEkpDt9ZtzOUqH6CWuSTlZyXljXhcv5NR/y8t5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrD6lDEwlo3bbUgLHOrV4pCAgn2rXNOu6XN7WxqbFPmuwhPA6a
	fCbqhYIJtbr2Kp50jHqX98biQfcplaWkfbsa0AQXjlLG8tPeQlytG8rP
X-Gm-Gg: ASbGnct/kEK4K5P7Uy481+EeDYHvKoIaXVle9Z49CmUxYmD55v87rlfbt8J7pm6F0Zd
	92BXqRQlFVjbdK1ECmztht6YSwi7hfddykivPJLdgu4XjWHAIImrI9hTknrH4CkmTazF2KYqG8b
	xcCRqMyKqHJi2WokbYYMi9HhyOsU0hKqT1HseioIP2PkGKR+neJREiLgiyGGTSMKwajgtPcwyYD
	ixYsAGNfd0GHvBoB4WyPYDJMmn/uJRCmeio9ubD/uh2JMCUI7hbXpaE0mRuPgUkOg57eARWDxlv
	gMPkbQa5oGtBRA1EkActNbDCQ4YLxgAH9PghvMqwo2r1R9rbIZAVl+xxIJjfSyma5EV1JarOCoY
	6unw4V85WUylLxp+Hqom0lxNeEZ9/cBR1GmBkTY57ZRFOyKfj9QDA+vJCmMEzlEkpRaExu4kiqv
	QuM78=
X-Google-Smtp-Source: AGHT+IEiDLeHEpWWG0W0/Txk7ybCtD0aFk0wRSHlk2Qyr7r4KJqzeEy+3Um8q3Il5qclHZ1JNtVeYQ==
X-Received: by 2002:a17:903:3bce:b0:269:aba0:f0a7 with SMTP id d9443c01a7336-290c9c8977amr74813915ad.2.1760766545842;
        Fri, 17 Oct 2025 22:49:05 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fd8fbcsm14454955ad.41.2025.10.17.22.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 22:49:04 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0C5AA40995BC; Sat, 18 Oct 2025 12:49:01 +0700 (WIB)
Date: Sat, 18 Oct 2025 12:49:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>,
	Crystal Wood <crwood@redhat.com>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>
Subject: Re: [PATCH] Documentation/rtla: rename common_xxx.rst files to
 common_xxx.txt
Message-ID: <aPMqTSbPucoqNhA1@archie.me>
References: <20251013092719.30780-2-bagasdotme@gmail.com>
 <87zf9pz33e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AA1YS2D2c75ozhj7"
Content-Disposition: inline
In-Reply-To: <87zf9pz33e.fsf@trenco.lwn.net>


--AA1YS2D2c75ozhj7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 02:27:01PM -0600, Jonathan Corbet wrote:
> Bagas Sanjaya <bagasdotme@gmail.com> writes:
>=20
> > From: Gopi Krishna Menon <krishnagopi487@gmail.com>
> >
> > Sphinx reports htmldocs errors:
> >
> > Documentation/tools/rtla/common_options.rst:58: ERROR: Undefined substi=
tution referenced: "threshold".
> > Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substi=
tution referenced: "tool".
> > Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substi=
tution referenced: "thresharg".
> > Documentation/tools/rtla/common_options.rst:88: ERROR: Undefined substi=
tution referenced: "tracer".
> > Documentation/tools/rtla/common_options.rst:92: ERROR: Undefined substi=
tution referenced: "tracer".
> > Documentation/tools/rtla/common_options.rst:98: ERROR: Undefined substi=
tution referenced: "actionsperf".
> > Documentation/tools/rtla/common_options.rst:113: ERROR: Undefined subst=
itution referenced: "tool".
> >
> > common_*.rst files are snippets that are intended to be included by rtla
> > docs (rtla*.rst). common_options.rst in particular contains
> > substitutions which depend on other common_* includes, so building it
> > independently as reST source results in above errors.
> >
> > Rename all common_*.rst files to common_*.txt to prevent Sphinx from
> > building these snippets as standalone reST source and update all include
> > references accordingly.
>=20
> Applied, thanks.

Shouldn't this more appropriate as a fix for current cycle (6.18)? I see
the warnings on Linus's tree, though.

--=20
An old man doll... just what I always wanted! - Clara

--AA1YS2D2c75ozhj7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaPMqSQAKCRD2uYlJVVFO
o4puAP9fICYO7e25rwE88sCE9s3B9E8bGfkqdqV8T+iWzpplOgEAxE7vJYfQ8DHo
G3ggxu0+rFveZJhSJqd1VejNrPNTQAo=
=rk8l
-----END PGP SIGNATURE-----

--AA1YS2D2c75ozhj7--
