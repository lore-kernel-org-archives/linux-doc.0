Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AA232AAD5
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601433; cv=none; b=i5Zna1UDA2ZA0MBrDKppjt3j61lTAQt/+4kh3unpQinOxZglHOvM7kXW2ovBAyRnvMIZty3sM3hEvnIFvR5diGqIzqqJpw4wmkGNk5HHAyYj94KQ5RpD+IujJsdtrJMj49a7YG5+xqgHjEOr+Ai6OoVvuNfSTElqj1UrJORwLb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601433; c=relaxed/simple;
	bh=SZ7yoG8PLS6oSz/uClprybkzflRSWBjZBPmgt2pUyWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8gWJpuJyt90Lae/JT8zh1s6I+vqg9lueKi4TGJvYygYC8bQNoywTTwHXcHGsqxJQYACLesaiibi1lItj3JLrkx81Trcm7PL7kL6OX2RqjeZOCWAeDqxiF82y573vhQgSbiiCTG/ZP8aeUxOrfCjRirR9A3SWYbi5+x1oOGRcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Io/btUN1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qtt1gD9p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Io/btUN1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qtt1gD9p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UCCLeq+lwQP+R3LKzuvNuhkNhAmceABICngBBmDYRE8=;
	b=Io/btUN14Pz93JGjiSMLn8JU4k3jep6SAudvCUMDNbgMvcAm2YiJl2peavOlnsbE3tNs9W
	RS3bNAH4RsEwQR5x43TvQxfxwUrHlRmlJ0bniPMQ/RN82e8xmwbFtqQH9OiNWkEoxz9iEz
	H9Bb+vvTkYL05LQ8Dy1BccJ7DxXDg78=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-RC0rcgZxM3qNGysYmG1MXw-1; Mon, 05 Jan 2026 03:23:47 -0500
X-MC-Unique: RC0rcgZxM3qNGysYmG1MXw-1
X-Mimecast-MFC-AGG-ID: RC0rcgZxM3qNGysYmG1MXw_1767601426
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d62cc05daso23271955e9.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601426; x=1768206226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UCCLeq+lwQP+R3LKzuvNuhkNhAmceABICngBBmDYRE8=;
        b=qtt1gD9poIHpzjauiXtVKb1u88sTn7Wwbfi00HKlGMPnuFWOhzi+vYbAQiA6E+/QOy
         KHA1rws1YgxHL3D+ZGXGlsplhJBj1Xcxi0JKkOJ4sFAjpsHNb9ZS08H9jbEmcnM7vZnl
         RK7P3fTatZ/EWpjeFzLDDJoZL+87zOa90w7aj72Had0j0ntALOHFkMwbzOKcchnCq0Av
         wmwv/ZZjPGhAvvLs19IXb29uwOB3Tm5qZvnBmugl+i6s4BeM6sHQCR5u7Czf5RCGzkYR
         jHYq07piUzqY53pdXGmmnXX4TXosiZaYUteYthXVUIuM2Fec/06gqy85cfBDx3zAqzHe
         jckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601426; x=1768206226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UCCLeq+lwQP+R3LKzuvNuhkNhAmceABICngBBmDYRE8=;
        b=sBsxleix3+WXnqELku+DYHGsX6JKEKBdRrdU1TOe7/MjStOxw31Bz9n7mAjgu5wBYe
         3BxjUhj2EoTn6FLuy9R46TXzXn4NdWk3jrClRX8ft1/JlbaVi5t7yb00QSgGGLOI8kRC
         4TnOSS3+5oUujLvoEapHlO8woCx5WYIvnDQowCGa89sRSaOPl9C9nKtOtYjiv0YRr2ib
         H1ZPoWhVGbuYFvP85dhI5+B/6GRaXXldc7UymE/5NNtoUcfXxuH7P29lLkvSpTtQL06f
         Fb24s7tnIVy2+guoefXKQ2vwRri0CrS57ApIbZ3921KRGsgV+WKNPCyq0ASzNzCW02i+
         x1FA==
X-Forwarded-Encrypted: i=1; AJvYcCU2sEay8yWQIEpuz7f4WQ/odP8F/NhcXH8inb1yvoQYCfqyxwz+viIMUcyO8cIF+UV5WpiYFTqm68k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0IorsDcYWHFZgxhrRpT5qLE3uccLYnYPjeCOYQBie5XzbV7SH
	j1RrYMDxiQn2qaoioeXrmLreO7ulSqFkp3EdW70x+xivUAlNEKBMXo53txoPW2D0ABex4DYjGCb
	3Dnx/c4YrNg9dBxm0bqfwHfEmbg4xrhKMhvaoEZv8q9D069WGio8Ujwd0NZE+KA==
X-Gm-Gg: AY/fxX6zo0LgISEAUtp5T/rTSu+ncPWxyQ4oF7JB4YCrnNInJvfWTm41d3jPPcG4a0M
	/38EoKa2LOiamyV/JRAqPH2gFhgzB28l7Ogl4CiX5qzdNHf0XohX2Lw2R3KsfTby4Bfcs4aFFyP
	yk7U3e8zPU2NXfNz0lmoJ7xQB6cG1PpvmXRkoH3ap7wW4eMrxfl91UKlhr2Jq8n4FTHGjpEOyWG
	a2KJgrQ/MaimOVfpqbXwExHnwmb+K2OcKxGfZ5PBavQRdQt4p9A8Qgq4E71X4np/kYJFALkFcnh
	18eJ+7Be48eegpOrCRaugfcrhYIAAyweFazZmEChIZ8i2jxXoZlQSllBDEJlICGR4UPGKtvvDEi
	fIjH2apXOnIhVeqKDkDNMtn0uc3TGW2ohJw==
X-Received: by 2002:a05:600c:6287:b0:47d:5dae:73b1 with SMTP id 5b1f17b1804b1-47d5dae7628mr228845935e9.23.1767601425888;
        Mon, 05 Jan 2026 00:23:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF11RG7JP48/6nhX1x0r6bivcNnxiVBPQ+hub/0+kajaGoE0Knx7g5Xjp0dkxgQjwSwKtknIQ==
X-Received: by 2002:a05:600c:6287:b0:47d:5dae:73b1 with SMTP id 5b1f17b1804b1-47d5dae7628mr228845285e9.23.1767601425245;
        Mon, 05 Jan 2026 00:23:45 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm100331450f8f.20.2026.01.05.00.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:44 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:41 -0500
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
Subject: [PATCH v2 13/15] vsock/virtio: reorder fields to reduce padding
Message-ID: <fdc1da263186274b37cdf7660c0d1e8793f8fe40.1767601130.git.mst@redhat.com>
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

Reorder struct virtio_vsock fields to place the DMA buffer (event_list)
last. This eliminates the padding from aligning the struct size on
ARCH_DMA_MINALIGN.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index ef983c36cb66..964d25e11858 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -60,9 +60,7 @@ struct virtio_vsock {
 	 */
 	struct mutex event_lock;
 	bool event_run;
-	__dma_from_device_group_begin();
-	struct virtio_vsock_event event_list[8];
-	__dma_from_device_group_end();
+
 	u32 guest_cid;
 	bool seqpacket_allow;
 
@@ -76,6 +74,10 @@ struct virtio_vsock {
 	 */
 	struct scatterlist *out_sgs[MAX_SKB_FRAGS + 1];
 	struct scatterlist out_bufs[MAX_SKB_FRAGS + 1];
+
+	__dma_from_device_group_begin();
+	struct virtio_vsock_event event_list[8];
+	__dma_from_device_group_end();
 };
 
 static u32 virtio_transport_get_local_cid(void)
-- 
MST

