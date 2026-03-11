Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0623E3C5D
	for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250222; cv=pass; b=O1zcecprIJ0wIawshMyHAZlAMQK/l09jQALGF5oP3gpCVrie6e0J6tb/77J90umVYwfmeTUb0C4EtSft0y4XBpXOmmplTW2Nsk5GgHu0QUeZu/VWhFtgsw1xAPNHJewEZot37peJJq7B5R556rb6uWzytyH5HS11bQXalqYyI+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250222; c=relaxed/simple;
	bh=CKM1n2Wdhe/57EFBYLvmUFjWE4bJokv1Ht+riM+e6A8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahDFNX0qit7Yc4MIxbHRmUMbHEBaflrNLwgauvsyrOoRe9ED8xIr8cFHpXDGTotgzuVqza+M+t0v/NHGOT9Gv2QzhzYsSBY9uBzGlohFmwdKiZESI38nGxTrUgXmXJKMVuGGiQRacIH2dc8J9Y+i20uBIBb4yGOukKbZykdHavk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmNEuMb5; arc=pass smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmNEuMb5"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-67baf20e8c2so56192eaf.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Mar 2026 10:30:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773250218; cv=none;
        d=google.com; s=arc-20240605;
        b=Yh2nxXUclRCfcM4Kg1LnvXuhBzzd23eGHC7msknJv98uIj19duHUZ5AQNg/RYsDXKK
         7sMCxPIJD8zL+0SBrq/rqX0Zd+4N5y0hREAjJPE8vwEnIQ6PpRPosJABNfNDvaJon6T/
         nAPOVThn26wCImEoXSGKQRYdlfZlQrzF3Jm02rGeaQklIDe1UqxjX/CUqiSguEsHqey0
         xlj9y8ldluibldjflLlB1TS7dfu5WzgppCf0EY4sXU3bmByarby1yqebQAr3+1apgMbK
         l8BjgCPGFOAK8JkFKIDInDWu/vmJc2yyIUZotWbEuPx2bo0QMWDD45NyX+DuoAKhXwO5
         PGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eInaHgvbxJZFliomD192j+6HQ7y2w+kEsAdQWRCm7s4=;
        fh=CvAoNJxu24rG0D2SJaE2994iI9FE2xtVN6/18KyIvjo=;
        b=NDtLJkbEudwC/PED0vBnuIKE067KFRifBAbXnTyIJ5pNdDaEGO0qKAm5VaYoV0JC5a
         wSreKbRjWPxpqGFwdD1XRFwKvXiYJuxeatoq6uSXKjAyGG2PHfGTY438FesJRBMyG0B3
         fdcgHm8lSnqReWesHpIrKqsXjwx6ZZOy6LOSKZPtQ80otPzD1jPFbj5Qaju7rcjxcVsU
         YZRC1cRfSIUDycMwTTnjDZ/j2vMWORtHBqUd9CaeieEcO9Ol6tyo+3vBfqGmayjY0XQo
         tHx2pjDqQ3+v4e1Io/ixAYJWeUJog5fd5zO0pEJxALfNjnL/D6znJXftJvky5i2caZCI
         U5GQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773250218; x=1773855018; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eInaHgvbxJZFliomD192j+6HQ7y2w+kEsAdQWRCm7s4=;
        b=AmNEuMb5pEgmznlcc7hIt/SMVPAa4NMLZvEmPav9BJDEOd1TkNk7Ff874EsjXZQjcl
         ecgS/grHI9xiYNlHV1zY6P7Ngof/nPlhKzNAUUrVrEJQsD/BOx0BvzwEkAhhms9mtfe9
         vHwIMXiiQaksrabKA+Opt8TzW+saruUaRfOEiKWnttApBfndRlPr6V4w+ZH/3PlH/+hN
         nrOCTDDIjkbnL6JjuxlRtyTOiQRxjCep6K4iLxQ27bhhF35WYGMx201eKplNDmVD4jK0
         KlS18Juf9w9MCbW4liGIySEHToGGjjQRbj3wtZ0BzVrNkdFwAYhPdcxuL72oIFyupBAi
         sGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773250218; x=1773855018;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eInaHgvbxJZFliomD192j+6HQ7y2w+kEsAdQWRCm7s4=;
        b=UMstvGrm9OO0g6SBTgGVpODuYtmHRkFid/Nv3X4ohybqALL1su3CmRu4R3ohJP4sfu
         V4eLKMv4NgtGf4I3jYBi/GMOv9ZmFqjfJfcimwH9dmc49j1JMyNwIU6bd1hWYQcgYtEn
         rkB4MfKoquDa5qC7WFU3jD91dhNYTvcIacc2Grv9BBkZQmUavtzqMBVqWkh3uJbob5SQ
         IjqeSgaRTwmPHWDf5U4Y4jC1dUM/D6Ou9ifITosBn6KeSigpeOTux5AP2UweCh6eGbYn
         AunIbwUyAWbpxfe7LcTyoNTPj8lMFNTOn8gwDKyrZnjhYuO4wCgw9cwzIUN5Z5YbXEdc
         72YQ==
