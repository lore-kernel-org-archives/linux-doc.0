Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412544;
	b=TuBGiTFxMlqlbXpVQQ4tNmr7ghz+sUvJEbEuQ7Rd3lqGDdrMMWRwL7c94HREUZ0EIXXT
	 +WYwu4066EiPf6batqO/avT7+hzgLaH8XhGu6oCseNEBWoQX1O5vXJ52MxhPh77Kxequg
	 zyUe8j08bxY9hXw6cDIBvp+zlmX/YAcAVm7fscf84F3bPZdFkt+svGpsFwqa3iu+lt66D
	 84oi3uWd5naPmFcRwlUVTVCQ/CEqBeOq2wYNP796oVidKCGpWezQNe5zV6faqKP2xKJMh
	 dNSSuXnLkHjvhFN6JiW0atBOmvsn7+7czJIbHMyDGar5c1hQd7myWVaCmmMMiHKVtUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=SG/JwheCVO/SacAB44yvQREfKTwaqyduefJPSX0bCVXs+ZeSNxElZTEHlYnzIRu0f+Aw
	 69sej0kMDZ7F3sznLSaPrgh0kElhigzGaUmlW5Y3VALv63cpbqVhj6i0clEjcn/5GKYA2
	 DlZi5MPW1jjArMSgYuZWxBGVQ26+H/03ZBF99nQx/G7/grvU0EWLceGwiuh71QAmwA7Ft
	 6LrZg+hxJeYwhA/oLjKO5bDyvwEK+BroaRRevh2CXLB/3/qni1JQr2trg8sGyv99toAf+
	 EBXINw+sDomVhYDmHIvFEx1KByjOgv0GiDkpgiPClK+ezA9yrH47Ffoqs528AWCojRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc2ZJn81;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E44606A322
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02E44606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Uc2ZJn81
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3550c917fd3so1777868eec.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412543; x=1794017343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=Uc2ZJn812SiqhnAC5EPY3/hZex2gjPxTL32N5cMnYTmqo0vnC6k72HM1rKvGMx2tBL
         MHPXCmwEREhL9w9kdWVWnhvPYkxFzkiJBOVvjWXtHDxkDVUWBrgwQVYd/H7BzNFptjk4
         nFAwWvGueYase697O8Mp5UteUTPBqhNzb8F8oggKSJ8sCALKDJ1F7E7OKbG6UmABrX6t
         erL6G4zxx1HIeBl3GmR+22uEASLsW/R/tLt7yqoO7mSw3vkvmoUdY8kok4t6S/oyahnT
         /nuTx4Q7AlJvQ334NwLxglkxOEMWEkyDW24RASRIHrz6XE0rfAxRoagLaPAw3iNmGX7l
         mrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412543; x=1794017343;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=YL80NaSHZdR/QPOaMNANiE5FXGSWHqChjwyZ2ZK6d/c0THia9mDdHhKJaAytYMaxre
         j6+kusw/4LHZ1o6SXKZevD/GdT91+SAwkyH/oOqNGCv6MlYX9IZpFOz1sOqc2pPeoilm
         kVVFyOGBFqiFHyWYqrUmI6nObaeLBjCguabI9GVUkaAinePj8UDnxiSLVdRQW8/pPs+1
         wHh2IiLCq6uaqIKh4C8LFQyyC1mhHwNRiG7lmVyK6m5V12IEIyFKKcEGFP2Pzy2C8pii
         5PkgG/wOxJGbLl3WEaU7eNT9ee0rXcHShJZSumaRG3+HE3nNEjZn0UldqhPZGmWuuu0u
         SVPg==
X-Forwarded-Encrypted: i=1; AKwUvByOavK2apSJal1gcqyZrps+ar4lujv21zut6U7sTvv3rSymfOCxZNlDpaiSpToGgFssu6m56lptIAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLriF1ppb2cYqwrP5Ah24Rzegx/5hkL3mT9+H2Qmb+3Tifovjoa
	yCbdh9mn+gKTxmc3ikbNK61wQDyol7Mauzn/iqqS1XtgUu4oGic5c3ao
X-Gm-Gg: AYBFou2ZJyTQC1x209zSuG64HU14IZ7Npm0iSc8fPYwNwBlizn7I2cRoAZXwJHLGhWv
	Mqn7ubz5LQ3jZ6V8bb7sn9L7s7XxvQr00VAFIdlIvbT7qY1uKH62EPboDXZOUz6bao2eLYMcPwk
	ONfu5dnMMy97wQWrDoM97LomIgPYmWRdDgtNjvFnBAN3tiK+mzKQPUxon6+904J+BEQ7lq5JOBt
	ICb2Ab8AOvrkAkZe+w6UvFs0OEJa8hTHfF729ViMtHSz8zjrD4P4byHrfwPgHk+oIvQd3qJ+pVn
	J0Jwi9DXXLRdV7rBG7lYQNdNqB7FOlzNI//i05PPNdBr1qPLguwm5kHNWqYqXb5BmXyCgQWh6/N
	EeSOzIdgEngDuXQJpzVNi29d3IhWRe6ntAAbEiYa6n00MXAlSd3oYP7VVY9b7KoqcFgFBeRq1m+
	r3tRjts0T+omuRqO1VDBqSNCPvT00QOmd23nSYMh4HBeks5rjfs0BqQ1fj95C7BQSPp5e2ZjJH4
	zdKB9eWJc/Jvcb74qqyXgb00p6kdZUjo8FiOYcloGu9ovSL3PG47iNlLud6Yq5kmjjkbnQkx7h6
	MM3RMK54kthxqZqDOUuSBgFSf3zIyFDWoY/LJFJnjV7ZRopzBTFcFMsqb/dKRvit6RjKcNQU1QY
	+20bORdYRuWGMl/IexXEbirLOji0acVjpPzxkMbOAgrw6sMU=
X-Received: by 2002:a05:7300:ce08:b0:343:ff9f:26f3 with SMTP id 5a478bee46e88-36a42401de6mr5091501eec.9.1793412543022;
        Fri, 30 Oct 2026 19:09:03 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:02 -0700 (PDT)
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
Subject: [PATCH v11 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Sat, 31 Oct 2026 11:08:42 +0900
Message-ID: <20261031020855.2402-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
--- a/sound/virtio/virtio_pcm_msg.c
+++ b/sound/virtio/virtio_pcm_msg.c
@@ -260,6 +260,18 @@
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
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -466,36 +466,100 @@
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
-
-	virtsnd_pcm_msg_send(vss, rec->sw_data, bytes);
+	struct virtsnd_pcm_transfer *transfer =
+		container_of(rec, struct virtsnd_pcm_transfer, indirect);
+
+	if (transfer->error)
+		return;
+
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
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_playback_transfer(substream, &vss->pcm_indirect,
-						  virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
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
+
+	return 0;
 }
 
 static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
 {
 	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-
-	guard(spinlock_irqsave)(&queue->lock);
-	guard(spinlock)(&vss->lock);
-
-	return snd_pcm_indirect_capture_transfer(substream, &vss->pcm_indirect,
-						 virtsnd_pcm_trans_copy);
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
+
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
+
+	return 0;
 }
 
 /* PCM substream operators map. */
