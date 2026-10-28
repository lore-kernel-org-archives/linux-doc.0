Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180530;
	b=Kbg0MUcMicuDNoPBEVbQfG5M0jdiOjBwtYN8H32YR2IJxVhEmfm4Lxi6e5GO/oFSf9bi
	 aTiFbHosV0EWZbtYJy0mkIXr8EuU4yjKG/QzMBhO2ivqNT5RnU1/WzOq7E0AdkNrSbKBV
	 TGK7Yry0Y1sQN1Y1xg2OWoiPfk7UY8CIwbgWkFzw0SFrTckL6TBU+4xCUepL2SrLDgNDx
	 KQaPs1kdcBYv81y6Bg2XhENJ93qtDdJr07n8rfpEsTLY2i9DO/oaOaw93d1bYtjay0x2N
	 zx6fjXlSc36raGhSccU+lmqllxk2pXAfONtTdSnIJekm9XQ4/GL7zEBcf+njiUodyYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180530;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
	b=2aSdo4ynJVJT1emcpllRbN4kPt9Wf+wt+yZt4aU4qbiNUuH8R2PnJTrx16YUom+/KDUK
	 ysAFXUvCN3UZMUpt9qQW7oWpDMe7vd6IUS70uCxGEj0RNhOMj1z0zRyCHf0ZepTPlQJxz
	 klK4Qqfn4s4+Opo5nmEclgUMgPTN8eurfXL6qIqIW41KxYASEqJd2qhsM0KERkUhEZJ/3
	 V6LfuwNtNk4Vm30PVYgkAQUObepAlnxlS84tW016V+/up/cDPwvZrlZlloP1qTOj7CtU+
	 vzocidf1TbjfrISBRE4hAOeT3wzrvB9uyeZ5o0EsRjAtLpOZqwSHJgl0MOGymeFSxKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F4260A262C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5F4260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kkmygWZ3
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so456235a91.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180529; x=1793785329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=kkmygWZ3Bd1ORBZYN123uCbvxb2lbmlJfyOq5n1XCDNyvAVl8PfrvtOK9IsldIsm33
         keEpELDr9sHVvf2T9x/SZvEFLyouN8knmMIIRgRui1FGu30lH2+hjXxR6SaEXauRF0CJ
         78m5Qbkwow9edI6vZieGSLDbQ4yhvP0+kQ1+voQX8Hoa0oq2HelH7pCKcS7TJilthrH1
         0lRQxJNb+bQXMPB0GabTVdSIBB8sr68w/JiziR57BDQgkQKwSTYJK9IBA9m7REmNzH/0
         4EOQnPC9hKzOCG+d/g/vh9ky7qbzzEcVnZ8lTP3ZldQ9TYoZU7rpmVCPg4Mk3N7qJGTm
         r2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180529; x=1793785329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6eYi7haKrUUz5ppcKTnEsRmfpDKe/7u+K3cLCBGytI4=;
        b=B9naw6tor66UzbmzCzPBtRXPt9pFipO/FLEmsTqmpbjFZpF1WeCq0Zy7hZDumEDkYw
         xUU2R+ui6DpQk9glxF6VT2lpIm3FuYobD+hdfv+rAcM1joNqYRP0vq2jfAYdLBZ419+T
         dB6u6Y48iM7+/RveeagCvG5avGCTsTkXIkmHDzfKEPYSMW9Dz3j9e41+RGzt/evndMTl
         8g7fupI/fPo3jBwzjCieDb090ZGadO30hOwEHealE5GFVFGXeLtBU10R5DvIl3rYbEkQ
         B5YIpdpnga58JYf++H/vfbEUE7JZPYB9MLq1NeihAxyWE8Ir+1WmF9j3ACrtLK202egw
         tmuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzza51a7KI4pV119kbEgyN3ks3dodwdwc/9z7BNm2aW7yRCo8ul6d/lwVpEygZrYDsLd00+1EEd8Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwOu8UmflcG0CAqzpbHsmW0NzqJkyFpCRfZbo+XU5NuRYiwVTj
	/uBaDPl9k1ho3ah8rYt1eSh6gQWgGQg5hcclC6QzKyW3g5V2mZDBbBPT
