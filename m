Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793985686;
	b=1XNAZU1d/YZajBqlpnzI/7gV6drRBQPIGaIR2L2VJIlPLBhxbt0zVRD5Us4UaYAkZy3L
	 s0j88qvKLLIJNBTP/HDEQTHNa5hWnDVytQoFqpaTAj54bsPs3Hx5Bb1xZLve8NzyYvu0h
	 TGs9bv6/M/p050D0QMGwzTqu+TADzYrn0KEH0xESH8bysHoVk4Yt62qwnLWC7jheQPzWu
	 G2JSH+Ag86KbbG+q2Ie8ZU4ZIQ+fM1kqr6YDvlb7LawwAMjqbVxxvHU+GGy0fKRQL41H0
	 4d083miU2Bjblkz3DnvefNimPWbWb1/KRnzdgtfodfimSVszSWa44YEQkdl8xmto9EA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
	b=fnG0rDp8aDfRSwDhA9xwM+BomIgAWvNEr6f8PwBdbZkKKpdtehgL+LciAY0p4t9IG7Qr
	 wZ7e3lvdH4oIyyzU6D4N0/NJU6V2CIqp8QEgfGRdhse/W0iIhKlRTZSq2dOx0VYJCxycS
	 L7xcABgr/wBzsYuUpO0ahJhqau7RjHR3jUll2Lzm83Etw3+FfwocJ0xOWYD380M0GkNSH
	 plO5bkclA6vs0JTT7l8D4BySCeXYhPLrgtHirvFQhaGRK3VcDEpUff1z9HWrZaba0ivNl
	 VlcO1oje84xzq6eDyVXAsbe766mXu98dXzhqXU6qUi6KBhBYnXYF35OKkrW8mptgX6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brHuzBNo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04DA606A335
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 17:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04DA606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=brHuzBNo
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a206f0b95bso13845e9.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 09:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985684; cv=none;
        d=google.com; s=arc-20260327;
        b=o3KiO6S2oeDk9pkfOlsZ/fgGIoXlWwY2D+ugRbSxZcFCe9vqT7gxdDHtAHKRCuuhBC
         BJ+/ciKzK8/BTUVJTMz6bR+tiNlpX7P/3hxrh+4i5wf68RVQ1fPwp8ncxss51ggciE01
         q/HQzPKj6FUb7hA2Eu8+8faoJw5mrJRX5nbXiiD+AfOaauUc4zA+Q551cPpB8qtl2ntB
         lS9fDjXzcElrgK/GXLhudsrw7nPwntiIUlQTHIkmv0v+kcLSR5nrbSlpwauAUf2YdYXW
         oRTJrplb/sfZcjVeYq7yV9hy5KsYie2QABrsiy1GDUbwX3miaIiNpzwjqKFsnX/yxSzB
         KT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        fh=TMSXgAyrdilgOTqBCG9KQtq5IQ2c1nSAhq6ccSCPXO0=;
        b=Bj5KvBU8bCn6C7wXguaB6Z+Wp9v6WcAca01dPRToxbn9grU1icjEX7XlaNH+OUqrCb
         +8mgu4C/hl/g0Ar1XGz3fXuWd1krnw7iV5XQV0leVOqJgxxCYQ3PNxWj1v9aM7KWc3eg
         d3XYXvPJV82+6kx7mNfVbalTiIFK9DskDkupKCvasooSBuudYJa6frFfru5Nz7wvG8BS
         iY9aQ1iuPK2IW3hm2vMDFdQDDyq8wkLT5k8nvx/nNDibtuyDgcxqgyxb7HhKK+yAYPHt
         I0N+hUgW8I8ImIJ+anTz55ZoUqVpG1ct13J+U62gm9bgEXi0RAGTQYhIIBM6wdMrpcJL
         nQWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985684; x=1794590484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=brHuzBNooCSZjsSyXSFWMHBwfNjYNTG9a5Q3GfKsZ70yJN94/1w8oJ0YhXFD0HweTI
         c6IcxLxcr92YlN/aRCSw1AAeONF2b2T3QTgT71unjiSJd5fE9tDAasfUf0PvDE/Z6Ilw
         X/g6Cnh0qRbf0n2W6uL7JRiT4hiIN4Ik1e8K6GdO+BwIhEGoPL1NAnA4d+9ktJXdAlh8
         xxgcRU7Ghap1GLjOorZx0V6eGPaWP/d6RiEHe8vigfy9F0RG1ujzhJTCLnKuHDDyRKrf
         tz4kI9F4z4z8kTBYDRkYSH30f819pXVPbKnkddtLpC/W9IwCzgHGM+pPzaIVpPR7zN9m
         wfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985684; x=1794590484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=v9OmLhA5GCGw+xBwpsVvT+eI4Ne06zUhYje+m3IMZYVJNS5ldXo67mwPV2d/sIgd0T
         vWI5U7ASuIRlJY/3q+c9seU5HjfcAia4pPfpWXJB/sdhPGPnrowLQlv7oTg39niKYd+p
         7AEqWsBKW2GmiGImPAtqeVVYIeT0POAw8aHAprvtRCc8Wk+/znjBTpP2fy4Z9GwXOp6A
         FWUcmjm28z+b26tv85SowG0UMbJ3hreoCXZqGoTpfsohSU+RMyrtmdgwXSsVPvnPaPU0
         OynIReVCpRjLPwAdo56UN32a51Cm2xcpboORQENXcgSicgTMZTbP06FbxVSADFsOmsSk
         UvIw==
