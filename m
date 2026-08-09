Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC68F3B0AEA
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302741; cv=pass; b=auwzk04jxIMRqY12DLkx5XnuXbmy72fa36WTRJTYlSl8xKNNCSb6MbCuEKXvNXYGu51n6H109GEmZ4Gk2/SQpcKEu0FUGpjzcZY7URVKZo0kH168YFJBZ3tZxDU+ChUN572/eDgCcv7Mfe7EFZrNaEc9+YvrGo81gQsFGHRROMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302741; c=relaxed/simple;
	bh=VsZOaRmZ2smqm4OiXWgy0m1IvsXzPKlunisnyucPJzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgOxCHm3oQiFz/UZrHgLK4TgDfZQm8wg13pZedzUFXeCI3vC8L33X0aBSg3zRnj+pYqEaAKBpHu6dLBsQ6bTMGIfKc24ePpfrnncQNYKgEbAlpLv7bNb1CBGsAnO9vfkqRTqjuw1lBY9EdsJ7bBxaxx37Kagta1fCLHwA2PBayQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWomdiAa; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWomdiAa"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2808dbc3so7132211cf.1
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 12:12:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786302736; cv=none;
        d=google.com; s=arc-20260327;
        b=QjHlRug9XCLno50FWD6OCYFC1sPEKzyJqdAJ4V4M7gicclvHql/yX/tKLkfdQxEal5
         VXwjyLJ70NnIqOs7eSCaVRB0CXnbLOwkqvNwastc6fyunpfbElaFwTb7RGWcalOHgfro
         EJMpnBBl+cl0A8xPszqzyRoHrIEp8hWC1X0VeKENRdVwzkD3uGaIBrYXKcuJBCUpC4l0
         dYK/zKCAV+YLsuFJFM6mWwnjksuH7zM+cnNvj8ozakTQ8dEmOkjYaNlwDXtLV4JzWG4F
         Do5U5yH7zRh5gqJco4wLKVPd4/Zkk9QLD45bKlHwkIcZw6vheSiIyi80/EdmaKHOJxFz
         OSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AZLYFacmBYf7Sgf6wHaVMrAXmJQXAImkgTfPkVZZQ9M=;
        fh=n3N8/TM8tyguFWWTlMYNcRe1othKuEokDTXFEqS2eMI=;
        b=qxmdEGKHW7tFi9pfhgwX1c7pMk9xwCOwwtPokD6HCTXiwtJbnQOKIR4TSUH2927Hkx
         LYB3440P85X4LWSiFgb2SZTY+ipihlfeefn6LVSA2l2CI34EmRgwxHqoJHglztto/hdJ
         uDIS/FRmaY/30R2ze/RfY+fTQGagIDDPg0vBhX4+GrRI34TEgnB08DEq27UbPUcMY4nh
         D0deWASxZSdcxoE3FgAlphuh3MNjm8aw4fW2oBib9+T/GNrECipkr9bQEEzDre21dPkL
         hV8P6IjR/w1UQjduiyHXcYOFWx3/JpnnsuC8lNJpy9ZYAWJfMs0mA+r857r2+J5W/OK9
         Hd/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786302736; x=1786907536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AZLYFacmBYf7Sgf6wHaVMrAXmJQXAImkgTfPkVZZQ9M=;
        b=AWomdiAauRGStXPwaz7D/YbmKQfNLyrTRd0FY8IkLrFR407vpaL4S3ogjQvyQHcYpY
         HfrwLxX30CDMTZ/DSOckccchrhnUyHqJmwadICZdQbp/noyqmRNF+OugY9iFN4HOd3Uq
         H0awpnzzywBzZHUT0a+uT8eUs8c1SiK4a80qtLYIuE80ni8jcPO52oCTgBj96u61RwpY
         4A8GkFZ/ehVBSXrK9JwA055u24I8D6ofthTkyONnKXMByRdNSLYBrgZuit5rBfSPnAuF
         SFFxe9wj9edVhj5p5vV57fUveExZJf6Ia5FPWsv7wZLGWNsITvff10OWLMrgr1S+CcmG
         sH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302736; x=1786907536;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AZLYFacmBYf7Sgf6wHaVMrAXmJQXAImkgTfPkVZZQ9M=;
        b=UVbcog6sJO6kGbSDnMSe/L3jlFRgCMgAoE8/uKa2Z/fVfe/MvP+7vLPoqea6HWBM3T
         IPJU9YqtQJzik8SnH3Qo3WfQqA+72671I7UBx4DXkLpRWfcm3HwNn5hZsh70cbtGCc+i
         MZdeoc5a7GuRmkJsEdFtDj5Q/V+jWZ7US2AKVAcfqm0WhijJ+WifDjxqKmgydHtKB8bD
         an+ZhC239YZwByNiJGSqfMrctbChW5WqlBgBzUw2w+B4fG2LymCj7Kd0i7qBuwcTuY/9
         Jd9k48znUU/jcyGL+OSmFx4wJPoSEKAvQKWaXwU2IX+HUHq83k/WXw6bTv9VkMWCc30l
         gbqQ==
