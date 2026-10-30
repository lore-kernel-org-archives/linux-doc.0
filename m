Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338003;
	b=phvumFwiXca8loflcke/6L+AdgF7hXeYaTeeoW1Xnr0zQFVy71gbSTp59qv+syBSIk5b
	 z797c2Kq6POOyjPioZisK0sew7YIO8xHWGvCYgCEW+u5I8YGnfKw+9IjatbMavDx22U4X
	 g+lPBCu+jUMGAx1WhgpqtcRIMfXfJDcYkPsMuBlEliPM6rBLJXtmxgMPxeGnq3grc5j7H
	 lHHDSw3aCekUtnNMmFw9ujW5VUVTZTGlpLFm/a0Vahsq3ncraHpsNsi5tB6FTjQBigboe
	 3+RpgItFJ7LTfKy7KwOFZCgOR+w91T38fe/nskvaJmwoY0Mm1EJLRXnDEz1jj3q+yow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338003;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
	b=MwOQ3Mf94EGS/3whbID7/NFAOBhA8A9CJ29hW9XdgA62It0YHBIFWP7FNj5uc/+a6kmW
	 ZSGVG/1uHie/e7Q2FD/CIrWezC1aiP+kRWk3aaKi0uUOri/xaqowMM/26DmcXg3p9wGn3
	 AF2dHIMCxgrq0tKb+IzvWE0ATXe/Va84LC54O0cGsfK7YmEtzhnFRl4fwEjiT/0K70HBZ
	 rLAMBto8IjN9V4WUcfGtdOrJoqp3A+IT+IHR5ooJsmsu7dYoDMNwDY8DD5CWdYYhnZzRz
	 faeVM6nfZSY/Czc1XWjfHRY9t3c8WbXL1Xzyi7ZU4RTixuCYRuA4mm0SuAzN0OscUmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIfheWjf;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC3E606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC3E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LIfheWjf
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so118202a91.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338002; x=1793942802; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=LIfheWjfvAcWy+0OaRpkw7FelD6UN5OgZfq7mH/yj3pKbiAkmw32wczA+XtzCV2lvn
         nhT1Ah0L6hcvJ3uLAlrn5PgMBAlKNkf1qta2Ro0RusTBxD7P3g0A70MLpasbtLZ0ps9e
         QN4czVWWCdY8h4tx8s3LaYh/FJUeJvTRo4naxfgVl1smYyIZA0eDYwGC7LTaU0KPZh2c
         P9B/BATnEaG9LNWEHmNP6Ek+83V2eCFcx2brTQVbHLzA7kUIxuE4cdXB+V+saD9DeQua
         Jx/Ng52KDywDOnr6HOqmKeuU35IV0D7Udo30c6sBVY3NGY2BlIhC7Q2cWMo7yl3BOjg+
         V/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338002; x=1793942802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPsijI/WFroQ3WU8JWBkdFg+dO3cPuO9jwy6Y07G2CQ=;
        b=KO57l42+MwKxBA1hqJqItIejGkpLfCxUfZ/IDTZfHZJc2sB7Nxw+kbM9q+fI9e24GO
         p6w1SyxCIrJWqGUvdTKfNxm6GLrdGKRhn2klIpsOn9p8O4LDl/cZpLU1LhECUYAok9qH
         BTpWfLpea4Yc3KiR73CKizMTDfdPYxGXWG4tAgBlLxFBAhUL7vsGHDs9l3MavDrXdjcW
         Oa1NgK7+Cu9nBeHhGDuWZiwqYJD2NhU7FUjVuetYxKBMWf9A7bRkeFy2+CmZjamlBll5
         vHV3gWbFP0wQKgPMGPIM0hAxOlurl1W+Q/GIPvpVPXPTUE697ZWH4XidVNBolH6iEdBD
         +Jpw==
X-Forwarded-Encrypted: i=1; AKwUvBxYTpnO9VOmYU7MnwxZhxsg0tvw09RixK06D1IhehAT6ArEdzxFjEhDIIFNrwmpLOtZ5xF9bNf5h6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdqI4un/JjW4Np8nZVoa5KxfFTPXEKYWUarZDpEzvCU9fsvccG
	z3XUuPKGfi6oBmipKHUXpo7nMEpTy3ydwv+KcojkAWoIEerzt/Po37G0
X-Gm-Gg: AYBFou0wGEJ26fIw4Vr3htwSAnL/7ju1dwdBLHtXoaAmfRs4QvXNJW2oTjcJwq98d2h
	t/sh46HSidvt7Ep0aNhaD0bbt7MgHVLKIvMazXrTfyAhjl6w1fyB8ylmtyK1uVgkiT52AVjXG3H
	VVyK5zdqJkjOTv2TIxF2CdjtwnO9LKRhMlTtDPPFWdS0O5xC4X144tCgPVcBkTVK+MTO0JyTIYC
	FRhm2YQIiKFsVblshDYWhjYdOz5hGdVaYa0obu9LHLt3Zg6Qe8xdQlPDSqw6CCQo9e/dWvoZtEb
	alMcJTaT3MOZWV46ypY26zpMWIyqFPMBmPFAfpb9fFV9naDuK9SfA3CkPIXI/mv2XxoyOTspMZx
	QQbebfwT/YxVA82IGpyo3E1AH1cSRFev+oay2Nh5j8YqEpxElgT8gi3F1ihqzfF86aq0LbAL2Vr
	/uF5mYuQOjLA5Ewdiv6ORGyiBnNkKQpFlojdik7KfbIzSTBc+7Ieab3QYqNOLrudD9PZ1mjBCmf
	bHTklu5qSzO0RL6o3mKvT3kTYOWDzG57ZF3gntoETAlHjCzEmn5Jt0pTGnSBZQONkttYTjU2cCH
	Oq+E6xE2PF9mbAJTBMd9PLY8gD2TJ/R8pY5sFzsLIxwdkGVdfjG6AHR8ZYmnNszWysCtf5SaTPD
	JvxC8R9WfKRLJsz6DEu4kjqnwwGOl7S4MXwaBRBdpxbZdkxM=
X-Received: by 2002:a17:90b:4a11:b0:3ab:188b:c5bc with SMTP id 98e67ed59e1d1-3ae896f7fc4mr928054a91.14.1793338002321;
        Thu, 29 Oct 2026 22:26:42 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:41 -0700 (PDT)
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
Subject: [PATCH v10 02/14] ALSA: virtio: Recover PCM state after a failed start
Date: Fri, 30 Oct 2026 14:26:17 +0900
Message-ID: <20261030052629.27742-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
