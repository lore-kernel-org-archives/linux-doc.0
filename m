Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516071D5CFB
	for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 23:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773185660; cv=none; b=dxOuaZLJyqi0cjIHY4gdvidCUY+RRT/2oWc/hYE0+p1HST2MXgrzfHYWucU97WGUsbOC9eGVJoUxD6pw5Sy1e2KMOu09TU+nTHSM9MGvr2AD28o0IgTWKomr5d6tpFvf/AT3FlAwfrkuBD30VGQ4YiKtEUK1NwCvpC7zIqaiFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773185660; c=relaxed/simple;
	bh=zCDQLm/ti7Fh+tEKDvr17wEEpnNO9M6S1JIlwzo9Acs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T97+lkNHguXQfs0GoMmFzr9um9XB3VYawdYj7NFJeqbBboHsXctuTWu69ifaVIZloJRv8uISUtstSrZw3RSj2HG4dBaLVmfNFVbrM6WpUP9WiVAhMu5Ffy4MxNAFCt0NccylC6lF/Nx7ja7Nf35Quf2aeuyCT9qf/KWKy2PJdRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=n6uuBTok; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="n6uuBTok"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8cd8dbf4f2eso258041685a.2
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2026 16:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773185658; x=1773790458; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZsiIyQd4tPWumA9ZQMQURKCway9cLZHNLfL2p5j0zPY=;
        b=n6uuBToksVmxqHTOnwcTLm8SqOdVqzC9hwvnG5NmSIkRODM387iQ8/SB+lOT8Ptfs7
         AntGAIHr2j+KJKd7Ht01wP3JHYioR+yBvDmqCsxS0ZNUT/MfxjV/9iKVqU6jWGvn3FRd
         S7jFewWF6fcI2P1pRFuDDfkRKgVTzvVxjdp0HaNP0zGhB+xerwfmKufsEJ37kdXXGPaa
         L84tACDnV+c6YuNSiEucEikNCfCd1GAteMIYcxM7lzkcrrj1/3QbYYdvDNNIEfwaYc81
         8qiLskG8qTIoCan1P8afsUeS7SOEGHdb8kkMe3+/G8joQgBS/Im9O8htDcO36Lu65AaN
         NtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773185658; x=1773790458;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsiIyQd4tPWumA9ZQMQURKCway9cLZHNLfL2p5j0zPY=;
        b=cyjBxXJ8L706ucYggDI9GXjDmGVSXpKK1/kVklqwk5pALSTSWD/mOhgUBeepEhodfL
         MbZN0joi6emDcbGJYzOzfKg50wDjrPLGeJ8bKaLe8/jfZdYjrPNX8XNczI+7rhpgog58
         RvL/xGjK8Gj5H030l5/JL/hIQm93ps26+y5VIGlITW+/Ze1KBy445IDbXSYsrjUC9FyA
         UNfVI6uOfddJFkbU3FHFGLtvVnpDXu8WSQ0w2Rvwk0MSw87b0Gzvp8lr2c9RHW2nRy0B
         HiTq9yPLGfpcOolV0S5jDBknsYaxNk+JiZeOG0LpTy3e1XGMUp/+hrWSYRj32hYKpVS8
         k2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCWC4y84iWsqvTejbBgcpcXtPq5P9rGahmVbiy5wNS2Yzc7T3166m7BG6au3pHi9k7lvU7b2Q/x7yXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq/VAyJJ7kuR+2+73FLLkmOXBRFtypUeM/JVIAVqZBr9xNZ9Tl
	3LEHm+S1MHtXJ6oieoziRoF6h8dapfgkWcPpjp7gahGSqOYJP1yRt5IK/YX93w1R6LY=
