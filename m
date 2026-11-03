Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664280;
	b=QDciAvyHYOCAoXuMuHjICxRJwF7UR3YvDy8YfqbDX/R4HpdTLS0D1/fvPiRO0F+QcBe+
	 RQbxnxdOoD46GgsinJDOxIckr3eLGLVVkRTi6AX7tgaK9U+9bMdsnPZfHCc9K8aK79OLZ
	 FS2G5cOufy7e5XPZwMwNsMVLiv/qFz2pYSfo/KOszVUsijahp97wjnKGD45Me5xvlSu2O
	 hMIbxcp7upTYy852iL4EvpWCVHburMGBunkEtQlbAWDaKP3/PgqLkNjrgkbV+nRAPitMY
	 s+hxOTebsGr3CVC7vD2mhjSIAVZQQUs2OEIjJ9exOZc/ev+Nxgk9d6G30ZmLHdozvnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
	b=NloJH1mWq6f4igf8od2YFrIkOh7pxbPpBvcycFiKeM9YEVkAAhLRg6ztMQhpIkmlepmp
	 0TUyh8m/ugYqdGlAcDO7nUiBBaCaJqBOQKBR24N3wUrDkxn8fBMKvL9MZctkpuRY/Kzn+
	 HFVqFgK8GkUWf8krB9GmNoAHvpOSBNom74fm7pDUDGfFwnAGKjEXRDrA+/T7rZMC2jIKK
	 nImQs1ysRAZEu5nNlx9QREqDXJaSSD7jSwpSTB7wt4VTdvj46IViyDoQYF+jRTM2Z2rc0
	 7eEA7fsdBsaWGYjtassrw7AefESERQKRE9JD+h8n07TWP84+CT2O931GDIKeV2vPzJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlNXwnYe;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE194606EEAE
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE194606EEAE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlNXwnYe
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so2581183a91.1
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664279; x=1794269079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=LlNXwnYecxwPmEInl9yrw60YPHwwc84rUX2iKxT3QB7AIRiY2yTOgozpOCqoR8x72h
         2Tsoa3wUQOV5PX8v63I1pyT1xhUa9vV9UJLUEh50+uLJFzbnkvB+Q4nc3xvaIdkQZvxW
         /9JqbTriSpRPkxr4h3n+flOpEaC4F+BbazcAw/0n3Lmt8xGIorOuFJc0EMmRz5zmcd4X
         P7l14OO2yrQs/rX7hJunoEOiKAObqSyFiZJSTeq2APssNCXohcNV9a10V69O3QcEu8TO
         UG/xtX23IZTYOZAjoeq0yu+lVXsW+ClQVBVWsfxF7GZYCopHRLNIN+KUvRU7s6kyQD2Q
         +zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664279; x=1794269079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=WE8pb6Xz4+fLFSRZ12LdNczjS1CXw3EVPqDPMVcZTzyvturOSg4Su2p5GWLJi2d3j6
         KkPoW8Ldhoqp1gJt4CX7oDgcYlCjSbeLIjqZHvtEcGdJZy37NP2skE6vbFaGr+9IF6CE
         wydzCQ4bIeDYn8+Tbc7RMAxfgxoSnxYhunlvHScZPsfkNZmbGWhkUtQp8OeHUVRXhwi+
         WmF5MvVrHGRpe8rxQsUt4010tglRThV+KsgLeWOLuiHSDQoCbQ/HruumZc/Gs0XbEjK5
         uMO1+owBd5jX0pGybAsAhQ0EIYrV1qiW7475n4cFtMW7tEw7NFbvcKniPLWIE5dvMb2b
         70yQ==
X-Forwarded-Encrypted: i=1; AKwUvBww1xfRs+b+JB13njLz+bTJthQmAhbxwePwGSgOdmXtGU1zOzpswnXA5ROK9VmBu4MkD83zp4zXOjs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iDzOiZSz+XYe40ieshwMmhHIrI20hgT2rn+Bpb2J6j5Dw/0fS
	BdeAHE2sFPIOAHkOwV92Zk8ykFWdqtuF6OZ3r0Lg7FQDCE18nd9nYRCi
