Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2F143D50D;
	Thu, 13 Aug 2026 21:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786656971; cv=none; b=VgHbYkOQR7a1QGKZRbDe77Ytckr/I4ohXmIdgV1jNb9hlTHGDNOpnwZEpso3cnjw09l+CwXmwV6Si7kQCo2lQe6QYAkhBq8U7G3oUoy4ju4OIc66fpgZ+hEtXfGXP80nrlB/GEiR67126O4NEjRtZ0viAV6JajY8Wsb7zUhZrAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786656971; c=relaxed/simple;
	bh=XYlX4lxpiUcow4qCKhntqq7utZUIqNTVedaUMN4IDAI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNRPGlZ3yLxK5jcuPrSzm5v5N8dv6l09AApByd+Gv+0hRTvoTQE/XlJmM8ftQSHl+WFzllHkeM6o11V9uPxjwH6vUwSO5qWfzoP2PsaUncs2r76XeK31gZM4rB+ntj0Jd4rhfx+msgxhnhJEg0ajlsubyJkOu1+/r1LS+6QDa2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3yhH/aV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3yhH/aV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB7FA1F000E9;
	Thu, 13 Aug 2026 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786656967;
	bh=Kf8jnrcXVvnQLjNW/F/NbluPc2W3oPFTNEn4Ikcj6FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V3yhH/aVWIwUCv0TmRq2UUS68+tOROh1NrY4ZDhbf9LxNqNvlHgG14aXHAoV7LXER
	 zZvIY8SR0HrPmgigEmHW/cp+M4m6AL3errwVRMmeqSDTzzIpprJ9klFYV0UoaS0i0/
	 Pi2GAiWDknrk3rnkNEHGg3yKzjcjAGbuvBreY2RRQUFiVDoFz+mvTA6WWnutIblLY4
	 5OdNVxPePf2eHDoo+Y9t2noJDT3+2jpY00IH7bJ+PtB+VF2bA3wyzZXsv1w8MQudDQ
	 zk/vRQE9/rm0zx5dPAUMbxHWXZn5set+YLGfjBUEqPwwi+QvbhDQELlngUFyVywpHG
	 iNl9+jzlrTCZg==
Date: Thu, 13 Aug 2026 23:36:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] docs: sphinx-build-wrapper: prefer gmake
Message-ID: <20260813233601.50922c98@foz.lan>
In-Reply-To: <CAKxVwgeqTn=hAaGWOh1TBSqz122fPOQ=SrYQubAtpXPCiF9b=Q@mail.gmail.com>
References: <20260812182327.53694-1-chenmiao.ku@gmail.com>
	<20260812182327.53694-5-chenmiao.ku@gmail.com>
	<20260812222309.19b39299@foz.lan>
	<CAKxVwgeqTn=hAaGWOh1TBSqz122fPOQ=SrYQubAtpXPCiF9b=Q@mail.gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 13 Aug 2026 17:38:59 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 04:23=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 13 Aug 2026 02:23:21 +0800
> > Chen Miao <chenmiao.ku@gmail.com> wrote:
> > =20
> > > Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> > > wrapper invokes make directly when generating Info and Rust
> > > documentation. This can make the dependency check succeed while those
> > > documentation targets still use an incompatible make implementation.
> > >
> > > Honor MAKE when it names a compatible GNU Make. Otherwise check gmake=
 and
