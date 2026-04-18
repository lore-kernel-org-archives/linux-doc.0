Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE93422259F
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 06:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776492757; cv=pass; b=YqvRYE8b/iU5O0LKPuJ8JdHjDAkjV7IDUd+belxzJMj7aLiexthETupGv4/Qp9SD1fGqLWOueum4A+gscd7K5xFmOT6cYWJAGKAmedqWK+fKpZ4GxuShLdiq/FHm8KtXHPPoPGQJSEB93oLLue9yEEu4y8x7RC0+juUmPsIEZOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776492757; c=relaxed/simple;
	bh=+DK9bgnDUQ9HYm/gOCUHsN59Zxq39avS5vrerUEcjSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDYBggnPkL0eG2+x9UKuXAXk/+1NPobNsMWQO2Ns7j1E+rF5nYuLWpiozbfgNbPtB4fPyl9Wxm7NCYwhe+CaZug48V6qrZV6zmNWoeAaXffLI7M+uFSQTof8wZh91ET2fzhVAGULsHoymBX0XWoZh7Vlyq6Gl1d05qxFJE0CfO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYAjFH8V; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYAjFH8V"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-482f454be5bso23690785e9.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 23:12:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776492754; cv=none;
        d=google.com; s=arc-20240605;
        b=faeYXCwWZWt5Dj/7NhSWB65nyAKNGSRyrK283+60CvPi27vZMdr3OVNXSxp8PDPWrh
         o8ns1UOopr3gi3M4bPeYcYADz6gAK/SzxmwglxpSB3XwDtMEoEh++UUe9dC63CGp8LgJ
         EL6DZOHANdC3TyrOcl72QYLeneBw/YN3Xe8E3qMduj2pIRy86ytgEsBGuIci5yEnmC9V
         +S31ZuKQfGWt+Oxu9aH4kHD1GI9P/dzeHBPldSc8aPuQETDfGQHnTmWZckK0Kd9YN5+s
         OmXo+8k8kLMiL+W01h0dw4UAGO+T1N2b2ljL+FqXCWL2ZvNQYQY40ZzD6mMSnxanPwSK
         xA8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b3C/M60s5TyLns1eZdDPM+HgZszGA1MYGLLrN6ugvXw=;
        fh=lKcucpDdAG5+yBn4J3TsNSPRvPO18dTRT2Xr8+SipeU=;
        b=jeOx5OcYyUNKTtL8zWcOERcfKzvzzJAc9vu2tsL4lGyeE5vPkgv+uJIJVSFhO2dkTg
         N4ggkh3RUauDKSrNRZk9NXij460rPUBLtQchA/fDc0Glt0sZQ2rtHfFVgmC0tNiEfHWP
         uwxyjlQcwhMlYjXGyiE2NEYOzwAkSOxlytI/nmM0etKRjEhXhbS0rwolSaA5g8tdPFj7
         zbEchULWA0490RvPFThe9bYgntrX5gdd8289stX28eEbBbEE7Cwmbkq+qZChtcw5wLt8
         3UNn1/F3i9ljDEKUehhbBx1M2lHqpQJL8FEgZTpF0Y9vpNIXDD/XnW61ZD110TbfKJBC
         gMbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776492754; x=1777097554; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b3C/M60s5TyLns1eZdDPM+HgZszGA1MYGLLrN6ugvXw=;
        b=KYAjFH8VqztSWGin5iPNRhNT/izeARm7uVJAI7iN7oOmpKC4MaN2RH47jZBlqgRv9w
         IMYmoELfD7JQmrywV3FmJOiCNkq00yrumTg8YgPnNawb+KT9JZc/JHyMjpjW805wIusa
         Wjy4DjSJur2X33Pec6oGh/6tWeBSwAai9iXXrBEKhZvzRW3qKn4whZb0ZRhWhO2A/fn/
         IG1V2+LErkUFdxVw1PdKJxeBcKF0P2MlR8iBwGYkqPbrXIKOZgW+UQPWKeyqTf/dhrNQ
         j1tSrxn3ukSUuF16JLoddl1iVAXctsVKTXiXWgTJ4pwty9+QgfdbriNNFS32Q0TBg5my
         2vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776492754; x=1777097554;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b3C/M60s5TyLns1eZdDPM+HgZszGA1MYGLLrN6ugvXw=;
        b=SxTN4sCpUI/m03n3pRSsFe97vRbe2pCm4Gz0jZN8UCqS2lxbBuoSg3o6yL4JavsmBx
         dHxWt7BPPUCwN1AKIIZe1An4f35jHbF7buWcDmq2q1SaZnI5R/n4yqTM2mREVXmvKLwD
         JLGH5vX6jhsW8aqg6TsZstaZFFh4bZ/DXiOYqESfIzPLX1HsCLNOwOg6lvSBd+Q2Go/a
         2uLCD8Ipb7+in/m3/4aj/p+PEV8qb59A/fQ7y2joCCPJV3ghrq00l7CH7L0Zpj1p/3mH
         cpoHfizOrijdGcIyptR555u4vAH7lCdqQBOefxRgr7o2EVsk6nMDD1zXQ4ETYLmqFCVH
         WF5w==
