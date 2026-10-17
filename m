Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCA13B7767
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257127; cv=pass; b=NWsNWOYsuEVLQnFnBwM939Lw3fpVC91ubZJ/b3Unj8KAGdR6+zl0t3W91ONCeillcu5mheZbUNO3KjTIWdTiqY8ve5Sii4CG7gFAnbBsznb5SWND0An3OUukY5XtoDFg5gVuqSFA0JiOVwYW8MEWgXOxMqWuFOHp3tpZ0TBWQuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257127; c=relaxed/simple;
	bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf3IIQ2irDVm3RJpWgeBLdZACO0g3lqDDzwXSNAIzPXGSm70SdkLvZracX1Eet1UYH6MFNSICRat0D8nqyi3Cm5Zo1W82+Ie+VmVs/RRhJPaJZGlndr0mg2bT298KLNMqllP+zcgbUG38SrCE72oz1FGPmo3UlxXAWDnJ4qc/N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MLWWHBXQ; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MLWWHBXQ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8623790f8so38905ad.0
        for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 10:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257126; cv=none;
        d=google.com; s=arc-20260327;
        b=YDt45WJxc4qEPzg3dDkvk2TPZX9vaosziva0+j8SBktJpXFrTxwyPVHt55sntCNWJ5
         sbpjum6PMBack2RHq2xzk5y/N4hGeGGR23Z/Y2bVue73m1qGED1q7kBl5o0sNCUg9OIz
         6MUFUwH6wx+B6W74noiP2A+gZGsW40uOW5MZILhCWKPvrBjc+7RfMn2yuoTVoQVbv/vQ
         tWwLuhDXircowasxAzw05DwDViCRSTkbwUT5ctnrJdyllOOvviVcRVDTXu6VM96IQAug
         +bVgHXMftpVUEMZ/7jCFZL8huT1KxiGdDn3vCYML+hVtXj+pGmDcI/TVDis6rGuDzHuK
         qYFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        fh=2QEVX0vppzRtJ5QoMN5kKGI6apcx/bj2lGeWzGBAbQE=;
        b=KE5+bOrIRZidh8099TEco9MNOQeZUK5LGk7eX+0KmLU8nI/I9Z0/14h5neF/zxRn7r
         oIo7E7liDXEfr0lawvL+iVV6kDdPnLLhd6ZJVOG7pcmNJVOL0UYEWEVelYESyVt/gHo2
         +/fsPeAXFELCpA9sb1TjnjGR4cXZsoC679Ter5Kiwr0YgX/v1PXi65DNve7Inz6iRn73
         z2Q4BTYyCrHIMEoKXRO5qYvwlEyXR8QDKW5W2cpwGE/jR5dMSK504cCtjM6n19rlyvGS
         /hsRMtb3YabE+GbAOlLxEPdMl4j9k7JtEQvJN/vtvCRR2MmrQsz05QM5RpA9o8NfySjO
         IOhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792257126; x=1792861926; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=MLWWHBXQq/y8RwIU84GS50PyppI7TkQc6XbV/NDzoY3yGuCiDuq4QBUWs5tAHTwhpN
         QMRdv3VIw/a4fRAF3zmvmDzS7DmLiwK7NhAM3i10FCpVUfr92kia0GQ2l70/ijjOnp27
         p1jtj3BqoNvRPFWjQK6LyTYVsokb+hhfwjI47OT21GRSQmJt62YnP24VmXoXbXKVZ/ls
         hOHWX/OUFxcNyAgahr8COpMSnn/YkkkuOXUAH/UsFdP881sHySIXIrQdM9TRTygPTdR2
         lWaU2+DlgxXyNz9oeHhd+wx3+Z6Bxb+0lk7fcbIVC+8x7eeS34QGVQ542jxGzXR7wsyA
         hXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257126; x=1792861926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=beuVwHeh3vL699vdP6xlGUMVu+oIfdVsvvnD+xHp7RQakD0RL4Y2oJwyc62wKhMFIV
         V3WXWUtOfoLnzK2Enc1zdveW2REFGYpQYS8hoKh6c384jY6TooC1Y0QQldK0Tbp39T8A
         UFeOgPMjd6Vna2A7Qi+sTLqYyuH7iLHiS6ddfLYgZ1+VRyTDs+ZBVk4L0oWk/bUtQUOb
         Nk8JvzzneAnXVH3tY7AK2go7yCuF6RVK1XQ7fb2zz3wa0KmqYFsjD/3oubbzyny6WYZu
         M8VO6KXBwhIITsfgEYK6BevtTLOqQAy8vptAXVIc/gq/frXplnJnh4ZeaXq4iwOg7lDy
         v5nA==
