Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64B61FC0
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 17:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787939707; cv=none; b=lc6l4nWAw5phiwKjeHNgRNe5AzFV+9En+R0fmw3UF4aj4zPYSYAZcID62oJRX5kkHDI9BzyvB1pIeRUUJDu0XgDiImx7MAtEAvwo1fPIuf/bnJzdLpHvBj+3wItWcQkY4ndoRDk46M6BHy62emzQMbDT57tr85zs1YzP9/NYeak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787939707; c=relaxed/simple;
	bh=Hhpkj9lJh5ryeytG6zlOpawBUbwsuwrH/Idrv5W/Wy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LJRRIVUtBgzCtHGYN+YJQGuFEWAjoir+brmCm0z4Kx3TE/8aiW1+gPBcpJyIJce3PpBRLnGIBJsEN3PSqRJBzKTeAvnn0p1QgxRKGal8YnWnlziEWIU1J1uCV4ke62f59YGL2Q+WaQWXjIAHdICbBIyW5xwvOlaMXex78I/PFiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rHheOMwg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rHheOMwg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47D23408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787939280; bh=sKqmDA887vaQZFlQLMzyf4sV+IekI3SfuxhmaY9lC2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rHheOMwgidlZgI38sesCN1ZScRaSorDOIUzFxt78HqpV6UyLUErPs0Vx9BkgfxRxC
	 Qpcl7PECIYE5ee9m6iBbBo9DHlzSWkZCCFjPcr+hopBiGbhAXU+kqre3DkHVd8Gph2
	 pMDVkwmQevzRx5qCDBOarhKh1bLZ/6+x5OcF45CIgEwi/0ZyZBaQDPPYSpTT7e1nOD
	 lJTmrPYNCE2rcEEbY5QTjnHT1dbJ5SI82su5V5f+cyMMaussMnqSoQAVqTILTGs8xL
	 s7Zp/l7/HjOaL2OAAGJgRfp4Z1B4dhiUEu8p/wyjbtEvz8Grw3V+wIedPqLWDYHU98
	 kUkJwozPE6poQ==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47D23408B2;
	Fri, 28 Aug 2026 17:48:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Martin Kavasi <martin.kavasi3@gmail.com>, linux-doc@vger.kernel.org
Cc: Martin Kavasi <1ai1d7wbz@proton.me>
Subject: Re: [PATCH] docs: hu_HU: add Hungarian translation of howto.rst
In-Reply-To: <20260828145523.126668-1-1ai1d7wbz@proton.me>
References: <20260828145523.126668-1-1ai1d7wbz@proton.me>
Date: Fri, 28 Aug 2026 11:47:59 -0600
Message-ID: <87wltam90w.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Martin Kavasi <martin.kavasi3@gmail.com> writes:

> Add an initial Hungarian translation of Documentation/process/howto.rst.
>
> Also add the Hungarian documentation translation infrastructure,
> including the hu_HU index and disclaimer, register the translation
> directory in Documentation/translations/index.rst, and add a
> MAINTAINERS entry for Hungarian documentation.
>
> Signed-off-by: Martin Kavasi <1ai1d7wbz@proton.me>
> ---
>  Documentation/sphinx/translations.py          |  1 +
>  .../translations/hu_HU/disclaimer-hu.rst      |  8 +++
>  Documentation/translations/hu_HU/index.rst    | 55 +++++++++++++++++
>  .../translations/hu_HU/process/howto.rst      | 61 +++++++++++++++++++
>  Documentation/translations/index.rst          |  1 +
>  MAINTAINERS                                   |  5 ++
>  6 files changed, 131 insertions(+)
>  create mode 100644 Documentation/translations/hu_HU/disclaimer-hu.rst
>  create mode 100644 Documentation/translations/hu_HU/index.rst
>  create mode 100644 Documentation/translations/hu_HU/process/howto.rst

Thanks for working to improve our documentation.  You really should copy
the maintainer (me) for patches like this, though; our process
documentation covers that.

Did you do this translation yourself, or was there LLM involvement in
this work?

Also ...

[...]

> diff --git a/Documentation/translations/hu_HU/process/howto.rst b/Documen=
tation/translations/hu_HU/process/howto.rst
> new file mode 100644
> index 000000000000..f0d1efa37f9c
> --- /dev/null
> +++ b/Documentation/translations/hu_HU/process/howto.rst
> @@ -0,0 +1,61 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. _process_howto:

This will cause a build error.  This means you have not actually built
the documentation after making your changes.

The duplicate-label problem is typically addressed by adding the
translation language to the label name.  This top-of-file label, though,
is entirely unneeded and should simply be removed.

