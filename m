Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988438;
	b=WqjaufEfjZMVdE2CgRuZSufhCshqZPOjS+rPml2AWjrsFUJu2HxV6HN45XInZiwJ+2gW
	 CYvAU8KHb4t4HsOX/ipzdGz1GDPYoQ1mnufn94gSev1Fe0THRXm8W8UnYvirxPYXQQect
	 7iDLaMoxNy5x5q/yqq/YHY3uxvTyv0DtGaJiaSiIiYQTzdssq/Q4MPGnmz2EtgO0L2mpQ
	 oN6HYhydjcN1PyCrmC0gt7wYt1B9zIh3kR4hN63spW73dHO4GRniKYD9iH4YKmJPCj7Xk
	 ZmWFq425QlAwFdlkryWtDJHRNjgqUw+GVAWivIaQqtBuRdkewvU1dTy8VF8H7TNfUNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
	b=j3aDsZ/Ek1TkSfYkjNoA6Ql1YG82WC743aLpJevRo2Wxcw0RBXdeKrnTRlRzg2n0FY+X
	 BT6QRWwd38xXJXY9Z7mvcx1pveATDgmRMw5e/pQkPMgmRMBDFPRcqr1cAOCdqMEbHWxJl
	 Ntpt/tOICvsrr28wgkBhAEPyuxKGMiTHDnUeD7nheeY++NZK4eyEtd4IfL9D2vxuqSAs9
	 m2xpPzSAgFRDrqq9CnM96lbiLagCfrT86CJtUnnG4UnRMB0/G27q2rTAk4s+l47b8g1Ly
	 KAfGW9BRBlMPWaCU7rnUhN7ZYQG8a1UcrjAbNe9ce0ztUL4BqjMYU8ADtMtkmk2rqRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BYMekOj0;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16F7606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A16F7606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=BYMekOj0
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53cd0c8614eso6715471cf.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793988436; x=1794593236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=BYMekOj0YLKZhnr+iVGVAmGRIyI1upa42CJ2T3XGuUPONpzfjEizxnMAOBorEIuOvt
         V1tD4WtF3cdKq7HNBr+RNQzsb/8dpXv7Slwh9yjySJem6KxDRha+0toC3mRIxyf/ljjW
         KZVIvbK6BTagUCEHSISTBvF6BQZ1G4UOX7ZODh58bbOrYjUZMTNeHuP01AJnpvZgj4nC
         0Z3i98k+Z9rwCS13pUoGAc4M0umoAHIDKl1uiYTToR1e5fna9zpBJhou0SOh7EuCwmDM
         RqgKGYL21aCr4GwV4a0eIUgUtZLCX9ixOJnCJIOFwdUIPE9ou9ndCwK0k8YaQCIV4E+d
         +zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988436; x=1794593236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=LjJZL1gSsEhs9CLh7OTJcH1o/YEnF61e1etZdshpbDP1O6oOJhp7YQEa4KMovQMPL0
         XUaHlED8KZJLRptO+36jZZtv1oPHjUdVcF7iNovHn7r07662czJYVRnzj+hWit0TRQV3
         F5KR+0NgNusluAnt1UAsSTzDZA52arXiT2+SISiAvvADjifH00/y4mMlnzytH6DrWgs/
         XRPizH6iIPExb9OhC0aOI3RzuzqvYrGfpfHa5/XEAwtG4+t4nVWcE5BfrlmM0TlHcLN7
         hDFKFSyVBVPVQr75KFyYJhj1LBfTNSgfMwAZAcvyjdpO4CUw2PYMY04XMswbe3Zeoryi
         4P9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxJ2FL7sUXodfNoSfcsRUjW7wC/N67xtZoZ3tZGFrvhXtiQh76rJpkmSPgfvSA4vr8+0UsJ8B5EtmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NrP4I8/Za0ced+ZHuLOLmYldyl1i7GN1ZVpB7rLY1kh0rROoP
	KKj2pSgGfIKduNPwYUtPj8K5+uUcOQBNzDGTIwXO8BmoFP1mgtlnOLr7EaFVJI5CV80=
