Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306BB3290C4
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773318420; cv=none; b=En6LrdBd/F+q/QxfdYt5x0hXP7v3YaxtzmkMqBs3zZNd7Mk7PCF6MkCCcgCw24q1ZmipdJDkC3fDBbPukveFPtZx4sDoRMC6F0CIafQ5X7aCUWUpdpIUklnMfwFgcWRJV6A5Ujr/4S0btWhVDJvWllmzFGqe1W1GgPEAyeeCC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773318420; c=relaxed/simple;
	bh=kL0Vtw+iePKp4mxXk49bsuyKV2vV08txbV9fCNpa5ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euimheetz8yAqLD5OUrdWMUx8baBJY68Q+QrT7HCnbh3EnolwiSUozxcd71Rlzcp6xPD4qMlTc3eubUIwCJKljA03SDuEhSJCJShaTpf4WPtYojOFwWVEf/nDOd04PHbdGy6FgCcvebvkF2p0IH5BvGUHybLQ3+bvIQos7NHO38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=IA4RNZY5; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="IA4RNZY5"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8cd767d2d70so101782385a.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773318418; x=1773923218; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6bVLYsZeqdLLR0Cw+BVzWgzWP+lyAr3AqcCFZTxFfl4=;
        b=IA4RNZY54MlZRH6gImDutdbmqWRi5s7Aq0rG19UOYiw/P/ndeNshlYrf9zUbaGIe/8
         is5ZjhqWU35yFqgB50yrzrB3lGuzyyssyNXeGIoUiqCddW8B1VOE3zJ0b4QK1sfz6aQf
         z1GGlY7AceS4ExYFXcnq8CCVd7jCS0RF0o373hRB0hNBRXgxou97eJIshDm0kZl0+deW
         Vml5iVgIVGBi3mb3I3LM+JyP9bx4tVcP1nZ/5EDCklLHrUXs1m1w8wO9cC1HQJL39UKB
         jCbkJPVpLUCVBqptxF/N+ANFSsg10lUTtIhtQHIDbEr6rix5Z0FfcPxTIjo0oYNAqOCv
         rHCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773318418; x=1773923218;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6bVLYsZeqdLLR0Cw+BVzWgzWP+lyAr3AqcCFZTxFfl4=;
        b=t+kgj0TIrA4KqfVoE5RbHGgVIAP3FwWf2gH3lxkBlUW2PxtQz5DU/afa2jRT3yfPZx
         b3AyuEvf8iwNV6pm4tEAuzYX3wAK56Lw2TNvbPR5ykqZ+BlD5miGW6n4hNa5HvlAP9Ol
         XIyOpqraAngaiSXbIEUltfOGSq/+phKTU4g1RmnrLRz6p4lUZ9jyfvFgfRAk1y86WgbA
         tlZVp+x/jL+5znHXN7u3ahJqdZRlXiIXFPUcr2ItQ5vk+owwD46coNj2RTCHeS1vqlih
         ByduZV22zq5EfyTW5W/0ZTR2CwXOC1aMiI2MOqVwVJ6Z5bSKOiZDqlVXbkh9PbJnE/oW
         Na3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6mQpze3sVrx8k5/OIvKki5euKkX06ft4ZZ7f4Ltz5HyY1M4wfTU1LDJkA5gTsELpuTuk2kb4v9xM=@vger.kernel.org
X-Gm-Message-State: AOJu0YynBnGyLGY3lgtUztoJUzexsoIOdC81W3N08EJ4eglxLjLRRGoi
	KdCqRNXpFdIZHidw4grOK/XgBvgN5ZYnCcRjUhMJQjXbVubVNylzXm1MdK1QLk0pDNE=
X-Gm-Gg: ATEYQzwSBY1ZTgZeHy6o2/Su40C4oHmgdPP5QBRzwgDPMg734ShbKq54G1PRpMBF/Nr
	FV9OIIkLQKyIduAmkY5nhzFQ7jZIXliCCHfegfJcazlrjRtz6Zf8tg1DUdU+s8SoxpWYNF+LgjL
	8HTdwwnq7fl1ScuU3OlcTjdqE8gm9rDIaEgap+M0VXyb3CTUTF9LHl18/XASwl3S6wGSvJjLb9F
	2Agx6bEhEdgQFoBzrPBQbuTWv7nZ0fzdgKQcdon1Gof6MqZclKgXbAYsa9o595ThbY5eQ2TAu0z
	iM1NDoP1wtamdwpHbM0bGY7r9fxaGOKEKoknf91V3mS9oh0scMKd4ZyVAhPc10yQ1opLUpG1Yct
	Lro5h9cSqPvxPOSu8P1dPhP0Lume9jRYNHo5K0pzbo7joX3WZ89CrOfygfVFwSbSYyaTq2EHbZf
	zQoOS9lzYjqqqHFPLT8aeNv16G/HGj48pkeP++eP7lksSIWJrSPolGP3F7amM4fS95GXJMOJevj
	X3/W+qa
X-Received: by 2002:a05:620a:4692:b0:8cd:9322:7c55 with SMTP id af79cd13be357-8cda193043amr787228385a.17.1773318418176;
        Thu, 12 Mar 2026 05:26:58 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fddfe8sm328304485a.12.2026.03.12.05.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:26:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0f7l-00000006ewH-1owB;
	Thu, 12 Mar 2026 09:26:45 -0300
Date: Thu, 12 Mar 2026 09:26:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	virtualization@lists.linux.dev, linux-rdma@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 8/8] mm/hmm: Indicate that HMM requires DMA coherency
Message-ID: <20260312122645.GG1469476@ziepe.ca>
References: <20260311-dma-debug-overlap-v2-0-e00bc2ca346d@nvidia.com>
 <20260311-dma-debug-overlap-v2-8-e00bc2ca346d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-dma-debug-overlap-v2-8-e00bc2ca346d@nvidia.com>

On Wed, Mar 11, 2026 at 09:08:51PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> HMM mirroring can work on coherent systems without SWIOTLB path only.
> Until introduction of DMA_ATTR_REQUIRE_COHERENT, there was no reliable
> way to indicate that and various approximation was done:

HMM is fundamentally about allowing a sophisticated device to
independently DMA to a process's memory concurrently with the CPU
accessing the same memory. It is similar to SVA but does not rely on
IOMMU support. Since the entire use model is concurrent access to the
same memory it becomes fatally broken as a uAPI if SWIOTLB is
replacing the memory, or the CPU caches are incoherent with DMA.

Till now there was no reliable way to indicate that and various
approximation was done:

> int hmm_dma_map_alloc(struct device *dev, struct hmm_dma_map *map,
>                       size_t nr_entries, size_t dma_entry_size)
> {
> <...>
>         /*
>          * The HMM API violates our normal DMA buffer ownership rules and can't
>          * transfer buffer ownership.  The dma_addressing_limited() check is a
>          * best approximation to ensure no swiotlb buffering happens.
>          */
>         dma_need_sync = !dev->dma_skip_sync;
>         if (dma_need_sync || dma_addressing_limited(dev))
>                 return -EOPNOTSUPP;

Can it get dropped now then?

> So let's mark mapped buffers with DMA_ATTR_REQUIRE_COHERENT attribute
> to prevent DMA debugging warnings for cache overlapped entries.

Well, that isn't the main motivation, this prevents silent data
corruption if someone tries to use hmm in a system with swiotlb or
incoherent DMA,

Looks OK otherwise

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
