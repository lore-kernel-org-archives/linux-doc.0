Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA67082D
	for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 21:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756590342; cv=none; b=tcg4QdiN3GTlIQAhcI2yJNL4p9ELb7gpTf+0PjpdfTjuwRg7JBiA69s/rpj7yWsGa5dPw08bYIDGOm/XUlxaSncAESP26B8QWCHFwk7AcB1od3pub2mtbBZJ0yrRd+QlHJmTalJJXBHIgBknB6GQAK0WnSV7g7P5zF7uVErPAZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756590342; c=relaxed/simple;
	bh=H+lvPC4uoyN9zvaqytgz+5QXGyjqkhEn/++8T52nelw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KPURzpTh7zfbcEJRxg/20/3esMdyDmqRk2Q9cKP4TshGsm8FYXtlSe2rc0biqdd0UZedmMKT1P1SDb8JhHIh/TffAu0DuP8yNq11WtePQOLFDhj44SbYrn4DB/fZWIt3Kl29mxh8PRFO1sf9C5Rcl9lCLU7XSmn+QSm8WNpOUcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cg8QPMVR; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cg8QPMVR"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6188b6f501cso3577819a12.2
        for <linux-doc@vger.kernel.org>; Sat, 30 Aug 2025 14:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756590339; x=1757195139; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BbGwbF2zDuURYMaEon5jnKwAx1J80AtKnqc7EidKjAs=;
        b=cg8QPMVRtiy+lBxCjS2UtFLaegjCyKlGEGDGfeibFRpTW6XToehE7uq+YP6uc2qzmH
         SCOu4PVZqgXDWmDNnUAqDInyT8SfVMnSnU53jUHYgRmg45TCZorn1mQnzr14tqhxjN//
         t00iZNgNzHP2Om/AklP0VhxZoB7O+h5xziBt5Swfdgbl2FpPtsQkwZwEHi0PCIsZQKqA
         ZvIpDljFv5xeIczxroCwHbp9iIOlJGh3/dp53SKJ6+ow6eT47QD1LlfZq/J9TTQ0m+40
         q/OADdhPc5OWIJn4GMijFZrsfK2vc2E6mnIbKIUEDSw8YOVFRwbtpCk+OC01hnjIWR6a
         k5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756590339; x=1757195139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BbGwbF2zDuURYMaEon5jnKwAx1J80AtKnqc7EidKjAs=;
        b=UUMjpNj5pJfMiOI8zlPZptGPOyG58wv1yvR8eAlMqt2wdE95kmiZM+i4w2fiEMBPBV
         DLzaTc3Dc7wZp8FGOsfx32qS2SzCDl7n0/qrqAw86lAsteVd5Pu5lB+hxe+ic0U5lcsY
         ylupDbA1VQFN8ANjDO9eJplmDLSpT+EDP71FYCJNE7nVEpQjtBP+zlXluq8aknVLMpma
         gL62s1BVwgEF70F0adwgYdo/sEfsOCZjSGPutU+vW32MqPclrVRGvRuLU55+unPo/nR0
         JjiSkhQr/vOvpCkOPgJjJuknbdQoyuvlKiBZwsII0iZ7Gvkm0yi7K/eHb8ya3uNGUinF
         m+sQ==
X-Gm-Message-State: AOJu0YxqebCHowRGophZQZP6XUzPmj8H4lhic6JajJSx3oNUbiu4vfhE
	rODORFERSea9HcHZiKVttMXnKJQWPTp+3OY1nhNrY8jTIo0q93BR6C5sqRFM4Pe4oUP6TXHIscd
	sbI+FXdKQbGaCPeEjhh5J3ZRwTpM6SJA=
X-Gm-Gg: ASbGncscv1x205OUfQkvd6Hos8cNnqv6B7E6jX1k+rbGegIgd2Jd/PM/Fchyg2Jx4Li
	4AUwPCeblMOhw+Ck1t+5iO1zql2BgSUFsZdZROBtKjJPksAQZ8fTBx+QzDwUghjqnjJlWOEwoWf
	bTDYmK5LY6la4le2U+pbTIan5uTr5M69U5+Y5fo9tAlInTCTnyF494MFUmaF7kK647B9RwGDeT/
	D5IaeTKqqc4tbp0oSZUYrfeWs5U8fo=
X-Google-Smtp-Source: AGHT+IE6TVbsCnQOvLYDGV5jb/y8cvJ9oevBN08OBnaI6nFg0zBfkIa9BlvLpRfMsnSplNiOEwn6JDxjRHzteydEFw8=
X-Received: by 2002:a05:6402:50c8:b0:61c:9585:9eae with SMTP id
 4fb4d7f45d1cf-61d26873560mr2595333a12.6.1756590338787; Sat, 30 Aug 2025
 14:45:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250830191249.25459-1-harikrishnamethari@gmail.com> <87seh81o7u.fsf@trenco.lwn.net>
In-Reply-To: <87seh81o7u.fsf@trenco.lwn.net>
From: Hari Krishna Methari <harikrishnamethari@gmail.com>
Date: Sun, 31 Aug 2025 03:15:26 +0530
X-Gm-Features: Ac12FXxaHFjBMLuEGHGty0xhUZjFUch6pFWIwj_lTp2oyMr-LjUnJQmPFH5l3QQ
Message-ID: <CAJ3fvfr9pYLTMPxN3HbA++HkujZ-DksC9_W6DMUoxfboLP11DA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: Fix typos in filesystems
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Christian Brauner <brauner@kernel.org>, 
	"Darrick J . Wong" <djwong@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

Thank you for clarifying. I realize now that my change was incorrect.
I=E2=80=99ll be more careful and make sure I fully understand the context
before submitting further patches.

Best regards,
Methari Hari Krishna

On Sun, Aug 31, 2025 at 3:11=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Methari Hari Krishna <harikrishnamethari@gmail.com> writes:
>
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
> This change is actively wrong.  Please, make an effort to truly
> understand the text you are modifying before "fixing" things.
>
> Thanks,
>
> jon
