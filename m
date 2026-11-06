Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988052;
	b=2pxQiXKfCJVnjpiiJhEICHuT/udDacDdwHkHyXrdM6/fnuDFrCyZsNcJG4cWurbN9ELz
	 K7FPmNZXV2RkRS+cYlvwVnB7l4SIyCTj4hZWhy8ooupm350FWD5INMOf9TtYSrYOXSwm6
	 S1xbNv8Wes0zN94kszxuJj7MAozLoUoHupsu4CA4pZGCt0nRp/v3hGMB5e3YmOmPP7a5W
	 c0oKRZ4NPAb/u7qROSKLrnQ3QRIT6Yq+3zdqmL74PGNgMpM43r61wN9rvpl8E2CLUAAgZ
	 aQ42VF32xpUlbyp0fy1X0uHElz3KxLSErC0s0cXaIWOQPx87tBwGwaoLHd0FEBiPSSg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
	b=lRDo7B6UQcT+sU04V18dzqbrYzGXhBaeo0v5u97eTzhVjGZvXqpiV+PhlOAkE270Fd9p
	 bFcA2oYjIYPOYZsQmgfARvY1G2slI4lzvWiUjHLguXoZGWYwIBHHjc8Sqd8iu6/e/AsBY
	 K0PvBtsbqfcfQQ5YzjFKuN+167GOclwyNGWjykmpgvnRQUDmj06HgJinQ2cCMq+G4ygGM
	 0HuLgcLtKieOIZcAiClO2/Xp2z/7u7Zu+GfaRfHnn9ymU2keWssG5avVuw175BnxQL1HB
	 0+gtwg5biKD7tfQzNQho6fbSs+7s93L7/s8r0Kuh4jQR01+SdFSGSscyrv4PB+MsQoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoecesZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57585606A32F
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57585606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QoecesZE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so3335e9.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 10:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988050; cv=none;
        d=google.com; s=arc-20260327;
        b=H9Ym5NHd/AWgdA2ohnTVX8KYM30+ssFXgnEqpkpUb5ZUEmAWvXECn2OKt0TlTy5LOm
         3bTsd0JO9ea//RXhMUsPJUA5oUCwAvEUFtwYMLFZ1qOu6BRbb9G4F6sMLdkG0yCjc6hF
         g7PbTIpe1z8zbTdLkZhLZaCgdSt/BTvwmCfzJg7B8AA2B2IywV26SFiOXOC6vCMQedsj
         BmTvujUXyXJhY/scYvlr5BCnZ3Q9uFhuKDPYWG9NrerX1J4ntOg2i+foSHE7DXgk9uZi
         SM/7pjmfFCDvMoCxnIbjgC0ydYkumRKGfn2aZoXg9cW2zXrBhsCln0+bV7e54VnMkpyx
         4tng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        fh=p9z8TQ4nD9L0oOH1omZRjk7aJmmvqX528ve07X9nago=;
        b=lwNcL11onIor7IDLe4fY3mOHIyYQbemQiL8KrNjvDB8Twr9GEy2ugqEZQ+ANfheebE
         mZk6sUyEgDozcSNBi76p3AnMEk3BTy7sZUdw6OKMvEzlD2E9yUlagEK/pWB5l6KVg1ai
         gSGk1XVVDIm0BSBlcLandceooqAdJesxHbv+Ffqv7j0yAVkqvOao8DmDojrOROmEdFPA
         F1z7+8HlVPvbmHG82uMtHzPhR+vbuT/UZrLmeMrqpnuifAremYPdKPYG728z3PiCIFi3
         lhmqqttxPTJzbpOVaO4WpfkSBz8w4nE87RZ/zyM5rcwaQy3Se4qcukzwwxiSXx4YrneS
         or1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988050; x=1794592850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=QoecesZEWdYh3VkL5qejF7mvJeTIRcWMeBzM7OpHnLqetsCHZK3GbCb4NGmtB8nhMW
         2GjUkRjQdN2500zoQiAqGqwF23J3T/2CHnerTz9RVr6QAUZgl+7r5vDGroRMzWI0jlrB
         8CriSf8HgaZn7WcDdIwuhMGmKtVOP0ATgA/mdAXS/Q36ZtmwST7JHinv5NS4feWIjfKH
         aEY7TmDxa0fVv+OxA5nKSDUpPZFrvNz8ky9qr9+I4JUMhbKKOIS5bKCfm9UGE3vTupcL
         eMNRQBsbdVMRtNrGOpudi4H+DFAwNJX6aTunShMWsRuI842LARoXphuXJ+Y1RamLrtkb
         vadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988050; x=1794592850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=zCoNShq97U7uD3ECKyqrcDkQNL67JiR4P+CGTkSJtU5D+HJ57qmGl3WYonU3ZL/YE/
         PfXuFRNADR4m01cUyQBOhWxbM5m+H7pf+oLUOkftaebw3VAg1PCiQ+nHX5BRbPKv/mrZ
         E+dsBtYSVyC8Ir2sWL7+RJoEFN2SqSFWz9SM7daVPOScbYZrmcRxQ+RzT6/061wIette
         W+6oZw3FKKA9VcdiLLZXjDT3tnKAbHyJaPtG4ezAz4k7bKb4cbt95i12kmS4JK+Wr5FK
         CMJNbSrOhVSRmtP9lg65Uwd8T/rPtH4nzByNUVCdgxUml7aYUgx+OODBwoP5VOCUU3v9
         3XfA==
