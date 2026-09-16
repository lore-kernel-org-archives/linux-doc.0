Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB606456292
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558281; cv=pass; b=kAu8naCH4+BnhmHFSXL1g+tyO1d2DbLqKXXqLxL4Ufat0wDpI1mkXKTXiIIC0yEEiBIrAaF0h4ySQOVJttouW5L/KTan+508VwX2VYwC/R9V+Y+t0uw9JAzXdtACoz34CRaC5sRDhReLKWLYlLnyl75FBO69Hwgi+iOS96ewebo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558281; c=relaxed/simple;
	bh=bMi/57l5e4/B5824QvO3Gsn3zrVyAC4k+Riojp91Lao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG9+amLLqnKqlt0t3NPHP/Dau/bAZUQaNLmPGMmHMj4ofW7jRENaW2VhLiAzIeS0xf80D3EQSFePGtWApwR8qPGQ25fFkUmWZZFS0QykdwZZXMRGPaiV6lO4EYClj4/4m3HXVouuX6O1lWs3AqVPpNlv5tQPDz0tprDfdvhKOjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfWNiCPH; arc=pass smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfWNiCPH"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e512ee9so282075e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 04:31:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789558267; cv=none;
        d=google.com; s=arc-20260327;
        b=QBI2avAj2inQhDpLH59ZcpQjsaIx+O+P/vdXM5j/1CRXihyqYZx2pvktFGy/FP7ZBI
         G+MzRY+y9lZf5M4hrje+tuRn5UHDF/tM0V1p77OmY3Ec3OEfPw5BvG0z+5vM59z1gizO
         FQRe7Am9VllwqiocEi3kXGQruW0EtCVPqZg8wLBHuq+v3QZhQ2d4dQv+Xxszb/azKWnK
         t5ZQFMBgfiT7P4bZgZl/mKfRInOMDAG6hH57NT+VovTh9kr1AoUYS1GQA63aGeKEG0H/
         1Yefkzwa2F1JMfRaaWeaHzPXKG2mLnmg8myMws1NbXMKCMFuADw2UaCVcKsssIcc3Q8u
         PiRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wvq1oJnpvmtylchDj5OEXjyylI2PEzaco/gNsyhMe7E=;
        fh=2xzAJhNzc53PYSvF+dxCNjS8x1vOs8zSa/pLa4e2RQs=;
        b=Qt8HmNu0u5Wm0n7vu7VnQ8IzITdr7Xs553p1WFQmw1nRMMi+6AOcG/BwqrJfDhSjX8
         V1DnJhcYTOMPK/wwvGv6RauSK4cq21XH2LuXp6aeeJBb+4CiHQjJSWWqeeo4n4JVMa/j
         Vj6R0Nxhm8zNpv8jxOPqPcKle2aSElUybIUeYmlvHYNTqgS2NOmZCFc8qOGnIRWvybpP
         QJ38cyYPQL8GN0FektB7Np1+CqqJU/5HR8M8YwKc9ih9zmrrtQDwPbXT7ki9mU+TImQw
         rMXdh7awhl4P9LcqOU9EG8DTwCKjMrxR1QYapzP6RbsmhqzBA9cvLqfFXtCVJN6OjxQI
         AqvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789558267; x=1790163067; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wvq1oJnpvmtylchDj5OEXjyylI2PEzaco/gNsyhMe7E=;
        b=bfWNiCPHXVfJrz7BMk19Z+3H3aVODpF2Mnti7qNjY1TZ2bl0KBQTukHPK0ffsMq5x2
         +pNwbROfCuzelmkA21epvRuT+JPJkNot13Ldm+VmY1lYyveZg7edSTTUV3WqBSVqUVBL
         uZfwshjDzyoNfGX5wlKac2q/0G8Sq2WKvX0EZHZ0VfE97QpRBUW8CLeuaCNlYJ8nncVe
         snZfTvRDO7xZE79VZ/KWcHr1MP4Q/0x6bf83mHNKIqeo6+asCuRk/bwUfdrE8gNcQrhH
         uJ5UG4lPdSXYNvCrSjuTjyMbWk0m2Jktfpx8H8WLAYJ1gFmi2x/2YSl3j8b3DQ/N8omj
         VvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789558267; x=1790163067;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wvq1oJnpvmtylchDj5OEXjyylI2PEzaco/gNsyhMe7E=;
        b=2ipEUCLgx/EJT8aNI9ucuFDnhEuxHO6RPq5/gyZryVxkQmX2F3R4xRGNOkQyCZ6PUX
         pQo7P9mcrl8K/kQsv5ygNHlDZkuvtDjv/pUzD5JalCMU+VAshUdiGtkpmKIr8+l+/fA5
         bXtoWAEYM46C3PO6iilk1bhDObo2Ywa2fjnii4mSqpiK9Kw1um4Gu9qpKtDctjGoQ1C6
         KWf36PjUsEVwVfGvMZfiDZ5ZGU6H513laO+gL4OxencH+bJUkQW93juEd3bFCT0464qr
         VJnXxZiuymzU7isXAUUjgupWfUOVTATJb7E45ktHTk3Ho0AjTUBftgXbYXlFgTTk4Vtt
         StpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTRgWS1Ucv7a0r9cpxmpVqEij+AGLlCG1OA6mKpnzkXGxb9HxNjRAGSMrQ//ANWkB5oB5SgBnxKEI=@vger.kernel.org
