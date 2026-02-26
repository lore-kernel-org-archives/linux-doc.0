Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3F038B7BB
	for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 22:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144011; cv=pass; b=ETLSnVV+1POwPxvjD/DvHRPqQXn5f2Ccj+/PBpII9td2x0bzHTE/rvBv1Q3fvUOop5biQmsyXUPd0qVNLhdY9/rWwdE0CvwU9VA+2b1oWK7UG5oJFEJb+fANZR+ZcgpwSvzeJlBfGvN9ad+dneEfySeQ8UVDf5nPbc7Zfhb92EE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144011; c=relaxed/simple;
	bh=abDDPcXe+29hPHW1emd4NBySg9u7C5Q2lO72L9C+s5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+7FkeNkMneDUQHcvzmjrmSIa0wKTmbhRrXwWqb8gPYgsMSg6tgglob9wDqvCxX7Z8xFiePpa/7YtTOBdZ6El9mXuDNaRe2Iy7R32l7+mhP8HSbo5uvbV9FfEKfQYuFwhTnW5iCmaDBpY/fCGo7Rk4Mcz8cVe+KV+OUGOYfUc48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WVh47eMU; arc=pass smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WVh47eMU"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-45f10d7eb81so582452b6e.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Feb 2026 14:13:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772144009; cv=none;
        d=google.com; s=arc-20240605;
        b=Gc4J3XTf78DU6qJjeh8DYueKb1jEs7onmbDmXQY8aLtsJ4vzIT1MQCNf820HqBLCBy
         YoK4RaohCKpPGLwaHNGsF2qifHG+a5fnoqrC32OqYdf20hH5evlEPcpOsFm5fdvP/RHL
         27Tx9EoNF0NF9LyO4twOKexELDw1ZMeWukzTzUKWGlTXj9yrAOdm7L+bIGcB0AM5VKsL
         pto4eD/BuOTKho5Gx4ajneorWaQHQdtChy828tYifdpyuZuoVo18XaHpcVaeN7y07m6M
         geXGwvP2xNsjW/sUrqIraqGNiZjVml/zPm1jBDcoc8Dxmz/dmo25icRe9j9ootWImk6O
         nX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cjyUVTpJARM8OSOZRXHymcGNWil7cvHv+QIjRklvATA=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=Mq+Pyat6Qk/3OdF7a9t/vYm4gEb0vIicEPd4bfs650UgtkclTnLCNwfm4jUouy2keR
         sEsmcrApXCDwKMVr6bLyYM6tq3hCDrgUHrizI23bZllpJ1qaL8geapNqHZlP238bkwVz
         PalGExkHF3qDAiKPagvyunXreNCU9ZaMVcxd4Y2/82eVHHVC1MNPVl40qQKK8U2uqBO5
         zlqAjWpJKZMZmuvQ4z6n43gTh4RnTotSgtjVS9RyP9rUxY6KWhZ2YtlHqqcvFIfnW9/T
         4zoT24I+nmClZoKmZkon9MJx9DqJQtMLmCdhb+kCnYf0uHbGy/24ft7Y/9fCdyLaDiHY
         GLlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772144009; x=1772748809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjyUVTpJARM8OSOZRXHymcGNWil7cvHv+QIjRklvATA=;
        b=WVh47eMUeuc3S81qiLEVNTRvpctRSRjw3PcWmlMqWSu3iLsJWt/GSDAM9neMjOm24U
         1rfxN6+tiMmjT+ucQ3Yq78xjZDn1fUT4NLZchvU/6MG79uKIaAetP6ZxmwJvsbY1r17P
         XFtpFVh44W2G2sJkNsxuNdVckLgF2ivTbYjRlZtCaZQh/ITrPicJuebOq9ocQl7aEFFr
         MdCk9lgvcA6gg4ND6n0+lCNL9hQPmCWDbC8/Pz1oeOcY9Xgc8HSKmqhwKv4zhnjx+EVj
         NBBTP03D9PtAVik4viFpJpESjepkzSnW4jB9DcLgnLmGD0K3cIE0Vg1vMEJ3P9sO3EFl
         1JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772144009; x=1772748809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cjyUVTpJARM8OSOZRXHymcGNWil7cvHv+QIjRklvATA=;
        b=REDqBrf3rQ+TL7arbMdFJ9CsTftjYcbE0TMfmWpzfjXo52I0C4sk0Dg343rn/k+IAu
         SpApVs6dswU+95ENsZB0Wtijc2B0+sfRZr4+AWtIIeKt6RG2xpRAD761Gu86QZAiocyd
         UhmCHfYAzL2PMs20ZH5bxFr0z6Qjh+e0Nq2jr+woRd+cZmTktToAUDc32oO1AaP7CqBy
         fToyY/JZ0hVtmrhvbexcH0+veHK/WTeW6sxNh58+q3ZOFFzCwjvbipFSrPs0HZMvOHXx
         64pXwVkjGkdr5o4HCQT7y8WHKDHmh135E+kGcmFVy6UWvSmUGDRvaC5EarMias6UXhvp
         6+sg==
