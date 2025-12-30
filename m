Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F3284662
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089756; cv=none; b=FYOt2Ky2b7Pk36UoCT1xZp0VCjejSOOAGVgSwa/jjAVlN/IDpo3crCDvYSLVH+TLvBQz5GHzTM1x2HckmL5AG0xbyZyN5B+hzz62nGsvxhQApha9DCkLT0D26nvnqEQTnXwobp1bnmQqP97lFAgAdu92a/MMY9gP1gSkCWFF9vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089756; c=relaxed/simple;
	bh=D8i5fx1UC1/6nmNgw58hQGeu+7fSwjalMhDNBy/e6FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnxeLuvZMhoWLm8+ezbZGJe/XHJdMc4Xa+NuA2jbWJ9hJdOUKTxMt6PIvjKffpP5edMdN/QSddfsZFCr4SJ9sz2O1OVBNg6t6S08K5QF1ElATEseD6e22rtsSVlHneL2gL/lsJ5ATy/RTYiYGjHF5YLfZpjifWz4GoRPQRvoF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gSkCZylG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e4sZk6/R; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gSkCZylG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e4sZk6/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HL5OM1OGVzMUVxTMh8EvcAcQ4aesQjltxTtrn5MVxlA=;
	b=gSkCZylG1ZqrEKBJfUt0mD8o0Umh+yupxPCi7dKfALjqGCXRXnGluwo4loO0pcZ+ZWLgZp
	wvZDtEPeWlzEcQyMiaEYQYQ5S+OAD9B6MEInBBOcm08JEDjR8WWqSsYF2/yTlFUUzFp07m
	P87jgHtjMxzGKFEE0gfDSFLt/aP76vk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-SjtNG636PoygZFQIjEVJKA-1; Tue, 30 Dec 2025 05:15:51 -0500
X-MC-Unique: SjtNG636PoygZFQIjEVJKA-1
X-Mimecast-MFC-AGG-ID: SjtNG636PoygZFQIjEVJKA_1767089750
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-477a1e2b372so77920235e9.2
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089750; x=1767694550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HL5OM1OGVzMUVxTMh8EvcAcQ4aesQjltxTtrn5MVxlA=;
        b=e4sZk6/RCGmihD7DRl0FPvrBMhX7FlCiK5jw2Ehcy4uyEkJDxBNSSuXCw+3H+s2kBE
         ErVQKx7Yv4v17Egvx4AZxXajguw1+W+IUVZK/qX6xQottVcMy5WGGE/kj4YnfceXDhP4
         z5LZEOGjnU5xDthLT0rcWUcUXSXstq9TRB4/0eGzwx8O2V652sedBSp0IoGeKWv95ThD
         tQwGj+oW3bom2TW7jOkejhzJqnTUDAIO++WNc6hSeUbncxMgBnghFQMnIZarDVPCd8Ep
         gRXzfLru+mP9vMTt2cqG+VxFBAe4/jhg3sX20/vDU2xDIgqoaAMlKQB+XbBZXnyKiceZ
         HGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089750; x=1767694550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HL5OM1OGVzMUVxTMh8EvcAcQ4aesQjltxTtrn5MVxlA=;
        b=evuo8W7R6j6wHDdOE158Nny2Q/OBTCgdRjYBrsT4Dm4CXQOF7Jvii1s0jp2ZkDYr0+
         Q8pX/N1KoYCvC1csIXUcoGysF17pk9P2zph56qW8Htq95zGgFUL8FCuLV1dec7RRDmZs
         8zWhHz8qgh3GL5uJj3cOqwGehmEsOHEH2aBW7h8t4DPFKZT9B2nin520vtzsQ+TYK3R4
         mpwxSVx013huzVMUW11fCuKZZLrwLhla2TJdfQ1DkjhdoPbG9bc+X25Az6IPvogrq37X
         /HaJh0ckuT5xvxKeqbUnYTnhW6Aow6ZeifQUsdzlnWHX0a/hoAjLq/F5AQeThqRxqnHI
         Br0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0cvGDoOSGCeF5giMa/Zas1uCVJQkuHPedWX054rSLW/18Si4m/tHHpksBUsHrhd1H4LeplwXHoyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwVVtnwnNUe3ZrrPwAst+0v1evoa4C6/rk34lIuUadtcNJdDil
	f3w4iqtFjBvkZT9jZcPa8Kp7fU46H3QHkHBWcB3U08xgY7bLLWdyFwDpUL+QG66FXjzX6puDmQP
	xWu52qjSCqnUkzbtJV99UO3DYNjoZI52g0pyq+lwyKYjJMmyizUQQGgTcTV+pFA==