X-Forwarded-Encrypted: i=1; AKwUvBzQnZ64QnQjuWqHh4VUXro2KKhlxnQP1vMJfjc7r/ox8NkrDFHK975IpPxSCmbQOg1e1Kg5hRHiL10=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9+dVG+1V9E24bSa4lzxEVmwFIJvFrNhioi5hNuUCwuMZbukV0
	6mKsHEEorb2+aT4/MR+pZNz+trvs6sANCtjbXNVLnPmh9dH85nhILOVH/BtwPBxBtuHhJyam+yf
	NL8XQ5T5BGIlDfWqYIFzhkZbCakolmwphnTY+76x3
X-Gm-Gg: AYBFou2USXBtrrzdst/gl4JShAqdEOINXDZt5FtNp44uq2aJyWpllFpIN/e3h2SOxvr
	CqUwOthZsK31/d+QOTp2CZAjmpRIFx5ulDYo2nNEYENB4Zi9L+7hZ2FFH56kY7Ospq9aNtQaxyG
	sApZsEl+i8UpSFkyajZGmQOsOkl9TsRN4ZWt4yCtlQwxNtV6Ppfje9YHojzkC2B5iV8psV18Mxj
	qGzHAQLTJaevKgQ97w3jTfWT+mCOeIu/dcxECb3JwVcBKAKTWXKcl18ADY8YHVV75cgyoFFK7qD
	t86Bh8GEqv+2adj6VVz9NKdUAZbBIdaj21/IHC0H8Ni7bn0n9GdwWCkj
X-Received: by 2002:a17:903:144e:b0:2e3:981:4cc4 with SMTP id
 d9443c01a7336-2e9b3252cdbmr3330175ad.9.1792257125060; Sat, 17 Oct 2026
 10:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com> <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
In-Reply-To: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Sat, 17 Oct 2026 19:11:28 +0200
X-Gm-Features: AclHuK8222c3YwWa2EndazmJS8Umg9HTADwML-hsKq06OdSigMokkN9A-iBy5wE
Message-ID: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 9:44=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/12/26 16:45, Luigi Rizzo wrote:
> > On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 10/3/26 23:22, Luigi Rizzo wrote:
> >>> Here is a subsystem called DMA_PMD on which I would like feedback on
> >>> architecture, possible enhancements, or kernel components that could =
be
> >>> reused to avoid duplication.
> >>
> >> Here is a feedback to a subsystem called DMA_PMD ;)
> >>
> >> Why is basing this on PMDs (and embedding it in the name) the right ap=
proach?
> >>
> >> On architctures with large PMDs (512 MiB on arm64 with 64k), would we =
really
> >> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) t=
hat might
> >> possibly also have TLB benefits (cont-pte)?
> >
> > I had to call it something... an earlier prototype used the name IOMMU_=
2M,
> > but I didn't want to suggest that the design was limited to 2M (it is n=
ot).
> >
> > Aside from the name, the _current_ prototype restricts to 2M allocation=
s,
> > exactly because too large units are expensive and wasteful.
> >
> > In the code, decoupling the allocation size from the PMD size is trivia=
l.
>
> Yeah, we should do that.
>
> We should probably just find a way to describe that this is a POOL that f=
ocuses
> on physical contiguity in some configured granularity.

Before embarking in a global renaming, I would like to get opinions on
acceptable alternative names (possibly with a short prefix usable for
identifiers in the code). I could think of the following

DMA_PMAP (for PreMapped or Persistent Mapped)
or, ahemm...
DMA_PISA (Pooled IOMMU Superpage Allocator)
both using dmap_ for internal name prefixes

Other suggestions ?

cheers
luigi
