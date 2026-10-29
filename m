Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263906;
	b=CIA5xMxQNSb4tNil4ZW1FhDcOEGFoS0nzrX+3oDXLdNqNgo05JhxHE8R0RzhE1vEF/Cp
	 77d5VjzoIt5ETTnGl7kUED1IMlgBlcZAnGevSuTNJ3QmSmJLc2vbULA60Ov4p4uDjFfVI
	 +w4G0A/8eu+kWnzNe4m8F0wT82tnuDwOEyR+kcQBebcjxobxs8q4JgjZatWkCAJF0ngUG
	 oyZDl/iTvYF2BKfEg0Jt2Tkrrj0lo06RiFMTqwsZgOH9alEKviGViNXFpcZBNEvBU1Wqh
	 JGQVEbO99P2ND3hLF0NGBRMmTN9hPbvFOdJ8hDnWh7GdDPea+bHeVubTRgQRqZyc9jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
	b=ZUbWlt6Cnptr7I5s7xHkYw2lW+oCYDbb3CRFGo8r/Wax0GbujUh9G+Vf2uTybi60LpoU
	 12VoSb733PE62s7gKN9PDP+LbnkSC1qtlAwdEv7V5S6fm3zAv0g65anOvIixoG8cSmxv0
	 3ozzX7yfJUDcDUgxILugoMTykOAdvktxQC1wqI4qV23IgjOvmmH8ivcIiFXxSx4sXBbbg
	 Uv24qXfrop/IGFRKLj8EY+AmBIq0EDG+w6Ovouh4zxx+i02iycs4a+nGYGkxmyULT5VB9
	 xgJTyvtiGwZn/SBWLUD3jxxaskF/bf2kdG0HgbhBbKieiaKjVADg58LMsgOgxwyZ7qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbgJ0jgG;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3573606A324
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3573606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mbgJ0jgG
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e985106c0cso16310575ad.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263905; x=1793868705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
        b=mbgJ0jgGsigEm12I82XPrk7bqHzRynyHB4Hnr9y2JyxWKssVm4Swq+X/bnOp5Krs8H
         Ni5O4t7c36iDEt9pdazFIDdmM/j2h2T89dO6agWaY++u3N+8lVHCn2Kch5ruxOi+w1Pt
         mJfU8zxwkN3jP3yt5Or9F3aptLqi+BPtwSPdo+ge7gCSKbVHpClLmjRJa9sGsJ1XF5xN
         /wV09fH5LTwzGXQeW8/v709x0JGhEoVi2jXJszoWQN2h+ldfqHK2WC8ekMmWnefO0a6Y
         6xiZstOa/C2IvqG/5Pm/Nm/Wxx7lHk3BDayXG8+5gcdhIrw5fAkM4rUQbuhV2m4C4Mny
         XS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263905; x=1793868705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJtB5Nvv2DaUdrJ0GdmD6/1pS/UrSmPqffjERrQCjsg=;
        b=0iFgA07zzTfW5TQW4VyYj3oHYvrVHIzoqclVViGcZ34l9lG8D3uScc/1SuTAJNxQoU
         hHjGaof/Va+LR31vdQzCeFoPW0cBQVkKFQ3lBXYVZ0H3I8aN1OF7D4qMyA/Qp1Bb1WKM
         uvdsagyYIMElcbKkc/dL1pO58DIaAaWRFlLQxNPLhcsALJ86Qmxxqrh7cLkt6oRt1+d9
         Eb6NwWzW0sNcMnWLnkusZ6vR/h6f/XwaNrmVYMjjKfZM2DyUBjzBQxTy6ZO8XqeqrnTW
         yDipRPn4ZwQ93rwg5W/d6aAmVQSbGx3IX+25njq9bnz116UexxamTqWkbH6ntPFMsBUj
         uHLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZkQ089K0fTKYUYfWM6eyTrf0mFt4wt+T9qasEWp1/eiXBe6pF78OqsVJZ4tlWEoS2iAZOCi1buKs=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9A5iASoSZlU//3HKrUJd7oCnpe1I4+gBuoaFFANuPiKZH4jaV
	azgLjoUCH/Z1nxT7CnGWi8r1TZCo28uRzZ2cV1A9p2RRNW3dLKx5BDnhQjeRbw==