X-Gm-Gg: AY/fxX463eG0qbyj0XydotLnofKKiACPExsyDvQHQ8eGuqmMQAhARz/Xf+Fo1T1Tcfz
	6sABmG+IFKymOMXEarU/pOR2BSPpAARMOB1523dGbnP6+iogCg5aVJUAWOAoKGDNv86ygtG5ywW
	rSa7HzydRjt6a9vCYi70jDtiq+SA/0YNpOijQ18IzYL/Bic7C1SfAtwwj5JAke+IfwK8xDD5Ez6
	Valt/MyLgCsXnwgXM1KEN6uNSIjbwU8qYnp47RvZ2Ceyjg+qwEoV/fcxNI6mGabfzxITvVFCnC4
	Mj+CqwoKO9uyK4K1HQo71HBhyTITX7xphn6/Di0BF3uqWcFxljhF0mBZawFqHoeymHHAXISoiY+
	g4x174oGJCGUwkJHj6pcvdBG6tgcgdKAJoQ==
X-Received: by 2002:a05:600c:8b8c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d195aaf01mr352297055e9.35.1767089749985;
        Tue, 30 Dec 2025 02:15:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGA32W4P8fpeNgmYgRIg4EUZ5pS0m5VtW0uNekoNCHVjCXEfha8FeJZQUcsP4e9hP9jnxKeEQ==
X-Received: by 2002:a05:600c:8b8c:b0:477:af07:dd1c with SMTP id 5b1f17b1804b1-47d195aaf01mr352296575e9.35.1767089749551;
        Tue, 30 Dec 2025 02:15:49 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193e329asm588350835e9.15.2025.12.30.02.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:15:49 -0800 (PST)
Date: Tue, 30 Dec 2025 05:15:46 -0500
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
Subject: [PATCH RFC 01/13] dma-mapping: add __dma_from_device_align_begin/end
Message-ID: <ca12c790f6dee2ca0e24f16c0ebf3591867ddc4a.1767089672.git.mst@redhat.com>
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

When a structure contains a buffer that DMA writes to alongside fields
that the CPU writes to, cache line sharing between the DMA buffer and
CPU-written fields can cause data corruption on non-cache-coherent
platforms.

Add __dma_from_device_aligned_begin/__dma_from_device_aligned_end
annotations to ensure proper alignment to prevent this:

struct my_device {
	spinlock_t lock1;
	__dma_from_device_aligned_begin char dma_buffer1[16];
	char dma_buffer2[16];
	__dma_from_device_aligned_end spinlock_t lock2;
};

When the DMA buffer is the last field in the structure, just
__dma_from_device_aligned_begin is enough - the compiler's struct
padding protects the tail:

struct my_device {
	spinlock_t lock;
	struct mutex mlock;
	__dma_from_device_aligned_begin char dma_buffer1[16];
	char dma_buffer2[16];
};

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/dma-mapping.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index aa36a0d1d9df..47b7de3786a1 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -703,6 +703,16 @@ static inline int dma_get_cache_alignment(void)
 }
 #endif
 
+#ifdef ARCH_HAS_DMA_MINALIGN
+#define ____dma_from_device_aligned __aligned(ARCH_DMA_MINALIGN)
+#else
+#define ____dma_from_device_aligned
+#endif
+/* Apply to the 1st field of the DMA buffer */
+#define __dma_from_device_aligned_begin ____dma_from_device_aligned
+/* Apply to the 1st field beyond the DMA buffer */
+#define __dma_from_device_aligned_end ____dma_from_device_aligned
+
 static inline void *dmam_alloc_coherent(struct device *dev, size_t size,
 		dma_addr_t *dma_handle, gfp_t gfp)
 {
-- 
MST

