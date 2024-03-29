Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DBD33CCD
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711680419; cv=none; b=M8z2K+IVVf0we+IlXd7sYVDG1OMZGajLNCJZdmubP43+0eRnVB3Vhz9jfAs6kh6SwCKKGK8P7N0hLiw0EuWeKnV8n5FDQwxthd2Cik1UyjR53nPUeycRM1ZiiYH9/m0t9l0+Hivm3oKOc5Z/f9dylfPXskDvVOegoUCRnd65l4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711680419; c=relaxed/simple;
	bh=eWfj+aGYOh7tjs+jt01tO7AIQL8yDYNEfz5E//jamXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3KHI7YL3rya00r/Y+dj+xDXf1asgqPs2KHmjDR76rIX8t66Pl1ixzyppFV6EoTK6Wl7F2t6kDflGiOVRy9fUri/USC8LHYBPLBwrY/WXJtw4a+oHniuiMMpmA04KOdemYe9WfnlPE/WqZITDOWHSoT0piC5k6/aq308i70rEDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gH8uu2E+; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gH8uu2E+"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-690c1747c3cso13220056d6.0
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 19:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711680417; x=1712285217; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srQfKT/BzMmZwEI+1YQrBRXDf12Tn35MF+VDUldciyU=;
        b=gH8uu2E+GKyyfIdZIjO9loj6nR0PmoPTt9O3ESBSvYWSYAacy2N48ApLV1zlytahOz
         b++sr17FGUBbBJpU5CAn3KIcPX6OJEH+DkejZzyYZO9fN6/uulSuYOMjdVTeWL32mdPk
         JSjoC5QKk2FR/WAwjeIZceoelpgN72SkR45ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711680417; x=1712285217;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=srQfKT/BzMmZwEI+1YQrBRXDf12Tn35MF+VDUldciyU=;
        b=j3AbSLFBymZcURYv9XZo3vn3yTQHCSL5uygttf0mCUlgi6Iq+9cWm1GbJUF7//z+Mv
         SdE9PuYXFbIKKfQb//v3CFwTqAcoBabkg45l/3jcjMGFoJN1Dq2y/XTN0RkxJUi3E42W
         Z+yfoq56FvnKT7uX3+C4oqb5ZeTVud6VIWOppd5J2C7jk1oyDRKypooS4J7LwMoMZm5O
         4i4TVgkKLXrT29P9j3p06RMTl10PO1aVIIQD7svZ3g+TMI1V7Oc2IkA3AESBi/UKvccB
         n0QVuTNKVcczfbwMNzl1vNuTVhZzZ/ci336CF1M/+mlhrMCn3toPSs12mkKQAcBE8WFV
         C+tA==
X-Forwarded-Encrypted: i=1; AJvYcCXjoZHlM87yVc0fGbxg+fAUgFwhzDy9+5Q+8SLES7FgCnS3Tjfk0o1N0dtEWyLXDoxf6Qfp5P1gUgV2bcaEltZriBzqWijv2L68
X-Gm-Message-State: AOJu0YwtVF3k4VnyL54v06KCC4ukAfRJMrrUJv6urHBLJG1FulqEEHys
	A2ZHkh0XSaqPIn70NqL5n7CYAyctYS25wW1do3uYZzlhhqVwgfp1UgKqCWfvhSpm/aDZNbuI2sb
	AbYkHbhfTNYEKSNRLCpSVjcxhs5TOm7MgUQYb
X-Google-Smtp-Source: AGHT+IFcNRIG4qyeHuU4viTDFJna3KUQm3AU7knSPFXXgF8+aPNLM3eXpw9YAj4qjYN4jlsYINmdFPQJFzf8SaGRmzE=
X-Received: by 2002:a0c:e948:0:b0:696:a309:1095 with SMTP id
 n8-20020a0ce948000000b00696a3091095mr6508219qvo.17.1711680416994; Thu, 28 Mar
 2024 19:46:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314042659.232142-1-sjg@chromium.org> <20240314042659.232142-3-sjg@chromium.org>
 <CAK7LNASWKyTXuPwj0_xaD=8_WfbXhejCe_Z+2Os2MD+mU_D5Fg@mail.gmail.com>
