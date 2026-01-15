Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9B6231A41;
	Thu, 15 Jan 2026 01:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768440566; cv=none; b=n7y+iPfjUVAqAlel9OOdQKQ28FvOitN77VpVeXZXbRFnosrlKvJwkw4GIRoWXniKOrFlElRSxQuxxfbJ92M6gCDovGBbBNwgZmvWSA4YCx6Ag6hhtRldiMRAZA6JP6Bugt+N9rnYhKX9YRBYHXGGtlXqeWNai9HSSQOmAL0Fwec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768440566; c=relaxed/simple;
	bh=LeVhYsnjXeFf9ZReWEIavw7w9RifcqsMjq+5Srgecz4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RFJ1bHDXnq/yo5cu+IZnqJp7QQVw/37L7TyJu0MRRoZWY+CeIM9Var5WZf3l662DAVYhaABk2ht5RSi6r1BplDRftGnn7R0s/ldV3lYTsUWIe0h/0hhe3NlpF0TZVhy6yHGvbBx/JAJ/Bltshs3dvDzbNQvx2QVIYUE6bw2iD3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACGSDlsA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACGSDlsA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A9D7C4CEF7;
	Thu, 15 Jan 2026 01:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768440565;
	bh=LeVhYsnjXeFf9ZReWEIavw7w9RifcqsMjq+5Srgecz4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ACGSDlsAWy6ZlYQ0Q53hYw2A9NtGj3wTXgEFs/c9gWX0aCbP5o2SX/SUCyzMA4q2B
	 Zqb/pplllccIn4TfCSSzdwI/6moFPHxif/lUTKsguNoilEwr5VnUlNr1jTH4nUNKHi
	 iI/ewpNWzVtJ/KOzoKvILCJ4nQJYJvxfy7n5fYzj1jnQIjPEdc2lBKjQb+W+IwsR8Y
	 Fkqlk9JRlRijDYQBQyKy3omD5JMW9+ThGwjbaScpDJY71dlMFWieiIe8mEARTPi+jQ
	 ikGBUeOlYg7anBDgnVewztL/hAu8MnQRYnFUcMYg0nYS5ej0LutsB6PM5yr92XjM/F
	 Ir0Ys9dwyptBQ==
Date: Thu, 15 Jan 2026 02:29:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>, Randy
 Dunlap <rdunlap@infradead.org>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 00/13] Add kernel-doc modules to Documentation/tools
Message-ID: <20260115022921.6de58ec8@foz.lan>
In-Reply-To: <87v7h3udlk.fsf@trenco.lwn.net>
References: <cover.1768396023.git.mchehab+huawei@kernel.org>
	<874iooul86.fsf@trenco.lwn.net>
	<20260114212030.28129f38@foz.lan>
	<87v7h3udlk.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 14 Jan 2026 13:46:31 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
>=20
> >> We could certainly rename it to something different.
> >> But I really dislike having language extensions on files meant to be
> >> executed as commands; you shouldn't care what language it's written in
> >> when you run it. =20
> >
> > I don't like it either, but Python is really picky on some things.
> >
> > The problem here is that this is a Python policy violation. To change
> > that, one needs to write a PEP and convince Python maintainers to merge
> > it, together with changes on python "import" directive. =20
>=20
> ...or just ignore it.=20

Indeed this is an option.

> There is a reason that "pip" is called "pip"
> rather than "pip.py" - the Python folks don't keep those extensions on
> commands either.

True, but see what pip has:

	$ more /usr/bin/pip
	#! /usr/bin/python3 -P
	# -*- coding: utf-8 -*-
	import re
	import sys
	from pip._internal.cli.main import main
	if __name__ =3D=3D '__main__':
	    sys.argv[0] =3D re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
	    sys.exit(main())
	/usr/bin/pip (END)

Everything, including main are outside it. Btw, this code is almost
identical to sphinx-build:

	$ more /usr/bin/sphinx-build
	#! /usr/bin/python3 -P
	# -*- coding: utf-8 -*-
	import re
	import sys
	from sphinx.cmd.build import main
	if __name__ =3D=3D '__main__':
	    sys.argv[0] =3D re.sub(r'(-script\.pyw|\.exe)?$', '', sys.argv[0])
	    sys.exit(main())

This would be equivalent of having a tools/docs/kernel-doc like this
(untested):

	#!/usr/bin/env python3
	from .kdoc.main import main
	if __name__ =3D=3D '__main__':
	    sys.exit(main())

where the actual argparse code would be inside tools/docs/kdoc/main.py

