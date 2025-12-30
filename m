Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8D2FC881
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089804; cv=none; b=A9uMDiBIKTQdovtxZdBKQ6df2yGnCqEKRg/4EIFe5+AeJl8V5YBVZQDnyc5JVfWPjGtzLkgiOGVY8FPsgqd1ybclgdFGkfMbAdHjFhe5vLuxDD+Zce4bDuZB62FTm5wFMlClY+uPHAXkFloVHZ91NaDVVLIa33dD6XwcwFmcW0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089804; c=relaxed/simple;
	bh=RzxSFhz+bpkLtGdr/5qvrDQOf7DHug0oDxHEj4NfN04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9G4PUM1ua5W2oA72IrqHBSyzMcioXlX57GWqBkuZjojhRTUGN0zhkrSO1aZ/AxZjYAcWDeha2bHS8buSddvPUwrWn/PYnYL4z8wywmqAjxcVpoh3IoztgRCevEsmsu03jCfUg8i45gmzk0U5ajPePdO6ZhddVPrqYadPbG1ugU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A5w4BGLS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=A/hkwEx4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A5w4BGLS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="A/hkwEx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
	b=A5w4BGLSdgKyJQOE/b2Tl9OMRP2B2KqBoRBGHc9suPggEsM8XhqK9tPUaYdx2ebACy8nwi
	eJbdxWDYlWOQ8ueC17QbYWepkVGU6uTTPzs0RA5vp6wjxuOKlZWsmBgcmQqV6pO7t0WnkZ
	JPorzRo8rs0Mz4MTF9EM1CBl4x4Nxew=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-_xkK49NFMuek7ijgZ3qBVw-1; Tue, 30 Dec 2025 05:16:39 -0500
X-MC-Unique: _xkK49NFMuek7ijgZ3qBVw-1
X-Mimecast-MFC-AGG-ID: _xkK49NFMuek7ijgZ3qBVw_1767089798
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-477c49f273fso125585485e9.3
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089798; x=1767694598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
        b=A/hkwEx4WZZqbWGO/MKIo5PbfxAPOdcLiTbBHSaSP0SHg8S8cwWpKHuScFjvBz5LtZ
         dgnv05gLf1QD3b8feoewuk+ryDTDw8j6yHJeDklMZHC8r6zeYdjm81Ir1h7upjeGquqv
         QUrQerqcKtaD7jdpCwenPlnJLZ4Ca0/zGIsfxbs2cqoul+hR+lmjc8jXK/XKVsd5MdH1
         WX2jOAqrnFOZ2EK/DkhSM9CCYzK8dDDTjUha8Re4VFbih2TgwK4j5ZPARaR8idthYOiq
         YnmhyvNLtrrSxftR6dY5fGO3J/oV9LVG1+NYTKI+FwQtiZn88YIoywesqIICOHIBV1xb
         ZGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089798; x=1767694598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjCbMizY1BaJF5yBWOLXV7DyUl9vbunxYIEFqfWmhYA=;
        b=cP8y0jKQ2Xm/+14ULSYyf9RzzffZvJFOiNWnZSRZLThIjZXR0MtoIKa0zny1ZE+yW0
         o4JnvgxiqbEqjhKXqOU9v5BPq86Iz1l+RFnFt7upcOxwGkQhPJiXmWJtk9fCkI5H/kV1
         bHXpMHMFiuULqauMxcNyZynvvNVorAxJ0iwH0CIlqibW06yR0OhtyLAtmpCqoGfjGIOh
         Av4Z6dCy3fKzh3rtJcD9Q+uIeq6Ms2dP2le/GEE9xsE2vZjgxb0UxBIYdtSoVll0dmsf
         gr9m9JwuhVenMdAlplDhWL+OzwYzABK/KkaRK+ioUgus8X519rrQ7BdoEbd94YzUOJVd
         1NYA==
