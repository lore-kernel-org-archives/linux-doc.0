Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466187;
	b=xAugALIPpW2KTbw6hocuJ/mR+IVAA1bVV0qGFZXRW9a5OuLH+X5Gpg+BZQwYoSO9z6FL
	 ozz+KtIrH/XBrckbSpAZd/JsYmWhS1WPWYTJSFUaXEE5dWQYNFLzuydCDRUQH6qjO7pzy
	 oomRFrpqNUBKlDeY0z9PTJXKfkhSuNq0lbfEENM+tN3vW+yZ9uRU7sbppjKPmlhbQAMbm
	 4glHN3L+ms4QG74VawuaTdZo8g76edVnEanZiV5tQKZRMN6iP7Hz2vd1MN2C2xWoft9Lu
	 whGnFXfpnAipxrFeYGtLtff+w1WqXvOnl3jmBBw/GuaJ7pv/hVyt5VbjePk4qOsYvHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=ve7S01Ghp6dw9cX8ZTP6EAB/rR1C0mnLA7n9PRAwJRG0mF4szo/4OwX+lkcn+W987OAb
	 jCT8ETTLCpAFbAn4XA9bOBf8EAQC8T5jVgGW0ScIBvLbPmY6B6r8FVwWw21cXN1gJsDr9
	 i2UNk1ehKO6EKY9vCLN2HAhe/b+VlDjvfUu0EVx/C3p7/1Umbv1GR0b93hAiavrMdjuI3
	 bcmKodcWAv0kVtErROXDnyko2GqtodNKVSUSaKbY437lp6HQYEoUzqN5Vg0SIjFj1OBrU
	 uIUik+2lYd4wYvvJWDod0A/5+H4WK39y3dS5uylGX79uApM/iT+Z+9aU09/2r6ARFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7iNYNvk;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466C0606A31C
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 466C0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7iNYNvk
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2345817b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466187; x=1795070987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=x7iNYNvkMvr7r56qZuMTo0hXQ41yxZX5b1b3+vfssiP/V7eMpNVWdSteWbz9qRrV7/
         GaXWxXEI+Q142rhZ1LJMRxHhSuteog0HQh4zc2fEFXLRSizcnQWMPvOuASAhAG7PoUTv
         DPGk9YeMnac9vVzngogroAr66DaTssrEKohMUFrH0+MOjspUb9yb5dXe1rXuJYzpvbx2
         bLqKI4D61qLAzdoxdhU/6tn22htyAmYEAGz1jw/Vg+pq4uvT/At+7TD95D3ER0bP1Gso
         FwQ7k7iXCPKSiGx6kcCvQRHDkm6fKJewKOlY8mgQI+Eb4S+fVp542NrKqwx8CSy1BsVo
         5FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466187; x=1795070987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=0gnf0WNOYY6bXFniH+mIKQ0fFnaoTmjX0NAVkiBYuj7Uweb6RxpKazBRGU0IjYn2lZ
         PXD4ksMn3DW7v3HxJUIJpuF6NH933tQrlfCBnhSh/On6VN4jA0H5dJDm9erYCaOSramf
         gmJsVDlSLlcwXyy7+OwjEcdkkZnm2QpdwPqeWsopU7IF7GWC+rc0zow8mhoLeKwYqxC9
         L2ETyNqmXQVOJpdEMGRX8tNxsaYF44hfVEUUv/LNANHljfotD9RXwJYyTkQEsi9Wd/yB
         1g32Me/bDyWrM20cjp/58jsgw6KKOrCXB5/w7ctmD+5gGcF7wyGet4BhlKNPbt7ftafG
         SmZQ==
X-Forwarded-Encrypted: i=1; AL+hErGLZlU1CYLnwsMGkqWZ3ktlu2veSmA/Cv+qJrfPJ1hN4V8R24DAHRMBijoUTeuCWHGROw7KkO6zOfM=@vger.kernel.org
X-Gm-Message-State: APuU4Z881DWFv/QczAHUXahGbL/oBNazjjEyvYrt8jCWZ++MluhU50gg
	XuIn3WROV1DIki4+BekMKBfg77UNt0b0c10lC1ltblm4lSs2h1AdkAbNJJrB/g==
X-Gm-Gg: AYBFou0F/PSAlFCnApVIkIpYb5t3BkLMnQdvw+AZNNe2MoGptWUr0SX+DVHt91q/joD
	IhHO6GgMM32KbaDyf6Ne2JVTjifuf68eI2c+twXaPKAMzoCOs1nlM8e8rSnp4BWR3iEYfV8ol1J
	RcGo0qyLD/uhZOkANLPg/ExLyfG3LiX1SigNv5ajz44HUfm6njKmV/1Lk88cyLWdFp2sA2QuArW
	WR0Vh8w8PnSk5mqqMw5bIjnJ9cxjrdgn5eZrSx7loDTsOBihAVM8Q38iF/Jx/87BIPnrAEr123O
	4wDS5WAgjaomqNga3NTM2iYJGuQ5RlHVmXVKvd8HuynLJ9vnQyocQd4tro/BGjXaM0jr5+XU8uH
	M5F/6slNn+6fLLou5oEAcCInOnRxD3x54HH/iM293xHcxiWfau4/g2WK+aNjPyeu0OBQsctdY4I
	PvihrsOHd1xHcesQ06ZH/OBrxZiWc466zZnVuimg4XgRpLYiD2nS8xZPg/e0/17lri4doCqKdR5
	kNU0t3GtiaDzms+g8te1S9bL57zdr3Xp6jUO7Wp7SMjF6dtHWiejYgWwDaHkwrqEk8uRjT2TPiB
	bLnVD9QL6d/MrBNod9FJl70EuCDCZwdbM4qIuRgqksFPY6Uf6eCls2XmTBP/PlOWwXTnIcyx2QI
	H+1onQUbssAeh1zTMA5BwMnxABrGW1oD+rhiV7yLNi+AIYLk=
X-Received: by 2002:a05:6a00:84a:b0:876:194e:b8fe with SMTP id d2e1a72fcca58-8bc1bcd3153mr4592079b3a.26.1794466186637;
        Wed, 11 Nov 2026 22:49:46 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:46 -0800 (PST)
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
Subject: [PATCH v31 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 15:49:15 +0900
Message-ID: <20261112064929.11211-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

Assisted-by: LLM
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
@@ -1766,20 +1766,39 @@
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
 
