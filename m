Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B61E13D891
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661588; cv=none; b=nQeKrbHKqGIqcnuVXNNVj014UbsCwzfF7S/iLuYoiMAZBpAQ6xkdzYlVAz9DquOIN1TMDU3GAuCBXabUe7KllrbkOLVzb690nXhQsSIXTxdeKu4jqJMGdrsLIqvAPRCqF1XeKdrx00DMynpHg7iH9ks+dDm/9LtrB1EYcxqcWR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661588; c=relaxed/simple;
	bh=dUZsPxiboemrxzlg0bRrD9DSleQq71obmUPOjrt27rM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxLg3JKHY9zYi5F6F6RyfLI8VgqMIT9Ou75EQRv+HdCKV0xr7Nl2sUdkOZ7dJvg8dpiZZ0wEvHHs2xXu72ZjrjpRP2JL/e9HTWUjrZzrxi8UyP92BWEwzHknV8iGhjScxy81cFhNKjRU6b0xd6cepf80A2cipMTW8FybWakoN/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WTNV9OGW; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WTNV9OGW"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-27b7a1480bdso2859695fac.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 22:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661586; x=1730266386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2BVVsPms2VTYy8LkzsMQIzjCP1ESnZEVbJdWiqoIGa8=;
        b=WTNV9OGWgSp7aAMxEZvtNOeDl7ZevYxc/qlhxIWXxx2bzEbAe6BaslmlMPEugg0f4R
         JpNby3X73j3BtnvPveNQzHpFXJPM9smOdfUCF9gzek3EanqaM8qZj+JoaYNTaiu+Z4cT
         +DJQjUozoedF+eA2hJ9X3DvGhD94/D7t7ajQ1B28tS/n6RzKK3MahyhkxE4HfdCaVDQU
         Ug2/PLhuLLl8TzpV61m6USzpuCD6fcOG8+sH5OMyrM5YR6/hjVkxGtYOySKmTbkg+Uy5
         9rs+OK7WsHmLXECNP94F14eDLI5lePn5tqh3zGXV1NK7KInYTpumJSaeC4WqXzS9AX++
         wXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661586; x=1730266386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BVVsPms2VTYy8LkzsMQIzjCP1ESnZEVbJdWiqoIGa8=;
        b=XL7d/5fyrPFet7BPsF9xmXWho7jlwgSQEVFHM/tL6mw+w2QM0YGF5KGoJ8urKA9e/e
         3tuycDbVdsOYNnhB1Ljf3lFuHSdq+IVjLbXiuRR+qtXlCGeZWuvmAv7Bq28kA3JOXOS5
         w7LThuo+1vtecpArQDH3FGsRbvxXfXTiIl3mdmQaC0PNckvQyQSv1c1s0/NSSsRsRxKa
         DNmynH2qRI/33RAzlc3pIcraQn6/Dezl/+1qp006Lnrjcc+C9hsmyMRhAUaDCKVi7Lyq
         fooCDXPwRkZ+TWATG59m497AGSK9l41R3MjO0DwsbnImDqzg7fgke4KDNDN1D2e6Podk
         CRxA==
X-Forwarded-Encrypted: i=1; AJvYcCXGrebDA1Shto1lSufIxTyMgBTcCx3+SgK13Y2wZ3I5TjtK6xb7GeRiI+eZ6jdiDKCdgw4AMY6OxzA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGuppM7a0IkOeBndYzCzj3+bbnCjPM0kCZSG/lffqprESnm6/C
	eGz7yXVZJJqJoI4jukFydRTGbVcjVnBTXQCYTy/a1EoVAraX2tih2TFagzDX0w+89lxIVH5Tlpk
	6MyW/FmDgpMMt9b3pFjA/nj2yD8E=