X-Forwarded-Encrypted: i=1; AJvYcCU+Nv6v3W48s84HZuxfYN4E6IOlBgjdr34/fnTH4HByZQJ46uSIa1XhimE0/U2BgxaoSaHLSsvlK1Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyznONHq8r6pegFf2Lzzd08BjgQIvQrBeuq02y9l2tTcNp1TBnI
	XkbXev1pKwlcXF0bj4AXzvMCQpODr1nJsVYEIFGxQYjVhF5uxdWpjjk8kiYqwaXNv3v/JGTOfUa
	QQlaucUQPNYKDice5HBbquo+/otoRbEUgSgoCTKhX/efiH3cXj8GAHhyQN/cvJQ==
X-Gm-Gg: AY/fxX6KXWigqMhj0rk/ubfnje3UY17Uu96RVmn9XBffckgxVKa+N6k2jBSt6zTjBhQ
	WdRUIONsvX0W7Q0Qb1WTHz6FHDnqpa6VKPEsaJ1Iy4UJZ9TOsv2QwBaksIMzMr7Ad8GOausJRYJ
	2cJHbM1/27VJYoEMdH2UcMy8QxHA5eW96RNYE/cWU9VRyxJUhbfxeJV4mamCgn0LqOWbaQzgQMO
	V+LK5vzvKgNnuSSoXicSOeSRjrmT5Q8Z1ol1zHT5ABsaXyWm5wAeeNpLDT03X/fsL4N1cPY7zz2
	GqTaYLtNZR8rYw8CZI3wOraId/iGpyP2pgQncivBfOoWUuYd3dc317i9gz8gSXoOgF7cc2PqlqD
	qliaJ3u7y6nAQuykSPEDcVVeexKKudBYIeA==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr469752645e9.16.1767089797978;
        Tue, 30 Dec 2025 02:16:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHj3WKIKEzUGPKu3zdwQlyOBMeOTgJhitK/YOLHPeOIUg2zxiErnT0jngxXmWGMEmg7Rb+0jg==
X-Received: by 2002:a05:600c:620d:b0:47b:da85:b9ef with SMTP id 5b1f17b1804b1-47d19569c23mr469752175e9.16.1767089797499;
        Tue, 30 Dec 2025 02:16:37 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be279c5f8sm610551235e9.9.2025.12.30.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:16:37 -0800 (PST)
Date: Tue, 30 Dec 2025 05:16:33 -0500
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
Subject: [PATCH RFC 09/13] virtio_input: fix DMA cacheline alignment for evts
Message-ID: <ba80d103c159a9dc36b89705e00f91bcff8857c3.1767089257.git.mst@redhat.com>
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

On non-cache-coherent platforms, when a structure contains a buffer
used for DMA alongside fields that the CPU writes to, cacheline sharing
can cause data corruption.

The evts array is used for DMA_FROM_DEVICE operations via
virtqueue_add_inbuf(). The adjacent lock and ready fields are written
by the CPU during normal operation. If these share cachelines with evts,
CPU writes can corrupt DMA data.

Add __dma_from_device_aligned_begin/end annotations to ensure evts is
isolated in its own cachelines.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/virtio/virtio_input.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/virtio/virtio_input.c b/drivers/virtio/virtio_input.c
index d0728285b6ce..774494754a99 100644
--- a/drivers/virtio/virtio_input.c
+++ b/drivers/virtio/virtio_input.c
@@ -4,6 +4,7 @@
 #include <linux/virtio_config.h>
 #include <linux/input.h>
 #include <linux/slab.h>
+#include <linux/dma-mapping.h>
 
 #include <uapi/linux/virtio_ids.h>
 #include <uapi/linux/virtio_input.h>
@@ -16,7 +17,9 @@ struct virtio_input {
 	char                       serial[64];
 	char                       phys[64];
 	struct virtqueue           *evt, *sts;
+	__dma_from_device_aligned_begin
 	struct virtio_input_event  evts[64];
+	__dma_from_device_aligned_end
 	spinlock_t                 lock;
 	bool                       ready;
 };
-- 
MST

