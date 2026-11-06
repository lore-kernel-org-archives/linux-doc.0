Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923621;
	b=qh1P6jBFzjD5vukS+6ztr8zOQTMuHWINKPAlv7pIlaP7Wgwj/8eX22tbH+2/6PsgaK2j
	 BUhZtH+amjphdDuhJcYF24pplRjpnqec5PS0CqtHMXoiUI+TtP9M80DEy8vxs7ZnoMif3
	 5yscBbklf7QcQuHjps2N5pywF8OjvUdQA/FZsA3tcItoqVogtCYy3pr5CENvG/5/1hU4H
	 FWdRqvsYEYvqhublybMfL3UQGepkI7kBpewuNoTU4Q82cUcvWffs5WdIMKW2y3TK6Fgx8
	 u33WYBsWNcXep/jTqSY+bqOtwmVYlSDRf8+uixu83H+e/+4DM27qBMkNq+L3w9D+qjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=in6vjP25X2p5WdVYmaRXA1suVm7o1qzBuMAIq0n3/fqWbRmj6ku+1tYvcB7ar3Vnl0N+
	 Fphn03eALxCBtUr/EcvQMrFE+ZrtV5ykSS39ySTn7Q6+QdDBHXqVxs1k/RGmLzD53CqJ3
	 hjJyJtkDH3MhhEBI4AyaDLtQN5j4lZc2MQ2YJUPULuBQYPIzxAXTQXS2TRNk1QTDzHoIz
	 M7OOOd1Io6DnPQDQGGmIqrVbWzxJ97400/JcjwYO35eOMBx/rDuGMnMR48gFrghKJaj62
	 GthsoZVZFkQ7YIH92P+AHqlYOjBk5RQCXc56PaG14pTv/cQ4zuMS4oj/q6g4d/RoOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MX9ig01J;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF83B606A333
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF83B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MX9ig01J
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so135917c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923619; x=1794528419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=MX9ig01JGj4Egpvh2kiimXO5BFtmevZwsp99FmLEu6BORpNX+VGySNQo3LSF6kftiI
         XcZtKZEMcxyD7brGI5pTtfJxUtIkJL3XkIfZbzvanGWnpTIQGMK74SOGCHRxlx01GE+6
         2+2bgFdjAmOmbBfCMckDob7bD0LOV1u7bDtAal5vUNPJ08eXkHah+BySMjj+7OJWIstE
         A48rkAixn3fliLvVEnpMu2A4KUO0fpN/UmWswDqmLW/+oyZDXQfblWOHza1RV0hORxiO
         8r2UkkIZ9VIfdw85nKV6aTbKf52/qI90X30+PxvQ9pb0eS2Zat5PrmuVGYAQlOr4s432
         GmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923619; x=1794528419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=YfeYmJ7jnFABUBDauYqP3Si6dtGALsUWXAt5QniYzbVrhTaPeU8A9aaaAf/tz7l6X0
         I0Fgyk3K3LsGLmJaniiO6wcJ/jEyZf6E70X65OGriV463RqVbeVHisnPEeQ1cfFl5Evu
         WdWwfCkQaFyUqZxtw2yhyCy3x4wKMUHa52thorHlH+rfp+2B3Q2qRlC5kQc2wWYUkeTR
         ZfZT2/CyvXj5Z0FfyiGEWR5UBL1pwdiFJsjBBKYSynH21ABNeLyBM9TqW/Vgp3jTUw1u
         nQ/HnQnPwsGkklqMmvYrbttJQTkjGmLbnWmNlgNHfXkkRhsFBfFxvk2zT0Ep922fvu7T
         wdrg==
X-Forwarded-Encrypted: i=1; AKwUvBy2RyK5Qc5V56QjSVfih4r/ndAlSId9R0dC9Hj9+tkpy4ICaOehl1xra7WAunIoT/e3M8FeVRTX3OY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Of29bSiyC1lYeIRSWnaA8NPTT8s4gK5PZzjuNB52wDNoBepzK
	KkCKeYCc56BhyxUeEtMBwJQbaYHaVDqwvOzPDXHs06AoCoUghCAWLWR8
