Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EF328B68;
	Mon, 17 Nov 2025 12:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382728; cv=none; b=Xti3oILQz6ufaQ+qqxTjlkTAydt8sDePub4wYXcXEVNFr5rvQNKBQIcAQzvtOYbIEXkCNE2WUn21pRzGDrVM5Qdz8UXPKuPm/MtVQRiTe65KSS2bZNhJQrT8BvZ8XcBvs26hGFr5S7j9U0Q02C5qfTDtypeSWk+ARAvA+HRcAkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382728; c=relaxed/simple;
	bh=oSuDduPLmSf7ZVEnaOqNaQ/eXPFwV7dBPob1W0m18zk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t+6Iu25SAgFI6rb5AFblxRq3u2DOozFJl2/BAT6XA7jmR2iPoko/YmvWb5wjHpugzzRLzzLV3xTz8LLjaC1fk0Nth5KOFTih94AYEe2RDqmhtWKxjZJbMFL1ITjGlF5jpnypTYeaM+5uE0Br9bZcR35NRVo7shZt3K/MCkVjdUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XYijf66L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XYijf66L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F5FC2BC87;
	Mon, 17 Nov 2025 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763382727;
	bh=oSuDduPLmSf7ZVEnaOqNaQ/eXPFwV7dBPob1W0m18zk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XYijf66LYL+SbCRsL80zmY5eH1rCV5s+Qw1nU4HtJiNkoL0+oHJghIJW8cdzq9Yz3
	 aO89v49WGP/1oh+l5BPySiKV5TNLsP3ipyHfRuuAIUJjMRZIJXJI1g1tphv2Me32qt
	 1N+kZqLRZwWTT7ubxAh2qBHnlNazVWTxZup1YKLpq32TPY4PrDLVgwRZ8e8ocCP8nk
	 XaH4lHfzj2RORQ+fYihFtOa4dgOXDM1sDJlrrr9gB+c9nTzqOtpqcp8R4qB9ln/WWF
	 N5a8L3G7bY6ign4h7u6i2wyLh8hdbSORJpRqEIPNzAHAhwufbHKakgMX6QKv6lN9c9
	 LXg3/+hzHHTuw==
Date: Mon, 17 Nov 2025 13:32:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel
 Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <20251117133203.71b97d47@foz.lan>
In-Reply-To: <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
	<6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
	<CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 17 Nov 2025 12:22:48 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Mon, Nov 17, 2025 at 11:48=E2=80=AFAM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Sure, Sphinx (including kernel-doc) build and rust doca build are
> > independent. Yet, Makefile "htmldocs" target currently does both.
> >
> > It could make sense to have a separate target if one want to build
> > them both, e.g. something like: =20
>=20
> My understanding (Cc'ing Carlos) is that the idea was that `htmldocs`
> built the Rust docs if possible.
>=20
> I don't mind if that is changed etc., but I think it is important to
> keep the `rustdoc` target simple and focused: it is a "basic"
> operation (which is also used to lint docs too), and way faster than
> building the HTML docs, and it doesn't depend on them.

Heh, the same applies to the current usage of htmldocs - specially
when SPHINXDIRS is used, e.g. one doing, for instance:

	make SPHINXDOCS=3Ddriver-api/<subsystem>

may not be interested on building rust docs, which, on such case,
may be a lot slower than a partial build. Also, I don't think that
rustdoc currently does something similar to SPHINXDOCS.

So, at least for me, it does make sense to have separate targets
for Sphinx, Rust and both (*).

(*) now, how such targets would be named is a completely different
    question.

> Apologies if I put it perhaps a bit too tersely in my previous message
> -- everyone contributing to Rust code is supposed to rely on that
> target to test their commits, and needing the whole Sphinx setup would
> make the target way worse in practice.

Agreed.

>=20
> Now, in the future, if we start relying on generating references for
> the Rust docs from the C side and things like that (which is my plan,
> but it is long term: first item in
> https://github.com/Rust-for-Linux/linux/issues/350), we may need to
> rethink things a bit (i.e. we may need to run a subset of the kernel
> normal docs to build the Rust docs), but even then ideally we should
> only introduce the minimal dependency needed.

IMO, this is a separate discussion, as you may need a different
toolset.

The way I see, for issue #350 IMO the best would be to create a=20
Sphinx extension similar to:

	Documentation/sphinx/parser_yaml.py

E.g. you would create a parser_rust.py module there, which would
generate ReST output from the rust code(*). Besides allowing cross
references between Sphinx, C and Rust, this would also allow
generating epub and pdf output.

(*) In practice, teaching rustdoc how to produce ReST output.
    Alternatively, rustdoc could generate a markdown output and use
    a sphinx markdown extension at parser_rust.py, to convert from
    MD to ReST like this extension:

	https://www.sphinx-doc.org/en/master/usage/markdown.html

Besides allowing cross references between Sphinx, C and Rust, a Sphinx
extension would also allow generating epub and pdf output, removing
all extra Makefile (or wrapper) code related to rustdoc.

-

Another alternative would be to use intersphinx, but I guess
making it working would be a lot more complex - as we don't even
support it yet on our current Sphinx output.
=09

Thanks,
Mauro
