Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338000;
	b=SptRj+s5E+WfD46xRJOptD6HnObkkuIrcZZ+kuaP9nPLlgkiAhNUQPpUgmtYo08hvQbR
	 Pt7Z61UYuS+VQA2YGzxCm1yOlZR/LZJMcap2cX1muPUPOmHgYhMqM/IdCa7qvUnXJUivv
	 sYwGjyzq9mGiehutgU0vzO09eNMAMLJrDgoFJn6vOJWwNs6bWRJiDU4zeIRQsUsgWAZxE
	 SKkYG1yI60+jQQ/KM/6DdyUWB0bCPQ1V9qLgf4R0NtTioZ9FBAo9bU5IR1A0DRY9b3ZzQ
	 kq4ovMK/3kDbgAjs8o1JxtjWDtVqkpmCLbbtt0pRUEQmRWWn/MdC4Qg18eHQQPNOkQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=5ploEletQSGClQtPluTCtrMLOyUYkbJRiQFEwQwt2vv0OtxpUsLindSxW5hwDmRWocwU
	 CC9EiAUWimetkrZcY/hf0fwXuDFACRLgXYUyJw34rN/EjUFbFqkdPahHOiXhavbDOId2X
	 eDx3NmDnhrWn9352oYYnAP1kmUetKKbcS2VaeW8MSc3R2eE+oyHC8AXX1aU6WLr4utyf+
	 OIZJfWo0fa9+89wHJgswPcnmc+vKUKXN75HyEArhs1KNDBjFpGqlU3bCH6SMYCOW8jpne
	 P49KS2IAtoKS4efV/uh6foAUTd9LTFNroHOXq/zVwZmllvRUUh75rXtOwSL7rCOH5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9D4606A329
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:26:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9D4606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KX5QEHG1
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso98119a12.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337999; x=1793942799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=KX5QEHG1Dp7kPb9yx6aJaUcw4AhAv6i81M1bW9IA44xDcJiH2eIq+jqdtL2CSKqIOL
         N2Tegl6j+6yb3agLimvdwV6wC+VmNzELBJOmzi9ilOLpZby9Zk5yATBRD9hnItpzdl75
         98uSHo3buGPuXJ0FEqTLeRMNaeJYlwKuoWpQRFmwuZ+EYh//a70pO4jOQYZ4c7BRPXo3
         qjdfjvxQHJjZz2PbfKQ7edMA9bSjhcceFkvpBXEzVxw8hxxg1KDtzTSGF28DjiuAhcD/
         hPP+YVvRarWMJeGqTy2BpC9muFqE6vXNP/XjQ0hUDl3l8T2a2gW1y7SV4eGl4WkNzkDx
         ZqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337999; x=1793942799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=EQKvqLEJP9sfeykA7LEX+kRDuPIktqYJiArM9A/LU4j89lj3XTwX8wNyLS/MKfTgTj
         jlOIS47v+Wd77uozDMJ2mLNEgCyd+bJfKQoJtHv9PopBf4WoSNBPvIutVgKJH+NaPhF3
         0cZE0JpUJU/4yg+74R4QYzRcARq6hMwTPGxNtoSwBhUry41Lr10fJDuVEvSEubqqbJum
         glx0cGLC7CFCvIpJ/0BDeY/E/v4RcsGG1qwwZJRjHFxAKahGBm7NjS0FuVc3dNIEkm2M
         MG0z3xJA6qKjpWOCGbkjF4Zw130wFgkMOqpYHZC9lY7J/5uvmLW2QxNLdFV7uLwHYUHC
         qNRw==
X-Forwarded-Encrypted: i=1; AKwUvBzppqR0mEiFrEoV9Rd7v+f0Y20+xDqgZBK7+DguYZ1ew0GYG6Fm+xAfbFrVkTnsZvtu6eeLa0x3UvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW+ycs43J0k6Yn4KPE6bdkV4wjCTYTU2d7ocpFOomoDwIN+sKK
	WmSFWeKUWpEOSZ1mY1uIH4sZ7ITiUtQoioIUMNcMBathWsLoXgBoJV7h
X-Gm-Gg: AYBFou0v1zAmcLCQ2XJWtVMASrPd6+I8v5Lr0XEWJbetJdQzrnQZIBc+iFdCtExgqXN
	XEy7yBGbh/OGQDbwpex6/UrFWgk1G61GGq/3fHFx6BMgvD/Iu7VoJA0ZSZbeeeZbSi+6tpBkohf
	1VasIUN+KHDdBXmimai8ZupuU9mgnFyvqCP4F0ZwK9WuNsAxxPPdskVgFJvRA0WUHjkGS2MZ5+0
	qPxcvYlV0556hAHdnSJAlLYdXvGyqKtpNAw3g8BE/+Oa/0Y0dOXUPnpaNZutjXklWPpoyyCebp6
	2wBRrlYCqO+9PYrOGKms+QznlKCofSHfyEpcrbR/WMu3TDf7JmLMRxZ2LdIfRjMFssxB9sqwGDg
	0fMGnkMjPRbTL46UbBg0ic/gQepocxRSrkc3weJaxKWcLlzPdoED38kdWBK6LeWNyohWJB6k8Ok
	mnXNTcrnkqYt5FWAKKUeKFX9QSASiriFf6Bok90y1XpnsPdXBODtOYu1Fc4SFYfNj7LzroAel1r
	/0DAznbdblHexDTX8unyl3u1Rl3dB1fpjqhs3NIDFt3Yyx3kSAo+ugfJ7iWbRPw3I3JdyKP0LK2
	HqKFqJaZ5R4FRLtLMKPQb6L3YTBaKIqtQ8U6W/z89RnXd+ldLORMVD3YP0HelDd7q8cna+e1Bh7
	22A/ofajmlLwNh9+gf+W+/kbYED6Io4vJbF/JB1DWUQNNYAk=
X-Received: by 2002:a17:90b:1a88:b0:3ae:3f20:7056 with SMTP id 98e67ed59e1d1-3ae89746c9cmr1077089a91.31.1793337999008;
        Thu, 29 Oct 2026 22:26:39 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:38 -0700 (PDT)
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
Subject: [PATCH v10 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Fri, 30 Oct 2026 14:26:16 +0900
Message-ID: <20261030052629.27742-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
