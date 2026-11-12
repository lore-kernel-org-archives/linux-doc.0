Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464701;
	b=vWlOYsBBWtJefb9cq3Q++i19GQMMTlpAIrvfc6FlS95TxHhsIn3XN42pao/kwtVDVdFe
	 lIli2gQcMm3zYLjcY5eBFBfvj/CtxOE49/+0nD/ueKT5w4yxp5PXLfJYiq/edG2x+E7J9
	 hz1+izJ3tS5Q3lbtybOXpgwYOdtjakjyFZexAzxW3uPhOOYIYbUVIE6PCysSnB0bOrVQB
	 uoTiZuxP0UQNOoDIMzOPGk1bM85pNhAoSjnRCqXC7a1fWYKRNlgXWdQADs1Kx16fd4515
	 rH7/XgyR75N356Go8gs0UiSD68B8Y6CUiYgebNXMwyVTYtuTTdM1h9s0HOF8C7budWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=VJrdZ1XGeLhd8wiMxf+MKPehE4PaxP2czsnpY/PsWvri0bNKOGjRAVD0oIVM9PFfPubP
	 F2DACbSRx8f0dLMRolH6JAwT8Rxpj7rJxeZ2txUrJg2d4l1UbbjUTaz9oT/hj6bqGEOJY
	 pH0Ks5+upW89z4Q3nXmMkrxzHZfORaPXGl/I4QUORqZd7QXjnk6EBYwO2wZeJbp0zZW5i
	 AiFJr1axUe0gWSn+LmXkyX/Kv9UU0Icdm1sCF498IU3lLttNUyRe66cg30bp6eqlC2DB1
	 qvuDQ1p+dAbdhxG096yCHyyoTSMaDp7McDWK+nbcFSy69pavMCI4Wq/z4W/lNodkCCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C88606A88D
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67C88606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wAnRLJiM
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e946155442so31899895ad.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464700; x=1795069500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=wAnRLJiMuzISvsspdYm6JW4tFfMNYWIHHCHGj22cXlZ+E0VxYAhyZ6To4OETqtuW2q
         vqt9T2SWrnuyXJCUmBS0ocllLBk6fegbW5sl3EPpr/CbAgzC0JP7ssqaoP/YuB1PF5Bd
         InE8Y5rbg1gUeBCHkdvxQ1v4d3dz4tITw4YMLHdjy4VkyiWkJ6xwfMxhjZsUmtmaqppq
         ETEXJPPcZ0/ClcVAZaCX9T76MRAkSvdtHkn0T53u9tT6kqv58KJvND6DH6fYx4aFl3Yr
         rVvEAyJcUTiG/HmRrg9OT7DJPRTNpbJIuEegWK1ooJ2TJwgDjKwjEA0twrcI1z9kcg1s
         UyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464700; x=1795069500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=r+j9EaucA57dm9ULUVZRc/EJ73hGJJ4MBtSQwTqf2VkM8r63ezOefrCZtiBXHqX/97
         zVqbvAMl798GwL3FEDlu5pNNlUKGzmPyw3LerKswr50vI29PJ9nEA38kYPlFn5vRafKv
         0YSuF1QdWwkFlV0GvO53VPa7OQk9deTaMfMRGk3E2fhXqGwCy9643mJmFr8JBDY0SSLS
         qUiDphQwf/psW0QbrjW7c7uTkiJg/B4bJRgu6YcZ81ewR6J8IdKT54JjIc0bcz3bK9uM
         VfRY4kLCeejw+/89jzKA4kYJDCxe6GC14XLq4OEEIs5EGn6l3awgfrP3AN1MkJ4ue/+w
         KZGw==
X-Forwarded-Encrypted: i=1; AL+hErGrITcfp3n288PIpH/lJwVLYrIqPareIr4VW1ahN3y596m4i79sKLQCW0Udhsb042PLHqX9ofrZkmM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sdagbtPQK/hg/9m3nAWq2Ft60LrRMwo1P4cIrRjFd+O3foBhF
	DtDtKmWrlZchNz46btvnyA7vXLjvAeaiZyarx3E5RQajyLUdac+1snBi
X-Gm-Gg: AYBFou3/s/mtM6Ddp8h/QKwUiGnUthE79Z9VpppGFr0FHfACTwlFf8sx+8FuZMJYHA6
	265/eQQtz9wNTa0l/CSxI1sKMkjjiAiTY42aypLaYZr/g0fqOT9awYU+VFzTRO5BxVEyrsd0Qtl
	tOjt/681oB0/uErMVrjNcA2ct5bNoq/nCW+21LIF8tJVXQO3zt3TreSzOjeGE0hgWl8wJHHlb3U
	oLR7oMcfk67iVRXRgIzEsqW2LAcPn6b0pd3o/5W0ao3qcCYJRmrfhyEYutsHD8fh6x7aGAQZ9t1
	6X9pRmiU0WuA+Y4S3TfdOOZ+G9TfcUG+EsNAVrVpA7y10irzk4g1TW+jM+squFku3RK4vb2+9l/
	6BuZo1gub2WQLP1GzMZXcOPl+awt1tBM52kBdZw4iMOEBH4zbwoBM5jO4Mtq4qm0iRcFVLbegIW
	aU1jy5GyM+NlwzAbGGMjJ2wmQpHk6kfmBfkhnPBDHjU9CbZ3yCfsaaDgmKgAc1jiLpYRfZeaD22
	PUwlD9d8/wTQvnUVRYlRMhOphawphWDVgqkKG0z6ocGMBVuV+SnnZvRXu0KGqC3pPN6MLQ+vDoP
	dUSZslJ8odKD6grlnu7NllL9y2jDHDHtH60wcszEmbmNESkJYTQ2SzP/fBlv4ZsFMcCUOI2Q384
	9PG7DxnQlZjhDAZ7Q2l7Ubu9B7X06kaTwNBcCiGSFsvjpyvpO
X-Received: by 2002:a17:902:f54e:b0:2ea:1b9b:b946 with SMTP id d9443c01a7336-2edd76d66f3mr54934855ad.14.1794464699653;
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:59 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
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
Subject: [PATCH v30 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:24:31 +0900
Message-ID: <20261112062446.159-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
