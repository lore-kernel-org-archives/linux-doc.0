Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67C9388369
	for <linux-doc@vger.kernel.org>; Sun,  9 Aug 2026 18:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786301990; cv=pass; b=rvBP+AlysMRVnI8aOT/p1jBHvUPAjUJWUQ/bDA0l28GWVCCZyTCzEW4B9MLzMdi8QA9PAZsXOJfBN2PhDGCfC3MWn5q3WD8QV8Bo3bYpObt4yw2Ig57OXqQSJdXGMC5djT7opvkOVVvYOTZJ7lVT3woBVuJy3ywxHKgVu7IvhOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786301990; c=relaxed/simple;
	bh=GIRMNqDexsWMTC0CwOzgHLGAotXxon4XrRqzTs/JBbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XiScM2aWn3E1iUut4bzUOcy+DtiiKZsJCRPCQ4RYRQcbVw5P12S4DmjnMxoqCmsDFJWQjBNP8tdS4c4ZFHkvPznaEPmENnCk0RcTkJM6dMDQ3WjvxMs/5ZssnGlOxqsu+3xKk8Su5xB5u4wQkB+xwfTR361GHbwxD2qfMx+SJpk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCaOGUYm; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCaOGUYm"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c0ecfaee7so7547901cf.0
        for <linux-doc@vger.kernel.org>; Sun, 09 Aug 2026 11:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786301988; cv=none;
        d=google.com; s=arc-20260327;
        b=C17qdMkt0/B1GsKbrWwsHmontqxjrYCtMJylR8UMGh6VKkalfWVNPUBSOq4ndeL2bl
         lcJ3WMub3+mtp8xIgp8Mj10l+3Z4bYYFGIdh8vEoxZCuQNx00g9KOaVE5iQksHs11MYX
         FogFzlkCKcboHitKXQnTXDhD981xbR5wXHucgJn8NCZ9aFaDht5LMFhPNR7feHXCC8Yt
         GNCMfftmFLneV13AVfGadOD1BLrT43LLIdfvJR1RklSjc+mAOji36aAGx42Cw/MkBR0M
         rOjGVbPikXVB+KZQfXaCS3OnDzltk2DHyq1EXRV4toq1D03epxog2L+l7PlHiFMPaQEG
         p8hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uY9fEp4mEYS5FZN4fLph8O9OO5XPM/n8poJcNnRsLvk=;
        fh=/fLNwiO3h2kGHAxokEV7uhb2dMXH6aBHWkPPLEzMjCo=;
        b=MYMzRUXdJoFdCFzzAw/x5LoECtvWeIhVTSzROy09/t3X47tU7jG6ZapXMTP6C3H4FI
         Lydiflt5IIZ6YAa+QjuYI8Scv6+I+J5+nLM6DTYs8MAdhPOUHKbo9xs2+00nz3Jxb7AI
         vI9vFGxx3y72SUxauxesluTMmEpe8YY9JQCrtsg8nWfmE9zjN7ZZTQMQyOkHZti3WdyK
         sO88jWm+RENVI2se8c8+p314V7JpBdiRqWMOYNxOWW1Som2Y34PP/u4QgJ3vQX8R5tpA
         jtCUT+rPMUIcSDZXWcKZT9w0ZlOh+38JKxYF3fZT5a2wvNJoOQnQcW4gtJazPMlg2ato
         tarQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786301988; x=1786906788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uY9fEp4mEYS5FZN4fLph8O9OO5XPM/n8poJcNnRsLvk=;
        b=tCaOGUYmP4bJ2vTgj2Zt7eyhYGU2JL8HVkh7prJ5vwVOhTp9jz+HlvV4SYAF5vbsID
         ovGRitDV0idFrQlt/33kBFYsuKFIlL7F73Ptqyp/yDNulB9EBy42zbF83lPwa5soMAB3
         jrQItHLg3TXq9e9PqLquGbv6X1elxXDafOzyP1pa5Bb6N3GI1s5aBAPbqAjwlmC50Hmr
         TJ6gWrkc/CYkzobmpG/V6gg3FwirAu4MlRYhlQzr37Hvbs7+tJ+Hds2dXvme7/OOPdoN
         kt9cNzKLWqnDG/zZ6KKbwYzfhf6Rfvm/gox8ppGKgD3kaSY2wO+uLaZc9G/5y0HnSHPJ
         R0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786301988; x=1786906788;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uY9fEp4mEYS5FZN4fLph8O9OO5XPM/n8poJcNnRsLvk=;
        b=UPO99GHREqQmKe28Phs/g6scETMeRvYWy2i3jGLsyVFDSNlG38XAfXEPJu0f6NEqDn
         QFexrgoCMl1CDNGBODH36Q6NDcMhkvpAe+BadM48q7HY/gAcgAR+BizIXgLrE3G64zya
         WipqC9FcyaL82/vUT8ImiEISxYZ9EcUwfjQ6s/GOZYYCnTMN6gkIotwdgexGXJKZ6JmK
         757qoRhiM0H7bqYLlk+583M11EoBWCVWhKkS77TM7vhBePRycRZ9PVtwLL0ucUo1qG6P
         gBPe8XN5OX0gjoTN1iyp7bh6dlbu8a05m0cRiAaVLj2BOExjUgPkBaFgCEpgEdwrO5eQ
         /oRQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAk4v20PAO96Jjuf0Sb+iDMA1ZPokCdopTT1oq4bmeJB76Iy8MyQr8t/OnE8lM6x8Q8s4qqZKqxDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcXMCc8KslUl0qx78wW13C1XhkocLTTjFYuzIIa074m+1z+DIQ
	eIM8LDzW1tBTl58UXj/0nVSQzbLuwkGVzCtd9PFiVxotgO0DMexxmhsYDyH4mmgViRm0+Nhbtuw
	5O51jlL5yvrruCnFGQSWSZSMjmFHdlaQ=