X-Gm-Gg: AYBFou2dATs+OgmzzXux2DSrlTVHR8GyI4Inhl9/ifp5Bg8VQjsBF6DlgYLUCKrBgBn
	zON4Qp2zGUVRLx10XQLGh98klOPR01Ik+fxILf2zV2W9JXHVW0h/cvpAztl6O/Rf33p2c32G3XF
	zoJWHYJuDymImHK4RmPptbZHG3aW0eCvJE/YZnjZBj3ZSqoUNDfWTMVUQEdxNxSLCjGg8/aIfSj
	0XCcpGH8eMR9hBfgA1X9Zo3y4xCuMb3vDSVKb+fTqfZUay0QJka7ZSw5rROzH5rqVImvC3aNKxy
	Di3rb3M11UtvloJ2oImk6cPXL5zNS4FvW5YeBPp+5cQJuMEOUvu0xED8txAFJYpvrDpVhxCyGVO
	rYofNN5CRcjd8w+Gpo03J1463xk7jYSvg4BhM0ZYj4KeZMjhLh+X//68ZmDuFA1odcZ4SghLTOL
	jVfbnElSP24xCrNp0cG7tOU1VLObFQ3iwm4NDAMx2FNAYOv36Wsma4E/hI/OadkprZMVPt6+E0C
	vbOuCu3DoitIFRbSiHcWmgkwr3c2gHC6ti9OO+Mq96e1a+yWvDeSGq/I5wFObVg70BbWGkAulXS
	VXLWZN1fW/Q/2EZuMPPd6nUoYKietw2C9Hs/NqqteyfOCJbXaah/SSI+rD8xXsttKYsdVl5fCOF
	oet8uxpf7hcXFP6FCstwKh6C5fAiOUDM+uo7LlMNybF37NXPE
X-Received: by 2002:a17:90b:4ec8:b0:3ab:de4:7fa5 with SMTP id 98e67ed59e1d1-3ae582c0671mr1363142a91.56.1793180529080;
        Wed, 28 Oct 2026 02:42:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:08 -0700 (PDT)
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
Subject: [PATCH v7 08/16] ALSA: virtio: account staged capture reads before RX refill
Date: Wed, 28 Oct 2026 18:41:24 +0900
Message-ID: <20261028094132.20364-9-mynameisjune111@gmail.com>
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

The RX callback holds the queue lock across a batch of completions. A
reader that has copied samples can wait for that lock in ACK before its
consumed bytes are removed from capture_ready. A later completion in the
same batch can then reject data using stale ring occupancy.

Account the staged read under the substream lock before acquiring the RX
queue lock. Release that lock before taking the queue and substream locks
in their established order to refill requests.

Once accounting is committed, latch refill errors as XRUN and return
success from ACK. A negative return would make ALSA restore appl_ptr while
the driver retained the consumed-byte accounting. Keep pre-commit errors,
ring-capacity checks, and normal period-work scheduling unchanged.

Source-extracted host and kernel fixtures reproduce the stale-capacity
race and post-commit ALSA pointer rollback. The candidate preserves wrapped
data and pointer accounting. KASAN/lockdep QEMU lifecycle checks passed.
The fixtures substitute selected backend helpers and do not independently
establish physical-device acceptance.

This follows pending staged capture support, whose introducing patch has
no upstream commit ID for a Fixes tag yet.

Link: https://lore.kernel.org/all/rfc-v2-vz-capture-compat-1.b9ab4c1540dc4691@gmail.com/
Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>
---
 sound/virtio/virtio_pcm_ops.c | 128 ++++++++++++++++++++--------------
 1 file changed, 77 insertions(+), 51 deletions(-)

diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
index 003832d112551..85e7576903d56 100644
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -1229,70 +1229,96 @@ static int virtsnd_pcm_pb_ack(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+static int virtsnd_pcm_capture_staged_ack(struct virtio_pcm_substream *vss,
+					  struct snd_pcm_runtime *runtime)
 {
-	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
 	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct virtsnd_pcm_transfer transfer = {};
-	int rc;
+	int rc = 0;
+
+	/*
+	 * The RX callback holds the queue lock while draining completions.
+	 * Account ALSA's read under the substream lock alone so completions later
+	 * in that drain observe the newly released ring space.
+	 */
+	scoped_guard(spinlock_irqsave, &vss->lock) {
+		snd_pcm_uframes_t appl_ptr;
+		snd_pcm_sframes_t diff;
+		size_t bytes;
+		u64 next_acked_total;
+
+		if (!vss->runtime_active || !runtime || !runtime->control ||
+		    !runtime->dma_area)
+			return -EBADFD;
+		if (vss->xfer_xrun)
+			return -EPIPE;
+		if (!virtsnd_pcm_capture_counters_valid(vss)) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
 
+		appl_ptr = runtime->control->appl_ptr;
+		diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
+			diff += runtime->boundary;
+		if (diff < 0 ||
+		    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		/* ACK includes any subperiod tail already copied to the ring. */
+		bytes = frames_to_bytes(runtime, diff);
+		if (bytes > vss->capture_ready ||
+		    check_add_overflow(vss->capture_acked_total, (u64)bytes,
+				       &next_acked_total) ||
+		    next_acked_total > vss->capture_copied_total) {
+			vss->xfer_xrun = true;
+			schedule_work(&vss->elapsed_period);
+			return -EPIPE;
+		}
+
+		vss->capture_acked_total = next_acked_total;
+		vss->capture_ready -= bytes;
+		vss->pcm_indirect.appl_ptr = appl_ptr;
+	}
+
+	/* Preserve the queue -> substream lock order while refilling requests. */
 	scoped_guard(spinlock_irqsave, &queue->lock) {
 		guard(spinlock)(&vss->lock);
-		if (vss->capture_staging) {
-			snd_pcm_uframes_t appl_ptr;
-			snd_pcm_sframes_t diff;
-			size_t bytes;
-			u64 next_acked_total;
-
-			if (!vss->runtime_active || !runtime || !runtime->control ||
-			    !runtime->dma_area)
-				return -EBADFD;
-			if (vss->xfer_xrun)
-				return -EPIPE;
-			if (!virtsnd_pcm_capture_counters_valid(vss)) {
+		if (vss->runtime_active && vss->xfer_enabled &&
+		    !vss->xfer_xrun) {
+			rc = virtsnd_pcm_capture_send(vss);
+			if (rc) {
 				vss->xfer_xrun = true;
 				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
 			}
-			appl_ptr = runtime->control->appl_ptr;
-			diff = appl_ptr - vss->pcm_indirect.appl_ptr;
+		}
+	}
 
-			if (diff < -(snd_pcm_sframes_t)(runtime->boundary / 2))
-				diff += runtime->boundary;
-			if (diff < 0 ||
-			    (snd_pcm_uframes_t)diff > runtime->buffer_size) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	if (rc)
+		dev_warn_ratelimited(&vss->snd->vdev->dev,
+				     "SID %u: failed to refill capture queue after ACK: %d\n",
+				     vss->sid, rc);
 
-			/* ACK includes any subperiod tail already copied to the ring. */
-			bytes = frames_to_bytes(runtime, diff);
-			if (bytes > vss->capture_ready ||
-			    check_add_overflow(vss->capture_acked_total, (u64)bytes,
-					       &next_acked_total) ||
-			    next_acked_total > vss->capture_copied_total) {
-				vss->xfer_xrun = true;
-				schedule_work(&vss->elapsed_period);
-				return -EPIPE;
-			}
+	/* The ACK is committed; a refill failure is reported by the next XRUN. */
+	return 0;
+}
 
-			vss->capture_acked_total = next_acked_total;
-			vss->capture_ready -= bytes;
-			vss->pcm_indirect.appl_ptr = appl_ptr;
-			if (vss->xfer_enabled) {
-				rc = virtsnd_pcm_capture_send(vss);
-				if (rc) {
-					vss->xfer_xrun = true;
-					schedule_work(&vss->elapsed_period);
-				}
-				return rc;
-			}
+static int virtsnd_pcm_cp_ack(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtsnd_pcm_transfer transfer = {};
+	int rc;
 
-			return 0;
-		}
+	if (vss->capture_staging)
+		return virtsnd_pcm_capture_staged_ack(vss, runtime);
 
+	scoped_guard(spinlock_irqsave, &queue->lock) {
+		guard(spinlock)(&vss->lock);
 		transfer.indirect = vss->pcm_indirect;
 		if (vss->stopped) {
 			rc = -EPIPE;
