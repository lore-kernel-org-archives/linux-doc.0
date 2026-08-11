Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3873A43C061
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 13:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786453460; cv=pass; b=VrFoYDOjR2yHHyif0IRE0XCkmZPF/8zdPfH5mXBm6Ym3SneNmmZiXOut6+2AnW97ws1T5YszyrG2rMvB7KcVIZ0/eU8MyRD1tnAMQeVFb1v3gbblXjGX4+cEChmfn1JV2lSWCxy5yLjnpdP5rzBzji8vPhYXGDT7qKNk4Gv8Nr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786453460; c=relaxed/simple;
	bh=KkNNP/ARuZJlHPHioDksDLcYa8wVzfpHiW8qEwxMpjg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4nh5stLDX6NAyH30j14tUB22ZNfMvnv4/1z6fg6N+lxdgU0ZpU/2NVIHprnYRJYDq0etkihJrUbu1DzwJ6ojGlV6hLCPfdK8/irPp9UEqljC+MPpEu5+Ckw0nUYocTLgD7mqOpZWa8H/nTrp1X+lxp+C6Wvfj3Hf0roTqeErD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LXrsHDb2; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LXrsHDb2"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c05dcdf49so29116861cf.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 06:04:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786453458; cv=none;
        d=google.com; s=arc-20260327;
        b=RqWdo/oIIFXRfxffeoyR0GbcqyLsYxJPyhxjkojfNLpn/YJF9vOTQaWndfsUkI1nrD
         QY0dv0oCcMAdRSjCixaMYKD5TiPplkMHhmT5yXHVZ6vCjia/WXqKRcgm3ykzkrtXErfE
         hhxkOHvnRB6Yn/1EhLg48dHR207VYBEngPAlumQu7gJ8B/nQpllG2D88gQ9E2Sbg8liA
         72+fiwI2BNEzOrpXMo2tLH3CwEgcQhagWeqdxof+W2UzgsiEziHPvwXQK1hRrKDw9fF0
         90nMnhWPNk5PXAGlan6UD3Asw6kCf7YMEAQdrK99JUlcf9lV/aJVIpWOwSzwC8/0qtdD
         ExQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=phh5zXsHTFL0jsT8P1kH1ENrHAJoQcuy306DPU9TBOc=;
        fh=GOSqjzFslXmbyIQK+hYA74VHjBEeW8hX9IeSnrk91mw=;
        b=KmI2nsIlk0D1ZODiMQizYW/MyYbpD+82CBCg1nJhe2XQiE5paCf7QCpnRC2e2aTRxp
         zIVV2tmDS0tS95Fiws1uDr8hzCt/NJ8AQ7V3sfWs7UusC7FNo+5nFBl2LqGvwXWRbvP4
         WEEMEs19Q3haujDf0yXz2I6fmcxv5WmiM/E7PFtEGI0CevKScl8nbEVFuhYQ/LNAGKs0
         LE30/gMkgmWYf9o4lbqdtHR46/o8mhyumAsfNbC9+SAt35Fp4KLmehBk25dqZ/nkk3KR
         vlQJ8zfdHeziWjRX0Tdl8gVSa/cGy5wdBsB+ZhXyv6QPMQaRrH3GmiWumtVa7PaNL8pI
         7cww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786453458; x=1787058258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=phh5zXsHTFL0jsT8P1kH1ENrHAJoQcuy306DPU9TBOc=;
        b=LXrsHDb2bm3Im+4Az5LsxTUIobD028pCMLTsg/2f3si66AgaZ2LALenIL3Ij8mfNt8
         4RoLF1zrRJ2UPqem3ZAZHACPjmMMJQ2PGKQq/WXKriFPXUXtIrr/0T6/8xABmfLca5OA
         t7YjLnyntnOAKtv40EYDxM/ld4jzdJgQX9GgbXubJU7MfAuveowkE03i4xjLtqfLgEB4
         O3KS9cdM7A71eC0/ni+PdpYT9rOkCrfVib0Uj+a5Vo5C/CXtmB1+RqpLhlxQIQgOMGwA
         6yrvrUz6Jd7Li4UgX887llH+MWgiYCX5tGqTcnIsWxY5ItmEDbs8FcrQfCQP2z3ZEq1T
         IcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786453458; x=1787058258;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=phh5zXsHTFL0jsT8P1kH1ENrHAJoQcuy306DPU9TBOc=;
        b=mhol/Wh8zR9Xru5Jp5HUfeGWtdZsm3LLQBMg0i4r9x2tszXt2vqVj4dZQ/P7C7VdWE
         qH/nqPnDWiWQTTXyVVA4m4p/xbD/2SJErKF5tS+mEVILcNloqxUVhPzD+Z3CHA6jcnRZ
         9V/MUD+SHSQ6UhzK1zLnA7A9gz4FaHIrrW8LNeTfhRe+tY82HgYHFmu41dZmYj87B2gh
         IgiLsI3w8yubQCGAT8h1PJ+oItTIqiFQnEnGLXa3AEQg4Rn8DcUIvvqXZEdDduSVQbRq
         oaQ5XHR59x2EbqkBdn2rFTGjeQpMUlg9xETYzo1891gLa0NrwzDiOPgz8h9WS9Mo1OvT
         ZSCQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNttQwkpqVqOZUUffltmyK6pNlqeLHfPGFgbUOcJEVH9TxBIDT6luqlVlBLwVZZ9jgK1JRUysPUNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuW2W9sMHXJ5AG2jBSj6rxA9sHzIoz/wHY8FtnBbua6B6PIFE8
	upI4SqSACUhzAfZC32uqrsm3KDCPHBquwQlym5zGUjYP9JbAJDsu2mP/ZTsy3KAUyLmvCsCuV9V
	LWSzQS3aVDPZT88Htd4E56ovNbjoV6DI=
