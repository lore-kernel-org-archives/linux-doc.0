Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32004276046;
	Wed, 14 Jan 2026 20:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768420820; cv=none; b=RwRCbFF3d+/uOVhyCBLDD5YT5sSJ1eRxGC40ACEQ7s0BJ2DDI97GlCW3gpR8krZQgg0QZ4ifpwKvAJ7uINhjB9TE0ypB82Rg3BnejQhXXWDTCrGzYOEs5ElJKeGDBTr/nNNXimeyy5KAKMl1CmB5vg/oVihiES36PIm9WUE5g4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768420820; c=relaxed/simple;
	bh=7AZwJMYBgCpkjvalyMFp5H/xJSXeJj7Ycb44Bu8yVvk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=px5Ex01I2rE5uKXWhxAQMINR5NVODfrBLGEKTcz7b9MbzOvxCv7BYyUWgtP6rQGQGiVtbou8tho09E6OrgXnyx7OV1bkZ1XTEg/x67sX2t5TaAuWOp5mDXvlZgRnlTVXKsyrMl/dnTAm6wVosFe7pxelnIjDeG7k3m541JmCvuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uh8pCOmc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uh8pCOmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33673C4CEF7;
	Wed, 14 Jan 2026 20:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768420819;
	bh=7AZwJMYBgCpkjvalyMFp5H/xJSXeJj7Ycb44Bu8yVvk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uh8pCOmc5RRc7yxN0MQlernjkcgzyAKTmS12iF9nmRJXqWUAF2qWWX25LmpEXKrL8
	 Qy+eexZ9wZ+eWwzWwMRxZ0vmUsEgHz2FmovIDiOdX0jAvXxwI49xYQOxrpsOOAEuWi
	 UUUU6sbAnV5azaJAx4yzNOvR2OWmqgwCNjFY4cDRstHDy5gmnbyajkLZ9VpuZlIlpS
	 FM6UaBux7ZkHvPxXaPbtSyGsg9wuHnnQ7Mexx4kSjkOrl36i8HHKkvF1gB6PLOGGq9
	 52GWVaemng0+3ItH3slYh/OgQgdhsErfLS2Y1dLFo9R/7pYZncHjorRfg5Dsq6NQ4w
	 BUHxt21Lr8dkg==
Date: Wed, 14 Jan 2026 21:00:15 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>, Jani Nikula
 <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 2/2] Move kernel-doc to tools/docs
Message-ID: <20260114210015.6494c0ca@foz.lan>
In-Reply-To: <20260114164146.532916-3-corbet@lwn.net>
References: <20260114164146.532916-1-corbet@lwn.net>
	<20260114164146.532916-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 14 Jan 2026 09:41:44 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> kernel-doc is the last documentation-related tool still living outside of
> the tools/docs directory; the time has come to move it over.
>=20
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/conf.py                                  |  2 +-
>  Documentation/doc-guide/kernel-doc.rst                 |  8 ++++----
>  Documentation/kbuild/kbuild.rst                        |  2 +-
>  Documentation/process/coding-style.rst                 |  2 +-
>  .../translations/it_IT/doc-guide/kernel-doc.rst        |  8 ++++----
>  .../translations/sp_SP/process/coding-style.rst        |  2 +-
>  .../translations/zh_CN/doc-guide/kernel-doc.rst        | 10 +++++-----
>  Documentation/translations/zh_CN/kbuild/kbuild.rst     |  2 +-
>  .../translations/zh_CN/process/coding-style.rst        |  2 +-
>  .../translations/zh_TW/process/coding-style.rst        |  2 +-
>  MAINTAINERS                                            |  2 --
>  Makefile                                               |  2 +-
>  drivers/gpu/drm/i915/Makefile                          |  2 +-
>  scripts/kernel-doc                                     |  1 -
>  tools/docs/find-unused-docs.sh                         |  2 +-
>  scripts/kernel-doc.py =3D> tools/docs/kernel-doc         |  0

Since we're doing renames anyway, why don't you call it
tools/docs/kernel_doc.py? I would prefer to stick with PEP8 names
for all python scripts as part of the coding style.=20

The rationale is that Sphinx autodoc doesn't support non-PEP8 includes.
If one tries to do:

	diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-gu=
