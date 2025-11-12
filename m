Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3870C2FFDDF
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762940116; cv=none; b=FUjKYqosHjdCqm8BNZ3p1owEAOPppaHm9RRAW5sOkV5Puq4zJHLxsXSE0rqV5HclUmRWlM30kqQvH1q9UeiSlxlC/j4ymc+mOftlMZ/PKr9sPjszUncyuODE0xAbiYKbknKoyBXtS3h+QZnSN5oaXlkBpllXrHyYUIaSLn0Bq2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762940116; c=relaxed/simple;
	bh=a4NtzwDLn4cQUU8IjLcKkAbXObH0QXDuhqrsi3DL8Qk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pi7gNJeWMRw0QFvyD9BIwKRLeoCz7QWtiW5cFl0KlqZf+ExnArXHKh6zDo0Ol9TTrB06KB08UW8eGSwzBzVSMHKnU+YLiTHv8DZq5GD7hB0JDCFdrejj80Uwh5mw2UpCqSuFqErfOg7wmcg/LSausR3FpYJegvmcUhEV1clFKrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3PpINNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3PpINNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF213C2BC86;
	Wed, 12 Nov 2025 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762940115;
	bh=a4NtzwDLn4cQUU8IjLcKkAbXObH0QXDuhqrsi3DL8Qk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=b3PpINNNSqEtWjH+dtAbXY7Rf7R7PTif5hM5KRhiFkfqcwR/EWRH/r49L9DMYaW0F
	 JOY37CDN8wAv6sqRl/pnMnHPKrcE2sNGgtPPEbUJVD6rNDwBApR0ocqgPH+YfI5/7c
	 92VEGQmjkZ3icfGpxfIj2cWpRC1VIWfyjKCBztBTzgylfvYvV3XHOiR30/syRitRpY
	 wcbUUsc3uFC7XpINSihSgo2mRFyHrfOMN7kg7ShhZON69qFKsz6R9ErwHg+QzCR4i3
	 u9pXSYDcR17MDCVS7Zm4ZsUuC5PUgBkTUyRiqgIy+U+0UT50HouNWBF7ljsePMp52O
	 hYBhlc1b2o/Lg==
Date: Wed, 12 Nov 2025 10:35:11 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>
Subject: Re: confusing ReST/html
Message-ID: <20251112101942.211ae19e@foz.lan>
In-Reply-To: <0fa53fbb-8505-4107-8f1f-4082123fdde6@infradead.org>
References: <0fa53fbb-8505-4107-8f1f-4082123fdde6@infradead.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Em Tue, 11 Nov 2025 20:59:25 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> I'm comparing Documentation/core-api/index.{rst,html} and
> Documentation/driver-api/index.{rst,html}.
>=20
> Lots (but not all) .rst files end with something like
>=20
> .. only:: subproject and html

This is related to partial documentation builds.

- On PDF, we don't want to have an "Indices" section. With PDF, LaTeX
  will always generate an index, outside the "Indices" section, so it
  ends producing an empty section there.

  That's why the rule has "and html".

- Our building system adds "subproject" when one uses SPHINXDOCS.
  The above logic ensures that a partial build will have its own index.

  If you want, try to add/remove it and see what happens when building=20
  with SPHINXDOCS. Btw, the quickest one to test is peci:

	make SPHINXDOCS=3Dpeci htmldocs

  If everything is working as expected (I haven't test it for years),
  on index.rst that contains it, you'll see an index. Removing it will
  produce an output without any index (but I guess it will still have
  the sidebar).

>=20
>    Indices
>    =3D=3D=3D=3D=3D=3D=3D
>=20
>    * :ref:`genindex`
>=20
> Both of the core-api & driver-api index.rst files do...
> with the difference being that core-api/index.rst has
> one space following ".. only::" while driver-api/index.rst
> has 2 spaces following ".. only::".
>=20
> Does that make a difference?

No, I don't think so.

>=20
> When looking at the end/bottom of core-api/index.html,
> there is *NO* heading "Indices" and *NO* link "Index" as there
> is in driver-api/index.html.
> Why?=20

See above. You'll only see it if you use SPHINXDOCS=3Dcore-api.

> There are other cases like this one:
>=20
> $ cd Documentation; git grep "^\.\. only:: [^ ]"
>=20
> RCU/index.rst:.. only:: subproject and html
> core-api/index.rst:.. only:: subproject and html
> rust/index.rst:.. only:: rustdoc and html
> rust/index.rst:.. only:: not rustdoc and html
> trace/index.rst:.. only:: subproject and html
> virt/index.rst:.. only:: html and subproject
> wmi/devices/index.rst:.. only:: subproject and html

On a side note, I don't like very much this solution, as people can=20
forget about that.

Perhaps it would be possible to do it on a different and more automatic
way, by doing some changes at the way partial builds are handled by
sphinx-build-wrapper.

on some brainstorming I did while writing the script, it came to
me that one possibility would be that the wrapper would create a
temporary structure with symlinks to the documents. E.g. when one
does:

	make SPHINXDOCS=3D"peci foo" O=3D/tmp/build htmldocs

This would create something like:

	$ tree /tmp/build/source
	/tmp/build/source
	=E2=94=9C=E2=94=80=E2=94=80 index.rst
	peci/
	=E2=94=82=C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 index.rst	# Symlink to k=
ernel source file
	=E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 peci.rst	# Symlink to ke=
rnel source file
	=E2=94=94=E2=94=80=E2=94=80 foo/
	 =C2=A0=C2=A0 =E2=94=9C=E2=94=80=E2=94=80 index.rst	# Symlink to kernel so=
urce file
	 =C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80 foo.rst		# Symlink to kernel sou=
rce file

where index.rst would be auto-generated and would contain something like:

	.. SPDX-License-Identifier: GPL-2.0

	.. toctree::
	   :maxdepth: 1

		peci/index
		foo/index

	.. only:: subproject and html

		Indices and tables
		=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

		* :ref:`genindex`

There are some advantages of such approach:

- cross references between multiple SPHINXDIRS will be solved;
- this will speedup such builds, as, right now, the building system
  serializes the build for each directory individually. With such
  approach, it will build everything in parallel;
- this will simplify the logic inside conf.py.

The disadvantages are:
- some extra complexity at the wrapper;
- a new temporary directory will be needed ("/source" on my example)

Comments?

Thanks,
Mauro
