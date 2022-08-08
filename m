Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6989AC25B08
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 13:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242907AbiHHN2j (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 09:28:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243325AbiHHN2h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 09:28:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0B0B4B6
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 06:28:36 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 0F7916601BD0;
        Mon,  8 Aug 2022 14:28:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659965314;
        bh=kLCvGXC63ijATN9bbhsEqkx6x2NBmFNJm3j2NOUAcN8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l9O+WVp+K3hRapvwbTb+E5nuX/TeZPY7t70G9IyRRVSPgJ8T2aFsrHrwRCcvW2RWW
         0zPZhOyJerQaBrcLduQCNajf1iV9vTRZmhbJ5NHOer7VzZrzO7gUScgqsx6jhVgKkS
         PaFyHMrz/8MvbzS862nbY0qpX5vptmBUdBlxGisKsySqOeELwT9R+uKRgsimFkKq2C
         an+my0K0yttA0nUYSZUvEYnUFj8wbj0k0diEfrH8QXLa4MSEN80kAlg0xIiUlQ9URb
         2WP/T664uPojlftK62rNUO+E/Lb0v4I5xEAHQU3gaGJH21Nr8TNR/g5LfCRI30Suq9
         1T/eErjVFflQQ==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com,
        bagasdotme@gmail.com
Subject: [PATCH v3 1/2] virtio: kerneldocs fixes and enhancements
Date:   Mon,  8 Aug 2022 15:27:36 +0200
Message-Id: <20220808132737.4070709-2-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220808132737.4070709-1-ricardo.canuelo@collabora.com>
References: <20220808132737.4070709-1-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix variable names in some kerneldocs, naming in others.
Add kerneldocs for struct vring_desc and vring_interrupt.

Signed-off-by: Ricardo Cañuelo <ricardo.canuelo@collabora.com>
---
 drivers/virtio/virtio_ring.c     |  8 ++++++++
 include/linux/virtio.h           |  6 +++---
 include/linux/virtio_config.h    |  6 +++---
 include/uapi/linux/virtio_ring.h | 16 +++++++++++-----
 4 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index a5ec724c01d8..6e5daa19ca1b 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2147,6 +2147,14 @@ static inline bool more_used(const struct vring_virtqueue *vq)
 	return vq->packed_ring ? more_used_packed(vq) : more_used_split(vq);
 }
 
+/**
+ * vring_interrupt - notify a virtqueue on an interrupt
+ * @irq: the IRQ number (ignored)
+ * @_vq: the struct virtqueue to notify
+ *
+ * Calls the callback function of @_vq to process the virtqueue
+ * notification.
+ */
 irqreturn_t vring_interrupt(int irq, void *_vq)
 {
 	struct vring_virtqueue *vq = to_vvq(_vq);
diff --git a/include/linux/virtio.h b/include/linux/virtio.h
index d8fdf170637c..fd8440e85933 100644
--- a/include/linux/virtio.h
+++ b/include/linux/virtio.h
@@ -11,7 +11,7 @@
 #include <linux/gfp.h>
 
 /**
- * virtqueue - a queue to register buffers for sending or receiving.
+ * struct virtqueue - a queue to register buffers for sending or receiving.
  * @list: the chain of virtqueues for this device
  * @callback: the function to call when buffers are consumed (can be NULL).
  * @name: the name of this virtqueue (mainly for debugging)
@@ -90,7 +90,7 @@ dma_addr_t virtqueue_get_avail_addr(struct virtqueue *vq);
 dma_addr_t virtqueue_get_used_addr(struct virtqueue *vq);
 
 /**
- * virtio_device - representation of a device using virtio
+ * struct virtio_device - representation of a device using virtio
  * @index: unique position on the virtio bus
  * @failed: saved value for VIRTIO_CONFIG_S_FAILED bit (for restore)
  * @config_enabled: configuration change reporting enabled
@@ -146,7 +146,7 @@ size_t virtio_max_dma_size(struct virtio_device *vdev);
 	list_for_each_entry(vq, &vdev->vqs, list)
 
 /**
- * virtio_driver - operations for a virtio I/O driver
+ * struct virtio_driver - operations for a virtio I/O driver
  * @driver: underlying device driver (populate name and owner).
  * @id_table: the ids serviced by this driver.
  * @feature_table: an array of feature numbers supported by this driver.
diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index b47c2e7ed0ee..227a9ff5371e 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -225,7 +225,7 @@ int virtio_find_vqs_ctx(struct virtio_device *vdev, unsigned nvqs,
 
 /**
  * virtio_synchronize_cbs - synchronize with virtqueue callbacks
- * @vdev: the device
+ * @dev: the virtio device
  */
 static inline
 void virtio_synchronize_cbs(struct virtio_device *dev)
@@ -244,7 +244,7 @@ void virtio_synchronize_cbs(struct virtio_device *dev)
 
 /**
  * virtio_device_ready - enable vq use in probe function
- * @vdev: the device
+ * @dev: the virtio device
  *
  * Driver must call this to use vqs in the probe function.
  *
@@ -292,7 +292,7 @@ const char *virtio_bus_name(struct virtio_device *vdev)
 /**
  * virtqueue_set_affinity - setting affinity for a virtqueue
  * @vq: the virtqueue
- * @cpu: the cpu no.
+ * @cpu_mask: the cpu mask
  *
  * Pay attention the function are best-effort: the affinity hint may not be set
  * due to config support, irq type and sharing.
diff --git a/include/uapi/linux/virtio_ring.h b/include/uapi/linux/virtio_ring.h
index 476d3e5c0fe7..f8c20d3de8da 100644
--- a/include/uapi/linux/virtio_ring.h
+++ b/include/uapi/linux/virtio_ring.h
@@ -93,15 +93,21 @@
 #define VRING_USED_ALIGN_SIZE 4
 #define VRING_DESC_ALIGN_SIZE 16
 
-/* Virtio ring descriptors: 16 bytes.  These can chain together via "next". */
+/**
+ * struct vring_desc - Virtio ring descriptors,
+ * 16 bytes long. These can chain together via @next.
+ *
+ * @addr: buffer address (guest-physical)
+ * @len: buffer length
+ * @flags: descriptor flags
+ * @next: index of the next descriptor in the chain,
+ *        if the VRING_DESC_F_NEXT flag is set. We chain unused
+ *        descriptors via this, too.
+ */
 struct vring_desc {
-	/* Address (guest-physical). */
 	__virtio64 addr;
-	/* Length. */
 	__virtio32 len;
-	/* The flags as indicated above. */
 	__virtio16 flags;
-	/* We chain unused descriptors via this, too */
 	__virtio16 next;
 };
 
-- 
2.25.1

