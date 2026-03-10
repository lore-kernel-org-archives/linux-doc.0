Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945053CF051
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773146049; cv=none; b=AP7B1z30jamR9dBBkLqQ1FNBCOwdpl1U6d6M/WGz3tfM+D4vJ42b2P+16xDeRNjwXcPdJbCO/kD0cR0EtAZgRUv44tM3K2pPbpAMBPsxe+lPXqSFkMKwwAHEjk1JjdmLOfYULBZzU5pzd5ry5Qc3cKOK5fvYZ1AboB4M6P6e5EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773146049; c=relaxed/simple;
	bh=cHUF2XHSTidsSmxJD0bQdgzaHWB25qEwufJ2YTbQfJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fUc8/4YIrW/k+I5aDam//IGp5pCWsxA2/ljnzMLm/jy1OzWcIDtB8/BEpMIA7EKCAJtd7k4QNcXL5W8ALrn/NFGGbGdizDIQWfxWE6C9lzmRU6PpJZKjWXj1wt2hudj/unRajO0DhZNMpqZRIc8ywcJRaHEL7XscFGswLa/EuGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=f8K5CocJ; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="f8K5CocJ"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8cd8d97aa2eso238095485a.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 05:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773146046; x=1773750846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JidrQO5YBoJChSM6WSALz7pLZEnTQpjujRwwjFND6W8=;
        b=f8K5CocJqmPZcA0JrprlJiEZ2g14B0IWLg0GGSVzL0LlWh+EAGKuT1VLTD+AAZ27Mp
         67jd/prM/RG8fMw8rZ3mHJ0uwowArAbb0viDvMduw4XEO/0gdcq9qLk9+2WuecSdTBZA
         g60CVjew09aSoUQo3E5eq41c3iE/3AXgQ1uu+zuOKG4pAQFCSZPtp3MsRyfJA3wglIhe
         CWf/pm5mroT/yGMG+zdum/O8i0XcsweYKnqTxgr/fg/C64a33bzEXYET2DUUvYwU6eX5
         lQPFcASb+VVORr6PAjR89Se21fl5SJcLJFlqELzOKd+zv8bRbUDvLa4NljX+8Zsh6CPc
         AHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773146046; x=1773750846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JidrQO5YBoJChSM6WSALz7pLZEnTQpjujRwwjFND6W8=;
        b=GZr552rkFhCSe/O24YdXVVLeNjlhCNZU0YoxQa6WfCdOZqtoM0MHsL9cIz52n5iXi/
         sUVa8Ca7JA+9RjSxOS+/+bcVAeFUBOcdsObqxfJ0Vuo7shEG71O4zaXHTsyxuYb0UCJf
         lsamVWopOvnv0uOdam7enGutTeK2NOAtHoCgu2VDT0E6+gpmh16ZjXqEKz1dxJ0/eXiv
         6sPlBuzguT4gHbyKARMKhmVMMSbaHgE28kbWmvwXAZYPLjRyZsZOetj3eVZbvRfp7isz
         R1w2lVEdYUew42kxKLIwUgupY9pHoREdrOv1zxpQC/DcWzaS7/Hs5P5FLVN6rluh3REY
         YUjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbqa3Llhc2GZrDFYFU4txYpy+WeCKO7pBxEHy1uOhpCEriYIsF26pfqFzkqzM6OKED+oXEzr23Q1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBWZDMxjh/tUR6p9CKfpyKyyfCkNTWW09guF2T6g7xB2K+e1iM
	9OTZbuPobmTRRmPQR+mVIKtXdCxsRK23ChfDBys8RrNUYnwttDIUxDW4C6a3j21CkB8=
X-Gm-Gg: ATEYQzzncStXNaSxM2c2U21NOLvLNdh5evmAwXUtkdq3qQwVSngOIjKL19noWyknz6t
	jDAdfistrJxnSZZPoNPeFOa4wS1npEhMiftAqT7m4Nf0SPKBL5Pqe1CZ/kwdDoM1vKphz6aOsuu
	bT3iG8vz9dftu72b6oGNOeA9CkWv7qD7uw0Y0HIuqKVxDaWSH398HEPqHWgWDkW+4sAtgM+gqMm
	G2eJatnzk1ggBGQ+ZNqn84sGQhU805mLp+jaoopFr0K0B/34T9sA/m1vrEqY+dIiLZuwSIqXNbh
	HpePJNVsdJ/0fSj804B3YgtdA33E2JlKLm0rw7AhrKLFDRfj/tbTZJKRKIz4OQf9tWSUIMpKUVA
	Ad02at9ExIPbxtrTueVN/4wqlLanHWfxTdKxId2eYtXQMPPPAmkWdjdDB4CIZG18/+zMOlnFVrj
	D3Ii07FAI1xzOhMnMBG9xYKa47yWW1YI56b61uLZLV8tBT5kMWg2tVsRSnL4fy7a2CEpeXCSG+L
	sHml4NI
X-Received: by 2002:a05:620a:4004:b0:8cd:9365:f27f with SMTP id af79cd13be357-8cd9365fb75mr416301385a.51.1773146046495;
        Tue, 10 Mar 2026 05:34:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd827a1ebbsm505561785a.8.2026.03.10.05.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:34:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vzwHl-00000005N1Z-0e7z;
	Tue, 10 Mar 2026 09:34:05 -0300
Date: Tue, 10 Mar 2026 09:34:05 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leon@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Petr Tesarik <ptesarik@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
	linux-rdma@vger.kernel.org
Subject: Re: [PATCH 2/3] dma-mapping: Clarify valid conditions for CPU cache
 line overlap
Message-ID: <20260310123405.GR1687929@ziepe.ca>
References: <20260307-dma-debug-overlap-v1-2-c034c38872af@nvidia.com>
 <20260308181920.GH1687929@ziepe.ca>
 <20260308184902.GR12611@unreal>
 <20260308230916.GI1687929@ziepe.ca>
 <CGME20260309090352eucas1p283a75c78cac495b5ad87df74c79aab07@eucas1p2.samsung.com>
 <20260309090342.GS12611@unreal>
 <c1d058f3-f864-4ed7-9f7a-683d6f4bf1ce@samsung.com>
 <20260309150502.GX12611@unreal>
 <20260309151356.GN1687929@ziepe.ca>
 <aaebc5b6-2805-46d3-a68e-549c26a3ef03@samsung.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaebc5b6-2805-46d3-a68e-549c26a3ef03@samsung.com>

On Tue, Mar 10, 2026 at 10:45:38AM +0100, Marek Szyprowski wrote:
> Jason is right. Indeed the rdma/uverbs case needs some extension to 
> ensure that the coherent mapping is used, what is not possible now. This 
> however doesn't mean that the DMA_ATTR_CPU_CACHE_OVERLAP is not needed 
> for that use case too. I'm open to accept both. The only question I have 
> is which name should we use? We already have DMA_ATTR_CPU_CACHE_CLEAN, 
> while DMA_ATTR_CPU_CACHE_OVERLAP and 
> DMA_ATTR_DEBUGGING_IGNORE_CACHELINES were proposed here. The last seems 
> to be most descriptive.

If we do DMA_ATTR_REQUIRE_COHERENCE then I imagine it would internally
also set DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, but I'd prefer that
detail not leak into the callers.

Jason