X-Gm-Gg: AYBFou01AQzX2xRFfqXl2mac+Dhr9WQ1E7GNjqoRk4TpHiMDkVyzt1ffeowTzU2xOqi
	HYkk7FO7MaaHw8n/fBBSj24s6coiYf7kQ0EyP+iO54gfdU0DUhXDZhbNni0qv7bPJC/S1JoCBN0
	0ibh8wMGb3MacwQ9fR+D2M3scxZDDIFqaKJnJy2zW8gW9Ij+aOrP+J7Yv8DpkfASdueOSaOPYrn
	SWzml4K3iddcVVf/NKtquZmzKPsmXSWnprubPEkMuJRfTaCtAK3rZSfjjdBoCDaaxBjdp3Y707B
	uFqvkRwsyV/FakKddvUblFAIx026I58CjiAjqw9DFS1TIQApK61wMUdE8kZBVUJBi/V5W4c4WBU
	4m7/Ri7mxEBLABaAgFeQCm0sZVPzdlrPiJrXeFiguGjoXuAmvgQDGuntXGMbvwvHYrbe+cz2GpR
	kym6p3d3FE9hbIDnvwefJU5BUaHs9quNPCaRAaqQPDezOptdluZAgwJ3TLo+wCC2W8HRzQMr3M3
	1KoQVv89M/TjQiTT2W9r1F8YoPtTPkgDCi0/c/SxdyqCJpgY8eEdNf+7TKFjDr57CA68V5Nwymk
	Ea60Lk36F60s6OEL1G09ES9rWxkaoUfCG+mfLlR6519NWj3y3Cp9KAfCvlTWMbmqzX8mzPl16OP
	FJn6n//Q1GWdJdOHExwO460rJ2tcMW5HcKGVHtPcaiShEbfI=
X-Received: by 2002:a17:90b:3c90:b0:3a8:bbc2:5551 with SMTP id 98e67ed59e1d1-3ae8918adcbmr9133017a91.0.1793664279142;
        Mon, 02 Nov 2026 16:04:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:38 -0800 (PST)
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
Subject: [PATCH v12 09/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Tue,  3 Nov 2026 09:04:00 +0900
Message-ID: <20261103000403.67106-10-mynameisjune111@gmail.com>
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

A driver may need to synchronize private capture accounting with the
common RESET pointer observation and the core's position rebase.

Add an optional reset operation called under the member's stream lock.
Expose snd_pcm_lib_reset() so the callback can retain common pointer and
time handling. On zero return the core completes that member's rebase
before unlocking it. Drivers without the callback retain the ioctl path.
The operation is also used after a successful prepare.

Zero permits the position rebase; it does not promise XRUN recovery.
A negative return skips the core rebase, so a callback returning an error
must leave coherent pointer state even after partial work.

Linked RESET and prepare stop at the first error without rollback.
Earlier callback members may already have completed. Legacy members keep
the existing post_action policy. Applications must recover the group
after partial failure before relying on shared positions.

This adds an internal kernel operation and no userspace ioctl or layout.
Out-of-tree modules using snd_pcm_ops need to be rebuilt.

Complete appl_ptr rebasing once in the callback path. A later linked
member can sleep in prepare while the earlier member accepts SYNC_PTR;
a subsequent unlocked post_prepare assignment would overwrite that
acknowledgment. Keep explicit RESET playback silence processing and
leave prepare-time filling to the normal START path, preserving samples
written and rewound after prepare.

Atomic and nonatomic synthetic-driver tests exercised both callback and
legacy members, mixed linked groups and later-member failures. The
callback retained an acknowledged appl_ptr of 64, and finite-silence
playback kept the written prefix while clearing the rewound tail.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
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
 
