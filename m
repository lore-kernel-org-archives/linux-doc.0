Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365878;
	b=WiRkRNd/b5uUXCheL6Vxk8MrKrmQMKm4UgkNbGAMRwzHuVBZ7Mn6Z/MKBlr0p95Yp04P
	 EX2MG1I4swP6Z2cIw/F7oIP15kS1wwzOimn1s7k+VcQ24UaW1ulKbhU18J0LRWP+zWDve
	 UGAuahQMJj38aUNMxSt+2LYBUUVxG5Ec5Uv542tKl0gKRQjHXo38J8osPK6LjmLfmeQAK
	 NOSVPoq3Cev43HTnOQ/uBnx63Ch4LcvdisucEHn8zvbYPUUcRiM5M7BnXXbpouQLIX3S3
	 BakjyfjR9sv8ONFjqLuUcxm+vMYClHEibuCS6+Prc3G8TQYksEF35UEm3naBoPSUP/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jy4K+1GPAbkpD0UdYh2XMFqYJy9GKlqwMFTip7Xat8w=;
	b=eTICveQXw2aqXDC8207Eo3eVQKto2BlArrhPEt2OTdMPM2In/xTdwvV18rzYYahFCcyK
	 6BGNOipjIXJdH3GluAWKqnI2L89jV+N3ypJWg2z+flxCaS59647+UrTcnEMSl3VkPywMq
	 Fwb8nPDLNgbInn5pdpEQxXWuJg1jA+H1fJyhgseanoD90eJLcUw+VMnq+iLC/qSr3qq4H
	 m2nQPL4c7QfDg7DSTlxfwIHzYeiUQJG05Z1I1ZuQrJ18pDUrSk0YthCVVybxD7nVCtBig
	 WXLh5t79DrQYcDFfXRTi/X0Of12LIuTAeVzGv1B3uLGvfh9/FL2wFZ8djIgqn3tVhOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thsRG855;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8786660A2627
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8786660A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=thsRG855
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37071c0f42aso4764564eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365878; x=1794970678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jy4K+1GPAbkpD0UdYh2XMFqYJy9GKlqwMFTip7Xat8w=;
        b=thsRG855XUmG1q4oRwEtr4rUOmoWuMTNBuGFiEFR7N6gi3T6hC0tV398n2T/iV7m/D
         /YjyCL6vfIAarkTobRFE5mEVpdveAqWCjQyGOyQXv/HgC5gH72LjGoMuQM+quQXpGlB9
         aX33nbIDzxCKW7FTgsY18jBOMy3y3n3PzETq0HVkJfDMIvYCKoNCTIgMYVmbfoQd4mfT
         636y42oNLNgHxys3abSsJ7d09T278JqmuvpM1B+llEGzdiItazdYaqnXsYhTVmKhSpc2
         Ecb4l7j0QrwnIx5SE8W+43hXIHv5VT+9Xmi8CJJT7xkVePTpt+7a4tSpHEGphJbm296F
         S4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365878; x=1794970678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jy4K+1GPAbkpD0UdYh2XMFqYJy9GKlqwMFTip7Xat8w=;
        b=eK0Ie8KbJToHzG4lQAMh7WpzOdLVibLj/haWU1fIv+H6/BwVbk6emXjQRR2a2UGxFc
         JSjESraAZ9w5wEiC7xtMGG+LpgtOjFsxPJDMTPisy6eNVuqHJJiNOsO6khcrikxVQQUR
         W4AH1x3WcoSRPD98y7wb/PHsGEfe//yJYqGdX29JybyJQ9RU1M8bN6Fe6IAHoQ8b33ct
         ak6il2FhorTH+XZdqzK0X1pxyGcc2nJIJsHfSHctlqQRiFo31/7tyWNW7qRL2gvGoxoy
         AfwsSoLVf7AwXIz3AUMrf0UI8Y0ep6JydUv14/qeutJ7xHi8+MhVpO49x+Ekc/B9xSIr
         5JVw==
X-Forwarded-Encrypted: i=1; AL+hErELnukd6iGw6C181L1cpfqKpp0npLJZVXmR+W8Lf2pMAS9Y6m0/0x9C21h63aT0fEdgDR4ALfojf88=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LKsv82KBtsrP4hUSOJgjAmdYrTlnVxatL2te263six6T9vuKz
	df4gOPlEbA3e3C5AKsXdlM7GvG5bueT541dfQfumLrA2PRp7U3myC4o3
X-Gm-Gg: AYBFou1n3SwlpdFkvTs7MpPHEsUFXtHC1cYJFuwNDbio4TvhFz9QAv1S1EOQN8NQ507
	BML46bLamKqYbessgAVw4/ZBEWOq0u58UTbLg642hy86e7RKMETpzUjYCt2LkC+3URvNhxFPqht
	oxJMumPwh5+jAA1yiCNMhx/jmfdzCryCniHEumbvP0iityOckoQvAukP2uFoLdLk88epdJrL46d
	UB9iZwUUZCxNknZItiVoD4gr5y7libsm35tLTTy36qIPREeYv06tnIPseGrsgTwSNrtg2WyiZti
	x6tFBq+FEKOwrXIvn/smFc7khn5GvPyYVnJlH5DU9Wf/cKLMrfygO4qXtBrh4uAMxN8hs6/V3pz
	i3M5CyqVHokM1iT6kf1fd3+c9LEjRYaZVyiKLnYCT9BLgVpWwMxqZm9r2zb74K8zUUIrrCdmjU5
	W00JZmqEZJmV6E15FnQH6fQlfEPWDmHXtek63m7p3Fv6eAL7XJ1Lno/xInkgin1PdrlCPqfkzi3
	0/huGMiaGQG9QmcAEn/mGt/eHMjWnk5fkbJLax+h3zXen3FPusF5F/8YB7fet07zekOqERKyPFr
	Mocvyy/8w0g32d16tLyz3i31WOwrI4esIzGaRY3jrvtvrdJqp8WlzsXt1044Zq7T3vZGPeB/3uu
	olfrPjRnpbQBVufWJ5xEpe9G6RcfGBCC6hfXpHwYkFzBq6Tw=
