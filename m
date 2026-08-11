Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FC84399ED
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453376; cv=pass; b=sizCkK4d3521MW1sPbl7vMGYxAu51cMQar4Q8Hu0yyO80i6fF3GfAmr1q8XoTR+pZvP2LsMn3GZ9/njqoWzcCFMM3OOkg2AUuD5fIKWD0oCD9jQa22hwUGek6hczPx6gdQSDGCMTlsnWPKk7UUmsNH5mfFTsiZcD6ND2LlHhlyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453376; c=relaxed/simple;
	bh=Xz5OO90nZEZYSCGzhAl15KCIwHWr+0HSRPRb+QB+fqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IlcwM+oEO+tQwWJ99zSuBrc4DPCku9uREk6WdWnzoFO9amW0QhhVko6ALFZfcw1AsEeUnkovyKJBhOi+BjBfwO4cCA69sByO6NY8WeUbgooyp+V6xgCyrBD/PlSGYLWQOk5onSy87di3dIn5KUzxy7hdW2ZNqkqM9NNSrjrtTco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZySc155; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZySc155"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-52cd38ddcdfso4580611cf.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 06:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786453373; cv=none;
        d=google.com; s=arc-20260327;
        b=q5KcjkH1qJkgzN/BHEnyG9oj400oae5ZVHlGBqz1B1sUp7rrlVrDQLZ1oKJMDH4vGi
         5cB3XloEcZK6czvhM14J0WK6ZUTiLkoywu/qTn5SURx6C8+QdWfTNyB49JPTVzL3iTec
         vvh4Ux8BqbIyxUF8hsfLMH7716ekCJ4V+WffK3QaJ4IKhOAz95hZVEWb3cS5wkrBmLBB
         1cwKyZvGSnPQCh8r7wdpX9n617y1O8CeTeebgae+L/cKEpJnzmcjEShtxhi21NHbSFkn
         BOqNDg4sSzABYUxnl1qrpEp2pbKW1HMlKzXgIRgXdMhrc/wE12tkBmey3ztUi7IfN9P1
         VzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xWz0bRVdv1JEOEHebcmFLWUegQFAXFFQg/u9hTQgeHM=;
        fh=kv5rgWmUvdkR0xaWdi4heX0kRSYYUhhAG4XeGvXGxWg=;
        b=ccfy82nk1LjMGsK5ll1yh2p+YhX8SGw45Jd5bzgEspYdy1rnTtlbeF2pjLlIhPfKXP
         aF1v2a46Rd5Tf+JN4lmSay7D/KqrC6YNLhZQhqNzUvxUPbH2pOBlZmOvpInxOmmsuTKy
         prHFUTvqF2Vb7dGDyKTgSoE5OhYlITNxLPpEaGcwcaPNnQdhpT9BLOTUH6BN5guY4u+M
         0gtf33T68bECVI2B6YK5Dmcqc07XXAh0j9nue1GHrIPW4n7fyVMoVjXZZtdgZFdCtObD
         6NpQj9jeNzSqxhXDSOOOZ/Yukg2gPqrNToXGqfz5Y6nBkO6sp5yq2CtqhuVa6FgKin4c
         tbGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786453373; x=1787058173; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xWz0bRVdv1JEOEHebcmFLWUegQFAXFFQg/u9hTQgeHM=;
        b=YZySc155NEq3Y3tzeFhNn+haEZXgwAyRw9hn3BrwnKEWdseWZLJ5jnZHd3g1oN3a9u
         /p1EbpE7GGIprCYF7gHrcLSfmu4OC7KTAyZfBVgntsSduJnExvVOYn7iE9SyxfH8WncK
         tD8SdrUukfE5qRzCl9yblzULdrUukJMCpmWBqiJr57eDNW3Xf98nzAszvwzozx5l3ZvR
         CbV/0TEaaPKgVDv7NoGWL1pjYFQw2z0UTiVZ1ZD0hJQ0+2LR0rB0wtHunGuOzKplRkRE
         ryTP8jntN0P+KQRLCTaOaZfnOPe0ENV67RNlDKCe8VguHKyhL9oankE8GXEkhvXbzjds
         0WZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453373; x=1787058173;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xWz0bRVdv1JEOEHebcmFLWUegQFAXFFQg/u9hTQgeHM=;
        b=e+QRGJmonlxGQZ6vn7QkCUwC4vb8wDMesd6GLVoBIv3hFxHDK07dTjH9xvY+Flv5n4
         pluIa5w0+dl2GGNRnNb1DLZGwABR29dwJftxlNjLTk83LBbe8M4JliWQFuJvPYql+h4S
         lBkozHF8pJsbIn6WLWxomaJidN6baiFnw/isL1Il/RMlvL4DGykVEfDFNYMDFedRR8mG
         cC+aSyiYgNjSrdIOsA/uaQxBsXJgMd4pBpQKHd1emfGex/dllkbVcEvmfxr3Nv/W0GhN
         XgxyWDaFYHyB/bkbKid8vlSuifVNGYiBlcxfQJAxtflJzpoG5wkHQaK7qLHKuqlT6WF1
         tTzw==
