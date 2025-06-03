Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355911F4297
	for <linux-doc@vger.kernel.org>; Tue,  3 Jun 2025 21:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748986069; cv=none; b=QLTotsIxn221ELzr2gRsoUXpg9iZfzhNAfJQI/uG2xJHs8S6PZOpFpVFKjCiBa/Rzj1IMGOSJ+LM/FcVXQ5F47NiUXHJR2Km+VdU18Ud3x8mFg/+nXLWRlGe9BIc1S1MuEXWWVfDBl7wk+NOZFjypap7oWRoglc1c6t4XnWr1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748986069; c=relaxed/simple;
	bh=sDOhWbcnWbe1SYOBNL4cZtH7rO2z5O94oJ6VY5Y3p0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=B7gsfVBF9kjWTysXjTETC+IKHoQpLvRdX98tArRRxJ9tXfEbJIC4nOM0VfLsQJy9GXNnuVMVmJzPIJB6FCdFgyMKrP9J0PzQ+Xlnfa3JzjwKnDFxLyfcqk5WBANk+RVBlHArjhi4+Iahr3MOHumEkUZJtMeD3EUp6MCiEQO64JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJoTrCeE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJoTrCeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91CE8C4CEED;
	Tue,  3 Jun 2025 21:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748986068;
	bh=sDOhWbcnWbe1SYOBNL4cZtH7rO2z5O94oJ6VY5Y3p0Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eJoTrCeEHMaOcgKIAGiz/83BYd/R09aGV8IliEjwNTPomZTlRjwF1hJgZNeBLQUNA
	 gbbKH+nGsVLHPjiCglW457VqFbNQnxIAgCAEReRAYNGSOSINz84vc9QtXTJRS9kULD
	 aMKuGL6rDG1CrvM7WDjcnyb2DF6vVQzm0F7z5dtxN6aZJdkDYRgH4CUiyV0y/0fgpD
	 SGCyY4J4y7pS3o1DNFeZYxenxOzMQcJXgaAvUC4e+vqKIBdDLQACdMSIzW0VP85F/r
	 hFKt8axjqp3uT2oefquWMgvY4fFCQN2uhe5+hbPMZGqARtxPRJOBLf4SdvCX9zxj8F
	 AQubv6pd+rGrQ==
Date: Tue, 3 Jun 2025 23:27:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] docs: automarkup: Mark up undocumented entities too
Message-ID: <20250603232744.64fac270@foz.lan>
In-Reply-To: <74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
References: <87cybklp2n.fsf@trenco.lwn.net>
	<74558759-8fa4-417e-9879-6a34e8685ef9@notapiano>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 3 Jun 2025 15:44:42 -0400
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> escreveu:

> On Tue, Jun 03, 2025 at 11:20:16AM -0600, Jonathan Corbet wrote:
> > The automarkup code generates markup and a cross-reference links for
> > functions, structs, etc. for which it finds kerneldoc documentation.
> > Undocumented entities are left untouched; that creates an inconsistent
> > reading experience and has caused some writers to go to extra measures =
to
> > cause the markup to happen.
> >=20
> > Mark up detected C entities regardless of whether they are documented.
> > Change the CSS, though, to underline the entities that actually link to
> > documentation, making our docs a bit more consistent with longstanding =
WWW
> > practice and allowing readers to tell the difference.
> >=20
> > Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> > ---
> >  Documentation/sphinx-static/custom.css | 5 +++++
> >  Documentation/sphinx/automarkup.py     | 9 +++++++--
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sph=
inx-static/custom.css
> > index f4285417c71a..771984f77307 100644
> > --- a/Documentation/sphinx-static/custom.css
> > +++ b/Documentation/sphinx-static/custom.css
> > @@ -136,3 +136,8 @@ div.language-selection:hover ul {
> >  div.language-selection ul li:hover {
> >      background: #dddddd;
> >  }
> > +
> > +/* Mark xrefs with an underline, but elide it for those that
> > +   don't lead anywhere */
> > +.xref { text-decoration: underline; }
> > +.broken_xref { text-decoration: none !important; } =20
>=20
> To me the results look much better without these CSS rules, as they cause=
 a
> double underline.
>=20
> The current CSS already adds a dotted underline to reference links throug=
h the
> following rule:
>=20
> 	a.reference {
> 	  border-bottom: 1px dotted #004B6B;
> 	}

I like the idea of having different CSS classes for xref and broken_xref,
as it allows better formatting. I didn't test, but IMO we can either
change a.reference to use text-decoration: underline or to override
border-bottom for .xref (does it need also for .broken_xref?), e.g.:

	.xref {
		text-decoration: underline;=20
		border-bottom: none;
	}

By placing both text-decoration and border-bottom, we can ensure that
whatever default on whatever CSS used, this will display just one
underline(*).

(*) such default can still be overridden with:

	make DOCS_CSS=3Dcustom.css

>=20
> So when you add this underline text-decoration to the .xref tags, the ones
> inside <a> tags (valid xrefs) end up with two underlines.
>=20
> I've checked the result for both struct and functions and they work the s=
ame.
>=20
> So I suggest just dropping these CSS rules.

I suggest keep them ;-)

>=20
> > diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/=
automarkup.py
> > index 347de81c1ab7..cede07e758a7 100644
> > --- a/Documentation/sphinx/automarkup.py
> > +++ b/Documentation/sphinx/automarkup.py
> > @@ -241,8 +241,13 @@ def add_and_resolve_xref(app, docname, domain, ref=
type, target, contnode=3DNone):
> > =20
> >      if xref:
> >          return xref
> > -
> > -    return None
> > +    #
> > +    # We didn't find the xref; if a container node was supplied,
> > +    # mark it as a broken xref
> > +    #
> > +    if contnode:
> > +        contnode.set_class("broken_xref")
> > +    return contnode =20
>=20
> And accordingly changing this to just:

Better to keep it. Having a different class here helps if someone wants to
have a custom CSS that, for instance, would bold the undocumented functions
(for instance using a red background).

>=20
> +    #
> +    # We didn't find the xref; return contnode so that if one was suppli=
ed the
> +    # resulting node can have the same styling (eg literal formatting for
> +    # struct/functions)
> +    #
> +    return contnode
>=20
> With that,
>=20
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>=20
> Thanks,
> N=C3=ADcolas



Thanks,
Mauro
