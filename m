Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461718;
	b=Uky8d8UmbYR6j0m9pFW8HLoc1nvPQS3S8eqY5OyOgBcmjQeXVM24n3Ykq0iZ8SXGDYcG
	 w+uNMJcarwQrQxU0PIY2wXLeY0uZvhNOSAfG6IOkRJhVYXG96qXTbHiDV7yIcCbvo/KKG
	 lgWpdvEPK4+X7RUf7y4Dy3WfsZ0GnjGpfRtCT10tsyWnID9NQN1qq6vlnlh6QBOM14GOA
	 YJJFJ1gtNryIBMA30XiFV/5xq1GYgvXWhWMPCimPbeTMiia8O6rXL74M5yH54cG7Ql5Ne
	 yb64ebOJ8nZ0Uzak8y3C8JHk0MCBLycvwcwVbDLOiWymo16RJeBS88+u09DvUNyNuZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
	b=xxrgWI64w5HW7vjl3VzywhVC0Wg7mVBNpsl7WsZxLddVFIxS9PtJr9s8wXg68o5mo+mf
	 k0FmrXhAhT3RB+8xQoQXzQMUd3f/nJxaWFpZvqn8UaSWLxiVMxE5u4IGvkz88Grtzj8ZR
	 7JQDJ01l20i9Vikg1oxFkpGyAG8+zfhqjv6abUcV62V/rnDuXRL1ChKJzyDNjv49q+ayw
	 ZU+Yaek9N0dc8VIgypmSOvJ/RZm5rc/g3AzoDVsghQEKViJO0O0jxpJv551wWbsCnGPIW
	 7KuzjcOtQBWxlquq/sF2Tn29DPwzJqAxdvhRkSSPAt6iPZy3PFEV5FyWXVH4wTI9Usw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIaBwGi5;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB860A2625
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10DB860A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eIaBwGi5
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3121654eec.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461717; x=1795066517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=eIaBwGi5UvAzQb3Y1+7fpzqKIHUI19ufOY9gfYqAYxxgdiCKoXv/X2IsFhJraDlPZB
         vRSoxgEyjKhSHhyBmJ9cGqNeKL7nd7Gkg3KsVCHRfNgAtRrNyVEjRQ1Q3cqFmbeex8rE
         83ucqSRKP/SxWJVY1LH36aXq8zJ+LU1cQoTJMgIrSTVIPPgaJaNQ7Lr8dJqPFIoxSw8b
         iIZERrHgx8w4lHGcQ4wBEvpWRvUtjtlBNlbxca14fLg71Td3Vf3ifVOqp9s08e0iPA26
         BtDCup/eIRnB3XYIjcGyIZppwPU7gJ9/aRnlaqEO8sy5tNdTamu6q/cyl+8O2v1V2QjR
         RrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461717; x=1795066517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MsI4m0uo6XJTpD5aQtetIa3TMpTeA9EBkJp0jkGREkg=;
        b=1HG5ZQu50dj0nZDCPov03b7jLeyYKN6mMRjAr2Ub4FDwmIbQe1zGeKw6XbgUmKdlxO
         s60oTbTvjRYVVJjAdd23yNUH8kMzpNgDc/igLf44qlmKjtAe5jw1MpDVSGhz9fTszpuB
         baS6zF7zAiniMWHkcGQN7S0kDXAScDxWAesy5U+hX1YFLriQNzjCoFMWQ4KiKxHZEX/S
         lNfxE63E+9+1cIq5RSpdOuIDAzR70HG5xktZHIVPEcCH71jpY9yZ5K8emFpWQ4JyMVxT
         HYamksmwvQtzPhJI7gbIp7ssu/kDcvPcx3LWdCxD0mewHTTZaySZapKlxMKrd5fsqveF
         xQjw==
X-Forwarded-Encrypted: i=1; AL+hErHVwPtTum15B8oriBrSmQKUnkKV31eUtYQ5biGqeB3g0guZ1/1IyDsRRn+xS2IOOL4CfEWALDwTdw0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85QZE8PyZrxTTrXHcQvc9dUj0DTaEvguLZZFCQVWccU+Q8nU6/
	oV/2fhwyF130COl2dnRf9pwk6ZOUzO1+7edNmQgzxDZgXXUQXSdRDHif
