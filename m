Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3FC21FF33
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763357545; cv=none; b=o9PEzqkLxHO+pah/crClcLNJ1QdYxTPU4a+2a+8Prz1HBFJureLDVGbaX2fJ1r/StgvSBXGrgxl+gO7nh+6zU8K6XML+jpNrZXTbJOxFK9J6BjFJFB+djirQY/EUYzTuIdwqSqkbOFwOo01cv3Zu1TZtWPVeJxxf28cKTdFd58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763357545; c=relaxed/simple;
	bh=uNbaEaEXGNmjsEP1CHlyq0opQkSsuWiMHSk6DQEDp0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h6gjdD0O+oE25MQYRXpOwmykTNER3+WXC1bgQu3iY1GdnsSljgdKQBCUELxNkJrXmqEkXmKd04FrGTz2LrS6wTToC5d4wInWep4CJ20+e1EIbvJG1kM9sEQM5IY5P9hBN/Nvzni8G/b6tsAPEGNyfdEsRBLVbYbYzSsqnv2x/Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShNlAcEK; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShNlAcEK"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b73875aa527so174092766b.3
        for <linux-doc@vger.kernel.org>; Sun, 16 Nov 2025 21:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763357541; x=1763962341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MhZUFHNgPMnWNanvXchbxVuOdhKWzw4NGAvv23LINTE=;
        b=ShNlAcEKx4Ui7jM6y2M9LdvfvzHAX/3OOS7+5Js61DqEVi/5ZUhbaNHDcjH/C+QdQg
         nTr3OH6fj7a9IOyu8NHENhfz9khRKDx+JRl+t4khh/VZFJSlWngORa2Rcm0DU5CR+IJQ
         kEO9PlIAx6TLxHY6VU10vmfl1F9iKFtqiud/bunkcZbxBJ06lyW/MQXebA7+3Lk4KCo8
         lq9UGdCA+3OR2SvIkT2SUKf/1Xsho1ymx2NwYDjhbqAKmmJyH/nSndRNZIeUOY1rWNdg
         8yk3bn5zHzcsh4FrmkMCib3JXG41QgUJue8AKiBR6bzYYwIyM5a8FOfG2FhdWYcRK/1o
         iTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763357541; x=1763962341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MhZUFHNgPMnWNanvXchbxVuOdhKWzw4NGAvv23LINTE=;
        b=PJr/tKsmxZLdYPLWUqkfnMIkgt2aaMHC9Axzi6JhhXXSn8Y64O4fdcLQZf0flupQax
         A75Abe3lTU0b/eDGHZFy7WkXHGyIwrAIwOC/i3tWgLNzfZM8xOUJnV6RYLeDAJ1GP+2Y
         PUxutXx3TgRxz0Qyb+ur/U6BoxTeXymsR4Pem/W3/kOHn6QugbFVEf02qBLSO0SkffuL
         klfxY5vC37i5MvzQ2DJAIqw6GntzDKy32BsGIzlLMZvyIYFTPNAdbh6KBfw1KbxPUHL2
         HPljCUShD8o/Oi0e5APw1PPVrdRP4QPO9EEUYS5YYNh9N6F/eOSxNLPHGh16rhAisBno
         q7HA==
X-Forwarded-Encrypted: i=1; AJvYcCXjMtdfCq0C7lAmEHZIIt9KAwVpMj4wryr6jTO0lLOl3RpYKVRNYwVHR06e95UuGcP1Zfe+nj3cfGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyptv8ggOWsVUd8hidaAXy4i5ng7nSmPVzk0jnrn6CTV9n+aGM
	cgHjMtGb5AWM6C0Wra9LaPtecym0HbjGGoIHd1sagGYSEZPYOS6aK59M53+EeT6MV1m73I1Q+kK
	M2Xb01agSRXwGq6BwHcXYckpft6Uzjds=
X-Gm-Gg: ASbGncudSW2c/a5CYh/uk1caOLBG9ck3CdxWSCwAhnRU8x8uqPLie4zkWHlZlKqs0gy
	+oRM19tkhX0eezu1QtxuIqZ9WOTavU0mSBKhhSztkyRxOKDCCfPk2rPUsj9t8xMcTaGsSRTnVWE
	dSQQKaYlTmlrGX/vNEv00fFVq5KINYAiImJOl2pcKpJi4W7Wt5EqPZFS/X/spjbhQIJ7iCq0qFn
	lXoygk5tiaQTM90Rb6VMityvKJpnCPjfQ6r4KBqCl2VTAevwp0I0HQiY9JkMukREySL6wzUvqFx
	4vjKyihhq8wumN+U
