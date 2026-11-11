Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355615;
	b=aFBbyfMzdXnZ8pGkbCNggD/gSsY7w7UCa7tL0E84ybXyOqvoPYQQZ+hvEXZHM1anONmQ
	 kUnb/SE6gYkfC8DtM/SZ2kGFBsx62Gq88s/XaC5+i6vjZeWDIjJzTFivZNcwzD1dhV9gi
	 xYCpBeL4cPFPARp1axvDlKnQi58Cv8CURsgMpToIwXa1sYRZlYmb3f6USt81Cgd/NXy7O
	 /Flh37E2xKW/IeHSOlXUSVHtG7sXUHVrVA9206w7a2UiPSenu6ywsMyAxSUSv2UKAgk+0
	 fDSrU7ev5wkl5FbbwQf1Hqr+u53iGkLfexxZT3fXEf4zk0RdYp+HlmJxY6kruVR7Jxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
	b=l24QK/JjMPiXpCBKY2MM915Akqb3D0pmDOEX6PlqmjBpSME2lEFvp04w7TtGjjEhrpVP
	 9LRFFUnkjo6G84hPGhtpvg1JincSTWjIN2MfUQEJGJHI+BgaiXx9rsPWzBcnsVdcBpJYf
	 rZvrk+4n6sZZTRFV7846MjqtBLO4PLKAxaMX7n8B2VYdHp4dYsxJs3oXOYV3EKG1BXNRE
	 mha533ORlIOsQQUUcdT39M+SarArF93tIwd4JEaLZnS5RXJA1rCCIwLYjdR0KOthzkLmA
	 DNwuvj17sWI2mErQ8887yaHnPBO/qTbm+tIYqKCURa5R9FH0gYP+qHE4xmIKxMgD8NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2ptl3vI;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47009607000E
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47009607000E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2ptl3vI
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae691283ecso1459110a91.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355614; x=1794960414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
        b=x2ptl3vIvr/jyR8QI04l8BZwOg25KzZ2lRqx8JNCzaQ3zu4lRIUwsORsEMnup6Yjcu
         iU4PdTTRIt+QR4pvsvJ50VyagxRY2r1knJWGckdJD6uVTTmq7P46ZEjneBhKYRRg67Lk
         DiCVeNtdB5zCyA9MidZmvfOKSD4s/rGs7GtFbioCZeIZ8mx3Gb3F7qM2fGmHYbYf852y
         RhcDTCpoe3VS6dJo9ISlMFdBU9y22Zc2Ozs8YDylQg47suRMR5d2zsLaJU2ow0oChWuC
         RBTeYr/Ajv34ddbE6jIDmyEsBezyPlR9HPcxUg/Qcy+REYXYleQI5tPe+Pqjzm8gy387
         2MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355614; x=1794960414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI2qMwtSokUZoL5Zm53kc3fAF8wxP+z1vLTf3dEo/cQ=;
        b=HbcD36HRTozMYpFJ1WCo7IB+mDDSx4uCs7CJE/SCz3UfrqehPTjjRP8XS2n2z2EVXm
         e81NXJ1Lqvc1NRAB/rlmdQ/w55SP1ZOIxDMLM8Sn2oT9q9kAj8W27hwZMNx3V1mY2HeG
         S4K0VVp26aDq3vQDkZXzfZTPtqUreZZvdslJX8fkvcL1fNuJDxsy0s7AH8Flz/1OSXlN
         QV4NlsnQ064PqYAYQyVa1eLZeAISE0WiwzRmsFmN6CTzijXokJAxfswE+DbCIS8/2IS6
         4aCEZvgtfCTT3yRCIXs/pY0N/8BqX/eHf6C5nEk0blJoRid/SL4DXIwD1mDOo0PG9GSM
         L8yQ==
