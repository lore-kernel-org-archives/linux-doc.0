Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0636A3B1025
	for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 16:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786726096; cv=pass; b=LLREtOXxFI7E2Tllw0zy3zwNF2r21Os4GykMgQk/eyc0YfdDGIrokY9R7LDPrjKLDwYjO5aOrVQdRFGALgwZTtyA7ZJRK4jgMn2kqVHSTHq8fDWgJt1b4TGcDYOcjVxy3uncq+LbyaHPWTFk7Qe4u6oFzTXfC8nulIGJaa3UtXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786726096; c=relaxed/simple;
	bh=0ceo7RcvaD31vXQZEWE052HWauuXTt+0Z3I1fhh50Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVmIH4DYksXA2bR+yWzfAr4lJOrvSz05gaEvqWK19+hatp1wyBu60jwD0eNZ8QJKsrYDdxu00wg3luptkX1vI2fiCQL1XEf1sy1dnhHWKNro/hU3mehUl1jNaNwrtPpVmtlTOvWk1G9JfjOBNYFsG2YzE2eURg8KNYU27AzgCH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1OUygBC; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1OUygBC"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-529a1ee0e62so9506251cf.2
        for <linux-doc@vger.kernel.org>; Fri, 14 Aug 2026 09:48:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786726094; cv=none;
        d=google.com; s=arc-20260327;
        b=EnSHYx9kVf6o/onln5dNgH5Lgok2L/2Z3KhE3aJVCIzjkuGhDEMz0Izi0PalD0OOHy
         2OuE7N7gWsQUtqOFvQaoh7BLXp/z5JFhBATpciKem4zD9cWdg3AsJXZ7sdk88EwpvlB+
         JPVRXQVaDx2ilx31VujvLYe/ehxGw0fXqh7GxKlyd7vyeO+MQfrqvhGcrwqVH9vFmsww
         BDMCinrPruA6XwizIabEgG+//t5TE0diyL8REp0//EK7Omne3/NSxe44KG5PoIKl1gLo
         RgQw43eYwQqpdUuBE+WCUnqgdwfSvESESCAs2FFK/KoLFukUOMfj4WvBH/zv71YQCZxU
         kEzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zuPmn27dPLJRo4DoU6Bth/I4F1fvd5qQO7taNFc1A68=;
        fh=618qy7LfxFvtR5N5y18CoWVCWZJSxOg/xbvOApj6IBs=;
        b=nsfF/zaIjhJ/MEPuYvvyMIUB70uqnz9lZrh1jrhis0OAT7HznQlebpBG9GYwjwZssc
         xQsedim8Xh28KtAMGKaABwPh8C7Jo1D8K6CpDu2Q6QTFFK0R0bkff8h+vIMNaTd0k8LK
         Zj1hMQ47mHIQ00sf5jnoQ1EcRk0RckCvGNhTdTRcH5hnkGQsLOifmhQpVpr8//GlBRhr
         yxG8VzIK0Ls+Qx9WGnUZIKQ9e1cegMc0OfmP73e6LSQcX9oEBJmZKA+01kb7I8I9Zz0T
         vbkAC0Rij5Rvvr0/NFQ+3vWVqL74tQzm75hheuycbpgYt8pbuCjvoVODaRzqyymlGwEt
         Q39w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786726094; x=1787330894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zuPmn27dPLJRo4DoU6Bth/I4F1fvd5qQO7taNFc1A68=;
        b=n1OUygBCGgjooIB789Jg3zNcbVlih9xMjtrZDplItASyZN1bNk8sloifEHn9vSk5/I
         sz4F9LvsuJ4yKkp0XPUlMyzPyzOWhYoUXFhOmkjSH1B0kHQrzjbrd8A6KhV2dloxgsp0
         usGumxhQbHLfGIXdX9xY1SxxFVIg5fRRfNOhdvx4uqOGTGHJcHiiGylKqebwro3yu4FT
         0jcWmwwNYXZnPgvPeTvk5p4w6VACvkKC8HK5+EJqCNOIftNUkrai4aWyxhh+28eoq710
         ChVq1BMlAzaj3aSNlDUY1K48Vn3gVU+t1IQMoqZG4oy58+U75qpQO5UWdwsHznsadpjU
         UU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786726094; x=1787330894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuPmn27dPLJRo4DoU6Bth/I4F1fvd5qQO7taNFc1A68=;
        b=ZM9VEbFzhB893aRUwSIUipMZ90JNBd2HUKXBMKe4068PyQ6trxaO+sTfSd0lm0psx+
         0Do4HZBcUk5SwQBy8HINdleAHCNX1y7gGEID+9ev9kvss1r0h7js8G8HsrtTQBhDIo+6
         MQhzXbL30ufZNB4idgv42zR0qpbxVe3OXaZKo0egyDONBNW6NEP7bDJcS7ZB+asg8AnQ
         BikoZ5uS09QTi54u8zdcy8383m/tX7VbTRHuGOpScNJZJ+RUrI/a+tAX/ghZEG4ywSaP
         mzm5G/LR14DlXQrgXZhTlPZEj5AeRZw6qsXNPxms/YIw6ywGzbxTWeu6QC4fPsZxXwOh
         s6FQ==