X-Forwarded-Encrypted: i=1; AHgh+RpjSfGFB8iJ9o0Gl179vtR2UkS8aflb798xFou5qc56uC683VFves7KOnSHLwNQTNbnUgiOHejk3jw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyijbYkmQ6De7WG9Tm0aL5YlSlW5lufrQR7F5BPA/sED2/C0aND
	UmoRQJWKsVodtUjPZhe6j0HDnvC09WIIGP3SM1lllEUV1CtPh/rT3GDxp8a+4KCuVwzVEqFSSuL
	j5564d9LjolyxhBDQH4JZQW8uH5ltl9g=
X-Gm-Gg: AR+sD11BnngnImM6aYqZAwGzKbtupCq9HEoKNv4mv4S9H1F7Qxy+kGDPBVulnL8sEEG
	8+LKR/4GbYrylPA6mKkzkTb3vP6SJ4W1XHQVepLPLAVTFZhQNStMgX7c9rdYz2WQvsjyL8yJjlb
	vNJj5uiCFNNxAcmCcceiT74xIPgxmpIWPB87KJshN9iN2bmMy+kynKOh9AAgnojQoBlGgskXCNb
	tHCfrwfbv31ihaovroB3wN9e5QQdxHCI5MwpKFtfH7ayteQD0RunnNQFc+drkXKWgewcOP9TxLq
	zug5I8+s4r6N3Ctd57ZYZ8EMrgxam92A4gTYrK+BehhQXg==
X-Received: by 2002:ac8:5d16:0:b0:51c:22c5:daee with SMTP id
 d75a77b69052e-52d5864d5d4mr23600891cf.29.1786453372742; Tue, 11 Aug 2026
 06:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810143311.57775-1-chenmiao.ku@gmail.com> <20260810143311.57775-2-chenmiao.ku@gmail.com>
 <20260810215251.3a25758a@foz.lan>
In-Reply-To: <20260810215251.3a25758a@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Tue, 11 Aug 2026 21:02:16 +0800
X-Gm-Features: AUfX_mxI3aSHToeCdLNh7O0EH9h9NhaGOI-89qDEDUkyU4kXQLk_n6_Tg9erYuQ
Message-ID: <CAKxVwge8e2Rpa+MnoFqYoZRuf=8-a-8GEuuu-HHB9hRHGE=kBQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] docs: sphinx-pre-install: add macOS Homebrew support
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=8C 03:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 10 Aug 2026 22:33:05 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > The dependency checker currently reports an unknown distribution on
> > macOS and cannot provide installation hints.
> >
> > Detect macOS and include its product version in the status output. Use
> > Homebrew for formula dependencies and install the command-line-only
> > MacTeX cask without sudo. Only require Homebrew when dependencies
> > actually need to be installed, install the DejaVu and Noto CJK fonts
> > needed for PDF output, and explain how to refresh PATH after installing
> > MacTeX.
> >
> > Keep PyYAML in the virtual environment requirements because Homebrew
> > does not provide a PyYAML formula. Document the macOS setup, the
> > --no-pdf option, and how to create a case-sensitive APFS volume before
> > cloning the kernel tree.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  Documentation/doc-guide/sphinx.rst |  18 +++++
> >  tools/docs/sphinx-pre-install      | 113 ++++++++++++++++++++++++++++-
> >  2 files changed, 130 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/doc-guide/sphinx.rst b/Documentation/doc-gui=
de/sphinx.rst
> > index 51c370260..1e105542a 100644
> > --- a/Documentation/doc-guide/sphinx.rst
> > +++ b/Documentation/doc-guide/sphinx.rst
> > @@ -131,6 +131,24 @@ It supports two optional parameters:
> >  ``--no-virtualenv``
> >       Use OS packaging for Sphinx instead of Python virtual environment=
.
> >
> > +macOS uses a case-insensitive APFS volume by default, but the kernel t=
ree
> > +contains file names that differ only in case. Before cloning the tree,=
 use
