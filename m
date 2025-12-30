Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F62EA15C
	for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767089777; cv=none; b=gTDL0AXF2+YR1jp97eew1SlInh0bAL9PXOSeQlvR3rqIkNRVyV/sOdROM/5M/8XDmSRlQG1MnW7+9fPJhYP/UacL/wwEKciSmbxsD7mdWrtT8+gVG3qDDY+kdP/WHxCWnNEk7ilnnxXxSFdy4oJO3LhUxLlvLsYs3PUNQ53BsPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767089777; c=relaxed/simple;
	bh=1nvGVVfYMss4t3CEcUrrF8Nk2cSppyMGKm3YyiTIiKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bm2jmql13zg90hb2QWkYqZAZace7ZLu8+jVmNjpSnWisGJxqk50ZE+XzWuvJvEWn6dzlYrQ4miuI31a0gwp5klGjFXmUFDDs92YZcy9jmfKrzFHAJcks/Zh/UMQtxSGrNmFTJ9PZCgXehpqJtmkDC7ufn/6FYvgpgGEaFEjeJwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUV93+Gv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=D8kiRJdc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUV93+Gv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="D8kiRJdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767089774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=N7TdGrHAal4YSCbHD/e5fBMwf7XbmUGP5Z2mh/ui0sA=;
	b=JUV93+GvNWX3nxpTw8cau2vP30RBijuoxCYWrIDxyYcvX4p3XvCk95xccbON6+L/U3eb9t
	si8hWuSvT4Mt3QErEjU5PTb0AlztpEMPM3HXaJlVfXud/33UjYfqDajJuESmoRTs+TkhT4
	8bBFTetu85d5QnbDKsQ6WrE2G/IJ4h8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-ItGdQUbpM16aMHVPJOLFHw-1; Tue, 30 Dec 2025 05:16:12 -0500
X-MC-Unique: ItGdQUbpM16aMHVPJOLFHw-1
X-Mimecast-MFC-AGG-ID: ItGdQUbpM16aMHVPJOLFHw_1767089771
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fb8d41acso5121431f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 30 Dec 2025 02:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767089771; x=1767694571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N7TdGrHAal4YSCbHD/e5fBMwf7XbmUGP5Z2mh/ui0sA=;
        b=D8kiRJdccnjA7UBfQdPD1dIdRkpZkqA8vResLYU9t9f20l4nQJx5GuLg0IRRo4HmkA
         Ez9QUd8ztax/ZM6qlWpStt6ig9rAwGG18m9odbjAYC7V/8aib3iWrs8f6Glxnfo92e6M
         kbzp51OUt/jpLMIaQ9dSi354rrPCe5h6M+dOEHdwzUrk1FtyKjQU3A+QpWIY5VrGfgPZ
         GasDPxSRI4RFXD/RE1XwOWs4ZpqcTdTHkb9bC/VEyiOzSm70/GLjGNOKak5FNDBdiJa7
         ZMR2k8LgePJspuqK6/IhpTuKlpvOtJWOoqS7UikPR07hhtZjj/ERppykuPbLuGVi1fLU
         yJXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767089771; x=1767694571;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7TdGrHAal4YSCbHD/e5fBMwf7XbmUGP5Z2mh/ui0sA=;
        b=QrrTZRr7z4eSE8tUQFWU/gR4wgX9Qaqj5ICBRH7BqANoWWi/sQlFLjRsL6j0qQF59t
         M7tdXBciK7Kmea1N7u5ZkCUNM0/rzjRcr2yuTMzQKAblId7jPx0SE/N984HcRFlmKoK4
         fMUDJ6ZEhae4iIXtWCX9pODVk1gVdwqCWu+g3RZ0Kv72aKCWOoBvKTVENc1KLZMWNdPp
         fI9Ot5QCLMEQaPZMHl1a9O6MrvXUAGyMsjBKMvnvPLWGZeafDcx1tzUNUKrsYJX8mj7V
         AWmQohb0YMQFDREU+W8psESNsKTXAgGDr12AFoOivbW84392ppAb1Jf1NlMrk6tZXswy
         2agw==
