Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35E6493D33
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791817760; cv=pass; b=GcY4hVimhPiR3dx+m4OY3q6RpcZ1QmNLW183gXY0qhlZebJA2AjFUW9gjn9stB5YkwSvvCVWmZmUTpUAKg3tc1HU/2g9tTP7GAFLkx/Mtwiy3MopfJVnJtF1X4Sb1Hp6NjfKIKbwXaQBg84Kmu2hSbOdEuIo+6oD+6H1NDsOfYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791817760; c=relaxed/simple;
	bh=9p0AqvEckCKKmioWpbl9ub4ZG0q2KitJ6iNWSAzwTY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Blk0dKCEuKNBLyXEWawtaYSRUWh71UtyR8C6kGq+7Fxj6LCrtE1nGPZhoK4FvO7GXWmUCGucjj9TazvsbHC2RvdCjRmLkLyjuywUPo/nwj36yVoNvv3xaBi/XsMQrJs1mfxZzk4CCmKoeetYJpkihEIk6+I6MHM2rc5iY0zkyIo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZIS1tmj8; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZIS1tmj8"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so3152953eec.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 08:09:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791817758; cv=none;
        d=google.com; s=arc-20260327;
        b=aDGlAmy/l+7wYE+SzhL7maWGJdi6esGEu2Trz+GoBqmg98sca6Ycz0djNNGZ4Esqpk
         UGVxVmphLRQEnmF/HfTr3G9rF0bHRYQptj5LRSxwTstABv8n6Ci4vBnf6IHavq2yFf6H
         sNnFXAm9QvF2MkukhDG0CFalkb23KkOT+psXRIu/l62UtgWlS4gQADBmeLU2b3vXc5pm
         2s0yDlRVPzc/iy5K/mjSEU2Z/QocqBKzEgjWHIki0G9TtvO6Wg2spa9FZzskyNXgFmdR
         XuiiS5Bj4LdS7MyM0Bi8PebQpIOp+Xa3485L9w6qH2yDlM2QH/7crLV6lX5+mzzNm39U
         15LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        fh=6NJI78vbFLv7w33za81dqT7cMY9iWf+G//FHHmEcSXQ=;
        b=BBtp7w3CQEQ8A0q4D2QM1c9tKMfrybtDaOPxQw//IZ6kN2jwRKYekyvFJ6dK4GreEc
         4AEzWw+OiILQbyL3y3ylRt/mNxF5CwUzb2NpU0kiAVEiLYTdGBwBjCTiytOioJPkT9Ap
         KzGipRiZ5ZamThZPzOMZ0WpnyF8YMJqa54xCyGwDjvk3ACFiLaRQBm6tLJfwlrrGkD3K
         guAniuZBFH3wRIMePo81QdASdvEu1vVkbY9rYeZwV7/EC/a/MhVBIpLNxVryrrirYE2/
         mE/Zs7V5OIgwf+Z4TSne5itjpKbsH3XiiHVvLHkZmFOFOn0qT5DmR+cWYw8SbmCi77GY
         9U6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791817758; x=1792422558; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        b=ZIS1tmj8d9Smoiwouq49STj1YC5UVF8cmcBHhPuZ8MaW7jtVjQqGvJaVAEL3hg/6Ry
         ik8j9QpoT0+J/TmfYPoU+dwb886E3vOKkowiFppbJuT/bcjNll+UaPKioTVj3Hw1Vc6L
         pBnbjN5tIZQXiKLa6/c2mysT18xuEOjHZh9XEP/gNVT/E+Pdc5ym+m97arvF/2rmq2Sw
         sv5CTsTDBz127Vjz33Tu8X/ExpXIM1+bKqruboQOTwm2aLjLrl1oFxbMRFKkolRu9d3k
         2NfpOS24POgj9njAYf62lq5K/rqotRDGe6bgWL34YU7pZKX2pud+5MkTrIkmAV8qoQq0
         xYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791817758; x=1792422558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhIDuBLHbJsBmFiUrtUWW1GlGqZnHdg0lmt6NThkZTI=;
        b=h1Xu7Xl4/yYLdU9VUw8c14041kIRKdksAvIh+0Q4wXZC2Ni1+RNnWugYou9OgZODhy
         N33dB/fhnDJd5q5Rzzps+ewtb4/NcovPbasSeS+4vOUZQ3rhQxex2ebA8l0GuKXrx+yU
         G5CyPaOVIpos22kweSKUANbRpI4Pnx/a63wwdrAEyVrAmNycZM0eUvWmkEtY76gX/euz
         NCqZz6u123Ye4tuHgFBY/0S4FfsjT15xjmB/6Y+seb/UOsRa22pILceFkSzg70L4R3wK
         h4XXExTSO5KOmVLpIlAswpL7uMWKkWb0pCWbYdN2ktssL5jEqa8E3F4WHe4ka6JnDYUO
         TD9w==