X-Forwarded-Encrypted: i=1; AHgh+RpLoz2y63oEsgzmFjMtJ4aaRd9k6efrBbmBvNNEp4DOtG5yQyDnYQRJ1HM40izp4lHmFBevM+V081A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxgOLZDwdaw56Y3z0zCa6OadBFs4ETCbvTtK+LyQsiZLJsLe/k
	Dl7WblgXqU29ZQrKS1bvbpcLDYL1Gm54YWtlhghwj6swQLxApN8w7DNU4syfkIX0MX8FTNWWXoA
	Lepi90NmGWYX33tC8ykKK79WT25zKVEA=
X-Gm-Gg: AR+sD13Dm/mk/Nb/kSSm9q+Icrny+VzTAozQka2uliNsivqoAzqxcV4kkKwsN/5cozr
	YM/RuUwNTqQmvLK9dmqftt3bKMf5ofk/mW/uajYrdoD+ZjMQZ6kFk9kOzeo0QrLKUTpmug/YzFG
	P7rQAPWu3S3onnwcWsy0mLDw0GGYkV+c/LNMdiBELFl9QvO/bL00bfIgK4MGfv4+FMA/R1zgDaK
	jrrz1+nbwqipSr8RC3BseYxzACei48XC511wstyagNtYoKGEpvnEppxnpGqA5PWKsAQSVuVw+8J
	EOoHp2a67LubMxeQ9jGROHUZxlHZc6KLjoJNfaOTGQIM0Q==
X-Received: by 2002:ac8:7c4e:0:b0:528:3ae6:14b1 with SMTP id
 d75a77b69052e-52d85592b9bmr72905491cf.43.1786726093570; Fri, 14 Aug 2026
 09:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812182327.53694-1-chenmiao.ku@gmail.com> <20260812182327.53694-5-chenmiao.ku@gmail.com>
 <20260812222309.19b39299@foz.lan> <CAKxVwgeqTn=hAaGWOh1TBSqz122fPOQ=SrYQubAtpXPCiF9b=Q@mail.gmail.com>
 <20260813233601.50922c98@foz.lan>
