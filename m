Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E322222D1;
	Mon, 24 Nov 2025 08:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763972297; cv=none; b=Ph/HJm5jjkuJk8lpbNCyfQ+QIErNx50MIBfZmgrM7fpKab8G/HCHTy+mMnKS6MP7ile2dlUDChheKfaICSoqms60ozHkFRqrnIAcoAvNe38L7nPWNsZPzSWu3cDKVKWPfH2h8PkDJoOz0iy539vz7pc5H9rd4JWW/Mop0yNfXFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763972297; c=relaxed/simple;
	bh=0xzX32DxzyVu4q46oHvMuew7OuDX12pbJhwiUJZPHck=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TTTL0siA1UHoC+QkxKSvRQkEE9Iix29EwbPTL4Y7n0avdP/x2+fKgMGtmEbwLtGEPN+sadTVV0HuVD9nmGAK7fghGg9FT+swU5l+NF9BGJgYOGR9+0eFCGNxZKu6OBWjIme0QOPG93oa49YERGqMewWNROP29SZRRCOOu2Ar7rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=prGmKAvg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="prGmKAvg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33F87C4CEF1;
	Mon, 24 Nov 2025 08:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763972295;
	bh=0xzX32DxzyVu4q46oHvMuew7OuDX12pbJhwiUJZPHck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=prGmKAvgqAQl5/fBSHuxx3Mt/udCej20TpROxUOnYsrPoHIpjtZSSpLjfRKhfhudp
	 8wdty7nWGv7pGo0wpDvQxsOORwTWDJa0Bj2TtmrPQscc8K/UUsJZULFasFCsht6wp1
	 VIOIMP51RMFMuYUpI+B/8fDhyVPTyj2Y3ADn+YcEUOSOulcJafAuTPUtfDRPT832kp
	 qMgmHW2K92DNlFrm44zaZdoZ3dUfdO8CPFkKhPPpVJE2RqFIQjjYAVnl2oppqpaTx/
	 6V1ITMVpOLZZGWWOSJJ8sv2LMM66q2ckdCcf5Cs56+QZzxyrQ5DWfQDqSMzsZ/f89f
	 njC/aVtplNp5w==
Date: Mon, 24 Nov 2025 09:18:11 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel
 Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <20251124091811.47abd0a9@foz.lan>
In-Reply-To: <CANiq72nhrQsUcxm-1bsBEaGVbRgmAC=mVxrQ+A7TLcVuOer9oQ@mail.gmail.com>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
	<6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
	<CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
	<20251117133203.71b97d47@foz.lan>
	<CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
	<20251121104057.5aecce59@foz.lan>
	<CANiq72nhrQsUcxm-1bsBEaGVbRgmAC=mVxrQ+A7TLcVuOer9oQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 24 Nov 2025 02:51:40 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Fri, Nov 21, 2025 at 10:41=E2=80=AFAM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > I'm not talking about stop using rustdoc. I'm talking about using
> > it to output on a format that Sphinx can understand, and let Sphinx
> > do the final output, solving cross-references. =20
>=20
> By stop using `rustdoc` I meant its "normal" (HTML) output, i.e. the
> webpage with all its features and so on.

I see.

> The JSON support is unstable so far:
>=20
>     https://github.com/rust-lang/rust/issues/76578

=46rom the issue timestamps, it seems that it doesn't have a high
priority.

> And even then, I imagine it will always still require a kernel config,
> so that isn't an advantage either.

This doesn't seem to be an issue itself, as a new kernel config is easy=20
to add.

> Thus trying to mimic what `rustdoc` does is probably going to be a lot
> of work to maintain, to likely get a worse result than what `rustdoc`
> already does.

Perhaps one solution would be to write a new output plugin to make
rustdoc produce a better output format that could be easily mapped
by a Sphinx plugin (like producing an output on an enriched text
format like Markdown or ReST).

I can't evaluate how easy/hard would be to do that, as I'm not
familiar with Rust toolset.

> Something that would work without a config could be way more
> interesting for us to integrate into Sphinx.

At Sphinx side, it won't be hard to pick references from rustdoc.

At kernel_include extension:

	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/sphinx/kernel_include.py

I added a logic there to detect unsolved cross-references.

Currently, it just warns about unsolved references, but it won't=20
be hard to modify a similar logic to solve it, pointing to a
rustdoc reference (if those are stable enough).

Doing the reverse can be trickier, though: internally, Sphinx
maps them via a C domain. The output plugin (html, pdf, ...)
is what converts such reference into an html (or pdf) tag.
Such mapping is version dependent.

There was a major rewrite at eh C domain on Sphinx 3.0 which
changed such mapping, but other versions may have changed it as well.

Also, there is an open issue that will likely change it once
fixed:

	https://github.com/sphinx-doc/sphinx/issues/7819
	https://github.com/sphinx-doc/sphinx/issues/8241

(last one closed as duplicate of #7819)

So, creating cross-references from rustdoc to Sphinx could
be tricky and hard to maintain, as it may require some checks
at rust/rustdoc side to verify Sphinx version.

Thanks,
Mauro
