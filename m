Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB721A700
	for <linux-doc@vger.kernel.org>; Fri,  8 Nov 2024 15:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731080330; cv=none; b=BUqQ13eksGqGFI96LvDK/SDxrGo9zwXMoVy2IA0CTXrztm2VM1Wz+Ahy8RClfNRliz5ayurSpFlsAkXQPqwszoONCICWTLUTUs90OfdEw/nnnzeY8nZwkWMyPxCOUDsJXpkSjb7j1aa0j4ftzGZiXaz+hO7Pxvpi2QoiaVokhYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731080330; c=relaxed/simple;
	bh=OaBx3Fh/Km3ELqbio7v031NeuRfzJ9+4kTiWipNjW34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDT/TYddYnpiUsz+FE/ykWlkYRcra4SQAjUaPIQWVWsB6pCPWsszwxVTYADEKT5p4cdNx8WkXxClmPclNSiTHwod497QiISQiMSg5KRmOF49Zm4JoR9/+5Dle3LODNwA4cTHhTCmfc4iJ+3QgJzzRC3CWwR4C48bcZZp9ReaS0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=aexEmqOU; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="aexEmqOU"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b15d330ce1so154657185a.1
        for <linux-doc@vger.kernel.org>; Fri, 08 Nov 2024 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1731080328; x=1731685128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7sMW5Kuv5sIzIjhBbBygI9fJdJpSk6eqM7+xgs0I9dY=;
        b=aexEmqOUtoWo0nIxpp53mWmhgcdamtlMoWnc7v23Dq2R4nF+XhtjhKeEQukniU5tde
         Vce5KIwE2ZP9zCpfoy/YAiCAgwmM+QhLn3FHxZhCVqcMcnaWCLkDNsKSdaR7TEYQYQny
         I7V8/zeoQnhPgNDMziuf1jeRFibRMTmxh1Jfgd73c+9VMrzfs8b59x9r8L0WM1bTzHZG
         X4YyruWQtaCHeiW6iXjx8oFUyTMzlhRe6kIpwqDXRLz/HFKrM3zjhj7yegME3+gB8JUw
         w3XqR9e5cqtLx9oPgONMCEZKywjVgwCbdxTX4YQWSbGgXCYWTAg8upYA74ViTR7IznHA
         v2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731080328; x=1731685128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sMW5Kuv5sIzIjhBbBygI9fJdJpSk6eqM7+xgs0I9dY=;
        b=W08KM1XPgT8GV+1cSffsRBLECn/kE/ArOdKyar3fGx5FMrnC9vLMzePw8oz4DMmvAY
         02A8o5VAQWiGa9hXxiaKNbahjNPmYbgJvk9uAXzzyzequw6T4+4NDEWShf5NYS5HLs6j
         xw2n48Dhp9ps3xLRNcBdFOhFacnbjETlyp79bK9RKAkbKoqgeJ0/j5W7A62YG8eOCWyY
         i8MMCAH8lRuNaum/k1PHyITWE+kLJtHGWyRwjn38SNUHegN7apHFKb9e0cVtyte5Z0mk
         mCdUv51Eomb5Nswa7SFKzc8rQyUIM2Hp5CupyfEYJeCxT6gII36OMWLuMyusBtSz/E0h
         pHKw==
X-Forwarded-Encrypted: i=1; AJvYcCXY8QNB0a0udKMwPwEYzOSTKuHs6E3bDdVPfNzb4YddWxiiiMV1cLe8m3NpY8mKC7ATbovu5jZZjEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ11XzyxlFGKMRQDLh4AwF+Ln7x0cBFuRQ9qQs7kH0j+CgzyK8
	sWUdL+NskX3QjlYLBk2amy4qRbWx8r8LX4ojUu8QB51431EMdfgKT73Wggw3RdA=
X-Google-Smtp-Source: AGHT+IHfTg/iLCK5GxrqZ9aoCzAZ7JH1FinF3HAR4KRwwnugOPp1CtA3KrYQyOs3W/lc98NgBjpBFQ==
X-Received: by 2002:a05:620a:1a21:b0:7ac:bb00:cd42 with SMTP id af79cd13be357-7b331dd2d55mr406755285a.27.1731080327649;
        Fri, 08 Nov 2024 07:38:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b32ac2dd1fsm170869085a.15.2024.11.08.07.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 07:38:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1t9R4Q-00000002a9N-29Xq;
	Fri, 08 Nov 2024 11:38:46 -0400
Date: Fri, 8 Nov 2024 11:38:46 -0400
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
Message-ID: <20241108153846.GO35848@ziepe.ca>
References: <3567312e-5942-4037-93dc-587f25f0778c@arm.com>
 <20241104095831.GA28751@lst.de>
 <20241105195357.GI35848@ziepe.ca>
 <20241107083256.GA9071@lst.de>
 <20241107132808.GK35848@ziepe.ca>
 <20241107135025.GA14996@lst.de>
 <20241108150226.GM35848@ziepe.ca>
 <20241108150500.GA10102@lst.de>
 <20241108152537.GN35848@ziepe.ca>
 <20241108152956.GA12130@lst.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108152956.GA12130@lst.de>

On Fri, Nov 08, 2024 at 04:29:56PM +0100, Christoph Hellwig wrote:
> On Fri, Nov 08, 2024 at 11:25:37AM -0400, Jason Gunthorpe wrote:
> > I'm asking how it will work if you change the struct page argument to
> > physical, because today dma_direct_map_page() has:
> > 
> > 		if (is_pci_p2pdma_page(page))
> > 			return DMA_MAPPING_ERROR;
> > 
> > Which is exactly the sorts of things I'm looking at when when I say to
> > get rid of struct page.
> 
> It will have to look up the page from the physical address obviously.
> But at least only in the error path.

I'm thinking we can largely avoid searching on physical, or at least
we can optimize this so there is only one search on physical at the
start of the DMA mapping. (since we are now saying all pages are the
same type)

> > What I'm thinking about is replacing code like the above with something like:
> > 
> > 		if (p2p_provider)
> > 			return DMA_MAPPING_ERROR;
> > 
> > And the caller is the one that would have done is_pci_p2pdma_page()
> > and either passes p2p_provider=NULL or page->pgmap->p2p_provider.
> 
> And where do you get that one from?

Which one?

The caller must know the p2p properties of what it is doing because it
is driving all the P2P logic around what APIs to call.

Either because it is already working with struct page and gets it out
of the pgmap.

Or it is working with non-struct page memory and has a (MMIO address,
p2p_provider) tuple that it got from the original driver that gave it
the MMIO address.

Or it really does have a naked phys_addr_t and it did the search on
physical, but only once.

Jason