> > +``diskutil apfs list`` to find the APFS container identifier, replace
> > +``diskX`` below with that identifier, and create an additional case-se=
nsitive
> > +volume with::
> > +
> > +     diskutil apfs addVolume diskX APFSX Linux
> > +
> > +On macOS, the script uses Homebrew for system dependencies. Homebrew
> > +commands are printed without ``sudo``. The PDF toolchain is provided b=
y the
> > +``mactex-no-gui`` cask, while the required DejaVu and Noto CJK fonts a=
re
> > +installed from Homebrew font casks; use ``--no-pdf`` when only buildin=
g HTML
> > +documentation. After installing MacTeX, restart the terminal or run
> > +``eval "$(/usr/libexec/path_helper)"`` so its command-line tools are v=
isible.
> > +The default virtualenv mode is recommended on macOS because PyYAML is
> > +installed from ``Documentation/sphinx/requirements.txt`` rather than f=
rom a
> > +Homebrew formula.
> > +
> >  Installing Sphinx Minimal Version
> >  ---------------------------------
> >
> > diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-inst=
all
> > index 965c9b093..1b9d77ec3 100755
> > --- a/tools/docs/sphinx-pre-install
> > +++ b/tools/docs/sphinx-pre-install
> > @@ -518,6 +518,24 @@ class MissingCheckers(AncillaryMethods):
> >          a decent coverage.
> >          """
> >
> > +        if sys.platform =3D=3D "darwin":
> > +            sw_vers =3D self.which("sw_vers")
> > +            if sw_vers:
> > +                try:
> > +                    result =3D self.run(
> > +                        [sw_vers, "-productVersion"],
> > +                        capture_output=3DTrue,
> > +                        text=3DTrue,
> > +                        check=3DTrue,
> > +                    )
> > +                    version =3D result.stdout.strip()
> > +                    if version:
> > +                        return f"macOS {version}"
> > +                except (subprocess.CalledProcessError, FileNotFoundErr=
or):
> > +                    pass
> > +
> > +            return "macOS"
> > +
> >          system_release =3D ""
> >
> >          if self.which("lsb_release"):
> > @@ -716,6 +734,93 @@ class SphinxDependencyChecker(MissingCheckers):
> >
> >          return self.get_install_progs(progs, "apt-get install")
> >
> > +    def give_macos_hints(self):
> > +        """Provide package installation hints for macOS using Homebrew=
."""
> > +        progs =3D {
> > +            "Pod::Usage":    "perl",
> > +            "convert":       "imagemagick",
> > +            "dot":           "graphviz",
> > +            "ensurepip":     "python",
> > +            "python-sphinx": "sphinx-doc",
> > +            "rsvg-convert":   "librsvg",
> > +            "xelatex":        "mactex-no-gui",
> > +            "latexmk":        "mactex-no-gui",
> > +        }
> > +
> > +        if self.pdf:
> > +            font_dirs =3D [
> > +                os.path.expanduser("~/Library/Fonts"),
> > +                "/Library/Fonts",
> > +                "/System/Library/Fonts",
> > +            ]
> > +            pdf_fonts =3D {
> > +                "font-dejavu": ["DejaVuSans.ttf"],
> > +                "font-noto-sans-cjk": ["NotoSansCJK.ttc"],
> > +            }
> > +
> > +            for package, names in pdf_fonts.items():
> > +                files =3D [
> > +                    os.path.join(font_dir, name)
> > +                    for font_dir in font_dirs
> > +                    for name in names
> > +                ]
> > +                self.check_missing_file(files, package, DepManager.PDF=
_MANDATORY)
> > +
> > +        install =3D self.deps.check_missing(progs)
> > +
> > +        if self.verbose_warn_install:
> > +            self.deps.warn_install()
> > +
> > +        if not install:
> > +            return None
> > +
> > +        formulae =3D set()
> > +        casks =3D set()
> > +        notes =3D []
> > +        for package in install.split():
> > +            if package =3D=3D "yaml":
> > +                notes.append(
> > +                    "PyYAML is not provided as a Homebrew formula. Use=
 the "
> > +                    "default virtualenv mode so it is installed from "
> > +                    "Documentation/sphinx/requirements.txt."
> > +                )
> > +                continue
> > +
> > +            if package =3D=3D "mactex-no-gui" or package.startswith("f=
ont-"):
> > +                casks.add(package)
> > +            else:
> > +                formulae.add(package)
> > +
> > +        commands =3D []
> > +        if formulae:
> > +            commands.append("\tbrew install " + " ".join(sorted(formul=
ae)))
> > +        if casks:
> > +            commands.append("\tbrew install --cask " + " ".join(sorted=
(casks)))
> > +
> > +        if not commands:
> > +            self.distro_msg =3D "\n".join(notes)
> > +            return None
> > +
> > +        if not self.which("brew"):
> > +            notes.append(
> > +                "Homebrew is needed to install the missing dependencie=
s. "
> > +                "Install it from https://brew.sh/ and re-run this scri=
pt."
> > +            )
> > +            self.distro_msg =3D "\n".join(notes)
> > +            return None
> > +
> > +        if "mactex-no-gui" in casks:
> > +            notes.append(
> > +                "After installing MacTeX, restart the terminal or run:=
\n"
> > +                "\teval \"$(/usr/libexec/path_helper)\"\n"
> > +                "before re-running this script."
> > +            )
> > +
> > +        if notes:
> > +            self.distro_msg =3D "\n".join(notes)
> > +
> > +        return "\nYou should run:\n" + "\n".join(commands)
> > +
> >      def give_redhat_hints(self):
> >          """
> >          Provide package installation hints for RedHat-based distros
> > @@ -1138,6 +1243,8 @@ class SphinxDependencyChecker(MissingCheckers):
> >              re.compile("Kali"):                       self.give_debian=
_hints,
> >              re.compile("Mint"):                       self.give_debian=
_hints,
> >
> > +            re.compile("macOS"):                      self.give_macos_=
hints,
> > +
> >              re.compile("openSUSE"):                   self.give_opensu=
se_hints,
> >
> >              re.compile("Mageia"):                     self.give_mageia=
_hints,
> > @@ -1458,7 +1565,11 @@ class SphinxDependencyChecker(MissingCheckers):
> >          self.check_program("dot", DepManager.SYSTEM_OPTIONAL)
> >          self.check_program("convert", DepManager.SYSTEM_OPTIONAL)
> >
> > -        self.check_python_module("yaml")
> > +        # PyYAML is installed from Documentation/sphinx/requirements.t=
xt in
> > +        # the virtualenv recommended on macOS. Homebrew does not provi=
de a
> > +        # PyYAML formula, so do not ask for a nonexistent brew package=
 here.
> > +        if not (sys.platform =3D=3D "darwin" and self.virtualenv and s=
elf.need_pip):
> > +            self.check_python_module("yaml")
>
> This is not right: yaml is needed even outside venv/pip, as
> it is required to build some docs - See Documentation/sphinx/parser_yaml.=
py
> extension.
>
> So, basically:
>
> if python on macOS is *always* shipped with python3-yaml package (or
> whatever name it has there), the code would be something like:
>
>         # For whatever weird reason, macOS added a non-builtin module
>         # on its python package, so no need to check as yaml is always
>         # there.
>         if sys.platform !=3D "darwin":
>                 self.check_python_module("yaml")
>
> Otherwise, this hunk is wrong.
>
> >
> >          if self.pdf:
> >              self.check_program("xelatex", DepManager.PDF_MANDATORY)
>
>
>
> Thanks,
> Mauro
>
You're right. I'll keep checking for PyYAML on macOS and fix this in v3.

Thanks,
Chen Miao
