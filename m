Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043D932A3FF
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 05:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776490081; cv=pass; b=r5fm2F1W5+otK1kiKvgsEbNoer9qv0iFOkQlzAXMc2sI1asxuuJVDG27fWvWc1Pk7OYpAoJFwogLnvScOJ+yWJ5QCQEDJ28PnWeqM62LI2R6IhzVXaPG4ni7dnp9Wr9VTEz28cXoa3fEQdsrZ93zLWsALYSag2dlHf41NaE0jqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776490081; c=relaxed/simple;
	bh=p5uL/K4ix2xRx4H2e9iVLBLbUlB6f1DXwe1rnGkt+gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b/D32sFxukvcBO+dlAgLU4fxauKNKhMRvuNgdyU4KVKASv07kFteaCb3BkQX1n6VDaEl8b6whGhYQATc+mZuJxnGJL1w6V0T67zQcVIqQAEJPrNmNKLvQraLLYYbD4QuEET1G0r+kFrfOucOs6YOox+WxdNOdI+39GEKekU5WAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=scvYtEc6; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="scvYtEc6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43cfbd17589so970492f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 22:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776490078; cv=none;
        d=google.com; s=arc-20240605;
        b=ie5k0hom/mqxQqJkV/V1h4xz19C7ytglBsfifaOR5uTWVuFH2Um9/KycHnB7nACEwS
         X3tnQc7e+4/a9NaaIl43xC41bXdW+wxcWEW6eR6Rsmp687sEu4/eOA+FpI1UlIgtIYM1
         HggBwq7MU/RBUSlL8dm8wrEIGwk1Emh0GdRyAOWQt6ArEUcAoiBGrwLiuQ35zCd1QvzF
         bTI/XU27RQ4vHU9I97tBxMIrg83WjXWsPCe/9myUQLMpjsgP5vizbDVimlIP1cmqJa0W
         1Zx7dhcDYFGLSTVopbmF7SRr5I71VqbguXFAeEkx0Cy/GzrBsn1xB0klfqmZQyKcJLzO
         d9Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYAGoFNrWRDm2eh1Ti+BKPYiyqx9cfyfl+NYb+/2tDg=;
        fh=HCiT5RHjfQ7d/n7/y1AU7YeURYGivKaiVdXljWlJs/w=;
        b=dqoj/WeQWDBTJSmDY1G2chwZ3k11sIganuBKbPC+7iytuMKftGhhRzVEmJn+mboTYd
         6vXWxXO/Xbnb4ACGqbf+8OWLB+tvQpeLroPYkKKVh9ovKUXSHa9CGNA1xsXFxU6FqrSM
         sBPb74LNlc8gFN/cH/wbLO9n/YQwjuurYaEzrToNX0tk3tQ3z5DEuomW82TrxKkzU6iq
         1U0+VvPy/aHJzZIrtHM0u5/k5pHsT507Jev43pb/hnNOA4zPEPAzkZNSo4NY3gE850Lh
         xBwseHhzTEW/TB9gpUvPkrck4siTsawQbctgSE/v/MKW/0zfElAajrwSxmhaa8Ftk6WW
         ludA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776490078; x=1777094878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYAGoFNrWRDm2eh1Ti+BKPYiyqx9cfyfl+NYb+/2tDg=;
        b=scvYtEc6cGyOGhlS/49d6WLC8kmuqe/PIOwcXRsjEPiqQSf61navmHzS+yUDLGUJMY
         GAUntGqBoH1j3VuoNUIBwpkmJHWYMzCiEIeOzvhmDJsAr9K2SPe5fYRkeGhlUg1Sve0U
         m4CZR4DrZHvB+simY2tW5cNCGhhhuuM49KkAdA4WjnWtfAhaSW4nNpnvngaL+10zTUmo
         3BA8BtGkT4buVSHzQw6vLMLh/0raK1RmO/+2lwOSdOcksd2unae0DZ9rkzyzd9RxlJFl
         FFBBcUT7B38WSr2a20dhpdzIL40hocXJjcCp7IfakpfOKbkXiJsfC6ukn5XF2eSyVBOW
         UTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776490078; x=1777094878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SYAGoFNrWRDm2eh1Ti+BKPYiyqx9cfyfl+NYb+/2tDg=;
        b=Rk75SC4km4zb9PV6henkIxHoz0A6MVIj/aR1B1dP9BPbZEbE6zf71ivm9ughsT44U5
         U9hta4FESquS3fSLFlJUKSYqxuhoE84+3iqMMO6E+KxuLCYSgyCI6DLYggd6o5dxbzJO
         zDSrWWEDjeASlEW31mQwrHue5pOGUOlMCKTDBwVdNntVMEbvtOc7JNAO3jAZb9C07gox
         vFZQz/W3auDpYpGlxpgVJZ3zDFXyNsV+jjnAdC1W2UGTzAK/KgSrTdfFTPgQfQl9ZYiq
         K8bScyuHOHIWCwenrrN48iMv1vyz7GLs8yC3X87NWCOD2vRv6FegQugVTp+hCGT8sJwU
         dlrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TjfX/zlzMcAGNFpm+M/8a1Oe44EUB+rjZlYZ5w0/N1ClMZEevYltP3dy5SHpzb2xXWlkyYbac88k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTp0jgZrE7gl1nbSSjqrxR9Etns0QoexaiI1F7Yl03JZqnj3YK
	cYmtbCCgLYnyxCWmQfc00cuIKP/c6L6vOpH2uWYyqY6ggEb5RIuxuk5/1+r/oLkmyRwjJQaqueP
	TLusMLmUaGagKFJSn61r8Os+YjjgiB6M=
