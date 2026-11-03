Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693315;
	b=B0xNAot4kngywwIj4iq/L+hRV48weOHzgOsvOT+PbZdcXk2VrdItzSZsbfkHiGjL1zGf
	 nX4iSUog5l692tf1yW0wFE2DIvjWBWXuPWUKfF/wfWkapdEvDWxGW3D/xkJ9Qhy5fVznb
	 NQMGPWKBKDmdPjoEu9Iiq+AlFovdy2bAQpJjQzgZ50Uo5vy9COwqb0I3EyFlmGwEeTuMR
	 XTtX94ueBRF0g3ll2ex4jFmaRDgnznxKPV8AUVKOU+2FFGEkaCvYdZ3/zuWc55Q2YC7T3
	 n07TSDxC+IPPUD3N4jVX1WlL3bq0ah2/Y+yEjnDIHqanfNFtCh3Xu/p5ZBKpKeDIi4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
	b=WzRf8TSJnRTxI9Bm82UP0dfhJKuoDDeTgyEVZz5ZGuBQ1jVAEwmBTGBjB0Yy16uNqfzQ
	 jJC2qvzGacXQfnwctb99+ePacS+fGe2RyBu+x6ibodwEEEJUnuQ5TfBLxqsLdB9VaZpH+
	 0uGeZkxaJysmc/9vFEi+G5/LTaSE/adAT8hvLQiyTS8yAS6rydnuW+U+asr6UU+2PL7F8
	 RRLu36OBLtyq/uX9pc8evEcxKaMmarORFRfmmQPYWBx1322QN1JTeakh5M5wAbl5CN4kv
	 FHa2f8nC5MrAAnOzeBbmEV30o6BjwdkCR9X2rjy9/L2d5d1tzRPac2l+ikGkX6bwvMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE353606A330
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE353606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niiyvIXN
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6541028eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693314; x=1794298114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=niiyvIXN4PAwhNlzK/S6Yn9Bzy5e563tSmRBMUFSntSGgtzgz/5AfCYP1mR3H92V+L
         nDa0RLgNNdOgtV9GRnFogq1evhiEzlIfdmUqP0IGJYtVDl0ntlkw/nqmsPWOA5eccx1R
         QRBZalrpfvhXZTogLFnWDT7YQKfI0+DaPleVel6kWzriZ7vve8i5nT/+SRK91j/xbEBn
         jFwdZ3ldfwmD0WKTeRu8praIrDM5r0RzqvZ5KqujTSDN1F4fs6z9rcdWKWgfSXmEFTVQ
         Rk+f2H+iHHOB9oMWHIVwjzvmoZfblHEXzcMQ5qhRhIwbQlI81b4QSfjhWrrOBAQEjVKs
         HCOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693314; x=1794298114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ISRk/hThz0s3N0yY62fPvRzMoAMDGueG8DMaorOn1g=;
        b=hKf6dQ3wQ760nZbfLE5nCPNV61LVXHSAbD6TMf+5V+c3hHcI1eAweHAwsxvIB6Z/3f
         aYX8IiOb7+3Fs1b4LiXzmYEhn8LeJNF71liGK/uaeAf3i5j5d7ZIxknYT6nPh5AKSsr3
         hPspQb7z6UgL1q0SSwTl8RGneyBgyovVH3B1yqr6nZ2P5MipaM85VX4L2gHvHfbAsfBM
         0dgmLuNzPIkg97R4mqzN6caAUcjV98r2ilP8fnAnsq0Glvu2xiOBccQ9TVKjAGXog5TV
         plGXyHzThO0c1Y3CeupfFzhkyfWfcoCaa/U+78Rausw066bEThsu9ZMWCJSJavl4WApY
         IBjw==
X-Forwarded-Encrypted: i=1; AKwUvBza/ErZxt8jFwKJ0R96qbmZ3XJJychlFuCTnbkHGkI6kmubyrZGYfhv3/IXl+U/822EFjNNMh/1KRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+e7gzv/KVy2kiR3SS/5CqvxsMpeZ7X0487TMB+iLwrTyr/tgHh
	y1fUms/MQ5CFmCKIhk9kmNuyfQgW1HESdUa2IWY20lY9z9hIjvNUVPg6
