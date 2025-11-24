Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF7257859;
	Mon, 24 Nov 2025 08:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763973260; cv=none; b=AItnycwNDeVMG9017X/Sf/M99L5OMK0INxzFPQz86hDEPl74mBR/S0PJ7pEvsShdVXdr1wwi39wGf9/XJCp64fOPnIc0NrAUfd7Kq+i17POWrJakB0IMX589G9QXuyiG7WdhX0PtwxwuXhTVckDeY8uRYaT9zQcvCfHnRXZAAzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763973260; c=relaxed/simple;
	bh=wGZXJAQbtVTV9FHwtHp+4Bz8UrJFul/L4iMHsX4MgnE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hMZrdM+CefJucvI7LmYCudB8tGTa5rDFJVDpSAXAP0bdevnLG0LoPV/R5rmaEeNI9EapMZrPOaHGQH71EPMIba5nPJVMusi84gNZIvj6/E75kOjK831rOnqphLssLUvYi87u5RN9g43lNO686MDSiBVua18vhgt/FEfFPYEFDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cSDIE3bJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cSDIE3bJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3539CC4CEF1;
	Mon, 24 Nov 2025 08:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763973259;
	bh=wGZXJAQbtVTV9FHwtHp+4Bz8UrJFul/L4iMHsX4MgnE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cSDIE3bJYijRV7Nw9AQRfw507aKbN5fhxY4bI3kI4ZLYQ2oqfmLa47THN81aUd0nF
	 KPrhycRcNrCLQevcYozAFdEZpeXscdj35hpAzpc/l9RS5oS75uTuMDQH433C3TofGX
	 0uwfv5v8scO3wkDLoVFmLpRJ7eHKS4Uu9zPZrPQ3ydk0YSC8M2jRaQX8YUWycwsHP4
	 5PCRaLVeBKrsNORZS4pm3aCzsRS2ul7PcUt20va/D3cxM3XhtFnoGAyMqfduGxePzG
	 gTG+3mgIk08zRi3iCmjgkatQ0SJwNlY0sybkOEYMtpSREczeoWbA7xzfopdDtHp4Rx
	 LiUDJK9CahrHQ==
Date: Mon, 24 Nov 2025 09:34:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel
 Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <20251124093415.679c698d@foz.lan>
In-Reply-To: <20251124091811.47abd0a9@foz.lan>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
	<6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
	<CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
	<20251117133203.71b97d47@foz.lan>
	<CANiq72kGvfB2wqAv-d7F9racGoSX+TOmezA=ip-E4ouva-0U=Q@mail.gmail.com>
	<20251121104057.5aecce59@foz.lan>
	<CANiq72nhrQsUcxm-1bsBEaGVbRgmAC=mVxrQ+A7TLcVuOer9oQ@mail.gmail.com>
	<20251124091811.47abd0a9@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 24 Nov 2025 09:18:11 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> escreveu:

> Em Mon, 24 Nov 2025 02:51:40 +0100
> Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:
>=20
> > On Fri, Nov 21, 2025 at 10:41=E2=80=AFAM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote:
> > >
> > > I'm not talking about stop using rustdoc. I'm talking about using
> > > it to output on a format that Sphinx can understand, and let Sphinx
> > > do the final output, solving cross-references. =20
> >=20
> > By stop using `rustdoc` I meant its "normal" (HTML) output, i.e. the
> > webpage with all its features and so on.
>=20
> I see.
>=20
> > The JSON support is unstable so far:
> >=20
> >     https://github.com/rust-lang/rust/issues/76578
>=20
> From the issue timestamps, it seems that it doesn't have a high
> priority.
>=20
> > And even then, I imagine it will always still require a kernel config,
> > so that isn't an advantage either.
>=20
> This doesn't seem to be an issue itself, as a new kernel config is easy=20
> to add.
>=20
> > Thus trying to mimic what `rustdoc` does is probably going to be a lot
> > of work to maintain, to likely get a worse result than what `rustdoc`
> > already does.
>=20
> Perhaps one solution would be to write a new output plugin to make
> rustdoc produce a better output format that could be easily mapped
> by a Sphinx plugin (like producing an output on an enriched text
> format like Markdown or ReST).
>=20
> I can't evaluate how easy/hard would be to do that, as I'm not
> familiar with Rust toolset.
>=20
> > Something that would work without a config could be way more
> > interesting for us to integrate into Sphinx.
>=20
> At Sphinx side, it won't be hard to pick references from rustdoc.
>=20
> At kernel_include extension:
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/sphinx/kernel_include.py
>=20
> I added a logic there to detect unsolved cross-references.
>=20
> Currently, it just warns about unsolved references, but it won't=20
> be hard to modify a similar logic to solve it, pointing to a
> rustdoc reference (if those are stable enough).
>=20
> Doing the reverse can be trickier, though: internally, Sphinx
> maps them via a C domain. The output plugin (html, pdf, ...)
> is what converts such reference into an html (or pdf) tag.
> Such mapping is version dependent.
>=20
> There was a major rewrite at eh C domain on Sphinx 3.0 which
> changed such mapping, but other versions may have changed it as well.
>=20
> Also, there is an open issue that will likely change it once
> fixed:
>=20
> 	https://github.com/sphinx-doc/sphinx/issues/7819
> 	https://github.com/sphinx-doc/sphinx/issues/8241
>=20
> (last one closed as duplicate of #7819)
>=20
> So, creating cross-references from rustdoc to Sphinx could
> be tricky and hard to maintain, as it may require some checks
> at rust/rustdoc side to verify Sphinx version.

In time:

by "rust/rustdoc side" I mean the cross-reference solver that
would run inside the Makefile target that will be called after
building Sphinx docs.=20

It will likely be external tools inside the Kernel tree to identify
Sphinx and docutils versions, rust/rustodoc version, and do whatever
other check would be needed to detect the tags format and modify
the produced html output for the hyperlinks to work.


Thanks,
Mauro
