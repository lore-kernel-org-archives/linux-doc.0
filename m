Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FB02038AA
	for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 18:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731523294; cv=none; b=fs8oDZZiTFgLkwxBj0NWaBqkGWYjFbmVSb1qgP8thza/r1rPhPfK2JODy05JboznN1O7ULX4XCfvij9HkUmXPZd4uItZiop62qt00Rp7pLDvLFnAIapJItxn4EoHvUvN9YVQKeHp83JThexE9X/FC39pB1SsRf1fTXXIJ645750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731523294; c=relaxed/simple;
	bh=/6cAFmMHE1TEpLz6LqHni1bfuBBiGvBf+Q9klO/pZOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbrlR4O3QKoqTtpKUZHjsZAlf+w/gNxhP1uOLhr3Es5DTp/kZ3hpE2Nur4RGz6Yx86vCPadY4tYsEcd+8x06ZfJXLzUgjSBmoC0rsstIpiZCzTO/X1zB2hN6d4Jfknvxosjri0bFSGV/yCi2BjSSDZ4uROJZ8ksfK4vfYodkU4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=md40WSJz; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="md40WSJz"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b13fe8f4d0so464491385a.0
        for <linux-doc@vger.kernel.org>; Wed, 13 Nov 2024 10:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1731523291; x=1732128091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2y1TaKaV2g4XFVY3gJwH3zViZ7RCzLm1QmvK0MsuyE=;
        b=md40WSJzXnh4zt4zBALYkynrbuAtS0evfqRbhhEdXfTSrU9X//rj7qQ+WdPBI/PFWv
         iS9kVQ8Hqca7Z2agBU1ihwZ8FbOJVfmbsEztd3LDbnwvlUDRvVz1TFbRGxEV9cCgYiBL
         9JD2ADXGsTSWmv4p1ePEyujwJIfg4hbu1xhv6Pb4Qa8tPR7Fu5QDq/X5YjYjBTPgB75i
         wYqkTjfVm8EDxG4SqIwukURwEZPgrbRth8FEc/cM9gxfCigiWMpoZ8QWHdSRAnr879lx
         M1ZzRlqPwNjY+l6nl20XTHr7PPErXX8QKmPEo4WzkBoKYxSKbhr70o8LjSsisjMwpHpD
         pPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731523291; x=1732128091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2y1TaKaV2g4XFVY3gJwH3zViZ7RCzLm1QmvK0MsuyE=;
        b=RSLiJs2GjYR5hgm00nnR5SjggJmgZ6qfbjGXMGgYMhvB0W+GBOJmZlLnkHjv2AjFON
         QWCrLKMs4NnhnRvFgMOYGawP9ukMNeeyo/7nK7yiCJdpn9MBAn39H1wOohVcfs97VRq9
         GRkBcEeiXd+64iWTS8Gtlco7tFyME7/KQLZJqOP20SXi26F5i3AFJx0dm4M8ufDxJPLq
         t67G8A7e5KhLboh4IZa32QAuusMRm4VuV69+ueadPvaU1u877laBDyQKh7LbEz9dohNI
         BkCqt0yuE13EZQccwd0nB3gCV6Wcu41PR+WeUH7Pu42k1TA7B7KwvXS00mQwZIIrwzL0
         Ty0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5iizaCtjqHjgTI2sZ8edshDWRn4rJKqtnKWghIrZTi+eQMmTI7upi/eWMv86f6nEZtJnzgyTBDY0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdqFnIXd//MC1JoA9X4Qg/SMVRpGQsLkw6jJgWw5/k2nH1uRJj
	itzmc0d505JNKtJQzLAM8VrSJk5QARU7DsQiDQDw++VfJ/nCa4jeOu02qKoaCqk=
X-Google-Smtp-Source: AGHT+IGHlQ3B6cgvg7LHp9B0an1V9l7W1otIHEU9XZtLf2twbE4ctDauWQrxx5wsqcBmnHpCgDTZBw==
X-Received: by 2002:a05:620a:4150:b0:7a2:1db:e286 with SMTP id af79cd13be357-7b35293bd6emr455709785a.52.1731523291038;
        Wed, 13 Nov 2024 10:41:31 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32acb0496sm718091885a.89.2024.11.13.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 10:41:30 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tBIIz-000000011lJ-0zht;
	Wed, 13 Nov 2024 14:41:29 -0400
Date: Wed, 13 Nov 2024 14:41:29 -0400
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
	kvm@vger.kernel.org, linux-mm@kvack.org, matthew.brost@intel.com,
	Thomas.Hellstrom@linux.intel.com, brian.welty@intel.com,
	himal.prasad.ghimiray@intel.com, krishnaiah.bommu@intel.com,
	niranjana.vishwanathapura@intel.com
Subject: Re: [PATCH v1 00/17] Provide a new two step DMA mapping API
Message-ID: <20241113184129.GA173265@ziepe.ca>
References: <20241105195357.GI35848@ziepe.ca>
 <20241107083256.GA9071@lst.de>
 <20241107132808.GK35848@ziepe.ca>
 <20241107135025.GA14996@lst.de>
 <20241108150226.GM35848@ziepe.ca>
 <20241108150500.GA10102@lst.de>
 <20241108152537.GN35848@ziepe.ca>
 <20241108152956.GA12130@lst.de>
 <20241108153846.GO35848@ziepe.ca>
 <20241112060108.GA10056@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112060108.GA10056@lst.de>

On Tue, Nov 12, 2024 at 07:01:08AM +0100, Christoph Hellwig wrote:
> On Fri, Nov 08, 2024 at 11:38:46AM -0400, Jason Gunthorpe wrote:
> > > > What I'm thinking about is replacing code like the above with something like:
> > > > 
> > > > 		if (p2p_provider)
> > > > 			return DMA_MAPPING_ERROR;
> > > > 
> > > > And the caller is the one that would have done is_pci_p2pdma_page()
> > > > and either passes p2p_provider=NULL or page->pgmap->p2p_provider.
> > > 
> > > And where do you get that one from?
> > 
> > Which one?
> 
> The p2p_provider thing (whatever that will actually be).

p2p_provider would be splitting out the information in
pci_p2pdma_pagemap to it's own type:

struct pci_p2pdma_pagemap {
	struct pci_dev *provider;
	u64 bus_offset;

That is the essential information to compute PCI_P2PDMA_MAP_*.

For example when blk_rq_dma_map_iter_start() calls pci_p2pdma_state(),
it has this information from page->pgmap. It would still have the
information via the pgmap when we split it out of the
pci_p2pdma_pagemap.

Since everything doing a dma map has to do the pci_p2pdma_state() to
compute PCI_P2PDMA_MAP_* every dma mapping operation has already got
the provider. Since everything is uniform within a mapping operation
the provider is constant for the whole map.

For future non-struct page cases the provider comes along with the
address list from whatever created the address list in the first
place.

Looking at dmabuf for example, I expect dmabuf to provide a new data
structure which is a list of lists:

 [[provider GPU: [mmio_addr1,mmio_addr2,mmio_addr3],
  [provider NULL: [cpu_addr1, cpu_addr2, ...],
   ..
 ]

And each uniform group would be dma map'd on its own using the
embedded provider instead of page->pgmap.

Jason
