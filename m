Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D822258C
	for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767189730; cv=none; b=NII2kkjcFdpdR7Gx7UfwUoEBI52s3wbCkXvL1XC8SHg3xhlJsD3Yk2u5xqmhlEm6psHW2C/QyJJAth+VMq55ffcfU0NhtOHEq+3x3gFsWH2Gh7Ft5+aWE+DO5mn2VXsk2wamnx2SXStIjaHOVgL/RkZYt6ZUaP3FuK7mC7vpLaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767189730; c=relaxed/simple;
	bh=4Hf8qGAfIDnMbElA9BV7uSYKEWjXXxN6zt+BgVtPhAs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g2uJWV84ss35QGfqPWi15QqDztoFvJHD6ltnzP4vcFYItFzGD0CFJWrRrhxCYGRyC+G0xQ3dsV5iHAWgTtFTJLYIwY49G/nklOogAPgUoiVX4+E61hSxvPuJ+L3BaZZW4wqMau5afTYWw/1uzVhVnDFP2gpoQq5TxogrHGO814Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gA/l7T2M; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gA/l7T2M"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4779d8286d8so7479015e9.0
        for <linux-doc@vger.kernel.org>; Wed, 31 Dec 2025 06:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767189727; x=1767794527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kF3B5IdjLDGAw+kMK0g4LlwArvDLn5Kmbe4r9Q45hmQ=;
        b=gA/l7T2MQmfHuJbBgTZPKTcooq6D7Sw8kcIAK8hGnp4Q463ay4taxSpggsDtS1VI+A
         e5XwZoyFKZdeq/X2mQmhodBu8eRVZQOx90SnjwsWmeSn1jrAX0TlMnvJXeGCsnwH1mxu
         Y60YMyOF/QqNhN4K5UTsctc7jQxc4hphluXy3JIFo7VeeSi+dZKupLqsZ9mefOSpu7PT
         o7en5wDu7SpsF5TN2g48AgSQRuqW9eRHWUroB/RxV0bjBznIFYXtsac8Op45136WZC3P
         NKy2LJmO0JmTeKaszcXwhdRkP6tE/NjbRIsEFqLL3nlmJIuvkJap0X+XyI2cUI4f3ujx
         72mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767189727; x=1767794527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kF3B5IdjLDGAw+kMK0g4LlwArvDLn5Kmbe4r9Q45hmQ=;
        b=DfUl6R12l7dpN3N4h+oDtcprMflwLmxZYe6TqKmsfe/6Qp7vih0/XJ0YzflBnTkeqr
         LJCXupHyeLiTVsJDR7/P9GGJnf686xra5tLLA2P5XQCtNZb0PfDbH6Pb4faIgTw0EDVr
         C11nNwXxcseGKXMOpURY5QU2uzeExtlZPC2JDTHksxfoWbe1wrTcCvo914pnMvCw2xfb
         /IO8zaykbn2fuQe3d+ho/S8dUW7dVicBfoOaME8SMou0xnhgJzsZHH8le81X/BNqBoal
         FAMB7N+i5c3qzSxK3B9fJdijUhjaSAiruhRfCA0jteG0QHqFGLC3Lgi+XOpcDkUHVQdK
         Am3A==
X-Forwarded-Encrypted: i=1; AJvYcCWYRfojZMiQ8LH7iFZoebMD0WpoMhsuYscD8Jfs7qmeJC0zjmwVv581PHESShm3N/tYrDWxgujRoww=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUI/2tNMwP9e59nAuWkm/PlytO7nc4mgfv34k39dFN22rwJD0V
	at6feaziR18BueUH5qGHt80YV1svUeyDCOul/wFWbLFdV+HepeSaz1g1Peb5R/lbS9o=
X-Gm-Gg: AY/fxX4JBQaZMBU2dF3o4lsGZFVsh8GhOJBMLgKoLcKEtVYi53bAj1TaAe3OkWmzyfC
	ER2CDnY7SCiDJGeHdEBCRSX1NfVgEvOO03X0Rkf+dcZd11uP4qY6zLO2zzQGzKFCWwdZ92yWWFy
	5WcymYNofxX/S8K6aSjJ/0woXRu4Z1fzgZ4BBzMqe8y42OkquuKRlQMsH4UQSuq0ZdnC3r0Z5ZX
	rtue6uj7EyVbY45Q1sqjHsWZX20B7x7EjSu0WUfWcFvlK9ucLkAczMKowL+KLC5TRKSKexMjyHR
	L5EaBl7Kcvgmg3e/QmBxkCTnlZyqJUgGuTiRZHQpxlXwULe1skhiCwNs02NYVwCv7rKPYq/XTDk
	BMbqb+RruuTpYfQmJ83KJbZWe2q2sKuPqgAP8I72yABTy58yiVEXT5zJGgsoK0/jW261qHDXN0t
	B60kdYzL+KB2Bmw6RqTMyqGED3jLBlHbbjUgkSLV3RtmpEZ5KrXhA5A3X/SKNz+NQCxMsom1Zaf
	lse