X-Forwarded-Encrypted: i=1; AJvYcCVHdgp13Wz9mlMBONUaFP5vZw08pGxbMXFQA1R3n3b0aQzsCUY2TxNP+7p+l0FOY480ytSi180vdQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJcMx1GWmPbqf0UqZ5vFqPmGyzA+ZhCi3Kjb4Rrsi41gj/SUFJ
	Y8DmaPzzz0nVZP8gDKgglv7CO+XcTCvpcR7RLglqPt/3wNuCsxVH32jpqGDcum++cDhrQpd8D+I
	L2M6TbuO7vJxXjo2ejahIlTy0ASmbklJs7UP8AeO28oOYzuGzSJOm3ShAzOq9ug==
X-Gm-Gg: AY/fxX5T4tER53SW1ftyNO+Kh1hhGuyiYOFJDAH6LED3WvbZ2oWJ/aQU1Lx+LvbWxG6
	XViZ5lTFb/3VxlowArkK1ZgvPMJVdKzNl9zwYdq0PsK2WV0B1DmjNQUyMTJ/JsmzNh5NYptozBk
	Ig1JYLVLXsZ9YM48lN17oU2GY54qouOAB3pTgOyq4NPLjZdAe2k8upXg9rLn/DBtJd1Qjs7Nqq4
	iu6vmiMGcZ4r+w2OodnQMb6zVmkzYycn1Hb/Ywtw/QKwRjrQh2QN2qLwjf5GG2l/iSmIrPZHxJa
	twvevK/Nk6HuyTd1/l6OGfKUXnpn9i3Z+3a7Y3m7z+XlA45bp2d+u2aPNhFf5p6t3CplLMwUdSI
	xMXI1WFU2GyO0KlIr3EwgAvcjkPRCGTNcNQ==
X-Received: by 2002:a05:600c:45c8:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d195558bemr375729825e9.11.1767089771419;
        Tue, 30 Dec 2025 02:16:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjzVX0GYuttaIVhsj3PIAp1ZJ2Zp++QasW4yFBwV4WaDkrZ/icz8/Y8CMg+xDJDk6ilEld2g==
X-Received: by 2002:a05:600c:45c8:b0:477:8a2a:1244 with SMTP id 5b1f17b1804b1-47d195558bemr375729355e9.11.1767089770967;
        Tue, 30 Dec 2025 02:16:10 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4e91sm569777955e9.13.2025.12.30.02.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 02:16:09 -0800 (PST)
Date: Tue, 30 Dec 2025 05:16:07 -0500
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
Subject: [PATCH RFC 07/13] vsock/virtio: fix DMA alignment for event_list
Message-ID: <c195bc45032be85c3f0bad7362f0ba0a4e8a7726.1767089672.git.mst@redhat.com>
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

On non-cache-coherent platforms, when a structure contains a buffer
used for DMA alongside fields that the CPU writes to, cacheline sharing
can cause data corruption.

The event_list array is used for DMA_FROM_DEVICE operations via
virtqueue_add_inbuf(). The adjacent event_run and guest_cid fields are
written by the CPU while the buffer is available, so mapped for the
device. If these share cachelines with event_list, CPU writes can
corrupt DMA data.

Add __dma_from_device_aligned_begin/end annotations to ensure event_list
is isolated in its own cachelines.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vmw_vsock/virtio_transport.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vmw_vsock/virtio_transport.c b/net/vmw_vsock/virtio_transport.c
index 8c867023a2e5..76099f7dc040 100644
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
@@ -59,8 +60,10 @@ struct virtio_vsock {
 	 */
 	struct mutex event_lock;
 	bool event_run;
+	__dma_from_device_aligned_begin
 	struct virtio_vsock_event event_list[8];
 
+	__dma_from_device_aligned_end
 	u32 guest_cid;
 	bool seqpacket_allow;
 
-- 
MST