X-Forwarded-Encrypted: i=1; AL+hErExcifgo/Tr8C45CG3N5DP/xxU6yLxfihtHNF6YM8tsVBs7qfO0ASY6QrFcmgZ/qtl+XDME4H1QoTU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9N/ZlD5u9PekPZUoIY+ChWC8Gj+XNdBGH5RowTE4hx/lXLO23x
	FDOFoizmIh2afKZe9ZTrK429yhC9u5IEBaEdZ9c0OSDj0fhU1YWdsKXK/BctEg==
X-Gm-Gg: AYBFou10jmBMOtoWvd9FlnhQmJKDTToqLbkENClFDYtNMq9gaH1HlbylydEDpoFqKAQ
	a/p4yMfj07JqZgK1OlfsEhdLtfA9cfxY7K8Bnaa/fpat9iNk3Q2195B5ULXD53XIoTTU9hI2+95
	JmLAr+hJpWyHUerjpf/+LWaOjHuKiU/D70FEW1027vGS6uAZ4yt0ke4X00Wul0GGWWfu5DRg9C4
	QwJzZk7JBoYsRPd6RPRrNRgjy+95h51F7BLeTRj1BW2IjPgiABCamORxdgW4g2t069VUj3f97Ym
	SvZyKXMyog2IMOyr7aUOlBUSG+jAfTERGAJdakYr1shTTCtwhdZAz8U85yUf/OBeABmqcP8uOor
	a0H5CfIz4tCPU15PZCBGfc5Rykdk3hyaOVmsx/497y9RFVonYNsTmDgTI2nY4KwED598JQG8JzV
	kaDMNwKKFpYeAnC+bobEVs2CYGdQ9BG11JLD4p7+tVKbXK/4M3y9dyfviv1Fs+Y3+bAc32vIk7j
	J+OttxnSjlWdOtPDGW7ysn+3zVO+MhTTkU6n1wzwx6avkaBfHQzAPlp1xeZ3+AMtynEU+meWsr1
	rXwC8apsfD1hAKuCwzfC9jldw6asbLlr/hUM1Oc6Exltp5e7BQYaEGngyvRh08c50bBq/U7hOJe
	q3U5RregqA7x0zf6lHVp4p5dDBLQ9sA/QW4f7OtesrmL1+DU=
X-Received: by 2002:a17:90a:e7cd:b0:3ae:3e9b:5265 with SMTP id 98e67ed59e1d1-3b182f2b5ebmr413417a91.26.1794355613529;
        Tue, 10 Nov 2026 16:06:53 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:51 -0800 (PST)
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
Subject: [PATCH v24 16/16] ALSA: virtio: preserve playback progress across pause
Date: Wed, 11 Nov 2026 09:05:43 +0900
Message-ID: <20261111000543.28550-17-mynameisjune111@gmail.com>
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

TX completions can arrive after PAUSE closes transfer admission.
Preserve that progress and schedule catch-up when the stream resumes or
a rejected pause restores RUNNING. Cache device latency in stream-owned
state so a late completion does not need to dereference the ALSA
runtime. Clear the cache on prepare and RESET.

Use the existing indirect hw_queue_size to keep outstanding TX below one
physical ring: buffer_bytes - period_bytes. Equal modulo cursors then
mean no unobserved completion, and a non-interrupt HWSYNC cannot consume
a hidden full-ring wrap before deferred period work. Continue using the
ordinary ALSA pointer update for silence, drain, stop-threshold and
wakeup policy.

This also reduces queued buffering by one period. With two periods, only
one period can be queued. The minimum geometry and pause/reopen cases
pass in QEMU, but worst-case scheduling tolerance has not been
qualified.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h     |    2 ++
 sound/virtio/virtio_pcm_msg.c |    8 +++-----
 sound/virtio/virtio_pcm_ops.c |   25 ++++++++++++++++++++++---
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -53,6 +53,7 @@
  *        substream operators, including @stopped.
  * @buffer_bytes: Current buffer size in bytes.
  * @hw_ptr: Substream hardware pointer value in bytes [0 ... buffer_bytes).