> +.. include:: ../disclaimer-hu.rst
> +
> +:Original: :ref:`Documentation/process/howto.rst <process_howto>`
> +:Translator: Martin Kavasi <1ai1d7wbz@proton.me>
> +
> +HOGYAN fejlessz=C3=BCnk Linux-kernelt
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Ez a t=C3=A9m=C3=A1val kapcsolatos leg=C3=A1tfog=C3=B3bb dokumentum. =C3=
=9Atmutat=C3=A1st ad ahhoz,
> +hogyan v=C3=A1lhat valaki Linux-kernel fejleszt=C5=91v=C3=A9, valamint h=
ogyan saj=C3=A1t=C3=ADthatja
> +el a Linux-kernel fejleszt=C5=91i k=C3=B6z=C3=B6ss=C3=A9ggel val=C3=B3 e=
gy=C3=BCttm=C5=B1k=C3=B6d=C3=A9shez sz=C3=BCks=C3=A9ges
> +ismereteket. Nem pr=C3=B3b=C3=A1lja a kernelprogramoz=C3=A1s technikai r=
=C3=A9szleteit
> +bemutatni, hanem abban seg=C3=ADt, hogy megtal=C3=A1ld a megfelel=C5=91 =
kiindul=C3=B3pontot.
> +
> +Ha a dokumentumban tal=C3=A1lhat=C3=B3 inform=C3=A1ci=C3=B3k elavulnak, =
k=C3=A9rj=C3=BCk, k=C3=BCldj jav=C3=ADt=C3=A1st
> +a f=C3=A1jl karbantart=C3=B3j=C3=A1nak, akinek a neve a dokumentum alj=
=C3=A1n tal=C3=A1lhat=C3=B3.
> +
> +
> +Bevezet=C3=A9s
> +---------
> +
> +Teh=C3=A1t szeretn=C3=A9d megtanulni, hogyan v=C3=A1lhatsz Linux-kernel =
fejleszt=C5=91v=C3=A9?
> +Vagy a vezet=C5=91d azt mondta: =E2=80=9E=C3=8Drj egy Linux-illeszt=C5=
=91programot ehhez az
> +eszk=C3=B6zh=C3=B6z.=E2=80=9D Ennek a dokumentumnak az a c=C3=A9lja, hog=
y megtan=C3=ADtson mindarra,
> +amire ennek el=C3=A9r=C3=A9s=C3=A9hez sz=C3=BCks=C3=A9ged van: bemutatja=
 a k=C3=B6vetend=C5=91 folyamatot,
> +=C3=A9s tan=C3=A1csokat ad a k=C3=B6z=C3=B6ss=C3=A9ggel val=C3=B3 egy=C3=
=BCttm=C5=B1k=C3=B6d=C3=A9shez. Megpr=C3=B3b=C3=A1lja azt is
> +elmagyar=C3=A1zni, hogy a k=C3=B6z=C3=B6ss=C3=A9g mi=C3=A9rt =C3=BAgy m=
=C5=B1k=C3=B6dik, ahogyan m=C5=B1k=C3=B6dik.
> +A kernel t=C3=B6bbnyire C nyelven =C3=ADr=C3=B3dik, n=C3=A9h=C3=A1ny arc=
hitekt=C3=BAraf=C3=BCgg=C5=91 r=C3=A9sze pedig assembly nyelven. A kernel f=
ejleszt=C3=A9s=C3=A9hez elengedhetetlen a C nyelv alapos ismerete. Az assem=
bly nyelv ismerete =E2=80=94 b=C3=A1rmely architekt=C3=BAra eset=C3=A9ben =
=E2=80=94 nem sz=C3=BCks=C3=A9ges, kiv=C3=A9ve, ha az adott architekt=C3=BA=
r=C3=A1hoz alacsony szint=C5=B1 fejleszt=C3=A9st tervezel.

You need to observe the 80-column line limit in documentation; did
checkpatch.pl not warn you about this?

