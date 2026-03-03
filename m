Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F32E6CC2
	for <linux-doc@vger.kernel.org>; Tue,  3 Mar 2026 17:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558230; cv=pass; b=H//4sntNl+1hlq/XM+st+h7XMwtjWFMTxGdEWWMvBdkmWdMpygDL/QFguDMMbh3EcIxohZLICXqpNvmCku98LcSG9sthSQXPj2ZbulsY7zaYIaAxed+MoSHfn6yEeA2kZU/pomP52u9PVxL0GHiDr2g0m90VTVL3f4RMYbKEGTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558230; c=relaxed/simple;
	bh=AZd/FK3QwxxPb/CjRWBSm3xRdhLXOsHikDCO00MifLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qysGL9Lc5GzROQxyLQ9rhIDGNCbeOMrhJ/gDtoaloGPmKiBrOwok/bU2ayGqupf9DGi0yHnJ7uz0pHFqI3nIVrvNn0erKxl/lIm6Xh/LQg/bhQNCNutnE62Pr69vpUTE5aHkZgZykl/aG8Wucy1r3mANaHrZoZOStcd7oVKSX8M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mg87Es0U; arc=pass smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mg87Es0U"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d596a5be31so4934573a34.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 09:17:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772558228; cv=none;
        d=google.com; s=arc-20240605;
        b=DkkX8wjsHXtXzjou3mlLx1mxtV3rzlRa93Ftz/2gL8zuMcEuzcUp80+cJp4mHfj8TT
         Bcb4UcFQLgHz/nLJS5ux4+gsrt2cEx69SE5N7c9/ISIzQGbAkpm5tHOR7fOUUYZz5aIr
         mIfy48cad0ju6LGzdNvdjYmMpVEdGbbzPehpDy5V4a8P8EYuYOdAsQQnRp6L3ZdMeD3G
         I0uyjJCwox9SjPPuKTHmDrN53LS+avqMerZZTW37xBLFMSVYXejatHfYVbtHNLbfaHbJ
         s5rfiYK4sZHTZ1aqgXTcAnZPHcgE8IVnLmGEjRp9yOdMGGsDz68KDIM+QooaSpUWHW0I
         N6/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGvtY2POvbt1C0KghcQqAC77JYvMzwfr3M9jWrEyiH4=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=WKL0k2aPJs9IVqlACIPQJretd4pzR7gYoMLeQPGZV6Ny9f/kXr/cLTHLmNwrULj8tr
         S8hYYo8r2vl7F+JgFRLLKnLBTJfbiYegRhHUsWM65HQPGv32ET0nPwf6FLrz8MzE5vhz
         FT2hWwVpN6TC2ttfGFJjGJpFiyR4gI3dFoU2TCBNh9FkNmekdZuFLKkOK/YO1H9zZF6e
         +7nihMV8rMoFib3hXN8l6mnKb5zrkNC1N2FNCowD2NmiF7sIar+KVlML/nOGozzwnPqh
         47Y8fFQbCZ7cMiB8S5+zp7uDCge/1RS4VLh0oMoVbVHPURMSLknGYIxwJzAkaeBopDvL
         r9HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772558228; x=1773163028; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hGvtY2POvbt1C0KghcQqAC77JYvMzwfr3M9jWrEyiH4=;
        b=Mg87Es0Uyr1qkksrx1zfwXHbr+XckezGl1COIOch/Kgltdn9Z4TB0trIU0b03rUaTS
         7Gc9BZpQ3RwGF8WA5Q/xWWMIYlZ79Yf4C99LV154KwaVBVwnBby+b5TbqaBsf3qUr4fi
         mtxnwPoHE5Bp97NZkMoN0zktGTQ/HN52CUnCexPAafdCsY+8NPAb7spyLKe/LG0CW/Zu
         O6dEx1FTb1N3I3CxHgEECFJyC+Qvw4YJbMMunMCJ/as8n0x9WsExEpOUBWBXmkWyNppb
         FhyPCB8fNlMe+33V2uGz9Z3wmBKe+F0/WArNtlsJCqS32NP7QuR1/4mvgZRFilJVBr6Z
         O3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772558228; x=1773163028;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hGvtY2POvbt1C0KghcQqAC77JYvMzwfr3M9jWrEyiH4=;
        b=dVOU6lJrD4xeQMLlJ1zI5ISVQsqDXeOUVMWE3IxCBKQa1e0Ky6BGSX5e0GqdjszaOP
         PuAZmB57NjaSXXxJOutSQUwi/2YNDMB9LDWzV1Gj5y2fYhtLHiRdWiIH2AMgTsLDglNG
         2VRT+XZZ1QBDXGQ9sA7E27mh60RfoiCf15p0zuPNyQcjI35pG3WxX1j4YFRdQE2fuJMl
         d5VRm/61a93/U+Wc3P63uBNe4x1+mhZcamQkritYEZbdFqFqV8mdQnKfFBC6ZJSQQ26W
         OAmHdHnUxPxapPcWml98BzpjUA7IJkiLzBc6Mujcc0hsDhCrZ42lhTSjcd8uLnx5hVqI
         lumQ==
