Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664253;
	b=gdljFyV2ObUk/KgW8UgZlLgw5Ox2VsXDHD6VZQ3t8uNLghj10vai5oF4zT0jXtE5yuUK
	 XUzCmr/QT0NApCggJjOnLfNGbBau1Zu76l2SgR7JTZnqKHA0/MVaRCs2V7qqY6ps8gXTr
	 mEcOp8/PCo/rZIJi4Sp2Po4ofwTOa6BxnuAsKzRCNhBkr/fCEyABQDoKmzZvK3kap17ue
	 wo87lLva6tUNigC/0ZUSQgn+9E2VL/e1vEuM/Uz+fvzGi/a9ZHb2h5GXl/9MjV2g8rmS6
	 1f0xYub5BI/7H/iCpvxF960TFSlQzn0BwQXN9sQgF9PWvrHMZl3o66qTzIqE9/z/ODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=Ej90CqUC5NnXYhYKxlhq6W37rOeB8JEoD0sA4pZHte01GVT3CE4kr/hPAlT8v52qlWV7
	 rkpk7soFA49nAiVuMpp60wXxHSVwul+lBYk6c7/spSJgIDvP7a1VJu3hL/zwfoaBhfF/v
	 WJMSSWwAhtrHocL/LAcrwvuLLysb6XvwyZBtItcPDy3FW5im51ky9ZgDlNBsAyDHGj91X
	 X+R3wbv5BybO5hV4d1gZFXCZX05o5ns2sSKHIF5xzGm5nbcasIUpMkXKoXeFYv8Z7mnVE
	 iXwM4K+GVILwi8l2fmF3nfTx1r8TB11RLDIFfG8HQWYHs1KoqRrB8QsDHGRj9oBza2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="hvLtR5j/";
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64419606A332
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64419606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hvLtR5j/
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e985106c0cso33797415ad.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664253; x=1794269053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=hvLtR5j/7+P+cVBrxYbQPwWVmTnGoaaaH9aINayHPktqIof+EX04hpYqRJy51dqN+T
         QrQpMf3cKpJHacFg8dhDIKyiANgeg5udhBosu4w+bOAieR79yj5zIH8jWD85zarMYWz1
         C9GE5xmyLr6xYgnDZ2cvF1gWBvq7bva41e3OfeotqYviN/lmB1mAriuyA2jFDYdmYyWs
         4zBtsh0oE82UU+AtjnC0HnGtPV8UuIgMkin2Ly/Z9+i0YGBcBOqP1whmFMEq9qJgJE+B
         uRr/+/dDZ9pZ0WqKl2XjGYtgc0XAluuDAN12lzqej839D+87XPtNwUUzEZgtwoScoFco
         BQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664253; x=1794269053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=UIzSbu5Z+HyOAVOW8VjZizzaBgxOORk9UTbuYNO8dCF5WZ2K2p3tAZKTZXWKgacy8i
         VRPTpz7EE9TTEnZM70NDZD51byb7GPM7JMTSkES/QHSux+OdJNrtrZyhQOuJX3uwFwae
         mtQa3Isl5OVlbAGO7n40A9VxrbFQL6w0cxx0Qt10mcWvE1AGj8EPrAXpXqSLjOvqhqo8
         SqKGTC4kr2LxF6gdIBqm7Mkxj5b0NFJ99TGtStngISz6CQ8VjoKXVzGqWxVzhrmH0aA0
         hCuXLKaOiqAxKxIwYIoNm60ZssuOFx7Dpy51QIGdVEZzDcANVWFVVZM19pTo27GSDq/g
         4VAg==
X-Forwarded-Encrypted: i=1; AKwUvBx1VgrKLDHOZLFjZU3bKYkd7tZ082P5nu9ZajbRDEWp9LRHydYkVCA0c0cOmjNnSI0piA9vVB0Zcr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/a4EYuivgysk4+XMZy1vRo+6LnUpEmg3QXqdA8ulBMyBC47ehN
	bwVdEdA6sUMKHLTmhPBOW9EZOhghMo6UhdrOx+EvY4sfDUxJ6x4Z2C+1
X-Gm-Gg: AYBFou24q+VMCEe0CXZec+dgZ9fpTjocqgpZhulPO1YPiJ1jCLVX/ern29RvMX5Hjt7
	tfevbXPENXbWyrlU9PKJzpmv7ltqmu6V3UkmgDWH1HjHE2H/pM1VcuakVfM2ZxPUr7Bgu2Rcwo7
	3FeBKg6edxUz3Ru1693OztLMUKccZ4uvhrjf6J26CbaIC1MsHn7K7Wds5q2iGYaOkMXVvr3Kdrm
	UbFN/Wl7fv6RdUleeXmoeDhvajQ/DUT3Z7omI5iQxN6kkquDt2yGviZZ+rXNYPyk8zPQaDtvP7N
	vruTZ0W+NmRCl6nGYXYdHCenWLywzKK6g6mD1n3PdTxyoQRD1fGEb7Mr1khesb9BOrEq3SoqoH/
	xs8gqXZlfjGAKLxMZidoVTO5l6lDBRv9z19nd6pkXDfDwdKNHqc5o/NgAyc9ikA1CBv6GG1/Cwp
	D/nwqtPuAdk8bEMj9ML/dSfwuxmjRtyqz3At4LyxLrlCPxLRGFKjKYFYjBjvkIU/JdcCaB++gQc
	p9QmvplY7qTTXrl33z7bBFFjlfX5jtJ/itwgEaC7joIbQRqwQySj/KojomaF+vHi4U9Sr3loZ03
	ihXzQLuoY+IvaG8yJhyj3uP69ams9tBaGx4zQd5f0cY0wUS5xzsPSfxQ4P+fwVvFhcHCfpvN42l
	qY5cYmCYkeRxzs6Fb7Q6dkLCyi+IxYyxqUKtAw3juzDMEr3Y=
X-Received: by 2002:a17:90b:1b02:b0:3ac:929d:ba5c with SMTP id 98e67ed59e1d1-3ae89847b50mr8986443a91.45.1793664252625;
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:12 -0800 (PST)
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
Subject: [PATCH v12 01/12] ALSA: virtio: Propagate PCM send failures through ACK
Date: Tue,  3 Nov 2026 09:03:52 +0900
Message-ID: <20261103000403.67106-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
