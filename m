Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58362283FEF
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358869; cv=none; b=uX/eeNsoMfbIQp2cD+Qex6UxHoU/iJs+hUf7OjYJ3QsfD/mUVLmdYpRHU6GhjKqmZdz5MKKjMLVPJSPLC0DLMITofQhUaGRXDoxv0oHzjgYFtX+eqYQox7HWD2HX1uaN1/PfryHyoFS2rlCzxXKRlsL1rvqFJRfwkA3BHmmsqkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358869; c=relaxed/simple;
	bh=0LTR/xpw1APtPOYdZ+uCR7ne7xhUae69qQ73W3K+boM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SWsXPjKN4nI8ju3qxDEGJYzMMZcUugolBRLIsQ6rG2ZWuhTmVcx8lzQvPzj/xhNBO4ZzxwipFEnZAylECh8PxgwJn0jdlA0CP6G6zmpJ8YiI+XBpiUuunYW9rqLznJ3FO+oVmpWBUxN6zReB9lyaGvCqzUKYLYHpFOSDZkNeOGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9aY35S; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9aY35S"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-640f88b873bso3355365d50.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 21:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763358866; x=1763963666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kOFsAT0hiJSJ7VYu50+ClrsqCsqBq/IiZ92ubIUqCo4=;
        b=kJ9aY35S+8m8v/8TgzjdBgXCEX3Bg06DEM9rVUPmFifo6ceVpwSykvmwbVV51ufEVM
         k51usGIweVmlCaF852/xQp6o2GJwaCEGDhQeeAfgtCvlOfAyL7Jt7i1vTYNsDO3ystvR
         6vFEPGY9PGyd/3/HtqaqF3B3dMCahlTK6SuRcl1c0FO+1nMWzzeV/xpLpChoBskVl1fo
         Zr0Y3qw14jqlFjAYyL+i5g9Al5E/p+47juZ65oSdWPmy5kFXKlO2BvP04mqrsIXxrJip
         0M1ymtqjFSXLAi5dQoZvCnfFAA0m4Oi9dHpT53pGMAzmHy77aww3zZUjiZjlVHMIH8ZB
         twFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763358866; x=1763963666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kOFsAT0hiJSJ7VYu50+ClrsqCsqBq/IiZ92ubIUqCo4=;
        b=G9uyt3opqsDtfUDnG8BJ7l0KyGB3YlFimUmUJ2c3kRfDIrCLsaUYq1dUuOEhGnr4KU
         Obhl+jnczoLSKuE1v+zAM9Y0GGGfTWTtN0rSeveHMvCCP7oWvLM7+YByg+dyvxpnDFfm
         ZQotcLfJsRxGoG4iY1rLYQ4jKm4c4iMaETqUxTaieUG45PnK4NOUe3NCgb5p/+4goytE
         T7MaSL2IfAty3FOdCkya8tpmBv8Y1wzai7wrLRpOqXbp4TTfpDeLC1V941OgL0bblZkx
         JpcUj2epQMQSASEoxV7Ty1ZgQUfJfTTYgO5KgxdTNyW15lllDcIz2wzYSc19iXXalS03
         FTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9yLN9ofIqLppqfv8wxGj7o570XbIH2093pSunJfHBPyjdmPbQrunLnu180mMNT4vU2ohELzr8bDs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2FqRq4INRfwXU0mV/aZCUl6sg4CKDUNKeS129vVt8LdMv7Jh6
	UK+g8Rx1Cs2iUMrRQe4qNJMfwROt4by3T0uGh89VJmhGyyZZ59Zih8sbyykkSbgftGclgbb80aQ
	2Dgg8WnG6+68JCMqpqs2wowRZul1FrLs=
X-Gm-Gg: ASbGncs20OflaaVg7e2rXm6B214RyWYDjxIqzi6LaPpWHONZ6SLKRZIyhsdYAnw/Duf
	z7pn1tSg6fmuhU6AKFlE7x3wUrJ4hL1NyI7po1WLgYiUwEDGmmRgn5A+M1Gc+canGYOZX3knYsg
	u8Vxs4VMKuc16yNfofH6ZtvFp7Pysf2s/z/+2tZQxrY30gkXIiC2+VcKvLxGboWzxjChB/4U8VD
	U3WE3rN2YxX9NdPpoUW0pp/AnrTHwI0eowswr8U4P+Yokg8figa1Hya0gIZf58mT2NFiVAhNxdM
	dqrL