X-Google-Smtp-Source: AGHT+IEQipo1bRvUmv1DFy8JJILybzky9I72n0xOZCVf3VFWpxnk5vIoz8JfNyh57e9iJHhsjkTHKbUSyy4eNcq9hLY=
X-Received: by 2002:a17:907:cd07:b0:b73:7de4:dfd3 with SMTP id
 a640c23a62f3a-b737de4eea9mr595588766b.29.1763357541175; Sun, 16 Nov 2025
 21:32:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251106015148.54424-1-zhaochenguang@kylinos.cn> <7e6096ab-18bd-4438-8fbb-3f530ee9e69f@hust.edu.cn>
In-Reply-To: <7e6096ab-18bd-4438-8fbb-3f530ee9e69f@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Mon, 17 Nov 2025 13:31:44 +0800
X-Gm-Features: AWmQ_blZJoGVISnJYHal9V86KAjKl7b_zDImvlG9a0R40o-CchgMXbWFN5UO7_s
Message-ID: <CAJy-AmkC_UBtk1VmmVOG-Y_UB4kKAZ9rq+3U6r==A1HVDjt9vw@mail.gmail.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add kbuild timestamp Chinese translation
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Chenguang Zhao <zhaochenguang@kylinos.cn>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	HUST OS Kernel Contribution <hust-os-kernel-patches@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, Thanks

