Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AC613774D
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 21:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588796; cv=none; b=saUzEPuiGmDjMMPuuyqS35zIbdCjyt3w6oaRmmvceGGMzMYYxQZ6oC2wTC6kG2g23yNZ0m1Sqrab2DchE0l7carHnnER5snl5ABaDeC0LQAQggC8jHgN//0726gHEHchpCilKl8Bn7d0xQZjNKDEgBfxzoHl1nclDWn0Lpt6Y0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588796; c=relaxed/simple;
	bh=4O72JiEcjeB0AG4TAF+wv5zY1LQLwib20P+qS0SYSpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mf+DEtT8smQMGSEGveOcHROWMhiITjkaX6cI2BXwVif47t/PR4c3r4Y0MlZ1sTul8gX4h+ue1g0HzLou4LjeyZ3xuPlvFPblEA4p1q6panoFrRTeW9k1tsxSriTuQGfKlkMAupw/xELP0SDpxcI40qKq+q1NGVyTQ2V9SVpI69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FttR1krU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FttR1krU"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-61ce9bcc624so3298407a12.1
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 14:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756588793; x=1757193593; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvEmyGgDao8loTxSoHnWUweELYFfW6islus8PudLe24=;
        b=FttR1krUpyJhjqvtynLsYuocptNqFAMyLTsF3DDk3xcn0TlnOn+ZrCTtvKviwPz7B+
         i6+Ulfi+Cub+QofNE3OR6oZ64pAT+N8HbgJXPRFrljtL/Z4xrkOsCoin17f64LJuRtI8
         +6qwc065ah91Q1vEE+W24MYFKvxFR3lvtHiZNzc56ZJgcldisJvTNBNOVX1aKm1qYyw9
         l4rVw6J17I1/Hx0VbMZrV3hx8LSaEdVQ3LMnb7pLXqcEb7P8CMbMNdgiMSf4jli5ZvS1
         D8CXcjfa4k3xLMjvauMixxhyYwo3izFA9k997Z9RUK+Zs33QpVOxEdK6MyCOT/6KSeRQ
         Qg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756588793; x=1757193593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvEmyGgDao8loTxSoHnWUweELYFfW6islus8PudLe24=;
        b=HVwlSNNo5XwTQVWj6a1vcrWeBaITMV3DB1zN6YNw6xUspHGQk8Babtug6QgwQ1W8Ne
         aTiXeo0oItQ2UAAF3ZKoNVpxdcz3/mrNLIlvs7CG6cf8XFI6ULfy8hG45eLayapjRNxU
         NoEF7GCFLORdClSkDBeN1m+vBq7ju3weCDrDpyXGOBUtqSVNGFBe44tDC9ZuLrlN+DUf
         0Wc4bWHtPSgHJDZEwA7kl2++/NWC8qiR6b0kAR3VGs/vvaM59e2pFdL/bXBbX1s6Z74O
         igsno8xBLzCXAcfdPxvewupxE2HFJLmRTqjSHingxMCRU5ykYOMQY5nzc7oRn1dITnXT
         Gr0A==
X-Gm-Message-State: AOJu0YxFew8a/s+RyYlYMFrUFjT04l9Vw+JlcIR0CYz0bwpRwITRXnq6
	4liJBUzlyEjRfnFPkn6t8c2udth7W6O2zj3v//tBzUtUwXKjAxg7cEVjwtJ03TazfJaHZBQ/Amj
	kPtJSvBaA7SwZam4snSqZHNOfXU7KpBjsyrnTkYD6oA==
X-Gm-Gg: ASbGncsvhP2GAD4h4gTF6u3n22SaK5aiZqXOMeEyFSRSSDsxY7wWprCij+yYboo6xh2
	Zi8sIhsMA+R2QmH5FuEUXJo7yD2aVk5F2GmvtYxzfvxH23wLuM+n9ZgcuacNryvYebb0BMkYZTi
	0aJaw6rt3PCtF1/CFgj8f7Y21trH8hfiloODy/9RL1TgOW2SH1T/GYYK4zRmLkdEpcwmN1uCZ4K
	2JzlwOc8NFfwYQmpRc8
X-Google-Smtp-Source: AGHT+IEaZJfD6QFzA1bD3DIwm/+8QhtEmMvJb/xm5/1fAixE9u/9p1OUs8+ART5Oo1oa0N5zCow9YZB5Cj9cE3qI01k=
X-Received: by 2002:a05:6402:5108:b0:61a:843c:2dec with SMTP id
 4fb4d7f45d1cf-61d26d79037mr2558547a12.30.1756588792594; Sat, 30 Aug 2025
 14:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830191249.25459-1-harikrishnamethari@gmail.com> <67de5275-65e7-45c4-b0d9-ea560a972c25@infradead.org>
In-Reply-To: <67de5275-65e7-45c4-b0d9-ea560a972c25@infradead.org>
From: Hari Krishna Methari <harikrishnamethari@gmail.com>
Date: Sun, 31 Aug 2025 02:49:40 +0530
X-Gm-Features: Ac12FXymM0r7H_wxrgT0IEfu-AFNFx0t41oNKYvikCoKOpYdHgPjHeZMDip3wm8
Message-ID: <CAJ3fvfo-tnFbD6gnAa=b8dMKRkRHq0nTBZxfNkOUQrHorbzOTg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Fix typos in filesystems
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Christian Brauner <brauner@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Randy,

Thank you for your feedback and for pointing out the already merged
changes. I understand now that some of my proposed fixes are
redundant. I=E2=80=99ll make sure to review the latest docs-next tree befor=
e
submitting any future documentation patches.