X-Google-Smtp-Source: AGHT+IE5lNbgsCDGAqb3KT/GVfhcavAvZqRL6w2Lq6IP0yDLTb5ab5WdwKiL925tfEh4y9AmotEB+7CxWaNxafXYE1g=
X-Received: by 2002:a05:690e:418b:b0:63f:aa5b:bcf3 with SMTP id
 956f58d0204a3-641e7655292mr9813679d50.36.1763358866235; Sun, 16 Nov 2025
 21:54:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106015148.54424-1-zhaochenguang@kylinos.cn>
 <7e6096ab-18bd-4438-8fbb-3f530ee9e69f@hust.edu.cn> <CAJy-AmkC_UBtk1VmmVOG-Y_UB4kKAZ9rq+3U6r==A1HVDjt9vw@mail.gmail.com>
In-Reply-To: <CAJy-AmkC_UBtk1VmmVOG-Y_UB4kKAZ9rq+3U6r==A1HVDjt9vw@mail.gmail.com>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Mon, 17 Nov 2025 13:54:00 +0800
X-Gm-Features: AWmQ_bmAc4lcm58evIfL5Q0gGAvITmJCzlVQjfXXOCRufZjHiS50KX-liYMkscM
Message-ID: <CAD-N9QUUHmuC=jT+_mVKhMDstrb+9_-g+2zSKD3a9hrCtYnk1Q@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add kbuild timestamp Chinese translation
To: Alex Shi <seakeel@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Chenguang Zhao <zhaochenguang@kylinos.cn>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 1:32=E2=80=AFPM Alex Shi <seakeel@gmail.com> wrote:
>
> Applied, Thanks

Hi Alex,

Please revert this patch since I do not give my reviewed-by tag