X-Gm-Message-State: AOJu0YzC16CAnEArGKOLqgK0Uiid8w3nrKcCK+/Zk02OQcz0c86Y4Cgy
	Ur8qbn6k9PkLvNWxEybAGRiD7p+GG5k5kQ6ASv0z81OONGlTDKOXK75ungjTV52XUMpW0sdW7zS
	FxUauIR/pR2weTi1GKQ3yFhP2xAS//s7kk425UOQ=
X-Gm-Gg: ATEYQzyoRzISko5HLfyYRdCiaE65M0bHMRZvZUzqUTjsFZxQN21m865gsMPkSvlNJQk
	ohGMVcGCd4aExvzcNadbG1nih/NlevTWD/pCQorf3lzlN+3VbKq3sYJ2joQF0F/gu+0olnfE4gP
	2vHYy4Ww1/u3bZne8EuNUt5dAMpiZfyaUbYo9l9fc7W0Vxvsz5W17U+kI/F5ZMEV+4lB8FQz4fz
	VFfxM/lNAna2baYDFLdnHHosfZM3BQ1FEr4r7jmtScx9m8A8jy5yZsmW+N3TMbKNlWkHrnpBgoR
	ZNfOfYtsAOJaAWbYS5Iok63Mnjyj/r6+PAf7nmR3sC711FyNrIoarR+aHVa6n5Z7tyjtbcS+ceY
	fj1UsZE21
X-Received: by 2002:a05:6820:4dce:b0:676:96fa:299e with SMTP id
 006d021491bc7-679fadf3c00mr610808eaf.27.1772144008800; Thu, 26 Feb 2026
 14:13:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226212716.260546-1-danielmaraboo@gmail.com> <87o6lb5fbo.fsf@trenco.lwn.net>
In-Reply-To: <87o6lb5fbo.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 26 Feb 2026 19:13:17 -0300
X-Gm-Features: AaiRm50YZccfM3LAs5i3kRVNDMkH-2KizfVHs_XdFEACrpED7Erkmd5yPIZeAp8
Message-ID: <CAMAsx6e0HUCw98bTqt9xJ+CaOC+rSA1h54T0WasR_mvKfaS7Mw@mail.gmail.com>
Subject: Re: [PATCH docs-next] docs: pt_BR: Add translation for maintainer-handbooks
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 7:07=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Add the Brazilian Portuguese translation for the maintainer-handbooks
> > documentation. This document provides subsystem-specific development
> > process notes. Also, update the main pt_BR index to include the new
> > translation.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > ---
> >  Documentation/translations/pt_BR/index.rst            |  1 +
> >  .../pt_BR/process/maintainer-handbooks.rst            | 11 +++++++++++
> >  2 files changed, 12 insertions(+)
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
> > index 000000000..849c7705f
> > --- /dev/null
> > +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > @@ -0,0 +1,11 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. _pt_maintainer_handbooks_main:
>
> Not really your fault but ... I have been trying for a while to stamp
> out this habit of putting unneeded labels at the tops of files.  This
> one isn't used at all; when they are used, it is far better to just give
> the name of the relevant file and let the automarkup magic do its thing.
>
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
> > +
>
> Thanks,
>
> jon

Hi Jon,

Thank you for your feedback.

I kept the label

.. _pt_maintainer_handbooks_main:

to follow the pattern of all the other documents I'm translating, only
changing the initial to

_pt_

.

Would you prefer that I remove this label, or should I keep it for consiste=
ncy?

Best regards,

Daniel
