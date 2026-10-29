Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252649;
	b=vEhrVfyysaIH5gagzPd4Lf2HPrLwxNsXyR8kSdY+yQj0M1tvICZijB80J08UCinHedbe
	 FUbfyD4RsdwiDoW4Pt5k3oSRXyBg7cbblib6ocFz9jeiohS9DlcleS3qpetCo5hn4N32G
	 n6QSHhzJc50ghCUUvDzDnL5C3Uak8JfLt6avZqi+esDvpGMYlOQp/adXojL8FTZJA9LIs
	 6IVRTPTzIDMviA4SH/ZxQEjeVYssAigzGmOvCoy84lHQXnssOtomcJ6YkufhlGfu3rYQn
	 PjY0esYcJmDEdf9MTnasniD5J2fCKNCPLBnOPsw0XF6wYVwrbt/FY9VaZw4dHAeb0+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
	b=WJu0hD1BJriaEewD49HaGajoilUYB9quCriD69u6sIECY2ga16KrDwK1ldWkgmvCAuOL
	 BWkCkuhRc/gmSCaw8PnelImll5LNsYvNK94P9bsRG3pFpGGHU40aoYSEP6nRKLhyakgXP
	 UfPWnSk7FYXhq8UR1kXoNL89aOBJx9WLFFqjl3iopy8+tjP/ZUJb53y9/PiXrMUMisBfA
	 qbx1K+NHnIEi/L+a1sYZqgBcIPDN9+V6sBDpzrWaLi1qGP1cA23NDZkBRIQxQvbZ176X8
	 r0epCn2UpHKSxwx+ihiAhiko0Zn76cVUhtTLa6FA98YPqAoX12A+KMoF0aKxq7hPMSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C4E606A31F
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50C4E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bDIX1sMw
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso1128069a91.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252649; x=1793857449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=bDIX1sMw/e3SOcdgcRnYG+dm99kKmvygroicWzCI1pbXHrNQYgAl/pTll67dDIF2Hb
         dxyzdFy6t3rlLRF4DX2yDnX4tT87mAgFvrfO1CiCqlT5gNfRpGDgD+N1vFK2Dv2XGvTU
         YhQXgB2Ybmj6M/U4uIyFa6U5gw7L4j2+OHc7azEyCFA4rhcy/V+wQO+T7tor/3ZB13ML
         u3zPZbFe7dlsQUntDd+C7Uwo7UKeosg7fO0rKRhj+ZH9EL11CGRZLmdPq9qGbRnPFmCG
         vHoUG3/QLyR6hvMUUCgPXM80D893/4cLudOMV8IjMacFVPFJJspxuCu/cA7aBzJZi4Mc
         ScKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252649; x=1793857449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OpwHiZYTLatyvvxjRUM2hdadeePr4pZBh/g5i6VGeuQ=;
        b=OA9vt066zjZsZqEl7+LAmy0XWQpUxdd/QYtDcYE7VVkKI7dJxZ8k1loxDRJRTH7dg/
         cMkGEetVZC/4DOBJS8a+7mYUJj+pfGE/nogCaRTmawee+CwBKRxOTyxVOoJCULX9LCO2
         xJJC97vNwMVRUcJc6lwwKMF3eZTziGcV4UXiGE7/EeCThcukgw0d6c/17j9kORr74ItI
         11tIVOhOkqozlmvb2TzSgFQr8cWfujPflG66occ3436y2yNOgTCNJYe81t9d5z6yfGvx
         G+1fV+OthNJB6PkS8qG2KCgiEO9GOcg0rqJUqY9x8dOQGQucTPbU4GPuiC7R+Qr3xDNY
         BhYg==
X-Forwarded-Encrypted: i=1; AKwUvByaOFu1ChIVK4dP0OwaC4JUA8Llbd4rNjeYtJJkg023+ealwyFYlRK8BlQn8NvU1X5mkt5EVpnog28=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9Dqf12L1DwOx9/KTyBcQUOaVwrD2ESEtMlDZhh1ycwShG5xYO
	Voxo39NUQNycFsPEUAo8i1mSV5/KL2qOFggZWgzRmkdVqCGbWZyYIhLx
