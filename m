Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464734;
	b=jYekwsqXWwSKnXbkZf8B8jM/zVSlEEXXjdegvMJEmpegxglWZa2zCnWOs0Jmv4u4IE7m
	 +Q0pZMO1iurD8yZtw7S+npdVRmJ6p1yNhM9Jzh7JvvzbXhy1cy7GXxFQ0F7gMESR8IVvY
	 XL0yqN75GliM6kB5K6oiO94aaMqefP3q9tdy/pAEoTtpJMy2KnnUfhYhp0Grw/ZQuvWmm
	 NViX91gPKV7ZzgTiyymTPnKI5ZtcNYIFuhhf4ezr0Wc4NKdNKV7bHLzHeK6M9ZFibBvfF
	 tRRSrd4xhHLfcz6vtWsLSlf6JvodFskmBnPMVCzeul3B203Jd1FuykpyPVB7acSXWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=Y6fOfGmPf404fAN7W9fVARnTR56xgnM9e63j867yugHdsrFlIp8Xb2L0/481NeSU5Etg
	 pezdfgeCtJuy645Jb5t3w73ehL3cPU50nZ2AVXluFYuQT/IpAOkX7HiPEsLVFCU8jUIPL
	 05uygI2DYUmg/Sg5gobRQI/tnQ2b2uZ2QQqSX7IOjVLzcZAISIGhvJuHWPwc2ga88MXPp
	 kCGCZjK9rcmeHIwqakZ6ZcISsNepifz0KfLQiI1cSKKV2p5187N9LVuMDgdXww4Uj2tyq
	 i3ejJtPOLWkd5B34NypH34PR0HWMj7eHsIr6ikcUFFmC5B1NWehHcu0u0a5q4ycIO/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8ipOrHR;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A4D60A3803
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19A4D60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8ipOrHR
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ed11653a91so18109195ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464733; x=1795069533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=x8ipOrHRGwjK6mzdl0lcztBNYlGexzwLP9Vj8ujJHFteyAQ77TzK053F5aHxSYLWaV
         3Mh/M+75sM1SSjaPyTNzvGQtPv3c2xF5Na3UokmDB6Qw6bmGtKLcsWE2l0a9U9YQGZzK
         nf77cE6lvnMIGEauURQ3tom8A+DGrtP9xkfH/iIgTDpSHrNJrzEZdQsmbo9oJ3mfdaYO
         dqFyBr2XpS4B4xZOCGaYc3hKg01S6ET5DMKydziSwHaFo/kaMHepZBNLeV4Mvg6s4a16
         BaaOtK1t7qyWJNURhEdMcKfNRXohSXrJfKaS0Ow4GUR3MmSaRBO80SRRrsxb/q4nlHa3
         eZdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464733; x=1795069533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=DLcpJRWl1y8Dml9q+HDpO+t5TTpG77ofzd10oR/ms1SXY/vXRnwQAoo32eawRL8tat
         oemi3iYWzEUc8vMPhoXJ8F/MKwUNiJmTu2+FyCMiLnzJm4Rdr7rNg4YY6fcQYUEfxKSS
         6wtXzbKDWsbR8rAhj4VRw2zB6Fp9/FE9J/iA9vZhzwYjsNKsuRoWSHiirx2Tyd8AY4iu
         iLqsvskee8fvCuxRPQGVNOO93EUk/ZloFosJBOiaYoWTiUQbobwq0LjxqERGxhusr41i
         bhvp9DuNRbbhRhgaJTH8MZ3YU5moOFW9gTrXHhxsOFEoM3nxBwnQuN4cCLPnReGCYlgN
         1NzA==
X-Forwarded-Encrypted: i=1; AL+hErGyTJRvtn6YANRsdFhv+rWwuWGPbpr5eMiCnXJJWlOQFwfy3spidCxIJG3dQMQ+TVmDDamBI0KvB1c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0dZi8rBEllY91T3cWR2sEGeOhkAMW6YKTU0fje4cunMywTQz3
	vxXzV5d9L5F35YCer9/KIYGQcbrLM0RaNcO6+4dMxa3q+/Jv7waL++4wK552LQ==
X-Gm-Gg: AYBFou0eoN0qn6XBVB8sQolTkHWW5DEfy/UsGDAmGTgG2cCfDAg+6v/JuhEmWJCJzNh
	IlXj4hMRDfGmGzruPTg2MyKvdnAXnRxVe8BGra4aLsQA2bA3wZhPmoUfZA2gHa4bgC1uSN+8b6N
	ULA4QwNSoxmGtIBb/yw/L1bpiZ4/wJ3dIesqolYp4Rd9RQ8ilKMn5CQN9Ol+JBnKlRzi6RZtIHG
	a3XXtyjmWIhgxK67MzFTm/nZ7wBXzSPZTePmIM97+Mon4Ij326p6uALKc/wNPLAHSH2zO7QPSZ4
	LXGhASvVwes3rjANbBGolZ3Y9zpwY3bfwcqCZ5h/dyzSSXUaeAWRDBJVU/rQJn1S332uzBGo4Ie
	hvS3gQxw5ptf5x5YcrCqQzsj3U5sTB84FOzdDQUK+cscLg+UO2SQnmrWlvThk+m5Fn7uqvYJN31
	GlgX6PR58YnPy5XEjUw8NZsev8OdwDBIa1oVbgFvkvkG7LQwqWmUEjpZkl1JXnDLFGD7YFO/7ol
	HV1u8vlrvFkLAotESJzoVXljUYwkEafDGFvnDyqJwzzCMsnzeZz6ijpOGD3fJwemsKPL1WY+YR/
	X3t2ZNbEUnVuCsPXP+voRC6neFHvYv77gzboIYk3v6CL+Pa0iEnqQ83Ftpdb74p79sQNHr4tayq
	u24n1TjveIKWFeElfMZL4loToGTGslbBqd1Smx1LVD1WnxoU=
X-Received: by 2002:a17:903:1aa6:b0:2e9:66f6:7894 with SMTP id d9443c01a7336-2edd79db81emr47869465ad.40.1794464733463;
        Wed, 11 Nov 2026 22:25:33 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:32 -0800 (PST)
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
Subject: [PATCH v30 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 15:24:40 +0900
Message-ID: <20261112062446.159-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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