X-Forwarded-Encrypted: i=1; AFNElJ/TzsW87gSxYKrpBIrQ98I0sxdn1fVgt+nmWlbb/jYs/vCBfSiBTrFe7AjSxR9y9M0jvvxDsfOsoUU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYRFkwa0MHLYVIvLNWCGROxEly5YUBIIrJsl2PUmtDJhdUUFy6
	FFQ3rCifXpZ2f9fW9WfPcB7nEOxxd5OG4oc7wx4Bys80GwtswARJWhws0TsxOQppbR/coQD/LH9
	LWuHDh6WuwLvYTy0TLsj1HYWrgUh2QB0=
X-Gm-Gg: AeBDievZBS38wG2c6LLH7KPxIQyCzdFQ9gZQVEIAkjDaAHZJIq8fXV7DtZO8XIuZZbz
	/d3ZrO8vg3g1T5shDJgVA3hElgu6xoz3UYLX1EZ8LtqKnxIpTFzDBnZkXa64ITJcp/tm29krG8e
	J+7NEnjUf1vxV3u5TjjeOoGHfyvzu2k6ZO7YN2MeWnxQE5h3sjUbc8JVynHMQuZmDGCvAJJE6N9
	bRka6p88htgSOnzivLJ9aZISszIR5u34hAQDCD4QVMCq2LCm6hWSO+x5xgoIGz1tNpD4AsTaz0e
	dl+cfXbpPxEJMNH+RpL7J4fQv9heP8LFxS/frMTFprVlmyArQSVM
X-Received: by 2002:a05:600c:1e28:b0:488:8be1:ca3a with SMTP id
 5b1f17b1804b1-488fb8b56bcmr80695245e9.15.1776492753973; Fri, 17 Apr 2026
 23:12:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeMQ36jFnCKmCSyA@casper.infradead.org>
 <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
In-Reply-To: <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 18 Apr 2026 14:12:22 +0800
X-Gm-Features: AQROBzCpwOg3xLTc7KyvYORkIX8Q08EHhrIlqTmqbYKrZdQY1xs51voigSyTTRA
Message-ID: <CABZAGRGFpiiEr7Odd5an1+9Z+sX1C6QT2iadv-0hNhxGj8eEyg@mail.gmail.com>
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
To: Matthew Wilcox <willy@infradead.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nick Huang <sef1548@gmail.com> =E6=96=BC 2026=E5=B9=B44=E6=9C=8818=E6=97=A5=
=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:27=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Matthew Wilcox <willy@infradead.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8818=
=E6=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:04=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > > - Add "Overview" section explaining the slab allocator's role and pur=
pose
> > > - Document the three main slab allocator implementations (SLAB, SLUB,=
 SLOB)
Hi Matthew Wilcox
I will remove this sentence in the next version:
=E2=80=9CDocument the three main slab allocator implementations (SLAB, SLUB=
, SLOB).=E2=80=9D
I=E2=80=99m not entirely sure I fully understand your point. If I=E2=80=99v=
e missed
anything, please let me know what needs to be changed. Thank you.

> > Umm.
> >
> > commit 6630e950d532
> > Author: Vlastimil Babka <vbabka@kernel.org>
> > Date:   Tue Feb 28 15:38:07 2023 +0100
> >
> >     mm/slob: remove slob.c
> >
> > commit 16a1d968358a
> > Author: Vlastimil Babka <vbabka@kernel.org>
> > Date:   Mon Oct 2 20:43:43 2023 +0200
> >
> >     mm/slab: remove mm/slab.c and slab_def.h
> >
> > Care to revise?
> >
> Hi Matthew Wilcox
>
> Thanks for pointing this out. You are absolutely right=E2=80=94I overlook=
ed
> the fact that SLAB and SLOB have been removed from the kernel.
> I will remove those sections and ensure the documentation focuses on
> SLUB for the v2 submission. Thanks for the correction.
>
> > > - Highlight SLUB as the default allocator on modern systems
> > > - Add "SLUB Allocator" subsection with detailed information:
> > > - Explain SLUB's design goals and advantages over legacy SLAB
> > > - Document its focus on simplification and performance
> > > - Note support for both uniprocessor and SMP systems
> > >
> > > Signed-off-by: Nick Huang <sef1548@gmail.com>
> > > ---
> > >  Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
> > > index 2bcc58ada302..2d1d093afb7b 100644
> > > --- a/Documentation/mm/slab.rst
> > > +++ b/Documentation/mm/slab.rst
> > > @@ -4,6 +4,32 @@
> > >  Slab Allocation
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >
> > > +Overview
> > > +=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +The slab allocator is responsible for efficient allocation and reuse=
 of
> > > +small kernel objects. It reduces internal fragmentation and improves
> > > +performance by caching frequently used objects.
> > > +
> > > +The Linux kernel provides multiple slab allocator implementations,
> > > +including SLAB, SLUB, and SLOB. Among these, SLUB is the default
> > > +allocator on most modern systems.
> > > +
> > > +SLUB Allocator
> > > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > +
> > > +Overview
> > > +--------
> > > +
> > > +SLUB is a slab allocator designed to replace the legacy SLAB allocat=
or
> > > +(mm/slab.c). It addresses the complexity, scalability limitations, a=
nd
> > > +memory overhead of the SLAB implementation.
> > > +
> > > +The primary goal of SLUB is to simplify slab allocation while improv=
ing
> > > +performance on both uniprocessor (UP) and symmetric multiprocessing =
(SMP)
> > > +systems.
> > > +
> > > +
> > >  Functions and structures
> > >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >
> > > --
> > > 2.43.0
> > >
> > >
>
> --
> Regards,
> Nick Huang

--=20
Regards,
Nick Huang