X-Gm-Gg: AYBFou031gEUWsBdp7J4MI5jS1vCUdDbGRhXnCLuZzNMOp5zRPsXC3Hhu+j2Hgad26a
	oPlfm89m3oaghtt7nLwLy+y3nDzCbmXH9xr5MUe+zlY7VV4otONBHM1Y9JePM98Wey3LP/o5FJe
	vcYECJdbVp4iNrx+uKwy2B7vzgIKgblqjTkDGNtmEEr8dA4nfe5aMvKN82RlLby6IjvMCqD89/C
	JxEzY9NMTA7d8X+gYjFxsrGfmIZmtlLOdUkCrbZb6B9Kq/u4S25ZXyyopm15PU0m4hhNrrxIdLg
	TWf24+PkVIIQVsD5vrbkiKFo10zJh/R7R25RyWj51qKXeOd5BnUXhLLPFJAjO2T8NBnsqpzOTrM
	KRSFAx3FKnXoREJrmH8J6ziifFixkbehvVNL51yP0UeIVaEVp9L/S4ZCyxl5NHgIO+A+JDwVcjY
	tD8Y0r2hpwbHN6KY0XD6Sb5dKc5WdYQq+tfLPN97WQxBDgDtTFaxdO/3072Avu9VYDFQRLIIND1
	3CVn13xo7ZZgVDQ9t3SXsfgEu62EXc99VfpicO6Du5mR3qJRKTUUdfaPInPSNpJ8vFfzJiTmU3k
	jXr8hIWIA793hWmAhPDREp/2pEE+zggMpYRhT54mY2masTF3g8rEPi0q9qScNqlwXtYWTH5ehhp
	qClosSOhPs8e8plhuw2tKx1DBTMZteLv3Ec14ufU3YQ==
X-Received: by 2002:a17:903:b07:b0:2e9:66c4:1717 with SMTP id d9443c01a7336-2eb005b2f5cmr44424035ad.61.1793263904985;
        Thu, 29 Oct 2026 01:51:44 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:43 -0700 (PDT)
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
Subject: [PATCH v9 14/14] ALSA: virtio: rebase ordinary capture accounting on RESET
Date: Thu, 29 Oct 2026 17:50:32 +0900
Message-ID: <20261029085032.70689-15-mynameisjune111@gmail.com>
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

Keep ordinary capture's indirect accounting in step with the core RESET
positions while retaining device ring offsets. Select the operation for
ordinary capture at open and preserve the staged capture operation.

A refill failure after the common pointer mutation must allow the core
to finish its matching rebase. Latch XRUN, stop further transfers, and
report it asynchronously, including when the stream is paused. Returning
an immediate refill error here used to skip core completion and leave
inconsistent positions.

RESET therefore returns zero for this late failure, with subsequent I/O
reporting the error. With the worker held, the first nonblocking read can
return -EAGAIN; later reads return -EPIPE, and paused resume is rejected.
Prepare or reopen is required for recovery. An earlier error returned
before pointer mutation still follows the normal negative-return path.

RUNNING and PAUSED, managed and free-running refill-failure tests passed,
including delayed workers, 48,000-frame recovery and reopen. Deterministic
MMAP capture tests cover position continuity around RESET.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -10,6 +10,7 @@
 #include "virtio_card.h"
 
 static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -398,6 +399,9 @@
 		&virtsnd_pcm_capture_staged_ops :
 		&virtsnd_pcm_ops[substream->stream];
 
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE && !vss->capture_staging)
+		substream->ops = &virtsnd_pcm_capture_indirect_ops;
+
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
 
@@ -1691,6 +1695,62 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/*
+ * The PCM lock covers indirect accounting and core completion. Once lib_reset
+ * changes hw_ptr, complete the core rebase even if refilling fails. The latched
+ * XRUN rejects subsequent pointer/ACK operations; the worker publishes XRUN to
+ * paused streams too. RESET success therefore does not imply stream recovery.
+ */
+static int virtsnd_pcm_indirect_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
+	rc = snd_pcm_lib_reset(substream);
+	if (rc)
+		return rc;
+	if (!snd_pcm_running(substream) &&
+	    runtime->state != SNDRV_PCM_STATE_PAUSED)
+		return 0;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting || !vss->prepared || vss->stopped) {
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	/* Pausing does not move the device's fixed DMA buffer positions. */
+	if (runtime->state == SNDRV_PCM_STATE_PAUSED)
+		runtime->status->hw_ptr =
+			bytes_to_frames(runtime, vss->pcm_indirect.sw_io);
+
+	transfer.indirect = vss->pcm_indirect;
+	transfer.indirect.sw_ready = 0;
+	/* Consume no application delta while returning discarded RX space. */
+	transfer.indirect.appl_ptr = runtime->control->appl_ptr;
+	rc = snd_pcm_indirect_capture_transfer(substream, &transfer.indirect,
+					       virtsnd_pcm_trans_copy);
+	if (!rc)
+		rc = transfer.error;
+	if (rc) {
+		virtsnd_pcm_transfer_failed(vss);
+		vss->xfer_xrun = true;
+		virtsnd_pcm_schedule_period_elapsed(vss);
+		return 0;
+	}
+
+	/* RESET discards all samples through the observed software pointer. */
+	transfer.indirect.sw_ready = 0;
+	transfer.indirect.appl_ptr = runtime->status->hw_ptr;
+	vss->pcm_indirect = transfer.indirect;
+	return 0;
 }
 
 /* The core holds the stream lock through the matching appl_ptr reset. */
@@ -1790,3 +1850,17 @@
 	.pointer = virtsnd_pcm_cp_pointer,
 	.ack = virtsnd_pcm_cp_ack,
 };
+
+static const struct snd_pcm_ops virtsnd_pcm_capture_indirect_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_indirect_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
