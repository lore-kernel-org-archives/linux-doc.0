Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D20D2DCBFD
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 20:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769200426; cv=none; b=Z/54j876ocG+GfLC5cpRNYSVFWSQhUiZ6P1sUQGi3d3IXOyLtjkUplEyglqdwhVfblJYgGX6uUlxonJV2NNBvudJaSpL6Caxn61iCTFrYoDu2rUrgsqKRtufKBcSpg/h8xpiyUnid094yTwyeL7TDnx7FZ8XIWioPxXHq3FXvHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769200426; c=relaxed/simple;
	bh=r+PFaU4JLe7ROo7kAS6snaIO/m6xBctZ5tOb6fr/plQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mx64ZOXULqTKqwMvBDrJNpl6A7Ms9CSZtmibns5LK9Ysfd6/BCXyt5Qm+6Zid5RV1C93hbYKKbIhSIB3QGg1ukejl02+uTmj3TXN43hzoMBNJwxk3hC1djKZNdJpBmlneccShdIQpQqln+ygzU6sf52gwWVn1oJGTa4ZMpJ8uOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxHhYxxd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxHhYxxd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8129C4CEF1;
	Fri, 23 Jan 2026 20:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769200425;
	bh=r+PFaU4JLe7ROo7kAS6snaIO/m6xBctZ5tOb6fr/plQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TxHhYxxdAZHrVo4jBOadB5GjEdIj91wG4OLUUSLpiaHbrLcb+SmJ/2b2mX4kfy92C
	 qOIjljRbqAAyYZAfe5czdUWGPFZfs4auIZhStDDrAGt5RJThOccRFxgjP6OXLfYpwr
	 jW44EvlLcXak2dvzMVySrn+0Rg5gqRpIcyMMNNxOCXF9X+b+tAFkNLyvXgVyOo1Juz
	 iTtDceiKh8mJI6fK4gyFL1CVm2//0SsYCSH+uHnv5P1PlinbsXMMl9AL9hN/iMUb0+
	 nqMN/9Jf0zkyim4QVAPxRJ/P5HQNXKMW7KlQklwT+7wNjb7SL05lMVmfuvSjMqPj7k
	 /ldSJ2Qx6fUDA==
Date: Fri, 23 Jan 2026 21:33:41 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Mauro
 Carvalho Chehab <mchehab@kernel.org>
Subject: Re: Passing SPHINXOPTS is broken
Message-ID: <20260123213341.5ce42561@foz.lan>
In-Reply-To: <20260123160933.45ebb2bc@localhost>
References: <db84b28d2997a1ce73ca9bc65c33e2d08a90aae8@intel.com>
	<11148f49962022fde99058c15345add4935bbeff@intel.com>
	<20260123123215.32f6c40a@foz.lan>
	<233a2366263111e61700da07f3692a029fc51a50@intel.com>
	<20260123151033.5acc515f@localhost>
	<faac4df15ab5b87dc5795143ecafb9b725b9118e@intel.com>
	<20260123160933.45ebb2bc@localhost>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 23 Jan 2026 16:09:33 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On Fri, 23 Jan 2026 16:28:37 +0200
> Jani Nikula <jani.nikula@intel.com> wrote:
>=20
> > On Fri, 23 Jan 2026, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =
wrote: =20
> > > With Makefile, there isn't. This didn't change: it is just the same
> > > behavior we used to have before the wrapper addition, after this
> > > changeset (merged in 2022):
> > >
> > > 	c0d3b83100c8 ("kbuild: do not print extra logs for V=3D2")
> > >
> > > Now, currently it is possible to do that by calling the wrapper
> > > directly:
> > >
> > > 	$ ./tools/docs/sphinx-build-wrapper -v htmldocs --sphinxdirs peci
> > >
> > > Here, "-v" instructs the wrapper to drop "-q" flag, but doesn't touch
> > > KBUILD_VERBOSE, so you won't see kernel-doc debug messages.   =20
> >=20
> > I'm not really interested in using the wrapper directly. I use make O=3D
> > builds, and I don't want to and I should not have to figure out how to
> > do that with the wrapper.
> >=20
> > Again, it should be possible to pass user SPHINXOPTS to sphinx-build. =
=20
>=20
> Agreed, but the problem is that, since a long time, "-q" was always=20
> aways added when V=3D0, and we don't have V=3D2 for docs anymore.
>=20
> Unfortunately, Sphinx doesn't have a --no-quiet option. So, right now it
> preserves the behavior it had for a long time:
>=20
> - if V=3D0, defaults to "-q"
> - if V=3D1, defaults to not use "-q", but one can add SPHINXOPTS=3D-q
>   to keep Sphinx build in quiet mode.