X-Google-Smtp-Source: AGHT+IE0s0lyU5FbbMJZMjZzb/JdJphgG95YZRZrXFcSa/kp+KRPaXRAnUQjMNNmxS+JnzgO7HwnTw==
X-Received: by 2002:a05:600c:4fc6:b0:47a:94fc:d063 with SMTP id 5b1f17b1804b1-47d19538e2cmr221697055e9.1.1767189721959;
        Wed, 31 Dec 2025 06:02:01 -0800 (PST)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm73767887f8f.40.2025.12.31.06.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 06:02:01 -0800 (PST)
Date: Wed, 31 Dec 2025 15:01:59 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Olivia Mackall <olivia@selenic.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Jason Wang <jasowang@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eugenio =?UTF-8?B?UMOpcmV6?= <eperezma@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Gerd Hoffmann <kraxel@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Stefano Garzarella
 <sgarzare@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Leon Romanovsky
 <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
 virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
 iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH RFC 01/13] dma-mapping: add
 __dma_from_device_align_begin/end
Message-ID: <20251231150159.1779b585@mordecai>
In-Reply-To: <ca12c790f6dee2ca0e24f16c0ebf3591867ddc4a.1767089672.git.mst@redhat.com>
References: <cover.1767089672.git.mst@redhat.com>
	<ca12c790f6dee2ca0e24f16c0ebf3591867ddc4a.1767089672.git.mst@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 05:15:46 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> When a structure contains a buffer that DMA writes to alongside fields
> that the CPU writes to, cache line sharing between the DMA buffer and
> CPU-written fields can cause data corruption on non-cache-coherent
> platforms.
> 
> Add __dma_from_device_aligned_begin/__dma_from_device_aligned_end
> annotations to ensure proper alignment to prevent this:
> 
> struct my_device {
> 	spinlock_t lock1;
> 	__dma_from_device_aligned_begin char dma_buffer1[16];
> 	char dma_buffer2[16];
> 	__dma_from_device_aligned_end spinlock_t lock2;
> };
> 
> When the DMA buffer is the last field in the structure, just
> __dma_from_device_aligned_begin is enough - the compiler's struct
> padding protects the tail:
> 
> struct my_device {
> 	spinlock_t lock;
> 	struct mutex mlock;
> 	__dma_from_device_aligned_begin char dma_buffer1[16];
> 	char dma_buffer2[16];
> };

This works, but it's a bit hard to read. Can we reuse the
__cacheline_group_{begin, end}() macros from <linux/cache.h>?
Something like this:

#define __dma_from_device_group_begin(GROUP)			\
	__cacheline_group_begin(GROUP)				\
	____dma_from_device_aligned
#define __dma_from_device_group_end(GROUP)			\
	__cacheline_group_end(GROUP)				\
	____dma_from_device_aligned

And used like this (the "rxbuf" group id was chosen arbitrarily):

struct my_device {
	spinlock_t lock1;
	__dma_from_device_group_begin(rxbuf);
	char dma_buffer1[16];
	char dma_buffer2[16];
	__dma_from_device_group_end(rxbuf);
	spinlock_t lock2;
};

Petr T

> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/linux/dma-mapping.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index aa36a0d1d9df..47b7de3786a1 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -703,6 +703,16 @@ static inline int dma_get_cache_alignment(void)
>  }
>  #endif
>  
> +#ifdef ARCH_HAS_DMA_MINALIGN
> +#define ____dma_from_device_aligned __aligned(ARCH_DMA_MINALIGN)
> +#else
> +#define ____dma_from_device_aligned
> +#endif
> +/* Apply to the 1st field of the DMA buffer */
> +#define __dma_from_device_aligned_begin ____dma_from_device_aligned
> +/* Apply to the 1st field beyond the DMA buffer */
> +#define __dma_from_device_aligned_end ____dma_from_device_aligned
> +
>  static inline void *dmam_alloc_coherent(struct device *dev, size_t size,
>  		dma_addr_t *dma_handle, gfp_t gfp)
>  {

