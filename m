Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182132;
	b=WjX9bmdAMAKrBd1xwS7JxFmEG+t1di4fkqAGc33OZ54zut4zJwXfMJKll/cDDobiTq3+
	 cWcJwo/n3Pbq66L3t8pu94+OPYwceE0/tbi8mi4ev3omdHdSBK56LE2zMnthutrnrYiTH
	 oH9S2Tm/CieKXX2ylrvteWt7an19RoMWi6vR5xKEX4pSNhcNaWT/AEmurAHeclqn4zNXe
	 xW0F81SDyCxYNXRUfbfVuv+ObPBW4KsehTpXkihruLE11wHasJnn/AtrXDqEC7YNSJawg
	 Q+AyDEmnivFiGvu7dftc+BH8JsTvarpQKLwrQfbiLz+dNz0AvCAuMD+LVO4/jITGfeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
	b=kX3/9kzw4wFZ+IXeW/WupknmU65ewE1kCvXaXQvi14ESz8YOx5sWmwxgx4qZ2w9mAX27
	 YwsxiJvOmOdHD81Nwi3cIIF1DpVtR5O82lX0k33Fjm9ywmz+zUIU5p2GG3wtipbtsI9AR
	 nuneWeMSXRdZ92Zd8hYbaE5e09CbLkww9lmD4iQbxs77BXOo0sBRjiBc6Fnbzt607GLKB
	 sk+ofg/95vRcEPtpPRZp0oXXc7KpW4Jj9LhOfuSQjD4rJ5vFUfZ8nXwcJMz07EmXI1Jsy
	 npphYNviXAeFuPkQcU8FehHRpQ84vhXZ1sMZiDpwrQG+f9c/rIIxQh+SYOa+D9m+0dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZHPsUq3;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622B7606A31C
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 622B7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YZHPsUq3
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9ae391a05so1493655ad.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182132; x=1794786932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
        b=YZHPsUq3RhNTTYQdJAqwm+2tYpw9rhLd4IuycPoIQp/qLGyMdEYCV8gcOu/VC546zS
         vhlirt1ch3bR31njSeE0v/AMXZAFU49rrl0cnc1VGtXjNPsKqxas2IgnYxqZyEIlnzlW
         cA172mOJ93+iktqL/ocrPOnWGiUdd8qmk9b5iG8ZeSE4SVT7QIJ+MIji3woJz+8xQDjq
         SVnkKSlbfbosd0H4LX1+lGBJWbyJY84WlhajOFDuyJgCMEhwJtEZmXFTgvS4pIdjw2NK
         TypSfRh+9jIG390DZDC1964VhE2gMmRdmJwaoiWRE9i9aVAal6eD+mwBprLnFLQ1O/Av
         BwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182132; x=1794786932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p2HQn0uK6b7S8WnZVO6RYFKBvJhyKWdKHL77ptFOkeg=;
        b=ivZ6175XCSVHEoOmI4NvbLYP/A0wHhvmaE0EOwVPNz54fymm7Bw2+y3tTuJyxhnE3E
         ZZJTsRSp4tThKse6eGoV0VE/8lAO6tPRJw4On3I1YHVvk1ZMrO4qmKThPiXE8hyN2l+w
         VwL/ehXV307uOEfTanB4GuY0eFxDFk+QBNRRmWl/DCMabqqP6qrIJ7gwdteBD9y6GtOw
         oMF0akZRA3VCPb8IujGZTXtVV+EqaXEDahVZFgXEzjApO+k5qiFTqT0fLtzNLfFqvg+w
         byghKxvlz7cHTNN7Q//BrhTfB09HPmRZHMMdzN2PkmQVQ19bsxImwWTw7j/T/cwijUvF
         H0Lw==
X-Forwarded-Encrypted: i=1; AL+hErGfS9sC739kdusHL+9jz98kYwNHuN0sfUllS6EAKoxx6V2SvQ0sjyrHKaY3W3nlNvEbcek0pNAE3kg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jfQC/8f9IKppN0RbwSjBeOzs6exGiTIgTMYir6cQYa0V2piSX
	5sXz/cMQZf9IncNiZBnG9uRTIu+41DLDfO+9cMHbH7YxG3ctn7QY0+wS
X-Gm-Gg: AYBFou0M5RgaQr+Bm9pKa5/AgQQIQTAcoG1xN4FXQFvxrBZbFQgCvksui3FMGOQBf0r
	CSTOgxOeHhhkglAtK0+PHivMYH6ryFQGUaZYZaykRthaCZLWp8ylxHPs3vnDBtT9N93ebQiSvxk
	eEOCFYSya/JLkT7tfszETLhNcO8U0NlOsOYKh2tBq0QzUjV+CNQpMxBKBwBx4JIRPmoAVWP8a7V
	Vi8LFaWgNDWMgX+7iXDcyuuswedGDwcLq9WZ8rIigta60hvyd783QzQQFCEbnsoN9/ShOXZpKwN
	wncIy72d+v5jS1FS2VimuBbalwT2Ja30QRXqZ8Fbumf/wUyZ84YD1IQlIoKNUtRprWc/O9awLDU
	aY7vA68AZMEMO9Jnn+XDdvvxNWgjtCjX4X7R2Ji/yLDGRqRklB7vsPip9bBQQesywE/aZJUV5Om
	bzZKvhosDtP1DdOYqX1adQsc/BKKNIzsxL761mW/q/NA88G+I7UznXYeciobTKmrVlMz1h15q1j
	k/FWee+e1A/qbo+cUbG6rVNitzKbo69D3KNsC93UTsNTE6OYKvkYVnHdJMOjIqkHhuF72j629V2
	EXVfPJWzb6kg6e7eLgiv4PhoOpn8OAFe4pMxGfE61DErX2Q8LqY9Sa7xIxg8igBhJnl5aMjVM5E
	7GOs63NMe4e/frGGiL3NfGEfPat31Sfq4tgPOriA28qRRnx8=
X-Received: by 2002:a17:902:fd85:b0:2e5:debe:cb50 with SMTP id d9443c01a7336-2ed67a21a47mr38941155ad.4.1794182131739;
        Sun, 08 Nov 2026 15:55:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:30 -0800 (PST)
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
Subject: [PATCH v21 05/12] ALSA: virtio: Recover PCM state after a failed start
Date: Mon,  9 Nov 2026 08:54:50 +0900
Message-ID: <20261108235457.12688-6-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
in one locked transition; leave it stopped when release or draining
fails.

Always cancel elapsed-period work in sync_stop, even when no RELEASE is
needed.

Record the RELEASE obligation after successful PREPARE and clear it as
soon as RELEASE succeeds. If the subsequent RX wait fails, retry that
wait without submitting RELEASE again.

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
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
