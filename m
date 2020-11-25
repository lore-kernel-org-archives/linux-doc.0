Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E9FEC56202
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 22:19:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CAAC6221E2
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 22:19:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kWVTpXkV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387404AbgKYWTW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 17:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732739AbgKYWTV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 17:19:21 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77906C0617A7
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 14:19:21 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id z7so29696wrn.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 14:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nXA0SjyfP7UjKs2H2srLJc/UeEiXr6hG+khI2TPCZk=;
        b=kWVTpXkVtm/GnkaqLGeRkrJws6uGCS0exSo42bI4nIxdLa6YEOQjv13oW86dc5ji27
         SDW+Ju4m0FmnUoTeTwMgyVGqYFvMr8SKfRifcxJZ2awsK03pDIDUmB87RqOAMQTcZCD6
         u9og8svtcSxFxibOE5sf+gxV4hqIscwRbbnsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0nXA0SjyfP7UjKs2H2srLJc/UeEiXr6hG+khI2TPCZk=;
        b=YPuiTHtqCH6oR1EeRqNR0+N9DBAi33aHRcPAP29wO7VAmilTXlrYuGuklBpptojQ9A
         fRdN7/8tlPWBtbBgBDegy/urbfQ2ZF64wZD0LjIwKwas6zMss5cltMyXDo4jCd+/6Gx0
         4gY4y3/KWjPDp5MeQovhSwVF0kavQe/ommzz/oNh+LgXFJlKs2IG5Vuzw7Bd9RPyU69G
         Jg7QksjbP2o07uHR4XOTl8AqKqDtHOV/Afm3QDIuK4lpbrehtETlLk+pynfZBIghc4w6
         6MWIOj5dsJcLCluFM8oqTO6L0wb5VEJPmSFDvWVULfFk3I/lBRxoC80Zk29HbnmbDGqu
         NQAQ==
X-Gm-Message-State: AOAM533atGkVPbpoftMKJR9xepXLfwp/XoQX/3MkyFcGz+6Uciwxd3UM
        kSAJd2vzcjgrk+kjiMv4p7pA0Q==
X-Google-Smtp-Source: ABdhPJw5LIWbEX/qCR9k2hfcMtdI2NeQ0XgrvDGhVmXPcdrykxh+KRZmaLS+V4nVDR6Q7exJZQqydg==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr64856wru.352.1606342760076;
        Wed, 25 Nov 2020 14:19:20 -0800 (PST)
Received: from alco.lan ([80.71.134.83])
        by smtp.gmail.com with ESMTPSA id l16sm6514099wrx.5.2020.11.25.14.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 14:19:19 -0800 (PST)
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
Date:   Wed, 25 Nov 2020 23:19:17 +0100
Message-Id: <20201125221917.150463-1-ribalda@chromium.org>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On architectures where the is no coherent caching such as ARM use the
dma_alloc_noncontiguos API and handle manually the cache flushing using
dma_sync_sgtable().

With this patch on the affected architectures we can measure up to 20x
performance improvement in uvc_video_copy_data_work().

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---

v3: Thanks to Marek Szyprowski

Use dma_sync_sgtable and _for_cpu()

 drivers/media/usb/uvc/uvc_video.c | 93 +++++++++++++++++++++++++++----
 drivers/media/usb/uvc/uvcvideo.h  |  2 +
 2 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_video.c b/drivers/media/usb/uvc/uvc_video.c
index a6a441d92b94..06ebd7a3877b 100644
--- a/drivers/media/usb/uvc/uvc_video.c
+++ b/drivers/media/usb/uvc/uvc_video.c
@@ -1097,6 +1097,11 @@ static int uvc_video_decode_start(struct uvc_streaming *stream,
 	return data[0];
 }
 
+static inline struct device *stream_to_dmadev(struct uvc_streaming *stream)
+{
+	return stream->dev->udev->bus->controller->parent;
+}
+
 /*
  * uvc_video_decode_data_work: Asynchronous memcpy processing
  *
@@ -1118,6 +1123,9 @@ static void uvc_video_copy_data_work(struct work_struct *work)
 		uvc_queue_buffer_release(op->buf);
 	}
 
+	if (uvc_urb->pages)
+		dma_sync_sgtable_for_device(stream_to_dmadev(uvc_urb->stream),
+					    &uvc_urb->sgt, DMA_FROM_DEVICE);
 	ret = usb_submit_urb(uvc_urb->urb, GFP_KERNEL);
 	if (ret < 0)
 		uvc_printk(KERN_ERR, "Failed to resubmit video URB (%d).\n",
@@ -1539,10 +1547,17 @@ static void uvc_video_complete(struct urb *urb)
 	 * Process the URB headers, and optionally queue expensive memcpy tasks
 	 * to be deferred to a work queue.
 	 */