X-Gm-Gg: AYBFou0OwtWBxfDmmITuKR1KQiVRdhkTVa65D7/hRrUoi9WD9dfD9gunjlowXl8Zxm+
	+aTBVtJu/jPt0rYgZObpgGEEzdfcgmAvy1swt4l+EaR5N0D6nTTaOzPmuO9LTyS3izq5HGcVAh4
	/ZjAMurms1ont25uQh4hiSnunaRKiv3Axwyut0NsQXjcMY/8Hi3DRU0On5ChFWDyfjAWBuqWY1W
	elGZlbdx0r7J1DOD28/pT4pkhjac4K9cIVRffVlz0jykbyO50YUa52XNOQy/IbkkNVabK2yjEsP
	6YprxyovCuqquogiqwCXKFsOCCuvvFXg4bLtta5cKdQbcrN9x//tFHJtEAb7go3dPGm+vDGuDk8
	zHruKz4hFPDNsZ3RGBIZmXaL9zCEjYdCAlUTIGSk90XPSCo48Z8IS+OwbtuOoofOpkHT6tQVWtm
	1Ofjtg9Bux/mcrM3NaYjpyVxOBSUipoeEYWtPj2sYTZTnizw8PCWnhcR/Yjf+d4bVPPOU842Bsk
	RNHM6Vzj3kZhf3fWvLjJ8KTr7EfiJ8OlLXygEYd06KMiDqLagLyDyy1msfZGqJHxL9e41uQw8DP
	Ls5es5584R85UQ5hOtBumhfUWCC6fdd1kvVMKLWIFpNU2ob6d/6D+tVW+vd2qK3YQ5ESyn3gz5v
	KjQAUNwme+AFO/AF702VxLIBo1xZr0F7feG+HkcacIP+n7pQ=
X-Received: by 2002:a05:7022:29b:b0:1b2:3b5b:b80b with SMTP id a92af1059eb24-1b25d31548amr729779c88.8.1793923619323;
        Thu, 05 Nov 2026 16:06:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:58 -0800 (PST)
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
Subject: [PATCH v18 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Fri,  6 Nov 2026 09:06:35 +0900
Message-ID: <20261106000644.20460-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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

A driver may need to synchronize private capture accounting with the
common RESET pointer observation and the core's position rebase.

Add an optional reset operation called under the member's stream lock.
Expose snd_pcm_lib_reset() so the callback can retain common pointer and
time handling. On zero return the core completes that member's rebase
before unlocking it. Drivers without the callback retain the ioctl path.
The operation is also used after a successful prepare.

Zero permits the position rebase; it does not promise XRUN recovery. A
negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR; a
subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h     |   21 +++++++++++++++++++++
 sound/core/pcm_lib.c    |   29 ++++++++++++++++++++++++-----
 sound/core/pcm_native.c |   45 ++++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 85 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,26 @@
 			     unsigned long offset);
 	int (*mmap)(struct snd_pcm_substream *substream, struct vm_area_struct *vma);
 	int (*ack)(struct snd_pcm_substream *substream);
