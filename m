Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9454F24EF88
	for <linux-doc@vger.kernel.org>; Mon,  5 May 2025 12:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746448147; cv=none; b=qufRX/XMgQnepwrZ0Zp/0inP3B3QTqhv3qrrkx8O5kKp68rNNgqT8sTg9QrCo109SfplxKuXNvzdSRKFkigpT8+1MDM9r4YSxxwZ86V7jgqKN1zP5zxgCFW+V1gi2Ni2pqfPfY56JP7pCCr+fYTwq3Yw3h2RDLDuWVJ1sKiih+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746448147; c=relaxed/simple;
	bh=8st2WkhNjYa0sS1ZjGydQ5cI8qeMQD3qVytw+PewtLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7eFdgEgaO3UPveEzFordoz4sC9wciBOSkPPbMG+RULcSF9DhVLltE08bNOaS5ir2Q+maoClJgS7coFT3vjfEB5D2e961CEKQPn4W+eKhmovV/8E88h/J1j8sHeppoi5k4KQPmPB9ZVle+aHwEHDuY5xHODIeuM0+dqF5aA0hlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=d5rF7RkT; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="d5rF7RkT"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f6970326so47805266d6.0
        for <linux-doc@vger.kernel.org>; Mon, 05 May 2025 05:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1746448144; x=1747052944; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mfu+tu5hpHDhrhemjgH6VucLj0HupA6g7txg5hR1fns=;
        b=d5rF7RkTmsJIBWsVD7r8ZkiItKXsgG/IbfI1O5P30GgnZ18NuAXa9eP3PofKtR4MG0
         K3hKiOCDSlt1JiNQdhav+XFXb3Uu6gZqSHBorp5ZpiG1Hm/lph0vpRPQ0MP2poUZKyCZ
         gLaF+DKDt6doc4D+XMMDB+puE8X1g0e1seAAPnKRXk6pn30VYcTdFZ2Vv58Th9J4lcvu
         QFpQupl7AMl5vIx0jZlhfvDVfNplt3sa/ll0jeXRRN/jOxqPVOuRRbGLzME9SNr0s1jh
         r80iCVsOAcD5bTSFn1dsarpkJqTWD7NBAJ+kwQbClpuV4o31q9LP5LPBTWmmjxrOJai7
         Nf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746448144; x=1747052944;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfu+tu5hpHDhrhemjgH6VucLj0HupA6g7txg5hR1fns=;
        b=SdMPIYOkNjnJ0ucK280ZKpR+GAyzDbi1i8CZxyTo/6NJTx6HwSmufreexdEG/c5GqN
         9VzK/4/8LStCJPY8qwM0W8Hu8bA7TQFwLd0xnxuJCtWNdqPsMy7EdMp7W0w9EGvDO3SR
         6X3rxMfqd6FFGVGDDBYbKyzciSSXNUuT0jBK9y+vGmNqMxXoW6HYQsxLVEuUItHnFUcq
         c4VSkK1lvutuei4MUZb/FVD3ogbKcLZzNCUmE4/ITfa89ZTsI7gHl5kGvQyQ4IFthycY
         PLr10894jtHY3VkuguDFC8Q7M68KerD8GOJl8WuvP21FB0DghHKeQcNIpKbuJLJ+FAYz
         Mz2w==
X-Forwarded-Encrypted: i=1; AJvYcCU0HSI1Wa1N/Jo4W3XkzHNEGjcTqblFNDFc3soWGqS/hRKVD4G+PZdV8Qz29ejKhGzpqCfJR8yRSl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUvZJJqfIuTXeHwPec+FMIUCMRI/m35qBAddUxWhH/xw6YCl3
	HCDtpLnUCJXFnXKYNZgar+A/GOVlr7lHHR0+RvbrdV4JgTWlyDhK5w0NQ2soi9k=
X-Gm-Gg: ASbGncsnuNLLZz8+VakREdCeoIEc2G+H29dozk/bO8RqorIxqXiTD43X9uY6KbXUO8C
	MqFyupBFg+DIsEO0u5NrSxWWK5KjoAATuhsEwbgfRLJBTakE2E0TlkRAcVY6FyB7m360lE6jSt6
	ohdnPmeVCTHOai6482bS8u7UDdmIwng2/2qlxt7rDrIxBKV7jilAlMjAgm7M92zADi8PuGhbjeq
	fscoT/PCSA9KfP4x6V13VWwO+ziy2XQcKqU9rel2Mlb633ZH6Z05IKZWOEiV7ktCOAD0weNzJwP
	b4fcUb4zsT2YSZKwsJVvznWhYzBX1Ofg4d3sl9IQqP9xJi1f1rW1n6Qql+pTGO0NFTSWFrt6vGx
	9a+0uhzCSeiYSO27Z4KI=
X-Google-Smtp-Source: AGHT+IHrrCkbPkXSi1eXZMzeybSC5P++W/lKXALdeEOdhNPGMmZG6yFN5oZZyeIbSctGCJtNUEnJAg==
X-Received: by 2002:a05:6214:b69:b0:6d8:99cf:d2db with SMTP id 6a1803df08f44-6f523852b68mr146814446d6.38.1746448144313;
        Mon, 05 May 2025 05:29:04 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3c3887sm54983076d6.38.2025.05.05.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 05:29:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uBuwQ-0000000GxAs-3q1W;
	Mon, 05 May 2025 09:29:02 -0300
Date: Mon, 5 May 2025 09:29:02 -0300
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
	Chaitanya Kulkarni <kch@nvidia.com>
Subject: Re: [PATCH v11 0/9] Provide a new two step DMA mapping API
Message-ID: <20250505122902.GF2260621@ziepe.ca>
References: <cover.1746424934.git.leon@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746424934.git.leon@kernel.org>

On Mon, May 05, 2025 at 10:01:37AM +0300, Leon Romanovsky wrote:
> Hi Marek,
> 
> These are the DMA/IOMMU patches only, which have not seen functional
> changes for a while.  They are tested and reviewed and ready to merge.
> 
> We will work with relevant subsystems to merge rest of the conversion
> patches. At least some of them will be done in next cycle to reduce
> merge conflicts.

Please lets have this on a branch so I can do the rdma parts this
cycle.

Thanks,
Jason