X-Gm-Gg: AYBFou32mXvf/eSbC2o5MGRauYkfuazvylxy9hjqv3ZN/Q7EIXU6vuusL2fWKamOqVS
	rzBnfMGXmUACnlslkqZcvVbsBFf9nVI/Sstnuscb0EnbsHN93phlnHmSeoi9+0QrIBSm8cLzyB8
	uHLK1dqZ/fUUPnn2wINrYIfnQ+3sfM9KF4tba8YmbnuynifWD0WmAt6wuF2zxcTvW9b1nnUR+sP
	THZY5bUGG1i/DWqprAQgolzkpyauZ00AmLlojDsb1deyIz7ULMSCYHv9w9Sye3ohQR6CoblT7b+
	TxKTFq0sXwqcYmHM9SwEGraf6G0Nrdx2NVB+3FXw/YO8j4RQZ6yqMLDciy8RgobJh3mqbWtxEDU
	8DgYa1CeDZhIaWTUrBkaX22/oagm8NtkAAihwq20PS5jbvkgQENOyQOHkegdURZgCQfKdGkgq/f
	rpM32Lxiy27RylnX7xNdqcHpBxYI8bpZpqsuHcOpIWXHN+eoahw4oqXns4SFKV54cOD3E1yBIIt
	5RHrrADIEkF06ry/ln/kIPiKLwnoG0GPb4wlEUMQqRh+9kYj3Cn9ukRf2f7fcRe2qqyIjtoznrS
	NiynCk25Cp3KjYVuBl1A3ZMexDmAqd1drlLfksnMKeH8DuADUE5yuIjhIzAW+B3+/PIttEni4e0
	GE77ZNPuiGhlIOmFDxkVqEjG21+Bi3dhB6jQN0k9j1/D04QY=
X-Received: by 2002:a05:693c:2512:b0:369:fa7c:aee9 with SMTP id 5a478bee46e88-36a423f54a1mr18011806eec.19.1793693314004;
        Tue, 03 Nov 2026 00:08:34 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:33 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v13 02/12] ALSA: virtio: Recover PCM state after a failed start
Date: Tue,  3 Nov 2026 17:08:11 +0900
Message-ID: <20261103080821.16983-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE
is needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
 sound/virtio/virtio_pcm.h     |    6 ++
 sound/virtio/virtio_pcm_ops.c |  106 ++++++++++++++++++++++++++++++++---------
 2 files changed, 88 insertions(+), 24 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@
  * @hw: Kernel ALSA substream hardware descriptor.
  * @elapsed_period: Kernel work to handle the elapsed period state.
  * @lock: Spinlock that protects fields shared by interrupt handlers and
- *        substream operators.
+ *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
  * @xfer_enabled: Data transfer state (0 - off, 1 - on).
  * @xfer_xrun: Data underflow/overflow state (0 - no xrun, 1 - xrun).
  * @stopped: True if the substream is stopped and must be released on the device
- *           side.
+ *           side; protected by @lock.
  * @suspended: True if the substream is suspended and must be reconfigured on
  *             the device side at resume.
  * @msgs: Allocated I/O messages.
@@ -56,6 +56,8 @@
 	bool xfer_enabled;
 	bool xfer_xrun;
 	bool stopped;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@
 
 static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream);
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /**
  * virtsnd_pcm_open() - Open the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -115,7 +124,8 @@
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,11 +227,23 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
-	if (virtsnd_pcm_msg_pending_num(vss)) {
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		msg_count = vss->msg_count;
+		stopped = vss->stopped;
+	}
+	if (msg_count) {
 		dev_err(&vdev->dev, "SID %u: invalid I/O queue state\n",
 			vss->sid);
+		return -EBADFD;
+	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -273,6 +295,17 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
+	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -311,7 +344,12 @@
 	if (!msg)
 		return -ENOMEM;
 
-	return virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	rc = virtsnd_ctl_msg_send_sync(vss->snd, msg);
+	if (!rc) {
+		guard(spinlock_irqsave)(&vss->lock);
+		vss->release_required = true;
+	}
+	return rc;
 }
 
 /**
@@ -338,31 +376,40 @@
 
 		scoped_guard(spinlock_irqsave, &queue->lock) {
 			guard(spinlock)(&vss->lock);
+			if (vss->stopped) {
+				substream->runtime->stop_operating = true;
+				return -EBADFD;
+			}
 			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
 				rc = virtsnd_pcm_msg_send(vss, 0, vss->buffer_bytes);
-			if (rc)
+			if (rc) {
+				vss->stopped = true;
+				substream->runtime->stop_operating = true;
 				return rc;
+			}
 			vss->xfer_enabled = true;
 		}
 
 		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_START,
 						GFP_KERNEL);
 		if (!msg) {
-			guard(spinlock_irqsave)(&vss->lock);
-			vss->xfer_enabled = false;
-
+			virtsnd_pcm_start_failed(vss);
 			return -ENOMEM;
 		}
 
-		return virtsnd_ctl_msg_send_sync(snd, msg);
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc)
+			virtsnd_pcm_start_failed(vss);
+
+		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -393,21 +440,34 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	if (!vss->stopped)
-		return 0;
-
-	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
-					GFP_KERNEL);
-	if (!msg)
-		return -ENOMEM;
-
-	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
-		return rc;
+	if (need_release) {
+		msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
+						GFP_KERNEL);
+		if (!msg) {
+			substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +481,13 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
 
-	vss->stopped = false;
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped = false;
 
 	return 0;
 }
