Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793412579;
	b=S4PrmKN7W8vyc0wES/vtcBLVFdPj+qjuO3aaUkL7Hs/OMwEezOczRI23RzHzvvb/UviW
	 9cDOydp/f0U6LlLNcttJChgXvO1f3YZUThCfTMFtH1G79IA2ZLjZQ36pg+SLQzijNr6XB
	 CvGJamK7DzjZgNmWUGwNG3OYLcX0buwxcB+YGuw3Z0xpD1dgfYqQjSutGU9QqzuRj/m4j
	 t15V/tQ6OAZBY9M5sQ4oUPeYRnRUlrVQRiC1ulc6jtNRftPEwod6gW6YhFw8jUSoqf07S
	 7TbH1XgcTlSp/McP1ykHzq49ca36xbgd3W01K6zx4OQTZ54kIhcB+E9QCCYBt8e1Wwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793412579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
	b=uxDfv0Lz5Pju1YWSpPWAe448gS2175DzQwzcv5L1KpT6xUn7RUzivagR4GU+1hnBdUZk
	 oW1WER18vUIvTDkmnmqsgkItvAMjHplYvrrQLK03pb5oZAoHQdoesk+r5h/+jEc4+WLTI
	 2A+QbnecFhtaFBfOxRRUnySI6CwtGtkth6OoYXU0cR3M/YNGz84lYA2oSziGK7cqgrVTE
	 fhuq2AIgpvzs8AF+fr9KcLKEMIeRG1W7HA4b1y5e7n93L1tvS/jvXNWAQXoMp7tsGzJmA
	 GNV6ygUfN9RVhs28xKMbaDAJwZTb5BRLeqIo1Q8crAyD6HO9DgWO9amxFr5OGwPk4oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JamYfxBp;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A03606A325
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 02:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81A03606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JamYfxBp
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-353804b591eso2077100eec.0
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 19:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793412578; x=1794017378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=JamYfxBpZcyE9h8sTj5ZqvvKtL0O2KahOMIfNzXUty0mzYptsXJMc8Gu1/b/KDFI64
         s+fRR+lOwxH4hl/EFz0hm7I7CY6+qaXDnUOXxfemUlb2wY2YMbStUW1+RZ1q0pYz3OXV
         gE8RJ2GbQ7OEmY5t/4fxZDmN7L8iw8IeOVIKawUC2c5XKTBEIt+a+7q5lv+BiHz9rqH5
         Sj5/9z3QVAmEqepWaSAWtOW7d9vYyNbu1Jicne8X976Q3qYAS64Acmq2F6DyuY3AOSES
         XIUSUsi5keSBhDgvnQsYUeXBa3PJYhNmmZn85EFLzRyacRIk4f+jVKrTqNygBVcifAv7
         zp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793412578; x=1794017378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2CjRxkr9Cimnlv+APvVZeyFM8wm3KwgOOTlk4v5ZLSo=;
        b=KjxmTZsFvVoGmw5L8RDxHc666LhHNCIL4xkhO2Tx8G/xWskVrKqQhWiLCQkhTpABAY
         7sDLvyUmRnhk1c7Pwnde4MVoynO188+KOxx9Q0cvyD/t6khHPpVK0TBzSfa3Tqlf4yJj
         3r0Sr2q8gzwJfn+xz1b4e0NxSkcgPJZMjZ1mLB4h6NaTOXB3DJCAKlFm88GFmWK/39W3
         a5yMFw4B7SauEe1HF9ztN6R9/xgP/eGPb01yVVdbcqlDg0gdv1F5m6KUCnINSPxfQrIS
         Ki4v44MhcDiyyZLTeAZNSH3QrWJ/ZkHuLHGY7br76CHxC+670zcGbpEL6FAYqQujflaf
         jO+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzMXWKY5RE99+awTp3aonc2+uxfx3nkUjXVPens/CZrnNYgsO4WIhxePyMAyVYtwbThARYX/ZYee3o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJerOfgIVrP3mx6OBEJ9wYowLgtER4lenjPYzEZb15MSFPRhIa
	W50lHp4lfWd0zGH3iLDhxZI01kzJ4abYerFK5t31yZehZi2pGUFyQSKg
X-Gm-Gg: AYBFou1nTI1YUFz0ODlgES+SwmBa+cbrm87PibxmJZOmB5NRPcH0TG4g2YzsVRdFvve
	+WgIjq46DPVClPMGmUF9TD+sdv6bKyx5lD8ZUba5GHup28fyOo33UlhB0AclnBgiGjaHNd5rwWu
	cfCLq2K5HLSbBLLZhoJu886f3CpkGHG/ezaH8pqK6gETZXcCZATCLpqwkC/t1ITOKnggWy8BQ2C
	YOxmKpFUiQ9EviGcLuSESCjL5S4GEAQjoubZjXYtSGML/36AT+jxs8KxUPA0pBaUyC09v7w+thT
	USKHb2QdFQTrqzNyUn0jYTYeFf5PziBNuMlH/AOBcOOMXCQktM0l9P1ZbIx8bT0ioLhIZzZsmE9
	Rdkc9ZdvzSJtyTQYbs8QoxpMi34boXUSx5lmoBCq6gpVuROqGCSydgUJpp4G/fe0RTlloar5Vc3
	f4ftTAEUYgm4KOA+scjpa1VUa6E7iRy5VB2vUOu49Y4e/An6seoXXP6+eOlJ8lVs8Lmv3QemPYi
	he0NbXOAOEq4MI0foL9h4hbqNRzJFf6z2pV8/9lSTbJ3JdrNYU1Zz671D+pfhTmGFGWe6OTD4EN
	MmANZTuOCh9Hzp8D0Wnw31gGgV2DnDOcKKXwA6LO2CpoEJW0HY0ftV6uXkAkmoR5UOlpFB89+GG
	unjsiJhaL2bdp2RQd2XxO9jqForehvwmEeAP4LsTOwZTiVg==
X-Received: by 2002:a05:7300:c00f:20b0:36a:4ea9:19ad with SMTP id 5a478bee46e88-36a4ea91fd1mr2670326eec.9.1793412577544;
        Fri, 30 Oct 2026 19:09:37 -0700 (PDT)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm13214096eec.26.2026.10.30.19.09.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 19:09:37 -0700 (PDT)
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
Subject: [PATCH v11 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Sat, 31 Oct 2026 11:08:53 +0900
Message-ID: <20261031020855.2402-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031020855.2402-1-mynameisjune111@gmail.com>
References: <20261031020855.2402-1-mynameisjune111@gmail.com>
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
 