X-Forwarded-Encrypted: i=1; AKwUvBzF3CoAA6DlZR+NSbhnSRRpDnTXSvCLpN7VKUb41X9vPKzQFr/3cKSgbXJiS6YeXaDRFDYIQvpZqhc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4AV+tZ7LJWPJU0YBAByv6PcU3rq4KIsyLLW2BXAuv9iGIBXkt
	xld/nBWKQKw0/O+sUAH4ebm0WjUoMWZE62tywGxbMP2sR6ggCKKGNvYpjbLD0reijuwsgHW1FBg
	LjJLLi5DWmwqoivy/bwLq+xEerHMbs845XvKH
X-Gm-Gg: AYBFou3JKuN7qm50ULqJhFuJqsnpih8o6tIWmwS/uFoIM1SMMqkRe0zogWmuv1Dsoxx
	Kkh5cwMW01AzARmYOS+4NFg0JNdfk4WU0Fru88bElzxBpikU+T1ZCBqE9TT2E8WnxCHEiP2/uPf
	13l5GQycMBfLdWuw/6yp18/8FfVFhlCs+QIu5WieHqmmiFEnaRVgkkic+iIjjYnDPxdRzjmIYGj
	2GrouL7VCBdlMwHhXHpGp79rByv6Tpz/UQz08TOQMPMPyhqU06ggDBhgbYU83prfoIYANu9Ce2/
	tbG+wGL8I/JvFb4gXBsZv8J0zVfazIM/qqgOD1n+7uYcJsPvr/JYqHzh
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id
 98e67ed59e1d1-3ab3a94ff23mr7233060a91.18.1791817370093; Mon, 12 Oct 2026
 08:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <aszzcpW6fJWGcQCZ@google.com>
In-Reply-To: <aszzcpW6fJWGcQCZ@google.com>
From: Luigi Rizzo <rizzo.unipi@gmail.com>
Date: Mon, 12 Oct 2026 17:02:38 +0200
X-Gm-Features: AclHuK_RuYPmfWCEef8B345PmPnIk-csUIxQogHwwsigc85_8kdg-6GHSEnG77s
Message-ID: <CA+hQ2+gMGJH7J0yAx0ooTpWYfC50FnDXvCRRwRaJ_8bJ4b=QDQ@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Mostafa Saleh <smostafa@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <lrizzo@google.com>, Joerg Roedel <joro@8bytes.org>, 
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

On Mon, Oct 12, 2026 at 4:49=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> On Mon, Oct 12, 2026 at 03:51:39PM +0200, David Hildenbrand (Arm) wrote:
> > On 10/3/26 23:22, Luigi Rizzo wrote:
> > > Here is a subsystem called DMA_PMD on which I would like feedback on
> > > architecture, possible enhancements, or kernel components that could =
be
> > > reused to avoid duplication.
> >
> > Here is a feedback to a subsystem called DMA_PMD ;)
> >
> > Why is basing this on PMDs (and embedding it in the name) the right app=
roach?
> >
> > On architctures with large PMDs (512 MiB on arm64 with 64k), would we r=
eally
> > want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) th=
at might
> > possibly also have TLB benefits (cont-pte)?
>
> +1 I raised the same point in the LPC talk.

See my other reply, he code makes it clear that the target is
reasonably-sized chunks (2M being the obvious choice with 4K PTE/2M PMD,
for other cases we need hw support, and it is relatively simple to
decouple page size and chunk size.

> AFAIK, this series tries to solve both IOTLB pressure and CoCo bouncing
> at the same time which might be too strict; as for CoCo there is no
> actual IOMMU, so there is no sizing constraint.
>
> Also to reduce bouncing, I think it is sufficient to use the SWIOTLB
> instead of having a new pool + recycling, the tricky part is how to
> abstract that to client drivers as this would be needed beyond SKB.

I did have another series to build buffers out of the swiotlb pool
https://lore.kernel.org/all/20260824152932.1583506-1-lrizzo@google.com/
but I found it does not scale well under pressure: the existing swiotlb
pools use linear search to find an empty region of suitable size,
linear scanning when one pool is full, which quickly degrades to
O(N) on each allocation.
I had some other (not posted) changes to build a buddy allocator
on top of the pool (so searching for a slot becomes O(1)) and
to spread the search order when a pool is full (avoiding O(N)
locking conflicts), but there is a bit of extra overhead in the
light-load case. Also it felt like reimplementing the wheel.

Overall I think DMA_[NOT_JUST_]PMD is cleaner and superior.

cheers
luigi
> Thanks,
> Mostafa
>
> >
> > --
> > Cheers,
> >
> > David
> >



--=20
-----------------------------------------
Luigi RIZZO, rizzo.unipi@gmail.com
 http://www.iet.unipi.it/~luigi/
 Mobile   +39-338-6809875
-----------------------------------------