X-Gm-Message-State: AOJu0YzJOpo86o+AIWiDQVu/SkimdHIyscY+zeMm8Txyb9Lf5zQDa/XO
	lA6xBxfhSRj2vdD6Irjch0BdIbLLyKB+8eqM6AEs+UcO4FjwBMTOeU+Kgp4AVhgzAApNKgNRPlF
	c6PFhY7mPAfJ2Aa2MdLAuO0DsYQO8njFQAIIoCk0=
X-Gm-Gg: ATEYQzwAj2fymAyvYHpmfZDKi/Rqf7N70bKu9wJJ3x59UiFZCCTGwLaSHp4MbHylzcj
	ObSGXiZhR3PtTBu7dOKHVdBOLrHZWx1XEv0mhKsIBvERd7RQG/5hxU9tgL8TcPmjQsQLABiWJAj
	5Pu9tVLsOp0JxYbr8Qz7l4JxyFCTe46k6hSA810CoedlxviC+eY/Fg3Rj+UqltgWv5U31AMIOiw
	b4cw8mmZqcrGzrX+rZrdtekkCzVZcBxFgsLVIOs7QKvq75cs/Ke8ZCnEzV67qC+GkRFFcKu3a8u
	KARr1JaEJQnmtWMmmjuQ4QML/LH5u84oQU/5WXI=
X-Received: by 2002:a05:6820:290e:b0:67b:c7a3:44e8 with SMTP id
 006d021491bc7-67bc8ac7641mr1783818eaf.74.1773250217842; Wed, 11 Mar 2026
 10:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309030411.88945-1-danielmaraboo@gmail.com> <874impxab2.fsf@trenco.lwn.net>
In-Reply-To: <874impxab2.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 11 Mar 2026 14:30:06 -0300
X-Gm-Features: AaiRm50kD1zNn0j6HrzsUyjPAfXJOX_8FecXyvG1Wvo1d-VYVVH-Xeg7lqMB304
Message-ID: <CAMAsx6ehZkRV5e7a4KC47LSsnNq24Z=1nhJ+vBLdFbGrVXdE2g@mail.gmail.com>
Subject: Re: [PATCH docs-next v2] docs: pt_BR: add netdev and maintainer
 handbook translations
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2026 at 1:00=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wro=
te:
>
> Daniel Pereira <danielmaraboo@gmail.com> writes:
>
> > Translate the netdev development process and the maintainer handbooks
> > into Brazilian Portuguese. Also, update the main pt_BR index to
> > link these documents.
> >
> > Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> > ---
> > v2:
> >   - Fixed "Title level inconsistent" error in maintainer-netdev.rst (li=
ne 233).
> >   - Corrected section header hierarchy and length to match Sphinx requi=
rements.
> >   - Fixed formatting errors in section headers (corrected "=3D=3D" mark=
ers).
> >   - Cleaned up trailing whitespaces to pass checkpatch.pl.
> > v1:
> >   - Initial submission.
>
> A couple of minor notes follow...
>
> >  Documentation/translations/pt_BR/index.rst    |   1 +
> >  .../pt_BR/process/maintainer-handbooks.rst    |  10 +-
> >  .../pt_BR/process/maintainer-netdev.rst       | 788 ++++++++++++++++++
> >  3 files changed, 798 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/translations/pt_BR/process/maintainer=
-netdev.rst
> >
> > diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation=
/translations/pt_BR/index.rst
> > index de5c005f9..8822e21cf 100644
> > --- a/Documentation/translations/pt_BR/index.rst
> > +++ b/Documentation/translations/pt_BR/index.rst
> > @@ -69,3 +69,4 @@ kernel e sobre como ver seu trabalho integrado.
> >     Como come=C3=A7ar <process/howto>
> >     Requisitos m=C3=ADnimos <process/changes>
> >     Manuais dos mantenedores <process/maintainer-handbooks>
> > +   Processo do subsistema de rede (netdev) <process/maintainer-netdev>
> > diff --git a/Documentation/translations/pt_BR/process/maintainer-handbo=
oks.rst b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > index eb650bc60..2d0a029e6 100644
> > --- a/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > +++ b/Documentation/translations/pt_BR/process/maintainer-handbooks.rst
> > @@ -5,4 +5,12 @@ Notas sobre o processo de desenvolvimento de subsistem=
as e mantenedores
> >
> >  O prop=C3=B3sito deste documento =C3=A9 fornecer informa=C3=A7=C3=B5es=
 espec=C3=ADficas de
