Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A2328B70
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 08:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767601418; cv=none; b=kf71pC6+mrvlsiA2etdVSAFwjWEOJLa3Xc7fizMqlI3uJg0lWTIrVcLBI/1hVkfnwLr4L6Ab/VsSEz5JKh9r+UAv0U/loe7mdFVsK/bBal3hGnWEPs3urIcGxZJzBcXfeDFa/DF/d940iVVspywhTMKs7vyQjKxmnl6dca3Hb2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767601418; c=relaxed/simple;
	bh=S9cU9rMSKLAHqC3C9VUi030/VnGNztyhDP4UPj+0Vaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MnAfe0MA4aiB/Du08m4v7UvNSuyMbUUUn+9d59OAppoiCDFrxSLO8s/IUitU4R5lsrun+zm3SkOhDH0HEr5CcvLjM7/x5xQ+K2BHCz2EX06lUcnCIuqXr0bEd/k5LjQvnx0HR/BjjKbRzTzaWg9vFbf02YK41mQIohZTWVDUJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hRVrAXij; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nkGj46o3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hRVrAXij";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nkGj46o3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767601415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TvLvTQPEJKAtkqGovGo2GHeF0+EOLKvEuwFpv+PiquM=;
	b=hRVrAXijnRHK0hEi/eE2t7KSUH1uBH4rQYAH3sGQGFJz3cJBz24Mtx1Yr4otKh9d6xgLLs
	YmFjzwD5jtNbo8Y7fc0052KAMVFH7wbKt1vWGVB9jUS4kVzDoQ1mywCeJPSTDAHzpXJkph
	XDopFb8BTfKCDqPGJwUoSWfPU3FUM0c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691--FAN2y8ZNUyMsVj35lpaDw-1; Mon, 05 Jan 2026 03:23:34 -0500
X-MC-Unique: -FAN2y8ZNUyMsVj35lpaDw-1
X-Mimecast-MFC-AGG-ID: -FAN2y8ZNUyMsVj35lpaDw_1767601414
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-430fcfe4494so12569170f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 00:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767601414; x=1768206214; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TvLvTQPEJKAtkqGovGo2GHeF0+EOLKvEuwFpv+PiquM=;
        b=nkGj46o3hq4C07bUT18o22UMSLLMiYkVF7R1oYX4y5U0eeN/5Vgd6QhNTISSSZxe+v
         P9WcXaPJZrw82sUU/TfbnyAdg4tQVaX+M2bDcMath0txP7gVBjTWQtSrfrIP/JTm68iY
         UIcl7EWPk0EpWnmRTubIpsDFCl1CwcI/PS1DifZz7NHho2GyviuSIzD39neA+q5SqSN5
         puGBuASeW0KLGqLZLbJEe4RauywB9z9a7FdyiCWUuNpqvW6+Ih/J7J0m2Y/gpNsLs5ao
         5aLWPmbxNDCqVXWndT4Tfi2zCqT7I/9b6kcBfbzM989YqFe2R/Ec0PgXJwm3xvzC/xZ7
         CD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767601414; x=1768206214;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TvLvTQPEJKAtkqGovGo2GHeF0+EOLKvEuwFpv+PiquM=;
        b=C1YwATLyHGzPyScarTW3/h86fQ+79BMun8OpJ+FO9zBZA1KeOf1L93Z21i/I3+lc9t
         x7dgglOSd2WqdIiSWv0cB+BG3Qw3UR/kDSmqpPwX1BtpSz6nC+rCZ+FZU5vcNp75ycSy
         cn6f7zXveJbPurkqBqF3dOzqo0w1OEidFilxY8cRymihIAqRTsKfDEyV3Bl/QPsxOfxh
         8G5vTGG0w8JMxL6ORkeSikxIRZFPBVcbEYFOtJVGorVKxQJ/29iooyNYyI6Thfrmv/vz
         EA5h8jWSQW5qhLQXeC3vSIRzatDtmpjIsqEGi0VHPcRAjf0y3R0F0Bs2sjCswUI2Uu25
         mqEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl2TmMMc2SJOjRUMOPS+5ja32iUmxuCNnrvTujtY8bDuW6bda+0VsUhRn/byhNDbfoEHb8nqYU1rc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1evlE8a7hT/wkZtdylGxoF7d/Dk8edu9T4V6PJjxO7N1ofcU
	TSALJgzfL6js4NkAkJ1u/kfve7010zNquOU0iys23RerEtxHr+XOvmsI6mb9mQgD2JPossrgHHY
	icMdfRCUEe1ZQdUK6yC3mRZYFvczPVdfq+eAfpPYYXA3jN9w/oGpfhlQEwF+lGg==
X-Gm-Gg: AY/fxX6oHDRsnznzf7Tl4umWFEuVOMe9kYcvnfukN88jreb6K/NshZRGEXIJs4HY7K0
	P5IqIFQhN0bG7sbA4zMP4EpFRAbtDEuBAP0227spjmAHLpLUtKkd1t6l9JTvARNr5edu/XjWu1M
	AK9k8XC5S7u8ARfBTnIKH1JJGocNptdSbYSZsDCioWNN8X2A7L2dCvnbYco6ouVjUTYKVwdGp2W
	1O+zm71r6WKtxFOqLv+3xpBp19v+LjbCm8yfUhoUwtNUTbdVZNpQ0lWO+C0zoCzdXubSo1mWbVw
	ucRC5Mf/X1ORK2gx6k3RlbmGEsc+NjpDOXxutKtBXACbdqe+ZTGKHgtDtdiTD5fOqnpm9c/nUiO
	N66LiYgpMVLDw5NotqzbSaIDwQcGJ+6w/WA==
