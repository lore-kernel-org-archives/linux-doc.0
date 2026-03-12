Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AFC13D539
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773317983; cv=none; b=T/Wxmz1NuLP+rzFph/3LbfgCLxkjdiWeAu/v2Wy7rs4kax4I51BSRIvvmFrBmd63ZntzEz+JhpJCihO7XC7FSg/y7F9xS/4bMx/oHyXOStEow947+R+B8ZFgUbkZd8TIuKLsFlpOVgOs5O5AIx/7+Ma+ZKQG2+G1r3MQcthzj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773317983; c=relaxed/simple;
	bh=Oj/7ehc0cCCCDQU/7pS4vL4fF7AXLJnL/YyNxYgW3Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCBv0VZhzmgZEuJ5T0FrrxtoX+g7tNBMWXXsMSTdEKWE08dAzNiga3/EQCgs6lbGXqDlLS1Ach+LtvMFt2Ip5L59D+yuVc+wl9QVJQ/VcyJKtlNsIN/jIXmpJUvdqsu6UklKBb0DEDCJjl0nvSmNHJINOCzd1tSHNOLEdmk61v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BKS8aTvx; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BKS8aTvx"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8c70b5594f4so97951185a.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773317980; x=1773922780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0lXptsQPO/2bR1nDOk4C8coAYtgdswQIgAW2nY2lBKk=;
        b=BKS8aTvxZ3yh3IKjkSO1betRitYvAMjkK4YVAlshSXkv+ZnnBOXn7O7vaa1xC/RfHE
         zkAT2IkDbxusmUdQBc03On3Qiajg5+h3X3muwby/ijTjxLZBSm5SYsOa7xok8BrqH3LN
         GLFLO/42YieyVkWFv+HoGj95X8UG3+cuKr33MM8HWMqACq0QTUPGEYEcq/UsSdyMbSFX
         GAifEack/sIllT9LxthUXMJMeOlziVtcG2Ljouz+6y6o8KqRsAM6HTyboxZrtMUgzNsk
         RMbV/Q6WtRTyCeZUGeROzDdlUhO5p8muQs9pa4NEB7B0le9KZsotXJ3Ii6ruCleOy2Ub
         FnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773317980; x=1773922780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0lXptsQPO/2bR1nDOk4C8coAYtgdswQIgAW2nY2lBKk=;
        b=D4mMxK/ejX70vmC208XF+pZcwA69GStXV/4pCZsyuDXvTPJdgNuH7/9DzHWsl4+pVB
         xn2A2IQP48VY6D92sTt/T5KwSBB9xsNJjfsxbCuHlIE8A8BHsElHCVtuS0qLFse3Cy0M
         WiczfV9GCuJtjntc8DvUaute/qBaa59lVhpciaaIqir6BXjIrCSoJ5PVZaX8HXg60XK1
         Xzvo4Be0VlEsnHUSVh0sd3HTj9eu+kfigOJfMj57Vm16xyeYtZ+pae80Uhc1g7fY7bY6
         bcWoHKKdnskZWljoKvpkz2KA/Cq0uUFxHglJhkdIm+6WNDkuS+5L3G6UzqwdXZg8Abp/
         HG0g==
X-Forwarded-Encrypted: i=1; AJvYcCUUGIWPLZOmxM8oCiyEEFDgHypTzHh08H9fPzQ/9DwntESY73c+vyJXzYmooTKsLQTGO6EBBAvRlao=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkjS3fbq2ZGMjDCzHt31S1o9W7MPO0gBABbnnRVg743B1oMB4Z
	HbwB2KTymIMesg4KC/fxl9ZatKJ1FRKvZg8u+I1Py4r+dnp8l3t/a04qX20X/ngphrA=
