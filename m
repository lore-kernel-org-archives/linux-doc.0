Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263900;
	b=f3V5cDpkJCni4hqLN0LOHvfXir9zTo+H4KeOyt5z36c7Vp3GHM5ocoK/gumdxeti3Dee
	 IqgmNzmBKcUQlnjud1NysACxgTh7BvfeN1QdiI7gg2L5HqhGm86z4IQciMiaGLOxCOOut
	 4HoYJZwCIZt4YA+GV85X4VblTLwn/DtsXUEoxHBlJGIpnu3XIGQtBfzeJZQqxUp3q4OaY
	 N3tqscZv/dJp98aIrUU0Crfq7xd7djIaeOE8MfIdqYL0f81Sm+EoYwvUmFyW8cQHL75m1
	 Jjo3OhaM4nYwLgTEKD7p2jho4abCjVNGc2lyhJ2a7OhHIBWy0+9PCB/lMjqzg9Jyk8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
	b=acNiZbOBMwWK8CJVV7lkvN7ONK4gbya4DdPbxDhT9xgrPvEKKTK1MgHA94ZxHV3h+kXg
	 OBywT7IxPOlfuhviP6BI0ptxu0NQ4PQo7JxjxVfIpzTmMOWH0xXc2uAXuVH1qU/rbZCpN
	 /nds7BS1ULk9lt03JQND+wPDUGQ9JiMiOXT6Vdr/+epcPt7nIgYfrpB5a8eTARrrv8EiB
	 J99mfpa5c5yT8odxUStC6JqNuanHuxi4RBE27mcsfUf3WYjV9yMI1MNkQYTT+SiGlS8UG
	 didi8ZjfesJw6OpbaVq2XzyIH3XD++2IX+S0Q+4+tsvcE3FYlVmN0zGWFZMc8n1hKPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA9660A2600
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA9660A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eT4oPxLq
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9e53d011eso13416785ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263899; x=1793868699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=eT4oPxLqJt0vehLbTNIH2mhmtt+2Mwa7maTZ2MZYEysHOZHfx5anz0cPd570qdx5RX
         LBh4uwduRem7viRFsTbi3VkcCj72ljudHtTDE8gNgBaQx2PcsnUmEJvVxn4EXXt0WyrI
         Jn3r1xMk1ZFIrwoGQ45oHBbhzS8QDnOVAvpojZgd+pFC/8HB19cXvK1grSkKr+buLQKQ
         1IQx68g+3oQzixPWGOAk7RAXjYfjATfxBjRMgAM/APOI/CM/yilqLy6QebXX6yY8D776
         CmQAOyIVDc1JnFszVerhjlXIePvlntBiEk0uLSeJo+RY0BBD9oCYiH7Fl176DY3YUES1
         OqOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263899; x=1793868699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gu64q4Vrpm6v33wr+KjZ/SbqqwGqHiw0oJu04YH4us4=;
        b=nErd6FFe9Tl1nXv9uRxnAbXelEIjJ1zDxd4t2SJ4SqY1nnMRiepl22IKzndsqZmSpt
         gdV/Gou5Rx1zpmZnSu2ofTWm7t0fguI/Jy4HI/iy/1xR48JvJKf8ByXBFBIUOqn6iPyI
         CrzBaNwT9xa7I5pDue7WGLBFwVQWGs3TVXrqlekpC63L9OgA5PRhvIPYLrVYwZxKNeqr
         FtENlZH0/jMYEfqYGD5OlQVAts+XUg/Q2/pJEbJVo4sesjRdS8bY5uFPmVCd4kDwE62X
         /02rIuarHxmuJ40X/J9/vvNtVqTnOXhIw8dQvrToRAK6ZAQOGHa7NPlxgyQEJVvOCnBY
         Gk3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGUCVy7hwga0+Uu48G4TpBJDrw9OZf5nGGpbJdXXWZ6zooUjTTkT1vvEDzea6pJj93oLmbPYzqmSU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBhEbYZbUIWRB+ldc7yv8fxFUMhqOCyk9DPJr5LGW482LiDsEO
	1ue3DfG50XRt3+w3ZpwnZ7P4xDDXq5PGD5fEfNJ06tyosaHTh5mWYclnRldHQw==
