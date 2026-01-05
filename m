Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2660327BE1
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601406; cv=none; b=JD9C2wZ5sQrkRuRbwLxylDaIDKe60TQtbmo7SaiYRaSzG8JJSo0nF8nwFE1NYVQCwntH9Gq/4O7izpd3Yb7eKxXCixWjvNdgvIQPgT2nGw2ip7Qr1BCStUpgpWTX6bLtQI0GDi1FTy4lcP3CMjnk4YB0o6dcFjXILte2lB/YYwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601406; c=relaxed/simple;
	bh=UZnbRwVvRPHcRgRCzpxYejrN2eYzh6K3qUvMvD+slXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTi5Unx1BsHaqHn/6YBRLG8neEWtphCPu3ARdayTdL08D9jb6mBI9VSFenzm0Sr+KIeOPBbgu3i+V4xShG/QYDoNaKpft1yqsaM/GHS8ydSAjiWCTeO9YOzURpzAMNjGcGX6fRKOoMVG5K8Ey+CQM6Hk96QcfUi9AJCQBn1ZANs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Va5i9zMe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=eVeVMVFL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Va5i9zMe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="eVeVMVFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ixiBJgqmLTQwR4hP1VcNBLxgwUtr+SaYhPMs/HYsyIA=;
	b=Va5i9zMeMtbcRHGkO3omiS2lnbjK7NHJmRV04pl1aei+cXj/VonDubjoano/21Gzm6DJza
	NuqsI5jUFDMBOOIBPpcc5KxS9XpfJzugdzZmrvHTih1SwK+tDbSBdheB81od2wtPh6Ji6w
	llfG0vjl4L4Fd7EkQ7ac2tMIxB6DT/k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-Uz8z-xGhOt29pYYg2-Lpdw-1; Mon, 05 Jan 2026 03:23:23 -0500
X-MC-Unique: Uz8z-xGhOt29pYYg2-Lpdw-1
X-Mimecast-MFC-AGG-ID: Uz8z-xGhOt29pYYg2-Lpdw_1767601402
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-430fc83f58dso7622683f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601402; x=1768206202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ixiBJgqmLTQwR4hP1VcNBLxgwUtr+SaYhPMs/HYsyIA=;
        b=eVeVMVFLCc/3+rlgiQ+uX1PuOEip3OVCtfW/FVbq3GmJAX2XPqgSzQu3DI/Sx9Y491
         1T7yEOJ+KvzNBcr/zxt4mKErGzWZZWXEi6p1dpNvdFl0loa445T/D3jyFCRSMehYMKyb
         Izb7utSZY8hYoW9yguzTL9X1LbFZQc/wOUjgQmwsCPNV94gLcNt8TAqV7i0cpZW5VIz5
         pijgiyaL/lHySq/iE7pgV8Rp9v2LST+0Fw+KNsciR4l7nP0T4YUq7b2xK1P+6SZEL5aq
         N51P2VPsKgGYixHYeKCDmFq056ciBxj/kk1E3cSwu12el3grzvjWTjRJI1S+p3GQOPjH
         qb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601402; x=1768206202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixiBJgqmLTQwR4hP1VcNBLxgwUtr+SaYhPMs/HYsyIA=;
        b=T1B5air2/Gm7eWMwd5vfNStx5hXOx25+br2Dy/mgQdVx+1j3SiVrbY3pZWIIHsMz/9
         qavQbNqk5lwX8gyHy0Xs8YV+Mil9jSfjnuLYoefc5CtSqNVPGc40Hu43+4rltMbPxdPf
         G2ydPzhi4pL0IcswCIHH4cWOEHEQW6yKvpSCo86l1sKmUF3Y8tTBkf49CFUqdxKTuTzq
         LiCToKy/Fi9vDGx9NCPI467Udqz6qHbD9PWbrQenHxbVpufmlghIeIcqFkE/yLvxPmWo
         hwXjSoO9MhMM6azMEimnazUHURPN0/FEBKEYfYZnw3ard/xWzz7yWalc5aIX0Z7yPXPs
         8WxA==
