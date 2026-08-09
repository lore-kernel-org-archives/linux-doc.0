Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B36388E66;
	Sun,  9 Aug 2026 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786295913; cv=none; b=od+EJT4KZwcey7vIJLmWXYVqPKrlGtr9t9uJmrB/I+OY7EMcVst8QGaYQihZxzi4yyS2L0opKMUIMQLsBXxcAHMQRNW5HEQ4GhQeHlNPRq688nPbqu3I/bJ3wCNKNNB1RX5XGGy6NYZBqAyMzVpRPbwlCNy0cte7Hu8WG/x6xMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786295913; c=relaxed/simple;
	bh=LH6T0DfMpRvOJTzaWnwxiOnKtcytUdIfDfjBy2FPk3M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MaImqzIgVT78GHQe9SYJjBNHWgNmQov9S4SvyGbJZnbYWs5oooVVrKcQ78AXQfYlQ3ptnHeTY8LC7vt2368ZoKqmI1H7aeSnNHqlYMx3ZkgZlz39Ph20HE2bPqwKRvXEAthxaUO909/L6X3oUjaZ91Y6L51+6Wkti/3glL4zWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7TUs52a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7TUs52a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91AB11F000E9;
	Sun,  9 Aug 2026 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786295909;
	bh=zm72Jk8YJbUwKflSdewaD4AA2Mq78CUnZiw+gSUiT98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=U7TUs52aGQPX+GxxjNiUY/hnfeYOEjjaTUy8OTqME/78lYUUxw72W+5bV87DrVCf7
	 hM43+wtF9at0lXoBU0UEsvmRpaozNd1mKqr34KUfDuJpMHQWvqOeYbGiYkbMf/UP1b
	 tE/Eiw9BOzXQypJgTgrIu9vRFUiHkmx9tGzQQulKbk+bufF1Lbkwl4bAuEfNjiRvZd
	 47VRbpMiTFArc9AXQlCqa2Ud4armNU91zDzrurpEuG97oJqYumhzIw+RXbKR0he0FW
	 Ii9tC01hgE0yRV3oKpY6BztCOy5WtN/R5QvdrLb9l/OzR22iuWAHXEn+/q0V15ERDA
	 c4rsqUAnR8i8w==
Date: Sun, 9 Aug 2026 19:18:24 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Chen Miao <chenmiao.ku@gmail.com>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] docs: sphinx-pre-install: check GNU Make version
Message-ID: <20260809191824.06e6c39e@foz.lan>
In-Reply-To: <20260809101923.13176-3-chenmiao.ku@gmail.com>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
	<20260809101923.13176-3-chenmiao.ku@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun,  9 Aug 2026 18:19:21 +0800
Chen Miao <chenmiao.ku@gmail.com> wrote:

> The kernel documentation build requires GNU Make 4.0 or newer, but the
> Sphinx dependency checker only verifies that a make executable exists.
> This lets incompatible make implementations pass the check and fail
> later during the build.
>=20
> Check the GNU Make version on all supported systems. If make is missing
> or too old, report it as a missing dependency. Also accept a compatible
> gmake command, which is how Homebrew provides GNU Make on macOS.
>=20
> Document the requirement and the macOS gmake fallback.
>=20
> Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> ---
>  Documentation/doc-guide/sphinx.rst            |  4 +-
>  .../translations/zh_CN/doc-guide/sphinx.rst   |  2 +
>  Documentation/translations/zh_CN/how-to.rst   |  3 +-
>  tools/docs/sphinx-pre-install                 | 52 ++++++++++++++++++-
>  4 files changed, 58 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-guide=
/sphinx.rst
> index 62aca56b8..d9b9e025f 100644
> --- a/Documentation/doc-guide/sphinx.rst
> +++ b/Documentation/doc-guide/sphinx.rst
> @@ -136,7 +136,9 @@ commands are printed without ``sudo``. The PDF depend=
encies are provided by
>  the ``mactex`` cask; use ``--no-pdf`` when only building HTML documentat=
ion.
>  The default virtualenv mode is recommended on macOS because PyYAML is
>  installed from ``Documentation/sphinx/requirements.txt`` rather than fro=
m a
> -Homebrew formula.
> +Homebrew formula. The script also checks for GNU Make 4.0 or newer; when
> +Homebrew provides it as ``gmake``, use ``gmake htmldocs`` instead of
> +``make htmldocs``.
> =20
>  Installing Sphinx Minimal Version
>  ---------------------------------
> diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Docu=
mentation/translations/zh_CN/doc-guide/sphinx.rst
> index 154142318..93f27d35a 100644
> --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> @@ -114,6 +114,8 @@ PDF=E5=92=8CLaTeX=E6=9E=84=E5=BB=BA
>  ``sudo``=E3=80=82PDF =E4=BE=9D=E8=B5=96=E9=80=9A=E8=BF=87 ``mactex`` cas=
k =E6=8F=90=E4=BE=9B=EF=BC=9B=E5=A6=82=E6=9E=9C=E5=8F=AA=E6=9E=84=E5=BB=BA =
HTML =E6=96=87=E6=A1=A3=EF=BC=8C=E8=AF=B7=E4=BD=BF=E7=94=A8
>  ``--no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=BF=
=E7=94=A8=E9=BB=98=E8=AE=A4=E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=
=A2=83=EF=BC=8C=E5=9B=A0=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E
>  ``Documentation/sphinx/requirements.txt`` =E5=AE=89=E8=A3=85=EF=BC=8C=E8=
=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=87 Homebrew =E5=AE=89=E8=A3=85=E3=
=80=82
> +=E8=84=9A=E6=9C=AC=E8=BF=98=E4=BC=9A=E6=A3=80=E6=9F=A5 GNU Make 4.0 =E6=
=88=96=E6=9B=B4=E9=AB=98=E7=89=88=E6=9C=AC=EF=BC=9B=E5=A6=82=E6=9E=9C Homeb=
rew =E5=B0=86=E5=85=B6=E5=AE=89=E8=A3=85=E4=B8=BA ``gmake``=EF=BC=8C
> +=E8=AF=B7=E4=BD=BF=E7=94=A8 ``gmake htmldocs``=EF=BC=8C=E8=80=8C=E4=B8=
=8D=E6=98=AF ``make htmldocs``=E3=80=82
> =20
>  Sphinx=E6=9E=84=E5=BB=BA
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentation/=
translations/zh_CN/how-to.rst
> index e8c91d81a..84f277124 100644
> --- a/Documentation/translations/zh_CN/how-to.rst
> +++ b/Documentation/translations/zh_CN/how-to.rst
> @@ -106,7 +106,8 @@ Linux =E5=8F=91=E8=A1=8C=E7=89=88=E5=92=8C=E7=AE=80=
=E5=8D=95=E5=9C=B0=E4=BD=BF=E7=94=A8 Linux =E5=91=BD=E4=BB=A4=E8=A1=8C=EF=
=BC=8C=E9=82=A3=E4=B9=88=E5=8F=AF=E4=BB=A5=E8=BF=85=E9=80=9F=E5=BC=80=E5=A7=
=8B=E4=BA=86
>  sudo=E3=80=82PDF =E6=9E=84=E5=BB=BA=E6=89=80=E9=9C=80=E7=9A=84 MacTeX =
=E9=80=9A=E8=BF=87 Homebrew cask =E5=AE=89=E8=A3=85=EF=BC=9B=E5=A6=82=E6=9E=
=9C=E5=8F=AA=E6=9E=84=E5=BB=BA HTML =E6=96=87=E6=A1=A3=EF=BC=8C
>  =E5=8F=AF=E4=BB=A5=E6=89=A7=E8=A1=8C ``./tools/docs/sphinx-pre-install -=
-no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=BF=E7=94=
=A8=E9=BB=98=E8=AE=A4
>  =E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=9B=A0=
=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E ``Documentation/sphinx/requirements.txt=
``
> -=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=87=
 Homebrew =E5=AE=89=E8=A3=85=E3=80=82
> +=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=87=
 Homebrew =E5=AE=89=E8=A3=85=E3=80=82=E8=84=9A=E6=9C=AC=E8=BF=98=E4=BC=9A=
