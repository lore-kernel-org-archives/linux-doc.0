Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E808F210187
	for <linux-doc@vger.kernel.org>; Thu,  7 Nov 2024 13:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730986094; cv=none; b=F5E73ppk/PsOVP4T7I2EKNm2YHAHksEgueTrOwaMaKIOIfk14pNx0T3Yxlt8OLC2sL7KaF2yNluPBIDT9HyC9v+Lj+Kl50BBn9y3Zdo77QNzEAwqYPDfZGmhanYKkDrHitQd3A1MaryGp45X3hAdP1xlHmzbMljOJFfJuK0o/3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730986094; c=relaxed/simple;
	bh=hYzChVDIuLb/8YgK+xhHVl47Zu6a9Yg+4tjwX8ly6HM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEfxZRpiNp63ACOJX5FVUYEdGsFU0ZubnWpmbRFeJHK1lZDzLtfNgcOxLdi2j/I/uyABzoyedcj93RiEPj3GcIy7B7FxT0q5MPsiAkmvPI2p5Z1nMCP7n8MriNhUHwOnC8uQoZoaRSLr96kzH/5cp0THHbXhXsbmDqwiypV3BRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Klf8FF6K; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Klf8FF6K"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7092dd03223so426111a34.1
        for <linux-doc@vger.kernel.org>; Thu, 07 Nov 2024 05:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1730986091; x=1731590891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wLc6Cp3t0rRD6tSmNJMVeZRKi1v5LF88UUzndPTrhYc=;
        b=Klf8FF6K6orux3fA7PlvEdFcnRWTsOhFc40v1LA1SLLrLlHk2tQvyVplk7vmmUJIFC
         UknOQnoTmeFAm3yBhadTv54U2nvVsfR+DQmMYLaE8n8nDpWBCfnXoY7h3v1hnNBtylx+
         FcWkAhNvr7b2fdDexWxLAmN1Y8fpneFLvut4gMB+b5yUNWHJzBoxK3Q4J/bwP8Vkas9y
         LCmuRRtb6blTYR8N574C41llrNMyF91vMlNSv+uhzhETTkYMfCnpR2WZdzPPv+gBuDkX
         1hFTYnCnnf3XxUJWxBtc7T+Z0T/qqIilo82AZKp5b/1TTffI3gJmDHnnIbLqyrxXR9FL
         AU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730986091; x=1731590891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLc6Cp3t0rRD6tSmNJMVeZRKi1v5LF88UUzndPTrhYc=;
        b=ONXaKWhAYJTUAeGXqNLiSEAhidvIcGupG+fKXiQNh6hluW2s/jQBGx/6QkhQE8diht
         pHGIGMirwfUs6B56NB/Q7grCqGtpNamxJUsJmDcfYwp1+S8QU2VX/V7A8OrxAvYYlMXf
         wMaKgmHEhrWiViJg55YQz2ni3X92jDda4mAfVXRgdmOPxZDvrrGB2qbZZne3+XZ77iA+
         DtYiw/1WRRu8hBSj1MtjPv+9YuNn77fuxF2fbmEHOqf3MxCEg77PZSch8+P4+F6Vbf3o
         V6ClYXKHnZgA15v1ltKGuL2HifnFPeVeBsmwWM1VQfshcjWB1SwEuhsAjQNq2W//T0uM
         XLdw==
X-Forwarded-Encrypted: i=1; AJvYcCWGROotrWRg2SilxBH3jELMgj94Lb+U3u24mYcuGT9U+YJLX7ZZdDjnxZSWE+QyCsq6fZ6T9H5vYsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqtEW892pzg6l72NXKKormQoGOarC+gM4GM+Y+1NlcCKj5uyN
	8iDWFmcRC/CiZBSENP7pQsosnRyPoaMre7OPucyD4cutpHVyyEq33X4SdHvIfNY=