Forgot to mention, but there's an obvious alternative: change the default
to not be quiet, e.g.:

	diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wra=
pper
	index 78ff7ac202ef..76f14101d134 100755
	--- a/tools/docs/sphinx-build-wrapper
	+++ b/tools/docs/sphinx-build-wrapper
	@@ -179,7 +179,7 @@ class SphinxBuilder:
	         # Build a list of sphinx args, honoring verbosity here if specifi=
ed
	         #
=20
	-        verbose =3D self.verbose
	+        verbose =3D True
	         sphinx_args, self.sphinxopts =3D parser.parse_known_args(sphinxop=
ts)
	         if sphinx_args.quiet is True:
	             verbose =3D False

This will change the behavior that we had since 2022 (at least), causing
sphinx-build to always show its progress.

=46rom my side, I'm perfectly fine with that, but it might cause side
effects for CI. That's basically why I opted to preserve the original
behavior.

Yet, after thinking more carefully about that, IMO the best would
be to use the "-v" argument, preserving the current behavior, but
allowing it to be overridden using "-v".

See the patch below.

Regards,
Mauro


[PATCH] docs: sphinx-build-wrapper: allow -v override -q

Documentation builds were using "-q" for a long time, but sometimes
it is nice to see the Sphinx progress, without increasing build
verbosity - which would also turn on kernel-doc verbosity.

Instead of doing that, let's parse the sphinx-build already-existing
-v: each time it is used, it increases the verbosity level.

With that, if the default is to use -q, a single -v will disable
quiet mode. Passing more -v will keep increasing its verbosity.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrap=
per
index 78ff7ac202ef..8080ace60680 100755
--- a/tools/docs/sphinx-build-wrapper
+++ b/tools/docs/sphinx-build-wrapper
@@ -168,6 +168,7 @@ class SphinxBuilder:
         parser =3D argparse.ArgumentParser()
         parser.add_argument('-j', '--jobs', type=3Dint)
         parser.add_argument('-q', '--quiet', action=3D'store_true')
+        parser.add_argument('-v', '--verbose', default=3D0, action=3D'coun=
t')
=20
         #
         # Other sphinx-build arguments go as-is, so place them
@@ -179,10 +180,14 @@ class SphinxBuilder:
         # Build a list of sphinx args, honoring verbosity here if specified
         #
=20
-        verbose =3D self.verbose
         sphinx_args, self.sphinxopts =3D parser.parse_known_args(sphinxopt=
s)
+
+        verbose =3D sphinx_args.verbose
+        if self.verbose:
+            verbose +=3D 1
+
         if sphinx_args.quiet is True:
-            verbose =3D False
+            verbose =3D 0
=20
         #
         # If the user explicitly sets "-j" at command line, use it.
@@ -195,8 +200,11 @@ class SphinxBuilder:
         else:
             self.n_jobs =3D None
=20
-        if not verbose:
+        if verbose < 1:
             self.sphinxopts +=3D ["-q"]
+        else:
+            for i in range(1, sphinx_args.verbose):
+                self.sphinxopts +=3D ["-v"]
=20
     def __init__(self, builddir, venv=3DNone, verbose=3DFalse, n_jobs=3DNo=
ne,
                  interactive=3DNone):


