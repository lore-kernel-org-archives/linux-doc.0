Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35500306B00;
	Fri, 21 Nov 2025 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718063; cv=none; b=etADKwgrPOcjYcRP+05QitILjdXelX6DgVNj8gYgG+4f+vA8pFHvrhojLNslMaOSArM/SL49ytL+Jxea3r02RE7GxT7GGrrxDOVBvVLgHN/52xq44AiB5MpO/mqIyPNhhcB36Ps7Fa4Q/jAUqLRRioF5aVkB5iX8/reWGK+0h6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718063; c=relaxed/simple;
	bh=63IGMPJ9rbdKC7gRTmcigZvggYT/2YjJE+qUm6zDngs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExDdzTPBdX59ATUjenkpzls8xAwvHGB4ZnkA6s8T3YChCy53+i6jh16BaexN62pc53/46TO3t5h6bErZGuaez0/o6xbajME1hP/lKuYdcxtIyTe0vcXzmROhPXaDoj+wbhFEvRL+RdSIcTDZVkmG+VlmQr2tDukyiU1ksTh0C9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMZSz7YG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMZSz7YG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43E2C4CEF1;
	Fri, 21 Nov 2025 09:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763718062;
	bh=63IGMPJ9rbdKC7gRTmcigZvggYT/2YjJE+qUm6zDngs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iMZSz7YGCFjLRCQyqRmqbjC887tkcAR1U2ARnnjOyAXBJ6dUkw4wM8sNCnbveZM//
	 BtzBPCdCVooROmRwOU0GfVAn8XTh0GvKD81/DJ4m0XNeDOoyofqo9zHNrJfooFNdDO
	 iEvM1yxHWkpRxSVHJBBFAU5ZLIOXzBbqHaACeRU5gokR3H2I+C66MvI6ctrmSRTl8t
	 rgCvtEOdhr69vtY/R4RhFcSP6Y8tdYfMOSPEugBH0Mg6NHMN/r2jgOu0qFGsjDzoft
	 kjUKq3OitZD2d/JXSFG7hgkQ0SS+FaY9obXwmvzArl96EX0Dvp3O9hRyXqeAB3UQ6S
	 zeiBKA3OaDKmg==
Date: Fri, 21 Nov 2025 10:40:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel
 Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <20251121104057.5aecce59@foz.lan>
In-Reply-To: <CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
	<6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
	<CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
	<20251117133203.71b97d47@foz.lan>
	<CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 18 Nov 2025 23:02:35 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Heh, the same applies to the current usage of htmldocs - specially
> > when SPHINXDIRS is used, e.g. one doing, for instance:
> >
> >         make SPHINXDOCS=3Ddriver-api/<subsystem>
> >
> > may not be interested on building rust docs, which, on such case,
> > may be a lot slower than a partial build. Also, I don't think that
> > rustdoc currently does something similar to SPHINXDOCS. =20
>=20
> If you mean building the Rust docs introduces extra work for people
> building the HTML docs when that happens automatically, then yeah,
> definitely.
>=20
> Perhaps it could be skipped depending on what folders are requested.

Yeah, that sounds a good approach: teach rustdoc target to handle
SPHINXDOCS. If it is empty (or just ".") handle the same way as
today. Otherwise, do a partial doc build or skip when it doesn't
make sense.

>=20
> > E.g. you would create a parser_rust.py module there, which would
> > generate ReST output from the rust code(*). =20
>=20
> To clarify, the idea of the "external references map file" in that
> issue isn't to stop using `rustdoc`,=20

I'm not talking about stop using rustdoc. I'm talking about using
it to output on a format that Sphinx can understand, and let Sphinx
do the final output, solving cross-references.

> but rather to allow `rustdoc` to
> have (at least) the references to C items (e.g. a link to the rendered
> `printk` docs at least to the source code where it is defined). In
> other words, it is about allowing developrers to just write something
> like [`printk()`] and the system would figure out how to link to the
> right docs automatically.
>=20
> We don't plan to stop using `rustdoc` -- its output is specialized for
> Rust which makes it quite nice.
>=20
> `rustdoc` can export JSON and that should be possible to use easily
> from a Sphinx plugin without having to parse Rust from scratch, to at
> least get some degree of Sphinx support.=20

There is a JSON Sphinx plugin (although I never used - no idea if
it would do what it is needed):
	https://sphinx-jsonschema.readthedocs.io/en/latest/

If this won't work, I guess it wouldn't be hard to use parser_yaml.py as
an example to write a new plugin to handle rustdoc JSON output.

> That would be nice for the
> other outputs support like PDF as you mention, yeah, as well as having
> independent-to-the-config docs. We discussed it a few times, but it
> has never been a high priority, especially since `rustdoc` does its
> job quite well.

Thanks,
Mauro