X-Gm-Gg: AeBDiesJSKiJGs19L9vHxGTiIMuRKdSzUnSnnrOYsJO+xbPb/1LvdGbkHDS0ni+fhPv
	Ys5WWeFLFsW23a4pX0nDesQadoGNtOCFvTOHQD/ALewIKQWBErXZn4yFKPXdj9youxh7s5Rd49X
	zD/EuwySOw6BthYBD7y14ibapbUAaTp8MmrwEnIQr54wujG9Z5PNGlbupzrC3aH0Fg2OoO9jAK0
	bhIjIShz/pj699B8O5jSEzO2KQx43N16YbsFZF5aqhkV+aNUBWL0o1c5h8TKn27F9FeSQfl+xFC
	HCiNcVkAdquvZKDfzQ==
X-Received: by 2002:adf:fcc9:0:b0:43f:e4f1:bd9b with SMTP id
 ffacd0b85a97d-43fe4f1bdf7mr4968568f8f.30.1776490078315; Fri, 17 Apr 2026
 22:27:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260418000635.17499-1-sef1548@gmail.com> <aeMQ36jFnCKmCSyA@casper.infradead.org>
In-Reply-To: <aeMQ36jFnCKmCSyA@casper.infradead.org>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 18 Apr 2026 13:27:47 +0800
X-Gm-Features: AQROBzAPUOixr-L6lL7fb9JgEK14SirwWCxHLnfBUgOConJMytgXqwkp5e8GdOo
Message-ID: <CABZAGREDHwsXMm65_WxEn=v-zTv7_eVqQzQeCRqU2Gyc0aTETQ@mail.gmail.com>
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

Matthew Wilcox <willy@infradead.org> =E6=96=BC 2026=E5=B9=B44=E6=9C=8818=E6=
=97=A5=E9=80=B1=E5=85=AD =E4=B8=8B=E5=8D=881:04=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > - Add "Overview" section explaining the slab allocator's role and purpo=
se
> > - Document the three main slab allocator implementations (SLAB, SLUB, S=
LOB)
>
> Umm.
>
> commit 6630e950d532
> Author: Vlastimil Babka <vbabka@kernel.org>
> Date:   Tue Feb 28 15:38:07 2023 +0100
>
>     mm/slob: remove slob.c
>
> commit 16a1d968358a
> Author: Vlastimil Babka <vbabka@kernel.org>
> Date:   Mon Oct 2 20:43:43 2023 +0200
>
>     mm/slab: remove mm/slab.c and slab_def.h
>
> Care to revise?
>
Hi Matthew Wilcox

Thanks for pointing this out. You are absolutely right=E2=80=94I overlooked
the fact that SLAB and SLOB have been removed from the kernel.
I will remove those sections and ensure the documentation focuses on
SLUB for the v2 submission. Thanks for the correction.

> > - Highlight SLUB as the default allocator on modern systems
> > - Add "SLUB Allocator" subsection with detailed information:
> > - Explain SLUB's design goals and advantages over legacy SLAB
> > - Document its focus on simplification and performance
> > - Note support for both uniprocessor and SMP systems
> >
> > Signed-off-by: Nick Huang <sef1548@gmail.com>
> > ---
> >  Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
> > index 2bcc58ada302..2d1d093afb7b 100644
> > --- a/Documentation/mm/slab.rst
> > +++ b/Documentation/mm/slab.rst
> > @@ -4,6 +4,32 @@
> >  Slab Allocation
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > +Overview
> > +=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The slab allocator is responsible for efficient allocation and reuse o=
f
> > +small kernel objects. It reduces internal fragmentation and improves
> > +performance by caching frequently used objects.
> > +
> > +The Linux kernel provides multiple slab allocator implementations,
> > +including SLAB, SLUB, and SLOB. Among these, SLUB is the default
> > +allocator on most modern systems.
> > +
> > +SLUB Allocator
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +Overview
> > +--------
> > +
> > +SLUB is a slab allocator designed to replace the legacy SLAB allocator
> > +(mm/slab.c). It addresses the complexity, scalability limitations, and
> > +memory overhead of the SLAB implementation.
> > +
> > +The primary goal of SLUB is to simplify slab allocation while improvin=
g
> > +performance on both uniprocessor (UP) and symmetric multiprocessing (S=
MP)
> > +systems.
> > +
> > +
> >  Functions and structures
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> >
> > --
> > 2.43.0
> >
> >

--=20
Regards,
Nick Huang
