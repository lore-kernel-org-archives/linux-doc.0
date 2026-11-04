Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758692;
	b=PCO2OgEifc0cuV+ttWurMduk0kOTrXiDSMjZ9as0EcHg0qGnlu1dZqHa79QYM8uxYdP1
	 2yJqLHTLF2YxrwgUtJT0H7spYatuTDFMen+YO/kIm/0aK9geeJ5Z0G9qXINEQZWzTLYYT
	 uvFXxqZmth54b0+p0eXAAX+Q+MQiOToBoyVjurUschZXWX72ON4Pgvk+h0cwj+Liz2/TH
	 OLxI8Z2+hSyAkLjOUDjaLuSv4OTnyokPGue72FT192bbdXORsCG4oJof8SR96UFs3RP+4
	 DROGejrEWu238rGh8UyfS/jBUkgBo1489Nfe0DA+2yiE20isz+4NrTHpaw4vL5wKv6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
	b=rg2KUgVx3MBlPlwEeYwdLaxa5qAa6CWjwymgqTqZJcLvE1gH8qCfG9f7aAkrBLS2ILza
	 Ve3EZ0JZoheEpv7I2GFVDFtQMENN6AF/0OAU8MV+v+NhFw26mwZ36EsT9qO2E0GgkhdmI
	 l4gZZLxdmNAlby+ULODjZR4J71D1NuCDgAr2l0RDncKHA+PfHWowCpial0kFmsrZoXXGz
	 W+mc1WzLbSPm3ldEbfGN0duAEc4/1MujxOMpTl4P0cqIWl4CLyFWXSrYRRGluemAEvsAC
	 SlFcZON+xU3Sq0yDyyu2CrRhJDID97261nGPjmDaFoWfUZE1fIvRMyBuLmpeAGLi1iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9913MNy;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A956606A331
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A956606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9913MNy
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso851242a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758691; x=1794363491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=L9913MNySs+SUTg8sDnx0aDalwSe7PsitsekhAP4DwO0JUT/XEG+Oquu8q/1/7i8gy
         kxiKnWNtnpmtCjz7RjpOLpJ/vkP2WCyTv/+DN9XvSKqunQ12vYzbPnrRwvAmTnny0Ddt
         ec+MfLTxmqT2WKIS4MpVG+mKRylbSl/2Wwsm8H2rBapR73stiMQB3H38pAaGG5gN0l1X
         pZ58i/tOZgH9+qw+X9GGu1JE9bpigY2bz+owOPRplRiSzbtvMjqYxbj6CdHnwAooG051
         pZkRYojund7R6cvT4B/PI2+BLXg8hPuZXdAZGFbddkzhYwYYJiXKpJ3PzeHmAcFZ4PD9
         4yJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758691; x=1794363491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4/DGjjZzZ0GRb1AC8/DxRH3JZkBlPhNEmvZ3LAb6pIs=;
        b=i2zVw2FMfj/cpcrbz+2KzkznzyB9tabpht1BmIzbwpVOB12AzfcL5r6qNh9qJtps/5
         Rq6HjpnU9Qz5BYn0wxn9s5nPudtvKQ4s94UCqSpCBstJWvHnA15d7N7EMTHb6LYqUgW3
         vsCMR1yIBOib9hqmdUi2wHY1E1ZeY+KX448WXWOwQFacP4Uu+W/MRD+XxZUIxf4YBymZ
         FKoDkvbOEn90c8SLrBQLKU7SqKKPxcPv6mJlwVZt6UnFhLjmEXFRytHf7hIyQl/VsIgv
         W+VOgplA4RxZkBohiTXtmf/QuxwNr854WYpiNmwbwnJfNBujw4pyZc8hmUSKQF6Stnsv
         93Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxIfEYw95H4LqB+llhMPR8ExRtNMVEuTDdZ+4DqLWMbdDOFjVKSf3bMhlrxiu5pZqRuqnTkZwWtFLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BOqzE2IikKbj/+WDkwcCGCgywffUX1Gw4ePy4X1ZZDAiq/k+d
	9nQ7b4gpMmrKn1jkeHCeCzau5b0tCl90A9EXWrZIpA4PU2/5AdjpkhKU
