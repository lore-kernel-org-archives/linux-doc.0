Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156006;
	b=mwnL10U9o8ikZVpsojppVyJ7H0uP+s1WqhHqck3xkuirjy+bI20hrNVsLFgUhuMSdrWZ
	 CfgjhqRLq8AiolggPtkOWthuowpm4iceGj/Ipwgalk8CMZHLsaQ+9SJgTu3ZSTktd3Rdo
	 ozaKbdQcO9nazUSkbrPtOchAeFYxH4aOpi8F7p+oqW80Oj8b437qkQklbwYI4z/jCaV3e
	 4zxeqi/zKMT/i4N7+1avZs/gMVUN7R09MdeQZzWqMIqnHN0pLnkYxN1FD7wo12urQdR1p
	 GaJ+UTJaejQ36w6kYHY0wvgGyGEwFvHdi1Dn0nvkoxlakdzHHEKI7/UrOw5lGNrE7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
	b=IGvzCkcW9qTd4hzUzpTcutsETJ/nuXdL0FOyD+ypywF2OU2597kESEjrQ1gNp49ZZF0T
	 7DtScj4tOOpzKk825bCFwwkhjOpJwp6Sj9EOHKg31RhFI3LMhzd2owAe6L1XeIvY+FwAu
	 /CA6i4bNjD+l9uU9c3UpFaOYCmJAXEYI+/yffNFQT3jtQ9S9aDqUKt1wc6vOgeHqWdALy
	 me/Y8MdJp0JfHEAYS6j+50lJ7CV4gP5WxPeB1ZyTQWtipPOoj6u7nN0qi/8ggr5NDB7wN
	 jVmWFAnWY1VjY/QWk7/TsnjMNvuNcwYaAKRQ69WySwpHKdmRU7quAlOUMw5R5pu8Aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLLKKJao;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A69606A31E
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34A69606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tLLKKJao
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso563463eec.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 19:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156005; x=1793760805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=tLLKKJaoM1Xfz5WVxuXzs6CBCQfofwtRldHjj16mdjPTPR+8NmTe5jDGZFaHNu1eev
         ZUMYuZGg0A60bXur19hsgIYIydbFZf2mL4AKZMpu4BkGDzuq6nKcOS0yE2H2osAeodUX
         atNndyZRkwRtCNVeeKqeJpeQvuhJi2QyoEjxG+WDa3ZMVixMFQC9to7T4HagKE/B6w50
         MpGEq75fB3GyirPS6ikMqtmndMQaN2JcqRk0HJReCFBWhh4nqXD6z8XWmjD6iW6Kv6Ms
         8beq+HqT7uIiyVAJBMuVUE8QgqA44nt5YWwsK2BLx73Vu5RONxRiFRMJGbbVMxDgwyU9
         0DAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156005; x=1793760805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcN94qJJdoXXjjKHz4VCx6KeOGW9pO5t0VvopK/sL4c=;
        b=1f+eLrPaTk+pVAL70eBd2p1tZoXT6QGNqmYcPYDTHt1RPL0jtyvt6G/XvKjz0GLvEM
         AWUuiDOtYHGzOpohZnriwEwIWLjkNwV+vwD6kkiU8vA5WyvKBLTZvwz2MeDhU06nT2ht
         wOnjQSAtLaXdeWMKlMdhvA7coxr5aKR+7+ioT8YfmSSBxjjTFam58QGyIpw1Wo78zWvx
         1GCopVl24Rsb0MnlCZx4L5GiVqsM8gbvWBLZiTwEudgZ9ZSs5J2PfWzNxW4sPsVxEAYK
         4sEHXqMxhGoTzhuXmwbF9Z2wTmKhs7HVrVTcudwaWnVJz+dznPTiEPuirI1Qo2mcAv/b
         3L3w==
X-Forwarded-Encrypted: i=1; AKwUvBwpcQQHamquG7likoot8K8eJqXILKBU/d2IcdgAqF+qtH8xFSPTMZvUipSvt4XlE9h2OuE3+KTo7DQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKScn4m5b2rHeWhLOvV9nZ5e8jLAZfQblClTO5is7h2HJjyrbUf
	UTaZ1UR8q/1KAYkNpkeNML9xRQLTREv2aI2Hxh7iIPn2Ta7otOsQLQM3
X-Gm-Gg: AYBFou0SgXlEkkzdgk+tP1a3cYWYOR5IWM2jLFFfu2zFmKmItSELQ6qJ7hsrdT9ZPVv
	9owP5hvDpH5E9dD3tBP3HarHv3+n9rSgnDmC03zzwlxI4mupehBYdmf59PL1u0+5mDR3neiaKq6
	sgxWFFybrKfkjqlkFHSuv7CXo6wg8Q99MTKLbPmBAtFSXZlc15q2H+Dx0nREjT/iwNhWZjAmAAO
	OvAY26lbB362neDX+o5lMB0LuVH1JmPgiW2dmZrcVA2YXrrPxRBO93z0v7/egOSItine8cseHp5
	r2eY25TTBXlqwoRt023fxSCubE0r3MnEHJrH0Adey3JLO04GGmb+tQRKGsh54F/hwC/nC6pYVlI
	VeKtDkiTDJREZ71lvKKSmbR63uy3TbTUsHGVqInv7vsnJb4VXqMGNyPbsDIKJp0SikGeNXsVmTi
	HdDuThzuMtGXoW/hHOwle5iri0dftmsZDz8z3K2xF7ly2DOs4HQgbMH5eCuxx0gp7SSgHXftlzQ
	n59aO7qEswF2om6fZ5j2wjSiSiFcLGDPEpgjNTkWjjWY+roG3qxecocBAETzZbvib5iT3g1GS+m
	uVVCFqg2A7WK1F85YAF943w0btnrl/yKJIUiQbtOHY+6Kb1EAVM2t4OWzfElNXODRxilKH2NUG4
	g0oaVR0mf/LzgTV6RVOW6u79voANPA1W0+gEXgA7Kcf+fDLc=
X-Received: by 2002:a05:7301:7c12:b0:35c:ba31:6fef with SMTP id 5a478bee46e88-36a2016c61dmr2701937eec.36.1793156005254;
        Tue, 27 Oct 2026 19:53:25 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:24 -0700 (PDT)
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
Subject: [PATCH v6 01/14] ALSA: virtio: Propagate PCM send failures through ACK
Date: Wed, 28 Oct 2026 11:53:04 +0900
Message-ID: <20261028025317.92450-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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