X-Gm-Gg: ATEYQzyhLLyvFPSz2ir/szY0D30Plaeu/Rd2DnxZ60q2cky9pznEULg6yPPdp+d9X3b
	WjmxgF4mQjV8nkQtQH73fGaXJk7+tjMcetWwMulgazR5aTm35RZfEHTdWRgMc4xOafcDyMT79vg
	H9MkQS2tlzymMszFGsvQDgJKqxd1CU2XEoGqr/zJ36y6Umx2RbPxwJj8yQQY+Oa+NkwGviMI1s9
	+N/dUzOADQAaoRVJMXTb6kzhDcpEOsXlnlT8OI67rbOjLqDmxLWFeT/G+7ojK6SHvGlVpMcF/og
	YoqvXXC8Jh1qtljiRXZlENVQAg22M8HLcu5a3zShwBGYzkxnjYYEGzHdmdWv+01p6hu0gBgwLCb
	qyUdGRrJSm+CYvVPt8GlfEv22rlfEC/Ep0xtGaT7tpGg8N7xmJ+diW7NCJfb+l+FIG2x/gXpoP/
	bGkZ563qFEjWtrXBE+Lb/NurojoJWpmyTzDa/cK1Zl8VrDTumCMNZKRIxIMlk/X2V9SUVAgyK8j
	9SP+rtb
X-Received: by 2002:a05:620a:3941:b0:8cd:982d:4101 with SMTP id af79cd13be357-8cda1a28be2mr93012785a.27.1773185658222;
        Tue, 10 Mar 2026 16:34:18 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda1fd6325sm24946085a.11.2026.03.10.16.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 16:34:17 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w06ae-000000064gS-3fKz;
	Tue, 10 Mar 2026 20:34:16 -0300
Date: Tue, 10 Mar 2026 20:34:16 -0300
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
Message-ID: <20260310233416.GT1687929@ziepe.ca>
References: <20260308184902.GR12611@unreal>
 <20260308230916.GI1687929@ziepe.ca>
 <CGME20260309090352eucas1p283a75c78cac495b5ad87df74c79aab07@eucas1p2.samsung.com>
 <20260309090342.GS12611@unreal>
 <c1d058f3-f864-4ed7-9f7a-683d6f4bf1ce@samsung.com>
 <20260309150502.GX12611@unreal>
 <20260309151356.GN1687929@ziepe.ca>
 <aaebc5b6-2805-46d3-a68e-549c26a3ef03@samsung.com>
 <20260310123405.GR1687929@ziepe.ca>
 <a61f8814-b896-4ec0-bb83-a8cbd8aca4e8@samsung.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a61f8814-b896-4ec0-bb83-a8cbd8aca4e8@samsung.com>

On Tue, Mar 10, 2026 at 10:08:38PM +0100, Marek Szyprowski wrote:
> On 10.03.2026 13:34, Jason Gunthorpe wrote:
> > On Tue, Mar 10, 2026 at 10:45:38AM +0100, Marek Szyprowski wrote:
> >> Jason is right. Indeed the rdma/uverbs case needs some extension to
> >> ensure that the coherent mapping is used, what is not possible now. This
> >> however doesn't mean that the DMA_ATTR_CPU_CACHE_OVERLAP is not needed
> >> for that use case too. I'm open to accept both. The only question I have
> >> is which name should we use? We already have DMA_ATTR_CPU_CACHE_CLEAN,
> >> while DMA_ATTR_CPU_CACHE_OVERLAP and
> >> DMA_ATTR_DEBUGGING_IGNORE_CACHELINES were proposed here. The last seems
> >> to be most descriptive.
> > If we do DMA_ATTR_REQUIRE_COHERENCE then I imagine it would internally
> > also set DMA_ATTR_DEBUGGING_IGNORE_CACHELINES, but I'd prefer that
> > detail not leak into the callers.
> 
> Why DMA_ATTR_REQUIRE_COHERENCE should imply 
> DMA_ATTR_DEBUGGING_IGNORE_CACHELINES?

AFAICT the purpose of the DMA API debugging cacheline tracking is to
ensure that drivers are mapping things properly such that the cache
flushing in incoherent systems can properly cache flush them without
creating bugs (ie a dirty line overwriteing DMA'd data or something).

If the mapping is REQUIRE_COHERENCE then it is prevented from running
on systems where these cache artifacts can cause corruption, so we
don't need to track them and we don't need the strict restrictions on
what can be mapped.

Which trips up and gives false positives for cases like RDMA, DRM, etc
that are allowing userspace to multi-map userspace memory.

Jason