+	/*
+	 * Optional RESET operation, also used after a successful prepare.
+	 * Called with this substream's PCM lock held; atomic streams must not
+	 * sleep. Do not reacquire the PCM lock through snd_pcm_lib_ioctl().
+	 * snd_pcm_lib_reset() provides the common pointer update under this
+	 * lock. The core completes the position and appl_ptr rebase before
+	 * unlocking a successful member.
+	 *
+	 * Return zero to let the core complete the position rebase. As with
+	 * the legacy RESET ioctl, zero does not guarantee recovery from XRUN;
+	 * callers must still handle the stream state and subsequent I/O errors.
+	 * On a negative return the core does not finish the rebase, so the
+	 * callback must leave coherent pointer state even after partial work.
+	 *
+	 * Linked RESET/prepare
+	 * stops at the first error without rollback. Earlier callback members
+	 * retain their completed reset; legacy members retain the existing
+	 * post_action policy. An error does not guarantee unchanged state.
+	 */
+	int (*reset)(struct snd_pcm_substream *substream);
 };
 
 /*
@@ -1179,6 +1199,7 @@
 {
 	substream->runtime->std_sync_id = true;
 }
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream);
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1760,20 +1760,39 @@
 }
 EXPORT_SYMBOL(snd_pcm_hw_params_bits);
 
-static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
-				   void *arg)
+/**
+ * snd_pcm_lib_reset - Reset the pointer while holding the PCM stream lock
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held. The caller must not hold driver locks
+ * acquired by the pointer or XRUN callbacks.
+ *
+ * Update a running stream through the ordinary pointer path. Other states
+ * start at zero. Pointer errors keep the existing RESET return semantics;
+ * a zero return does not imply recovery from XRUN.
+ * This helper does not update appl_ptr or acquire the stream lock.
+ *
+ * Return: zero.
+ */
+int snd_pcm_lib_reset(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	guard(pcm_stream_lock_irqsave)(substream);
-	if (snd_pcm_running(substream) &&
-	    snd_pcm_update_hw_ptr(substream) >= 0)
+	if (snd_pcm_running(substream) && snd_pcm_update_hw_ptr(substream) >= 0)
 		runtime->status->hw_ptr %= runtime->buffer_size;
 	else {
 		runtime->status->hw_ptr = 0;
 		runtime->hw_ptr_wrap = 0;
 	}
 	return 0;
+}
+EXPORT_SYMBOL(snd_pcm_lib_reset);
+
+static int snd_pcm_lib_ioctl_reset(struct snd_pcm_substream *substream,
+				   void *arg)
+{
+	guard(pcm_stream_lock_irqsave)(substream);
+	return snd_pcm_lib_reset(substream);
 }
 
 static int snd_pcm_lib_ioctl_channel_info(struct snd_pcm_substream *substream,
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -1984,11 +1984,35 @@
 	}
 }
 
-static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
-			    snd_pcm_state_t state)
+static int snd_pcm_reset_substream(struct snd_pcm_substream *substream,
+				   bool for_prepare)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
+	int err;
+
+	if (substream->ops->reset) {
+		/*
+		 * Complete this member before releasing its PCM lock. A later
+		 * linked member may fail; RESET has no group rollback operation.
+		 */
+		guard(pcm_stream_lock_irq)(substream);
+
+		err = substream->ops->reset(substream);
+		if (err < 0)
+			return err;
+		runtime->hw_ptr_base = 0;
+		runtime->hw_ptr_interrupt = runtime->status->hw_ptr -
+			runtime->status->hw_ptr % runtime->period_size;
+		runtime->silence_start = runtime->status->hw_ptr;
+		runtime->silence_filled = 0;
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
+		if (!for_prepare && substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2000,10 +2024,19 @@
 	return 0;
 }
 
+static int snd_pcm_do_reset(struct snd_pcm_substream *substream,
+			    snd_pcm_state_t state)
+{
+	return snd_pcm_reset_substream(substream, false);
+}
+
 static void snd_pcm_post_reset(struct snd_pcm_substream *substream,
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
@@ -2053,14 +2086,16 @@
 	if (err < 0)
 		return err;
 	pcm_qos_req_update(substream, period_to_usecs(substream->runtime));
-	return snd_pcm_do_reset(substream, state);
+	return snd_pcm_reset_substream(substream, true);
 }
 
 static void snd_pcm_post_prepare(struct snd_pcm_substream *substream,
 				 snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	runtime->control->appl_ptr = runtime->status->hw_ptr;
+	/* The reset callback path already completed this rebase under the lock. */
+	if (!substream->ops->reset)
+		runtime->control->appl_ptr = runtime->status->hw_ptr;
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_PREPARED);
 }
 