>
> Dongliang Mu <dzm91@hust.edu.cn> =E4=BA=8E2025=E5=B9=B411=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=94 00:34=E5=86=99=E9=81=93=EF=BC=9A
> >
> >
> > On 11/6/25 9:51 AM, Chenguang Zhao wrote:
> > > Sync the translation of changes in kbuild/kbuild.rst about
> > > KBUILD_BUILD_TIMESTAMP.
> > >
> > > Update the translation through commit 5cbfb4da7e06
> > > ("kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation")
> >
> > Hi, I know where the problem is.
> >
> > If you want to improve or revise the kernel documentation, please
> > directly submit the changes to the original English document. Our
> > Chinese translation for now is just the translation of the English
> > documentation.
> >
> > And this commit id should be the commit of the corresponding English
> > documents.
> >
> > Take kbuild/kbuild.rst as an example, the latest commit of Chinese
> > translation shows:
> >
> > -----------------------------------------------------------------------=
------------------------------------
> >
> > docs/zh_CN: add the translation of kbuild/kbuild.rst
> >
> > Finish the translation of kbuild/kbuild.rst and move kbuild
> > from TODO to the main body.
> >
> > Update to commit 2eb5d7f24299 ("kbuild: doc: describe the -C
> > option precisely for external module builds")
> >
> > Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> > Reviewed-by: Alex Shi <alexs@kernel.org>
> > Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> >
> > Link: https://lore.kernel.org/r/20241016131710.2619567-1-dzm91@hust.edu=
.cn
> >
> > -----------------------------------------------------------------------=
------------------------------------
> >
> > However, the commit history of English documentation goes further:
> >
> > 2025-01-15    kbuild: rust: add PROCMACROLDFLAGS
> > 2024-11-28    kbuild: support building external modules in a separate
> > build directory
> > 2024-09-24    kbuild: doc: describe the -C option precisely for externa=
l
> > module builds
> > 2024-09-20    kbuild: generate offset range data for builtin modules
> >
> > We need to update the new translations of doc changes in ("kbuild: rust=
:
> > add PROCMACROLDFLAGS") and ("kbuild: support building external modules
> > in a separate build directory")
> >
> > >
> > > Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> > > ---
> > > v2:
> > >   - modify the commit message as suggested by Dongliang and add
> > >     a corresponding commit info for the English documentation.
> > > ---
> > >   Documentation/translations/zh_CN/kbuild/kbuild.rst | 9 +++++++--
> > >   1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Doc=
umentation/translations/zh_CN/kbuild/kbuild.rst
> > > index e5e2aebe1ebc..ad3e84eabbbf 100644
> > > --- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
> > > +++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> > > @@ -290,8 +290,13 @@ IGNORE_DIRS
> > >   KBUILD_BUILD_TIMESTAMP
> > >   ----------------------
> > >   =E5=B0=86=E8=AF=A5=E7=8E=AF=E5=A2=83=E5=8F=98=E9=87=8F=E8=AE=BE=E7=
=BD=AE=E4=B8=BA=E6=97=A5=E6=9C=9F=E5=AD=97=E7=AC=A6=E4=B8=B2=EF=BC=8C=E5=8F=
=AF=E4=BB=A5=E8=A6=86=E7=9B=96=E5=9C=A8 UTS_VERSION =E5=AE=9A=E4=B9=89=E4=
=B8=AD=E4=BD=BF=E7=94=A8=E7=9A=84=E6=97=B6=E9=97=B4=E6=88=B3
> > > -=EF=BC=88=E8=BF=90=E8=A1=8C=E5=86=85=E6=A0=B8=E6=97=B6=E7=9A=84 unam=
e -v=EF=BC=89=E3=80=82=E8=AF=A5=E5=80=BC=E5=BF=85=E9=A1=BB=E6=98=AF=E4=B8=
=80=E4=B8=AA=E5=8F=AF=E4=BB=A5=E4=BC=A0=E9=80=92=E7=BB=99 date -d =E7=9A=84=
=E5=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E9=BB=98=E8=AE=A4=E5=80=BC=E6=98=AF
> > > -=E5=86=85=E6=A0=B8=E6=9E=84=E5=BB=BA=E6=9F=90=E4=B8=AA=E6=97=B6=E5=
=88=BB=E7=9A=84 date =E5=91=BD=E4=BB=A4=E8=BE=93=E5=87=BA=E3=80=82
> > > +=EF=BC=88=E8=BF=90=E8=A1=8C=E5=86=85=E6=A0=B8=E6=97=B6=E7=9A=84 unam=
e -v=EF=BC=89=E3=80=82=E8=AF=A5=E5=80=BC=E5=BF=85=E9=A1=BB=E6=98=AF=E4=B8=
=80=E4=B8=AA=E5=8F=AF=E4=BB=A5=E4=BC=A0=E9=80=92=E7=BB=99 date -d =E7=9A=84=
=E5=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E4=BE=8B=E5=A6=82::
> > > +
> > > +     $ KBUILD_BUILD_TIMESTAMP=3D"Mon Oct 13 00:00:00 UTC 2025" make
> > > +
> > > +=E9=BB=98=E8=AE=A4=E5=80=BC=E6=98=AF=E5=86=85=E6=A0=B8=E6=9E=84=E5=
=BB=BA=E6=9F=90=E4=B8=AA=E6=97=B6=E5=88=BB=E7=9A=84date=E5=91=BD=E4=BB=A4=
=E8=BE=93=E5=87=BA=E3=80=82=E5=A6=82=E6=9E=9C=E6=8F=90=E4=BE=9B=E8=AF=A5=E6=
=97=B6=E6=88=B3=EF=BC=8C=E5=AE=83=E8=BF=98=E7=94=A8=E4=BA=8E=E4=BB=BB=E4=BD=
=95initramfs
> > > +=E5=BD=92=E6=A1=A3=E6=96=87=E4=BB=B6=E4=B8=AD=E7=9A=84mtime=E5=AD=97=
=E6=AE=B5=E3=80=82Initramfs mtimes=E6=98=AF32=E4=BD=8D=E7=9A=84=EF=BC=8C=E5=
=9B=A0=E6=AD=A4=E6=97=A9=E4=BA=8EUnix=E7=BA=AA=E5=85=831970=E5=B9=B4=EF=BC=
=8C=E6=88=96
> > > +=E6=99=9A=E4=BA=8E=E5=8D=8F=E8=B0=83=E4=B8=96=E7=95=8C=E6=97=B6 (UTC=
)2106=E5=B9=B42=E6=9C=887=E6=97=A56=E6=97=B628=E5=88=8615=E7=A7=92=E7=9A=84=
=E6=97=A5=E6=9C=9F=E6=98=AF=E6=97=A0=E6=95=88=E7=9A=84=E3=80=82
> > >
> > >   KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> > >   ------------------------------------
> >
>