X-Gm-Gg: AYBFou37gG5NmLZx8NjYX6PMBMfqFj1bPH2re1PoG3n2spAX7ereB8zo3eLtQUyCj/g
	mKXghIqKla+pUy+V+XDVlDxhVZZHBcutZzL9Ruo9ASZJO/CBD/NWDF/9l+PmolU5UhLj3w73OaV
	pRn1fRBMdvUmX7Vq1HNgWHPQls8fULwhLqP3xXe1klCkfsRzSDCLxCx7vn4DDuksWC6A0gw20sq
	TLDIfU8jTaYkatzG5VtbwfmrjihxDqiJM1/f9AWEbtHbbKQ9Uovvio2qdFQ4YX/gmCZ44T4C0aJ
	KUXaWm2GW34zpxupGaJ7MEKaXVgBHHRZWxt9S4Gmw570SAp+Et9c6xY+h38+za/fOdaaqG5TuJC
	BbdI2f3MGHqusrL0pedraR4ABn7sjyM7r2KrDloYM2FMV1jsjwooYOgsIrFV/+Ei4I1pMp0UvZN
	Z31vGPK94SDtjqFS2bmRHfe1C6tZEuwaA+Rf5kwBOeIah+WEcJ1KvmlgmbzU9wgrKF4SmKNzf1l
	neC6jvIPCIMgxAoCj2eHQHWzSL8H3tIdLyq7CGdmL2afYUOTI7pRVNqxf1d+01o8ZLSprjL3xNo
	DeHY42G//bMP2ZgTsoj6rZbnx05WCuf5OAIan1HhnzMP5SwTOQSdHy4cesvaQOjV1/33RIOV+N2
	SAdxSSxECIQSg0y6M/yR8u+qzB2fgGuer/WCBlnGKfw==
X-Received: by 2002:a17:902:e80b:b0:2e9:5829:9b41 with SMTP id d9443c01a7336-2eb0041f925mr46273925ad.37.1793263899253;
        Thu, 29 Oct 2026 01:51:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:37 -0700 (PDT)
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
Subject: [PATCH v9 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Thu, 29 Oct 2026 17:50:31 +0900
Message-ID: <20261029085032.70689-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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

Use the locked PCM reset operation for staged capture. Reclaim RX space
at the same locked pointer observation used by the common reset and keep
completions arriving after that observation. Rebase the notified-period
counter there to avoid replaying old period notifications.

After common pointer mutation, finish the matching core rebase even if
refill fails. Latch XRUN and schedule notification. RESET can return zero
before the asynchronous error is visible; userspace still needs ordinary
XRUN recovery. A nonblocking read can initially return -EAGAIN and later
-EPIPE. This avoids leaving core and driver positions partly rebased.

A forced 90 ms RX interval reproduced -EPIPE with the earlier accounting.
The corrected sequence matched the next 48,000 deterministic frames and
passed reopen. Linked RESET and prepare partial-failure fixtures also
passed with atomic and nonatomic stream locking.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -9,6 +9,7 @@
 
 #include "virtio_card.h"
 
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -392,6 +393,10 @@
 		}
 	}
 
+	/* Keep RESET operation selection fixed for the opened runtime. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1686,6 +1691,61 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The core holds the stream lock through the matching appl_ptr reset. */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	size_t position;
+	size_t period;
+	int rc;
+
+	/* Reclaim RX space atomically with the pointer observation. */
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = true;
+	rc = snd_pcm_lib_reset(substream);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = false;
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return 0;
+	/* The common reset has already handled a pointer-reported XRUN. */
+	if (vss->xfer_xrun)
+		return 0;
+	if (snd_pcm_running(substream)) {
+		/* Keep completions arriving after the core's pointer observation. */
+		vss->capture_acked_total = vss->capture_pointer_seen_total;
+		vss->capture_ready = vss->capture_free_running ? 0 :
+			vss->capture_copied_total - vss->capture_acked_total;
+	} else {
+		position = frames_to_bytes(runtime, runtime->status->hw_ptr);
+		vss->hw_ptr = position;
+		period = snd_pcm_lib_period_bytes(substream);
+		vss->capture_copied_total = position;
+		vss->capture_acked_total = position;
+		vss->capture_pointer_seen_total = position;
+		vss->capture_ready = 0;
+		vss->capture_notified_periods = period ? position / period : 0;
+	}
+	vss->capture_callback_snapshot = 0;
+	vss->capture_callback_snapshot_active = false;
+	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
+	if (snd_pcm_running(substream) && vss->xfer_enabled && vss->prepared) {
+		rc = virtsnd_pcm_capture_send(vss);
+		if (rc) {
+			vss->xfer_xrun = true;
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		}
+	}
+	/* Complete the matching core pointer rebase before reporting XRUN. */
+	return 0;
 }
 
 /* PCM substream operators map. */
@@ -1715,3 +1775,18 @@
 		.ack = virtsnd_pcm_cp_ack,
 	},
 };
+
+/* Selected at open; the staging policy remains fixed for that runtime. */
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
