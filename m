Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0702253B0
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763926228; cv=none; b=YMpwagHgSBHpLF/OZTKK88XjdBzLk85mBR4Oa7N3ZDtr0RGqANfWKb8OnVR2XWbi9Vi6Va7P+VvoQtGkyOq3VESyUag1/MU/OXVloXEPwqiXT8YzgXt+RuL0pv2zPD9CAPNLy2jU9Q1Pdho3vES6JTjBBu+fXR9FF+t2XtIjdRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763926228; c=relaxed/simple;
	bh=0DI7DlauJNt32lri3m7Vr6BUkI5ZqR7Pk3QrFXxr4Ds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OwAjeFa6X0a+7niFzE0olLNQicgUjToygCymmbutwCy8eJAl3vCsJVL4bgmWXWAglFH1LvWuyLtZGN2r0MXdM6rkWLujRPOO8q+beGfeFDWGNnoEdqbi+UXZfBbcFFK6ocwwnaGmAuFireJ0mA00fsx//uvO6b3JoCuiBA+lt1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eKzuao9r; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eKzuao9r"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso5109946a12.1
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763926224; x=1764531024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XzqHK/TIOOgnA9zIhGUtOJHBTL40HX8egZzA4W6eWFI=;
        b=eKzuao9rSqLDtF/ggrq12zSjkuQNSDd9g5YpTwb6PoWZvQNRo+g7bEQUUhPYemNJu3
         nMw55A2x/DSoY8zVeOH0PDL+uYcJ5YBvH8nEJPSMc9vqYuYti3PezHtYog9ZbOWLy9fs
         oAXYhm+Fz55lQg76EKAMIa/8LVAxHyrngbmhBsUExs1fYWGDTGMEKCzTpCmu/k1peqpY
         SkrhaLr8ovUi5GoQuYQfrwChqJBahBLjsGltC8Lzg1InFja5jJfzxiQ/lVkIJJTUgXrf
         RQGkALdiJvOvzXuxajCFG5ZAn0SR0ukS12ErRx+9ZHeQvw/QSRG/N94JJCDnrkUCk/kw
         qUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763926224; x=1764531024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XzqHK/TIOOgnA9zIhGUtOJHBTL40HX8egZzA4W6eWFI=;
        b=ITyFyEoKIiqFeGJzE2jduYWGVz+03+toyB82NQ+I2ULh1neoaLHiAIIvyuHmwpNHVL
         XKZguLNUftgO6eHi/yUzqGzTUq1GgMiDA4S14xIzYLuHXsuk49FJ4Mq5fVH+ykdVggsP
         pzWYaspTc8BlNu2zRGXTu6cOnZTzz6Jt4/3BYI5NN/NrIgoOrZ66ThZPedtTeZNwVOxJ
         hPX1h5/GmpmCoaiwEXZ/CSy5vO51b1ptXPs4OedleRLwrjxNgowS3q0JF/t8zGI8ICgu
         aUpd+BC0FE40EJxfWzUV8O2WwpWSDO4F564X0wHn7RReOJnnoTiqcTx+eCPMk5A/IeI2
         RpMw==
X-Forwarded-Encrypted: i=1; AJvYcCUsmh9R4feH96AUTRWzCPqKY/BXfQbeWWjWAHLWqKatOvMSUVKCgNTF9vdA8G7Y6yz3Y/09AsHqozY=@vger.kernel.org
X-Gm-Message-State: AOJu0YytuZ7x4axOlp8UsGzKZHe0IBjuNyaba+sMchgL57y3rR3ozzjj
	1Fi9U7hz6vVtuD03z7nnsTfx1+SMYEqcPrtsXrvPXJq+DtFdZmSxlrfXCa8foLAGOppPmg3NTrW
	v1gJajt4JTIgVtR+E05Qbz+IczX+lmFxBmMPCZuenBQ==
X-Gm-Gg: ASbGncvoV8TnnNXNH/vBvm908vQNeK7Og9IK07BxhszHYyHP1xVOPFXA2cB2CmIvXcu
	L4sIcadgYQh4ZLwyF+o1ebnie0GP8ragADhfMG5EIYRZv8Qu9MGNEofy5u+jGYArYw35j1PziH4
	kwdxOlhXIw5OEcknUZ5NDO1ti8rEGiMuey1u0JL+eOavV/n65q0MRIcprxJfez2EWVDW3l+M4Le
	K8kiPtgcHlhmS4rJGAR7Cgp+NkignoA6zfe2q2BmOvAXJ7pGNvWQXYljIDjl8ViRRUj
X-Google-Smtp-Source: AGHT+IE05jz80rZyj75VVfkojSuXeLlQ8FesBIh1qUPzdQMfW1RSq+XVJJpyUf5jF0hPWhI5fJ55dpas+SZJguxrA/U=
X-Received: by 2002:a05:6402:27c8:b0:634:b7a2:3eaf with SMTP id
 4fb4d7f45d1cf-64554664dd9mr9384496a12.18.1763926223214; Sun, 23 Nov 2025
 11:30:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
 <20251122222351.1059049-9-pasha.tatashin@soleen.com> <aSMwsLstAutayHbC@kernel.org>
In-Reply-To: <aSMwsLstAutayHbC@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 23 Nov 2025 14:29:47 -0500
X-Gm-Features: AWmQ_bk8jtjaq-w2yB5rB_UsOYzOhWiPvf-U2Ch5k2I-jXXb8CYrf-XuoPC_iX0
Message-ID: <CA+CK2bC6_Ls0AthtWHmFH7hc-ER1uaG11Ques0=zVyozP-gyOA@mail.gmail.com>
Subject: Re: [PATCH v7 08/22] docs: add luo documentation
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 23, 2025 at 11:05=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Sat, Nov 22, 2025 at 05:23:35PM -0500, Pasha Tatashin wrote:
> > Add the documentation files for the Live Update Orchestrator
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
>
> > +Public API
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +.. kernel-doc:: include/linux/liveupdate.h
> > +
> > +.. kernel-doc:: include/linux/kho/abi/luo.h
>
> Please add
>
>    :functions:
>
> here, otherwise "DOC: Live Update Orchestrator ABI" is repeated here as
> well in the generated html.

Done, thanks!

>
> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>
> --
> Sincerely yours,
> Mike.
