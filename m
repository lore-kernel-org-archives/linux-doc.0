Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263845;
	b=xfK75KVayQ9rKQQpFNlJiUuB4uFvtamwQfoBeGqqdfEIR8nnEcmy4kK6INKQjMI6+789
	 k6irV2/4j9qEZSURbkttJPmN4pGWCjtLEqpnJmsugCXS4RbIKTeZtg2NYPChagQTPfK++
	 nKsxM9CIwtwAF3zck0qHhMiSnlaOpzvpQExE8F4jYDHI59ksqdXUQCNztEhz6Ol/l9ie4
	 5D3MnkSNz6He0u6qveR1Kq5+hoby+6ockaw8TQBUWFlu7hSpI5OW9OsqxThV+2sWNuu2I
	 oCnaiP16U7aN37rYx9ckdEGoK4vyV2dRt7M1I5LyWqQkrTW+iPrBd6mckz3wQTv77bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
	b=nCpDjJDeLNbEfNk2T99eUWqCTA6rSwDOISRs56Mwk6UEJjSsT2smXFsoSWv4JOVq2qxS
	 5z5llLikJwDvdzRXlWVjaZrWINcG577mrfYeVbRsH0nN4X46k6eL63H+4uI9kX18haDYA
	 sCf7oSgH0bq6DDWuZCKzpnxRszAwj4t+9PhCnrXCcrUA/s6/yX9cKUfd6/udf5RkMpWad
	 /ddkLKwVvVf2YAbo8i3jrffbJwM7W/HeN+o8p85EFyom3MZM9uf+o9XxXltduxjK3bpPy
	 LStwEXrIpSun0GIfj37idk9K1XbzyxOflI3CMuRwU2mric+7CeE2UYCOrB6hPhUs9Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E48606A323
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99E48606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDf97nYJ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso8776015ad.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263844; x=1793868644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=fDf97nYJsM+l8W2HoLcXALuU3OhZZ18vxeZy1z42+xZqnOIYL0fyGQBj5NDqFGXbiB
         6QWFcojFGjLFzIkN7OdmvGh9/DDP9p9o2QOQGl+dghNsSQktLyaLLH0qlay2joz6hJel
         2VfyTRFE/HZnMdl7U+1HImD1aSRx1cGC3HfnuEHQapnoobNKE4g8H1pqiC5BJGoXV/pl
         cf5pxSXolNtJHH/ssCZM6Xc48LDb7kTrguYzejX0HTNopLl0Wgc0UHVy8sejosA2BFYQ
         JfkebsdgB++1judA+8jqXpiyeYl2XNLoKuBvgLXt4x0Gnz5qA70u1+a81aW/g9+qtMsu
         kTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263844; x=1793868644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tOERZEIQ6bWpFjXc/IYsfYbCQo0wq413M2Hd4FsT6W0=;
        b=rsmNjiqtSeUKomSGigzlz0MUe1tUrsOH69JDKiyQtlWVIGge5jqDdDQ8FALvuOXtUj
         cCjoUCp6wdbPpE30Zj58UDMHx0OvA5yQQeF18Ze8OeNcYcYF+fLQjhcZcLJ0TisQq7BV
         sON0xwB/vjnTDRwOR5R6LQK7VO4dFIB/1UehYL6ZNM/+FYr+Fr0smNU2GKrTwP87f3aM
         qFFcQUlv993W5fXRj+tOwZgBJFuyLU/117Q5clxinC+Dt+wTuQGpGme+Zhdd8CqWn068
         iBqv2olF6ZXMve0y6pVSQqbNM4tNx+HhBdHed6x8+ythJpeui6N0UfiyC8JPbRKM1Gl/
         3ddQ==
X-Forwarded-Encrypted: i=1; AKwUvByi9JsFF8HXmYU1Yl1FbkWXrZSH/p7NgVbBTmlVQ7BVGnV4hhzxFOe77NI1KSORxUFGvX/ozD1Tgfo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUJ+01D/eal8QD1dT4HwaaCTHIIRzAe9dIxxhUbwwJfl0CsZ9r
	+C7JP2yqIbqFGqNukDehXL/mInqHVnB2GHz3fYs0DcZkHK817+8r5dLOWq1MaQ==
X-Gm-Gg: AYBFou2ALadGV7aaObM57I9A7s+G7KOWwR0EUAmJFbNBYFR/Zw77NUXoHeK20g1Uc0S
	JClf3MVMbg4ArpTr5Jg2BbWt0qcC/EykaIJ8C5QZkuzMP8ZPn5IZ8W+PK/IpxFolLSSGnzjOHUN
	w8opxcYnt1xNAUB7bQaLzbcuKMDU/MVdS5Zqw/7Q2FUDrnZPhbeV/l6kQz00vKXStbvcNL9YWOp
	OKO9h7BOcCyMv8YEgDQOcRO7/+ALVY4nSmRsQk2pqLd+Lypdti7TXjrJY9/FYi9CgYnc8vha/86
	bwsYu8udVgSZYkPzNloZZBLtPgwGJEpgwt0gawa5RWYXgIYeQnYADsFAyphwKjyqDokB3sDhXTj
	AXGzySgdKH9jls+sZ82VcZKpKUdmi2F2TRI3VOYcmcX6tN7ixVmW+ZqRLbZDQQp3uglmBq7gk8a
	YnNh0lk48nlcrTkDFdAqj+9630bCVSLRAbyBJFBXDAabnGYeu5HrHtr17GufFEUjV0bBWtD4kkP
	suIzNpzCn19G3QNtlIeo8dncvbbK5JVy490zCCT1fSFcv+u4jD0wdoWbH+obDvecjyhgXubKGwB
	4XU489sqRTr33zVsNYfF4o3ggRPRqJo+JTomb5GirmEHKJMsgd3BLgf0f8f5kdrRXV61r2jHTRf
	8jMe5o9TH7O90ajBzUlF/l09RkNAVHOsSDBC7R9CKmwPkibuFCWpkPv15kYefla4=
X-Received: by 2002:a17:902:cf4c:b0:2e5:467a:7a6b with SMTP id d9443c01a7336-2eb004f2a79mr44003435ad.10.1793263843827;
        Thu, 29 Oct 2026 01:50:43 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.50.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:50:42 -0700 (PDT)
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
Subject: [PATCH v9 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Thu, 29 Oct 2026 17:50:19 +0900
Message-ID: <20261029085032.70689-2-mynameisjune111@gmail.com>
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
