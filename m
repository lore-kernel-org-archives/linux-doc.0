Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780722EB5B7
	for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 16:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041735; cv=none; b=TfOzxFq8MGH8lPJXA/wiyUNFagv98V3Yjjsmdefa5/tygGTn32jszjXq6HjFXEub/rEdvF95oGbXw5vQbFid9c0rZD/+d+75zxXNfKBjqpzvpm2ic7Z3mzb2135Uzsa9RBvAYWc6c98DrZwDUzbQ2Aa//KScz05EIHwTkfKizWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041735; c=relaxed/simple;
	bh=ckwNK5l6kNEQi0dMFT1BhLSPph3IS47PHdxbRsKbg2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PseDfAchG0Q/L6E4vDY5WEuvem0tD3OjydJ5nN8nryCprU18hsTHM/AZhWYrgr7d8JhSYMhnmgrZIZdDNa/o60ISyLmOBSuAMNPhz2jacM+dOW6AW4WHeALrC35NsCczfocRcu1cTpwM/BwnWhf6ScspZZuSFyt9Jkh0kQhectg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YBPSYhfY; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YBPSYhfY"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fb1be9ba89so95626d6.2
        for <linux-doc@vger.kernel.org>; Fri, 27 Jun 2025 09:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751041731; x=1751646531; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pwe6yBI0hTTSV4QKO/x65G0lF6NWazoC/YzcyBgyfJc=;
        b=YBPSYhfYCSvcvlqkTTWKgBuoIRQJExKgNMxyXP8XSXfLKNKeWAiaMB3hwazPeve2l0
         At507yVCtoH0Av1+Xq52NBbz5F98TC6dsmne30HfzRWpovfg9W1pvJDhT1H51QmR2d0c
         Qb6YaY+VL6kXfjeqlBt3AmrhEt1cO+g7a86A0ZJ5ae+HQqdxZaPnt8a5jlPrcBxPB4YW
         CagJZHFOz9cQtMfCfBJ7putglkR/QChte4bzPWOHUFSfTwXV0plMUZdnb/ZfADtI5FFC
         aZtwU7E1KhdXW2kvEcRaC4o61dtFVW5Le/GIT4Vys8+U4t4ug3DQmlJ/EqMe2jBSiEy0
         nCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041731; x=1751646531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pwe6yBI0hTTSV4QKO/x65G0lF6NWazoC/YzcyBgyfJc=;
        b=esMRp3BR41xtJg0xVSuiY4sDOPurdu165YeXUEpOW9JTgw9ixTZ0gBWa+n7zXbrZAM
         mp8UPXGorPiuOwzNe9SctT5ZNDUhd7G23mDsEQLhE2ooEbk3XsJ8pSr0FgPyHnbceIqq
         9wUozrjooPfN2NdapkdWYfZ2RU/bjbveEevZT1c89ftycnFHdawJeLae5FUU4tiRKDk6
         vqS3Gdx+GAVt+N3XTODt8aMHGKH6/yW705i+JHNSBMpaqZoPgycxJmEMU4lmsZuZMEgR
         bZMBL9lbq8j6pLiHvRGc/RcBEIRdKFo7tsUbl04mu2sGAEaFG4xaDqNUBJB+Cn/+nq6y
         yLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3/alv61orqcnfmLeImivm+NphN41zpfdSUgRQsHX36MbeSY1E0wCrJGdAkmmIdCnwMtQwa/ES2Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNdg+am+IVWd5oieYKnaa3ss4hmkhMvP54iQsLyNL/QOSnoxfH
	fsCZnH4xAFKfjShhiY5mY42iaEC90BlXUv2mVgWCtclAsFust3v1WgiW4ZxTUDMf5zNVOfpaznK
	Tr4Nq087/EaiiB68jUbBPP7M891LE2x4MByGXiwFA
X-Gm-Gg: ASbGnctqnP3g1IUceE4TzXdprr8SrZE54CPlEUcNvjs56Pj70ULaica3e/vPfdFvS0w
	t8JwP2w+v+MKfS6fGD0Yoq/dXNV9SEqvyjTndBzihX2+3IQa/3vn3Hud5f9rw1CnrFwivGGs26h
	a7n0H3E2ADJFu1x+I3gqguPwsp/geVibMvqGGW3Ly+eGs3D/eSmCNUKia5zPfaHDoUUjYDET+9F
	Q==
