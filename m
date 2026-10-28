Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180533;
	b=J6zTC0ZySYhWoKjZQFxklW6t2n1nxxWKQjptRSJP2YJmKreoolIxr7+cSDGVUjZJd4Lg
	 3psW2rPIREQfrxSxN/5cfK5FOxYQZYzeNECKslWd7zfIMduzpJLNAk7R93fRsE+PbW3iN
	 FJnZ6Bx29AMsZdoFArQ8EZGlOSTZb1I57Vc+5Y4U8L1DMk73Sh53XvtmX20SWt992io7S
	 Im0aWDGjYogNjSBMXPuTMuTjVubD6BUv1lE7ofnQX+yDL53m6n9Unqk2co7VggET80Vz2
	 yX6/9b48tqOKATVcyvEpdAAhFkMPagGe/IUWSh4DB+k7CD/gbUAH4be4YvmyN1l0uLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180533;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
	b=mXqb76iIv06za/dTjI0CI4bOPwgedcESW9+nL4JgxBiUkFV76C9wFNa1hMhwl2kmCofD
	 aI/aXCSdTg9xAHEhoSmhFOVNfVTA9WSt65yR0HlSlK6FClfkQOmQFxwaXlCNMrQSObL1G
	 KxOBTvfNGIM6mAut8pUPUGnp0vveYeT8LEXfaRVvSdpAz2DjCl1Rv9MWpAXQey9EezJmS
	 mstEuCAkNZQrZdbaTrXF2ActbdLF9RgRzN5ybq6F4UfC6CSq70s9G6DY3E9uk1gsLQQfT
	 5QwrmPmmuDCa8msheF6tcjk5MiYxdtHJ/fhhkvxxXU/HDVE8Y8CJalsTl5ldLAJ8Hjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865FB60A3808
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865FB60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lv8nc96V
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso482295a91.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180533; x=1793785333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=Lv8nc96Vj638jhK+Nu0b890PYUx8A4roeDUJaIw+7/dWn2paKf8254dLSO7qth9hYy
         Qt708dstJAezYa6e75WIk+MG7H5dOv0+bBs1KIEHTMPjCMiF+ekATn9Xg8GPTo12sb0I
         EUepLJb1cf9uFNmYjZzFFci21dgAVVPJKV5rlidxenpP8kbC4/LRySq6Sco4K582fpdO
         7IoYb9b8BUG3jQGk/V/o7tfI+n3ZtCe1jSqzhYqa7ifwHetoa+HFDTMXnZEvaFOyy6o/
         WWb5Cd+lQlUxC+VehMEh3DuyytJEsqqaNsF0kg1H1sAZPoTjcnEqvnr5IfdP/y/KxVHt
         yrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180533; x=1793785333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SSKD9R3/tZDll832XAf/4iUolviOcI2RSxt/Z/hu94=;
        b=gxBzEDBduwL2ZQVAkmoI5UP+5VQyfCKzGLUJ0Imfkx1h/SRHpJas/XVptjUk2HwIs7
         GaH+rkdM0acy5nFm3XX1JMMNrwUjLM2IGhfKKyTHz++ax3TA44Ty93F9mFRdJcbFqShK
         K27zjXFylwt7ExDGCz/+0yFbjU1jsGdy3FSwsmFt2bc5xa54xJFHmCiIKhJ0nzZVGsJH
         OpaWBFZt4EAGSaFP92/xKxkzb2QVCj20WXTPADt5cD589SCx2UEwyrpMMglAbsf94cYc
         xbp5t4cHqcG3DY5B3QKPRONMbnZeiVD+2pSNH7Vu/B7aZg3a9TYJP5rK8j465pBYU4Aj
         MZxA==
X-Forwarded-Encrypted: i=1; AKwUvByk4S9ecovRUa2gkHU7WXLklltFWzcx7OM8tas17mQqZoNLwhZfD7aw+zZ9wza/W8SokbsJACM2z7A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLqTfgY+/AUsvorqRzB0W6KzTxdVAhJbmh3uKrmHn6nQTrYOeqf
	/fB9CXOyFRfLz9WgVizxeOaXmQZYTAgV9AKwC2VIJNTESlG/WKOYhvrv
X-Gm-Gg: AYBFou0VbmjqBckOBxRq6qVyJ25QruweXOET3kEviLP7Er3ZsBm2rbUezoF0Pp/5fVj
	5xqqdOyAp8nWhnGLYlk2G8wY7V/NV6FK8TFwUTrQ0eg8jwPBAYtm9d1cceHhFJjmKmgx/AICNmN
	2eNW9czuEXgNyKgdDRkU7rsKrwMkQcDQe7ayLXNDQPNX9bgarcZQs+GgBbZBs4DeINFN5iPLogJ
	7iM/+0YkOQpeZuWYYGQRj00NTGqsaSjUagMUufjY0eyYNw/lyRqjFeCOrtPIQrutaNIkAsSjMLb
	I5Lcn/ttbyaxDtxp7fFsmjdgNRAiCHmBxdHRq3KZZOOlQMlwz+oT18Mteus9ZCymsZBy40SlCPw
	H0UYtRq0OFS7u/vB2HCtuZVThkaEI5MBlV/okK5dUrpzh2jkGJcjO4zG9StkCNfXg448427Snbe
	KFkxjEC9mnR9hepLnn45/kq77w2/OftzVmHLxlLZv3clvpqQ9BPXZBDuKf7QwDWGzlkNjc8XQs5
	uANce6cc4e21DusLp0TG0S2XabnA/cM67y4410VfFf5m+kIdoco+Ss71HILItPsr+k62En89I9d
	Z0OVGu8ZmC9+ya6icrqGIo/0l+Sz+yEcMSqgksNpcrp10jkHSNQrlIYddaQKHZobXpNxSfkCZb1
	a720bwXsA3qtM9aQeCC2kGgFX83nJCghcvGKfV/KKGEYANUA=
