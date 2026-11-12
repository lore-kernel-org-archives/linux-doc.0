Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458160;
	b=G+JXURHGJN7+SUwet1cPFXkVfF4wOTHJuJmRYEZZn2kulpIdOBHy+uX504Fbx9G7OiCb
	 lk1sAYFZtCTSvIdkGkXnQakYaPO35LbYiTojmCHwBn8OGIE7nbUe5u66OIBReB6dTk+bl
	 QmCccoJs3Kx4SxRP6LMvswYDVNw+CEiI1qxHAwucTBs7UMh6KIAUobWLPvUKGlHzn7kih
	 NYzrt6KGeQYhwg5bI8aU/VzRbLWr33tzav2gUwNjzPyn9s+KoNAQ/lQ3oZiOw8S/6/k6y
	 fu0KDgkYVL+TsxBP0Kq4rfrfiqxtYG2YZHN0ilUxWcTLpwmh9kHVb+e9oR+ijjY9BQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=AZNZ5Xr2WOtgBlCMLa8OiDjXAzcR4E0YyzIaJVkxEBBmG+cflgW7mgkS6FnOWZKlGEuz
	 ou+t6GuqwW/rQlIyzHcIJZD3DhxvUd1U0ZxsG+CrovZ6BSW6ZJp8mT4F9DA86R5trXUf+
	 lzF7qq1tvfmlfKwDIZeCb1w8qr3+3wZ+ZM3N3/c4D1Y0AdHQfSoddOovevEAPeibyvrv7
	 wfH8w3oWy1DlvzwFJvPmFCZz2WaCBMUB8RCeFlfOPJ3qfKE678WV9YUM05bGQX3UhWfjk
	 icUr+gqoi4hEukCK5njjsCoi8oU5snYZTBEkFJOjbkawyGWeyz0jFn8pGK1pkLggcqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6266F606A8B3
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:36:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6266F606A8B3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JTkeMJXG
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2364322a91.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458160; x=1795062960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=JTkeMJXG1EUIuRAwJuZAmcCoanMWGO2nwXFIuOVhmc5stMLi9t2b4WV64aeWIOiAVH
         OcWRKOsP2mHWHViF1REm6HItaAYr4JiFE3zEzcM1EZ/yBoSmdqzwI37Wbrp5uk//V6Qm
         WuA8IuIlHYnJdu4GR4R5RsZ6TKBd89kdJIaiKos11R00a95tVzhCaNusd5CvTSacWc3F
         VhrlCvDvtvF7Ln9zaBORWuvgGeEx8/A6eoIOyu+NzvSy0WqDwi+I6Eg4+hflGYNvWF69
         G2YO0GUqFPIO96xR7vIHX2Y0Jsi0qbgRtNhCx+Rbml+UqYhjA636FWLPjhGtdqJL80Zt
         kclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458160; x=1795062960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=jAorILXAN70kpFFE8sWZP3quOc0O2Q15MvZWSi424paZsUPTOl6xQvtC9wheyZmSCv
         stQqNs+VjL0fAVxA6hpo/s2qMwjH68NjH1cnasTZUtyo2KYLV/21/d3Jz3NWL8bFfYqH
         ujZuzcCiVpmn0cfrHJAhDl/eHWGvbjYBdZxRNv9H1slhsvklixhURMfn+Tji9MnQzB72
         VDg9S1rbh+78lU4NKxGdMh8S7FMrvS+RgDjeqwTrvXu9PVbhU0EnBn+fDyATS2FWmptb
         4xopqCWlfA2iZMAybJ0e5x+TxSAc94Ph+Kt1HfsW1zC6nT9+LPEcd//KzRDRybkuCJbn
         7NZQ==
X-Forwarded-Encrypted: i=1; AL+hErFBPacanPEndQM1Vwtq5wdFJIyoA3lmm4pw6fBQZwFacTgodR/z+rkr4zvZbWtRxHrIYZ9JwFg3C8Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jRH0Ie7nruBACeKzTnQet9S0RgYotN7xET+/6De1K9vFZ2QMU
	7XLbf4JDkf5Su6m8VQAecroPgydjb8MAd0r2sUfh9lB4W0BgshRvXNts
X-Gm-Gg: AYBFou1ovblZ5XVucBZx2sF82Nr2hJX21Zi3pIp2zNBCpHdv67IUEc/4qZsbTpADJbp
	9CK9wyv9KdvsE/ybBj+gCtIHd134A425nExsorPDtjq9w5e/4sXAAzw4OZJpLNV4bKf/uvcZsTA
	ftYG0JSxbxXoJnFBS467dKOT/HUATjkeunQYLvjwrDoB+W0eDFxTIlGBrkQGAXr1GLXjFF5Acxh
	wQyfVaqKnm1MTDOTXxAG1+OV8lcivqEPpWBsGTFzUp1hMXkBP5nOSg5AOAWbroDidGVhMhxajP8
	d4mS1QW6ZhtJiAYT409TRFlYJyJrlnvasWkEZOdKSP6lwAdihcm1ZoaS3fzi3l+95R1nL4F2mFX
	nG0OuEALFqZHinEfC8ey1N+jMMY4lF9OAHSxU1Qunp1UG8X5KAvd5P4oXQtGvbSJ6+RD9Vy8XQ6
	ZY4/4oIp7TvWIa+SyCEt4fv3inEh28w90aJmq9NpvY2soedlFCwEswpCXWDbM+zfdBIFb65cN8B
	gOuZW08qhUnW6QHmxWh7Hv3X/kw8AZP0ul39e4j3JhqEImjeDLb+q/aYn1aaw4dTCTXyNy2kmsN
	WMHRiShbFgpOZrg/M2qpfEzqcf0Sfw3wYMFzAQ2BOVJmJmW1Zmy8derC2YiWHZN0t70Qpj8zKX0
	DX36U+U5mj2sjnFV85Gw+5LNo22AMCJOkyHuQxVkfDRGFwmSV
X-Received: by 2002:a17:90b:691:b0:3b1:8300:f48f with SMTP id 98e67ed59e1d1-3b18300f503mr3347378a91.51.1794458159800;
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:59 -0800 (PST)
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
Subject: [PATCH v28 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 13:35:10 +0900
Message-ID: <20261112043516.37010-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
