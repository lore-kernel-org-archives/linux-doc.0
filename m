Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4542FFDDE
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089808; cv=none; b=EaFQwhvZmGzDpdGAiBxBIvs3a0077k7vmoJorpmGgcleIFNf3BsAGxJYn56r+v0f0ZNDlrVQ9+eIA7ZpFDDAQhByz4MzL1Z8CqX36odADdjVkyczVjh0Ms7fWg97Yhr1bd+0D6QmGD0hl3OgAo1lY7TTwMa1t/lQoPS4BaI0828=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089808; c=relaxed/simple;
	bh=t25qf9RPlFFNCOYEONgor27ZqKrRgzzuNghNz/03y7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dc+EnIF+ShlZmwMI6toO+8L8n/5U9dWxSDPEH6Zp7cYsgh+gAF0ycL/ooBwqHHSn+Rli345biSEX7iegeyq0UMU2pRjVJ4yUJDrlXP5XU/ETpwvMkIByfkOKTZI+agMHlsVQBi/Aw9ssInZeW3NojESsJnChHVUexwgrHni78vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eMUs0i/C; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO31RtaE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eMUs0i/C";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO31RtaE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWhPgbCVUCKqyPHyev/7ivEXEOB+Fryu/YrpJpGLduY=;
	b=eMUs0i/ChFKlCNkVFnDmMUqUDZfA/1FlR6YjXwenSn+DJiTlvSYlfoOv8dhgv1m6vgo/c2
	70g/5rR5YQidcfVdaSqGZq674WPgf5JH+cNZ0H8Uw7uGIKMtjbuAJWWlAEideo+5gVSjeE
	IlsdgbMBZA45e6Cx5ra6i/XJGd5ufcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668--6nIHkHJNFWL9_lFz5Ec_w-1; Tue, 30 Dec 2025 05:16:42 -0500
X-MC-Unique: -6nIHkHJNFWL9_lFz5Ec_w-1
X-Mimecast-MFC-AGG-ID: -6nIHkHJNFWL9_lFz5Ec_w_1767089802
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4325cc15176so4557286f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089801; x=1767694601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BWhPgbCVUCKqyPHyev/7ivEXEOB+Fryu/YrpJpGLduY=;
        b=ZO31RtaEnbRwXI0pZvzk7MmrN6X1+J8FWRvLdtMprqkQxtlxzAaySEyLAPtuUG4ahV
         BBL2Cfzvzv5yMQ5FfEgrnrR1XMrzbiiLwHNSlU/RiA6N/JiLIVcUldUMPrE4veCkQEi/
         cOypKUHHdU9cRHuejX32Es47rs1z5YqfnBSAkipXOGs7Rz3Kddf5iIA6ZDHCKVNbBKQx
         7geuz1xOqix+CC4hB7szuvVNA2MOj6Z+CJe7yq5ya9yAiGvLFRYw05DzqI56EmKxcdmv
         g6umauV3bEm1g7SkR173wyFuK1+wh9H0DJzovyUrHoBeH31nGx6KsjzZaEcf12qsp+AX
         mWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089801; x=1767694601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BWhPgbCVUCKqyPHyev/7ivEXEOB+Fryu/YrpJpGLduY=;
        b=limhBh23cbYAqY8sZfn0w4k38pSggqNZWwDJT187uJw6UHem6VOv31XCXGwfHIRIkv
         kxDcMllhhGNZdOFVx7WBq+NxlAK+vBjQ77ZhDk8/PCb4Bf3c/Za9lUbEOgmYXSD9zOt6
         KHyx4Fi1V5s7UN3XLvuy1MnW8sXwnrb4Ijwu1otjr60hAoL3ewSNxTCXsAsGc/1/FCX8
         BITsYkWpHyfG4rWPiFKwMA2kPtAKu281tfzud93lFu/KZsZQJGtvSsko/wVbzNTf9yDZ
         cvt9iN2fVYJQ2wGWK4dHSXuc+pbkcJ9V2sp57XU0tGhsXF/6wH5VE0jVXSsNUIpDXuf8
         Ublg==