ide/kernel-doc.rst
	index b56128d7f5c3..7a40b0bf36d1 100644
	--- a/Documentation/doc-guide/kernel-doc.rst
	+++ b/Documentation/doc-guide/kernel-doc.rst
	@@ -624,3 +624,11 @@ using SPHINXDIRS:
=20
	    When SPHINXDIRS=3D{subdir} is used, it will only generate man pages for
	    the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` fil=
e.
	+
	+kernel\-doc module documentation
	+--------------------------------
	+
	+.. automodule:: kernel-doc
	+   :members:
	+   :show-inheritance:
	+   :undoc-members:

Sphinx refuses to document it with:

	WARNING: invalid signature for automodule ('kernel-doc') [autodoc]
	WARNING: don't know which module to import for autodocumenting 'kernel-doc=
' (try placing a "module" or "currentmodule" directive in the document, or =
giving an explicit module name) [autodoc]

because of "-" instead of "_".

Doing:

	diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-gu=
ide/kernel-doc.rst
	index b56128d7f5c3..666851a63af6 100644
	--- a/Documentation/doc-guide/kernel-doc.rst
	+++ b/Documentation/doc-guide/kernel-doc.rst
	@@ -624,3 +624,11 @@ using SPHINXDIRS:
=20
	    When SPHINXDIRS=3D{subdir} is used, it will only generate man pages for
	    the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` fil=
e.
	+
	+kernel\-doc module documentation
	+--------------------------------
	+
	+.. automodule:: docs.kernel_doc
	+   :members:
	+   :show-inheritance:
	+   :undoc-members:
	diff --git a/scripts/kernel-doc b/scripts/kernel-doc
	deleted file mode 120000
	index 3b6ef807791a..000000000000
	--- a/scripts/kernel-doc
	+++ /dev/null
	@@ -1 +0,0 @@
	-kernel-doc.py
	\ No newline at end of file
	diff --git a/scripts/kernel-doc.py b/tools/docs/kernel_doc.py
	similarity index 100%
	rename from scripts/kernel-doc.py
	rename to tools/docs/kernel_doc.py