X-Gm-Message-State: AOJu0Yy/GU2U2T3QHCNVl3oVy9jJ5KDUMVyfi6NiQ1aWnZDJdHlYync3
	28MlUa1cVMz+PcjvWIeQEUcSJVZkI8+oBmUr2ZqU6WvqEMs40AVbq3h4XmbU3d1sG7Ia2/87iBY
	ySSWXTjLh99CkPoJ2qOMcBFTJbhlwMFt3CvBwC4g=
X-Gm-Gg: ATEYQzyoZ3rZXnqRKKZo/IkGUmlfdWvnMFHGnp3Tss/sdCAaQC2Y+WE0s5t4CBpnkQh
	dA/MyuEO2vBl+b7BpLGNwqItgG7SDFQ6vwnZ22UDtfcKaoifMdcg/hYGGSKz8TWPpGbRd0GkSn9
	bqdvTivpAeRfSxOC1z+Md7JH4N8ZoQ2xFi+5eGo6jLTyp8zJyRcuAcqkJ1PYvfoEkjl8NlIjFAa
	morXc6jZf0a22HvB4YWhmKJFTYSN1WrdSs08gSQY4y6y9TnLa2Y9Y8yGWM1klNZkgHL7LlxNso/
	yQpLiZLmOc5hHfdELTARyPZCIYePxnsZqkRKJ0g=
X-Received: by 2002:a05:6820:168b:b0:66a:b73:5e38 with SMTP id
 006d021491bc7-679faf3ae4dmr9714264eaf.37.1772558227749; Tue, 03 Mar 2026
 09:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226225849.268373-1-danielmaraboo@gmail.com> <87o6l4dequ.fsf@trenco.lwn.net>
In-Reply-To: <87o6l4dequ.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Tue, 3 Mar 2026 14:16:56 -0300
X-Gm-Features: AaiRm51NvMev7PjO-OlvMCOK-wXLtbAJSuzW1QBi6e9aJT3g98HrRY4r_nLm2s4
Message-ID: <CAMAsx6fWycCTf5p4sf19PHROGRaSHn-ixo8GsMh_pno7rR+C+g@mail.gmail.com>
Subject: Re: [PATCH docs-next v2] docs: pt_BR: Add translation for maintainer-handbooks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 2:06=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Translate the maintainer-handbooks.rst into Portuguese (Brazil) and
> > update the main index to include it. This document provides a starting
> > point for subsystem-specific development processes.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > ---
> >  Documentation/translations/pt_BR/index.rst                | 1 +
> >  .../translations/pt_BR/process/maintainer-handbooks.rst   | 8 ++++++++
> >  2 files changed, 9 insertions(+)
> >  create mode 100644 Documentation/translations/pt_BR/process/maintainer=
-handbooks.rst
> >
> > diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation=
/translations/pt_BR/index.rst
> > index 55f9f377e..de5c005f9 100644
> > --- a/Documentation/translations/pt_BR/index.rst
> > +++ b/Documentation/translations/pt_BR/index.rst
> > @@ -68,3 +68,4 @@ kernel e sobre como ver seu trabalho integrado.
> >
> >     Como come=C3=A7ar <process/howto>
> >     Requisitos m=C3=ADnimos <process/changes>
> > +   Manuais dos mantenedores <process/maintainer-handbooks>
> > diff --git a/Documentation/translations/pt_BR/process/maintainer-handbo=
oks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > new file mode 100644
> > index 000000000..eb650bc60
> > --- /dev/null
> > +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > @@ -0,0 +1,8 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +Notas sobre o processo de desenvolvimento de subsistemas e mantenedore=
s
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es=
 espec=C3=ADficas de
> > +subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> > +desenvolvimento :ref:`Documentation/process <development_process_main>=
`.
>
> By now you know what I'm going to say here...:)  That is another useless
> top-of-the-file label.  I won't insist you adjust all of these (I've
> applied this patch), but I will be removing this label in a patch of my
> own.
>
> jon

Hi Jonathan,

Thanks for applying the patch!

To ensure consistency in future submissions, could you please confirm
the exact label you intend to remove? If it is the
SPDX-License-Identifier: GPL-2.0, I should point out that the
checkpatch.pl script usually mandates its inclusion.

Could you be specific about which label is no longer necessary in this
patch so I can replicate this in my next submissions?

Daniel
