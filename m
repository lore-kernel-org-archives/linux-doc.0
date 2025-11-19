Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A7E30F542;
	Wed, 19 Nov 2025 07:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537413; cv=none; b=l+vYLF3ov77vMVUDfTRm91DAVd2Oa+oelTJDSM6YClbAUjfo3gMtKgYFNwNFjrD430r46TbStK+G4eMeQVboQLqdMDtJBUozHJngz7KyojKRG2b2zRaHQt36rL4h9pme2Abp3Sl7xwh3j/T8qUSv4jWuGg0OlR9JDs8u1/ZHzPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537413; c=relaxed/simple;
	bh=zKX5YvwJQ0NNAeyuQiz6jJP+ZzqflkPSUrWUR2LK0WQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WqUi4krq5BMEffPKZYIRNaZYmRZjgJU3dFv+m7TBTkVXuOgyot7ltddpxV9M67FuwKmGKNQWCQ/ULNsf10FHKU4KgzUftQ4/OxKA6EspQDqb8/Lrx+bssPr/dz/Kp2dRz5oKniU2McZERWsA//ghl3XchgPFZzDbnig8bh/zwq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YeWTbyb9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YeWTbyb9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B64C2BC87;
	Wed, 19 Nov 2025 07:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763537412;
	bh=zKX5YvwJQ0NNAeyuQiz6jJP+ZzqflkPSUrWUR2LK0WQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YeWTbyb9bV0QcWmK2aBDThRrxbX8LdPniO45wCGvGPLbRG/KLafdA4OHEpP+HXiOy
	 rAuTiFMokgvWik5ZdPXQDAO6UJ8maJEVQtM+ftB31R78DGcLS6ODwtWwSRe8qosvqu
	 74Wqhwz1LGbCcQw5WpC1hgU+dSKglpXyUuUvDW0H0aJrZY6WvuadE1ifXwLETehQkJ
	 5CBNONKGWQBlmeH+Fxna/hEa97A0J98PLTZ/kiPsUl1n+yBKZcgtmowZfXaBRUXikA
	 nFB5zejJjDHn4o8ZVjgDrjZzuEOda8usj2iQBNLqQ54dQ8IU/9ssj18T/9wPrgPlhx
	 Z33cFoHWspb3A==
Date: Wed, 19 Nov 2025 08:30:06 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] kernel-doc: add support for handling global
 variables
Message-ID: <20251119083006.27d59475@foz.lan>
In-Reply-To: <81442fc3-d8db-4446-8071-e72febceab69@infradead.org>
References: <cover.1763291890.git.mchehab+huawei@kernel.org>
	<2d3108a03afc4e48de85835667f5875af97b6a38.1763291890.git.mchehab+huawei@kernel.org>
	<3a27a1ff-7277-43d5-b1f2-4b26ef5595ec@infradead.org>
	<20251118100237.46c7082a@foz.lan>
	<81442fc3-d8db-4446-8071-e72febceab69@infradead.org>
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

Em Tue, 18 Nov 2025 21:18:06 -0800
Randy Dunlap <rdunlap@infradead.org> escreveu:

> On 11/18/25 1:02 AM, Mauro Carvalho Chehab wrote:
> > Em Mon, 17 Nov 2025 22:59:24 -0800
> > Randy Dunlap <rdunlap@infradead.org> escreveu:
> >  =20
> >> Hi,
> >>
> >> On 11/16/25 3:23 AM, Mauro Carvalho Chehab wrote: =20
> >>> Specially on kAPI, sometimes it is desirable to be able to
> >>> describe global variables that are part of kAPI.
> >>>
> >>> Documenting vars with Sphinx is simple, as we don't need
> >>> to parse a data struct. All we need is the variable
> >>> declaration and use natice C domain ::c:var: to format it
> >>> for us.
> >>>
> >>> Add support for it.
> >>>
> >>> Link: https://lore.kernel.org/linux-doc/491c3022-cef8-4860-a945-c9c4a=
3b63c09@infradead.org/T/#m947c25d95cb1d96a394410ab1131dc8e9e5013f1
> >>> Suggested-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> >>> ---
> >>>  scripts/lib/kdoc/kdoc_output.py | 45 ++++++++++++++++++++++++++
> >>>  scripts/lib/kdoc/kdoc_parser.py | 56 +++++++++++++++++++++++++++++++=
+-
> >>>  2 files changed, 100 insertions(+), 1 deletion(-)   =20
> >>
> >> Thanks for the update. It's looking much better. =20
> >=20
> > Great!
> >  =20
> >> I have a few comments/questions, all about typedefs. =20
> >  =20
>=20
> Hi Mauro,
>=20
> I just noticed that in my sample init/kdoc-globals-test.c file
> (I have s/global/var/ in it), there is one global var that is missing
> or misparsed:
>=20
> // from net/core/rtnetlink.c:
> /**
>  * var rtnl_mutex - historical global lock for networking control operati=
ons.
>  *
>  * @rtnl_mutex is used to serialize rtnetlink requests
>  * and protect all kernel internal data structures related to networking.
>  *
>  * See Documentation/networking/netdevices.rst for details.
>  * Often known as the rtnl_lock, although rtnl_lock is a kernel function.
>  */
> static DEFINE_MUTEX(rtnl_mutex);

Just like we have it for functions, we'll need special regex when
macros are in use.

I guess we can have a generic one to cover multiple defines, like:

	DEFINE_\w+\((\w+)\)

This should be enough to pick the name of the var. We might try
a more generic approach that would be expecting:

	<some macro>(<name>)

but IMHO this could be harder to maintain in long term.

> This var is completely missing in the html output.

Now, even if we pick it correctly, Sphinx C domain is not enough for
things like this, e.g.:

+        self.data +=3D f"\n\n.. c:var:: {prototype}\n\n"

will fail if prototype is "DEFINE_MUTEX(rtnl_mutex)", as c:var::
will try to parse it without using macros.

See:
	https://www.sphinx-doc.org/en/master/usage/domains/c.html
=09
On such case, we'll likely need to use:

	.. c:macro:: {name}

To generate the cross reference and then output the prototype or
":c:type:", which is what we use on several places where the C domain
parser won't work.

Maybe an alternate would be to use:

	.. c:macro:: name(arg list)

But it may be hard to see that this is a variable and not a macro
declaration.

Hmm... looking at https://www.sphinx-doc.org/en/master/usage/domains/c.html=
#directive-c-alias
it seems that Sphinx 3.2 and above introduced "c:alias:". Maybe it might
be helpful.=20

> In the man output,
> it is rendered like this:

On man output, we don't need cross-references, so, we can change the
logic to output the full prototype before being parsed.

>=20
> NAME
>        static DEFINE_MUTEX - historical global lock for networking contro=
l  op=E2=80=90
>        erations.

Once we get the name properly parsed, this should be easy to fix.

>=20
> SYNOPSIS
>        static DEFINE_MUTEX;

Yeah, it would need some tweaks for the macro case. Synopsis should be
easy to fix: instead of {prototype}, we can use {full_proto}, which is
also at the dict.

>=20
> Description
>        rtnl_mutex  is used to serialize rtnetlink requests and protect al=
l ker=E2=80=90
>        nel internal data structures  related  to  networking.   See  Docu=
menta=E2=80=90
>        tion/networking/netdevices.rst   for   details.    Often  known  a=
s  the
>        rtnl_lock, although rtnl_lock is a kernel function.
>=20
>=20



Thanks,
Mauro