> > Alternatively, assuming that some magic words would be enough to
> > convince importlib to load a name without ".py" and with "-", it could =
be
> > easier to convince Sphinx autodoc maintainers to take a patch, as they'=
re=20
> > probably using importlib somewhere to dynamically import a file based=20
> > at the string inside "automodule" directive. On a quick grep,
> > this seems to be the case, and such logic is inside:
> >
> > 	sphinx/ext/autodoc/importer.py =20
>=20
> No doubt we could do that.  But is it really worth the trouble?  There
> is not much in kernel-doc that needs documenting, especially since you
> did the work to move the actual functionality into separate modules.=20

I'm not particularly concerned about kernel-doc here. I'm more
concerned on defining how things like that are expected to be
documented.

Yet, if you add this:

	.. automodule:: docs.kernel_doc
	   :members:
	   :show-inheritance:
	   :undoc-members:

The generated documentation sounds somewhat relevant to me - specially
if placed together with the kernel-doc module API documentation:

	kernel-doc module documentation
	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

	kernel_doc

	Print formatted kernel documentation to stdout

	Read C language source or header FILEs, extract embedded documentation com=
ments,
	and print formatted documentation to standard output.

	The documentation comments are identified by the /** opening comment mark.

	See Documentation/doc-guide/kernel-doc.rst for the documentation comment s=
yntax.

	class docs.kernel_doc.MsgFormatter(fmt=3DNone, datefmt=3DNone, style=3D'%'=
, validate=3DTrue, *, defaults=3DNone)

	    Bases: Formatter

	    Helper class to format warnings in a similar way to kernel-doc.pl.

	    format(record)

	        Format the specified record as text.

	        The record=E2=80=99s attribute dictionary is used as the operand t=
o a=20
		string formatting operation which yields the returned string.=20
		Before formatting the dictionary, a couple of preparatory
		steps are carried out. The message attribute of the record
		is computed using LogRecord.getMessage(). If the formatting
		string uses the time (as determined by a call to usesTime(),
		formatTime() is called to format the event time. If there is=20
		exception information, it is formatted using formatException()
		and appended to the message.

	docs.kernel_doc.main()

	    Main program By default, the return value is:

	        0: success or Python version is not compatible with
		   kernel-doc. If -Werror is not used, it will also
        	   return 0 if there are issues at kernel-doc markups;

	        1: an abnormal condition happened;

	        2: argparse issued an error;

	        3: -Werror is used, and one or more unfiltered parse warnings
	           happened.

> > So, even if we don't actually add kernel-doc docstrings and
> > functions via autodoc, I think it is still worth having a
> > name convention that would allow that. =20
>=20
> Instead, I think you're trying to take a functionality meant to describe
> APIs and use it to document command-line stuff.  I'm happy to live by
> the import rules for stuff that is actually imported; I think it makes
> less sense to let them drive the naming of files that are outside of
> their intended scope.

Yeah, `MsgFormatter` doesn't belong to doc-guide. main return values
does, however. IMO it is important to keep it documented together with
the code.

It should be noticed that autodoc has support for selecting symbols.
So:

	.. automodule:: docs.kernel_doc
	   :members: main

would pick only module description + main

and if we add, instead:

	.. autofunction:: docs.kernel_doc.main

it would just pick docstrings for main, e.g. it would place just
this:

	docs.kernel_doc.main()

	    Main program By default, the return value is:

	        0: success or Python version is not compatible with
		   kernel-doc. If -Werror is not used, it will also
        	   return 0 if there are issues at kernel-doc markups;

	        1: an abnormal condition happened;

	        2: argparse issued an error;

	        3: -Werror is used, and one or more unfiltered parse warnings
	           happened.

---

In summary, all I'm saying is that, if we stick to PEP8 names, we
can opt to import a documentation directly from the script instead
of writing it twice: at the code and on a rst file.

Btw, if you want to test it, you need just one patch to enable
it:

	https://lore.kernel.org/linux-doc/6aa5a5b4a686f07c8f3e6cb04fe4c07ed9c1d071=
.1768396023.git.mchehab+huawei@kernel.org/T/#u

this basically allows using tools/ and scripts/ as the base for
documentation.

You may also want this css patch, as default format with alabaster
is very ugly:

	https://lore.kernel.org/linux-doc/8d66988f05d06d10938e062ed4465bf303c51441=
.1768396023.git.mchehab+huawei@kernel.org/T/#u
=09
with that, you can experiment inserting autodoc stuff using:=09

	.. automodule:: docs.name
	   :modules:

to document all public methods from "docs/name.py" file, or:

	.. autofunction:: docs.name.function

and/or:

	.. autoclass:: docs.name.class

for a single "function" (or "class") inside "docs/name.py".

Again, the limitation is that "name" ends with ".py" and only
have (lower case?) letters, numbers and underscores - e.g. it
shall be something that "import" and "from ... import" supports.


Thanks,
Mauro