X-Received: by 2002:adf:eb04:0:b0:432:84ef:841f with SMTP id ffacd0b85a97d-43284ef8d0cmr31362876f8f.38.1767601413448;
        Mon, 05 Jan 2026 00:23:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFx7eWbROO38mdjmsXsZ8eTRhzoo1KnfbPFeP9XiXzVU5+PKMGQRYrz1a7izR0YG2kvu7gW1Q==
X-Received: by 2002:adf:eb04:0:b0:432:84ef:841f with SMTP id ffacd0b85a97d-43284ef8d0cmr31362856f8f.38.1767601412963;
        Mon, 05 Jan 2026 00:23:32 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa2beasm98160481f8f.33.2026.01.05.00.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 00:23:32 -0800 (PST)
Date: Mon, 5 Jan 2026 03:23:29 -0500
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
Subject: [PATCH v2 10/15] virtio_scsi: fix DMA cacheline issues for events
Message-ID: <8801aeef7576a155299f19b6887682dd3a272aba.1767601130.git.mst@redhat.com>
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

Current struct virtio_scsi_event_node layout has two problems:

The event (DMA_FROM_DEVICE) and work (CPU-written via
INIT_WORK/queue_work) fields share a cacheline.
On non-cache-coherent platforms, CPU writes to work can
corrupt device-written event data.

If ARCH_DMA_MINALIGN is large enough, the 8 events in event_list share
cachelines, triggering CONFIG_DMA_API_DEBUG warnings.

Fix the corruption by moving event buffers to a separate array and
aligning using __dma_from_device_group_begin()/end().

Suppress the (now spurious) DMA debug warnings using
virtqueue_add_inbuf_cache_clean().

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/scsi/virtio_scsi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/scsi/virtio_scsi.c b/drivers/scsi/virtio_scsi.c
index 96a69edddbe5..6ff53fc8adb0 100644
--- a/drivers/scsi/virtio_scsi.c
+++ b/drivers/scsi/virtio_scsi.c
@@ -29,6 +29,7 @@
 #include <scsi/scsi_tcq.h>
 #include <scsi/scsi_devinfo.h>
 #include <linux/seqlock.h>
+#include <linux/dma-mapping.h>
 
 #include "sd.h"
 
@@ -61,7 +62,7 @@ struct virtio_scsi_cmd {
 
 struct virtio_scsi_event_node {
 	struct virtio_scsi *vscsi;
-	struct virtio_scsi_event event;
+	struct virtio_scsi_event *event;
 	struct work_struct work;
 };
 
@@ -89,6 +90,11 @@ struct virtio_scsi {
 
 	struct virtio_scsi_vq ctrl_vq;
 	struct virtio_scsi_vq event_vq;
+
+	__dma_from_device_group_begin();
+	struct virtio_scsi_event events[VIRTIO_SCSI_EVENT_LEN];
+	__dma_from_device_group_end();
+
 	struct virtio_scsi_vq req_vqs[];
 };
 
@@ -237,12 +243,12 @@ static int virtscsi_kick_event(struct virtio_scsi *vscsi,
 	unsigned long flags;
 
 	INIT_WORK(&event_node->work, virtscsi_handle_event);
-	sg_init_one(&sg, &event_node->event, sizeof(struct virtio_scsi_event));
+	sg_init_one(&sg, event_node->event, sizeof(struct virtio_scsi_event));
 
 	spin_lock_irqsave(&vscsi->event_vq.vq_lock, flags);
 
-	err = virtqueue_add_inbuf(vscsi->event_vq.vq, &sg, 1, event_node,
-				  GFP_ATOMIC);
+	err = virtqueue_add_inbuf_cache_clean(vscsi->event_vq.vq, &sg, 1, event_node,
+					      GFP_ATOMIC);
 	if (!err)
 		virtqueue_kick(vscsi->event_vq.vq);
 
@@ -257,6 +263,7 @@ static int virtscsi_kick_event_all(struct virtio_scsi *vscsi)
 
 	for (i = 0; i < VIRTIO_SCSI_EVENT_LEN; i++) {
 		vscsi->event_list[i].vscsi = vscsi;
+		vscsi->event_list[i].event = &vscsi->events[i];
 		virtscsi_kick_event(vscsi, &vscsi->event_list[i]);
 	}
 
@@ -380,7 +387,7 @@ static void virtscsi_handle_event(struct work_struct *work)
 	struct virtio_scsi_event_node *event_node =
 		container_of(work, struct virtio_scsi_event_node, work);
 	struct virtio_scsi *vscsi = event_node->vscsi;
-	struct virtio_scsi_event *event = &event_node->event;
+	struct virtio_scsi_event *event = event_node->event;
 
 	if (event->event &
 	    cpu_to_virtio32(vscsi->vdev, VIRTIO_SCSI_T_EVENTS_MISSED)) {
-- 
MST