X-Forwarded-Encrypted: i=1; AJvYcCWLPLiMmDdged5ogyNHLaHEA0/pSMCiD1wZZVgMLMqJ9mzm86fExsRNlm3//nlAslwh9ewJ/Sssqi8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1ZCVQYFfdZPFtLokyi6WRBIgdtudx29dhb7CTrirq41SqU+n
	JjCpBxbu6DFc1M7W4FI3yx8xPOaonpAPaUH2zVy4CSqeGhAns4hoQ32sf3PrwxqsTXHLQgo5Jvn
	lBsPN66xNbSYrf8Z+K8YEhB4/tzM/+ah9b0W04JbFVr0QsKM0+P0+sgRBHs3faw==
X-Gm-Gg: AY/fxX5lDU5NZxgSWE6GpuPW8HfBxhK+oIurv8zeP5cLv61UUt6oWopdhXJNEy+wDHB
	TFPwVn/cVZpA0oyTysp6nN4C5P+WCnAXccC3kK0c0BY20cHgtUpxZrnK9kYB68bS2NwyI7SkwiK
	PExLhD5JTuMTyJ5mewacBbg4+SlYKPr+gmbQFUUu7BNQ1eRmpov1YPB4MNATQz3u9RudpMfEevw
	u+li2iPbmhSFgEbmTpXkUstFQqsVDHANhXtdu2zxNxT4bSMXwEbY/YoJvt5h9M9mcNxX+eaio/S
	7WG85xhaeOBDzqip9dbNAJ3YtuZdWie/Pne9OlvM8LQxjSbQzIHa7L2gu5npO6d4jePMONvzgbD
	F3vsQ188IddQ1x0JA6jIHpLlbpB1KLceFlw==
X-Received: by 2002:a05:6000:220b:b0:430:fbce:f382 with SMTP id ffacd0b85a97d-4324e4d04d4mr58561447f8f.25.1767601401650;
        Mon, 05 Jan 2026 00:23:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGx1Nl8KRgrNe9z8PJkEy+oAdnaqu11UpBKN0xrzW8x/NIJB12I9Y53VIEzJyG5l7t+8XCSPQ==
X-Received: by 2002:a05:6000:220b:b0:430:fbce:f382 with SMTP id ffacd0b85a97d-4324e4d04d4mr58561401f8f.25.1767601401124;
        Mon, 05 Jan 2026 00:23:21 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm100730503f8f.37.2026.01.05.00.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:20 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:17 -0500
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
Subject: [PATCH v2 07/15] vsock/virtio: fix DMA alignment for event_list
Message-ID: <f19ebd74f70c91cab4b0178df78cf6a6e107a96b.1767601130.git.mst@redhat.com>
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

On non-cache-coherent platforms, when a structure contains a buffer
used for DMA alongside fields that the CPU writes to, cacheline sharing
can cause data corruption.

The event_list array is used for DMA_FROM_DEVICE operations via
virtqueue_add_inbuf(). The adjacent event_run and guest_cid fields are
written by the CPU while the buffer is available, so mapped for the
device. If these share cachelines with event_list, CPU writes can
corrupt DMA data.

Add __dma_from_device_group_begin()/end() annotations to ensure event_list
is isolated in its own cachelines.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 8c867023a2e5..bb94baadfd8b 100644
--- a/net/vmw_vsock/virtio_transport.c
+++ b/net/vmw_vsock/virtio_transport.c
@@ -17,6 +17,7 @@
 #include <linux/virtio_ids.h>
 #include <linux/virtio_config.h>
 #include <linux/virtio_vsock.h>
+#include <linux/dma-mapping.h>
 #include <net/sock.h>
 #include <linux/mutex.h>
 #include <net/af_vsock.h>
@@ -59,8 +60,9 @@ struct virtio_vsock {
 	 */
 	struct mutex event_lock;
 	bool event_run;
+	__dma_from_device_group_begin();
 	struct virtio_vsock_event event_list[8];
-
+	__dma_from_device_group_end();
 	u32 guest_cid;
 	bool seqpacket_allow;
 
-- 
MST

