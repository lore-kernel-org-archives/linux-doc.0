Received: from mail-lr2-f29.google.com (mail-lr2-f29.google.com [74.125.230.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8853A414A0C
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 10:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791022975; cv=pass; b=uDSX+TSeUIaMILWB0dQv09KbP9PzdAgADDappTPh2iiQyMW26k/NlKQ0yfdYX26rXdSPYqTKoGi3P+h0NoxTHQsX11H/TGXomEFt03f8DzwdhbaQu2kmO5kz9xpXQRPbtg9VdNGtoTXYWVB6xiHIY0IWFzxQo/04gPXxN+2gv+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791022975; c=relaxed/simple;
	bh=6UUHgJMlkAtDJaz4XntRcWl5+YpBeGoxloWdZtT0WQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tK3VLrBfICpP0HyVZBzxCvf1O/kX3LyvyRaVo+1o7oCaGAxwA7X/MyAsVF+lXztsrkuH+/3C+R/hJY0b6xNLHX6oUZWIr+6MQxpGFt5GFw3aceeB+QVF0X+9BvYCOR1+gpClcBitxJ8RHysehxmDvI/WyjISdPEF1wEIxvWczTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM28539I; arc=pass smtp.client-ip=74.125.230.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM28539I"
Received: by mail-lr2-f29.google.com with SMTP id 38308e7fff4ca-3a59bc47041so900881fa.1
        for <linux-doc@vger.kernel.org>; Sat, 03 Oct 2026 03:22:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791022971; cv=none;
        d=google.com; s=arc-20260327;
        b=pIEdrR/omddSzarYkbihrzfG0pIC7gFRl/Wuz/RTmrSm/zz3QRRk1YBoZ9TZI75c9c
         urngDK31nud1MaO32zeeRQpciUb5t/eTptp5qh+r/FYCrRRmkRF4g6Jbh4LmUlK/puxI
         jspaRKjAW7kBDQC3dNP9XS1GDu9lgB/7jSGYXGowS+G2a+YszexC5KyTc/Jrj7SQFmBJ
         TX6dfhXD/l121CAarkNWMkJInEsv20NWKWDGP/SPVuyIIdJlbtEu5OlasAnw7ZcrBuEe
         fcX1gt9ihNdBw7+xxF/RJTKAfY9AppWf45bZ2ptidOENS00peO2ASGsueL3W0iW6x5cH
         sV2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oH0LRL6UxXEXpmaBkM9UwtriwEhEfwjbkwVlApwhR3s=;
        fh=8dsi7z4e9AlE816B8EyQ5qjSIXdZ/RcDQy9OpcJ9ZBg=;
        b=EY2IZlEiA3PDxq9KlgJnBizFb+Y3VoIHJVP87kS/bndOIl8z2l3frQv+zJ+fvAJ9TL
         hpxDYZPp3N727sHYTxCFirrOinfSOoVWdohNvw+14t9ztoCAsuSv62uX+u4AbeAbB9m5
         e7kNQVE6fVvc682ZOjpi/3wj0T+hDylf4/ty/prclOyf6ewSktVEK4UwUX44b+zlyQGd
         XqxEQpNjeeVwf4D+/PXNJxikYoy3bhEV9EXKhB3UdrQ6OMesV6QYaQKHUw13BlZPiyeB
         rusvKMquGbP0F2IA4VNkeWwZ9qH5Y/nazRYjmhcDnD2pfCqQzyIAdBMMboGXB6sFCFOF
         X/kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791022971; x=1791627771; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oH0LRL6UxXEXpmaBkM9UwtriwEhEfwjbkwVlApwhR3s=;
        b=TM28539IoW4QQvCQ+xwGVZY9QnheEqMzF06BKCIOhts/StdeR8LetBQIcRuVdjGlYa
         IHohs34/tzKY2dWyLlJu/JXZq/KdT8p/85oIT5cKzG3XPOq2sl9nGjzcb8NW6JQNegdw
         tYbHjrYS2S82IfN7EuNw/zftoC3hHt1xDpzidEY7lVbewJ7nXR3zk9e6yPTN/vkupKV6
         NxgFzQ50c2sz0vn1Fv0iYhccWDvOUEuyMRVVMKD+0dQUqPzWX10aqZzE3LEAXlEQC1dL
         uWhrPP3ut8jmCuHqgEu3wXI0heMRTkuO7jKyAYv9Qwi3cu9VTXrA3u6IDxZ7+xkziRf4
         5z0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791022971; x=1791627771;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oH0LRL6UxXEXpmaBkM9UwtriwEhEfwjbkwVlApwhR3s=;
        b=DKdir3UMEvO+NOGKLk4O7zXXmxruZfzVe4vcQNtYI8ypCNAe2qAhpRNsI6+ezR4+1Q
         6zuheH5Xiry7cVDzJu/M1GXLXMYM/qjzmgjEhg+NtDVquW6IqD/918o8zplL0zLfmCYm
         +7IWBe4moD0/pEyWDztVHZcc429ohrZELwJYtIddSxLkFrCHsyoQs+3jh2IEVXnfS3kl
         c0UQ/xrXYn7/XPSod1BzMsYdjirG/VjV1zVtZe5efnWoFnQnISDlOAr78O2rOl99pEIr
         4unMQDH2l8NgT2JDqBWbL21WYoTQtWv7QZgbvGRA6pMWhwLomrq1Fd3xMredM8ww2IFV
         GXWg==
X-Forwarded-Encrypted: i=1; AKwUvBxuwrAirbMaubxPOE9qjk1f0gfVeK1o63LoFK5fEaRu2F8wrl7R9Zh9MLXERmD8IR/vEeWC+Dq/iRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIStgMKxwVVEMwt96AGlsvBBJry/gE+AW8OEBbz6p2ZfjunSSLy
	uVkYXslRiL4sD14jX3kQN4t001MHx9BTTiLBA1l27MfkKTVtaT9ASxIyUdKGb2L8llwSIcS4NsC
	L73bCYIJ8cuwMwsf6OLvswisO2cpqdcw=
X-Gm-Gg: AYBFou067ZbAvzcv/Bwi82wzW1CwpJoXuEsH/bdBNffYWaXCmMTDZ+sZlsMcd9fsfmA
	9+sZOPsQX7Z7DQAXDMD4uUpv6b0JJ8sY2ifzMmcvtv2PGfw0o0F8AExSiQ1ECDR/VJsk1ITqzHb
	pmjJBW38VWyYOLSMrwKiWiPgEuDjY+gVL1PpPdQo7c8YKB5Hbrgex3fjf9IB+kajVJH/V62DgTN
	sVwcF/0w/lu5FTOhhapEoSpUAKk/5vaP+xs5unRXL8kfEO6ghS87IGxBu/U5/Epg3+P0waA0MQT
	V2vLrTrcapHTyc+lARQHQcvz4UxGQTDxw1FRg3uk68uIaQvZFIQ5gxDOkpsxKy/891CJPn6/tI1
	1vBqq00rc+ZxJythDm7UMNiMYGu6h2TRfF8dg
X-Received: by 2002:a05:6512:800b:20b0:5b8:edbd:609f with SMTP id
 2adb3069b0e04-5bb9bc3af99mr1440623e87.5.1791022971378; Sat, 03 Oct 2026
 03:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929131020.266120-1-chenyou910331@gmail.com>
 <20260929131020.266120-4-chenyou910331@gmail.com> <asCCUliodZDQs8dw@wyuan.org>
In-Reply-To: <asCCUliodZDQs8dw@wyuan.org>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Sat, 3 Oct 2026 18:22:38 +0800
X-Gm-Features: AclHuK_d2nMvIRe7ylzK2Z2vMAJYiaJymXc0JODVhaQo-9P-uVFiMvPIWlSXu3w
Message-ID: <CAKspUhLnVnpCY3iOdY5QiOGkZsp11NVx7N5jdiDhPQYutdZa6Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] docs/zh_TW: move gdb-kernel-debugging to process/debugging/
To: Weijie Yuan <wy@wyuan.org>
Cc: corbet@lwn.net, alexs@kernel.org, dzm91@hust.edu.cn, si.yanteng@linux.dev, 
	srcres258@furdevs.cn, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 03, 2026 at 12:19:30PM +0800, Weijie Yuan wrote:
> I actually think the script is getting in the way a bit. Its output is
> only meant to serve as a reference, not something that forces us to
> constantly worry about how the script behaves. For example, when the
> script cannot detect renames, wouldn't it be simpler to just update the
> translation as usual?

I lean on it more than that, I think. It is the only way we can tell
which translations are behind and by how much -- the scope proposal was
built on its numbers -- and the "update to commit" line is what keeps
those numbers honest. A move without one would make the tool treat the
file as current, and we would lose sight of exactly the files we have
just started tracking.

Where I agree is that this is bookkeeping, not the goal. Updating the
translation as usual is the real fix: whoever does it records the
English commit they synced to, and the rename question goes away. The
rename gap itself is a limitation of the tool, and the better place to
fix it is in checktransupdate.py rather than in notes like this one.

Thanks,
Chen-Yu

Weijie Yuan <wy@wyuan.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=883=E6=97=A5=E9=
=80=B1=E5=85=AD =E4=B8=8B=E5=8D=8812:19=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On 2026-09-29 21:10:17 +0800, Chen-Yu Yeh <chenyou910331@gmail.com> wrote=
:
>
> > The English original moved from dev-tools/ to process/debugging/ in
> > commit d5af79c05e93 ("Documentation: move dev-tools debugging files to
> > process/debugging/"), but the translation stayed behind.
> > checktransupdate.py locates the English original from the translation's
> > path, so it currently reports:
> >
> >   Cannot find the origin path for
> >   Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.rst
> >
> > Move it to match the English layout, and fix the relative path of the
> > disclaimer include, which is now one level deeper.  zh_TW has no
> > process/debugging/ directory yet, so add an index.rst translated from
> > the English one, listing the guides not translated yet under TODOList,
> > and link it from process/index.rst in place of its TODOList entry.
> >
> > The baseline needs a caveat.  The translation lacks
> > commit 6b219431037b ("docs/scripts/gdb: add necessary make scripts_gdb
> > step"), which went in before the move, but checktransupdate.py does not
> > follow renames and cannot report a change made at the old path.  Use th=
e
> > move commit, the oldest baseline the tool can see, and record the
> > missing change here instead.  The tool will list
> > commit 09e1d93a421f ("scripts/gdb: update documentation for
> > lx_per_cpu"), which already edited this translation, together with the
> > one later change it really lacks, commit 7f7f468548ce ("Documentation:
> > Provide hints on how to debug Python GDB scripts").
> >
> > For the new index.rst the tool will also list
> > commit a592a36e4937 ("Documentation: use a source-read extension for th=
e
> > index link boilerplate"); that change only removes the index-link
> > boilerplate, which this translation does not carry.
>
> I actually think the script is getting in the way a bit. Its output is
> only meant to serve as a reference, not something that forces us to
> constantly worry about how the script behaves. For example, when the
> script cannot detect renames, wouldn't it be simpler to just update the
> translation as usual? But anyway,
>
> > update to commit d5af79c05e93 ("Documentation: move dev-tools debugging
> > files to process/debugging/")
> >
> > Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
>
> Reviewed-by: Weijie Yuan <wy@wyuan.org>
>
> > ---
> >  .../translations/zh_TW/dev-tools/index.rst    |  1 -
> >  .../debugging}/gdb-kernel-debugging.rst       |  2 +-
> >  .../zh_TW/process/debugging/index.rst         | 70 +++++++++++++++++++
> >  .../translations/zh_TW/process/index.rst      |  2 +-
> >  4 files changed, 72 insertions(+), 3 deletions(-)
> >  rename Documentation/translations/zh_TW/{dev-tools =3D> process/debugg=
ing}/gdb-kernel-debugging.rst (99%)
> >  create mode 100644 Documentation/translations/zh_TW/process/debugging/=
index.rst
> >
> > diff --git a/Documentation/translations/zh_TW/dev-tools/index.rst b/Doc=
umentation/translations/zh_TW/dev-tools/index.rst
> > index 915449762d1a..fafebd092a3d 100644
> > --- a/Documentation/translations/zh_TW/dev-tools/index.rst
> > +++ b/Documentation/translations/zh_TW/dev-tools/index.rst
> > @@ -26,7 +26,6 @@ Documentation/translations/zh_TW/dev-tools/testing-ov=
erview.rst
> >     sparse
> >     gcov
> >     kasan
> > -   gdb-kernel-debugging
> >
> >  Todolist:
> >
> > diff --git a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debu=
gging.rst b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-d=
ebugging.rst
> > similarity index 99%
> > rename from Documentation/translations/zh_TW/dev-tools/gdb-kernel-debug=
ging.rst
> > rename to Documentation/translations/zh_TW/process/debugging/gdb-kernel=
-debugging.rst
> > index 8faa87f26c6a..a9ca1156fea6 100644
> > --- a/Documentation/translations/zh_TW/dev-tools/gdb-kernel-debugging.r=
st
> > +++ b/Documentation/translations/zh_TW/process/debugging/gdb-kernel-deb=
ugging.rst
> > @@ -1,6 +1,6 @@
> >  .. highlight:: none
> >
> > -.. include:: ../disclaimer-zh_TW.rst
> > +.. include:: ../../disclaimer-zh_TW.rst
> >
> >  :Original: Documentation/process/debugging/gdb-kernel-debugging.rst
> >
> > diff --git a/Documentation/translations/zh_TW/process/debugging/index.r=
st b/Documentation/translations/zh_TW/process/debugging/index.rst
> > new file mode 100644
> > index 000000000000..4440aa6a97e2
> > --- /dev/null
> > +++ b/Documentation/translations/zh_TW/process/debugging/index.rst
> > @@ -0,0 +1,70 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../../disclaimer-zh_TW.rst
> > +
> > +:Original: Documentation/process/debugging/index.rst
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +=E7=B5=A6Linux=E6=A0=B8=E5=BF=83=E9=96=8B=E7=99=BC=E8=80=85=E7=9A=84=
=E9=99=A4=E9=8C=AF=E5=BB=BA=E8=AD=B0
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> > +
> > +=E4=B8=80=E8=88=AC=E6=8C=87=E5=8D=97
> > +--------
> > +
> > +.. toctree::
> > +   :maxdepth: 1
> > +
> > +   gdb-kernel-debugging
> > +
> > +TODOList:
> > +
> > +* driver_development_debugging_guide
> > +* kgdb
> > +* userspace_debugging_guide
> > +
> > +=E7=89=B9=E5=AE=9A=E5=AD=90=E7=B3=BB=E7=B5=B1=E6=8C=87=E5=8D=97
> > +--------------
> > +
> > +TODOList:
> > +
> > +* media_specific_debugging_guide
> > +
> > +=E4=B8=80=E8=88=AC=E9=99=A4=E9=8C=AF=E5=BB=BA=E8=AD=B0
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +=E8=A6=96=E5=95=8F=E9=A1=8C=E8=80=8C=E5=AE=9A=EF=BC=8C=E5=8F=AF=E7=94=
=A8=E4=BE=86=E8=BF=BD=E8=B9=A4=E5=95=8F=E9=A1=8C=E3=80=81=E7=94=9A=E8=87=B3=
=E7=94=A8=E4=BE=86=E7=A2=BA=E8=AA=8D=E5=95=8F=E9=A1=8C=E6=98=AF=E5=90=A6=E7=
=9C=9F=E7=9A=84=E5=AD=98=E5=9C=A8=E7=9A=84=E5=B7=A5=E5=85=B7=E4=B9=9F=E5=90=
=84=E4=B8=8D=E7=9B=B8=E5=90=8C=E3=80=82
> > +
> > +=E7=AC=AC=E4=B8=80=E6=AD=A5=EF=BC=8C=E4=BD=A0=E5=BF=85=E9=A0=88=E5=85=
=88=E5=BC=84=E6=B8=85=E6=A5=9A=E8=A6=81=E9=99=A4=E9=8C=AF=E7=9A=84=E6=98=AF=
=E5=93=AA=E4=B8=80=E9=A1=9E=E5=95=8F=E9=A1=8C=E3=80=82=E6=A0=B9=E6=93=9A=E7=
=AD=94=E6=A1=88=E7=9A=84=E4=B8=8D=E5=90=8C=EF=BC=8C=E4=BD=A0=E7=9A=84=E6=96=
=B9=E6=B3=95=E8=88=87
> > +=E5=B7=A5=E5=85=B7=E9=81=B8=E6=93=87=E4=B9=9F=E5=8F=AF=E8=83=BD=E6=9C=
=89=E6=89=80=E4=B8=8D=E5=90=8C=E3=80=82
> > +
> > +=E6=88=91=E6=98=AF=E5=90=A6=E9=9C=80=E8=A6=81=E5=9C=A8=E5=AD=98=E5=8F=
=96=E5=8F=97=E9=99=90=E7=9A=84=E6=83=85=E6=B3=81=E4=B8=8B=E9=99=A4=E9=8C=AF=
=EF=BC=9F
> > +----------------------------------
> > +
> > +=E4=BD=A0=E5=B0=8D=E6=A9=9F=E5=99=A8=E7=9A=84=E5=AD=98=E5=8F=96=E6=98=
=AF=E5=90=A6=E5=8F=97=E5=88=B0=E9=99=90=E5=88=B6=EF=BC=8C=E6=88=96=E6=98=AF=
=E7=84=A1=E6=B3=95=E4=B8=AD=E6=96=B7=E6=AD=A3=E5=9C=A8=E9=80=B2=E8=A1=8C=E7=
=9A=84=E5=9F=B7=E8=A1=8C=EF=BC=9F
> > +
> > +=E5=9C=A8=E9=80=99=E7=A8=AE=E6=83=85=E6=B3=81=E4=B8=8B=EF=BC=8C=E4=BD=
=A0=E7=9A=84=E9=99=A4=E9=8C=AF=E8=83=BD=E5=8A=9B=E5=8F=96=E6=B1=BA=E6=96=BC=
=E7=99=BC=E8=A1=8C=E7=89=88=E6=89=80=E6=8F=90=E4=BE=9B=E7=9A=84=E6=A0=B8=E5=
=BF=83=E5=85=A7=E5=BB=BA=E7=9A=84=E9=99=A4=E9=8C=AF=E6=94=AF=E6=8F=B4=E3=80=
=82
> > +Documentation/process/debugging/userspace_debugging_guide.rst =E7=B0=
=A1=E8=A6=81=E4=BB=8B=E7=B4=B9=E4=BA=86=E5=9C=A8
> > +=E9=80=99=E7=A8=AE=E6=83=85=E6=B3=81=E4=B8=8B=E5=8F=AF=E7=94=A8=E7=9A=
=84=E5=90=84=E7=A8=AE=E9=99=A4=E9=8C=AF=E5=B7=A5=E5=85=B7=E3=80=82=E5=9C=A8=
=E5=A4=A7=E5=A4=9A=E6=95=B8=E6=83=85=E6=B3=81=E4=B8=8B=EF=BC=8C=E4=BD=A0=E5=
=8F=AF=E4=BB=A5=E6=9F=A5=E7=9C=8B/boot=E7=9B=AE=E9=8C=84=E4=B8=AD=E7=9A=84
> > +=E8=A8=AD=E5=AE=9A=E6=AA=94=EF=BC=8C=E4=BE=86=E7=A2=BA=E8=AA=8D=E4=BD=
=A0=E7=9A=84=E6=A0=B8=E5=BF=83=E5=85=B7=E5=82=99=E5=93=AA=E4=BA=9B=E5=8A=9F=
=E8=83=BD=E3=80=82
> > +
> > +=E6=88=91=E6=98=AF=E5=90=A6=E6=93=81=E6=9C=89=E7=B3=BB=E7=B5=B1=E7=9A=
=84root=E5=AD=98=E5=8F=96=E6=AC=8A=E9=99=90=EF=BC=9F
> > +------------------------------
> > +
> > +=E4=BD=A0=E8=83=BD=E5=90=A6=E8=BC=95=E6=98=93=E5=9C=B0=E6=9B=BF=E6=8F=
=9B=E6=9C=89=E5=95=8F=E9=A1=8C=E7=9A=84=E6=A8=A1=E7=B5=84=EF=BC=8C=E6=88=96=
=E5=AE=89=E8=A3=9D=E6=96=B0=E7=9A=84=E6=A0=B8=E5=BF=83=EF=BC=9F
> > +
> > +=E8=8B=A5=E6=98=AF=E5=A6=82=E6=AD=A4=EF=BC=8C=E4=BD=A0=E5=8F=AF=E7=94=
=A8=E7=9A=84=E5=B7=A5=E5=85=B7=E5=B0=B1=E5=A4=9A=E5=BE=97=E5=A4=9A=EF=BC=8C=
=E7=9B=B8=E9=97=9C=E5=B7=A5=E5=85=B7=E8=AB=8B=E5=8F=83=E8=A6=8B
> > +Documentation/process/debugging/driver_development_debugging_guide.rst=
 =E3=80=82
> > +
> > +=E6=99=82=E5=BA=8F=E6=98=AF=E5=90=A6=E6=98=AF=E5=BD=B1=E9=9F=BF=E5=9B=
=A0=E7=B4=A0=EF=BC=9F
> > +--------------------
> > +
> > +=E9=87=8D=E8=A6=81=E7=9A=84=E6=98=AF=E5=BC=84=E6=B8=85=E6=A5=9A=E4=BD=
=A0=E8=A6=81=E9=99=A4=E9=8C=AF=E7=9A=84=E5=95=8F=E9=A1=8C=E6=98=AF=E7=A9=A9=
=E5=AE=9A=E9=87=8D=E7=8F=BE=EF=BC=88=E4=B9=9F=E5=B0=B1=E6=98=AF=E7=B5=A6=E5=
=AE=9A=E4=B8=80=E7=B5=84=E8=BC=B8=E5=85=A5=E6=99=82=EF=BC=8C=E7=B8=BD=E6=98=
=AF=E5=BE=97=E5=88=B0
> > +=E7=9B=B8=E5=90=8C=E7=9A=84=E9=8C=AF=E8=AA=A4=E8=BC=B8=E5=87=BA=EF=BC=
=89=EF=BC=8C=E9=82=84=E6=98=AF=E6=99=82=E6=9C=89=E6=99=82=E7=84=A1=E3=80=82=
=E5=A6=82=E6=9E=9C=E5=95=8F=E9=A1=8C=E6=99=82=E6=9C=89=E6=99=82=E7=84=A1=EF=
=BC=8C=E5=8F=AF=E8=83=BD=E6=9C=89=E6=9F=90=E7=A8=AE=E6=99=82=E5=BA=8F=E5=9B=
=A0=E7=B4=A0=E5=9C=A8
> > +=E4=BD=9C=E7=94=A8=E3=80=82=E5=A6=82=E6=9E=9C=E5=9C=A8=E7=A8=8B=E5=BC=
=8F=E7=A2=BC=E4=B8=AD=E6=8F=92=E5=85=A5=E5=BB=B6=E9=81=B2=E7=A2=BA=E5=AF=A6=
=E6=9C=83=E6=94=B9=E8=AE=8A=E5=85=B6=E8=A1=8C=E7=82=BA=EF=BC=8C=E9=82=A3=E9=
=BA=BC=E6=99=82=E5=BA=8F=E5=BE=88=E5=8F=AF=E8=83=BD=E5=B0=B1=E6=98=AF=E5=85=
=B6=E4=B8=AD=E4=B8=80=E5=80=8B
> > +=E5=9B=A0=E7=B4=A0=E3=80=82
> > +
> > +=E7=95=B6=E6=99=82=E5=BA=8F=E7=A2=BA=E5=AF=A6=E6=9C=83=E6=94=B9=E8=AE=
=8A=E7=A8=8B=E5=BC=8F=E7=A2=BC=E7=9A=84=E5=9F=B7=E8=A1=8C=E7=B5=90=E6=9E=9C=
=E6=99=82=EF=BC=8C=E7=94=A8=E7=B0=A1=E5=96=AE=E7=9A=84printk()=E4=BE=86=E9=
=99=A4=E9=8C=AF=E5=8F=AF=E8=83=BD=E8=A1=8C=E4=B8=8D=E9=80=9A=EF=BC=9B
> > +=E9=A1=9E=E4=BC=BC=E7=9A=84=E6=9B=BF=E4=BB=A3=E6=96=B9=E6=A1=88=E6=98=
=AF=E4=BD=BF=E7=94=A8trace_printk()=EF=BC=8C=E5=AE=83=E6=9C=83=E6=8A=8A=E9=
=99=A4=E9=8C=AF=E8=A8=8A=E6=81=AF=E8=A8=98=E9=8C=84=E5=88=B0=E8=BF=BD=E8=B9=
=A4=E6=AA=94=E6=A1=88=EF=BC=8C=E8=80=8C=E4=B8=8D=E6=98=AF
> > +=E6=A0=B8=E5=BF=83=E6=97=A5=E8=AA=8C=E3=80=82
> > +
> > +**Copyright** =C2=A92024 : Collabora
> > diff --git a/Documentation/translations/zh_TW/process/index.rst b/Docum=
entation/translations/zh_TW/process/index.rst
> > index de99156324df..bd638264bbe4 100644
> > --- a/Documentation/translations/zh_TW/process/index.rst
> > +++ b/Documentation/translations/zh_TW/process/index.rst
> > @@ -88,12 +88,12 @@ TODOList:
> >  .. toctree::
> >     :maxdepth: 1
> >
> > +   debugging/index
> >     security-bugs
> >     embargoed-hardware-issues
> >
> >  TODOList:
> >
> > -* debugging/index
> >  * handling-regressions
> >  * threat-model
> >  * cve
> > --
> > 2.43.0
> >