+ * @playback_latency_bytes: Device delay cached independently of the ALSA runtime.
  * @capture_ready: Managed-mode bytes copied but not yet acknowledged by ALSA;
  *                 always zero in free-running mode.
  * @capture_boundary: ALSA boundary captured for this prepared epoch.
@@ -113,6 +114,7 @@
 	bool resetting;
 	size_t buffer_bytes;
 	size_t hw_ptr;
+	u32 playback_latency_bytes;
 	size_t capture_ready;
 	snd_pcm_uframes_t capture_boundary;
 	u64 capture_copied_total;
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -1002,12 +1002,10 @@
 	/* Keep latched errors until prepare establishes a fresh epoch. */
 	vss->msg_count--;
 
-	if (vss->xfer_enabled) {
-		struct snd_pcm_runtime *runtime = vss->substream->runtime;
-
-		runtime->delay = bytes_to_frames(runtime, latency_bytes);
+	/* A queued request can outlive the ALSA runtime after hw_free. */
+	vss->playback_latency_bytes = latency_bytes;
+	if (vss->prepared && !vss->preparing)
 		virtsnd_pcm_schedule_period_elapsed(vss);
-	}
 	if (!vss->msg_count)
 		wake_up_all(&vss->msg_empty);
 }
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -770,6 +770,12 @@
 		memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
 		vss->pcm_indirect.sw_buffer_size = vss->buffer_bytes;
 		vss->pcm_indirect.hw_buffer_size = vss->buffer_bytes;
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* Keep unobserved completions below one physical ring. */
+			vss->pcm_indirect.hw_queue_size = vss->buffer_bytes -
+				snd_pcm_lib_period_bytes(substream);
+			vss->playback_latency_bytes = 0;
+		}
 		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
 			vss->capture_boundary = substream->runtime->boundary;
 			rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
@@ -1143,6 +1149,14 @@
 	return rc;
 }
 
+/* The queue capacity keeps equal cursors unambiguous for playback. */
+static bool
+virtsnd_pcm_playback_progress_pending(struct virtio_pcm_substream *vss)
+{
+	guard(spinlock_irqsave)(&vss->lock);
+	return vss->xfer_xrun || vss->hw_ptr != vss->pcm_indirect.hw_io;
+}
+
 /**
  * virtsnd_pcm_trigger_inner() - Process command for the PCM substream.
  * @substream: Kernel ALSA substream.
@@ -1197,7 +1211,8 @@
 		}
 
 		if (running) {
-			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss))
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			return 0;
 		}
@@ -1219,7 +1234,8 @@
 				return -ECANCELED;
 			vss->device_running = true;
 		}
-		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE))
+		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss)))
 			virtsnd_pcm_schedule_period_elapsed(vss);
 		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -1260,7 +1276,8 @@
 				virtsnd_pcm_trigger_failed(vss, epoch);
 			} else if (virtsnd_pcm_start_queue(vss, epoch)) {
 				virtsnd_pcm_trigger_failed(vss, epoch);
-			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
+			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+				   virtsnd_pcm_playback_progress_pending(vss)) {
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
@@ -1610,6 +1627,7 @@
 		}
 		if (!paused_pointer)
 			hw_ptr = vss->hw_ptr;
+		runtime->delay = bytes_to_frames(runtime, vss->playback_latency_bytes);
 	}
 	if (paused_pointer) {
 		if (defer_work)
@@ -2226,6 +2244,7 @@
 	vss->pcm_indirect.hw_data = position;
 	vss->pcm_indirect.sw_io = position;
 	vss->pcm_indirect.sw_data = position;
+	vss->playback_latency_bytes = 0;
 	vss->pcm_indirect.hw_ready = 0;
 	vss->pcm_indirect.sw_ready = 0;
 	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
