Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252645;
	b=y5916Z+7Xq//PFxwozcWV5YH9Oa8lbv8tQVWSgD827K9fwJxRybQrPXcwiACXHi9DDn1
	 ILf6gloU6LkRppLWjbZa7II/8pXrtL4ugaZGpXt8xaOMXH8f2aWKpJbeU0wE6WamFWC1q
	 mpZIg4yNC0DxoJkBJ9U2NjTGrRz2qxTg5HSPiRsN0jFyU7Er9Lws8BIULQf6gHbILtSuc
	 vvOgoXbN+iqLx4flSus1l6SCxAUUVEDZ4HyQw8OJ+SvpweQeWL7St4R3Q5IisjvI487pi
	 1OWQkTD67QflxScG/OcWNFky4FwjVeEH1c5pOkI2HhoZ3GKfcV7QP/PI0TQT9OzOVkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
	b=ED4CmoEub1XGjZO5gS1bSM/RlQCJpjXN5fpL2neQMZ2vKnr1S7PPnE4tkFVtZz6HOSai
	 LCfZIFBj85T3Y3WwLVH8GHogh9UsANSzpL0z/PtqJYXCFFjzrp476ugBwDXPzrxDb1kKT
	 MmG9OfyvHfp9a50v445/RZEz1R6yOcryFoN7ft5K+D+ySoPUvEvPN2hs6zvswnJKC7yQP
	 oQkAB8ORyZRZIL9bq/Zm4Efk+2bnL++FLLmAkaG28lr9i8z6EuZCihY5Y7QtYLFD4JapL
	 4lRQpgDQfLJb3qWmugNt+eXQiD+x8/5cX5PGc/PONOEgOVHT6T1AAmbAyaQMulpCoSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BC606A324
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6BC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NUiAT+p3
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso980194a91.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252645; x=1793857445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=NUiAT+p3vew3dvCFUIFB3TQ9suA1ZcTgZdKitD1bCw68LxSEV4NHT1ejzYx1LzQR0H
         Ltsm7SgPqyFvmRK9/d+KWPVsL/gCY6c4xHiJAuTxE9TeXMnJYLTiav2++JK8qOsBoTYS
         zmIKAD9cOVx9pxRwC7rp+pTnL9z3C76PjhzsdZmwzflWzU6sYsrU3muuRnm0pPAck5Vj
         q5Y2jk7LShtO3A4w4BVuc7q2OKXL8r/4pBgwKiN7RgoPURpOuS9hw5BTkWyuSkyHzuu1
         gBzv8v143lgaNW2mqohG6MSOfViGY9PtTUZPNpQejWp7ah1BctRX78C+D7IsXhVpbFUP
         iX5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252645; x=1793857445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kgp/0IKbbzTkFGoA+p+0MZbAmeWaaCFVonzMq0pKQfk=;
        b=nnC0Otk+AxM0EFbvG1Zgf+HTTMZ+D1ec6pKqmxCO3AqxJUh1ch113/T+VzIo/AwqVh
         ahCurJD05F2It1D15y6HXBQk5lQZbeeAfDGBQEEVhx9OAbpmJcDvu3q+7mNAjdjUM8PM
         y/k7tW5XfsOMJSFCh6SH3a08i/bX2cjinZAGF2XUSMUHDyExS80w63mxPyVQsCzWqbrR
         SL8gHtMQYcOADwclLhKLWSVUOruaO0snFbU5Dm7BhuoQfIe9lyO2sSVrbFOzAVsdFOX9
         9fwDTgz37engVkAvEYiEgfki/LDGwn9BTY7Kbiy4ji8M7gLLnWxqKhl6j0bNFraFPQPy
         5Nzw==
X-Forwarded-Encrypted: i=1; AKwUvBzsll2IBx38h96gvbWiHV1soaBgIz+0cGqeW6f5H5k2jxz3Q4bO9lUSkQmBKk1cCuFDBPRPse/cBjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9xQRlDXAgLf1NYWD4jW/jNnQqTdciamzaODT5KOnT/utUxPOq
	Z+qhaYiCVHTDJcFFFbuRI+ALdp7xwkDD00imil98AhWcA2yYu34/fgy8