I appreciate your guidance and the time you took to explain this.

Best regards,
Methari Hari Krishna


On Sun, Aug 31, 2025 at 2:31=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
> Hi,
>
> On 8/30/25 12:12 PM, Methari Hari Krishna wrote:
> > Fixed minor spelling and grammar mistakes in:
> > - bcachefs/future/idle_work.rst
> > - hpfs.rst
> > - smb/cifsroot.rst
> > - vfat.rst
> >
> > Signed-off-by: Methari Hari Krishna <harikrishnamethari@gmail.com>
> > ---
> >  Documentation/filesystems/bcachefs/future/idle_work.rst | 6 +++---
> >  Documentation/filesystems/hpfs.rst                      | 2 +-
> >  Documentation/filesystems/smb/cifsroot.rst              | 2 +-
> >  Documentation/filesystems/vfat.rst                      | 2 +-
> >  4 files changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/filesystems/bcachefs/future/idle_work.rst b/=
Documentation/filesystems/bcachefs/future/idle_work.rst
> > index 59a332509dcd..f1202113dde0 100644
> > --- a/Documentation/filesystems/bcachefs/future/idle_work.rst
> > +++ b/Documentation/filesystems/bcachefs/future/idle_work.rst
> > @@ -11,10 +11,10 @@ idle" so the system can go to sleep. We don't want =
to be dribbling out
> >  background work while the system should be idle.
> >
> >  The complicating factor is that there are a number of background tasks=
, which
> > -form a heirarchy (or a digraph, depending on how you divide it up) - o=
ne
> > +form a hierarchy (or a digraph, depending on how you divide it up) - o=
ne
> >  background task may generate work for another.
> >
> > -Thus proper idle detection needs to model this heirarchy.
> > +Thus proper idle detection needs to model this hierarchy.
>
> There is already a patch for this but I can't tell that it has been merge=
d yet.
>
> https://lore.kernel.org/all/aFB1tGW3Iwf0isZ3@itsmeut/
>
>
> >
> >  - Foreground writes
> >  - Page cache writeback
> > @@ -51,7 +51,7 @@ IDLE REGIME
> >  When the system becomes idle, we should start flushing our pending wor=
k
> >  quicker so the system can go to sleep.
> >
> > -Note that the definition of "idle" depends on where in the heirarchy a=
 task
> > +Note that the definition of "idle" depends on where in the hierarchy a=
 task
> >  is - a task should start flushing work more quickly when the task abov=
e it has
> >  stopped generating new work.
> >
> > diff --git a/Documentation/filesystems/hpfs.rst b/Documentation/filesys=
tems/hpfs.rst
> > index 7e0dd2f4373e..e2a0872a577d 100644
> > --- a/Documentation/filesystems/hpfs.rst
> > +++ b/Documentation/filesystems/hpfs.rst
> > @@ -65,7 +65,7 @@ are case sensitive, so for example when you create a =
file FOO, you can use
> >  'cat FOO', 'cat Foo', 'cat foo' or 'cat F*' but not 'cat f*'. Note, th=
at you
> >  also won't be able to compile linux kernel (and maybe other things) on=
 HPFS
> >  because kernel creates different files with names like bootsect.S and
> > -bootsect.s. When searching for file thats name has characters >=3D 128=
, codepages
> > +bootsect.s. When searching for file that's name has characters >=3D 12=
8, codepages
>
> That's not a good change. A different patch has already been accepted for=
 this.
> See  https://lore.kernel.org/all/20250813200526.290420-6-helgaas@kernel.o=
rg/
> and Jon (the docs maintainer) replied that he had merged the patch.
>
>
> >  are used - see below.
> >  OS/2 ignores dots and spaces at the end of file name, so this driver d=
oes as
> >  well. If you create 'a. ...', the file 'a' will be created, but you ca=
n still
> > diff --git a/Documentation/filesystems/smb/cifsroot.rst b/Documentation=
/filesystems/smb/cifsroot.rst
> > index bf2d9db3acb9..8e8c3fb8739a 100644
> > --- a/Documentation/filesystems/smb/cifsroot.rst
> > +++ b/Documentation/filesystems/smb/cifsroot.rst
> > @@ -82,7 +82,7 @@ Export root file system as a Samba share in smb.conf =
file::
> >           guest ok =3D yes
> >           force user =3D root
> >           force group =3D root
> > -         browseable =3D yes
> > +         browsable =3D yes
>
> $iinternet says either spelling is acceptable.
>
> >           writeable =3D yes
> >           admin users =3D root
> >           public =3D yes
> > diff --git a/Documentation/filesystems/vfat.rst b/Documentation/filesys=
tems/vfat.rst
> > index b289c4449cd0..f408699ce50f 100644
> > --- a/Documentation/filesystems/vfat.rst
> > +++ b/Documentation/filesystems/vfat.rst
> > @@ -361,7 +361,7 @@ the following:
> >
> >                  <proceeding files...>
> >                  <slot #3, id =3D 0x43, characters =3D "h is long">
> > -                <slot #2, id =3D 0x02, characters =3D "xtension whic">
> > +                <slot #2, id =3D 0x02, characters =3D "xtension which"=
>
> >                  <slot #1, id =3D 0x01, characters =3D "My Big File.E">
> >                  <directory entry, name =3D "MYBIGFIL.EXT">
> >
>
> Nak. The filename is split up into 12-char fields.
>
> What kernel version is this patch made against?
> Always check/use the latest current linux-next tree (that would catch
> many changes) or for Documentation, the latest docs-next tree.
>
> thanks.
> --
> ~Randy
>
