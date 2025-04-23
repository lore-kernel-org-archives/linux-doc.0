Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC902288CA4
	for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428543; cv=none; b=FLU+Yej4OBFr481CzMF8l55iHL+nO4S+Tx7+88Q4rO1NQXlKrVYAZMhWBO7DCXJu2ol9hrj4jd9KhouTMJepCnToQQrBmyhmwHe21jYsLxQVMHkgL1gBNVxAwl4WjZ2Hgp2JJjmDtRapj470crggt8kJR3KpYuS7Gvac7nGjsC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428543; c=relaxed/simple;
	bh=ZSWmIXnoHeqHpg22is4DCb+FQUxyjWQhdchI0xl2uAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHSHaLpey5C6wvgs9ovcLMKzkMwF4WcoaeDtfcZjw1MPWpmKkJeZvGK2YJ6lTdHTH4KxzlzHtKDz7AZ3w9To47z6ozQJJXWqnN+qf67gcqNPrapVESGC1xZRYVPbNt8xaaQH3BHtButh6ao82dZ4PW9ib95Bk5BFRyKzB0wGb/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=f3RJOF+9; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="f3RJOF+9"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-52617ceae0dso41170e0c.0
        for <linux-doc@vger.kernel.org>; Wed, 23 Apr 2025 10:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745428539; x=1746033339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sAA3ahIS+2Nb+9ARKVTXCSjk2uwR/TOFzjA5DEQnqxg=;
        b=f3RJOF+9I5aUeLfKwhY41cyNNsV/7gzE8mnt0B7y7vbeRVxS8lsyPkRNroBYBI3tAJ
         LoOcUnWESA/cjHCPlWjRHA3M+53oDTrejya0NpMfeL6ljH+lfqQ/w5WsXx5ptqIdwRDv
         nsp4EdSeE1qB0xl7OhzzYJKM36aE0m+MI2XLpfk6xpvXrCfNBJoewKHE7+njIVYSVVE9
         uh237S2zCPLxHmND8hCSoBynFpTclSrt0aPYz/VfLhJATgS9agmNsggyOtAJAI5FOQCt
         Odf2Xxn7vp+XAbxZin8Yl6xswoHmQ5A7Db9GS23ti5naaSYjMpciujFTq8n0nXWju1+8
         8EaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428539; x=1746033339;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAA3ahIS+2Nb+9ARKVTXCSjk2uwR/TOFzjA5DEQnqxg=;
        b=iLTAU+YHGYLcZNc9Cx4+BW9nJr3XnIVdTzjpXYYsq1Ug+K16/UzPQqeglsc6pRKigS
         YH/6Qrtq3njAGk4z79kLxwCJM4oHyfwis3qarOZPTn5du3L5ho/eV8TVZooiyDQDY/aT
         ie/VOYGWYkCd2m0p6iBPzz4UoUwgX6Ra743wFvoBC30UzfSJ2hUhhyZObofzEKP/D+ut
         zduMzqUJA4gJqNXYPlr2nElAuej9nIoEiphC27R4YRs+C4okLxFk7jj82PU7ViUVQLZE
         UZ85/x3JT+JeGSlvoi1aEHI05bj9SUGqJQbYu73swxtTctK4J8Fg0+3xDnBKnVmwmfQS
         88kw==
X-Forwarded-Encrypted: i=1; AJvYcCXHJD4g76rgs/Qm9WKXPphwH+igmAnGbcr4uksleE5PQhmib6AzxWgy3cVzQ/E2vestxK75+HeeY6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwiijbxAEX/Rodb9rbR0j7KjV6l/Fpq759LL2uRGFvp8XeEQAW
	sIuI4oh3TlCtFc3XaG0cMOa0bS3oGrKX1jJrKh+FVVZh8aDeFt5d4PJLX3B7qsA=
X-Gm-Gg: ASbGncvFRFcVwZ8kTVryWsmdaD8/ndoCxKEj5HyMsi/e5hpj2gfi3fjyRbgaHcMmerm
	GdYstogCa89biAHm5pdZ4P42eqLV6HxOldl8AKmzEry2pHGMRIE/iv1j/ymC3cykHdaLG1pMoSD
	iKNAKW2Ybb68Eq3j1q/GyUarKgzsUiVZY2oerMT2JUmyHHswHOytnZ1n2K0zF8tO1h7WAiYdNGr
	hMThmre+b6nkfMsIUY9Zt8emiIJUfYtw1tm9FnoWFEHsocALwjC6Pl8NLi0TIHpTysFqhEgIYj7
	c5hpLrxYkFG8bqneD74aRFwzlndtcGMzRE/YpNmAva5DbbhIMiYTMfOl4R6ZQHkva5B7vWMfQho
	XCTWSjwNlJjAR9YBJhO8co5wLBE2LLQ==
X-Google-Smtp-Source: AGHT+IG91ka296h4XrJ4QPDo73jdYlZoOj1Zkc9PInMILwbVuqXEZMd5w4C/WgEttaatAxBubBvu3Q==
X-Received: by 2002:a05:6122:3c54:b0:529:24f8:dbdd with SMTP id 71dfb90a1353d-529253da601mr17813854e0c.4.1745428538734;
        Wed, 23 Apr 2025 10:15:38 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a74d3a2d0sm79186e0c.40.2025.04.23.10.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:15:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7dhB-00000007LQW-2UhV;
	Wed, 23 Apr 2025 14:15:37 -0300
Date: Wed, 23 Apr 2025 14:15:37 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jake Edge <jake@lwn.net>,
	Jonathan Corbet <corbet@lwn.net>, Zhu Yanjun <zyjzyj2000@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Sagi Grimberg <sagi@grimberg.me>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Yishai Hadas <yishaih@nvidia.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-rdma@vger.kernel.org,
	iommu@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-pci@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>
Subject: Re: [PATCH v9 03/24] iommu: generalize the batched sync after map
 interface
Message-ID: <20250423171537.GJ1213339@ziepe.ca>
References: <cover.1745394536.git.leon@kernel.org>
 <2ce6a74ddf5e13a7fdb731984aa781a15f17749d.1745394536.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce6a74ddf5e13a7fdb731984aa781a15f17749d.1745394536.git.leon@kernel.org>

On Wed, Apr 23, 2025 at 11:12:54AM +0300, Leon Romanovsky wrote:
> From: Christoph Hellwig <hch@lst.de>
> 
> For the upcoming IOVA-based DMA API we want to use the interface batch the
> sync after mapping multiple entries from dma-iommu without having a
> scatterlist.

Grammer:

 For the upcoming IOVA-based DMA API we want to batch the
 ops->iotlb_sync_map() call after mapping multiple IOVAs from
 dma-iommu without having a scatterlist. Improve the API.

 Add a wrapper for the map_sync as iommu_sync_map() so that callers don't
 need to poke into the methods directly.

 Formalize __iommu_map() into iommu_map_nosync() which requires the
 caller to call iommu_sync_map() after all maps are completed.

 Refactor the existing sanity checks from all the different layers
 into iommu_map_nosync().

>  drivers/iommu/iommu.c | 65 +++++++++++++++++++------------------------
>  include/linux/iommu.h |  4 +++
>  2 files changed, 33 insertions(+), 36 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

> +	/* Discourage passing strange GFP flags */
> +	if (WARN_ON_ONCE(gfp & (__GFP_COMP | __GFP_DMA | __GFP_DMA32 |
> +				__GFP_HIGHMEM)))
> +		return -EINVAL;

There is some kind of overlap with the new iommu_alloc_pages_node()
here that does a similar check, nothing that can be addressed in this
series but maybe a TBD for later..

Jason
