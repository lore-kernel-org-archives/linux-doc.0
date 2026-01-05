Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5043164B7
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601391; cv=none; b=uObDNNDNRMJqfTDTsx+qPRrEj9mx0YAYWiMBammUOICSVtOisp9JGn92OF8tgWOawyOKgcXldD3yrsAlsCyjZ8IlY0XTormSEYvW9ZV9mxtgz/6zckD/2UvSTGOa+njqlFBgjZRb4+hCi8TCn5ZGNTUMI8XnX37U0/CcGDMNgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601391; c=relaxed/simple;
	bh=IXDkDZtAt0m+aQ314vUNmBOnLJtrDRmmzuRNBy60P98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYAYoArhOcjCg7OaT39+KnH36ltsBpJQSCcHZ8G3XtKvTE0gvh61eit3kcfSOjplqwD2H/chse8WhtoW0GOaaPxuUEoaAPuF/v9R5afacyD9JT7gMjAxFZacoeE6+cZvBVfxQLGSp3NDUONJCWkALBQO+bxY4UMG7babN4tfNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AEBaeALe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SVLy5NLa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AEBaeALe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SVLy5NLa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1GET0dQPIEY4INQeC72jj/1xpmrzV3mfvZ6nPpr/HKY=;
	b=AEBaeALep1zaNbb0x0/0n6NT1Y1yen9lZPR5QYlhYaryR+slD065Hydx5X+LHnUm4eUQ40
	VsnNwXHsVoJeAFuMARDPi/7suOmiuEbeUE7BrqGpulBIrlIdhNRbHBmcn+ZpbA+uWUT/GU
	NDS4V23B7nFdBRCQcv7uCdN8wAaJZOM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-ipjKZ53kP-uOyq8HC199aw-1; Mon, 05 Jan 2026 03:23:07 -0500
X-MC-Unique: ipjKZ53kP-uOyq8HC199aw-1
X-Mimecast-MFC-AGG-ID: ipjKZ53kP-uOyq8HC199aw_1767601386
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f5dso41768065e9.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601386; x=1768206186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1GET0dQPIEY4INQeC72jj/1xpmrzV3mfvZ6nPpr/HKY=;
        b=SVLy5NLaTRyVFdHdGzEjHMfGiKbc6I3fmsbr9lm1E8b1CKA/LQPCgjNjlWxIeHOo5k
         TCyXSslVxjf4VZ9QOe/s6tO2/Kwb4Jh6FbN2yQg8JaYMQ5nfvPhs0YO+1lEDBjqdTmKK
         nogzUqEH4ucYBZ2zA5lSaWV6mg4RpJBvIS8ASAcegaSwnPt7qTWgY7Miod5DsRDAoOYV
         UepvtMzbzwR8LaO4yzzJNvOZ4N26154q2EDHSSzoxcZQ6NqYgihrX2umzlfrkKx0+K3x
         VdkBYb/Grc6tgqNZeOLw5aG2S93fmuUJsNF5Da+4flx0dpVDTijlOJSLPU0HOTBDzlrv
         QX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601386; x=1768206186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1GET0dQPIEY4INQeC72jj/1xpmrzV3mfvZ6nPpr/HKY=;
        b=PltMt6pe3rh01GHjx1/Qxbv29pjPa0Ylzq9a7txFaC4k6pjmVVqNciek5wA2mYcjkf
         ud4TVs6KbFj1wNtJJwbb283l5FjLS+mgMQVLNCZqalCF+Np6hpfG1K1ZCcs/ih4JSptZ
         AbX3oy8irTlVvJ/bRVsUmYogfrcSaqCe2wLe4Wr0ZfFAiiODZOOBrD4fKMwE6amLmXAh
         nTXW6REZ+dm7gKvY4rNoFJOtnxHWqBc3GBlimnVp1wj2Fn3QTZKEUzHb7rdX/bMIGcr2
         M50bWdOqQobRd63q1xiIXOtIjl2E9/2m11o5pRH1ef0gKOhaks4+cHHVuhyVhoUD+zkm
         e5zg==