X-Gm-Gg: AYBFou0Bmsl7jojVe01uIb8QtkvjfaUcmdQYXqTJhSISfYi3AMgir6CrBcVAulyo3V0
	yvzouiBniQOTv3wfpEac+KKJwUzlQRm3nOO5oIFHcJPIXgnWUuOZhscR74zzzrR9neSMdDhLlpd
	raFg0pBDJWb/4ZFrNtIeeZ8t3GUVbETnUymg3ktCH+n0bAz6A+LhmzamkxzfV7IBBCy75qDP3/2
	oyYgjMuqfi8yccvivohoW4AiKRwkQHjn1ezSwdmsQEdIYw1OdSUtt3Q0JdL8VVMBL8/8fJZskww
	cNkt7bNjZA/ea8R4AdvGlpyKt8UImBE8IB33pZHxnuXGJMgZuMN49ZFq/FmHFZCZIlV3fZ32wmi
	YB5KeUEg8p5rTx5ATow39s0UB3I/iFkuDPddvWTFOhAZGUltw0wSWLMeTxw4sLgInQ3jl/yigIN
	DmCYNpnknyPNj/6TXFrq11Z0ZneG+BB1RXtT+DSo8LN6//5H1orkw8jgbFXIsdjsBDQe/VYp0Tw
	g77US8MCyAu64Ev8KBciZyEHfQzAAvvJzX8CGS8X2ffY93c5UZOpc2qi5lJUWJWkzpXOvqgXX7O
	dGjVTb2BH+qA3cBVf6SAvlmTpAof4IGriJgNUw9ucC8YsLJV44/K/JsyLuWRpxeMyxfHnxV1nI3
	BdhaQosG50eiw64Wcg0rM7dOkw8Rjv5DmFWTLuFX5g8DwWmM=
X-Received: by 2002:a05:7022:2204:b0:190:b2de:1549 with SMTP id a92af1059eb24-1b3c023c732mr5749534c88.1.1794461716945;
        Wed, 11 Nov 2026 21:35:16 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.35.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:35:16 -0800 (PST)
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
Subject: [PATCH v29 07/17] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 12 Nov 2026 14:34:36 +0900
Message-ID: <20261112053446.73504-8-mynameisjune111@gmail.com>
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

Capture trigger queues I/O messages before PCM_START. If the START
message cannot be allocated or sent, transfers may remain queued, and
ALSA does not invoke the action undo callback for the failed trigger.

Mark the stream stopped and disable transfers for every failed START
path. Arm runtime->stop_operating so sync_stop releases pending I/O and
prevents prepare, hw_params, or START retries until release succeeds.

Latch a transfer XRUN in both playback and capture, and schedule the
existing period worker so a running or draining core stream sees the
pointer error. This also retires a failed playback START during drain,
where drain-init can already have advanced the core state to DRAINING.

The stopped flag is shared with ACK callbacks that can run without the
ALSA stream lock. Protect every stopped access with vss->lock. Read the
pending message count under the same lock in open and hw_params. In
sync_stop, decide whether RELEASE is needed and mark the stream stopped
in one locked transition; leave it stopped when release or draining
fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE is
needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    6 +-
 sound/virtio/virtio_pcm_ops.c |  113 +++++++++++++++++++++++++++++++----------
 2 files changed, 89 insertions(+), 30 deletions(-)

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
@@ -116,6 +116,17 @@
 	}
 }
 
+static void virtsnd_pcm_start_failed(struct virtio_pcm_substream *vss)
+{
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		vss->stopped = true;
+		vss->xfer_xrun = true;
+	}
+	vss->substream->runtime->stop_operating = true;
+	schedule_work(&vss->elapsed_period);
+}
+
 /* Keep completed RX data valid while RELEASE drains the device queue. */
 static void virtsnd_pcm_block_ack(struct snd_pcm_substream *substream)
 {
@@ -148,7 +159,7 @@
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
 	scoped_guard(spinlock_irqsave, &vss->lock)
-		vss->stopped = !!vss->msg_count;
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -250,13 +261,26 @@
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
 
@@ -310,7 +334,18 @@
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
@@ -353,6 +388,7 @@
 
 	scoped_guard(spinlock_irqsave, &vss->lock) {
 		vss->xfer_xrun = false;
+		vss->release_required = true;
 	}
 	return 0;
 }
@@ -402,33 +438,40 @@
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
-				return rc;
-			vss->xfer_enabled = true;
+			if (!rc)
+				vss->xfer_enabled = true;
+		}
+		if (rc) {
+			virtsnd_pcm_start_failed(vss);
+			return rc;
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
 
@@ -459,26 +502,38 @@
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
@@ -492,6 +547,8 @@
 	if (rc <= 0) {
 		dev_warn(&snd->vdev->dev, "SID %u: failed to flush I/O queue\n",
 			 vss->sid);
+		scoped_guard(pcm_stream_lock_irqsave, substream)
+			substream->runtime->stop_operating = true;
 
 		return !rc ? -ETIMEDOUT : rc;
 	}
