Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355593;
	b=xXKuVg4R+guNtjoq55DfQzG0FzlyLhLraTSmruGVxCnQpwNET+H46AO1zBAe3r9E+a2/
	 Ac0v8a/LKwRCyAEIuH7rhvR5UjRqWM3Jzp5fbMCkyOwKK5CbjQNRa0PHu9T2IYlo955W6
	 73Twvql6uW3m60+NjypAdyexKyxzQPUvYW1X3nhCDsG6rDTAV1zkUKDaIL6Uk7wPMPMxs
	 Ax+aUm9o50eHuDnSmZwJSD9tYB1L6fKJ5vfWGkYEKBBsG8s2RUtfmWKjv7+2ymaqojcaQ
	 jUj+YddPlzLU6RRSqDg5BiP/5LRdNWbws9zIgQMA4q5SQ6Fg4NvGWUe08hu4q9Cor1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
	b=R3NDhlo0nyLaOh1+4x+D9Z/WPvXD/3lx8ZHDQT6gY4LHiRgLDnhMJLf98DeAcAq+ai7n
	 7v6piFGSgcdvWN1ywZFzYqK+1HggPLryF8MjPrxzd7ORG5uY+R1a0VCDI/FYl8XvDvVg1
	 qqVqSiuQyCS3nEk9QNicvGtAK6d2UHkIOASvu6yui7Z8h/UbbZYUCCTrsYHhc0IWuABGU
	 4gtyqqyz7DLSstOmNbgVU8CraePBYLQMkqCMFUszFtiHgha3IYTqxStDFgNSLg1J+DJ1S
	 2ITJjZHXyMcjxDUwYeZqjGJpk+LxDtm1u15tBwQVvpkMG214ObNJyLMTApOKYR+ME8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuf1A8D1;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E916060A5BE7
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E916060A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kuf1A8D1
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso1252090a12.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355592; x=1794960392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=kuf1A8D1SwA9MM8sr+La69yWKRuIgLtVUHjkKyT2+cFWtDzZgl8ZVd7hDDl+dtV8YB
         TWt9iUE5/TVqT/ImRwcmRfmdUCY2WBU/3Nunj+ZVpkn9l9JLhe0psXOrqkW8uL9VqKZn
         kL1/36MpnRhRuFPRfY6rPEEE1eIewggON4Glz7rTpSyB8GP/9vS7xS3ZMulniZcl7Fzn
         0f6ZzzDEPVVPcC6xgr1oZjd/7VptI+P2ns/YW2FiErN0lyiSTNiXMLPgSQ5lxKtR8Dc8
         X4foUiztFz9EmqXg835PJfgIcVX5/vSZUDY6y5BW3YCTW3SeRVoppnmtKIcT2BD5ycFr
         mXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355592; x=1794960392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Da9OCm5N+tM292Jb1wkFobEcv5XsLraXLlVZUfX2Yhg=;
        b=FO+zXLtR4FdgOmO1hhUc33PxGxu5cgEg4CqDdgWCzXPPJLnRcXnotgNoohnxntK30l
         GdAoc/vjs4UAbKdVsOSlWEwVlPENan30hvyHtwWjoI9/XuAS3SG8Lz+jGXcCjw3CDmdx
         2cDPFX55EcgaJRrxY/qbUQc3gsgpT/A1wFJI0pTtxXFO/KZKcZOKNWDLfM2ZHuFctK9t
         Kn2/luY0PnVzRnKNT8FBWFwtRB7vvJDJYDDmE3GLTybGXoPKDG3pXyPjLm5IcK07JlG/
         e/Nct5Xgr5a7EbN8LrTaT9wAGCzq0VLYKdn5Dp+aOJ3Z97x9Um0qEiZ2MCrAB1EhUGRy
         wzYQ==
X-Forwarded-Encrypted: i=1; AL+hErFi7zf1MjZ0SUeHcv0E+WjvHGyp2fa+srH0ukx0DpBNC/xFjXjB8i767FTs8LQS+Mux/fwKliY/z/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8G3sWk/13K2h4fQ137wTFnMTHdTM4eudG02oO4/WLqeuvquKd7
	0aP9fhHYTwVvyMVgN0rOhgCmRB999QNUvQdGlQizHocEYCuFl8ha8Hi0
X-Gm-Gg: AYBFou1Yj6Wy/F0Ueehy0K8/RbnGP/stZ2IUH2T6WSQayNUDQkgkodd0lKEqv6QBoz6
	MswlWESkBUN+lEirF7TstgnkITM+4fp+vLApiSj2a9wSvXtnRaMDrIzJRGLwnWTlLbWV+8x5ZLC
	avE779wUHTLIzYbuO+MzHEOlCFm80mDjYKkOHa56TJViIOAOuQJW8rxjiqD5fq7yHhvN9wkKemd
	7Jfet+CUqbSnC+Cj9HmAtedy6Wdor9+YdOYBIIbWP3sNLjTqaNmYja4F4+tfQKk0b+uPnvPWQH3
	QZV1F3Gl2RWA7rVqPSP/stLNDyOUlp2QN83RC3Wvpgt5l9GqUALWWYKekK2sqhLmDGNsxIdk3c7
	RIv15b5UkRdw5cpyBqN2Xn6JJnkk1fZ0TupBlkH2QulRkH9ajsf2q9rxLmWX3YQ/Swzh6ClGEgg
	Gge1xScHPXHtZGBED+VrKHJmSfX5bT7kHi5xdMs8Aqmp9qNgdEzsptHCJ6ZaQ9MdjUgRIzE+P9k
	HM2aCfBlqzeD5htsu279JehlCuWoupT9D4gimXP+5M+saff0qI/4pAGGRxJgtTfDWZCqmfUovdv
	TI+Tf8tTWQ8xd0J+ACgENWNtkY1BBv7IpXzoS4IxTXC4yQ9CBAIT9YfDouikgnK8dfFnvc/zDcN
	p0iVaJML9TeV5xgmnA7onriUH4q9FyjhUzitdfLqeDgr6Tl0=
X-Received: by 2002:a17:90b:4c07:b0:3ad:5c64:c7ae with SMTP id 98e67ed59e1d1-3b18300b741mr646865a91.57.1794355592274;
        Tue, 10 Nov 2026 16:06:32 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:31 -0800 (PST)
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
Subject: [PATCH v24 11/16] ALSA: virtio: wait through signals for PCM teardown
Date: Wed, 11 Nov 2026 09:05:38 +0900
Message-ID: <20261111000543.28550-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
