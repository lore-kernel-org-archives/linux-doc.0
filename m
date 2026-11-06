Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989074;
	b=Ybz8QKJb0+VBZs0hyHM9fhM7TBTHQO90rOXw5GU1TT+l8GseTNKEOGjWxQucYCo/zn57
	 RLal2Si3GLDq0ePGpfQ6M0MHVI2IUEhaAaKP1ot7kFs5+IRKSoXT+JyiH3cYYd2OqQkbo
	 QralnjlPOFQFfkOlP/4Pfj/8q7R3CBbaLNLaMoyL7Wz4BMzgBAqqJmuJPXf+8MvgPpmXu
	 xcXSatWpALsEs3KNc5t8pNf0KwfY1e0kEJTGGxksbDT2LIKCVF2DXQRO/VQRxtQW2FImC
	 4QZ/LDQQUMwkIXsX3PwibON8HwussWPZYqNji9lFRkPZfP0gpXWsQbTRos/GlOggidA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
	b=d5bJ02lbrpeWWjUbom3treOiGJJ3yst8ZBCTBfcbWAoBrghaIk9jYxmN1mLwkQa1YLxy
	 WlQyKoCbEOYhGVMIsc5f/rJW2caQ/mU3+69xrxp78FnLkrHLdtKTMPER1Qu2tYEHEz4zI
	 fPQZrDYkdNCaclV4BiX707rOC+Lm6MAl0+5As0X6VpkYgXxK2TZzAxyK9hmOFJNcr9LA8
	 EjAO4DbdsxtSwmyyiQOnM+AS021GXQgcwMDwqUhKDoosmcfDAyVYy3493O1UPlODfe9WU
	 nQo8aTfCTuXXBq33+MzrGW1dh3I59cmgc1ZNhYaVBNqlpgbGDG/IUPOcF1sYYoH/1+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9MH+D5n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B41606A336
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 18:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B41606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d9MH+D5n
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so4315e9.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 10:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989072; cv=none;
        d=google.com; s=arc-20260327;
        b=MKQ+48YcZW1SYyL4tVl16LaEDlxHyTbKpvsJ5Au78CoP57zyKpu9rqW1DZart0PP8T
         BH34AwMq5+KpHZ9OHE86T+TNT0ICqVs8l1eM1lc1pu6xdcIq53S0Zcotvj6J/wAXr//t
         0i2y0bd8ouYdrl/3vBlw1Djf7x0utKR3RVhkwV1FvpBvrbI/gjvcY8jKiXlpilZXefjU
         rDY9PXezBK+1fa/1oZK6jVrOfWR+JC9AD+fqdljsREk3MHiW5t4dNTMDobOr0q1TBLKS
         iHyn/P5rf4imP0gPEoQ3po5aDlLzf1DyAfpMqQrxVL+xagAtsPiW1+oGUaOL0eoQduRY
         1R6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        fh=hNsUGlWQCOZuEriYRpz2kQDazvMtcBZzSsIXdBetP0U=;
        b=MX8wb+lda4N4xEhfLevRmCtLQ7ZmYWQew2l0ZbSYzxyBuhwXblNKJFaoPxUTSI9IKt
         SzGdvzrketK8puW54AzXbMfaZUj8xTF5KM0453H4xORGbxCyE6e+v9RgjlJa88pEIBH7
         d6Qi7d4ECG/iFfZo9g9l2qstxqF17cKPvmCMmYn+EBmvHdCZXHeS+aQUuj2bQ+Ock+13
         Vb55ivmNdzcPjJO+t8Z3Kz/pir8I23S3XNTqriSp3kYQKNO+r1oNB09gC1l2t2+Lm7rK
         cGWZvvB/Bh3XTKiJDwLE6WTRAmDhvFNXEzX1EXjuNTfhIeM+uUHJOVYCyycIu1VpIcER
         AJiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989072; x=1794593872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=d9MH+D5nZDkkiyCBzZzBx2foYpYJwwmMY5qrYGec0Mx05ts1t8mj5HIZRVV1P3OfUl
         3ZR/GgMz6+7QaBC7goZtDvlsqEcLWgnZr7F2aN6ndUtt8k6ynWLMYCQfjNTYSMchQYWD
         rva24rhSDlMJ3IbwJA4HMX328yWPkco2ESyjfQTgFWSWw/Aivk606yHi1lvoCEC65j5n
         FHSP2Dj3L+UpRkq9asbf+YBHHKsZUVNTnJeNeRfbKGVBZD88jsMPHNZG3oJ+/kfKlhHO
         bRQn6G5Hn9Y9ktTxu4quX8bTVOs9pyyXmSPHrlYrXWv53j5pst5Y8OLoZPp3ycpZfjQE
         KlpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989072; x=1794593872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=Bywg+UAB9cTxzYaGiEo4QTxjYKcDqhwJIAfrAIPYMmCl/hf+3S/RlAE58yuF0/CCym
         qy8At8D3ZV4jJ709yCv8jY3zI1Q73TPW79c0txgNdrs8uHLab4M/2gPdOG7tZJDi1cqF
         JVhl53RO82A7W4T8eyA8ow+vouADXSZeceGJaVQYO3sDrG9W3rFAMagV/fBHnq9MtxND
         KnUSLAVoCKV5zMLQJHEFgwkOuWCdNsxWEgWrhiXIRteQ294X1wOa9EdXuS7dbaYsq1lV
         MUppgYrLX2Y2HT56Ch+5Opiw1t09+ANk7/ZX/vJuKnXishwWN1UmWzkkN5Lvtzk0/I4G
         N0Vw==