=E6=A3=80=E6=9F=A5 GNU Make 4.0 =E6=88=96=E6=9B=B4=E9=AB=98=E7=89=88=E6=9C=
=AC=EF=BC=9B=E5=A6=82=E6=9E=9C
> +Homebrew =E5=B0=86=E5=85=B6=E5=AE=89=E8=A3=85=E4=B8=BA ``gmake``=EF=BC=
=8C=E8=AF=B7=E4=BD=BF=E7=94=A8 ``gmake htmldocs``=EF=BC=8C=E8=80=8C=E4=B8=
=8D=E6=98=AF ``make htmldocs``=E3=80=82
> =20
>  =E5=A6=82=E6=9E=9C=E6=82=A8=E5=A4=84=E4=BA=8E=E4=B8=80=E4=B8=AA=E5=A4=9A=
=E7=94=A8=E6=88=B7=E7=8E=AF=E5=A2=83=E4=B8=AD=EF=BC=8C=E4=B8=BA=E4=BA=86=E9=
=81=BF=E5=85=8D=E5=AF=B9=E5=85=B6=E4=BB=96=E4=BA=BA=E9=80=A0=E6=88=90=E5=BD=
=B1=E5=93=8D=EF=BC=8C=E5=BB=BA=E8=AE=AE=E6=82=A8=E9=85=8D=E7=BD=AE=E5=8D=95=
=E7=94=A8=E6=88=B7
>  sphinx =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=8D=B3=E5=8F=AA=
=E9=9C=80=E8=A6=81=E6=89=A7=E8=A1=8C::
> diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-install
> index 51a296cc7..079655078 100755
> --- a/tools/docs/sphinx-pre-install
> +++ b/tools/docs/sphinx-pre-install
> @@ -40,6 +40,7 @@ from kdoc.python_version import PythonVersion
> =20
>  RECOMMENDED_VERSION =3D PythonVersion("3.4.3").version
>  MIN_PYTHON_VERSION =3D PythonVersion("3.7").version
> +MIN_MAKE_VERSION =3D PythonVersion("4.0").version
> =20
> =20
>  class DepManager:
> @@ -308,6 +309,55 @@ class MissingCheckers(AncillaryMethods):
> =20
>          return None
> =20
> +    def get_make_version(self, cmd):
> +        """Get the GNU Make version, or None if cmd is not GNU Make."""
> +        if not cmd:
> +            return None
> +
> +        try:
> +            result =3D self.run(
> +                [cmd, "--version"],
> +                capture_output=3DTrue,
> +                text=3DTrue,
> +                check=3DTrue,
> +            )
> +        except (subprocess.CalledProcessError, FileNotFoundError):
> +            return None
> +
> +        match =3D re.search(
> +            r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MULT=
ILINE
> +        )
> +        if not match:
> +            return None
> +
> +        return PythonVersion.parse_version(match.group(1))
> +
> +    def check_make(self):
> +        """Check for GNU Make 4.0 or newer."""
> +        make =3D self.which("make")
> +        version =3D self.get_make_version(make)

I would invert the check: test first for "gmake", and then for "make".

Lots of Linux distros have an alias for gmake, like on Fedora:

	lrwxrwxrwx 1 root root        4 Apr 24 21:33 /usr/bin/gmake -> make
	-rwxr-xr-x 1 root root   287384 Apr 24 21:33 /usr/bin/make

Yet, I would do it on a different way:

	make =3D self.which("gmake")
	if not make:
		make =3D self.which("make")

	version =3D self.get_make_version(make)

This should simplify the code a little bit.

> +
> +        if version and version >=3D MIN_MAKE_VERSION:
> +            return
> +
> +        # macOS commonly has an incompatible /usr/bin/make, while Homebr=
ew
> +        # installs GNU Make as gmake. Also accept gmake on other systems=
 when
> +        # it is the only compatible command available.
> +        gmake =3D self.which("gmake")
> +        gmake_version =3D self.get_make_version(gmake)
> +        if gmake_version and gmake_version >=3D MIN_MAKE_VERSION:
> +            make_name =3D os.path.basename(make) if make else "make"
> +            gmake_name =3D os.path.basename(gmake)
> +            make_ver =3D PythonVersion.ver_str(version) if version else =
"unknown"
> +            gmake_ver =3D PythonVersion.ver_str(gmake_version)
> +            print(
> +                f"Note: {make_name} ({make_ver}) does not meet the GNU M=
ake "
> +                f"requirement; use {gmake_name} ({gmake_ver}) instead."
> +            )
> +            return

With that, you probably can remove most of the above.

Btw, you likely need to teach tools/docs/sphinx-build-wrapper
to also consider gmake binary, as it can run make internally
to generate info and Rust docs.

Thanks,
Mauro