X-Gm-Gg: AR+sD12dy4zQAhbIo0nabHFEzNzOAW8iODSW3NATi0HvuEPbeJJIwN+p+Zxvh3E606K
	U7ShHYoTZTxh40R8c5Yxj2oVn4jiaqmRSCWdWUxp3kgBmD4+Q6Ejp/tezMfloMZ6UkRqepKfDCH
	agQz0FclcrbiQLplUhCaFBIPziYXqULJpUiRY0dTYzx4ROpT0A8y/FHVBNW1rErTkzL66pp2kdS
	TVdC87h6biTrze3vZZlZ+AO7mbDazQx7kh9TuiizkcLeO1zGdenw0kj9P8HeaQCw7gQ0v4BolBg
	+rqELcGUSjIMcao6UYS6OqCyN3mjqaZsBjA84NUO6Grncw==
X-Received: by 2002:ac8:5f8d:0:b0:52d:3352:f7ac with SMTP id
 d75a77b69052e-52d585fad1fmr22451241cf.28.1786453457883; Tue, 11 Aug 2026
 06:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810143311.57775-1-chenmiao.ku@gmail.com> <20260810143311.57775-4-chenmiao.ku@gmail.com>
 <20260811065113.78e304c7@foz.lan>
In-Reply-To: <20260811065113.78e304c7@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Tue, 11 Aug 2026 21:03:41 +0800
X-Gm-Features: AUfX_mw_S3rqUqK6KLbkxxJCVJvYG4s6pacHo7q2IoImeBRseWRI9vEeGz6-D8Y
Message-ID: <CAKxVwgch9tzWnAJrY7M0972+B6JbULX147jGEJ9R_zk4B65=PA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] docs: sphinx-build-wrapper: prefer gmake
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=8C 12:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 10 Aug 2026 22:33:07 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> > wrapper invokes make directly when generating Info and Rust
> > documentation. This can make the dependency check succeed while those
> > documentation targets still use an incompatible make implementation.
> >
> > Honor MAKE when it names a compatible GNU Make. Otherwise check gmake
> > and then make, selecting the first GNU Make 4.0 or newer. This keeps th=
e
> > wrapper's selection consistent with sphinx-pre-install.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  tools/docs/sphinx-build-wrapper | 55 ++++++++++++++++++++++++++++-----
> >  1 file changed, 48 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-=
wrapper
> > index 1bb962202..aa6a297db 100755
> > --- a/tools/docs/sphinx-build-wrapper
> > +++ b/tools/docs/sphinx-build-wrapper
> > @@ -71,6 +71,7 @@ from jobserver import JobserverExec         # pylint:=
 disable=3DC0413,C0411,E0401
