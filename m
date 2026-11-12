Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466217;
	b=Y9GTrwGGCkw9uR5n6spsxF3rNOw1zBUi67KtHpVd3vt8TTpdUmibPCbmzugFGqhibUaF
	 ZvyCePTGeONg7Ffrpu7P/CZCgQPDm7EeQY2by1cPxw7rILE1nKzB6S28pifh+rp2SEwri
	 lR6BueDUqq1jqlzrdk1vlnqcTtmY7dOrV90dGmmu1aV7pMwCOtxo9XBwXXpEj7Ax4iiqV
	 8nH5Db5ecf5MocxEjykxcl56TwcXlWNVDbBM6sz+Lhme6+m5LkBWbeyEQ+ma6vYddOx7w
	 O1T39en8R/g28+wb/v3M4uM1H5ev+eu7mhZBgd+Agj3C3W2vF0CXFwN9npTi93rFJ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466217;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=NCAM6yRMIKggs6d31NqIJXpJvxAL5FAIwvCfhp3iW41BTxBPmk+GXjw6C8pJvaSsKAiX
	 4wn3fFu+TSzyNhnlUEXwc1Pfjsw6Y7+RiPU+CHHX25+nXDeHm3EDJvnDFK46+PFBOwC5v
	 TZaZnsLyC+eldyw76ixDVzkXcFaN1KJ6hpfa5acoE5kjqY0hyXliT378mUlWgyCT6AhcH
	 +BLRfKgeBhEPu7IsL4FM5K26MARaSg16QZTeFqDFKkUUQ8u65i4KfPDf/qochK8LSZpEn
	 TbRPrzUlz3lbT5Rdi7gMe/P7xeAudoQLgiYOfvmCcUL6uUwm2T4EZ0jNljB989Z9L/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JucUgcMc;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C563606B4A6
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C563606B4A6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JucUgcMc
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so1545991b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466216; x=1795071016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=JucUgcMcoUozWk7Nhqy1l0vZqf4I0xcvN8SA5L7tkB1oIXkzN5FuVALShtayfrdg6M
         If+QCaBELuAClDP4vGrddPojKlhiYMX8z17F2HO7R6xHhq+5+YMUBg5n3/uIfXdnHZU8
         L/Oj869fyM76taEJ5WUH+Xq0Qj8lWe/WONm9q312EB4UjgHivhvwJDAFtPz+hbmbIWks
         bQYtJR1VCj4FZ/80kAvB9MKeqcTl+fMZR658DggBFiXzugxIzPcMZLCwx5aRev4/1Ewa
         TmvFvLh0fa0sKOKTIHUL+/h4B7xmK1RCgBBpf5lASk9IxEKgUz89pmXkYnbJf4s68690
         86VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466217; x=1795071017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=LoHnV452Pdh4gCzcyTZtbulAqnbFQzzFp1nrZpsFHMd/Rlw5smwc3Gxa7OFbGX9MY0
         A1Gh2Sdxbw+0CYa1/FDxE30PwHr0Huh4oLus8raKtlVQoLh37MQ8Cg9wwYyl3dRbvTBA
         zgejXjV+IvJFkI7LfnX2fWyeFZFFkSvf6LlZDTTFCgWnDNVjhtsBTPZkKtXel0rJx2PF
         +pT65Oq3hx3DtgWX4t0VQGh4gv+tuJRXOMvXW0TMcBbi/51aIZngxRYBO36kqNJOH6xN
         2YiEn9b9SM9gkoPQ7dZ52050+8pI3Ry1bthBETvr9lQCdOl9Qu3kktbppwiHNaUPXny0
         Eo6g==
X-Forwarded-Encrypted: i=1; AL+hErF5mQRq/+2SX3nRXdj5f1Zzovhf9wMJ9cHZA4jrRKLnwx2zFEDqsd7/0/z/JYtSJZA95jsOvV8jOcU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8InIdCaHY0Ogy9E8ZqPEAdQfVLJx+ZvGisRtUuF4crn4UN+fKm
	hHDziUxgJk/hZmr/TMTDf+M8h7KtNSw0AtLFhiKh3Sm8VKOKMEja+OST
X-Gm-Gg: AYBFou2oWlumxjg4t0lZylES8qVT4GAOGj1z/4ZrMXOhW1Sd82ecPiYJsODyWwF2ZZp
	zR+S1BmpxC582mCPEvdlFsxEzCTKzeO/D5+LVjDhgk4R/fWses3UOcdHMl5CuHSYpg2lCc/v/A/
	KKwSYYFGz7t3/0qukrWdTAu+B2h27q3PuooIO79cSJr3bpbQmkTsioAQ2z8zXFYIKn4MUQS45Is
	Mz+WdVNs5yb29gycO5cmXanCk59CaFnplpCY5mll5MQobRpzH3o8m6MnfK7YCMygTUch44ee7x1
	8Z6gBkKE5s9YSB6aEnh8RHMEXcXWTYJBNLxudJydosxDXDrdp8fV8MqbUcKHtKxy1SJWUI5BtrQ
	Df6F4yTT+3lGRBHcbzXKMPKPVYHcBMX6l1vvUhDc8U/5FQlWTDDljG8FuXOLpYILx8Di4cYMloE
	48TVJP8st46+juMXqNXXAnhHkvc0Xz6jQ50DXj3g2rJ/kCYOh+JoAyfvSj51ME/3qSlAP4NSDUb
	O686dyxEOMQ9a8gZTMEFZMZhQ09ms3PvBGuVHajZDg3+kwbVMyTBeVTF8q2q8yId1P3UwrhnPF7
	jh94C37uJqoVlEWCpupL0YFsNVE7VAyGKRFzS/5a6v4GGrVL8dVaTjPUdjWpg9Gk/HOZPvLlzB1
	7x+nq/JIx26I1tI/g3jLLQo6kALlzXvDvjiEXi6x5I2W4YoU=