X-Google-Smtp-Source: AGHT+IHKezwuPoQFDa+KbeWjpi5zDmRgS7zOtz0GWUNXyyYlXGHtooiMP1HohuR2871QPxlLWmZGp9mSSQWjIiiQ3CI=
X-Received: by 2002:a05:6870:471e:b0:277:eea4:a436 with SMTP id
 586e51a60fabf-28ccb405f8cmr1384647fac.7.1729661585878; Tue, 22 Oct 2024
 22:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD-N9QUgp+W3Us2QFNF9Emde1Yb98_Mco3a-gbrfuMssVVbJLQ@mail.gmail.com>
 <b5f4583a-eaea-4117-b759-ab68d1ce351b@infradead.org>
In-Reply-To: <b5f4583a-eaea-4117-b759-ab68d1ce351b@infradead.org>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Wed, 23 Oct 2024 13:32:39 +0800
Message-ID: <CAD-N9QXy7XpsZgwq+f93eVHh5jqm9HLEBoXk4OehYmXQgrTamA@mail.gmail.com>
Subject: Re: Translation order of documents
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Alex Shi <alexs@kernel.org>, YanTeng Si <si.yanteng@linux.dev>, 
	Jonathan Corbet <corbet@lwn.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> [adding Nick D. as author]
>
> On 10/17/24 10:32 PM, Dongliang Mu wrote:
> > Hi guys,
> >
> > when I translate kbuild/llvm.rst, I find this document seems depends
> > on the reproducible-build.html. The depenency means, A will refer to
>
>                       builds
>
> > B, like the following contents.
> >
> > ``ccache`` =E5=8F=AF=E4=BB=A5=E4=B8=8E ``clang`` =E4=B8=80=E8=B5=B7=E4=
=BD=BF=E7=94=A8=EF=BC=8C=E4=BB=A5=E6=94=B9=E5=96=84=E5=90=8E=E7=BB=AD=E6=9E=
=84=E5=BB=BA=EF=BC=88=E5=B0=BD=E7=AE=A1=E5=9C=A8=E4=B8=8D=E5=90=8C=E6=9E=84=
=E5=BB=BA=E4=B9=8B=E9=97=B4
> > KBUILD_BUILD_TIMESTAMP_ =E5=BA=94=E8=AE=BE=E7=BD=AE=E4=B8=BA=E5=90=8C=
=E4=B8=80=E7=A1=AE=E5=AE=9A=E5=80=BC=EF=BC=8C=E4=BB=A5=E9=81=BF=E5=85=8D 10=
0% =E7=9A=84=E7=BC=93=E5=AD=98=E6=9C=AA=E5=91=BD=E4=B8=AD=EF=BC=8C
> > =E8=AF=A6=E8=A7=81 Reproducible_builds_ =E8=8E=B7=E5=8F=96=E6=9B=B4=E5=
=A4=9A=E4=BF=A1=E6=81=AF=EF=BC=89::
> >
> > KBUILD_BUILD_TIMESTAMP=3D'' make LLVM=3D1 CC=3D"ccache clang"
> >
> > .. _KBUILD_BUILD_TIMESTAMP: kbuild.html#kbuild-build-timestamp
> > .. _Reproducible_builds: reproducible-builds.html#timestamps
> >
> > I have several questions in mind:
> >
> > 1. Should we show this dependency graph for translators? This may help
> > improve translation. Otherwise, it may occur that A has been
> > translated, but it depends on B. And B needs translated so that the
> > translation of A can be merged.
> >
>
> Yes. (IMHO)

If no one write code to collect this graph, our hust openatom club
could help contribute this script.

>
> > 2. Would there exist the loop? A depends on B and B depends on A
> > directly or indirectly.
> >
> > If we only need to keep the documents in the mainline ready for
> > reading, it seems not a problem.
> >
> > P.S., it seems current docs building cannot detect invalid URL in the
> > documentation tree.
>
> Hm, I thought that there was a script in scripts/ for that but I don't se=
e it...

I asked this question because I did not find this tool or script in
the mainline tree.

This script seems useful. It could help prune old/invalid link and
prevent invalid links into documentation tree.

Dongliang Mu

>
>
> --
> ~Randy
>