X-Gm-Gg: AYBFou0Dd+9pJz3LzFmEdIo7NVB9MD3fe32TWwwgaN5pE/JJOZvkvv2+hMswC65DFab
	TKVKYEfaAgp7kxJTERmeV4O7MeGB7QB1tC92a01jc90zZeKwVIfVtF+TK3KgcRxieGBMcX8v120
	w2HskUp+RHK17RCWsAevi9maMvO7cC2c84Iy2yyUuGKZhGm2sOK5SloQgL14SYJIZnfDgTAZn7i
	MLijuBTST4PlQR0w0j8ufVo43uKxQdBIe/o11SuTVPidnqNq7F3OEDH7xxPD0HJqbk4fvry7/0S
	azyKQwKvoNL+L/rg1q35wlBfLOAaEiRR5SVNG4D++eF5UOQChPr+9l2oxd5hMbR8OFwJaX6N1z2
	xjY9Tz2DXhVS1rgMNOEBOyPfjRzhiIBCvUO0ZbgLyelyjCRTNrAXe4eVdiPFw2F7IbOKtc9CIbA
	8W1FSdtSlAY3HTJr6RgI1s0rQUqLG0qqdaR8uNv80GLWi7UG8XbP+Tu+9o2FoqdA82sQHwBv3t3
	VDC3QjjFbrrmBGkkFXuEaqTSUBTA7L9mzk1OyDTwta9a5P3A495+50vhUhXqdFr63b/OFSZAAcu
	HWfGQgG4lkeIzpbVy696jBAgC+fcCFn3dntKlhlXDtDj4rT5XOBBr2YuuEkqLVbc4R0wGiyJg66
	hAY861TwaeP0syyZ+RK8gqThPdpiGmxtASsB4GznX1Mi3TxM=
X-Received: by 2002:a17:90b:6d0:b0:3ac:7556:8ed9 with SMTP id 98e67ed59e1d1-3ae58169cf5mr3260196a91.10.1793252648579;
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:08 -0700 (PDT)
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
Subject: [PATCH v8 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Thu, 29 Oct 2026 14:43:42 +0900
Message-ID: <20261029054354.2931-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

Fixes: da76e9f3e43a ("ALSA: virtio: PCM substream operators")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index 8837dfc12828..8048b14e6c80 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -26,13 +26,13 @@ struct virtio_pcm_msg;
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
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index a40ea394bf17..970499fe419b 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -96,6 +96,15 @@ static const struct virtsnd_a2v_rate g_a2v_rate_map[] = {
 
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
@@ -115,7 +124,8 @@ static int virtsnd_pcm_open(struct snd_pcm_substream *substream)
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
-	vss->stopped = !!virtsnd_pcm_msg_pending_num(vss);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->stopped |= !!vss->msg_count;
 	vss->suspended = false;
 
 	/*
@@ -217,13 +227,25 @@ static int virtsnd_pcm_hw_params(struct snd_pcm_substream *substream,
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
 		return -EBADFD;
 	}
+	if (stopped) {
+		dev_err(&vdev->dev, "SID %u: stream release failed\n",
+			vss->sid);
+		substream->runtime->stop_operating = true;
+		return -EBADFD;
+	}
 
 	rc = virtsnd_pcm_dev_set_params(vss, params_buffer_bytes(hw_params),
 					params_period_bytes(hw_params),
@@ -273,6 +295,16 @@ static int virtsnd_pcm_prepare(struct snd_pcm_substream *substream)
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_device *vdev = vss->snd->vdev;
 	struct virtio_snd_msg *msg;
+	bool stopped;
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
@@ -338,31 +370,40 @@ static int virtsnd_pcm_trigger(struct snd_pcm_substream *substream, int command)
 
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
 
@@ -393,21 +434,31 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
 	struct virtio_snd *snd = vss->snd;
 	struct virtio_snd_msg *msg;
 	unsigned int js = msecs_to_jiffies(virtsnd_msg_timeout_ms);
+	bool need_release;
 	int rc;
 
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		vss->xfer_enabled = false;
+		need_release = vss->stopped || vss->msg_count;
+		if (need_release)
+			vss->stopped = true;
+	}
 	cancel_work_sync(&vss->elapsed_period);
-
-	if (!vss->stopped)
+	if (!need_release)
 		return 0;
 
 	msg = virtsnd_pcm_ctl_msg_alloc(vss, VIRTIO_SND_R_PCM_RELEASE,
 					GFP_KERNEL);
-	if (!msg)
+	if (!msg) {
+		substream->runtime->stop_operating = true;
 		return -ENOMEM;
+	}
 
 	rc = virtsnd_ctl_msg_send_sync(snd, msg);
-	if (rc)
+	if (rc) {
+		substream->runtime->stop_operating = true;
 		return rc;
+	}
 
 	/*
 	 * The spec states that upon receipt of the RELEASE command "the device
@@ -421,11 +472,13 @@ static int virtsnd_pcm_sync_stop(struct snd_pcm_substream *substream)
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