X-Gm-Gg: AYBFou05PQNq2oQE2oOp4EZEM+Z8w0ZH0eBIA8FaS4bPUhmfXY401XSGY9+Kqnd76Nw
	u12wN9D1PPeEhrZOnkla9EomnbbP9AW7ihYrjqYAvvfrHF0o8bX/u+C8xx1o8ULTw8lf0lftpyp
	hMyUxSy10nfyH7g3KDidHEj+7GIh6wTLInBm5M+LeCgQZhYUPK4mhkdj+9iNLopop3+99MvH0Hj
	oSlzTL6BbSq+y+v1f6vo/SRD7757zGZPvXe+WU7+q7OUifXMu07aPyP0PJUENuerUX3SPAzZ8eZ
	KXQtD0Uapp1fuHHuHs490sEBzZBIyufhoHAZimSRx7m3YYkcgJbn4xLyDPmJxdnG3ThBxJESfgQ
	QUAiY2Nxm8Sar8jylzmMga33mnhZ7Y8ccnVQH/oA2IYYogy+2ij2kkFirf4y6u/uDoYgmeEqKgq
	ihbMcg5MViDyEq3nT4xkhCPV5sFATl55Kk4eeKzOu1VkVSQkTfhK31H0+rMaMaFBa+QTNYYw+il
	6dIgwLdpCpMBjFTI7QRUT5mR60Px3ppXcVMFkWsguKLYGIpR3++IgyPbvkReT8stqUZZ/2iOnie
	dBo1R/6BsDC0moxVNyMEWsBgHxr7rBZg5Y1/+JbZpXNvdAuccX9UFg+COXsZxlhtPUtxJp+BqGs
	NmlLPKmAHFfv298GP40crviWSCOtRDMTZL+kZQMvtS0fcPlw=
X-Received: by 2002:a17:90b:5242:b0:3ac:7556:8eda with SMTP id 98e67ed59e1d1-3ae58100ac6mr2908685a91.26.1793252644765;
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:04 -0700 (PDT)
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
Subject: [PATCH v8 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 14:43:41 +0900
Message-ID: <20261029054354.2931-2-mynameisjune111@gmail.com>
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

virtsnd_pcm_msg_send() can fail while queueing a transfer. Restore the
failed message's length and notify the device about earlier messages
queued by the same call, so they do not remain stranded.

Propagate that failure through the indirect PCM transfer callback instead
of discarding it. Commit the updated indirect state only after successful
submission and stop further transfers when a send fails. Return an XRUN
error to ALSA so the stream can recover.

Keep the polling feature path unchanged.

Fixes: fe981e67568c ("ALSA: virtio: use ack callback")
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_msg.c b/sound/virtio/virtio_pcm_msg.c
index 72103f606716..5371f4985fd0 100644
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@ int virtsnd_pcm_msg_send(struct virtio_pcm_substream *vss, unsigned long offset,
 				dev_err(&vdev->dev,
 					"SID %u: failed to send I/O message\n",
 					vss->sid);
+				msg->length -= n;
+
+				/*
+				 * Do not leave earlier messages queued without notifying
+				 * the device when a later message could not be added.
+				 */
+				if (msg_count != vss->msg_count &&
+				    !(vss->features &
+				      (1U << VIRTIO_SND_PCM_F_MSG_POLLING)) &&
+				    virtqueue_kick_prepare(vqueue))
+					virtqueue_notify(vqueue);
+
 				return rc;
 			}
 
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 1091100a4c98..a40ea394bf17 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@ virtsnd_pcm_cp_pointer(struct snd_pcm_substream *substream)
 		vss->hw_ptr);
 }
 
+struct virtsnd_pcm_transfer {
+	struct snd_pcm_indirect indirect;
+	int error;
+};
+
 static void virtsnd_pcm_trans_copy(struct snd_pcm_substream *substream,
 				   struct snd_pcm_indirect *rec, size_t bytes)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
 
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	transfer->error = virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+}
+
+/* Caller holds vss->lock. */
+static void virtsnd_pcm_transfer_failed(struct virtio_pcm_substream *vss)
+{
+	vss->xfer_enabled = false;
+	vss->stopped = true;
+	vss->substream->runtime->stop_operating = true;
 }
 
 static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_playback_transfer(substream,
+								&transfer.indirect,
+								virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: playback ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
+		transfer.indirect = vss->pcm_indirect;
+		if (vss->stopped) {
+			rc = -EPIPE;
+		} else {
+			rc = snd_pcm_indirect_capture_transfer(substream,
+							       &transfer.indirect,
+							       virtsnd_pcm_trans_copy);
+		}
+		if (!rc)
+			rc = transfer.error;
+		if (rc)
+			virtsnd_pcm_transfer_failed(vss);
+		else
+			vss->pcm_indirect = transfer.indirect;
+	}
+	if (rc) {
+		dev_err(&vss->snd->vdev->dev,
+			"SID %u: capture ACK transfer failed: %d\n",
+			vss->sid, rc);
+		/* ALSA treats -EPIPE as an XRUN in ACK and pointer paths. */
+		return -EPIPE;
+	}
 
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	return 0;
 }
 
 /* PCM substream operators map. */