X-Gm-Gg: AYBFou3jP+vtRaV3sumv+1hWURYhpun7TwL4Z5/AaEZcT5OND/2MGc1ZxxsSYfU7Ehj
	LLG77IvEeeKstkuCVEfLkpCoXCWU2w9yWAVcV7DuD1wqy6sGdCgS2IIbltwNK3hSeqKKzdvbez7
	VFZ7R4BcoI6QIlDTfPciEXge2VdKa4PriCB9jg3myw1kUhx9Z6Ne8p7/YVfCPAliECdSq/HyzJA
	yrBDEuNED0WicEFrSItMfYG5y1AQs/uKjqZa2vX4CJdNOiwlFCHTfdSIjkc/JS5kiJe7+VtwA12
	wbsanh5Gz0khp3nf+z9y4Z7ML22ZYrOzluIVUJ7Uyw79l9sZNX3oHqo3jHDxdPqOl/dvUBqM7zz
	vPrwqkD3YJK2barq6EuC0Qmxba0yh9eXWDfSUte40UgOiqi5QOFsRlGA35sfKT+ze9v8dPDVdUh
	bpJOR1v/Z5ZlXsMez1eZtOhO04ltZUUgJLUsh+4He1cXQnkUcCBTJrOvMDCyt0eejVEtiimpQ7t
	tQ5uxV1vvhEddmnWe44Lt6uq8Nf0gykySPlz8KJ9Cgf9QGK0pyi+yYvxham9ETZ+LkW6maCJm8Q
	SyTVpCTwQuhBxhdHRY2ml60QKzGlI+54dZnO4pAF4h7KQHsN7C0/xnw2vZ6OgiJry5fqWIaRdtM
	J2A4PF6rrobxB6GCwhFQ5A7vdw9aYkRcrXdhxxDmwSPQFtZA=
X-Received: by 2002:a17:90a:d887:b0:3a8:23eb:d1d0 with SMTP id 98e67ed59e1d1-3ae6f043acemr12766619a91.52.1793758690497;
        Tue, 03 Nov 2026 18:18:10 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:08 -0800 (PST)
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
Subject: [PATCH v14 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Wed,  4 Nov 2026 11:17:38 +0900
Message-ID: <20261104021745.57733-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
 sound/virtio/virtio_pcm_ops.c |  107 +++++++++++++++++++++++++++++++----------
 2 files changed, 85 insertions(+), 28 deletions(-)

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
  * @prepared: True after device PREPARE and the core pointer reset succeed;
  *            protected by @lock.
  * @preparing: ACK gate through teardown and prepare's core reset;
@@ -62,6 +62,8 @@
 	bool stopped;
 	bool prepared;
 	bool preparing;
+	/* Successful PREPARE still needs RELEASE; protected by lock. */
+	bool release_required;
 	bool suspended;
 	struct virtio_pcm_msg **msgs;
 	unsigned int nmsgs;
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -116,6 +116,15 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +157,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +259,26 @@
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
+	unsigned int msg_count;
+	bool stopped;
 	int rc;
 
 	virtsnd_pcm_close_ack(substream, false);
 
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
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 		return -EBADFD;
 	}
 
@@ -310,7 +332,18 @@
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
 	int rc;
+
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		stopped = vss->stopped;
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	if (!vss->suspended) {
 		if (virtsnd_pcm_msg_pending_num(vss)) {
@@ -353,6 +386,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -395,33 +429,40 @@
 			guard(spinlock)(&vss->lock);
 			if (vss->preparing || !vss->prepared)
 				return -EBADFD;
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
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->suspended = true;
+		vss->suspended = true;
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_STOP:
-		scoped_guard(spinlock_irqsave, &vss->lock)
-			vss->stopped = true;
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		scoped_guard(spinlock_irqsave, &vss->lock) {
+			if (command != SNDRV_PCM_TRIGGER_PAUSE_PUSH)
+				vss->stopped = true;
 			vss->xfer_enabled = false;
 		}
 
@@ -452,26 +493,38 @@
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
-	bool stopped;
+	bool need_release;
 	int rc;
 
 	virtsnd_pcm_block_ack(substream);
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->release_required;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
 
-	scoped_guard(spinlock_irqsave, &vss->lock)
-		stopped = vss->stopped;
-	if (!stopped)
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
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return -ENOMEM;
+		}
+
+		rc = virtsnd_ctl_msg_send_sync(snd, msg);
+		if (rc) {
+			scoped_guard(pcm_stream_lock_irqsave, substream)
+				substream->runtime->stop_operating = true;
+			return rc;
+		}
+
+		scoped_guard(spinlock_irqsave, &vss->lock)
+			vss->release_required = false;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -485,6 +538,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