X-Forwarded-Encrypted: i=1; AJvYcCURITP15BtRkkY0x0O2VfubBxK3XDNUYCB2z5KvGt6qIptmk1X6VklUnKyOupE6qwCmAqHwPUuFeIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxTozF704zPIb+eqBpklqjPsVduDINJonz8IRtMhUH1hCPgyy
	j8rZeYEaaWy13nXfEe1Foc0+KukLvrH1Y61o+SONrGrFEX4UQpsXxpgq10/BF9NcEPuAmtgj3gs
	euUclUwDIyUgXWrzOP/7RreMjSKAPqSLyt8AuuKQRdUowlmiVUNsq5TGj8ME6IQ==
X-Gm-Gg: AY/fxX550q/BhZCBgWbAHQ9fbpUmn2eO6G+/c4EabwWweupUONpiEgjzb5ZQAoUA6QC
	BFgoVWK3pItuT5lmBYoW8gLw5RZ1YRUBubBGHn/8cJ1upzaklDGcTSNorfaEeonIWcujvZLJMIx
	6Zt/HvRMrSkXwpb711xdpXwxE1fF2o+N8LUOcGyHiMKDgkTI+3J9c/I7gB3u/tSqJ7SHuyx/c39
	gJpOFVis+H2X2voHMVpm84kCxG9ryJsqtfnuHe71uEGxvsDiBwaqQOocCmgqEYYnvcdDNP9LnOX
	/ImMuwEzmk8Av1P3ggv8w2mc5q/gXO9MgFfO8jiOD6lN5d7Eb8+r70LEqrAZH2EeNfwyB27GEIx
	kVaV8vyWQMqCLubsIB1lw2WpEnjCEE9Dwxw==
X-Received: by 2002:a05:600c:8107:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47d1959441fmr614821505e9.33.1767601385781;
        Mon, 05 Jan 2026 00:23:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFFnRSrw61tFPN3ingmu+tnGwj19lkkHlcV8EUdBq7ZpNk54zAQl+NVy05hzMsFUOEhZ22F+w==
X-Received: by 2002:a05:600c:8107:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-47d1959441fmr614820945e9.33.1767601385198;
        Mon, 05 Jan 2026 00:23:05 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6c0a1d89sm52159655e9.12.2026.01.05.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:04 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:01 -0500
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
	Bartosz Golaszewski <brgl@kernel.org>, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, virtualization@lists.linux.dev,
	linux-scsi@vger.kernel.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 03/15] dma-mapping: add DMA_ATTR_CPU_CACHE_CLEAN
Message-ID: <2d5d091f9d84b68ea96abd545b365dd1d00bbf48.1767601130.git.mst@redhat.com>
References: <cover.1767601130.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767601130.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

When multiple small DMA_FROM_DEVICE or DMA_BIDIRECTIONAL buffers share a
cacheline, and DMA_API_DEBUG is enabled, we get this warning:
	cacheline tracking EEXIST, overlapping mappings aren't supported.

This is because when one of the mappings is removed, while another one
is active, CPU might write into the buffer.

Add an attribute for the driver to promise not to do this, making the
overlapping safe, and suppressing the warning.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/linux/dma-mapping.h | 7 +++++++
 kernel/dma/debug.c          | 3 ++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 29ad2ce700f0..29973baa0581 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -79,6 +79,13 @@
  */
 #define DMA_ATTR_MMIO		(1UL << 10)
 
+/*
+ * DMA_ATTR_CPU_CACHE_CLEAN: Indicates the CPU will not dirty any cacheline
+ * overlapping this buffer while it is mapped for DMA. All mappings sharing
+ * a cacheline must have this attribute for this to be considered safe.
+ */
+#define DMA_ATTR_CPU_CACHE_CLEAN	(1UL << 11)
+
 /*
  * A dma_addr_t can hold any valid DMA or bus address for the platform.  It can
  * be given to a device to use as a DMA source or target.  It is specific to a
diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 138ede653de4..7e66d863d573 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -595,7 +595,8 @@ static void add_dma_entry(struct dma_debug_entry *entry, unsigned long attrs)
 	if (rc == -ENOMEM) {
 		pr_err_once("cacheline tracking ENOMEM, dma-debug disabled\n");
 		global_disable = true;
-	} else if (rc == -EEXIST && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
+	} else if (rc == -EEXIST &&
+		   !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_CPU_CACHE_CLEAN)) &&
 		   !(IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
 		     is_swiotlb_active(entry->dev))) {
 		err_printk(entry->dev, entry,
-- 
MST

