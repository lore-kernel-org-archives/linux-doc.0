Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156030;
	b=o7kKTRnCRJI/PI53YOjRGo+BTF50IdO4fHi1TuIkYspVaLImgQVcP+0HF/q0VXt1hAQd
	 L0oivSRzLisaHrjmz2y4T3vqsensl4xtk2+1mbw20GZETAxi2AHoIiBnaEc1TfUPuN6ss
	 RxVS8U5qJCXOuOEmoXW9+H8KwjwOgzQtiv8+HJmyCrtdBzAa5qkgJsx/FRR9NLkfxuGBl
	 3OvLlvT7J98jSH++kdPxkoH5XpWtg37vsTRd2fGlakK7UxobT1wmSutOpeiyN8ICsViNo
	 6iykXKr2+6b8udRwYlrAq3QzN4Mxcu1ErNxzUKBl7bDSkXHeAbw5r7VKoI9vsJrkskg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=gcFEqUKm+SZKJ3oCtyzC21wXodK8eliaBclu9TafE+qcMfGMUoTnKXIxv2KhEYYG/tNC
	 mx7DNKZTuF/fGkTO9B1Lldl4kUdDJEMXYKj//wERwzVzvzCmYQd3A5JnQrOOKHTqgy0hD
	 HSJhriDckRExfs8qAHma8kv62zW+qAH3ledVOhKoqWK3bwBZa5kN81mvChA3YfAn3rWMn
	 8xsczvVmoSmef7b0Kz9fz5IFHkUtcKQyMnEU8n/S8M/LUydxZGYZ17aK8gZl3LuptzUIF
	 HOIuBNbzOFVYeWJeiL74526ah8g6q28Kte410NI2VoNggMiJa/iCUGZ0afgwMC2ncDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcCUvZYN;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E8460A2635
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0E8460A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GcCUvZYN
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3535a54bed9so730207eec.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 19:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156029; x=1793760829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=GcCUvZYNuJplwZi105tiG31GEPMJAoLyuLpDupceTwBiWXRE38SQtq7x2jqFOolTi3
         5XfBja0nz0WdYLJPFlgcCHhjMKxHgrYOKbQiFSn5HtTvRCTwAwtQ5XfmPyN04VydQdbV
         zEjEblrsw23FvdM1R+dbw7gBipF1L7gptzV6eV3fZXAKA5LjZI9EGEZdqHXJ/VjPUQ4i
         m6wcdIAFYWzfFiTxWp8IYwX6pq102T4I2zf48bbFJMMOwzesyB38SiRloWbnh3YyGiRT
         zNhzPe+KxH0BH1KXx21QILSyyu3UOb6lvq4iePG299Jc3aH5xZhIO6nF6fi1u0pe1noI
         la9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156029; x=1793760829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=0u+qbRroZL2lNUaM7L90eAX3xvEm1cvQE4HC47eNjaAy1WpHaGB4P3SHNu7y13W5HQ
         HtrBdrkdemQ607pTzA2tDn3ChVk3E+Rc0AdD3f1Oj0+z4N6Zdr/NCB7jkAzBwpcS874M
         wAvln7ss2fZ+c0TkaLMved9NNlmZcsERlZXux598biz+0jcpRUyawrrpjtSlqeUAOgph
         w5hNT3OHM9on/l8VArV/KKFcxSiWx7c8sIKHK1h/suSU+6w3jhhjsgHaPyPsebqPn8vL
         ppkgKqcX9Z38FCOrNHRaeQhcuhQ1c5wdWSzwoMMcdXAUNWSJKe/Dt/C5ZwXnhp4Z5M0m
         DjpA==
X-Forwarded-Encrypted: i=1; AKwUvBxjn6GUDdO9fSD19V6OhUeF32nF7+DnfZ11qnfrrEgcqori3bWnjpRMdG9vy7WqU9q+v9gIU2AEPJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXVGjvsG05mqmAR70eW/3MBgIjceDzca/U+dHWz4ZZkNraFEyG
	O6WiturmdHlfRFQNMFoz11iNVV03wh3QxhYKpY63UPfqeiOJB3qFRlNY
X-Gm-Gg: AYBFou14DXmWjR+2odofJzLjbZimcHkzpe4UzlTRZvPYpkrrIPNYE0XapdzRHzAC2sZ
	O+DBhUR+m8LRXSHboJH1JB4IYh9vh6vZNAv0MGej3VczzLU/j92vzAder37THbRiM61mZULehKc
	XfD2RE/7WyN3eyKjHjT2+KTsIpK5kz/fL6zmTAfMYvfGz1+h2Vo4CiUi5cbi640m7Qz7qyqFlyb
	5sXXHyvPJuD70ZyMPH861MBpEnPjfA16d+qlp8fZAz4kfpY+TD+YfSMi9UU53boHdZGAXHMp1Dk
	OBQtYN7qUhVv6ACUv3Kp982CVWDZY5aV0kdyt3+ffQb3iKwEW26n5sjbIYSeTYZf3+U9g4DGb0o
	19W0T8JlRF3Ej8+wazO6/Qg3dQhDK0LtnfvSNKaw0nyLx/O3n3Q2hCDOqV8rXbG1ehLKe/3ltLr
	zVJlYhrtCKHjqTTeghephx8j94YQ6N8rfB4GgAnjwwNv3wfrqQnJCbkrOk1JoHV6B62JOwS3qva
	YZPDAo6eMM8W42MHF2f5pp9/ffGoNgT2NRVaPh+1fv3TUIwwgtE15s0sxXPYH7MP4S2ALYibsrQ
	Cy0HYpHya4mkrdqUNVJ/AYOuHfpnkpisSGkOZmwRQrZxbXVDpAAIOZqkNyVoVwYUi2dwCAI1s3K
	WQufPDCasx/Q5RH0adaJzrGsJbU/ebQCc46WRLWTBpbeyNxg=