e.g. using underlines and ending with .py works just fine (after
applying my series adding support for sphinx.ext.autodoc.

>  tools/docs/sphinx-build-wrapper                        |  2 +-
>  17 files changed, 24 insertions(+), 27 deletions(-)
>  delete mode 120000 scripts/kernel-doc
>  rename scripts/kernel-doc.py =3D> tools/docs/kernel-doc (100%)
>=20
> diff --git a/Documentation/conf.py b/Documentation/conf.py
> index 1ea2ae5c6276c..383d5e5b9d0af 100644
> --- a/Documentation/conf.py
> +++ b/Documentation/conf.py
> @@ -582,7 +582,7 @@ pdf_documents =3D [
>  # kernel-doc extension configuration for running Sphinx directly (e.g. b=
y Read
>  # the Docs). In a normal build, these are supplied from the Makefile via=
 command
>  # line arguments.
> -kerneldoc_bin =3D "../scripts/kernel-doc.py"
> +kerneldoc_bin =3D "../tools/docs/kernel-doc"  # Not used now

Better to drop it.

>  kerneldoc_srctree =3D ".."
> =20
>  def setup(app):
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-g=
uide/kernel-doc.rst
> index b56128d7f5c3a..8d2c09fb36e4d 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -54,7 +54,7 @@ Running the ``kernel-doc`` tool with increased verbosit=
y and without actual
>  output generation may be used to verify proper formatting of the
>  documentation comments. For example::
> =20
> -	scripts/kernel-doc -v -none drivers/foo/bar.c
> +	tools/docs/kernel-doc -v -none drivers/foo/bar.c
> =20
>  The documentation format of ``.c`` files is also verified by the kernel =
build
>  when it is requested to perform extra gcc checks::
> @@ -365,7 +365,7 @@ differentiated by whether the macro name is immediate=
ly followed by a
>  left parenthesis ('(') for function-like macros or not followed by one
>  for object-like macros.
> =20
> -Function-like macros are handled like functions by ``scripts/kernel-doc`=
`.
> +Function-like macros are handled like functions by ``tools/docs/kernel-d=
oc``.
>  They may have a parameter list. Object-like macros have do not have a
>  parameter list.
> =20
> @@ -596,8 +596,8 @@ from the source file.
> =20
>  The kernel-doc extension is included in the kernel source tree, at
>  ``Documentation/sphinx/kerneldoc.py``. Internally, it uses the
> -``scripts/kernel-doc`` script to extract the documentation comments from=
 the
> -source.
> +``tools/docs/kernel-doc`` script to extract the documentation comments f=
rom
> +the source.
> =20
>  .. _kernel_doc:
> =20
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuil=
d.rst
> index 82826b0332df4..5a9013bacfb75 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -180,7 +180,7 @@ architecture.
>  KDOCFLAGS
>  ---------
>  Specify extra (warning/error) flags for kernel-doc checks during the bui=
ld,
> -see scripts/kernel-doc for which flags are supported. Note that this doe=
sn't
> +see tools/docs/kernel-doc for which flags are supported. Note that this =
doesn't
>  (currently) apply to documentation builds.
> =20
>  ARCH
> diff --git a/Documentation/process/coding-style.rst b/Documentation/proce=
ss/coding-style.rst
> index 258158637f654..35b381230f6e4 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -614,7 +614,7 @@ it.
> =20
>  When commenting the kernel API functions, please use the kernel-doc form=
at.
>  See the files at :ref:`Documentation/doc-guide/ <doc_guide>` and
> -``scripts/kernel-doc`` for details. Note that the danger of over-comment=
ing
> +``tools/docs/kernel-doc`` for details. Note that the danger of over-comm=
enting
>  applies to kernel-doc comments all the same. Do not add boilerplate
>  kernel-doc which simply reiterates what's obvious from the signature
>  of the function.
> diff --git a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst b/=
Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> index aa0e31d353d6f..bac959b8b7b96 100644
> --- a/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> +++ b/Documentation/translations/it_IT/doc-guide/kernel-doc.rst
> @@ -80,7 +80,7 @@ Al fine di verificare che i commenti siano formattati c=
orrettamente, potete
>  eseguire il programma ``kernel-doc`` con un livello di verbosit=C3=A0 al=
to e senza
>  che questo produca alcuna documentazione. Per esempio::
> =20
> -	scripts/kernel-doc -v -none drivers/foo/bar.c
> +	tools/docs/kernel-doc -v -none drivers/foo/bar.c
> =20
>  Il formato della documentazione =C3=A8 verificato della procedura di gen=
erazione
>  del kernel quando viene richiesto di effettuare dei controlli extra con =
GCC::
> @@ -378,7 +378,7 @@ distinguono in base al fatto che il nome della macro =
simile a funzione sia
>  immediatamente seguito da una parentesi sinistra ('(') mentre in quelle =
simili a
>  oggetti no.
> =20
> -Le macro simili a funzioni sono gestite come funzioni da ``scripts/kerne=
l-doc``.
> +Le macro simili a funzioni sono gestite come funzioni da ``tools/docs/ke=
rnel-doc``.
>  Possono avere un elenco di parametri. Le macro simili a oggetti non hann=
o un
>  elenco di parametri.
> =20
> @@ -595,7 +595,7 @@ documentazione presenti nel file sorgente (*source*).
> =20
>  L'estensione kernel-doc fa parte dei sorgenti del kernel, la si pu=C3=B2=
 trovare
>  in ``Documentation/sphinx/kerneldoc.py``. Internamente, viene utilizzato
> -lo script ``scripts/kernel-doc`` per estrarre i commenti di documentazio=
ne
> +lo script ``tools/docs/kernel-doc`` per estrarre i commenti di documenta=
zione
>  dai file sorgenti.
> =20
>  Come utilizzare kernel-doc per generare pagine man
> @@ -604,4 +604,4 @@ Come utilizzare kernel-doc per generare pagine man
>  Se volete utilizzare kernel-doc solo per generare delle pagine man, pote=
te
>  farlo direttamente dai sorgenti del kernel::
> =20
> -  $ scripts/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation :^t=
ools) | scripts/split-man.pl /tmp/man
> +  $ tools/docs/kernel-doc -man $(git grep -l '/\*\*' -- :^Documentation =
:^tools) | scripts/split-man.pl /tmp/man
> diff --git a/Documentation/translations/sp_SP/process/coding-style.rst b/=
Documentation/translations/sp_SP/process/coding-style.rst
> index 025223be9706d..7d63aa8426e63 100644
> --- a/Documentation/translations/sp_SP/process/coding-style.rst
> +++ b/Documentation/translations/sp_SP/process/coding-style.rst
> @@ -633,7 +633,7 @@ posiblemente POR QU=C3=89 hace esto.
> =20
>  Al comentar las funciones de la API del kernel, utilice el formato
>  kernel-doc. Consulte los archivos en :ref:`Documentation/doc-guide/ <doc=
_guide>`
> -y ``scripts/kernel-doc`` para m=C3=A1s detalles.
> +y ``tools/docs/kernel-doc`` para m=C3=A1s detalles.
> =20
>  El estilo preferido para comentarios largos (de varias l=C3=ADneas) es:
> =20
> diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/=
Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> index ccfb9b8329c23..fb2bbaaa85c18 100644
> --- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> +++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
> @@ -43,7 +43,7 @@ kernel-doc=E6=B3=A8=E9=87=8A=E7=94=A8 ``/**`` =E4=BD=9C=
=E4=B8=BA=E5=BC=80=E5=A7=8B=E6=A0=87=E8=AE=B0=E3=80=82 ``kernel-doc`` =E5=
=B7=A5=E5=85=B7=E5=B0=86=E6=8F=90=E5=8F=96
>  =E7=94=A8=E8=AF=A6=E7=BB=86=E6=A8=A1=E5=BC=8F=E5=92=8C=E4=B8=8D=E7=94=9F=
=E6=88=90=E5=AE=9E=E9=99=85=E8=BE=93=E5=87=BA=E6=9D=A5=E8=BF=90=E8=A1=8C ``=
kernel-doc`` =E5=B7=A5=E5=85=B7=EF=BC=8C=E5=8F=AF=E4=BB=A5=E9=AA=8C=E8=AF=
=81=E6=96=87=E6=A1=A3=E6=B3=A8=E9=87=8A=E7=9A=84=E6=A0=BC=E5=BC=8F
>  =E6=98=AF=E5=90=A6=E6=AD=A3=E7=A1=AE=E3=80=82=E4=BE=8B=E5=A6=82::
> =20
> -	scripts/kernel-doc -v -none drivers/foo/bar.c
> +	tools/docs/kernel-doc -v -none drivers/foo/bar.c
> =20
>  =E5=BD=93=E8=AF=B7=E6=B1=82=E6=89=A7=E8=A1=8C=E9=A2=9D=E5=A4=96=E7=9A=84=
gcc=E6=A3=80=E6=9F=A5=E6=97=B6=EF=BC=8C=E5=86=85=E6=A0=B8=E6=9E=84=E5=BB=BA=
=E5=B0=86=E9=AA=8C=E8=AF=81=E6=96=87=E6=A1=A3=E6=A0=BC=E5=BC=8F::
> =20
> @@ -473,7 +473,7 @@ doc: *title*
>  =E5=A6=82=E6=9E=9C=E6=B2=A1=E6=9C=89=E9=80=89=E9=A1=B9=EF=BC=8Ckernel-do=
c=E6=8C=87=E4=BB=A4=E5=B0=86=E5=8C=85=E5=90=AB=E6=BA=90=E6=96=87=E4=BB=B6=
=E4=B8=AD=E7=9A=84=E6=89=80=E6=9C=89=E6=96=87=E6=A1=A3=E6=B3=A8=E9=87=8A=E3=
=80=82
> =20
>  kernel-doc=E6=89=A9=E5=B1=95=E5=8C=85=E5=90=AB=E5=9C=A8=E5=86=85=E6=A0=
=B8=E6=BA=90=E4=BB=A3=E7=A0=81=E6=A0=91=E4=B8=AD=EF=BC=8C=E4=BD=8D=E4=BA=8E=
 ``Documentation/sphinx/kerneldoc.py`` =E3=80=82
> -=E5=9C=A8=E5=86=85=E9=83=A8=EF=BC=8C=E5=AE=83=E4=BD=BF=E7=94=A8 ``script=
s/kernel-doc`` =E8=84=9A=E6=9C=AC=E4=BB=8E=E6=BA=90=E4=BB=A3=E7=A0=81=E4=B8=
=AD=E6=8F=90=E5=8F=96=E6=96=87=E6=A1=A3=E6=B3=A8=E9=87=8A=E3=80=82
> +=E5=9C=A8=E5=86=85=E9=83=A8=EF=BC=8C=E5=AE=83=E4=BD=BF=E7=94=A8 ``tools/=
docs/kernel-doc`` =E8=84=9A=E6=9C=AC=E4=BB=8E=E6=BA=90=E4=BB=A3=E7=A0=81=E4=
=B8=AD=E6=8F=90=E5=8F=96=E6=96=87=E6=A1=A3=E6=B3=A8=E9=87=8A=E3=80=82
> =20
>  .. _kernel_doc_zh:
> =20
> @@ -482,18 +482,18 @@ kernel-doc=E6=89=A9=E5=B1=95=E5=8C=85=E5=90=AB=E5=
=9C=A8=E5=86=85=E6=A0=B8=E6=BA=90=E4=BB=A3=E7=A0=81=E6=A0=91=E4=B8=AD=EF=BC=
=8C=E4=BD=8D=E4=BA=8E ``Documentation/sphinx/k
> =20
>  =E5=A6=82=E6=9E=9C=E6=82=A8=E5=8F=AA=E6=83=B3=E4=BD=BF=E7=94=A8kernel-do=
c=E7=94=9F=E6=88=90=E6=89=8B=E5=86=8C=E9=A1=B5=EF=BC=8C=E5=8F=AF=E4=BB=A5=
=E4=BB=8E=E5=86=85=E6=A0=B8git=E6=A0=91=E8=BF=99=E6=A0=B7=E5=81=9A::
> =20
> -  $ scripts/kernel-doc -man \
> +  $ tools/docs/kernel-doc -man \
>      $(git grep -l '/\*\*' -- :^Documentation :^tools) \
>      | scripts/split-man.pl /tmp/man
> =20
>  =E4=B8=80=E4=BA=9B=E6=97=A7=E7=89=88=E6=9C=AC=E7=9A=84git=E4=B8=8D=E6=94=
=AF=E6=8C=81=E8=B7=AF=E5=BE=84=E6=8E=92=E9=99=A4=E8=AF=AD=E6=B3=95=E7=9A=84=
=E6=9F=90=E4=BA=9B=E5=8F=98=E4=BD=93=E3=80=82
>  =E4=BB=A5=E4=B8=8B=E5=91=BD=E4=BB=A4=E4=B9=8B=E4=B8=80=E5=8F=AF=E8=83=BD=
=E9=80=82=E7=94=A8=E4=BA=8E=E8=BF=99=E4=BA=9B=E7=89=88=E6=9C=AC::
> =20
> -  $ scripts/kernel-doc -man \
> +  $ tools/docs/kernel-doc -man \
>      $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
>      | scripts/split-man.pl /tmp/man
> =20
> -  $ scripts/kernel-doc -man \
> +  $ tools/docs/kernel-doc -man \
>      $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tool=
s") \
>      | scripts/split-man.pl /tmp/man
> =20
> diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Documen=
tation/translations/zh_CN/kbuild/kbuild.rst
> index 57f5cf5b2cddb..a477b4b089585 100644
> --- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
> +++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> @@ -174,7 +174,7 @@ UTS_MACHINE =E5=8F=98=E9=87=8F=EF=BC=88=E5=9C=A8=E6=
=9F=90=E4=BA=9B=E6=9E=B6=E6=9E=84=E4=B8=AD=E8=BF=98=E5=8C=85=E6=8B=AC=E5=86=
=85=E6=A0=B8=E9=85=8D=E7=BD=AE=EF=BC=89=E6=9D=A5=E7=8C=9C=E6=B5=8B=E6=AD=A3=
=E7=A1=AE
>  KDOCFLAGS
>  ---------
>  =E6=8C=87=E5=AE=9A=E5=9C=A8=E6=9E=84=E5=BB=BA=E8=BF=87=E7=A8=8B=E4=B8=AD=
=E7=94=A8=E4=BA=8E kernel-doc =E6=A3=80=E6=9F=A5=E7=9A=84=E9=A2=9D=E5=A4=96=
=EF=BC=88=E8=AD=A6=E5=91=8A/=E9=94=99=E8=AF=AF=EF=BC=89=E6=A0=87=E5=BF=97=
=EF=BC=8C=E6=9F=A5=E7=9C=8B
> -scripts/kernel-doc =E4=BA=86=E8=A7=A3=E6=94=AF=E6=8C=81=E7=9A=84=E6=A0=
=87=E5=BF=97=E3=80=82=E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=99=E7=9B=AE=
=E5=89=8D=E4=B8=8D=E9=80=82=E7=94=A8=E4=BA=8E=E6=96=87=E6=A1=A3=E6=9E=84=E5=
=BB=BA=E3=80=82
> +tools/docs/kernel-doc =E4=BA=86=E8=A7=A3=E6=94=AF=E6=8C=81=E7=9A=84=E6=
=A0=87=E5=BF=97=E3=80=82=E8=AF=B7=E6=B3=A8=E6=84=8F=EF=BC=8C=E8=BF=99=E7=9B=
=AE=E5=89=8D=E4=B8=8D=E9=80=82=E7=94=A8=E4=BA=8E=E6=96=87=E6=A1=A3=E6=9E=84=
=E5=BB=BA=E3=80=82
> =20
>  ARCH
>  ----
> diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/=
Documentation/translations/zh_CN/process/coding-style.rst
> index 0484d0c65c25b..5a342a024c01e 100644
> --- a/Documentation/translations/zh_CN/process/coding-style.rst
> +++ b/Documentation/translations/zh_CN/process/coding-style.rst
> @@ -545,7 +545,7 @@ Linux =E9=87=8C=E8=BF=99=E6=98=AF=E6=8F=90=E5=80=A1=
=E7=9A=84=E5=81=9A=E6=B3=95=EF=BC=8C=E5=9B=A0=E4=B8=BA=E8=BF=99=E6=A0=B7=E5=
=8F=AF=E4=BB=A5=E5=BE=88=E7=AE=80=E5=8D=95=E7=9A=84=E7=BB=99=E8=AF=BB=E8=80=
=85=E6=8F=90=E4=BE=9B
>  =E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=8A=A0=E4=B8=8A=E5=AE=83=E5=81=9A=E8=BF=99=
=E4=BA=9B=E4=BA=8B=E6=83=85=E7=9A=84=E5=8E=9F=E5=9B=A0=E3=80=82
> =20
>  =E5=BD=93=E6=B3=A8=E9=87=8A=E5=86=85=E6=A0=B8 API =E5=87=BD=E6=95=B0=E6=
=97=B6=EF=BC=8C=E8=AF=B7=E4=BD=BF=E7=94=A8 kernel-doc =E6=A0=BC=E5=BC=8F=E3=
=80=82=E8=AF=A6=E8=A7=81
> -Documentation/translations/zh_CN/doc-guide/index.rst =E5=92=8C scripts/k=
ernel-doc =E3=80=82
> +Documentation/translations/zh_CN/doc-guide/index.rst =E5=92=8C tools/doc=
s/kernel-doc =E3=80=82
> =20
>  =E9=95=BF (=E5=A4=9A=E8=A1=8C) =E6=B3=A8=E9=87=8A=E7=9A=84=E9=A6=96=E9=
=80=89=E9=A3=8E=E6=A0=BC=E6=98=AF=EF=BC=9A
> =20
> diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/=
Documentation/translations/zh_TW/process/coding-style.rst
> index 311c6f6bad0bc..e2ba97b3d8bbf 100644
> --- a/Documentation/translations/zh_TW/process/coding-style.rst
> +++ b/Documentation/translations/zh_TW/process/coding-style.rst
> @@ -548,7 +548,7 @@ Linux =E8=A3=8F=E9=80=99=E6=98=AF=E6=8F=90=E5=80=A1=
=E7=9A=84=E5=81=9A=E6=B3=95=EF=BC=8C=E5=9B=A0=E7=88=B2=E9=80=99=E6=A8=A3=E5=
=8F=AF=E4=BB=A5=E5=BE=88=E7=B0=A1=E5=96=AE=E7=9A=84=E7=B5=A6=E8=AE=80=E8=80=
=85=E6=8F=90=E4=BE=9B
>  =E4=B9=9F=E5=8F=AF=E4=BB=A5=E5=8A=A0=E4=B8=8A=E5=AE=83=E5=81=9A=E9=80=99=
=E4=BA=9B=E4=BA=8B=E6=83=85=E7=9A=84=E5=8E=9F=E5=9B=A0=E3=80=82
> =20
>  =E7=95=B6=E8=A8=BB=E9=87=8B=E5=85=A7=E6=A0=B8 API =E5=87=BD=E6=95=B8=E6=
=99=82=EF=BC=8C=E8=AB=8B=E4=BD=BF=E7=94=A8 kernel-doc =E6=A0=BC=E5=BC=8F=E3=
=80=82=E8=A9=B3=E8=A6=8B
> -Documentation/translations/zh_CN/doc-guide/index.rst =E5=92=8C scripts/k=
ernel-doc =E3=80=82
> +Documentation/translations/zh_CN/doc-guide/index.rst =E5=92=8C tools/doc=
s/kernel-doc =E3=80=82
> =20
>  =E9=95=B7 (=E5=A4=9A=E8=A1=8C) =E8=A8=BB=E9=87=8B=E7=9A=84=E9=A6=96=E9=
=81=B8=E9=A2=A8=E6=A0=BC=E6=98=AF=EF=BC=9A
> =20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e03e33bd33b83..8ea68e7c2fa7a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7522,7 +7522,6 @@ S:	Maintained
>  P:	Documentation/doc-guide/maintainer-profile.rst
>  T:	git git://git.lwn.net/linux.git docs-next
>  F:	Documentation/
> -F:	scripts/kernel-doc*
>  F:	tools/lib/python/*
>  F:	tools/docs/
>  F:	tools/net/ynl/pyynl/lib/doc_generator.py
> @@ -7559,7 +7558,6 @@ M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-doc@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/sphinx/
> -F:	scripts/kernel-doc*
>  F:	tools/lib/python/*
>  F:	tools/docs/
> =20
> diff --git a/Makefile b/Makefile
> index 3cd00b62cde99..81a4ab11256ce 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -460,7 +460,7 @@ HOSTPKG_CONFIG	=3D pkg-config
> =20
>  # the KERNELDOC macro needs to be exported, as scripts/Makefile.build
>  # has a logic to call it
> -KERNELDOC       =3D $(srctree)/scripts/kernel-doc.py
> +KERNELDOC       =3D $(srctree)/tools/docs/kernel-doc
>  export KERNELDOC
> =20
>  KBUILD_USERHOSTCFLAGS :=3D -Wall -Wmissing-prototypes -Wstrict-prototype=
s \
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 4db24050edb0e..c979c579de66f 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -443,7 +443,7 @@ always-$(CONFIG_DRM_I915_WERROR) +=3D \
> =20
>  quiet_cmd_hdrtest =3D HDRTEST $(patsubst %.hdrtest,%.h,$@)
>        cmd_hdrtest =3D $(CC) $(filter-out $(CFLAGS_GCOV), $(c_flags)) -S =
-o /dev/null -x c /dev/null -include $<; \
> -		$(srctree)/scripts/kernel-doc -none -Werror $<; touch $@
> +		$(KERNELDOC) -none -Werror $<; touch $@
> =20
>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>  	$(call if_changed_dep,hdrtest)
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> deleted file mode 120000
> index 3b6ef807791a2..0000000000000
> --- a/scripts/kernel-doc
> +++ /dev/null
> @@ -1 +0,0 @@
> -kernel-doc.py
> \ No newline at end of file
> diff --git a/tools/docs/find-unused-docs.sh b/tools/docs/find-unused-docs=
.sh
> index ca4e607ec3f72..53514c759dc1b 100755
> --- a/tools/docs/find-unused-docs.sh
> +++ b/tools/docs/find-unused-docs.sh
> @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
>  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
>  	continue;
>  	fi
> -	str=3D$(PYTHONDONTWRITEBYTECODE=3D1 scripts/kernel-doc -export "$file" =
2>/dev/null)
> +	str=3D$(PYTHONDONTWRITEBYTECODE=3D1 tools/docs/kernel-doc -export "$fil=
e" 2>/dev/null)
>  	if [[ -n "$str" ]]; then
>  	echo "$file"
>  	fi
> diff --git a/scripts/kernel-doc.py b/tools/docs/kernel-doc
> similarity index 100%
> rename from scripts/kernel-doc.py
> rename to tools/docs/kernel-doc
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wr=
apper
> index 7a5fcef254297..cb2a5005e633f 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -246,7 +246,7 @@ class SphinxBuilder:
>          #
>          self.sphinxbuild =3D os.environ.get("SPHINXBUILD", "sphinx-build=
")
>          self.kerneldoc =3D self.get_path(os.environ.get("KERNELDOC",
> -                                                      "scripts/kernel-do=
c.py"))
> +                                                      "tools/docs/kernel=
-doc"))
>          self.builddir =3D self.get_path(builddir, use_cwd=3DTrue, abs_pa=
th=3DTrue)
> =20
>          #



Thanks,
Mauro