X-Forwarded-Encrypted: i=1; AHgh+RoXZQsqs4/ZHss2Wm9sQg0zfxmZO+cpYaL+i2zU8H6QYaekH6xDVigocbDSYnDZztIgEuSchXSFN/I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw8CjosEFJsEcHPBCj+x5zC0Ghe+IzaIAe5RHknOGk1tMMDjys
	ADL4GEjZ8JVaISFB8B6tZLNx3bLvqAIcHrQ7vRuMtTOlxJH5Eqol+pfO5eXdlTKkjWi1Wy9/ALl
	6J0nWnWsWWEzogZXaBQoGW8DTLqOj/Wg=
X-Gm-Gg: AR+sD1373DbRQ24Pk621NCsqHVdA30cV5rP6BrAHgYKl62YEfglAmQt4+ziMgpj7nQD
	Uns0wuwZOKZLxt7N22MdOb4OuKjVAsZoiTJcYVnypXnsW/sIX8m958LmtwiUzhnL/g4v5d3LLcW
	kYp2SDDc+aHM2KFmtB0A/elBtZXgJ3VrTP3VJIxuJEXRWlT3HgdcJYhWVbBWyop7tVkhqnG0j7B
	e8C9n+/1+JoyOytWFHqJ3djDCjIfQzJvi3wrtsQPSOXPr8YA/E/3SqM1Z8DvqK2B6XA/2tNAaD+
	v40Bj/X8yr8egdX3tQfTKWalIoP0XKfuyJK3W6olt0YlxA==
X-Received: by 2002:a05:622b:83:10b0:52d:3d46:bfd0 with SMTP id
 d75a77b69052e-52d3d46c0bdmr23097591cf.32.1786302735935; Sun, 09 Aug 2026
 12:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809101923.13176-1-chenmiao.ku@gmail.com> <20260809101923.13176-3-chenmiao.ku@gmail.com>
 <20260809191824.06e6c39e@foz.lan>
