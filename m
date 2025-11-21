Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E3633F8C9;
	Fri, 21 Nov 2025 09:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716362; cv=none; b=el4iEF7rpRvqKBeYVGV9/vc89XVjAGsvkGfSoVcN6TyRi/OwN9qntRGl+s/4O/51APRWfgcw43X7ic/9ONP5lzhLk9KB22plSdSj0hTJ2QU7or4SpsB2GRFHq0TM4DjPLFs+2KDrsTWC9Tn+CR63xLSnCE/CIKlGoxU9YOxhXxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716362; c=relaxed/simple;
	bh=15nuVtp2N2stXB8GN4hJJfLJcIi3BWRlytIutu1iCxg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oyirGmFTr2lQ84sJ6c4+7TMkZWkvOa+Vq/mX8xyuZs6rHa3YG+J77hXziLZ5lRYnMebVPIbMNEkQ0C1L4oRTPy0FGEmkmBCF1eSo6wf2E10ZWmYhCUbReXddldsmBM+LGmZD7HZxi1hGaDQ6RLsjsUd1D2Jy/AMfFx7ZlKcD+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mo2AihOL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mo2AihOL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E513BC113D0;
	Fri, 21 Nov 2025 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763716361;
	bh=15nuVtp2N2stXB8GN4hJJfLJcIi3BWRlytIutu1iCxg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mo2AihOL07n40a/g241i7HyCHx8HhwgCo1lCqzz92ngMoWvkrJP20dBSdOAj5dH0g
	 NQ/Ias2MHlHK0+laMztgheypK1SAzD9f2aBWx8xbkO6M9cv6PB5inPllwXmCF0ePXS
	 DpxWnrVBI3iyl/UgKbEHY67FigqLnCEhuhoE/Ry/Mg8wvU8gZ2ygohpKo7o7oKizs3
	 xvan3MaxDCL79djTYkXWEs+U1EOStJIk14pgqxfM7pXoclzO3xXyfjh4lcyMvwjHJe
	 XKIMDq+l54nl9yOWfo3J5dU8fdD/i+i7u03KfT1WDsvsncCp5tddTEYR9/cCIzZjJs
	 AYJu5OqROCmvA==
Date: Fri, 21 Nov 2025 10:12:36 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Carlos Bilbao
 <carlos.bilbao@kernel.org>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, Miguel
 Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
Message-ID: <20251121101236.5b1f9989@foz.lan>
In-Reply-To: <cdadc017-8874-4af0-b62a-62f70ee5d9eb@gmail.com>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com>
	<6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
	<CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
	<cdadc017-8874-4af0-b62a-62f70ee5d9eb@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 18 Nov 2025 17:23:48 -0600
Carlos Bilbao <carlos.bilbao.osdev@gmail.com> escreveu:

> Hey there,
>=20
> On 11/17/25 05:22, Miguel Ojeda wrote:
> > On Mon, Nov 17, 2025 at 11:48=E2=80=AFAM Mauro Carvalho Chehab
> > <mchehab+huawei@kernel.org> wrote: =20
> >> Sure, Sphinx (including kernel-doc) build and rust doca build are
> >> independent. Yet, Makefile "htmldocs" target currently does both.
> >>
> >> It could make sense to have a separate target if one want to build
> >> them both, e.g. something like: =20
> > My understanding (Cc'ing Carlos) is that the idea was that `htmldocs`
> > built the Rust docs if possible. =20
>=20
>=20
> Thanks! I'll also take a look at this, although I fear it'll be complicat=
ed
> without a way to reproduce what Mauro experienced.

I was able to get the scenario on linux-next. It is a little bit
tricky to reproduce.

1) I did a build with:

	$ make distclean
	$ make SPHINXDIRS=3Dpeci htmldocs

   rustdoc was not called.

2) copied a .config that has CONFIG_RUST there:

	$ cp config-rust .config
	$ make SPHINXDIRS=3Dpeci htmldocs

   rustdoc was not called.

3) manually called rustdoc:

	$ make rustdoc

   rustdoc was built.

4) now, I re-ran htmldocs:

	$ make SPHINXDIRS=3Dpeci htmldocs

   rustdoc was built.

5) I replaced .config with a config without rust:

	$ make allyesconfig
	$ make SPHINXDIRS=3Dpeci htmldocs
	...
	Using alabaster theme
	Using Python kernel-doc
	  SYNC    include/config/auto.conf
	  HOSTCC  scripts/basic/fixdep
	  DESCEND objtool
	  INSTALL libsubcmd_headers
	  CC      scripts/mod/empty.o
	  CC      scripts/mod/devicetable-offsets.s
	  MKELF   scripts/mod/elfconfig.h
	  HOSTCC  scripts/mod/modpost.o
	  HOSTCC  scripts/mod/sumversion.o
	  HOSTCC  scripts/mod/symsearch.o
	  HOSTCC  scripts/mod/file2alias.o
	  HOSTLD  scripts/mod/modpost
	  CC      kernel/bounds.s
	  CC      arch/x86/kernel/asm-offsets.s
	  UPD     include/generated/asm-offsets.h
	  CC      kernel/sched/rq-offsets.s
	  CALL    scripts/checksyscalls.sh
	make[4]: *** No rule to make target 'rustdoc'.  Stop.
	make[3]: *** [Makefile:1855: rustdoc] Error 2
	Ignored errors when building rustdoc: Command '['make', 'rustdoc']' return=
ed non-zero exit status 2.. Is RUST enabled?

There are other combinations that produce weird things.

If, instead of step (5), we do:

	$ echo >.config
	$ LANG=3DC make SPHINXDIRS=3Dpeci htmldocs

it will produce, after building htmldocs from Sphinx:

	Using alabaster theme
	Using Python kernel-doc
	  SYNC    include/config/auto.conf
	  HOSTCC  scripts/basic/fixdep
	*
	* Restart config...
	*
	*
	* General setup
	*
	Compile also drivers which will not load (COMPILE_TEST) [N/y/?] (NEW)=20

---

My understanding is that the issue is caused because (by purpose)
make htmldocs doesn't sync configuration. It doesn't need, as
building docs doesn't really depend on any .config flag.

However, this check at the Makefile:

	ifneq ($(wildcard $(srctree)/.config),)
	ifeq ($(CONFIG_RUST),y)
        	RUSTDOC=3D--rustdoc
	endif
	endif

Uses a cached value of "CONFIG_RUST" from the last build, with may
or may not be present anymore.

My patch solves this by not using the cached result, but, instead
checking if CONFIG_RUST is enabled directly at the .config file.

Thanks,
Mauro