X-Gm-Message-State: AFuF++lFTYRmxPPIdwsZvvwyJiWBViisLXvAaceTnB+eikul5huNtPRU
	jllDN0D4JO2Nrx6fo9uZZa2ez0MRenzfLug5B8GZKaPq6B4CBxGxLvMwLCvey3+OGssdXPCb2rM
	J/2+zuZ8KPA99Gi1j5L+MfuT8tPIoIWI=
X-Gm-Gg: AYBFou1bL4K7EvVLDB5IO1AfTkwwr+HrZz4jdiEaup68NHY3QeeBtVoW6EKW/thgVSO
	J/9z4qek5sVFGjy3elbY1P/5Xzd+N0TkB3L8zLFi7QHpiPP0bGXwy+OWOfy+VFCZFCYRQkBa9Vo
	gUn1tmpht6fywm0eVafHKA0H1bfUEW2UnC+LOHqckfzh8uLCg70x4FTEdy1sItiQ8HkZxF/5lKt
	Br3cBSdVMo4uzOPMtA+utOu8wcITZJ6aJwvzYsvUL70lsp9d7YJjZgEIXA1pC1GiYgW48VRLvzv
	SFnaUDmjXQOIW1YGQfGVu7pFnmTuenOGZILgAYlc68prtkcjAKy9H6xzP+sK1pk3V1aPS3VdeRJ
	y4ZYpbYDoOWF5rF3wApz4HM+P3YXxRzVD89PjrS1La3CXsHVWGDuQpI6/oOu36bAAzH9qLqeaEl
	fFkOI=
X-Received: by 2002:a05:6122:8c5:b0:5c7:a3a3:a4bd with SMTP id
 71dfb90a1353d-5c99abf1d57mr1859441e0c.4.1789558264758; Wed, 16 Sep 2026
 04:31:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910195119.1723-1-silvapfabio@gmail.com> <87ecf0j22b.fsf@trenco.lwn.net>
In-Reply-To: <87ecf0j22b.fsf@trenco.lwn.net>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 08:30:53 -0300
X-Gm-Features: AcwNN1X7AVy50p3Jd_EGp_cZ8OCsnEaXrpECN7y1N40S-37-CMetJCW3v_MOJ5c
Message-ID: <CAMAsx6fOy3o=yC0TAiw63NtS--bbe5sTs2q0qaCeEvh2=Wo0gQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate stable-kernel-rules.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: Fabio Pereira da Silva <silvapfabio@gmail.com>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qui., 10 de set. de 2026 =C3=A0s 16:51, Fabio Pereira da Silva
<silvapfabio@gmail.com> escreveu:
>
> +  - Corrige um problema como um oops, uma travada (hang), corrup=C3=A7=
=C3=A3o de dados,

I suggest using "um travamento (hang)" instead of "uma travada (hang)".
"Travada" is colloquial, while "travamento" is the standard noun and
reads better in technical documentation.

> +As se=C3=A7=C3=B5es abaixo descrevem cada uma das op=C3=A7=C3=B5es em ma=
is detalhes.
> +
> +:ref:`option_1` =C3=A9 **fortemente** preferida, =C3=A9 a mais f=C3=A1ci=
l e mais comum.
> +:ref:`option_2` =C3=A9 voltada principalmente para altera=C3=A7=C3=B5es =
em que o backport
> +n=C3=A3o foi considerado no momento da submiss=C3=A3o. :ref:`option_3` =
=C3=A9 uma alternativa

> +.. _option_1:
> +
> +.. _option_2:
> +
> +.. _option_3:
> +
The labels option_1, option_2 and option_3 (lines 70, 146 and 156) are
already defined in Documentation/process/stable-kernel-rules.rst (lines
65, 138 and 148), and since Sphinx labels are global across the whole
documentation tree rather than local to a file, defining them again here
produces "duplicate label" warnings and the :ref:`option_1`,
:ref:`option_2` and :ref:`option_3` references on lines 55-57 may end up
linking to the English document instead of this translation; they are
not orphans, as those references use them to link to the "Op=C3=A7=C3=A3o 1=
/2/3"
sections, so could you please review them and add the pt_BR_ prefix to
each label (pt_BR_option_1, pt_BR_option_2 and pt_BR_option_3, updating
the three references to match), as other pt_BR documents already do with
pt_BR_describe_changes and pt_BR_Contact, and as the Italian translation
of this same document does with it_option_1?

> +Para que um patch que voc=C3=AA submete para inclus=C3=A3o na mainline s=
eja
> +automaticamente pego para as =C3=A1rvores -stable posteriormente, adicio=
ne esta
> +tag na =C3=A1rea de sign-off::

"Pego" is colloquial in Brazilian Portuguese and sounds out of register
in technical documentation, so I suggest "capturado automaticamente" or
"inclu=C3=ADdo automaticamente" here, which are the usual renderings of
"picked up" in this context; the same applies to "pegar um patch" on
line 49 ("2. Pedir para o time -stable pegar um patch que j=C3=A1 est=C3=A1=
 na
mainline."), where "pedir para o time -stable incluir um patch" reads
better. Neither change affects the line length, so the 80-column limit
is still respected:


Em qui., 10 de set. de 2026 =C3=A0s 17:15, Jonathan Corbet <corbet@lwn.net>=
 escreveu:
>
> Fabio Pereira da Silva <silvapfabio@gmail.com> writes:
>
> > Translate stable-kernel-rules.rst into Brazilian Portuguese and add it
> > to the pt_BR process documentation index.
> >
> > Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
> > ---
> > Changes in v3:
> > - Remove Assisted-by trailer.
>
> Why?
>
> In any case, please slow down and take some time between posts.  Others
> have to keep up with this stuff...
>
> jon