In-Reply-To: <20260809191824.06e6c39e@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Mon, 10 Aug 2026 03:11:39 +0800
X-Gm-Features: AUfX_myYM761FjFMB2_s4V5DAj1nakcFgnLKad2dklpRf2sXsVxV-cd3r8weWbI
Message-ID: <CAKxVwgcOB+GZYQUGzgrX4d7WSE++BKuAySWmi68T5L_mbBpQag@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] docs: sphinx-pre-install: check GNU Make version
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8810=E6=97=A5=E5=91=A8=E4=B8=80 01:18=E5=86=99=E9=81=93=EF=BC=9A
>
> On Sun,  9 Aug 2026 18:19:21 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > The kernel documentation build requires GNU Make 4.0 or newer, but the
> > Sphinx dependency checker only verifies that a make executable exists.
> > This lets incompatible make implementations pass the check and fail
> > later during the build.
> >
> > Check the GNU Make version on all supported systems. If make is missing
> > or too old, report it as a missing dependency. Also accept a compatible
> > gmake command, which is how Homebrew provides GNU Make on macOS.
> >
> > Document the requirement and the macOS gmake fallback.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  Documentation/doc-guide/sphinx.rst            |  4 +-
> >  .../translations/zh_CN/doc-guide/sphinx.rst   |  2 +
> >  Documentation/translations/zh_CN/how-to.rst   |  3 +-
> >  tools/docs/sphinx-pre-install                 | 52 ++++++++++++++++++-
> >  4 files changed, 58 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-gui=
de/sphinx.rst
> > index 62aca56b8..d9b9e025f 100644
> > --- a/Documentation/doc-guide/sphinx.rst
> > +++ b/Documentation/doc-guide/sphinx.rst
> > @@ -136,7 +136,9 @@ commands are printed without ``sudo``. The PDF depe=
ndencies are provided by
> >  the ``mactex`` cask; use ``--no-pdf`` when only building HTML document=
ation.
> >  The default virtualenv mode is recommended on macOS because PyYAML is
> >  installed from ``Documentation/sphinx/requirements.txt`` rather than f=
rom a
> > -Homebrew formula.
> > +Homebrew formula. The script also checks for GNU Make 4.0 or newer; wh=
en
> > +Homebrew provides it as ``gmake``, use ``gmake htmldocs`` instead of
> > +``make htmldocs``.
> >
> >  Installing Sphinx Minimal Version
> >  ---------------------------------
> > diff --git a/Documentation/translations/zh_CN/doc-guide/sphinx.rst b/Do=
cumentation/translations/zh_CN/doc-guide/sphinx.rst
> > index 154142318..93f27d35a 100644
> > --- a/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > +++ b/Documentation/translations/zh_CN/doc-guide/sphinx.rst
> > @@ -114,6 +114,8 @@ PDF=E5=92=8CLaTeX=E6=9E=84=E5=BB=BA
> >  ``sudo``=E3=80=82PDF =E4=BE=9D=E8=B5=96=E9=80=9A=E8=BF=87 ``mactex`` c=
ask =E6=8F=90=E4=BE=9B=EF=BC=9B=E5=A6=82=E6=9E=9C=E5=8F=AA=E6=9E=84=E5=BB=
=BA HTML =E6=96=87=E6=A1=A3=EF=BC=8C=E8=AF=B7=E4=BD=BF=E7=94=A8
> >  ``--no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=
=BF=E7=94=A8=E9=BB=98=E8=AE=A4=E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=
=E5=A2=83=EF=BC=8C=E5=9B=A0=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E
> >  ``Documentation/sphinx/requirements.txt`` =E5=AE=89=E8=A3=85=EF=BC=8C=
=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=87 Homebrew =E5=AE=89=E8=A3=85=
=E3=80=82
> > +=E8=84=9A=E6=9C=AC=E8=BF=98=E4=BC=9A=E6=A3=80=E6=9F=A5 GNU Make 4.0 =
=E6=88=96=E6=9B=B4=E9=AB=98=E7=89=88=E6=9C=AC=EF=BC=9B=E5=A6=82=E6=9E=9C Ho=
mebrew =E5=B0=86=E5=85=B6=E5=AE=89=E8=A3=85=E4=B8=BA ``gmake``=EF=BC=8C
> > +=E8=AF=B7=E4=BD=BF=E7=94=A8 ``gmake htmldocs``=EF=BC=8C=E8=80=8C=E4=B8=
=8D=E6=98=AF ``make htmldocs``=E3=80=82
> >
> >  Sphinx=E6=9E=84=E5=BB=BA
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentatio=
n/translations/zh_CN/how-to.rst
> > index e8c91d81a..84f277124 100644
> > --- a/Documentation/translations/zh_CN/how-to.rst
> > +++ b/Documentation/translations/zh_CN/how-to.rst
> > @@ -106,7 +106,8 @@ Linux =E5=8F=91=E8=A1=8C=E7=89=88=E5=92=8C=E7=AE=80=
=E5=8D=95=E5=9C=B0=E4=BD=BF=E7=94=A8 Linux =E5=91=BD=E4=BB=A4=E8=A1=8C=EF=
=BC=8C=E9=82=A3=E4=B9=88=E5=8F=AF=E4=BB=A5=E8=BF=85=E9=80=9F=E5=BC=80=E5=A7=
=8B=E4=BA=86
> >  sudo=E3=80=82PDF =E6=9E=84=E5=BB=BA=E6=89=80=E9=9C=80=E7=9A=84 MacTeX =
=E9=80=9A=E8=BF=87 Homebrew cask =E5=AE=89=E8=A3=85=EF=BC=9B=E5=A6=82=E6=9E=
=9C=E5=8F=AA=E6=9E=84=E5=BB=BA HTML =E6=96=87=E6=A1=A3=EF=BC=8C
> >  =E5=8F=AF=E4=BB=A5=E6=89=A7=E8=A1=8C ``./tools/docs/sphinx-pre-install=
 --no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=BF=E7=
