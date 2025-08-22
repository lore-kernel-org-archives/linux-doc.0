Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A612F1FC4
	for <linux-doc@vger.kernel.org>; Fri, 22 Aug 2025 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854906; cv=none; b=bkguMQmrSjZ/l2rotXWwSdW/4kHI1YOQMPB5bBKuV7pnQWbfNzn8bMpBdaAPo6e9QpDZZhegAzosbtV13f2T116FFpSLjOx6iAfL1pn4AVXzLjL7lSyE8F8+gnZqxdYFOlmcoiaNc5Lpia6GkLD7Zc1qjPXd7/DPtdvWpTY8B/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854906; c=relaxed/simple;
	bh=h44br5LDQv0BseE3KnCb4hJjXarEdaBBlWW/KK35hVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s37hoLs5jjE0iB4hAl9mn+mNqDZswHEMIGBwgxukR19/CNWgtgqQeDUmHFcdaQ7kVECBzbhx3gB5BIgX85Sd7yxUm6xiQRvic28icvIJI6T7S11Fq5Ji9nWV5Uki/bZ6NYnxZj7D9An+2RdkvmFx1t3EzfPK5vRCPurVfZ+33WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OnouSGbl; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OnouSGbl"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-8920c579f98so562158241.0
        for <linux-doc@vger.kernel.org>; Fri, 22 Aug 2025 02:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755854904; x=1756459704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTifXRrK08jCyKqVxJKl2F+7vzPyJ0kiGwiVQHMIHWQ=;
        b=OnouSGblUVZTS3NRreuY3RPnt0gjBcS7yrwMQ2BmyhD8Ry+6aXfdFe1pVwrWUyKhPc
         aR2A2SK3A4x2/QHL0cm++ByWVZkHs84xr+MaGpaldvvsCdnL5WHTPYM6KnuC9arw6AyV
         KZJyY4GlbQCP3zezqTK5UM4rg1TrrOkuaLwXCaCcmr1gPee6N3bMyS4Vl3+QswpN4++t
         yrqrraolU8FPekA2ykNp00DDPgDkVLLlDLPm2LCATwcpzj0gO9G4QpUQlMr/QaERCkOr
         UhsNJoQMdBHVDOkVAWhD7wA3LyMcRSnJpsZjsYFoTVvl2BvHsuebTA4/x8mK650Q5arw
         yWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854904; x=1756459704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTifXRrK08jCyKqVxJKl2F+7vzPyJ0kiGwiVQHMIHWQ=;
        b=fVFEPa4/OF71AMeNVUZOgVh1GNOJAkav2GXWi5/DA5MEy/Roa02NQ4p4Ou95fyl4uX
         FaUttXmkdtO8wTC6z+1ntI4sxc2ZOuK5MCmChz9r1+RAsfp9bJ1xeoIasV4phdjtshSJ
         HY3+atvC4Tot6cRNpmH1LMTrfp56ibvKAukaJ+kzxyPXA1Q5iIAOPiZ4NEhGPTbVfcqE
         c8RYzxkGs8tTh0xMJlHMfvjjiREzjmlGjpbVPgY792V+rUQZCyey9FO9uqHYG9x6PBOx
         fVzcGa2DI1CrVLnSxXqJhtofF3THjCX/ueKtUSOHdEFlvtsYLtAcZ1+JI6aSfJB/j7eE
         2ZPg==
X-Forwarded-Encrypted: i=1; AJvYcCXaYoBGQm/snVtLR/O8OuFrN69riO8OseTqnXLGWxNUmfLtyqyN98WrfG+asklOd0UrhjyU9HYdw8I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRynEaQfPfmk9dbZsBObNFt6hlSgyjL90wi9LBoiS2m/j23qch
	myK3hEGAuQrpud9VaJsxRbRpnIpphEVzVlK6255+Ihzk0umGewxuG9UtiurvpPJtu+DtjAaWxNX
	TuJFJALaOpfoT0598Z3Qs3ztSoG9b5lE=
X-Gm-Gg: ASbGncun+ZYBAIR7FfOC7DWt2nTfmkCtGnEtOSIIGsFt3pIOiIxKnI4fF5i5Tr/hj8+
	P7sirBlnQewZq5I+/AkS3aVBA+kfPwSmHLqz7B44F3p04F/QUcuQniI4jvEu+Fbz4Lb40m1SNsM
	n81WL3lSnSJmLC//mbmTt09hnnyFB1VciLV1uOYvzJ3KqagqDxTneygEDZ3KkK7vqswLulSlBgC
	cHLg60FjY7PHiWwcPKkOPi0EI5/CVTP/rpeNWoQlOEOZ4U0vxK6Tgwq9pTOVQ==
X-Google-Smtp-Source: AGHT+IEeX0lE8kU6E9QdSAUzfVyV9wkWZKLrBlN769Y5Bh2TkuIKhVEec3g4tWpOuEtkPUO3AWcQY8ZUNGyC5qrXzrY=
X-Received: by 2002:a05:6102:c04:b0:4fb:dde8:76cf with SMTP id
 ada2fe7eead31-51d0d74d178mr515300137.13.1755854903887; Fri, 22 Aug 2025
 02:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com> <87ect47e0t.fsf@trenco.lwn.net>
In-Reply-To: <87ect47e0t.fsf@trenco.lwn.net>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Fri, 22 Aug 2025 11:28:12 +0200
X-Gm-Features: Ac12FXxbEtb4LitNVasiGaFy0KDO2bDJJWDqQBSDd4eHWLeZZID6sTIa8X6RUK0
Message-ID: <CAPqLRf08i3FgXWNoP=gg1qy92hVhkZq3N3MeKpSuOs4U3KqeSQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Many thanks for your feedback and review.
I will keep them in mind when working on upcoming patches.


On Thu, 21 Aug 2025 at 19:58, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:
>
> > Fix documentation issues by removing a duplicated word and adding the
> > missing SPDX-License identifier.
> >
> > Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> > ---
> >
> > Changelog:
> >
> > Changes since v2:
> > - Replace =E2=80=9Cthat=E2=80=9D with =E2=80=9Cthe.=E2=80=9D
> >
> > Changes since v1:
> > - Add missing SPDX-License tag
> > - Remove duplicated word "that"
> >
> >  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> A couple of minor notes:
>
> - It is good to indicate *which* file you are modifying; I've rewritten
>   the subject line to that end.
>
> - Adding SPDX headers is a bit fraught unless you are truly sure of the
>   license under which the file was contributed.  Given the nature of
>   this file and all of the people who have touched it, though, GPLv2 is
>   the only option that makes any sense.
>
> Applied, thanks.
>
> jon



--=20
Best regards
Bart=C5=82omiej Kubik
