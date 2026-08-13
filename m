Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5585944CACA
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613979; cv=pass; b=bb7XE2PWB9ojHaS+ch79gq9p1dpVmk7wAhYFomP4GnuN3IVD7Jg0FMZIArlk13UVMcPcauSzNgE8AC6pYLV/KMFV0h2uiVfV1C7iVbJ6mqeZcyKcu667X3rFYRObQ3sULVCQDIW/vg+3b9e7DeBZ/dUl4QCcumhzSkUKfw5TUDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613979; c=relaxed/simple;
	bh=Hi+iT7wr5AKIrlbJr6hsodmWWKtvkqpa+TDF/208NC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uU49hw4Y+JadaIBKsZAf+Od75BdT3fqysvLsItjsHwfOq50H+gU8V12K7vAJnsr59Vps/vpryOGlsnRzIQq15qPvOhyYxtqWTBa4rM/D3oxUZnHkXGxZf8PP+EQYKqO09NoQy7wZ8WdWdxJ+lPwMyQd3FTKyYASqqe87LnWxBww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jABgIZ5W; arc=pass smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jABgIZ5W"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-934a3d14924so190187285a.2
        for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 02:39:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613977; cv=none;
        d=google.com; s=arc-20260327;
        b=aVCR/40FAq9h/MKyhFPG31Bhzki6rsxP8qE/N8tP+JAHCdMOWgI5eWZefSOk8xRY/3
         SEXwApyQKItdMvznL3hWsmTR92+Qt2wlmJJO95qcoM4wJSwiT0B9YsP8ffI467noo+MN
         C50t3JrpG8ZyStdyYcBx1epj4SQOwRhKaLSq1ADhHHW7pCPo5YaxUd4ET2I8lshsa9gA
         w4sqPZO5/yxUmuhf5NIiUhRK4mGldroTEv1HO0Z+tye6ACEgEubXBv6ISszcBjWqJdeL
         /E8e9tIbKhSlWV/Dz1UnmFEOOPu75AS/qlv6mlf75yMLxa4xL9oAk2LjjK5xXD63nxE/
         zWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bG1UDM2V8Sn1y8qQxTMsi/U5GSyN9th5GWi21+Vtx1c=;
        fh=qzFueOJGQcOqXhUJ5UJd3623Y1WEJQzvK6biTG5jo2A=;
        b=m+NXW7KJ2uWXj3wq3psdtCjTdab1M7hkQ6daP9P15Q7Rb0ifcKacA7lPvmb6N1ktO1
         M/TjeaHar5K3jUkEwTLEU6b/TcHFdRjB1fn9pAEyizTNyErKB0KGQ6Ut5bCsrbCiSTYz
         EeR7TuEhdq4RIYZpFn0BM6HDJCqYJkOvIpqp/bvr6vS9gHAokYasdbir5M4Dr7VRWem2
         WS/NTlLRMTcI//iIlUZyNnlYfbZQwHMTQ0FB7WPbZjAGWRoocgIVC40QE+Cpm2hWmrlY
         Yz9fvV9IrL0rdXahmpq7YxjsWq1KZV6ztCBKwhVMyywRdXIIsQpbSajLE9lptp0oNzYM
         WHYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613977; x=1787218777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bG1UDM2V8Sn1y8qQxTMsi/U5GSyN9th5GWi21+Vtx1c=;
        b=jABgIZ5WEvN8OgVVcEtfk8AD+uNEEaLvHVoD7veubUOnNP14ef0ljA6qlkpu8EHt//
         NYbks4yW5NTmYjGVXe2YfjT3YglwRYbGtKDipMkllZs6CA9iuQb7ZKHiELyY2AWs3l+d
         FSDVcSw0EdyDkQ3Fetvn28dKmGYNMvBLeJAxSR1CcdmUhwm6Yaf0TNnYdVGP7Mhxu1Ij
         eGZaGOZAFzqVSNSk0Sguc6Ujxic0yWIBBv79/PTJ2K6pg5i4xO1zIGUpMwgfdmqZGxof
         XPu38hYC9ieF2YntHhPY3zxJsrn963pOwfuAZgt1YvJPJVTIm4DwppWRT0eMW1SvMjYZ
         YCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613977; x=1787218777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bG1UDM2V8Sn1y8qQxTMsi/U5GSyN9th5GWi21+Vtx1c=;
        b=JzFu5h0gYVnCEJZmC/PxpieKTQRiSC3c5fVlxQ1EtOOgNNhHBZZbYgtBBDIqA6lv8M
         JqblGMC/zYfFwE/4jVE2ciY+NKcWa4nQLXg47JitLTQjYNwlmqFHTmfaLVqBblymUqYk
         L56brZb2juXcmb3da0Aenc+ZeOEXSTcPdJWQ4NSP2cWin+TISV3yAzVA9h1i0h1CXMEj
         PaMM2nH6I5nCPsFbEL68Y7Qr/1IHVKT5uB1IiXf9rlr0ccq5Re6ZNJVvTLBfHOJn65/q
         OizbBPVWTAVLHeoCjSGNuaUOFwYfpPZiV4iHAcoqJ3wv2lrtoPu3umFWxMew9iUv6t4x
         qDFg==
X-Forwarded-Encrypted: i=1; AHgh+RpW3y3nSb1s743Wc3VS/Oxb5GJ5Zz2nP2NCxzMflK1xb7M1f+5Xt1zJydRCEX30BUILVcY1jDKkisY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUxt2321T321K9s6p8mYTs1wb7IRjo+YdVVhQFbsoExJeai8KR
	iXo7F8h7T8ddlf7t1gK2yD8CP7njed5FqWZA/cZkgL9cUJS4vHFwDk1nU5luYpcfCZ7j4Qc0cTe
	f1YpZZR7hMXbWHOmLdlc4Lcpa4h7+2lQaT3RzzCGUCvIF