+	if (uvc_urb->pages)
+		dma_sync_sgtable_for_cpu(stream_to_dmadev(stream),
+					 &uvc_urb->sgt, DMA_FROM_DEVICE);
 	stream->decode(uvc_urb, buf, buf_meta);
 
 	/* If no async work is needed, resubmit the URB immediately. */
 	if (!uvc_urb->async_operations) {
+		if (uvc_urb->pages)
+			dma_sync_sgtable_for_device(stream_to_dmadev(stream),
+						    &uvc_urb->sgt,
+						    DMA_FROM_DEVICE);
 		ret = usb_submit_urb(uvc_urb->urb, GFP_ATOMIC);
 		if (ret < 0)
 			uvc_printk(KERN_ERR,
@@ -1566,8 +1581,16 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 			continue;
 
 #ifndef CONFIG_DMA_NONCOHERENT
-		usb_free_coherent(stream->dev->udev, stream->urb_size,
-				  uvc_urb->buffer, uvc_urb->dma);
+		if (uvc_urb->pages) {
+			sg_free_table(&uvc_urb->sgt);
+			vunmap(uvc_urb->buffer);
+			dma_free_noncontiguous(stream_to_dmadev(stream),
+					       stream->urb_size,
+					       uvc_urb->pages, uvc_urb->dma);
+		} else {
+			usb_free_coherent(stream->dev->udev, stream->urb_size,
+					  uvc_urb->buffer, uvc_urb->dma);
+		}
 #else
 		kfree(uvc_urb->buffer);
 #endif
@@ -1577,6 +1600,56 @@ static void uvc_free_urb_buffers(struct uvc_streaming *stream)
 	stream->urb_size = 0;
 }
 
+#ifndef CONFIG_DMA_NONCOHERENT
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+{
+	struct device *dma_dev = dma_dev = stream_to_dmadev(stream);
+
+	if (!dma_can_alloc_noncontiguous(dma_dev)) {
+		uvc_urb->buffer = usb_alloc_coherent(stream->dev->udev,
+						     stream->urb_size,
+						     gfp_flags | __GFP_NOWARN,
+						     &uvc_urb->dma);
+		return uvc_urb->buffer != NULL;
+	}
+
+	uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
+						 &uvc_urb->dma,
+						 gfp_flags | __GFP_NOWARN, 0);
+	if (!uvc_urb->pages)
+		return false;
+
+	uvc_urb->buffer = vmap(uvc_urb->pages,
+			       PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
+			       VM_DMA_COHERENT, PAGE_KERNEL);
+	if (!uvc_urb->buffer) {
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->pages, uvc_urb->dma);
+		return false;
+	}
+
+	if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
+				PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
+				stream->urb_size, GFP_KERNEL)) {
+		vunmap(uvc_urb->buffer);
+		dma_free_noncontiguous(dma_dev, stream->urb_size,
+				       uvc_urb->pages, uvc_urb->dma);
+		return false;
+	}
+
+	return true;
+}
+#else
+static bool uvc_alloc_urb_buffer(struct uvc_streaming *stream,
+				 struct uvc_urb *uvc_urb, gfp_t gfp_flags)
+{
+	uvc_urb->buffer = kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
+
+	return uvc_urb->buffer != NULL;
+}
+#endif
+
 /*
  * Allocate transfer buffers. This function can be called with buffers
  * already allocated when resuming from suspend, in which case it will
@@ -1607,19 +1680,11 @@ static int uvc_alloc_urb_buffers(struct uvc_streaming *stream,
 
 	/* Retry allocations until one succeed. */
 	for (; npackets > 1; npackets /= 2) {
+		stream->urb_size = psize * npackets;
 		for (i = 0; i < UVC_URBS; ++i) {
 			struct uvc_urb *uvc_urb = &stream->uvc_urb[i];
 
-			stream->urb_size = psize * npackets;
-#ifndef CONFIG_DMA_NONCOHERENT
-			uvc_urb->buffer = usb_alloc_coherent(
-				stream->dev->udev, stream->urb_size,
-				gfp_flags | __GFP_NOWARN, &uvc_urb->dma);
-#else
-			uvc_urb->buffer =
-			    kmalloc(stream->urb_size, gfp_flags | __GFP_NOWARN);
-#endif
-			if (!uvc_urb->buffer) {
+			if (!uvc_alloc_urb_buffer(stream, uvc_urb, gfp_flags)) {
 				uvc_free_urb_buffers(stream);
 				break;
 			}
@@ -1891,6 +1956,10 @@ static int uvc_video_start_transfer(struct uvc_streaming *stream,
 
 	/* Submit the URBs. */
 	for_each_uvc_urb(uvc_urb, stream) {
+		if (uvc_urb->pages)
+			dma_sync_sgtable_for_device(stream_to_dmadev(stream),
+						    &uvc_urb->sgt,
+						    DMA_FROM_DEVICE);
 		ret = usb_submit_urb(uvc_urb->urb, gfp_flags);
 		if (ret < 0) {
 			uvc_printk(KERN_ERR, "Failed to submit URB %u (%d).\n",
diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
index a3dfacf069c4..3e6618a2ac82 100644
--- a/drivers/media/usb/uvc/uvcvideo.h
+++ b/drivers/media/usb/uvc/uvcvideo.h
@@ -532,6 +532,8 @@ struct uvc_urb {
 
 	char *buffer;
 	dma_addr_t dma;
+	struct page **pages;
+	struct sg_table sgt;
 
 	unsigned int async_operations;
 	struct uvc_copy_op copy_operations[UVC_MAX_PACKETS];
-- 
2.29.2.454.gaff20da3a2-goog