X-Forwarded-Encrypted: i=1; AKwUvBylXLBCltH/HP4VsGrzfRdfk6AjlQ3IGo/RrA2TZ/NX4dLUoCPQFNFJR24csYIPcwKvSiVWAlhTXkQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xBLtWzgVt5WVc2iSXScicGOrn3c06GOd7OzJBxoYA16eo8hNw
	XN3VAcPnckIICMKCX+6ssWqkMpmxH29SKHc2TG+iOMKblrqKfLrQJXSjet2txLetydIXtgf0mL0
	58IYzcZEuYfSK1L5hvdYaEVdP0FjcHSzTtrFsp4s0
X-Gm-Gg: AYBFou3ZkCFSN4wWCP9QEf5+bk9/w+ZrMt8191RIkryc9bWNSHdAx+JNOFQKRYvbgl7
	e4/K7CYPGSNoO/BcSWkeLiBGKzBt8dLCcNu+29M/nlgVaOzBKD7WEFts2NK+kh3FtUq/+QIvzEV
	cPUCFLyPt1FEvJEtlSA+Lybom+4rJuM0mb5+vfVYoSAwqoASGAjbFVZvQHmNNyiB5c30YeDQIhn
	/tgffkDBMyxS6wSzIyhzU9SVAg4nyOY67WKZ1xjKFUWebyLCmFPyQbZVH4nNHzHhxfTwib3rud7
	GSxnLbKMJto0pkAxORzaGLok507WPmpxaG0fZpWuppgvdQ2feMu38h89CZHGTfYCxc1TKf0dGFS
	Z8g6rDBTTkrhIPm8Jm4HfwgvHGivP6qm5vqb1EZh84uViMW9WhyRS0uR3/RnaIjz+Z+vX0w==
X-Received: by 2002:a05:600c:c3db:20b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4b78a30d10emr50205e9.10.1793988049366; Fri, 06 Nov 2026
 10:00:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
In-Reply-To: <20261106173054.GH663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:00:35 -0800
X-Gm-Features: AclHuK8x57W7AnFw360PBbTWaHMwGgtNX68cpPd5ipqmMu4tcyLJQyWTDt3UxIA
Message-ID: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > I drafted an implementation [1] for premapped TX and RX buffers on top
> > of the existing networking page_pool. It is implemented entirely in
> > the networking layer and extends page_pool as the default RX
> > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > page allocator code. I wanted to understand if this implementation
> > correctly captured the feedback on this thread. Key components of this
> > design:
> >
> > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > chunk is mapped once per opted-in device through the DMA API and
> > records its IOVA for each device, rather than using a shared IOVA
> > window.
> >
> > - TX: page_pool accepts a memory provider for pools that are not bound
> > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > of their NUMA node; TCP copies sendmsg() data into them through the
> > task page_frag and allocates its skb heads from them.
> >
> > - RX: an instance of the same memory provider, sharing the chunk code,
> > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > device and NUMA node, and are shared by that device's queues on the
> > node.
> >
> > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linu=
x:netdev_dma_pool
>
> IMHO the netstack should never read from shared/decrypted memory. If
> you put it in a SKB you have to be sure the only touch after that
> point will be a DMA read from an untrusted device on the TX side
> (sending it to a trusted device would be a fail) and the final copy to
> userspace on the RX side.

That's likely a fair callout. TBH I'm not very familiar with CoCo and
will spend some time understanding the constraints. I kept CoCo out of
my implementation as I approached this solution from the overcommitted
VM problem where we are trying to overcommit memory in VMs and use
these pre-mapped pages to avoid using bounce buffers.

>
> Everything else is very security questionable.
>
> It is unclear to me how any of these page pool proposals meet that
> requirement since page pool typically provides memory that ends up
> widely used in the netstack.
>
> Jason
