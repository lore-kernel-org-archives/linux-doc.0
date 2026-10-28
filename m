Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180507;
	b=3643XHDy1+isOjtxvMCvrSygNtWaR2bOr0ciDLplEb6U1qtsr8E2wlZaMhLRNH7LviQf
	 jxyVMoRAEi7e7eUbgWBS77jizyyjPRmrzwILgT34tQ2znlh99o4FRJBwt0kfcYFXGzzhU
	 v621E7fSPLOHKd8z3dLwO8lBD0wmSp3b9Wq4oK4zJcRL0UgZiHAPbTnlcM9gIWTeK11Ub
	 B7yESEkbvlRocGqvDFYiW1SGCAW3u7WAJ8k06qdNYJa0eaK+w7rdUvePL4UKdXL5ywWPN
	 K8W8T2am/NCOzsJ2aG8es7+F0c2QBc+HBe/Ux63FzCP1bHUpDnJjv8Hx7kmhYO1JgUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
	b=oy2lJti4zkYWeIv0zqmeOebs+M4ErK4vTp1ncHkcPjgmLyyPcGX4yddikH1PCzFi2lyk
	 lL3iRMmFPy3DlVXjWNtcrYAach0/3HChGiU3UG8gNIk24UbDGT6iNNJyxNVaO0s8mvx1v
	 qht0Z45oevFcMb8FlhED61S5pe42NwIRuXsrh5nstLwBXt2CatAWP6Tzd5noU25wLv1H5
	 Z87fUHu47G8lpwAvScZk2Z4+kDAZ1Qb2h6uXgVGk/B1j5w7ZsyVfXAuPuYRRhF7CLBOaO
	 Tb4QyKKwfk2R4wa4hfmIcynkV+Mm8n6aQR1xqT3P3LP41Hqv5Fboz02M/I+0nU0J6lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vm1XrEKV;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CED8606A32A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CED8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vm1XrEKV
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so524684a91.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180507; x=1793785307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=vm1XrEKVLlyO+ACYvXChwxf3UsS10+MpmZims/56Ff7NTOpWBuZzk5mZzNtyRJNq5a
         ilLmgDeRrJVGyHpHZuVThRThWKkSF+vBRT4usYJ2dviQV+SLA/Rach2rIxYNKh/glKo0
         Nvwnc9ms6TCgfUvRm1SkeD9KJ+K6iT0VW56Kj5P0CxJfudZiJ1hsuyAFrD8x4W7i8tB9
         IQEWdK5d4EYgN5jlQIvdU1ijtoUOx0z4G0imO2AOtiO84s1+/nCPMKD3XJNT4jaqAR4g
         xvQW7hwE1dp5AkfvX/1mA95Shz4nKKmpgqQP6V7eRtIuqD4YxRcIt+RUGCXEqofsbeeL
         RT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180507; x=1793785307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwJJNaSJlKm/koK5kjoFQnQ8cfxssNfTJLq5LnG8GkA=;
        b=hxropvNAYJBQAtjXKKUFSSUFOHgj7Z8K/EhLmHrm21OwIrgKE3e8+ilGHtyfpA+Fxa
         5pCJM8DA5+OvZ7zPZOqAZ6dGNGfUNX4UoJtC6VwT3hkGmB1WsQPNc+aFE3wBdQ2xOCeV
         L8AWTeXNBH3j0qnT3S1JG/v5UUvG0igYUO21GW8K5h6xazdkg+0YN81qegp+tiiDrO2M
         iinEnJGnytpg0vUfZ7/LxaSl7R2qBXEeG98TYCqRX08F4IYI7mi4BK1WWMDmcoTr07kE
         WSs1NGmj8QlGhVvVPMI5DU4aKw+y3ktrq2pHH73XsYR1OKz8MRrb/yllyZkyVNub5S8W
         5f0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzPGJn0lc8Vx89nyYfNGyaftrt1iWGuyDABfrPPVz0cMKC1X+GCi/gnwfilqJzHbDiUKbkI7IUkiYA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6PEcExyUhK6p8YQ+hHrUn8JtcLsM68wNdMT9ryRw02h1SlQ51
	eecVx5qDvZ42vicB+BfHPJsdtGLh5RmVkSlQfBw0xtEO4O3vEdHCsZPX
X-Gm-Gg: AYBFou1WGaJs007BBgk/ue8mIgefX/eK0hR+VXIMdicsgbHvDCs7ABX5Z8y9RZL+r9+
	5NPp76sI5T7Q/+Lw8Q52GZVIPMmYaxu9Qw/bF8uQC1tByJ3AEOeEKXS4RYUQB3rGMhaLm/nyxx1
	ESi2MIjIE5cEpwAbBMz07XLPeNdOeqch1lCYzKUIiu4lroTtpXZOtc9dq7xaT4LGqlJv72MA2Rv
	Uz7+Jw03vdOUEmGbtFZ8n6+trdrfVYZK/9NYTdjU9mxrpMcGoCh7AJxaQNg+rvjQnoBp3vV2Y6B
	72+NjEt/PoJpqhMVyCZPhHmX+WomnG8+NC9cTGNVHn77/ua0kKkPAtdSzegsWiedUFQXlcP1PHy
	grbEZ/Zsi+h7UwOGaF/QYU+TXh4eHO+QiQS8B1ij5CVKN8RPgz3Kl8RIKmy90va3sow3gb1gvqL
	RPKdL2kc7Ty83Sbtu23Xv66zFzXzjf8aCkv0HTG4svhCJ8j4E085WUjp01m1/2eleTgOnSLXUxi
	txowLegzbm+//HcjmsL9wnFhdt/m335fcjfJIzWWTjh0bMwSiG6oegUaHBC2Xj11oGIPKvyPH3Q
	lMEx6qB0O4bVraMpHrXSVJ0O61T+sKy+qGWL1yDXjKm1WZPTp4iIXD1e+/rzQYJm0fskVDZtP8n
	oPPnWnkk2OcnTu/2DrnpTY28jNwgKT5Q4vTXNvYpGSCgbyRk=
X-Received: by 2002:a17:90b:264d:b0:3aa:f4af:1e0f with SMTP id 98e67ed59e1d1-3ae57e07351mr1289738a91.8.1793180506752;
        Wed, 28 Oct 2026 02:41:46 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:46 -0700 (PDT)
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
Subject: [PATCH v7 02/16] ALSA: virtio: Recover PCM state after a failed start
Date: Wed, 28 Oct 2026 18:41:18 +0900
Message-ID: <20261028094132.20364-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
Changes in v3:
- Protect all stopped accesses with vss->lock. Keep the RELEASE
  decision and stopped transition in the same critical section.

 sound/virtio/virtio_pcm.h     |  4 +-
 sound/virtio/virtio_pcm_ops.c | 81 +++++++++++++++++++++++++++++------
 2 files changed, 69 insertions(+), 16 deletions(-)

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
-- 
2.54.0 (Apple Git-157)