X-Gm-Gg: AYBFou2AwJrkIRQOH85KvDzUGZTqWH6x+E/wf3xwE8vAVBOVTOIpPR1Buy4oR5r6dgf
	BkUOn5J51cYnv72jayBLaFhyv7uawuBQOz9Uzs0J3AU6ASHq2pN/Gc6pXzhP7myuqUWqhLP6YuN
	lPrDCOXuFvNjtKurZL517cW+p8KD/YT4nxXUZmsTjUJsdG7JRQ4MLEw2NEMByl39wQ60DfOt/UF
	iaIgahZPYeZPrRmpV/Rb4HYCH4sAhh2dcSQcAEsRHPUOGD4ZVEn2SLjOb4exRGYjObcIRrYzq6Y
	jQbB1dGv8VylpmGW8l+PRZtMAafBvWXmzV7QxYi7f9iaSFoP2fQ1jdpWUwspZXXgH5Hp8FX5q9C
	dATjSwfvM9eVDY7SCvrB9ZSsTRSWUBtTBOvc17T9O8fSWxIXSYUcm1lLVfeSKnBAVKB+nBjO1L6
	atGFY1FiaQuDK5r8zcIqk2rNwD4oJEgXVn8/5QqvpzkMUTDatue73PeF879xIDsbLkx0L1lpWyz
	RWhKFoPnUPvRIEiiw6C5CVjOb/oAxBnwsEgNfk3SlHNMrfyOTWZyDSVwi+PCfJuRwUkwswOE0u7
	qk5rzlQPLi/ljCNUkA92viA5J/eQaE/UDvIpecWGPvzctcGT/G0o0trQm7k+naEis1UI3eGdhcG
	M8pQSIQZAzA==
X-Received: by 2002:a05:622a:480c:b0:535:a5fa:edff with SMTP id d75a77b69052e-54e15b63c63mr47814391cf.63.1793988436090;
        Fri, 06 Nov 2026 10:07:16 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e231d0710sm26555871cf.2.2026.11.06.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:07:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPOLK-00000007CW0-3s9S;
	Fri, 06 Nov 2026 14:07:14 -0400
Date: Fri, 6 Nov 2026 14:07:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Naman Gulati <namangulati@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <20261106180714.GI663069@ziepe.ca>
References: <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
 <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>

On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> On Fri, Nov 6, 2026 at 9:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > I drafted an implementation [1] for premapped TX and RX buffers on top
> > > of the existing networking page_pool. It is implemented entirely in
> > > the networking layer and extends page_pool as the default RX
> > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > page allocator code. I wanted to understand if this implementation
> > > correctly captured the feedback on this thread. Key components of this
> > > design:
> > >
> > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > > chunk is mapped once per opted-in device through the DMA API and
> > > records its IOVA for each device, rather than using a shared IOVA
> > > window.
> > >
> > > - TX: page_pool accepts a memory provider for pools that are not bound
> > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > task page_frag and allocates its skb heads from them.
> > >
> > > - RX: an instance of the same memory provider, sharing the chunk code,
> > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > device and NUMA node, and are shared by that device's queues on the
> > > node.
> > >
> > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool
> >
> > IMHO the netstack should never read from shared/decrypted memory. If
> > you put it in a SKB you have to be sure the only touch after that
> > point will be a DMA read from an untrusted device on the TX side
> > (sending it to a trusted device would be a fail) and the final copy to
> > userspace on the RX side.
> 
> That's likely a fair callout. TBH I'm not very familiar with CoCo and
> will spend some time understanding the constraints. I kept CoCo out of
> my implementation as I approached this solution from the overcommitted
> VM problem where we are trying to overcommit memory in VMs and use
> these pre-mapped pages to avoid using bounce buffers.

Why does overcomitted VM use bounce buffers? Do you mean this is
about getting better memory clustering in page pool since the VM
paging granule is 2M?

Jason