X-Forwarded-Encrypted: i=1; AKwUvBxd9Bi9PdFV2cqmfuI8kE40FFZ66ZnKS97OWGk3sqrtREhziV6bsVcaIdumKx848+78CJXNdKctgs0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+VYlIYnrPHALmTtAs8mleInOheqfRrPctz7KGAqtHvKZU5GXmd
	Ft1eP6nszetxUQOSOmFJyFDnnifubPJ3vbXypp4p7/NvV+biWDRcYArlYV6fL5yHp4y94cpb5Y5
	lFvF34syChK3f+t9Dglu5EMw2oNgZR/vIIR5X1Q2Q
X-Gm-Gg: AYBFou3Nct6XAcvEe5KxkUxqwCTsveshdsRNn/SJwLHr/Qv9GCNCsMe4iE1GduC1vZO
	tmQFK781gvQRuVY+sZ4F5lMdSvot4hs20B4pt7+1r5qtDnWnzCkfK3oDrLRlVNs6GF01XkCIhkq
	DIemtOAoSh9YdOOB88Y7E1rJnFKrQ50ari7G3dfXly78reExDE8/ZDubfMG23oVb8qjR2fxwSNV
	+eQ5myIQ7gvay0WWsQFwaFHrAPeChmksd4ThqMEQPXLQWJivmdClR99An5+r/20m4diYjsygcR7
	z+BqDBJUwIBkK+zFrD+1jFieX8k6lzxcauMcaXobc19SFCnlGUjxN94+EpfbbkbMULBGZ7myk2Z
	pxAHsqAzOS6/AvgCjelAZVt3Vs7nBl+sCAzEugv4WoyDlq1/DxGi4avtc2Nb5cCYKHfjZyQ==
X-Received: by 2002:a7b:c8d7:0:b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4b76cdf14e3mr150235e9.6.1793985683858; Fri, 06 Nov 2026
 09:21:23 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de> <20261103151021.GK3889730@ziepe.ca>
In-Reply-To: <20261103151021.GK3889730@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 09:21:08 -0800
X-Gm-Features: AclHuK9QrDyTYpPe0hyDJDnSB0d1jRnWKMXKMwxckIvbaQIWb85nKJEtPirUyxs
Message-ID: <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
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

I drafted an implementation [1] for premapped TX and RX buffers on top
of the existing networking page_pool. It is implemented entirely in
the networking layer and extends page_pool as the default RX
allocator, to the TX path. There are no hooks in the IOMMU, DMA or
page allocator code. I wanted to understand if this implementation
correctly captured the feedback on this thread. Key components of this
design:

- Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
chunk is mapped once per opted-in device through the DMA API and
records its IOVA for each device, rather than using a shared IOVA
window.

- TX: page_pool accepts a memory provider for pools that are not bound
to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
of their NUMA node; TCP copies sendmsg() data into them through the
task page_frag and allocates its skb heads from them.

- RX: an instance of the same memory provider, sharing the chunk code,
backs RX queue page_pools. RX chunks of order-0 pages belong to one
device and NUMA node, and are shared by that device's queues on the
node.

[1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:ne=
tdev_dma_pool



On Tue, Nov 3, 2026 at 8:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> > On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > > Disk I/O is still potentially affected by the same problems
> > > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > > in confidential computing...)
> > >
> > > The disk folks already have a proposal to address all of this using
> > > io_uring and preallocated buffers. I really doubt yet another version
> > > is going to be interesting there.
> >
> > Huh?  If you mean the dma-buf I/O it doesn't really have anything
> > to do with disks, except that this is the first user.
>
> Yeah
>
> > The dma-buf iovec can work for every ->read_iter/->write_iter
> > consumer, and should be adopted more broadly.  Including by
> > networking instead of their own totally weird different world.
>
> I'm not holding my breath on that one..
>
> Jason
>