X-Gm-Gg: AR+sD13eSRLtgszG47uhPbkyjfm62ucD24Ct8qukwG+jk9/fGtwpaqgKE0FhfAj31Uj
	lsOeHtUK5d9DhaD90b0uPp1tBrX25iw8nN4oMSILlAlgJx5vvlr2U6Vr+YxyCHsmRnQYYFTp1Ot
	DEUcb+DoD+u4C7MrugdwtXgCgUMjzfGOYOJNIqPVnGERjt1eFmK6Yo+hbSJcLrPkNXDjrFSf7m2
	J/zV0yLCs+rCx9i3dpkIUGkRq1BZ7QffVDNM7yOWcSJzi7XBQESIYC+hqmB/egEpvBp8DG9tDND
	d8tBe1DnBlo/8Q3dRt02IVEpbSQB3dvntNWZqeO5TcUS5g==
X-Received: by 2002:ac8:5e0c:0:b0:517:6550:2a0 with SMTP id
 d75a77b69052e-52ce6054521mr375259541cf.19.1786301987459; Sun, 09 Aug 2026
 11:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809101923.13176-1-chenmiao.ku@gmail.com> <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org>
In-Reply-To: <anh6axawbEiF37WD@wyuan.org>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Mon, 10 Aug 2026 02:59:11 +0800
X-Gm-Features: AUfX_mwwHeySHNdkSHXJ-ucnROBjBCx5qPeSQvCNehxL--8vKoTVe14Ff7JU99E
Message-ID: <CAKxVwgfu_GOvKNqiamSjbGf7NcWuW4JjQ4inB+MmL4F+LVfioQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew support
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Weijie Yuan <wy@wyuan.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=889=E6=97=A5=E5=91=
=A8=E6=97=A5 21:02=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Miao,
>
> On Sun, Aug 09, 2026 at 06:19:20PM +0800, Chen Miao wrote:
> > The dependency checker currently reports an unknown distribution on mac=
OS
> > and cannot provide installation hints.
> >
> > Detect macOS and include its product version in the status output. Use
> > Homebrew for formula dependencies and install MacTeX as a cask without
> > sudo. Keep PyYAML in the virtual environment requirements because
> > Homebrew does not provide a PyYAML formula.
> >
> > Document the macOS setup and the --no-pdf option.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  Documentation/doc-guide/sphinx.rst            |  7 ++
> >  .../translations/zh_CN/doc-guide/sphinx.rst   |  5 ++
> >  Documentation/translations/zh_CN/how-to.rst   |  6 ++
> >  tools/docs/sphinx-pre-install                 | 89 ++++++++++++++++++-
> >  4 files changed, 106 insertions(+), 1 deletion(-)
> [...]
> > diff --git a/Documentation/translations/zh_CN/how-to.rst b/Documentatio=
n/translations/zh_CN/how-to.rst
> > index 9ec2384e1..e8c91d81a 100644
> > --- a/Documentation/translations/zh_CN/how-to.rst
> > +++ b/Documentation/translations/zh_CN/how-to.rst
> > @@ -102,6 +102,12 @@ Linux =E5=8F=91=E8=A1=8C=E7=89=88=E5=92=8C=E7=AE=
=80=E5=8D=95=E5=9C=B0=E4=BD=BF=E7=94=A8 Linux =E5=91=BD=E4=BB=A4=E8=A1=8C=
=EF=BC=8C=E9=82=A3=E4=B9=88=E5=8F=AF=E4=BB=A5=E8=BF=85=E9=80=9F=E5=BC=80=E5=
=A7=8B=E4=BA=86
> >  =E5=BC=80=E5=A4=B4=E7=9A=84=E5=91=BD=E4=BB=A4=E3=80=82**=E8=AF=B7=E6=
=B3=A8=E6=84=8F**=EF=BC=8C=E6=9C=80=E6=96=B0=E7=89=88=E6=9C=AC Sphinx =E7=
=9A=84=E6=96=87=E6=A1=A3=E7=BC=96=E8=AF=91=E9=80=9F=E5=BA=A6=E6=9C=89=E6=9E=
=81=E5=A4=A7=E6=8F=90=E5=8D=87=EF=BC=8C=E5=BC=BA=E7=83=88=E5=BB=BA=E8=AE=AE
> >  =E6=82=A8=E9=80=9A=E8=BF=87 pip/pypi =E5=AE=89=E8=A3=85=E6=9C=80=E6=96=
=B0=E7=89=88=E6=9C=AC Sphinx=E3=80=82
> >
> > +=E5=A6=82=E6=9E=9C=E6=82=A8=E4=BD=BF=E7=94=A8 macOS=EF=BC=8C=E8=84=9A=
=E6=9C=AC=E4=BC=9A=E4=BD=BF=E7=94=A8 Homebrew =E8=BE=93=E5=87=BA=E5=AE=89=
=E8=A3=85=E5=91=BD=E4=BB=A4=EF=BC=8CHomebrew =E5=91=BD=E4=BB=A4=E4=B8=8D=E9=
=9C=80=E8=A6=81
> > +sudo=E3=80=82PDF =E6=9E=84=E5=BB=BA=E6=89=80=E9=9C=80=E7=9A=84 MacTeX =
=E9=80=9A=E8=BF=87 Homebrew cask =E5=AE=89=E8=A3=85=EF=BC=9B=E5=A6=82=E6=9E=
=9C=E5=8F=AA=E6=9E=84=E5=BB=BA HTML =E6=96=87=E6=A1=A3=EF=BC=8C
> > +=E5=8F=AF=E4=BB=A5=E6=89=A7=E8=A1=8C ``./tools/docs/sphinx-pre-install=
 --no-pdf``=E3=80=82macOS =E7=94=A8=E6=88=B7=E5=BB=BA=E8=AE=AE=E4=BD=BF=E7=