X-Google-Smtp-Source: AGHT+IF+tw+3lLnZf4WnNvvo/ldJVal46tJah/6dRwkTid9yDCpRNCjr9NuPNVZcVYNIHAZNA7U8ew==
X-Received: by 2002:a05:6358:9696:b0:1c3:39ad:7c6c with SMTP id e5c5f4694b2df-1c5f99fec97mr1284772555d.17.1730986090941;
        Thu, 07 Nov 2024 05:28:10 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ecc4esm7389226d6.44.2024.11.07.05.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 05:28:09 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t92YS-00000002FM3-2zqJ;
	Thu, 07 Nov 2024 09:28:08 -0400
Date: Thu, 7 Nov 2024 09:28:08 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Robin Murphy <robin.murphy@arm.com>, Leon Romanovsky <leon@kernel.org>,
	Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Keith Busch <kbusch@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-rdma@vger.kernel.org, iommu@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 00/17] Provide a new two step DMA mapping API
Message-ID: <20241107132808.GK35848@ziepe.ca>
References: <cover.1730298502.git.leon@kernel.org>
 <3567312e-5942-4037-93dc-587f25f0778c@arm.com>
 <20241104095831.GA28751@lst.de>
 <20241105195357.GI35848@ziepe.ca>
 <20241107083256.GA9071@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107083256.GA9071@lst.de>

On Thu, Nov 07, 2024 at 09:32:56AM +0100, Christoph Hellwig wrote:
> On Tue, Nov 05, 2024 at 03:53:57PM -0400, Jason Gunthorpe wrote:
> > > Yeah, I don't really get the struct page argument.  In fact if we look
> > > at the nitty-gritty details of dma_map_page it doesn't really need a
> > > page at all. 
> > 
> > Today, if you want to map a P2P address you must have a struct page,
> > because page->pgmap is the only source of information on the P2P
> > topology.
> > 
> > So the logic is, to get P2P without struct page we need a way to have
> > all the features of dma_map_sg() but without a mandatory scatterlist
> > because we cannot remove struct page from scatterlist.
> 
> Well, that is true but also not the point.  The hard part is to
> find the P2P routing information without the page.  After that
> any physical address based interface will work, including a trivial
> dma_map_phys.

Once we are freed from scatterlist we can explore a design that would
pass the P2P routing information directly. For instance imagine
something like:

   dma_map_p2p(dev, phys, p2p_provider);

Then dma_map_page(dev, page) could be something like

   if (is_pci_p2pdma_page(page))
      dev_map_p2p(dev, page_to_phys(page), page->pgmap->p2p_provider)

From there we could then go into DRM/VFIO/etc and give them
p2p_providers without pgmaps. p2p_provider is some light refactoring
of what is already in drivers/pci/p2pdma.c

For the dmabuf use cases it is not actually hard to find the P2P
routing information - the driver constructing the dmabuf has it. The
challenge is carrying that information from the originating driver,
through the dmabuf apis to the final place that does the dma mapping.

So I'm thinking of a datastructure for things like dmabuf/rdma MR
that is sort of like this:

   struct phys_list {
         enum type; // CPU, p2p, encrypted, whatever
         struct p2p_provider *p2p_provider;
         struct phys_list *next;
         struct phys_range frags[];
   }

Where each phys_list would be a single uniform dma operation and
easily carries the extra meta data. No struct page, no serious issue
transfering the P2P routing information.

> > I saw the Intel XE team make a complicated integration with the DMA
> > API that wasn't so good. They were looking at an earlier version of
> > this and I think the feedback was positive. It should make a big
> > difference, but we will need to see what they come up and possibly
> > tweak things.
> 
> Not even sure what XE is, but do you have a pointer to it?  It would
> really be great if people having DMA problems talked to the dma-mapping
> and iommu maintaines / list..

GPU driver

https://lore.kernel.org/dri-devel/20240117221223.18540-7-oak.zeng@intel.com/

Jason