X-Forwarded-Encrypted: i=1; AKwUvBz9e6D5yl3Q0sB0OmXablf1fBU74s5NT32huf0G7uzZyjIIiPNvXglWg7AvnDGKYBkFgmV5st2/fCM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QetHIWqbyqlVsPpbGx1Ng/9+5Msyyr4tr70LMpSqR7O5b3PiV
	ABFKeXmyDvTRn5eICGqq8F+DkcD3ZpBxuMqOeqL3rFLdtsufk15TRrXef+LNlKTA1fhyKsD+qng
	fGS37D9Pl601x6w4HSCnosgABXv2OpGsoOG9NrD32
X-Gm-Gg: AYBFou3leYCerKlx9VEfC3yvB8MjRVXrZll6ZKA6UnNrzqF4HDRCGnl/ivKmEkFw2o1
	iO8OyETxfRDCuv2fqVbhHbHlfoGgavfD7jsUsqopoBTTcMWnkCbXUo0Zt/oa5PpQ+hPN70NSSi6
	Sp+N1MYxA5WVo6uunHTpmSr+tcLOhQ+uvGXA8mmaPHVOPWdyeGR84XtBwqVYF2qk18aw+d/3LEs
	M0m0IS4PzrbevwWi2+ttn+n4NGr8qZq+dlX5zoY8HeCeSvzJ8rLaLAEQ3r8ViZB8lL7Sm4T5X/2
	g9UcEmDSxA8E8U3RI/snZA9aW1G2aP2unZMbKr4xJZA+Dtv3Q7bjSc1jDw064fan7TR2zzu7dhA
	H46MZac/1ouF1wZo6BKmk011AQ5mwJN8KhZHSslLccC45DtX/RG/Fs1Vd8hS2Pa11sudi/Q==
X-Received: by 2002:a05:600c:8b12:b0:4b6:24ca:8848 with SMTP id
 5b1f17b1804b1-4b78a30d377mr98115e9.11.1793989071681; Fri, 06 Nov 2026
 10:17:51 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca>
In-Reply-To: <20261106180714.GI663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:17:38 -0800
X-Gm-Features: AclHuK-83DU2Twv76ErkJhEGQxs5tivwJ4EGd2AJl7A0D8r5G3Ha6ydUc43L3ns
Message-ID: <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 10:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
> > >
> > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > I drafted an implementation [1] for premapped TX and RX buffers on =
top
> > > > of the existing networking page_pool. It is implemented entirely in
> > > > the networking layer and extends page_pool as the default RX
> > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > > page allocator code. I wanted to understand if this implementation
> > > > correctly captured the feedback on this thread. Key components of t=
his
> > > > design:
> > > >
> > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but e=
ach
> > > > chunk is mapped once per opted-in device through the DMA API and
> > > > records its IOVA for each device, rather than using a shared IOVA
> > > > window.
> > > >
> > > > - TX: page_pool accepts a memory provider for pools that are not bo=
und
> > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunk=
s
> > > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > > task page_frag and allocates its skb heads from them.
> > > >
> > > > - RX: an instance of the same memory provider, sharing the chunk co=
de,
> > > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > > device and NUMA node, and are shared by that device's queues on the
> > > > node.
> > > >
> > > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:=
linux:netdev_dma_pool
> > >
> > > IMHO the netstack should never read from shared/decrypted memory. If
> > > you put it in a SKB you have to be sure the only touch after that
> > > point will be a DMA read from an untrusted device on the TX side
> > > (sending it to a trusted device would be a fail) and the final copy t=
o
> > > userspace on the RX side.
> >
> > That's likely a fair callout. TBH I'm not very familiar with CoCo and
> > will spend some time understanding the constraints. I kept CoCo out of
> > my implementation as I approached this solution from the overcommitted
> > VM problem where we are trying to overcommit memory in VMs and use
> > these pre-mapped pages to avoid using bounce buffers.
>
> Why does overcomitted VM use bounce buffers? Do you mean this is
> about getting better memory clustering in page pool since the VM
> paging granule is 2M?

Not exactly, we are trying to use VFIO passthrough NICs in
overcommitted VMs. Since the guest memory is overcommitted we can't
dma-map the entire guest address space (as non-overcommitted VMs do).
So overcommitted VMs can use bounce buffers to have a set of
pre-mapped buffers to bounce traffic in and out. We're trying to use
this solution to map pages dynamically with virtio-iommu and recycle
them via page-pool to avoid traps on each TX/RX and avoid the copy
cost of bounce buffers.

This problem extends to generally reducing IOMMU overhead in
networking - taking the dma map/unmap cost out of the hot-path and
avoiding IOTLB thrashing.

>
> Jason