> >  #
> >  VENV_DEFAULT =3D "sphinx_latest"
> >  MIN_PYTHON_VERSION =3D PythonVersion("3.7").version
> > +MIN_MAKE_VERSION =3D PythonVersion("4.0").version
> >  PAPER =3D ["", "a4", "letter"]
> >
> >  TARGETS =3D {
> > @@ -97,6 +98,46 @@ class SphinxBuilder:
> >      with the Kernel.
> >      """
> >
> > +    @staticmethod
> > +    def get_make_version(cmd):
> > +        """Return the GNU Make version, or None for another make."""
> > +        if not cmd:
> > +            return None
> > +
> > +        try:
> > +            result =3D subprocess.run(
> > +                [cmd, "--version"],
> > +                stdout=3Dsubprocess.PIPE,
> > +                stderr=3Dsubprocess.PIPE,
> > +                text=3DTrue,
> > +                check=3DTrue,
> > +            )
> > +        except (OSError, subprocess.CalledProcessError):
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
> > +    def get_make(self):
> > +        """Select the first GNU Make 4.0 or newer in preference order.=
"""
> > +        candidates =3D [
> > +            self.env.get("MAKE"),
> > +            shutil.which("gmake"),
> > +            shutil.which("make"),
> > +        ]
> > +
> > +        for cmd in candidates:
> > +            version =3D self.get_make_version(cmd)
> > +            if version and version >=3D MIN_MAKE_VERSION:
> > +                return cmd
> > +
> > +        sys.exit("GNU Make 4.0 or newer is required")
> > +
>
> As the code here seems to be duplicated, please add it on a library
> to be used by both scripts, as this makes easier to maintain it.
>
> The doc tools libraries are located under tools/lib/python/kdoc.
>
> Both scripts are already prepared to use it. For instance:
>
>         from kdoc.python_version import PythonVersion
>
> PythonVersion belongs to a common library.
>
> As make is unrelated, please create something like:
>
>         tools/lib/python/kdoc/gmake_detect.py
>
> adding the code there, and then use from/import to pick the
> needed class or method.
>
> Regards,
> Mauro
>
Indeed, sharing it in kdoc makes more sense. I'll do that in v3.

Thanks,
Chen Miao
>
> >      def get_path(self, path, use_cwd=3DFalse, abs_path=3DFalse):
> >          """
> >          Ancillary routine to handle patches the right way, as shell do=
es.
> > @@ -569,9 +610,10 @@ class SphinxBuilder:
> >          texinfo directory.
> >          """
> >
> > +        make =3D self.get_make()
> >          for output_dir in output_dirs:
> >              try:
> > -                subprocess.run(["make", "info"], cwd=3Doutput_dir, che=
ck=3DTrue)
> > +                subprocess.run([make, "info"], cwd=3Doutput_dir, check=
=3DTrue)
> >              except subprocess.CalledProcessError as e:
> >                  sys.exit(f"Error generating info docs: {e}")
> >
> > @@ -787,12 +829,11 @@ class SphinxBuilder:
> >
> >          if rustdoc and target in ["htmldocs", "epubdocs"]:
> >              print("Building rust docs")
> > -            if "MAKE" in self.env:
> > -                cmd =3D [self.env["MAKE"]]
> > -            else:
> > -                cmd =3D ["make", "LLVM=3D1"]
> > -
> > -            cmd +=3D [ "rustdoc"]
> > +            make =3D self.get_make()
> > +            cmd =3D [make]
> > +            if make !=3D self.env.get("MAKE"):
> > +                cmd.append("LLVM=3D1")
> > +            cmd.append("rustdoc")
> >              if self.verbose:
> >                  print(" ".join(cmd))
> >
>
>
>
> Thanks,
> Mauro
