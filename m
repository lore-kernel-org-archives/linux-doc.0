Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F316636C5B3
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 19:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763580687; cv=none; b=EhccSNKzFizEHpA236hHLgAEraiGjCqM62GuchMaCQA4LN45tWbLfa45zXoWLbxQe+Yfd/zK0/OcZ8fcD/4oMMKZ74WFz6pO9+TPot6IRdm0Wj2RpU3Iv0U+0Z6GBmisQPIGIF3fZ8/MTvK5H6yZFmX/LzEY5Q5VmxXq2sXmT0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763580687; c=relaxed/simple;
	bh=31o43Jiq7+42iBKuCHD0EJijctYU11Xzmoh7F9+p7aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mc02LjrzGhBYmSTNPuW4fVRtK9JrQ3RFTBIXZ+Ks8B89QjgC8w6UZfh+f+CV2NyaWN06P7/q/iqWowwoWqMOk6GcQA2k+ZRr0Jf3+CNK6k8KHZjL/OFxRXmA6jT14X/HjROXh6raWmp89uQIJa7IrDSkM9fWn106vDXGzIqUErs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=XdlJDak+; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="XdlJDak+"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4ee1fca7a16so796741cf.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 11:31:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1763580676; x=1764185476; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
        b=XdlJDak+5BK913SU3JuefgTys0Pu3jagmK7yJRyg0hso6vBbEnNWrP/4T4ol0frYeQ
         v72slbgWiUzUkvc5J9nruxngr4U8bjd49BPaZVmvFk3nVkQeWMFAA9u86tKqv9X1hNhK
         MlqYYLa9OWUP32XsBcZxKrfLx3/P5R6PJ+h5hBO1AY350/0bZcNA4a3VB+Mm2EZq+tuy
         2zW8VsnOjICqJWrFFskAlkKYKVrHI+m3LVPh9ZWULCzK0B6ii9jOvGUvNr+rAbET5gKT
         aIqFqtGZMVR1/oWhdLlQH/aHK4RI3YFZ+ToY0lGX/NpOTOSRqsVtdilqIlqws45I3kGI
         vpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763580676; x=1764185476;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h7MnLKcAx1SQL4BtR2OdhLpsdZ14wJj1fNMBVXMaHpI=;
        b=S6DfzDHBSQlwo7/Zglhk5OD16+0dfmB/tpjHm1dI+vekshKSwvoCLRbApWiaAuJsk5
         urBYfUvRTSENh0/V0QCF6tGeqdvA1x6uRoQtZZAiuVPOIK8l9gbhAiCYM74lQFqwh7NT
         XMwq70tRIzaMT4tmaJGAJmlPjyFLcMcObgw38bA+YfM923PnJ1ZeF5qb0t6yc5A/7kZD
         f8WEpiL5u14k4uQYOJXkycHjD02Ub3UlRBvtaYRY0pUCQrqV1ZK7GD/ihc0CjHlZiBXf
         8x50P6jjbPVanN4mSYOrpsXLnTyRfGgBfWjepQAxpbc4tn0NzI2LqFl3D51UqdjRhmOa
         L4GQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2PHohjH/YjsQVCXN2PsExFVhvYK4EfOhZ+cnCHOV/0n7kEJUK7gRiJoPOQiquQh9Ag3rsORt6Q/g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7dgYa3kufooZSbR2AkA1CyJmZN9+aLSN491DkHjzOar0dN2F9
	tlOYbkbQHaGxCvgM6+/n7vc7UGklJedkkXzgPEV44qq8isQXSxSWE0v4h9LbIzsfHmQ=
X-Gm-Gg: ASbGncscKxLQVfCASFUaeXh2hxsUjvSpd9KbgHGta82RXKYPd7gx/ZgwABs7pISeuBY
	LTS9JMUX3uppM80k+fpocqH15+9vk/JeRnLcQ6posmDlHoztXE6S1Jz8xsxupl7cUzdpghyS6Ay
	FZG40qoTpJ7f3CMr1bYh+d0oSGFW2xir9swsdOnNQa3b8xKKZqB/bzMeiMZe8ugRSZRkszLxdp1
	NhGrMOGEFQq4Jo+tjadc6yhFWUYug9jF0ef+9FAIY7geHEj+2BwPMjMz+T15b5TKG2cV7quN6c3
	GbnnMizDaTeCMaj/RDB5+++DGqi0wOftYHxNuBvP9miyOuxEhD0xfb73dzaa31zBNcY3K1xC+1b
	rbgMq5/xnBcPW/POSr1yr2ojKBDbLpTqvZ4LMNwmryDVv7UpnDJDWSPRiHPeU7q3zcYhveYJuSP
	+ovGLyo/35w+61l8+OfU5E0wf5joBxUWxf7bL3xut/72srlXBojtkXnftsBTsfJWNYR6U=
X-Google-Smtp-Source: AGHT+IH0hpvR5twkqRmVGMRtAcrCxesRIOb4Xizv2z5I0TXHRJV8nSPA0Y9PLt873fJAl178vHWixw==
X-Received: by 2002:ac8:7e4c:0:b0:4ee:4a3a:bd18 with SMTP id d75a77b69052e-4ee4a3abe64mr1136891cf.76.1763580675980;
        Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e46ed0sm2807721cf.20.2025.11.19.11.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 11:31:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vLnta-00000000bWq-3r3x;
	Wed, 19 Nov 2025 15:31:14 -0400
Date: Wed, 19 Nov 2025 15:31:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Ankit Agrawal <ankita@nvidia.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <skolothumtho@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>,
	Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, iommu@lists.linux.dev,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
	linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
	Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119193114.GP17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>

On Wed, Nov 19, 2025 at 02:42:18PM +0100, Christian König wrote:

> >>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
> >>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
> >>> +		if (!dma->state) {
> >>> +			ret = -ENOMEM;
> >>> +			goto err_free_dma;
> >>> +		}
> >>> +
> >>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
> >>
> >> Oh, that is a clear no-go for the core DMA-buf code.
> >>
> >> It's intentionally up to the exporter how to create the DMA
> >> addresses the importer can work with.
> > 
> > I can't fully understand this remark?
> 
> The exporter should be able to decide if it actually wants to use
> P2P when the transfer has to go through the host bridge (e.g. when
> IOMMU/bridge routing bits are enabled).

Sure, but this is a simplified helper for exporters that don't have
choices where the memory comes from.

I fully expet to see changes to this to support more use cases,
including the one above. We should do those changes along with users
making use of them so we can evaluate what works best.

> But only take that as Acked-by, I would need at least a day (or
> week) of free time to wrap my head around all the technical details
> again. And that is something I won't have before January or even
> later.

Sure, it is alot, and I think DRM community in general should come up
to speed on the new DMA API and how we are pushing to see P2P work
within Linux.

So thanks, we can take the Acked-by and progress here. Interested
parties can pick it up from this point when time allows.

We can also have a mini-community call to give a summary/etc on these
topics.

Thanks,
Jason
