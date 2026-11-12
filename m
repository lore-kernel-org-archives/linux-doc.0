Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461732;
	b=pEt0+Xjpt4jeh6+6AxP+IVqawAQ2XCpIFOkdbPvPaU7gUBn0+4FHcqxXTdqy3lvl0wwF
	 Sgh9RF0EmZi1oyzxa2hKuXAVU0A/AHAi0S223PzRWwCx62kYrzjBzVLSflZgKs3LlJbwC
	 UOdPJuGzG3jQ8sW23dommuvCFF/zYExSbOa9HIujjMxIgqQTPznik+2Rw0nUmtyI4j1HU
	 z20vFlTVc2F9ol46+mgXs4SAc+69XC9OT8nBIdZ68wGBfCRu8AZ6ImV1CRumHt4Uy0rnq
	 ggC6rMSNpbjhs3lQ0q2kPKN3V+P7yCR+zspRMyc709FtVTQNfCPM5GCo0uzClaYgwjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
	b=HopVnDis4BL2LRBe68UWgOTe6fCAi4LdcDxk+ziQjNNvOsbD4CV2kNl0Ls2EXERdEuL5
	 0TzRoZHhS/hxuJpSb0pBFM/MleG7Yt3r+oW30qiZSzDj6yVxplpUteRqJG5kUYsi5d5zE
	 UQJT5vh2q4V0a+TiLBcro3tIJ9RkPlJwEu1dSR2Cm5847Ip7lqeLCtNWPXkAlnbNsg+mk
	 /ANR4zrdxmkvEQfv2gBABe2Fp5bTeHvX8vxKx64eLNMQSMAyvI9zNK2dzy3aYkdWd3cC1
	 CctgA77pVPHz9ajgdTatS3tvyd2eTrJoJvR6QX+LlyJSkJWqMKeL+v536TIfxOFg4qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Pvk/VmPv";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9E460A3829
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C9E460A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pvk/VmPv
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso5496232c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461732; x=1795066532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=Pvk/VmPv9yl0xG02W/PtSlGQwlX3PtGEC/LGrNSbXDH0MnXsAqYxwt/uUNZ6eBp2BW
         LUPcE9vlpfjiEIGqFuQBz9moMaiAVxjFgyj/aRCOdFUc8hw0a5HmZmFwqxE8OZ+zEE19
         KciE/RWGeLQohHdknFQyWVCTLW33Ozafmw7fogmZ6VPMhiad+kooGFaLXsZwGs/PRsXV
         gXpNeYX5DSkEW+A5I8PRcCb8tHCInH2as8gDZEofE1MAUpD4fV8PWsteBhATUW/yefhV
         +0FYkR4LB0uLWN+j/noV/7GIsjSJVjxoYA6RnoM6sgMT35pBjjCU+9XXyyw8hqQbR04E
         kfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461732; x=1795066532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+sVIbp4DoVMcIWaKe5XqLWovfYHU/r2Z29X5f79OW0=;
        b=DHdEC1dmlLjBjg7flw93Otf6jAOlRirgFavj/o5T/WSn9wsE6NAWhxvcz9uzQnhN3T
         CEjFQb+SF84JuDEnCnnFb8q6pn7xhTHcTqDtaJCWOprx3QvumZr/h/JaLtzDjzw3yIX+
         aI34AOs3Cia/t3lU8c2AbAEUs7DKpHFltZt08hZJasAlY/Y4/SHYJIuECi5aPyn2NJVm
         ZkPkmlIvGa24pv0LLgAnXVNqCTOUcX7v8WDS7lIN6OWExUCVF26fiq0RThK4JKlcmc89
         HvpA7QwUoKVxgmk7OBvB+Jgse6h23UIaGk748l7VnlAHK0tU3S5hJBnc2Py2qCTHe7IZ
         OlMA==
X-Forwarded-Encrypted: i=1; AL+hErHzDr3C8hjSOsuqOObbxdW3PxrGSvqjQbJ1vFrn41+QZ0hpEps0ULpuTAB6IMY9LjZTEucZxuj/94c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eloiEaT00dsYyTaSnxnC6dnfaxW+N4dwkj/HC7tKVG7YC/iF4
	zNbPDE0VbLkayqcurHtb6s5ZQAsPpPYOagzKT8x3ovizSyre2klfN6vq
X-Gm-Gg: AYBFou18cySwp1Ueh8Hv3kOWWHwpyR3Do4Rouyd7IJvGg9F0UopBeDWYGmj21hqc5IN
	2qNj8TapNeiK0TKXMXpHeHtwe/kZqUEoByNiwPd5FeulvLCh+ZKOQLHxhOEU0WpYDXyAb+olp54
	7nanBMaCol5ZjBGQ7v21zDkWPtxwP2g7qskhtUKQL0LER+UNuDXujiaFQMaBgozxN7oEFt9t9qo
	wiJ9iaLfTCnWbE9CrukbrTkbZNzgHqOoONHZkhDJecsA1XR22IfFGN4FL7K2h272YmpGVv/vPry
	6aAEmsfFOtNSMEi6YvVF7sLTBgadqPQNqpPNZ9LIEpzCXfbvk97vHsT9aySZGYWQewKXRCXdS64
	tLXJFdoKvvS2Uhe5KuOXMgsTegkP7oiBPauxLsZ4e4b3o77cYHnJYQs8eWJ4xcG52nvFq954KAm
	iStdCLUkuauTWFVAqhD2dz+WGs7Ii9Pj2PMmARVCgTWYbFvnMhViLGmruaoLpN6V0EDDniqCu1M
	3Qqje5u4N/JzA9CWK4rC8yxV4CY4kHTtFd8iRf/B+L6UgSnIA54ySt1dBCOzUzldrxmzRaX02mQ
	b7iidQUgZJ4bVybd4sassDwYLGm6GiVSGADxB2as2nRnIW6W2OPPPBPA5X8uD/z83+j1YIcxy5Y
	w5wnbJPjmErTNpcmXDMSX6S/C/j1MjZxWpgXQ8kyYGZDgNRY=
X-Received: by 2002:a05:7022:2204:b0:19a:20d3:a3d6 with SMTP id a92af1059eb24-1b3c0242211mr5541040c88.1.1794461731568;
        Wed, 11 Nov 2026 21:35:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:30 -0800 (PST)
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
Subject: [PATCH v29 11/17] ALSA: virtio: wait through signals for PCM teardown
Date: Thu, 12 Nov 2026 14:34:40 +0900
Message-ID: <20261112053446.73504-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