X-Received: by 2002:a17:90b:2705:b0:3ac:9717:afd1 with SMTP id 98e67ed59e1d1-3ae58319466mr1220106a91.63.1793180532909;
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:12 -0700 (PDT)
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
Subject: [PATCH v7 09/16] ALSA: virtio: prioritize staged capture period work
Date: Wed, 28 Oct 2026 18:41:25 +0900
Message-ID: <20261028094132.20364-10-mynameisjune111@gmail.com>
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

CPU contention can delay staged capture period notifications while RX
completions continue filling the unread ring. In a two-vCPU VZ guest with
16 nice-0 CPU workers, the ACK-fixed baseline stopped with ring_capacity
and EPIPE in three runs, after 11.74, 30.77 and 30.33 seconds of audio.

Route staged capture period work through system_highpri_wq with a common
helper at all ten producers, including ACK errors and self-requeue. Keep
playback and non-staged streams on the normal workqueue. Initialization,
cancellation, buffer geometry and capture accounting remain unchanged.

With the same kernel, input, geometry and userspace priority, the candidate
completed three 70-second captures and immediate reopens. Its maximum
matched queue-to-start delay was 20.366 ms, versus 108.112 ms in the first
baseline failure. The other baseline failures had pending work without
matching execution, so matched-only statistics do not bound that delay.

Reader scheduling delays were also present. Both arms passed a separate
nice -10 reader control, and host load varied between runs. These results
support the change for the tested workload without isolating a kernel-only
cause or guaranteeing lossless capture under arbitrary CPU load.
KASAN/lockdep QEMU regressions passed with the unchanged candidate source.

This follows the staged ACK fix and pending VZ capture support. The
introducing staged-capture patch has no upstream Fixes commit ID yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm.c     |  4 ++--
 sound/virtio/virtio_pcm.h     | 12 ++++++++++++
 sound/virtio/virtio_pcm_msg.c |  6 +++---
 sound/virtio/virtio_pcm_ops.c | 10 +++++-----
 4 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/virtio/virtio_pcm.c b/sound/virtio/virtio_pcm.c
index a3478fc8848db..d8515b2144a14 100644
--- a/sound/virtio/virtio_pcm.c
+++ b/sound/virtio/virtio_pcm.c
@@ -397,7 +397,7 @@ static void virtsnd_pcm_period_elapsed(struct work_struct *work)
 	}
 
 	if (requeue)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 }
 
 /**
@@ -606,7 +606,7 @@ void virtsnd_pcm_event(struct virtio_snd *snd, struct virtio_snd_event *event)
 			if (vss->xfer_enabled) {
 				vss->xfer_xrun = true;
 				if (vss->capture_staging)
-					schedule_work(&vss->elapsed_period);
+					virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 		break;
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
index e143a15592f05..5d1d88f2823b2 100644
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -8,6 +8,7 @@
 
 #include <linux/atomic.h>
 #include <linux/virtio_config.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
 #include <sound/pcm-indirect.h>
 
@@ -114,6 +115,17 @@ struct virtio_pcm_substream {
 	wait_queue_head_t msg_empty;
 };
 
+/* Keep non-staged PCM notifications on schedule_work()'s normal queue. */
+static inline bool
+virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
+{
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
+	return schedule_work(&vss->elapsed_period);
+}
+
 /*
  * ALSA may observe a subperiod tail before its period callback. Keep actual
  * unread occupancy separate from pointer observations and notification state.
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 795e52e09564b..663f7695b5be8 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -627,7 +627,7 @@ static void virtsnd_pcm_capture_xrun_locked(struct virtio_pcm_substream *vss)
 {
 	if (!vss->xfer_xrun) {
 		vss->xfer_xrun = true;
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	}
 }
 
@@ -720,7 +720,7 @@ static void virtsnd_pcm_capture_complete(struct virtio_pcm_msg *msg,
 			virtsnd_pcm_capture_xrun_locked(vss);
 		}
 		if (got_audio && !vss->xfer_xrun)
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
@@ -858,7 +858,7 @@ static void virtsnd_pcm_msg_complete(struct virtio_pcm_msg *msg,
 		runtime->delay =
 			bytes_to_frames(runtime,
 					le32_to_cpu(msg->status.latency_bytes));
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	} else if (!vss->msg_count) {
 		wake_up_all(&vss->msg_empty);
 	}
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 85e7576903d56..d50924b792f65 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -232,7 +232,7 @@ virtsnd_pcm_pause_restart_fail(struct virtio_pcm_substream *vss,
 				VIRTSND_PCM_PAUSE_RESTART_RESET_REQUIRED;
 	}
 	if (notify_xrun)
-		schedule_work(&vss->elapsed_period);
+		virtsnd_pcm_schedule_period_elapsed(vss);
 	vss->substream->runtime->stop_operating = true;
 }
 
@@ -1253,7 +1253,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			return -EPIPE;
 		if (!virtsnd_pcm_capture_counters_valid(vss)) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1264,7 +1264,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 		if (diff < 0 ||
 		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1275,7 +1275,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 				       &next_acked_total) ||
 		    next_acked_total > vss->capture_copied_total) {
 			vss->xfer_xrun = true;
-			schedule_work(&vss->elapsed_period);
+			virtsnd_pcm_schedule_period_elapsed(vss);
 			return -EPIPE;
 		}
 
@@ -1292,7 +1292,7 @@ static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
 			rc = virtsnd_pcm_capture_send(vss);
 			if (rc) {
 				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
+				virtsnd_pcm_schedule_period_elapsed(vss);
 			}
 		}
 	}