=94=A8=E9=BB=98=E8=AE=A4
> > +=E7=9A=84 Python =E8=99=9A=E6=8B=9F=E7=8E=AF=E5=A2=83=EF=BC=8C=E5=9B=
=A0=E4=B8=BA PyYAML =E4=BC=9A=E4=BB=8E ``Documentation/sphinx/requirements.=
txt``
> > +=E5=AE=89=E8=A3=85=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF=E9=80=9A=E8=BF=
=87 Homebrew =E5=AE=89=E8=A3=85=E3=80=82
>
> My question is perhaps quite stupid. (I'm not familiar with this part)
>
> How can you make "git clone xxx/linux.git" done on your mac? I've tried
> this before, but it seems that there's some format issue? macOS's
> default APFS is case-insensitive.., so I guess you did some extra
> settings? (like 'git clone --sparse' or 'git clone --filter=3Dblob:none'?=
)
> But my intuition and experience tell me that it won't be convenient ;-)
>
> If so, an additional description for macOS users might be more
> user-friendly, I guess? Since the how-to file aims to lower the
> threshold of the process of translation. (While I don't know how many
> macOS users are potential contributors.)
>
> And another thing is that zh_CN would prefer splitting zh_CN
> translations apart from the original English one in your patch. Because
> there's a script to monitor the translation status.
> (Better confirm this with zh_CN maintainers)
>
> Thanks.
>
Regarding APFS, I'll reply to that together in response to your latest emai=
l.
I see that you and the other reviewer have reached a consensus.

In the next revision of the patch, I'll split the English and Chinese versi=
ons
into separate patches. I agree that this would indeed be better.
>
> I haven't read this script carefully. Please feel free to ignore my
> incorrect comments below.
>
> > diff --git a/tools/docs/sphinx-pre-install b/tools/docs/sphinx-pre-inst=
all
> > index 965c9b093..51a296cc7 100755
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
> > @@ -716,6 +734,69 @@ class SphinxDependencyChecker(MissingCheckers):
> >
> >          return self.get_install_progs(progs, "apt-get install")
> >
> > +    def give_macos_hints(self):
> > +        """
> > +        Provide package installation hints for macOS using Homebrew.
> > +
> > +        Homebrew formulae and casks must not be installed with sudo. M=
acTeX
> > +        is a cask, while the other dependencies are formulae.
> > +        """
> > +        if not self.which("brew"):
>
> Homebrew seems to be treated as a build dependency here, rather than as
> the package manager used to provide installation hints.
>
> If all actual documentation dependencies are already installed on a
> macOS system without Homebrew, this adds Homebrew as SYSTEM_MANDATORY,
> increments self.deps.need, and eventually makes the script exit with
> Can't build as 1 mandatory dependency is missing, even though the
> documentation can actually be built.
>
> Could we first check whether there are any missing dependencies and only
> complain about a missing brew when an installation hint is actually
> needed? I don't think Homebrew itself should be added to self.deps.
>
I think you're right =E2=80=94 Homebrew is not a required dependency. We sh=
ould only
suggest using `brew` to install the necessary dependencies when we detect t=
hat
they are missing.
>
> > +            if not self.distro_msg:
> > +                self.deps.add_package("Homebrew", DepManager.SYSTEM_MA=
NDATORY)
> > +                self.deps.check_missing({})
> > +                self.deps.warn_install()
> > +                self.distro_msg =3D \
> > +                    "Homebrew is required for macOS support. Install i=
t from " \
> > +                    "https://brew.sh/ and re-run this script."
> > +            return None
> > +
> > +        progs =3D {
> > +            "Pod::Usage":    "perl",
> > +            "convert":       "imagemagick",
> > +            "dot":           "graphviz",
> > +            "ensurepip":     "python",
> > +            "python-sphinx": "sphinx-doc",
> > +            "rsvg-convert":   "librsvg",
> > +            "xelatex":        "mactex",
> > +            "latexmk":        "mactex",
>
> Nit & Non-blocking:
>
> Btw, would 'mactex-no-gui' be a better fit here?
>
> The documentation build only needs the TeX command-line tools, while the
> regular mactex cask also installs the GUI applications (I forget whether
> GUI is big or not, but I guess <1GB). mactex-no-gui still provides the
> full TeX Live distribution, so it may avoid installing software that is
> not needed for kernel documentation builds.
>
Agree.
>
> Not a blocker.
>
> > +        }
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
> > +        for prog in self.deps.missing:
> > +            if prog =3D=3D "yaml":
> > +                self.distro_msg =3D \
> > +                    "PyYAML is not provided as a Homebrew formula. Use=
 the " \
> > +                    "default virtualenv mode so it is installed from "=
 \
> > +                    "Documentation/sphinx/requirements.txt."
> > +                continue
> > +
> > +            package =3D progs.get(prog, prog)
> > +            if package =3D=3D "mactex":
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
>
> One more thing about the MacTeX hint: after installing the mactex cask,
> its command-line tools may not become visible in the current shell
> immediately. Homebrew's cask notes say that the terminal needs to be
> restarted, or eval "$(/usr/libexec/path_helper)" (Is it?) should be run.
>
> Otherwise, a user who immediately re-runs sphinx-pre-install after
> following this suggestion may still see xelatex and latexmk reported as
> missing.
>
> Would it make sense to mention this in the macOS installation hint?
>
Sure, nice tips.

Thanks,
Chen Miao
>
> > +
> > +        if not commands:
> > +            return None
> > +
> > +        return "\nYou should run:\n" + "\n".join(commands)
> > +
> >      def give_redhat_hints(self):
> >          """
> >          Provide package installation hints for RedHat-based distros
> > @@ -1138,6 +1219,8 @@ class SphinxDependencyChecker(MissingCheckers):
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
> > @@ -1458,7 +1541,11 @@ class SphinxDependencyChecker(MissingCheckers):
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
> >
> >          if self.pdf:
> >              self.check_program("xelatex", DepManager.PDF_MANDATORY)
>
> Thanks.
