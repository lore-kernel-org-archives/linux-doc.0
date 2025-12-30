Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E6A2ED175
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089791; cv=none; b=rW9k1Kk5h+2peE4mGDWFH/Y+aAl8yqsR0Azl0CLi+enl5vo4miYoPJZF5f2ktm6GOPdjvJHUuWSFdnhTjrfZhA6tdxerFBHrJw1ezrJe/LMxe6yUVGYWQVXmLsZ4PCFpO7vK7BuL7gceMwEyJ53+fpSyALjYih5nZzo+sQiw5gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089791; c=relaxed/simple;
	bh=7vYhvTa0EsKkdKbYw4kgKH5spensmAuucNSR/pooHKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYy+TZ0G4VJNZwng7KjVygXhoKqvqljk8Q3ubJJ+K7HwO2BslnS/92xpdqOp9X3XSJUiZrqnqufjc5vzPr2vTxJLCgdgdwIKn1kACcdHe0behfKxIkdPnLEUMglSgx+9AW24qKLHX4UQWxvlSpJI3tv2LdptH0aMePURW4yl70M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pu28dPwL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=dFhz12Ug; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pu28dPwL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="dFhz12Ug"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OZZOSut1u/TDBTxePQLgpeDsLzuX17NVLcEs6Y0hRck=;
	b=Pu28dPwLkQyY/fepeq/6f6wV1tJXIt27CyXrQL6+T/OQd/dYPessCswlz0urtroh7qqR/L
	NTa4KlhUaL7eLRa5AtliUTs9uPU7YYV+xKbfDqTOqz/yrNOg4NICR2A7r6Re7y/tp2lUxU
	fjxkLbBlGWetPmFtwlegjkf0jDDShqY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-BExYz4UHPkW3wMcy1cypyw-1; Tue, 30 Dec 2025 05:16:26 -0500
X-MC-Unique: BExYz4UHPkW3wMcy1cypyw-1
X-Mimecast-MFC-AGG-ID: BExYz4UHPkW3wMcy1cypyw_1767089786
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4775d8428e8so82531265e9.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089785; x=1767694585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZZOSut1u/TDBTxePQLgpeDsLzuX17NVLcEs6Y0hRck=;
        b=dFhz12Ug/OWVkYDk0VgCwy+wOITX5FT740qMSI7RgR9EDDCDueU2BMbotXr76H1Jij
         jaUbxvXGn1awYNvA8QnVEQAANvjZ2V5o8zkkCBOUVD5MM6z5F92//KMTs8S7HhWefoGU
         HABYKtlPOZsKWJy2pUH3NPNpUbSIY7YCdV2loIcw3+YOtSlFA5OSYOJp6O9Uz86BDn6v
         9A3suQnWG6Ag7SgKD22SXeKFErEYhrxikN+BBb8gtsAD2Mht4DtESRNd+w5H+DgdboKJ
         4BiNpcBTs3cJ79bHylP7GxhNP0UE6igCwVAjF5ViY5kdQg84abWlqtl0pO2a5GTdFkbg
         QbQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089785; x=1767694585;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZZOSut1u/TDBTxePQLgpeDsLzuX17NVLcEs6Y0hRck=;
        b=KybZ21cdY4n/mdS+21c8E4AOdntTNedQSLKq+UkzIchSt7QOvduknPNHIvFU4Jx8aB
         FHU7+aKMSimJ+z10VYfVYrArjaXJDss66jsUPSCSwRFWCpioNu4ScQxFwaBJq5gnUjFc
         hZd+XYbUaUwvn159RK4+dTSknC83m+9PZDMK5AC253oLI84h7wUzkwdvRYl8OgFO07iW
         cI0d3ULLkRZtpb4ZgKyIkcWcAAN+YptKtamewsO5HvDPkTXR46iIIL/VNy1mN1DCA2vE
         oJK16tJ4Cs/Scm7Q7l0GL6BjVdTfiVIXiTZE76la1XUVyhAYyZkBbDemuqXz86pWX0sX
         Wyrg==
X-Forwarded-Encrypted: i=1; AJvYcCU22OsiSDUXqNjea7AiSHuHUR0uG+DQbSaSYFf6J5I97Mewu7Sy7xqwFbWJxDWpCKJnMMOwxBpJcTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJGFYU+A0STPq8Zaid0u3x8dMLULDSb7QyusXhcL4YycFhUG5I
	ao3EH2+kmKba5dx5dKKlwibq15JAz/ANFnsObVd3SDj/6wDNL9tsBlnh0EBI56r4Zdfb3/D1ciE
	a1ruhhMANjC9XrbQZBNtFBzxq55pyucxtqhEYjUSR47E8A9AwspbEUfoiLjN1OQ==
X-Gm-Gg: AY/fxX7me1LRBOZClpbCa/+aKebnK9DlJiB/RgAfXUXH9f5sOtXhX25O2TyEC9hjB05
	gPS9yoK2D9QFV4ELpzQQdwz9SFhn6pGjz8DP9R9KVogL0uA6WKVwJz0aYZ1yrGJ7HQ287dUx+gx
	Fr4idbvjJrNFTbNEhcBtPCPNNSvffwWUKayfLZju7fkAPu9ahmWg2oZz+8ebzqAvkQ74UE1/7I3
	U2LtMP4CtnY0hPr8PJzcKnD7oFDAZg+Kvu+vpJ1n9x2DpRAKrEA1WUvMvHhNGIJykBHRPOuQCzW
	SUYaDD4fDoVXr8rZjCSw/iFVhJ22Bgl5W4vHUL/EBafnJnzmaevtOtxdz1ywSvt7xKLAOq1ThnO
	DGYJ9U+0BhZNjqG32g4do1b1mJvcmDajHeA==
X-Received: by 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d195667d6mr373409255e9.10.1767089785439;
        Tue, 30 Dec 2025 02:16:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG01+uSPzH44CAd+66VyYkAwuPn/pb8j51wL1G42pmMr4duS4CHLId/Zv5CUmzKtGwuKnJahg==
X-Received: by 2002:a05:600c:608d:b0:477:93f7:bbc5 with SMTP id 5b1f17b1804b1-47d195667d6mr373408995e9.10.1767089785008;
        Tue, 30 Dec 2025 02:16:25 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be27b0d5asm646323275e9.13.2025.12.30.02.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:16:24 -0800 (PST)
Date: Tue, 30 Dec 2025 05:16:21 -0500
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
Subject: [PATCH RFC 11/13] virtio-rng: fix DMA alignment for data buffer
Message-ID: <318c48915a52f1739c23d46b2b99e3a51c7139de.1767089672.git.mst@redhat.com>
References: <cover.1767089672.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767089672.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

The data buffer in struct virtrng_info is used for DMA_FROM_DEVICE via
virtqueue_add_inbuf() and shares cachelines with the adjacent
CPU-written fields (data_avail, data_idx).

The device writing to the DMA buffer and the CPU writing to adjacent
fields could corrupt each other's data on non-cache-coherent platforms.

Add __dma_from_device_aligned_begin annotation to place these
in distinct cache lines.

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

