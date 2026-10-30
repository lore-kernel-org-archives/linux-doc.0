Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338042;
	b=3Y+jIwTzY5FJHsSsgILfMC3V3Xs9tigI72/VUhwDfls/dEjdgmLybcBTgpOXwUKW0bgD
	 bUBZotu1vqMoArSuuMSmaO98RX4E1w9CyrL4kXddVnQygv0jiPA3NEtACG3XdRu4CezYw
	 xbYKz89AnIyxcJWcZvQk4Xo/ZuJnzHsQaViAhjmpRQXA5wIpGBhLNEHbWldSFBy2dI0JL
	 Z9ERlZjz9pyEYr4Mgsc2pO7ihgIgH97u48ieSl77VD7adhSecGcYa32tcm/oxw6rHxFSU
	 vndY0Kmls0twwCKb0BNVC3ZQN7b9/lBcuZ/xqdObwe9rw+yF663bsbUShRtGG0QfM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
	b=M7p1MQiKhV5HoAex7CeizIFJYOQibRgI47BeuT9I1Mfis6n68Mxm018v23dutmXhoJ8s
	 BsgpsILJDB06+7Y1bcQO8coz26CeNaSkWYEQuwoqFT3G+dlvezNXynZy01TTXp27zfeGf
	 N/SiPuXzFqv7rXsOWiZFGcVZ6qbE7AHNU/MuJububSgqK6HtKyiXWIPmEqXqljER3Nemy
	 ygjy04fQvpS4WseHRF8CH/AL5lNcwoKxpGAjFwghsDe5WbbCzUBgI1Wb6d6xilIjskIJ0
	 uuY43yP95h5May8z9FBsajp7t6daZjLhTgPIxz/FPBjtmcBXQ/J+UgHjAZZ31kCGSXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABD4606A321
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABD4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso98268a12.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338036; x=1793942836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=G4XXy17iLDeT8iXazeGMX6Ue89ABKSpnkywlAhE7QtXmFUa/qVli+xLm+FX1Z0+r7l
         CswYYqRR6LQ/ATdLOULuaqQhousueAP7bUTsQIDEtYlA/Kosqg3tkQ8YP8czmbogxMXg
         1YuXxJZZcb2XaSixgZIOR1bGlkOpzWIQrfPn9n9JvJ2CmqNRFgVQ1tsAIoS1kcHub5hp
         V9oRBoi2+gbPFCFgkoXIO0BnQF1vtliJHzZLEHrL6G4vI+mG2+scECqrf9J6wjZO7Kqt
         ub+h90I5njC03+FwCZGTPlDFITkpFfbqW+NSaNkPFaXg78ITDKCQrIHLczTl0dmKn2jl
         KqKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338036; x=1793942836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rpn8KYcVL0EiT/FmqIaIfPQD2S7vrJUUAZEWCZQOS5g=;
        b=lY5BJVSuxS4io6PBwuyLV6GV0UuD3ygXrGbPmXuRae91iCUJCqwlKK7euhoUqnwRBD
         ZmFQidpLXaMGV40JhwaOKq1PeZOL7recEfY7dQsh6tAYh9o4w1Vhat/qJ5v+ypKrPorw
         m92P4qI0j0wz0AxGMgcSKnLVfEagVmspT3VafQFD9lEAbLJkMeCBt1dWg+50bo+mF9Q9
         lE2wZBlgYm/0oULFyt1jSQUpxULUvAU+Uqn8Z80Hb4DLdnrxONnLEKBU8LU3YGg8d2jz
         mT7voUcjbRLrgcHsPjgcb9ygaS2lpUEuKjfPZxugmKQCx05maGaHpWY9iJZgOutV0O5K
         naDw==
X-Forwarded-Encrypted: i=1; AKwUvBwTEFag9ZZQlDKxm/hPZ6Mb8vCeXl8D7/+an17ZBFB/auNSU/HHDetWXkFy7JQmC7KpvzKoCoGgZVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIathSfjof6EzUvrQpaxxqg9yUWDb90x1Ene4O/XR0DIjLgBTZ
	OCkeoDCkNQ4WKQeNK6lZCgb5fyjjSF8TtUZceXWl+V0FVNIhCRgM4BcE
X-Gm-Gg: AYBFou3Qi2HvOtGjMHixofZ3QJ0FQizFVP4YPViZSySmUw+rNk2+WnZE6Bd7u7oKIDf
	V1QK8ZTIx/acfoRRHKI/OwP7d3qoFv1+2km2tghwB7xjC20Z2qo4zK/oySvJk+9Pyk/0OuyFsAe
	X5esZYZOnu1Dz3SUeHDKUu+DP1MBURelwQC/5mV+zBYZMh7oBNsa4yt/NCtRdbgrcHN70iH7w/Y
	lEMFrGxK4rg04uXqUJ/8fEcaUbaBbrEocMeSwY0oyrYQ7UA6Wmua7TNzGKaK9eHFkwnCuDuzozb
	z1ayOzd3qy3r0ltO8mKkds73v0uT9Qdm3+uyKkvqfEFf+0HvqupKwIMHjRtzU9hqTvEj1bLSINS
	tXKbHGMI6tEfq3+ZR9DY/HJ0Oj80P+uBR3NG02lrwRnk87bOpObZXpPhqE+GXY26tdR2fOmEUXZ
	cxuM0/SvUXjiyvr/+bDTnwBjjTz88wCfStOlH5dMBH9waF3kjr4KKehq19rdsxZThdHdpvbRrb5
	gqat2ijJGZYgu+tBRbz2Vi76GsNSJZZD1yHFNHygDZyCxUkBvmnzjsUMESME7fwAyMIDpDpSX5v
	Z8LTEPuL5iHud3vjtFuG9lk5+FpJrjhl/VjT/aM8DN++nXMtN4mgQciGWh4O/EOYbMIKYZTalh6
	5q1qUm6q5qQmhdamVfG7wcOgLx8mDZqAhMV2joiMZy4tEQH4=
X-Received: by 2002:a17:90b:3c05:b0:3ad:8963:344a with SMTP id 98e67ed59e1d1-3ae897ef7abmr909898a91.66.1793338036177;
        Thu, 29 Oct 2026 22:27:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:15 -0700 (PDT)
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
Subject: [PATCH v10 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Fri, 30 Oct 2026 14:26:27 +0900
Message-ID: <20261030052629.27742-13-mynameisjune111@gmail.com>
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
@@ -1988,7 +1988,31 @@
 			    snd_pcm_state_t state)
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
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+		    runtime->silence_size > 0)
+			snd_pcm_playback_silence(substream, ULONG_MAX);
+		return 0;
+	}
+
+	err = snd_pcm_ops_ioctl(substream, SNDRV_PCM_IOCTL1_RESET, NULL);
 	if (err < 0)
 		return err;
 	guard(pcm_stream_lock_irq)(substream);
@@ -2004,6 +2028,9 @@
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