In-Reply-To: <CAK7LNASWKyTXuPwj0_xaD=8_WfbXhejCe_Z+2Os2MD+mU_D5Fg@mail.gmail.com>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 29 Mar 2024 15:46:45 +1300
Message-ID: <CAFLszTjpuMb7UGgGYZ9ybg7_ZBP_8GJwq=eA8=qc=2fTHKWOUw@mail.gmail.com>
Subject: Re: [PATCH v11 2/2] arm64: boot: Support Flat Image Tree
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Ahmad Fatoum <a.fatoum@pengutronix.de>, Nicolas Schier <nicolas@fjasle.eu>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, Will Deacon <will@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Wed, 27 Mar 2024 at 03:39, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Thu, Mar 14, 2024 at 1:28=E2=80=AFPM Simon Glass <sjg@chromium.org> wr=
ote:
> >
> > Add a script which produces a Flat Image Tree (FIT), a single file
> > containing the built kernel and associated devicetree files.
> > Compression defaults to gzip which gives a good balance of size and
> > performance.
> >
> > The files compress from about 86MB to 24MB using this approach.
> >
> > The FIT can be used by bootloaders which support it, such as U-Boot
> > and Linuxboot. It permits automatic selection of the correct
> > devicetree, matching the compatible string of the running board with
> > the closest compatible string in the FIT. There is no need for
> > filenames or other workarounds.
> >
> > Add a 'make image.fit' build target for arm64, as well.
> >
> > The FIT can be examined using 'dumpimage -l'.
> >
> > This uses the 'dtbs-list' file but processes only .dtb files, ignoring
> > the overlay .dtbo files.
> >
> > This features requires pylibfdt (use 'pip install libfdt'). It also
> > requires compression utilities for the algorithm being used. Supported
> > compression options are the same as the Image.xxx files. Use
> > FIT_COMPRESSION to select an algorithm other than gzip.
> >
> > While FIT supports a ramdisk / initrd, no attempt is made to support
> > this here, since it must be built separately from the Linux build.
> >
> > Signed-off-by: Simon Glass <sjg@chromium.org>
> > ---
> >
> > Changes in v11:
> > - Use dtbslist file in image.fit rule
> > - Update cmd_fit rule as per Masahiro
> > - Don't mention ignoring files without a .dtb prefix
> > - Use argparse fromfile_prefix_chars feature
> > - Add a -v option and use it for output (with make V=3D1)
> > - rename srcdir to dtbs
> > - Use -o for the output file instead of -f
> >
>
>
>
>
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -504,6 +504,21 @@ quiet_cmd_uimage =3D UIMAGE  $@
> >                         -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
> >                         -n '$(UIMAGE_NAME)' -d $< $@
> >
> > +# Flat Image Tree (FIT)
> > +# This allows for packaging of a kernel and all devicetrees files, usi=
ng
> > +# compression.
> > +# --------------------------------------------------------------------=
-------
> > +
> > +MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> > +
> > +# Use this to override the compression algorithm
> > +FIT_COMPRESSION ?=3D gzip
> > +
> > +quiet_cmd_fit =3D FIT     $@
> > +      cmd_fit =3D $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
> > +               --name '$(UIMAGE_NAME)' $(if $(V),-v) \
> > +               --compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
> > +
>
>
>
>
> A nit in your new code.
>
>
> $(if $(V),-v) does not work for KBUILD_VERBOSE env variable.
>
>
> It should be
>
>     $(if $(findstring 1,$(KBUILD_VERBOSE)),-v)

OK, thank you. I was assuming that V=3D0 would not be passed, but this
is better. I will send v12.

Regards,
Simon
