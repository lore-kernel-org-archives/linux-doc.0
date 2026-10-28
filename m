Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180504;
	b=GUa7jTpfDKc9i99i1f1ACN7pe6RC/M67ZEHFjn9aVq98gUpQGL1VQ6j2TWFgLgAqeBhM
	 PQVfRpiwxwkufMIRu/ahENbVBHBpWlO9SqGZcFXGeW5cqNfC9+zrUQSSD+IK0ODc07kir
	 vh6xTccLdcm5FUxTJFjfXsf/N8QcCSvoR0w+wbP2T7MG2EINBRoOJqnrBSGDcaU4fOgmF
	 0mGdcVzoZ4qsQJrcKEuqaxH0hIWdOVsMQXjKAmR+cJoBTAH+LfqbJaTWDVEh0CKIPHuMP
	 nEPicC90t7lBBY+e+wWmE03yVYrnheIsLk/UyJDMAWNtClHAxN6K1lJdfZac47/cdhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
	b=FUS8dsh/ykFzJfD0iRDCt/AkTBxT2LCDS89brSbR0XPunabZl6aN90Ly8itkoqC3jfmZ
	 9LhNU2NeYDbR/ZmI09h1FRSPHOFzNwm8BrPOkS69sULJO/XAWN6OPjFOHQZYURugFmDMI
	 f0oyZLYksJswckWRHft1w816237fK7+elwXBw1GUwvcsuSRsoDeyex9L3IKmb/HjDecHq
	 xSh1thFzvGfxIX1RxyIi+LAkFISknsPsA+92CwAGtQU4sFagGooFYpnQ1s+R/t/WdkNq/
	 sEmtUewmqmFTMPOF/62HhH+30lPGhNxvX4Jpk5dCT2Sw4zGqUiGwbNde87G3JyxBdQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AItRb3Bq;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FF8606A31A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AItRb3Bq
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e987b4a710so8720175ad.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180503; x=1793785303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=AItRb3BqeHFueEoxuBq6ehyUNNKsdKNXGjpCGcuEf2otvy4odI0sLTWf0MkSh+YMP9
         v8eqUAuSE+Of2rpqU1gumXx58EG5Uq+LMxp+a6tuz9E/8v5iHgYrKG9N400z31IN/Nex
         UUFxx/4j6Pvk5xqYyFTR4bK6CjZrDbSV+HvLTheqDJZIzji7xNZaizpI8C3e60pdF56n
         bkzeZMgMUECTWHr7dP85/P2+B+4e0yFGv/r1sjidSbszdE/ZnhtpJCsWSyokPhkoFeMd
         WVtJlH0tk6YCU2Dl99+eRCvBYWNqSGHvjnOFSEgtQPOHrtGl5q93V5SjaUfWM1KTEkpS
         MS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180503; x=1793785303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=CZxkJgqIrNoTigJPiZF6Z3PyvlhZ2nxWSyIvryEKQJ13NL9/3GXRmLxTIJ0y8R+DwU
         28pp9fgiHdypPhRvWC/1ymkTXUqcFr3A9lK6c8o/5Kb4IJKA6DUBZNdhW8Yp/o1wWwZ8
         eWs3AoWvEJM47fZ20SIJBiBa8oI3AaZKGjbK4DBBfzJMc6kZ1ehBPoRAdk7m4au0vtXx
         qaKDo3wPC2aYeyV7vR8pweE95/MxRNJPUlSkOE+BatesfTn7KGIloldvvLbo0J0uzEzA
         OMQbVMx0JUdB6Hilrc/9DYLAoHIpIXq9z6zF1xhymr8gwlpqY/jxQEii0NO3cuMm47cq
         ff8w==
X-Forwarded-Encrypted: i=1; AKwUvByMVW7g9+vJWwVUERufzCdIhi8z/GPBkrf4IJu/d7yeLvWMPeebh0v4eA67rBZegHQ+Qb7dBSsLeHM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJZaBu5VzeWFNnvvDRVFTimZYV8FL6xQkbYpZ23OEm9EoyEjuP
	SbsbQCRWrAkwJbwkpUTorIr1ODMp2MqeVXZ7aTUoNQBpBzrVo9AqeAuI
X-Gm-Gg: AYBFou1ycnz4ZbfXpeXpMOWE/zKQRUgaalNcrDczYvi8bfVU4R4aVywLhxBfg/d+Cw5
	BN6Kd74mGCDYBZcyZ258h2cb9mLDUn1ExlwHhdk96difmZxWqUEEXaLu6AmQ3LyjhjmRVEmojwE
	LzUvahx3RysVZcJ2MsHn1edjM/A6mTnbZ9X3+wmYZdFYEwAZUSJQ0eHcuVfv7HUwX5iR2l3XpDZ
	hkPdZjwSLNgqcIvhRg6bPCscKC2wbyt56zRqUvHtcSRNJOHsCYJ5TQUQqj6FlOKpO03hRSGFpRm
	6w8cuGD72G/4FXZuDzoiTsCW01nVPFwtR9G2lWAiDlwQlPg69HeosQLbhkL6L02RpyL84wih6bI
	HR7bsedG+cahDPjYvTdaltXnOS2oyj7rvsLyG6mDFhIEuQpclmC43ikqlV46mC0FoBe8165cWdy
	gU6aj07Yk0XfsjXIo/8vTcUukf4lNtjkxLTW3xIUj+DGilxBu1IWYhkocK4NX+1L8LiN55kvqNi
	XZxqaKzoXJP0kMG5/UyXWnV4LP9LwjnmC+sVsZ4Q2GNokXps0lnQkM140rpxx2A4yL6OB5bCU2+
	6aRX+OdNfGGAzD/1W6ZZN+eUBY2e2Dix3+JEC82zGIoAZZGGyzMgM3xThHXcok5RjL8knzuqdeh
	yta1ITVowGKx7QNSk5j4O7PEQM31smzHmaK8sNWA21pGZmDI=
X-Received: by 2002:a17:90b:3951:b0:3a2:bb9f:f87d with SMTP id 98e67ed59e1d1-3ae5c84f507mr566488a91.21.1793180503102;
        Wed, 28 Oct 2026 02:41:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.41.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:41:42 -0700 (PDT)
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
Subject: [PATCH v7 01/16] ALSA: virtio: Propagate PCM send failures through ACK
Date: Wed, 28 Oct 2026 18:41:17 +0900
Message-ID: <20261028094132.20364-2-mynameisjune111@gmail.com>
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
Changes in v3:
- No code or commit-message changes from v2.

 sound/virtio/virtio_pcm_msg.c | 12 +++++
 sound/virtio/virtio_pcm_ops.c | 82 +++++++++++++++++++++++++++++++----
 2 files changed, 85 insertions(+), 9 deletions(-)

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
-- 
2.54.0 (Apple Git-157)