X-Gm-Gg: ATEYQzz5Wov/fMrNq6Kgojmpw2Tf7Vy954F9JLFdytteXGG0sJezlGVUyfZq6UJayAM
	05uJZLlrx2aA9Ea2PRM5J2M6hpHEiySKjq85UY5ctpk0k5hLXERlcahRmblzjj23hXzGcys9cy1
	9Oh44OzFnItM+g6+V7yPAFapdcpvP2+35vgE+tJ3Yz6ueXzt3z5AyeN2UEn6Ou4sESgn5FdEHtf
	p8PAShrtHTHB6csQmwohdrCGnZnefFAZ1eTXPxgWB/tZWBzLbV5VkhksVFcFEX30rHLA5AgzFk7
	QJhh1USXlXW0EC2kXPruRxn2YIcuBrdV9lawdB1ZpNn4AWkcut1FFSCkapkSmUBxo5EVrFCUY5Z
	hLDI3WZd+6rctdlZWtNq2Eu0ULOt6YUGodlu13PRdHSNPHDpG7MOr29YG44Z3JttAbI9o0iJfu6
	+2YlobpTx/3BTfY7UPLBo7keW924dB3tUqYnOqYzycSFfrUlvzf5kCzSevPuvQNtNJmMBaYfWl2
	kWNB7Wm
X-Received: by 2002:a05:620a:4041:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cdaa7b6b03mr382866785a.15.1773317979843;
        Thu, 12 Mar 2026 05:19:39 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cda21346a0sm321675885a.34.2026.03.12.05.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:19:38 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0f0r-00000006esN-1WXU;
	Thu, 12 Mar 2026 09:19:37 -0300
Date: Thu, 12 Mar 2026 09:19:37 -0300
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
Subject: Re: [PATCH v2 4/8] dma-mapping: Introduce DMA require coherency
 attribute
Message-ID: <20260312121937.GD1469476@ziepe.ca>
References: <20260311-dma-debug-overlap-v2-0-e00bc2ca346d@nvidia.com>
 <20260311-dma-debug-overlap-v2-4-e00bc2ca346d@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-dma-debug-overlap-v2-4-e00bc2ca346d@nvidia.com>

On Wed, Mar 11, 2026 at 09:08:47PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> The mapping buffers which carry this attribute require DMA coherent system.
> This means that they can't take SWIOTLB path, can perform CPU cache overlap
> and doesn't perform cache flushing.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  Documentation/core-api/dma-attributes.rst | 12 ++++++++++++
>  include/linux/dma-mapping.h               |  7 +++++++
>  include/trace/events/dma.h                |  3 ++-
>  kernel/dma/debug.c                        |  3 ++-
>  kernel/dma/mapping.c                      |  6 ++++++
>  5 files changed, 29 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/core-api/dma-attributes.rst b/Documentation/core-api/dma-attributes.rst
> index 48cfe86cc06d7..69d094f144c70 100644
> --- a/Documentation/core-api/dma-attributes.rst
> +++ b/Documentation/core-api/dma-attributes.rst
> @@ -163,3 +163,15 @@ data corruption.
>  
>  All mappings that share a cache line must set this attribute to suppress DMA
>  debug warnings about overlapping mappings.
> +
> +DMA_ATTR_REQUIRE_COHERENT
> +-------------------------
> +
> +The mapping buffers which carry this attribute require DMA coherent system. This means
> +that they can't take SWIOTLB path, can perform CPU cache overlap and doesn't perform
> +cache flushing.

DMA mapping requests with the DMA_ATTR_REQUIRE_COHERENT fail on any
system where SWIOTLB or cache management is required. This should only
be used to support uAPI designs that require continuous HW DMA
coherence with userspace processes, for example RDMA and DRM. At a
minimum the memory being mapped must be userspace memory from
pin_user_pages() or similar.

Drivers should consider using dma_mmap_pages() instead of this
interface when building their uAPIs, when possible.

It must never be used in an in-kernel driver that only works with
kernal memory.

> @@ -164,6 +164,9 @@ dma_addr_t dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
>  	if (WARN_ON_ONCE(!dev->dma_mask))
>  		return DMA_MAPPING_ERROR;
>  
> +	if (!dev_is_dma_coherent(dev) && (attrs & DMA_ATTR_REQUIRE_COHERENT))
> +		return DMA_MAPPING_ERROR;

This doesn't capture enough conditions.. is_swiotlb_force_bounce(),
dma_kmalloc_needs_bounce(), dma_capable(), etc all need to be blocked
too

So check it inside swiotlb_map() too, and maybe shift the above
into the existing branches:

        if (!dev_is_dma_coherent(dev) &&
            !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
                arch_sync_dma_for_device(phys, size, dir);

Jason