X-Received: by 2002:a05:7300:bf91:b0:372:fa14:8b6c with SMTP id 5a478bee46e88-37685d7532amr1915024eec.19.1794365877628;
        Tue, 10 Nov 2026 18:57:57 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:57 -0800 (PST)
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
Subject: [PATCH v25 16/16] ALSA: virtio: preserve playback progress across pause
Date: Wed, 11 Nov 2026 11:56:55 +0900
Message-ID: <20261111025655.63951-17-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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
runtime. Clear both the cache and runtime delay on prepare and before
RESET observes the hardware pointer.

Use the existing indirect hw_queue_size to keep outstanding TX below one
physical ring: buffer_bytes - period_bytes. Equal modulo cursors then
mean no unobserved completion, and a non-interrupt HWSYNC cannot consume
a hidden full-ring wrap before deferred period work. Continue using the
ordinary ALSA pointer update for silence, drain, stop-threshold and
wakeup policy.

Check for pending progress or a latched transfer error again in the
period worker under the PCM stream lock. A queued notification can
outlive a paused RESET or an earlier pointer observation. Calling the
period helper without new progress after resume can turn equal cursors
into a false wrap when the core has backdated its pointer timestamp.

This reduces queued buffering by one period. With two periods, only one
period can be queued. Worst-case scheduling tolerance needs
qualification.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.c     |    3 +++
 sound/virtio/virtio_pcm.h     |   10 ++++++++++
 sound/virtio/virtio_pcm_msg.c |    8 +++-----
 sound/virtio/virtio_pcm_ops.c |   19 ++++++++++++++++---
 4 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -338,6 +338,9 @@
 	}
 
 	if (vss->direction != SNDRV_PCM_STREAM_CAPTURE) {
+		/* Ignore stale work after RESET rebases the playback cursors. */
+		if (!virtsnd_pcm_playback_progress_pending(vss))
+			return;
 		snd_pcm_period_elapsed_under_stream_lock(substream);
 		return;
 	}
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
@@ -179,6 +181,14 @@
 	return schedule_work(&vss->elapsed_period);
 }
 
+/* Caller holds the PCM stream lock so RESET cannot rebase these cursors. */
+static inline bool
+virtsnd_pcm_playback_progress_pending(struct virtio_pcm_substream *vss)
+{
+	guard(spinlock_irqsave)(&vss->lock);
+	return vss->xfer_xrun || vss->hw_ptr != vss->pcm_indirect.hw_io;
+}
+
 /*
  * ALSA may observe a subperiod tail before its period callback. Keep actual
  * unread occupancy separate from pointer observations and notification state;
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
@@ -770,6 +770,13 @@
 		memset(&vss->pcm_indirect, 0, sizeof(vss->pcm_indirect));
 		vss->pcm_indirect.sw_buffer_size = vss->buffer_bytes;
 		vss->pcm_indirect.hw_buffer_size = vss->buffer_bytes;
+		if (vss->direction == SNDRV_PCM_STREAM_PLAYBACK) {
+			/* Keep unobserved completions below one physical ring. */
+			vss->pcm_indirect.hw_queue_size = vss->buffer_bytes -
+				snd_pcm_lib_period_bytes(substream);
+			vss->playback_latency_bytes = 0;
+			substream->runtime->delay = 0;
+		}
 		if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
 			vss->capture_boundary = substream->runtime->boundary;
 			rc = virtsnd_pcm_capture_refresh_mode_locked(vss,
@@ -1197,7 +1204,8 @@
 		}
 
 		if (running) {
-			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+			if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss))
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			return 0;
 		}
@@ -1219,7 +1227,8 @@
 				return -ECANCELED;
 			vss->device_running = true;
 		}
-		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE))
+		if (!rc && (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+			    virtsnd_pcm_playback_progress_pending(vss)))
 			virtsnd_pcm_schedule_period_elapsed(vss);
 		return rc;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
@@ -1260,7 +1269,8 @@
 				virtsnd_pcm_trigger_failed(vss, epoch);
 			} else if (virtsnd_pcm_start_queue(vss, epoch)) {
 				virtsnd_pcm_trigger_failed(vss, epoch);
-			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE) {
+			} else if (vss->direction == SNDRV_PCM_STREAM_CAPTURE ||
+				   virtsnd_pcm_playback_progress_pending(vss)) {
 				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
@@ -1610,6 +1620,7 @@
 		}
 		if (!paused_pointer)
 			hw_ptr = vss->hw_ptr;
+		runtime->delay = bytes_to_frames(runtime, vss->playback_latency_bytes);
 	}
 	if (paused_pointer) {
 		if (defer_work)
@@ -2213,6 +2224,8 @@
 		guard(spinlock)(&vss->lock);
 		if (vss->msg_count)
 			return -EBUSY;
+		vss->playback_latency_bytes = 0;
+		runtime->delay = 0;
 	}
 	vss->indirect_reset_observing = true;
 	rc = snd_pcm_lib_reset(substream);