> > > then make, selecting the first GNU Make 4.0 or newer. Use the common =
kdoc
> > > detector to keep this selection consistent with sphinx-pre-install.
> > >
> > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > > ---
> > >  tools/docs/sphinx-build-wrapper | 23 ++++++++++++++++-------
> > >  1 file changed, 16 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-buil=
d-wrapper
> > > index 1bb962202..15c7e0938 100755
> > > --- a/tools/docs/sphinx-build-wrapper
> > > +++ b/tools/docs/sphinx-build-wrapper
> > > @@ -63,6 +63,7 @@ SRC_DIR =3D os.path.dirname(os.path.realpath(__file=
__))
> > >  sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
> > >
> > >  from kdoc.python_version import PythonVersion
> > > +from kdoc.gmake_detect import find_gmake
> > >  from kdoc.latex_fonts import LatexFontChecker
> > >  from jobserver import JobserverExec         # pylint: disable=3DC041=
3,C0411,E0401
> > >
> > > @@ -97,6 +98,14 @@ class SphinxBuilder:
> > >      with the Kernel.
> > >      """
> > >
> > > +    def get_make(self):
> > > +        """Select the first GNU Make 4.0 or newer in preference orde=
r."""
> > > +        make =3D find_gmake(self.env.get("MAKE"))
> > > +        if make:
> > > +            return make
> > > +
> > > +        sys.exit("GNU Make 4.0 or newer is required")
> > > +
> > >      def get_path(self, path, use_cwd=3DFalse, abs_path=3DFalse):
> > >          """
> > >          Ancillary routine to handle patches the right way, as shell =
does.
> > > @@ -569,9 +578,10 @@ class SphinxBuilder:
> > >          texinfo directory.
> > >          """
> > >
> > > +        make =3D self.get_make()
> > >          for output_dir in output_dirs:
> > >              try:
> > > -                subprocess.run(["make", "info"], cwd=3Doutput_dir, c=
heck=3DTrue)
> > > +                subprocess.run([make, "info"], cwd=3Doutput_dir, che=
ck=3DTrue)
> > >              except subprocess.CalledProcessError as e:
> > >                  sys.exit(f"Error generating info docs: {e}")
> > >
> > > @@ -787,12 +797,11 @@ class SphinxBuilder:
> > >
> > >          if rustdoc and target in ["htmldocs", "epubdocs"]:
> > >              print("Building rust docs")
> > > -            if "MAKE" in self.env:
> > > -                cmd =3D [self.env["MAKE"]]
> > > -            else:
> > > -                cmd =3D ["make", "LLVM=3D1"]
> > > -
> > > -            cmd +=3D [ "rustdoc"]
> > > +            make =3D self.get_make()
> > > +            cmd =3D [make]
> > > +            if make !=3D self.env.get("MAKE"):
> > > +                cmd.append("LLVM=3D1") =20
> >
> > Did you test bulding documentation with CONFIG_RUST=3Dy?
> >
> > AFAIKT, building rust docs only work with LLVM, as GCC doesn't build
> > Rust code yet(*). When the time comes and gcc starts supporting it,
> > the code would likely need to check for gcc version as well.
> >
> > (*) There is an experimental Rust support on gcc under development.
> >     No idea about its current status. According with:
> >
> >         https://docs.kernel.org/rust/quick-start.html
> >
> >     "GCC also works for some configurations, but it is
> >      very experimental".
> >
> > Thanks,
> > Mauro
> > =20
> Yes, I tested it on macOS with CONFIG_RUST=3Dy using:
>=20
>     make LLVM=3D1 SPHINXDIRS=3Drust htmldocs

No. I meant:

	$ make LLVM=3D1 menuconfig		# enable rust
	$ grep CONFIG_RUST .config		# check if it was enabled
	$ make SPHINXDIRS=3Drust htmldocs

>=20
> The Rust documentation path was selected and the wrapper invoked rustdoc =
with
> the LLVM build configuration.
>=20
> The initial build exposed a few macOS host-build portability issues unrel=
ated
> to this series, including the lack of ELF headers required by host tools =
and
> GNU sed-specific uses in Rust-related build rules. After fixing those iss=
ues
> locally, the rustdoc build and the Sphinx HTML documentation build comple=
ted
> successfully.
>=20
> Those fixes are outside the scope of this series. If macOS host-build sup=
port
> is useful, I can send them as a separate patch series.
>=20
> Thanks,
> Chen Miao



Thanks,
Mauro