> >  subsistemas que s=C3=A3o suplementares ao manual geral do processo de
> > -desenvolvimento :ref:`Documentation/process <development_process_main>=
`.
> > +desenvolvimento.
> > +
> > +Conte=C3=BAdos:
> > +
> > +.. toctree::
> > +   :numbered:
> > +   :maxdepth: 2
> > +
> > +   maintainer-netdev
> > \ No newline at end of file
>
> Files should have a final newline, you don't really want to see this in
> a diff.  Most editors can be configured to ensure that the final newline
> is there.
>
> > diff --git a/Documentation/translations/pt_BR/process/maintainer-netdev=
.rst b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> > new file mode 100644
> > index 000000000..abda4fe70
> > --- /dev/null
> > +++ b/Documentation/translations/pt_BR/process/maintainer-netdev.rst
> > @@ -0,0 +1,788 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Subsistema de Rede do Linux (netdev)
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +tl;dr
> > +-----
> > +
> > +- **Direcione seu patch para uma =C3=A1rvore** =E2=80=93 use ``[PATCH =
net]``para corre=C3=A7=C3=B5es
> > +  ou ``[PATCH net-next]`` para novas funcionalidades.
> > +- **Tag Fixes** =E2=80=93 para corre=C3=A7=C3=B5es, a tag ``Fixes:`` =
=C3=A9 obrigat=C3=B3ria,
> > +  independentemente da =C3=A1rvore de destino.
> > +- **Tamanho da s=C3=A9rie** =E2=80=93 n=C3=A3o envie s=C3=A9ries grand=
es (> 15 patches);divida-as em
> > +  partes menores.
> > +- **Intervalo de envio** =E2=80=93 n=C3=A3o reenvie seus patches dentr=
o de um per=C3=ADodo de 24
> > +  horas.
> > +- **Reverse xmas tree** =E2=80=93 organize as declara=C3=A7=C3=B5es de=
 vari=C3=A1veis locais da mais
> > +  longa para a mais curta.
> > +
> > +netdev
> > +------
> > +A **netdev** =C3=A9 a lista de discuss=C3=A3o para todos os assuntos d=
o Linux
> > +relacionados
> > +a rede. Isso inclui qualquer item encontrado em ``net/`` (ex: c=C3=B3d=
igo
> > +principal
> > +como IPv6) e  em ``drivers/net`` (ex: drivers espec=C3=ADficos de hard=
ware)
> > +na =C3=A1rvore
> > +de diret=C3=B3rios do Linux.
>
> Why the strange line breaks throughout this file?  That will make
> reading the plain text rather harder.
>
> Thanks,
>
> jon

Hi Jonathan,

I'm preparing v3. I've ensured a final newline in
Documentation/translations/pt_BR/process/maintainer-handbooks.rst to
address your previous comment.

However, during local testing of v3, I received a warning about a "new
blank line at EOF" on one of the files. Could you please confirm if I
should ensure the correct single final newline is present in both
maintainer-handbooks.rst and the new file, maintainer-netdev.rst? I've
also tried to address the "strange line breaks" in the latter.

I have a version of v3 ready to send if the newline fix is only
required for maintainer-handbooks.rst.

Thanks,

Daniel