> +
> +B=C3=A1r az al=C3=A1bbi k=C3=B6nyvek nem helyettes=C3=ADtik a megfelel=
=C5=91 C nyelv=C5=B1 k=C3=A9pz=C3=A9st =C3=A9s/vagy a t=C3=B6bb=C3=A9ves ta=
pasztalatot, referenciaanyagk=C3=A9nt hasznosak lehetnek:
> +
> +    "The C Programming Language" =E2=80=94 Kernighan =C3=A9s Ritchie [Pr=
entice Hall]
> +    "Practical C Programming" =E2=80=94 Steve Oualline [O'Reilly]
> +    "C: A Reference Manual" =E2=80=94 Harbison =C3=A9s Steele [Prentice =
Hall]
> +
> +A kernel a GNU C-t =C3=A9s a GNU eszk=C3=B6zl=C3=A1ncot haszn=C3=A1lja. =
B=C3=A1r megfelel az ISO C11 szabv=C3=A1nynak, sz=C3=A1mos olyan kiterjeszt=
=C3=A9st haszn=C3=A1l, amelyek nem r=C3=A9szei a szabv=C3=A1nynak. A kernel=
 =C3=B6n=C3=A1ll=C3=B3 C-k=C3=B6rnyezetk=C3=A9nt m=C5=B1k=C3=B6dik, =C3=A9s=
 nem t=C3=A1maszkodik a szabv=C3=A1nyos C-k=C3=B6nyvt=C3=A1rra, ez=C3=A9rt =
a C szabv=C3=A1ny bizonyos r=C3=A9szei nem t=C3=A1mogatottak.
> +
> +Tetsz=C5=91leges long long t=C3=ADpus=C3=BA oszt=C3=A1s =C3=A9s lebeg=C5=
=91pontos m=C5=B1veletek nem enged=C3=A9lyezettek. Id=C5=91nk=C3=A9nt neh=
=C3=A9z lehet meg=C3=A9rteni, milyen felt=C3=A9telez=C3=A9seket tesz a kern=
el az eszk=C3=B6zl=C3=A1nccal kapcsolatban, illetve milyen kiterjeszt=C3=A9=
seket haszn=C3=A1l. Sajnos ezekhez nincs egyetlen, mindenre kiterjed=C5=91 =
referencia. Tov=C3=A1bbi inform=C3=A1ci=C3=B3=C3=A9rt k=C3=A9rj=C3=BCk, tek=
intsd meg a GCC inform=C3=A1ci=C3=B3s oldalait (info gcc).
> +
> +Ne feledd, hogy azt pr=C3=B3b=C3=A1lod megtanulni, hogyan m=C5=B1k=C3=B6=
dj egy=C3=BCtt a m=C3=A1r
> +l=C3=A9tez=C5=91 fejleszt=C5=91i k=C3=B6z=C3=B6ss=C3=A9ggel. Ez egy soks=
z=C3=ADn=C5=B1 k=C3=B6z=C3=B6ss=C3=A9g, amely magas
> +elv=C3=A1r=C3=A1sokat t=C3=A1maszt a k=C3=B3dol=C3=A1ssal, a st=C3=ADlus=
sal =C3=A9s a munkafolyamatokkal
> +szemben. Ezek a szab=C3=A1lyok =C3=A9s elv=C3=A1r=C3=A1sok id=C5=91vel a=
lakultak ki, annak
> +tapasztalatai alapj=C3=A1n, hogy mi m=C5=B1k=C3=B6dik a legjobban egy il=
yen nagy =C3=A9s
> +f=C3=B6ldrajzilag sz=C3=A9tsz=C3=B3rt csapat eset=C3=A9ben.
> +
> +Pr=C3=B3b=C3=A1lj meg el=C5=91re min=C3=A9l t=C3=B6bbet megtanulni ezekr=
=C5=91l az elv=C3=A1r=C3=A1sokr=C3=B3l, mivel
> +j=C3=B3l dokument=C3=A1ltak; ne v=C3=A1rd el, hogy m=C3=A1sok alkalmazko=
djanak hozz=C3=A1d vagy a
> +c=C3=A9ged munkam=C3=B3dszereihez.
> +
> +Jogi k=C3=A9rd=C3=A9sek
> +
> +A Linux kernel forr=C3=A1sk=C3=B3dja a GPL licenc alatt ker=C3=BCl kiad=
=C3=A1sra. K=C3=A9rj=C3=BCk, tekintsd meg a forr=C3=A1sfa f=C5=91k=C3=B6nyv=
t=C3=A1r=C3=A1ban tal=C3=A1lhat=C3=B3 COPYING f=C3=A1jlt. A Linux kernel li=
cencel=C3=A9si szab=C3=A1lyait, valamint az SPDX <https://spdx.org/>_ azono=
s=C3=ADt=C3=B3k forr=C3=A1sk=C3=B3dban t=C3=B6rt=C3=A9n=C5=91 haszn=C3=A1la=
t=C3=A1t a :ref:`Documentation/process/license-rules.rst <kernel_licensing>=
` dokumentum ismerteti. Ha tov=C3=A1bbi k=C3=A9rd=C3=A9seid vannak a licenc=
cel kapcsolatban, fordulj =C3=BCgyv=C3=A9dhez, =C3=A9s ne tedd fel ezeket a=
 Linux kernel levelez=C5=91list=C3=A1j=C3=A1n. A levelez=C5=91list=C3=A1k r=
=C3=A9sztvev=C5=91i nem =C3=BCgyv=C3=A9dek, ez=C3=A9rt jogi k=C3=A9rd=C3=A9=
sekben ne hagyatkozz a kijelent=C3=A9seikre.
> +
> +A GPL-lel kapcsolatos gyakori k=C3=A9rd=C3=A9sekre =C3=A9s v=C3=A1laszok=
ra vonatkoz=C3=B3an l=C3=A1sd:
> +
> +https://www.gnu.org/licenses/gpl-faq.html
> diff --git a/Documentation/translations/index.rst b/Documentation/transla=
tions/index.rst
> index b6d24f6f17d1..5f85388a83d9 100644
> --- a/Documentation/translations/index.rst
> +++ b/Documentation/translations/index.rst
> @@ -14,6 +14,7 @@ Translations
>     ko_KR/index
>     pt_BR/index
>     sp_SP/index
> +   hu_HU/index

These entries should be kept in alphabetical order

Thanks,

jon