X-Gm-Gg: AR+sD108DrtSEGvnZRKnHJCHIts9vQtFVJOgpr8/cS7gnFTecJ1NPeKjkU0ZIGHbrKl
	9fL018w82cAQpKEDkw8FEfQPNEIYZi14zEXkwX1RaF+2d3Ub2vdBpQcx124dCLc05+/7WIgMBPL
	jid7DfSBEf41kk7Y3JDohf3cbdHwDtZny6Cm8TQn4EC3Pf6MlBgJAZNk+r35iqWvKcvNkAPxAIm
	A+o133JmWZZJTz/P32NDJ4mXG2YA8Q8MMqtj9am+QuBZbukchUP4l3jK3tspME3nkCN8UVVmlfr
	rNTPUOBWIkQJZZRy+Z6TbPGdsthoxZFrJBoM8F1OL1tERg==
X-Received: by 2002:a05:620a:262a:b0:92e:e7e0:ea45 with SMTP id
 af79cd13be357-936bfb0cb09mr435039285a.47.1786613977106; Thu, 13 Aug 2026
 02:39:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812182327.53694-1-chenmiao.ku@gmail.com> <20260812182327.53694-5-chenmiao.ku@gmail.com>
 <20260812222309.19b39299@foz.lan>
In-Reply-To: <20260812222309.19b39299@foz.lan>
From: Chen Miao <chenmiao.ku@gmail.com>
Date: Thu, 13 Aug 2026 17:38:59 +0800
X-Gm-Features: AUfX_mxpJis7lpCZgr0sUjzcpILx8NOjE0_JLnHZXOA2sXIMG3nFeKV6efxTFbQ
Message-ID: <CAKxVwgeqTn=hAaGWOh1TBSqz122fPOQ=SrYQubAtpXPCiF9b=Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] docs: sphinx-build-wrapper: prefer gmake
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev, 
	skhan@linuxfoundation.org, dzm91@hust.edu.cn, mchehab@kernel.org, 
	wy@wyuan.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> =E4=BA=8E2026=E5=B9=B48=
=E6=9C=8813=E6=97=A5=E5=91=A8=E5=9B=9B 04:23=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 13 Aug 2026 02:23:21 +0800
> Chen Miao <chenmiao.ku@gmail.com> wrote:
>
> > Homebrew installs GNU Make as gmake on macOS, but the Sphinx build
> > wrapper invokes make directly when generating Info and Rust
> > documentation. This can make the dependency check succeed while those
> > documentation targets still use an incompatible make implementation.
> >
> > Honor MAKE when it names a compatible GNU Make. Otherwise check gmake a=
nd
> > then make, selecting the first GNU Make 4.0 or newer. Use the common kd=
oc
> > detector to keep this selection consistent with sphinx-pre-install.
> >
> > Signed-off-by: Chen Miao <chenmiao.ku@gmail.com>
> > ---
> >  tools/docs/sphinx-build-wrapper | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-=
wrapper
> > index 1bb962202..15c7e0938 100755
> > --- a/tools/docs/sphinx-build-wrapper
> > +++ b/tools/docs/sphinx-build-wrapper
> > @@ -63,6 +63,7 @@ SRC_DIR =3D os.path.dirname(os.path.realpath(__file__=
))
> >  sys.path.insert(0, os.path.join(SRC_DIR, LIB_DIR))
> >
> >  from kdoc.python_version import PythonVersion
> > +from kdoc.gmake_detect import find_gmake
> >  from kdoc.latex_fonts import LatexFontChecker
> >  from jobserver import JobserverExec         # pylint: disable=3DC0413,=
C0411,E0401
> >
> > @@ -97,6 +98,14 @@ class SphinxBuilder:
> >      with the Kernel.
> >      """
> >
> > +    def get_make(self):
> > +        """Select the first GNU Make 4.0 or newer in preference order.=
"""
> > +        make =3D find_gmake(self.env.get("MAKE"))
> > +        if make:
> > +            return make
> > +
> > +        sys.exit("GNU Make 4.0 or newer is required")
> > +
> >      def get_path(self, path, use_cwd=3DFalse, abs_path=3DFalse):
> >          """
> >          Ancillary routine to handle patches the right way, as shell do=
es.
> > @@ -569,9 +578,10 @@ class SphinxBuilder:
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
> > @@ -787,12 +797,11 @@ class SphinxBuilder:
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
>
> Did you test bulding documentation with CONFIG_RUST=3Dy?
>
> AFAIKT, building rust docs only work with LLVM, as GCC doesn't build
> Rust code yet(*). When the time comes and gcc starts supporting it,
> the code would likely need to check for gcc version as well.
>
> (*) There is an experimental Rust support on gcc under development.
>     No idea about its current status. According with:
>
>         https://docs.kernel.org/rust/quick-start.html
>
>     "GCC also works for some configurations, but it is
>      very experimental".
>
> Thanks,
> Mauro
>
Yes, I tested it on macOS with CONFIG_RUST=3Dy using:

    make LLVM=3D1 SPHINXDIRS=3Drust htmldocs

The Rust documentation path was selected and the wrapper invoked rustdoc wi=
th
the LLVM build configuration.

The initial build exposed a few macOS host-build portability issues unrelat=
ed
to this series, including the lack of ELF headers required by host tools an=
d
GNU sed-specific uses in Rust-related build rules. After fixing those issue=
s
locally, the rustdoc build and the Sphinx HTML documentation build complete=
d
successfully.

Those fixes are outside the scope of this series. If macOS host-build suppo=
rt
is useful, I can send them as a separate patch series.

Thanks,
Chen Miao
