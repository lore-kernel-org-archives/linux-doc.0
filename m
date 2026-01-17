Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333AE3054D8;
	Sat, 17 Jan 2026 10:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768645771; cv=none; b=YMLu5Th58vkMo0Uv1zKSNRgD4ejYMnGD6SXT2lVu2t6qPbXm129HfyCXfK15wqAyR1KpzaqS8OXg2rgGHLyWvnGVZNUK2nvW4SdbMM5TrixT5Svs2WMlJb1qHahr8eaHKDbly5BvPcw+0GHK6ytNlOytJvG3byMID+FioPNcZk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768645771; c=relaxed/simple;
	bh=+b8ufOO5aVvPABDbAWUkmJDfLarZudasofIm8GQqSSI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZHAev2sRosIXJX/Q8TPq4H8s/JLlUMpSSOLlz1xwWQ+XvddUlSVoUqeOH5c4JcnkWQ2nhtDdzkAtMbQLOYMFDPZmfp62IOlZTsm0qOXvFLgb0AfvEf0xkqH26k5Ooj6eAmsVqnBtrfBFSU2FfJwNhhD6UPPGGcoDa9z/hNerz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2yzqZon; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2yzqZon"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C484FC4CEF7;
	Sat, 17 Jan 2026 10:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768645770;
	bh=+b8ufOO5aVvPABDbAWUkmJDfLarZudasofIm8GQqSSI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A2yzqZonQ/2JOSNv7S8HQKX319QpLzCKgAhpPPX0fRVnt7vGwWH6L/WIpOe7LRxTX
	 AcqsSILSEuW7+taYpxq2Gd81eORQn/kFqdzUQI4AED2GX6N25A24do0IeqlbOgPlAB
	 Z7lcSwU5whSz+dokB6btimuBhi/eoOQdl/3OsdQ4lf0G4Zehouy2PDif1rzKPhg76P
	 NdW+6Rsyu7iyiY6PuZEkTPe1kpcQnvFWSlyv0knogXBsrlQ4ozMEPHlskEX3A93Zxo
	 +9hqf+Ottnbzw1H8vlz2qf1KNIGhLmsKec0k0/z9WQh14+VAMHXE4kGmEzkCZvKsUK
	 kF7FGwu1W841Q==
Date: Sat, 17 Jan 2026 11:29:25 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>, Shuah Khan
 <shuah@kernel.org>
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
Message-ID: <20260117112925.309a7a31@foz.lan>
In-Reply-To: <871pjppi57.fsf@trenco.lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
	<87zf6gt2ts.fsf@trenco.lwn.net>
	<20260114212558.1aeb1b17@foz.lan>
	<3237bd2e1397910708743dba2c7d80b2c8eecb0b@intel.com>
	<87ecnquda3.fsf@trenco.lwn.net>
	<8af04281-6cde-4903-8b30-3eea213d8ff9@infradead.org>
	<87wm1isqf8.fsf@trenco.lwn.net>
	<8a885d30b9915e80a86e4096a0b4a1fb13616a95@intel.com>
	<871pjppi57.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 16 Jan 2026 10:44:04 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Jani Nikula <jani.nikula@linux.intel.com> writes:
>=20
> > On Thu, 15 Jan 2026, Jonathan Corbet <corbet@lwn.net> wrote: =20
> >> Randy Dunlap <rdunlap@infradead.org> writes:
> >> =20
> >>> On 1/15/26 7:05 AM, Jonathan Corbet wrote: =20
> >>>> Jani Nikula <jani.nikula@linux.intel.com> writes:
> >>>>  =20
> >>>>> I think the tool source should be called kernel_doc.py or something=
, and
> >>>>> scripts/kernel-doc should be a script running the former. =20
> >>>>=20
> >>>> I honestly don't get it - why add an extra indirection step here? =20
> >>>
> >>> a. compatibility with people in the wild running scripts/kernel-doc =
=20
> >>
> >> That is easily achieved with a symbolic link if we need it.
> >> =20
> >>> b. adhere to well-known naming conventions. =20
> >>
> >> The normal convention is to not have language-specific extensions on
> >> commands.  As in "scripts/kernel-doc".  I still don't understand how
> >> making a wrapper script somehow makes this better. =20
> >
> > kernel-doc the python source directly messing with sys.path is not
> > great. The python source should be able to assume the environment has
> > been set up, imports work, etc. =20
>=20
> I agree that's not great.

Avoiding it is not easy:

- Since the beginning, conf.py has a sys.path() to add sphinx dir,
  as otherwise Sphinx won't find the in-kernel extensions.

  This can probably be fixed by prepending "sphinx." to all in-kernel
  extensions, but, if we're willing to do so, I would first rename

	sphinx/ -> kern_sphinx  (or something similar

- For autodoc to work, we either need sys.path() addition or we would
  need to place conf.py at the top level directory. Doable, conf.py
  is not that important to be at the root directory.

> We could of course fix that up in the
> makefile; the sys.path manipulation is only for standalone runs.

I don't think Makefile is the right place to override Python
limitations. The real culprit here is that Python doesn't have
anything similar to:

	#include "../tools/python/lib/foo.py"

If you want to include it, you need to do, instead:

	sys.path.append(os.path.abspath(".."))

	import tools.python.lib.foo

or a variant of that, like:

	sys.path.append(os.path.abspath("../tools/python"))

	import lib.foo

> So I guess my feeling is that if somebody really wants to implement that
> extra level of indirection, we can consider it.  I won't dig in my heels
> *too* deeply.  But it's a separate change from moving the tool, so
> should be done on its own.

I don=E2=80=99t think we need such indirection, nor do we need to avoid usi=
ng=20
sys.path() to overcome Python's parent import limitation. IMO, a
pragmatic rather than a purist approach is more suitable for our needs.

Thanks,
Mauro