X-Google-Smtp-Source: AGHT+IEaFjJbudXPZvs4+gz+Ul1aN+IO1A0S+wtT0rUBrPe4/pZbkYPC1YJ6B1u6KB5gj2C6Oj3GAR3BNtAmvLY3bsQ=
X-Received: by 2002:ad4:5c6b:0:b0:6fb:33f7:5f34 with SMTP id
 6a1803df08f44-70002ee7d52mr61421106d6.43.1751041731049; Fri, 27 Jun 2025
 09:28:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750854543.git.leon@kernel.org> <cabe5b75fe1201baa6ecd209546c1f0913fc02ef.1750854543.git.leon@kernel.org>
 <CAG_fn=XWP-rpV-D2nV-a3wMbzqLn2T-43tyGnoS2AhVGU8oZMw@mail.gmail.com> <20250626184504.GK17401@unreal>
In-Reply-To: <20250626184504.GK17401@unreal>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 18:28:14 +0200
X-Gm-Features: Ac12FXzk502TgF39Kdk9rDaSo7SztNg9o8ROEHR27kqxNaOw7yX3TSWKD6zOmLM
Message-ID: <CAG_fn=WeK8q2g0bRna+fFx+ks4HbfoG3Tnw8PpSdmfdH=3+S=A@mail.gmail.com>
Subject: Re: [PATCH 5/8] kmsan: convert kmsan_handle_dma to use physical addresses
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Christoph Hellwig <hch@lst.de>, 
	Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	iommu@lists.linux.dev, virtualization@lists.linux.dev, 
	kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:45=E2=80=AFPM Leon Romanovsky <leon@kernel.org> w=
rote:
>
> On Thu, Jun 26, 2025 at 07:43:06PM +0200, Alexander Potapenko wrote:
> > On Wed, Jun 25, 2025 at 3:19=E2=80=AFPM Leon Romanovsky <leon@kernel.or=
g> wrote:
> > >
> > > From: Leon Romanovsky <leonro@nvidia.com>
Acked-by: Alexander Potapenko <glider@google.com>

> >
> > Hi Leon,
> >
> > >
> > > Convert the KMSAN DMA handling function from page-based to physical
> > > address-based interface.
> > >
> > > The refactoring renames kmsan_handle_dma() parameters from accepting
> > > (struct page *page, size_t offset, size_t size) to (phys_addr_t phys,
> > > size_t size).
> >
> > Could you please elaborate a bit why this is needed? Are you fixing
> > some particular issue?
>
> It is soft of the fix and improvement at the same time.
> Improvement:
> It allows direct call to kmsan_handle_dma() without need
> to convert from phys_addr_t to struct page for newly introduced
> dma_map_phys() routine.
>
> Fix:
> It prevents us from executing kmsan for addresses that don't have struct =
page
> (for example PCI_P2PDMA_MAP_THRU_HOST_BRIDGE pages), which we are doing
> with original code.
>
> dma_map_sg_attrs()
>  -> __dma_map_sg_attrs()
>   -> dma_direct_map_sg()
>    -> PCI_P2PDMA_MAP_THRU_HOST_BRIDGE and nents > 0
>     -> kmsan_handle_dma_sg();
>      -> kmsan_handle_dma(g_page(item) <---- this is "fake" page.
>
> We are trying to build DMA API that doesn't require struct pages.

Thanks for clarifying that!

> > KMSAN only works on 64-bit systems, do we actually have highmem on any =
of these?
>
> I don't know, but the original code had this check:
>   344         if (PageHighMem(page))
>   345                 return;
>
> Thanks

Ouch, I overlooked that, sorry!

I spent a while trying to understand where this code originated from,
and found the following discussion:
https://lore.kernel.org/all/20200327170647.GA22758@lst.de/

It's still unclear to me whether we actually need this check, because
with my config it doesn't produce any code.
But I think this shouldn't be blocking your patch, I'd rather make a
follow-up fix.