In-Reply-To: <20260813233601.50922c98@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Sat, 15 Aug 2026 00:47:37 +0800
X-Gm-Features: AUfX_mwfkLXJg5LxCWpLN3x7KZyKC_RVzVkDAHWDGkj45wF_ua5EHnKdzEg2l8Y
Message-ID: <CAKxVwgdA7qLUKhhkDbfVooXO1Y=Vvnyz+J-6RRsAvxL3xRvUxg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] docs: sphinx-build-wrapper: prefer gmake
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8814=E6=97=A5=E5=91=A8=E4=BA=94 05:36=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 13 Aug 2026 17:38:59 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=
=B48=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 04:23=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Thu, 13 Aug 2026 02:23:21 +0800
> > > Chen Miao <chenmiao.ku@gmail.com> wrote:
> > >
> > > > Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> > > > wrapper invokes make directly when generating Info and Rust
> > > > documentation. This can make the dependency check succeed while tho=
se
> > > > documentation targets still use an incompatible make implementation=
.
> > > >
> > > > Honor MAKE when it names a compatible GNU Make. Otherwise check gma=
ke and
> > > > then make, selecting the first GNU Make 4.0 or newer. Use the commo=
n kdoc
> > > > detector to keep this selection consistent with sphinx-pre-install.
> > > >
> > > > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > > > ---
> > > >  tools/docs/sphinx-build-wrapper | 23 ++++++++++++++++-------
> > > >  1 file changed, 16 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-bu=
ild-wrapper
> > > > index 1bb962202..15c7e0938 100755
> > > > --- a/tools/docs/sphinx-build-wrapper
> > > > +++ b/tools/docs/sphinx-build-wrapper
> > > > @@ -63,6 +63,7 @@ SRC_DIR =3D os.path.dirname(os.path.realpath(__fi=
le__))
> > > >  sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
> > > >
> > > >  from kdoc.python_version import PythonVersion
> > > > +from kdoc.gmake_detect import find_gmake
> > > >  from kdoc.latex_fonts import LatexFontChecker
> > > >  from jobserver import JobserverExec         # pylint: disable=3DC0=
413,C0411,E0401
> > > >
> > > > @@ -97,6 +98,14 @@ class SphinxBuilder:
> > > >      with the Kernel.
> > > >      """
> > > >
> > > > +    def get_make(self):
> > > > +        """Select the first GNU Make 4.0 or newer in preference or=
der."""
> > > > +        make =3D find_gmake(self.env.get("MAKE"))
> > > > +        if make:
> > > > +            return make
> > > > +
> > > > +        sys.exit("GNU Make 4.0 or newer is required")
> > > > +
> > > >      def get_path(self, path, use_cwd=3DFalse, abs_path=3DFalse):
> > > >          """
> > > >          Ancillary routine to handle patches the right way, as shel=
l does.
> > > > @@ -569,9 +578,10 @@ class SphinxBuilder:
> > > >          texinfo directory.
> > > >          """
> > > >
> > > > +        make =3D self.get_make()
> > > >          for output_dir in output_dirs:
> > > >              try:
> > > > -                subprocess.run(["make", "info"], cwd=3Doutput_dir,=
 check=3DTrue)
> > > > +                subprocess.run([make, "info"], cwd=3Doutput_dir, c=
heck=3DTrue)
> > > >              except subprocess.CalledProcessError as e:
> > > >                  sys.exit(f"Error generating info docs: {e}")
> > > >
> > > > @@ -787,12 +797,11 @@ class SphinxBuilder:
> > > >
> > > >          if rustdoc and target in ["htmldocs", "epubdocs"]:
> > > >              print("Building rust docs")
> > > > -            if "MAKE" in self.env:
> > > > -                cmd =3D [self.env["MAKE"]]
> > > > -            else:
> > > > -                cmd =3D ["make", "LLVM=3D1"]
> > > > -
> > > > -            cmd +=3D [ "rustdoc"]
> > > > +            make =3D self.get_make()
> > > > +            cmd =3D [make]
> > > > +            if make !=3D self.env.get("MAKE"):
> > > > +                cmd.append("LLVM=3D1")
> > >
> > > Did you test bulding documentation with CONFIG_RUST=3Dy?
> > >
> > > AFAIKT, building rust docs only work with LLVM, as GCC doesn't build
> > > Rust code yet(*). When the time comes and gcc starts supporting it,
> > > the code would likely need to check for gcc version as well.
> > >
> > > (*) There is an experimental Rust support on gcc under development.
> > >     No idea about its current status. According with:
> > >
> > >         https://docs.kernel.org/rust/quick-start.html
> > >
> > >     "GCC also works for some configurations, but it is
> > >      very experimental".
> > >
> > > Thanks,
> > > Mauro
> > >
> > Yes, I tested it on macOS with CONFIG_RUST=3Dy using:
> >
> >     make LLVM=3D1 SPHINXDIRS=3Drust htmldocs
>
> No. I meant:
>
>         $ make LLVM=3D1 menuconfig                # enable rust
>         $ grep CONFIG_RUST .config              # check if it was enabled
>         $ make SPHINXDIRS=3Drust htmldocs
>
Thanks for clarifying. I retested with CONFIG_RUST=3Dy and then ran:

    make SPHINXDIRS=3Drust htmldocs

Indeed, there is an issue: the wrapper invokes `make rustdoc` without
`LLVM=3D1`, so the Rust documentation is not generated. I will update this
and retest in v4.

Thanks,
Chen Miao
>
> >
> > The Rust documentation path was selected and the wrapper invoked rustdo=
c with
> > the LLVM build configuration.
> >
> > The initial build exposed a few macOS host-build portability issues unr=
elated
> > to this series, including the lack of ELF headers required by host tool=
s and
> > GNU sed-specific uses in Rust-related build rules. After fixing those i=
ssues
> > locally, the rustdoc build and the Sphinx HTML documentation build comp=
leted
> > successfully.
> >
> > Those fixes are outside the scope of this series. If macOS host-build s=
upport
> > is useful, I can send them as a separate patch series.
> >
> > Thanks,
> > Chen Miao
>
>
>
> Thanks,
> Mauro