Dongliang Mu <dzm91@hust.edu.cn> =E4=BA=8E2025=E5=B9=B411=E6=9C=887=E6=97=
=A5=E5=91=A8=E4=BA=94 00:34=E5=86=99=E9=81=93=EF=BC=9A
>
>
> On 11/6/25 9:51 AM, Chenguang Zhao wrote:
> > Sync the translation of changes in kbuild/kbuild.rst about
> > KBUILD_BUILD_TIMESTAMP.
> >
> > Update the translation through commit 5cbfb4da7e06
> > ("kbuild: doc: improve KBUILD_BUILD_TIMESTAMP documentation")
>
> Hi, I know where the problem is.
>
> If you want to improve or revise the kernel documentation, please
> directly submit the changes to the original English document. Our
> Chinese translation for now is just the translation of the English
> documentation.
>
> And this commit id should be the commit of the corresponding English
> documents.
>
> Take kbuild/kbuild.rst as an example, the latest commit of Chinese
> translation shows:
>
> -------------------------------------------------------------------------=
----------------------------------
>
> docs/zh_CN: add the translation of kbuild/kbuild.rst
>
> Finish the translation of kbuild/kbuild.rst and move kbuild
> from TODO to the main body.
>
> Update to commit 2eb5d7f24299 ("kbuild: doc: describe the -C
> option precisely for external module builds")
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
>
> Link: https://lore.kernel.org/r/20241016131710.2619567-1-dzm91@hust.edu.c=
n
>
> -------------------------------------------------------------------------=
----------------------------------
>
> However, the commit history of English documentation goes further:
>
> 2025-01-15    kbuild: rust: add PROCMACROLDFLAGS
> 2024-11-28    kbuild: support building external modules in a separate
> build directory
> 2024-09-24    kbuild: doc: describe the -C option precisely for external
> module builds
> 2024-09-20    kbuild: generate offset range data for builtin modules
>
> We need to update the new translations of doc changes in ("kbuild: rust:
> add PROCMACROLDFLAGS") and ("kbuild: support building external modules
> in a separate build directory")
>
> >
> > Signed-off-by: Chenguang Zhao <zhaochenguang@kylinos.cn>
> > ---
> > v2:
> >   - modify the commit message as suggested by Dongliang and add
> >     a corresponding commit info for the English documentation.
> > ---
> >   Documentation/translations/zh_CN/kbuild/kbuild.rst | 9 +++++++--
> >   1 file changed, 7 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/translations/zh_CN/kbuild/kbuild.rst b/Docum=
entation/translations/zh_CN/kbuild/kbuild.rst
> > index e5e2aebe1ebc..ad3e84eabbbf 100644
> > --- a/Documentation/translations/zh_CN/kbuild/kbuild.rst
> > +++ b/Documentation/translations/zh_CN/kbuild/kbuild.rst
> > @@ -290,8 +290,13 @@ IGNORE_DIRS
> >   KBUILD_BUILD_TIMESTAMP
> >   ----------------------
> >   =E5=B0=86=E8=AF=A5=E7=8E=AF=E5=A2=83=E5=8F=98=E9=87=8F=E8=AE=BE=E7=BD=
=AE=E4=B8=BA=E6=97=A5=E6=9C=9F=E5=AD=97=E7=AC=A6=E4=B8=B2=EF=BC=8C=E5=8F=AF=
=E4=BB=A5=E8=A6=86=E7=9B=96=E5=9C=A8 UTS_VERSION =E5=AE=9A=E4=B9=89=E4=B8=
=AD=E4=BD=BF=E7=94=A8=E7=9A=84=E6=97=B6=E9=97=B4=E6=88=B3
> > -=EF=BC=88=E8=BF=90=E8=A1=8C=E5=86=85=E6=A0=B8=E6=97=B6=E7=9A=84 uname =
-v=EF=BC=89=E3=80=82=E8=AF=A5=E5=80=BC=E5=BF=85=E9=A1=BB=E6=98=AF=E4=B8=80=
=E4=B8=AA=E5=8F=AF=E4=BB=A5=E4=BC=A0=E9=80=92=E7=BB=99 date -d =E7=9A=84=E5=
=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E9=BB=98=E8=AE=A4=E5=80=BC=E6=98=AF
> > -=E5=86=85=E6=A0=B8=E6=9E=84=E5=BB=BA=E6=9F=90=E4=B8=AA=E6=97=B6=E5=88=
=BB=E7=9A=84 date =E5=91=BD=E4=BB=A4=E8=BE=93=E5=87=BA=E3=80=82
> > +=EF=BC=88=E8=BF=90=E8=A1=8C=E5=86=85=E6=A0=B8=E6=97=B6=E7=9A=84 uname =
-v=EF=BC=89=E3=80=82=E8=AF=A5=E5=80=BC=E5=BF=85=E9=A1=BB=E6=98=AF=E4=B8=80=
=E4=B8=AA=E5=8F=AF=E4=BB=A5=E4=BC=A0=E9=80=92=E7=BB=99 date -d =E7=9A=84=E5=
=AD=97=E7=AC=A6=E4=B8=B2=E3=80=82=E4=BE=8B=E5=A6=82::
> > +
> > +     $ KBUILD_BUILD_TIMESTAMP=3D"Mon Oct 13 00:00:00 UTC 2025" make
> > +
> > +=E9=BB=98=E8=AE=A4=E5=80=BC=E6=98=AF=E5=86=85=E6=A0=B8=E6=9E=84=E5=BB=
=BA=E6=9F=90=E4=B8=AA=E6=97=B6=E5=88=BB=E7=9A=84date=E5=91=BD=E4=BB=A4=E8=
=BE=93=E5=87=BA=E3=80=82=E5=A6=82=E6=9E=9C=E6=8F=90=E4=BE=9B=E8=AF=A5=E6=97=
=B6=E6=88=B3=EF=BC=8C=E5=AE=83=E8=BF=98=E7=94=A8=E4=BA=8E=E4=BB=BB=E4=BD=95=
initramfs
> > +=E5=BD=92=E6=A1=A3=E6=96=87=E4=BB=B6=E4=B8=AD=E7=9A=84mtime=E5=AD=97=
=E6=AE=B5=E3=80=82Initramfs mtimes=E6=98=AF32=E4=BD=8D=E7=9A=84=EF=BC=8C=E5=
=9B=A0=E6=AD=A4=E6=97=A9=E4=BA=8EUnix=E7=BA=AA=E5=85=831970=E5=B9=B4=EF=BC=
=8C=E6=88=96
> > +=E6=99=9A=E4=BA=8E=E5=8D=8F=E8=B0=83=E4=B8=96=E7=95=8C=E6=97=B6 (UTC)2=
106=E5=B9=B42=E6=9C=887=E6=97=A56=E6=97=B628=E5=88=8615=E7=A7=92=E7=9A=84=
=E6=97=A5=E6=9C=9F=E6=98=AF=E6=97=A0=E6=95=88=E7=9A=84=E3=80=82
> >
> >   KBUILD_BUILD_USER, KBUILD_BUILD_HOST
> >   ------------------------------------
>