X-Received: by 2002:a05:6a00:4187:b0:87d:dc3c:1b5e with SMTP id d2e1a72fcca58-8bc1ca72e47mr4389657b3a.26.1794466216316;
        Wed, 11 Nov 2026 22:50:16 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:15 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v31 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 15:49:23 +0900
Message-ID: <20261112064929.11211-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A signal can end the interruptible wait while a STOP or RELEASE request
is still pending. A later teardown may then submit another RELEASE
before the first request completes.

Keep both waits non-interruptible and use the existing message timeout.
Other control requests remain interruptible. Device reset still cancels
the pending request and wakes the waiter.

Keep timeout and wait results in the types returned by the kernel wait
APIs.

Fixes: 9d45e514da88 ("ALSA: virtio: handling control messages")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_ctl_msg.c |   19 ++++++++++++++++---
 sound/virtio/virtio_ctl_msg.h |    3 +++
 sound/virtio/virtio_pcm_ops.c |   10 +++++-----
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_ctl_msg.c b/sound/virtio/virtio_ctl_msg.c
--- a/sound/virtio/virtio_ctl_msg.c
+++ b/sound/virtio/virtio_ctl_msg.c
@@ -265,7 +265,7 @@
 {
 	struct virtio_device *vdev = snd->vdev;
 	struct virtio_snd_queue *queue = virtsnd_control_queue(snd);
-	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	unsigned long js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
 	struct virtio_snd_hdr *request = virtsnd_ctl_msg_request(msg);
 	struct virtio_snd_hdr *response = virtsnd_ctl_msg_response(msg);
 	unsigned int nouts = 0;
@@ -273,7 +273,7 @@
 	struct scatterlist *psgs[4];
 	bool notify = false;
 	unsigned long flags;
-	int rc;
+	long rc;
 
 	virtsnd_ctl_msg_ref(msg);
 	/* This reference stays with the queue until completion or teardown. */
@@ -314,7 +314,20 @@
 		 */
 		virtsnd_ctl_msg_unref(msg);
 	} else if (!nowait) {
-		rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+		/*
+		 * Teardown must observe completion even with a pending signal.
+		 * Otherwise a subsequent open can retry RELEASE while the device
+		 * is still processing the previous teardown request.
+		 */
+		switch (le32_to_cpu(request->code)) {
+		case VIRTIO_SND_R_PCM_STOP:
+		case VIRTIO_SND_R_PCM_RELEASE:
+			rc = wait_for_completion_timeout(&msg->notify, js);
+			break;
+		default:
+			rc = wait_for_completion_interruptible_timeout(&msg->notify, js);
+			break;
+		}
 		if (!rc) {
 			dev_err(&vdev->dev,
 				"control message (0x%08x) timeout\n",
diff --git a/sound/virtio/virtio_ctl_msg.h b/sound/virtio/virtio_ctl_msg.h
--- a/sound/virtio/virtio_ctl_msg.h
+++ b/sound/virtio/virtio_ctl_msg.h
@@ -47,6 +47,9 @@
  * The msg_timeout_ms module parameter defines the message completion timeout.
  * If the message is not completed within this time, the function will return an
  * error.
+ * PCM STOP and RELEASE wait through pending signals within this timeout.
+ * Other requests remain interruptible. Device reset cancels and wakes either
+ * kind of waiter.
  *
  * Context: Any context that permits to sleep.
  * Return: 0 on success, -errno on failure.
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -20,11 +20,11 @@
  *   (RELEASE command in the ops->sync_stop()) and the ops->hw_free() has been
  *   called.
  *
- *   When the substream stops, the ops->sync_stop() waits until the device has
- *   completed all pending messages. This wait can be interrupted either by a
- *   signal or due to a timeout. In this case, the device can still access
- *   messages even after calling ops->hw_free(). It can also issue an interrupt,
- *   and the interrupt handler will also try to access message structures.
+ *   When the substream stops, ops->sync_stop() stops and releases the device
+ *   as required, then waits for pending messages. A failed control request or
+ *   timed-out flush can leave the device able to access messages after
+ *   ops->hw_free(). It can also issue an interrupt, and the interrupt handler
+ *   will also try to access message structures.
  *   The messages retain references to the PCM buffer pages until they are
  *   freed, so late DMA does not target pages released by ALSA.
  *