X-Forwarded-Encrypted: i=1; AJvYcCW/u14pJAd8gnbsCwVsvM4MqRl66+MxPVC4GBcvPFXrOVNTH50yoJZzeRq/hB/EwrDHkjrwgQh1rRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMFrL82U+HcNXGR0XpbY6hOxweC0wc47TKJ5TAXjf9YQ951/s
	LTqjUwu8LonLGyx4BYpli37h7DMeXMPmkOQ7ASY9WCCp5mqrGBBeg1RrD1ZfDeZ0wCxFW6qLhqp
	QthYh47FUvN1KAT6jG2452H5dV6IKiWtAcqbxuLv09yGVh/pK5N71TF5scJG1jA==
X-Gm-Gg: AY/fxX5oYlKDJ0aANTU2i+ubW0TNahOvhH5NWMsMnkV9BZn5ZnTF0MoXXOaSGxmjNLP
	0N+FgIFvXhY6oPs1g/P0TdshVggizwzKBMRzigUSqQ7YbIk7+5j86WXof006GNypScDojDTL0ed
	en/CZB0UxBYAvOGQczJkT4Q7E/yaPbCH4Bj6mUkVjE8ScyVzNw8YuJc+546IipHAsJTztjOm8Ws
	nR7LO+BmNIT7QHJVnXOWO2Uc5p81EwM3WGk6N3YwvImRsRa0hIcbivhfBO740J6R6YFJg+FNwv9
	x7vJsuR//+Wxp+nFCepFzt4KckAtFIRJK66PHvNK4Pg+CA8JmoSAHNSUtu+hjORboQgXnoi1Y0n
	Ed807FeQTAZxMFbx/wP6qLtCHDnmQOYdqyA==
X-Received: by 2002:a05:600c:a413:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d1cec8f39mr297842275e9.18.1767089801407;
        Tue, 30 Dec 2025 02:16:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf8BCC/QkGwDEfP5RddRZimNY2rmw3JwKmzFqtMOWIF8UhfXRlD/gfjFTVaD3LdsD6J0zJDw==
X-Received: by 2002:a05:600c:a413:b0:46e:53cb:9e7f with SMTP id 5b1f17b1804b1-47d1cec8f39mr297841845e9.18.1767089800959;
        Tue, 30 Dec 2025 02:16:40 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm610553745e9.9.2025.12.30.02.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:16:40 -0800 (PST)
Date: Tue, 30 Dec 2025 05:16:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Petr Tesarik <ptesarik@suse.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH RFC 11/13] virtio-rng: fix DMA cacheline alignment for data
 buffer
Message-ID: <b2e350ee2542c5c372b2973fb68d4fee67929d5c.1767089257.git.mst@redhat.com>
References: <cover.1767089257.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767089257.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

Add __dma_from_device_aligned_begin annotation before the data buffer
in struct virtrng_info to ensure proper cacheline alignment on
non-cache-coherent platforms.

The data buffer is used for DMA_FROM_DEVICE via virtqueue_add_inbuf()
and is adjacent to CPU-written fields (data_avail, data_idx). Without
proper alignment, the device writing to the DMA buffer and the CPU
writing to adjacent fields could corrupt each other's data on
platforms where DMA cache maintenance is at cacheline granularity.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/char/hw_random/virtio-rng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/hw_random/virtio-rng.c b/drivers/char/hw_random/virtio-rng.c
index dd998f4fe4f2..fb3c57bee3b1 100644
--- a/drivers/char/hw_random/virtio-rng.c
+++ b/drivers/char/hw_random/virtio-rng.c
@@ -11,6 +11,7 @@
 #include <linux/spinlock.h>
 #include <linux/virtio.h>
 #include <linux/virtio_rng.h>
+#include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 
@@ -28,6 +29,7 @@ struct virtrng_info {
 	unsigned int data_avail;
 	unsigned int data_idx;
 	/* minimal size returned by rng_buffer_size() */
+	__dma_from_device_aligned_begin
 #if SMP_CACHE_BYTES < 32
 	u8 data[32];
 #else
-- 
MST