=94=A8=E9=BB=98=E8=AE=A4
> >  =E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=9B=
=A0=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E ``Documentation/sphinx/requirements.=
txt``
> > -=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=
=87 Homebrew =E5=AE=89=E8=A3=85=E3=80=82
> > +=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=
=87 Homebrew =E5=AE=89=E8=A3=85=E3=80=82=E8=84=9A=E6=9C=AC=E8=BF=98=E4=BC=
=9A=E6=A3=80=E6=9F=A5 GNU Make 4.0 =E6=88=96=E6=9B=B4=E9=AB=98=E7=89=88=E6=
=9C=AC=EF=BC=9B=E5=A6=82=E6=9E=9C
> > +Homebrew =E5=B0=86=E5=85=B6=E5=AE=89=E8=A3=85=E4=B8=BA ``gmake``=EF=BC=
=8C=E8=AF=B7=E4=BD=BF=E7=94=A8 ``gmake htmldocs``=EF=BC=8C=E8=80=8C=E4=B8=
=8D=E6=98=AF ``make htmldocs``=E3=80=82
> >
> >  =E5=A6=82=E6=9E=9C=E6=82=A8=E5=A4=84=E4=BA=8E=E4=B8=80=E4=B8=AA=E5=A4=
=9A=E7=94=A8=E6=88=B7=E7=8E=AF=E5=A2=83=E4=B8=AD=EF=BC=8C=E4=B8=BA=E4=BA=86=
=E9=81=BF=E5=85=8D=E5=AF=B9=E5=85=B6=E4=BB=96=E4=BA=BA=E9=80=A0=E6=88=90=E5=
=BD=B1=E5=93=8D=EF=BC=8C=E5=BB=BA=E8=AE=AE=E6=82=A8=E9=85=8D=E7=BD=AE=E5=8D=
=95=E7=94=A8=E6=88=B7
> >  sphinx =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=8D=B3=E5=8F=AA=
=E9=9C=80=E8=A6=81=E6=89=A7=E8=A1=8C::
> > diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-inst=
all
> > index 51a296cc7..079655078 100755
> > --- a/tools/docs/sphinx-pre-install
> > +++ b/tools/docs/sphinx-pre-install
> > @@ -40,6 +40,7 @@ from kdoc.python_version import PythonVersion
> >
> >  RECOMMENDED_VERSION =3D PythonVersion("3.4.3").version
> >  MIN_PYTHON_VERSION =3D PythonVersion("3.7").version
> > +MIN_MAKE_VERSION =3D PythonVersion("4.0").version
> >
> >
> >  class DepManager:
> > @@ -308,6 +309,55 @@ class MissingCheckers(AncillaryMethods):
> >
> >          return None
> >
> > +    def get_make_version(self, cmd):
> > +        """Get the GNU Make version, or None if cmd is not GNU Make.""=
"
> > +        if not cmd:
> > +            return None
> > +
> > +        try:
> > +            result =3D self.run(
> > +                [cmd, "--version"],
> > +                capture_output=3DTrue,
> > +                text=3DTrue,
> > +                check=3DTrue,
> > +            )
> > +        except (subprocess.CalledProcessError, FileNotFoundError):
> > +            return None
> > +
> > +        match =3D re.search(
> > +            r"^GNU Make\s+([0-9]+(?:\.[0-9]+)*)", result.stdout, re.MU=
LTILINE
> > +        )
> > +        if not match:
> > +            return None
> > +
> > +        return PythonVersion.parse_version(match.group(1))
> > +
> > +    def check_make(self):
> > +        """Check for GNU Make 4.0 or newer."""
> > +        make =3D self.which("make")
> > +        version =3D self.get_make_version(make)
>
> I would invert the check: test first for "gmake", and then for "make".
>
> Lots of Linux distros have an alias for gmake, like on Fedora:
>
>         lrwxrwxrwx 1 root root        4 Apr 24 21:33 /usr/bin/gmake -> ma=
ke
>         -rwxr-xr-x 1 root root   287384 Apr 24 21:33 /usr/bin/make
>
> Yet, I would do it on a different way:
>
>         make =3D self.which("gmake")
>         if not make:
>                 make =3D self.which("make")
>
>         version =3D self.get_make_version(make)
>
> This should simplify the code a little bit.
>
Yes, I overlooked that. I'll fix it in the next revision.
>
> > +
> > +        if version and version >=3D MIN_MAKE_VERSION:
> > +            return
> > +
> > +        # macOS commonly has an incompatible /usr/bin/make, while Home=
brew
> > +        # installs GNU Make as gmake. Also accept gmake on other syste=
ms when
> > +        # it is the only compatible command available.
> > +        gmake =3D self.which("gmake")
> > +        gmake_version =3D self.get_make_version(gmake)
> > +        if gmake_version and gmake_version >=3D MIN_MAKE_VERSION:
> > +            make_name =3D os.path.basename(make) if make else "make"
> > +            gmake_name =3D os.path.basename(gmake)
> > +            make_ver =3D PythonVersion.ver_str(version) if version els=
e "unknown"
> > +            gmake_ver =3D PythonVersion.ver_str(gmake_version)
> > +            print(
> > +                f"Note: {make_name} ({make_ver}) does not meet the GNU=
 Make "
> > +                f"requirement; use {gmake_name} ({gmake_ver}) instead.=
"
> > +            )
> > +            return
>
> With that, you probably can remove most of the above.
>
> Btw, you likely need to teach tools/docs/sphinx-build-wrapper
> to also consider gmake binary, as it can run make internally
> to generate info and Rust docs.
>
> Thanks,
> Mauro
>
I'll add a separate patch in the next series to handle
tools/docs/sphinx-build-wrapper.

Thanks,
Chen Miao