X-Received: by 2002:a05:693c:401a:b0:36a:1b95:fc75 with SMTP id 5a478bee46e88-36a2040717fmr2212392eec.35.1793156028554;
        Tue, 27 Oct 2026 19:53:48 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:47 -0700 (PDT)
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
Subject: [PATCH v6 08/14] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 11:53:11 +0900
Message-ID: <20261028025317.92450-9-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

The RX callback holds the queue lock across a batch of completions. A
reader that has copied samples can wait for that lock in ACK before its
consumed bytes are removed from capture_ready. A later completion in the
same batch can then reject data using stale ring occupancy.

Account the staged read under the substream lock before acquiring the RX
queue lock. Release that lock before taking the queue and substream locks
in their established order to refill requests.

Once accounting is committed, latch refill errors as XRUN and return
success from ACK. A negative return would make ALSA restore appl_ptr while
the driver retained the consumed-byte accounting. Keep pre-commit errors,
ring-capacity checks, and normal period-work scheduling unchanged.

Source-extracted host and kernel fixtures reproduce the stale-capacity
race and post-commit ALSA pointer rollback. The candidate preserves wrapped
data and pointer accounting. KASAN/lockdep QEMU lifecycle checks passed.
The fixtures substitute selected backend helpers and do not independently
establish physical-device acceptance.

This follows pending staged capture support, whose introducing patch has
no upstream commit ID for a Fixes tag yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm_ops.c | 128 ++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 51 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 003832d112551..85e7576903d56 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -1229,70 +1229,96 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
+					  struct snd_pcm_runtime *runtime)
 {
-	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct virtsnd_pcm_transfer transfer = {};
-	int rc;
+	int rc = 0;
+
+	/*
+	 * The RX callback holds the queue lock while draining completions.
+	 * Account ALSA's read under the substream lock alone so completions later
+	 * in that drain observe the newly released ring space.
+	 */
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		snd_pcm_uframes_t appl_ptr;
+		snd_pcm_sframes_t diff;
+		size_t bytes;
+		u64 next_acked_total;
+
+		if (!vss->runtime_active || !runtime || !runtime->control ||
+		    !runtime->dma_area)
+			return -EBADFD;
+		if (vss->xfer_xrun)
+			return -EPIPE;
+		if (!virtsnd_pcm_capture_counters_valid(vss)) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
 
+		appl_ptr = runtime->control->appl_ptr;
+		diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
+			diff += runtime->boundary;
+		if (diff < 0 ||
+		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		/* ACK includes any subperiod tail already copied to the ring. */
+		bytes = frames_to_bytes(runtime, diff);
+		if (bytes > vss->capture_ready ||
+		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
+				       &next_acked_total) ||
+		    next_acked_total > vss->capture_copied_total) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		vss->capture_acked_total = next_acked_total;
+		vss->capture_ready -= bytes;
+		vss->pcm_indirect.appl_ptr = appl_ptr;
+	}
+
+	/* Preserve the queue -> substream lock order while refilling requests. */
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
-		if (vss->capture_staging) {
-			snd_pcm_uframes_t appl_ptr;
-			snd_pcm_sframes_t diff;
-			size_t bytes;
-			u64 next_acked_total;
-
-			if (!vss->runtime_active || !runtime || !runtime->control ||
-			    !runtime->dma_area)
-				return -EBADFD;
-			if (vss->xfer_xrun)
-				return -EPIPE;
-			if (!virtsnd_pcm_capture_counters_valid(vss)) {
+		if (vss->runtime_active && vss->xfer_enabled &&
+		    !vss->xfer_xrun) {
+			rc = virtsnd_pcm_capture_send(vss);
+			if (rc) {
 				vss->xfer_xrun = true;
 				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
 			}
-			appl_ptr = runtime->control->appl_ptr;
-			diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		}
+	}
 
-			if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
-				diff += runtime->boundary;
-			if (diff < 0 ||
-			    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	if (rc)
+		dev_warn_ratelimited(&vss->snd->vdev->dev,
+				     "SID %u: failed to refill capture queue after ACK: %d\n",
+				     vss->sid, rc);
 
-			/* ACK includes any subperiod tail already copied to the ring. */
-			bytes = frames_to_bytes(runtime, diff);
-			if (bytes > vss->capture_ready ||
-			    check_add_overflow(vss->capture_acked_total, (u64)bytes,
-					       &next_acked_total) ||
-			    next_acked_total > vss->capture_copied_total) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	/* The ACK is committed; a refill failure is reported by the next XRUN. */
+	return 0;
+}
 
-			vss->capture_acked_total = next_acked_total;
-			vss->capture_ready -= bytes;
-			vss->pcm_indirect.appl_ptr = appl_ptr;
-			if (vss->xfer_enabled) {
-				rc = virtsnd_pcm_capture_send(vss);
-				if (rc) {
-					vss->xfer_xrun = true;
-					schedule_work(&vss->elapsed_period);
-				}
-				return rc;
-			}
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-			return 0;
-		}
+	if (vss->capture_staging)
+		return virtsnd_pcm_capture_staged_ack(vss, runtime);
 
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped) {
 			rc = -EPIPE;
