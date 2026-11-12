Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464704;
	b=s7hVvO3oKLqJiQyhGUDsNinmdOUfhISfbTOMoSyv1Tu2FkXO5PBKDuV2Iq8aXxgNMSii
	 VM96WS94bmbrRZa+ZcuSa+l6/mtOl4aq2Gh/BrljvPQrkDzDqqKrgyepbTZwhm23XfRls
	 H3fHNla05SsVrHdcqOo1vEyBFDMbTgdPK9nSVnaoSJRwJt69AdQwuX6mEz0hR2YCHy2Ou
	 GgsNBmnsmTv5sUFSJ5ZeL5+i5zuqBIluf7V8JI4yodKwXXuesl/9gXxZAYcMQEXUQAgfD
	 L/CfBy7DepL5JvUz+PyStUhkI42dJo81uzVjKiMqxgpgqz0R1biW/Td594Y6h229klA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
	b=K/bSj+m1x+w5VSu6d6eVw9hwTNl5PzfrxE7DwJ1RAll1IpaJDLlaiJLsFYuYN/Bj4XiE
	 wmnfgFs9sGLSDw7WnzM7JMnDgsha1ASSKo7MlgxBMjCFp4J6rc9U9W603LV/bd3157APQ
	 U9B+gWVTt1s0NCaiPtF8CgIajj3R5BUBlgk7mruB3SHwejASW96KOmuI6Yhz/yDhWAhsy
	 U+UlWaJbsgk1hZxdByP2DOL4/qqjLVgaMVQ0/pl43BSjo+Iu8QASTewYQHBqA0DuT9pQE
	 5wfaoDveLwA8eLaiCTwf7LJLoMUFqke5lRGzj7ilKR0HRoHU0o93gtGxkeoCgL3obIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW6JOwhZ;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE1606A8A2
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEE1606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW6JOwhZ
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e95bd1c14cso34864895ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464703; x=1795069503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=XW6JOwhZzYlqJ24r+QLpM88n/LgA1SB+pCvR/HL5jARPuxkjR1zXPH+IUDGi3FtDBe
         /tiQXX6tTp+J+FxNGz1OIS6nFbkDhyBQFxZxNOVJt6FzVVkiDkJqjgNaYhYp/TKVeN3M
         A1q5yOP3dpKCoegN39obv0ap8D12T1BGH7e99dyjNGqFRoEa1x9VTLZI2yptsTXogIwd
         +rJRs9aft5PNyQ0hUsUQQwQj0Fp7Sy+acQmu3W1XPxXj5wvvYIQxyFa6Q8B/8AT9sdQs
         x1Qq9EPjBJhbwszlj+BiWYd72xAv6HqzSanoSXmqIjwih9qRPGen/9zqDc+kWR9LjRoi
         g07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464703; x=1795069503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6p3+pqMhjDImkIJEr0R5v0U340Sy0+dzECuu9p3HETc=;
        b=nOoT1xVGBQl/2REA4FGy4M1xyc8OsL98Vp1LzTbbLEtTG0zbEcRgsq/sXdUg1Mwq8m
         FlhUf9DOMrw62Ejhu/lLv6OABMiXQtYBkGF2h3vm3Yzv6dMxb3i9Lcn9nS+mcuYns6Lt
         //PUfCvUr/EsdkxBB6+j1Rg7C0gzt2WdDCw5YtSBhgVPknmffLQLkrSMtZMyP5q2lvnH
         PTpxDqJ8H0cVcT/EVL4eCZRRghHzEkpFATsjrZzJEV11Mn4v+Tct6RtNdUDquICKSiSn
         9kI6cnG4LAL7tHqE/gpxkWi3W8TUpm5u4UnxBsY5Cq7/dRKIjFLGewvB1QwWH2ASdoKv
         mnew==
X-Forwarded-Encrypted: i=1; AL+hErFvEVMnyvD3g6H4AZyuGqL1gVDcf40ZIiJrWok5sO+tdQ7zYMBRPnseMh3VY54bf4m0/7nZuvBzZ3E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/3m+IbGXoi70kvwAnaoPPvGB7OUUlY9u30j96abipFKlFxW4fj
	70OwHHI+7UCjUBgO/oGAEaYspiXvnNW2Geq831uv+enndsjR1ZYCFjSU/+Ts2Q==
X-Gm-Gg: AYBFou30CPd4lna3ME+b9QkCA+KAhToYXZgNnGty3XuFGx+g81irV32W2H7kc5DES2j
	qJsFRNUvTWMwZxaE93zpeJ5S7fCsI8gY7uOwKawF4HVhXF+HoKzeTGVavvkvMdR9kmaci+0o1fT
	6mOQT4uCskItwCYVEWMvoKiGwKPav03GT9nlClrWCsWFj20g0S4ggGtgrDLVGbR27Hkkm2Nkspf
	q5wXkOan4XLQBdyxKH2/EWgMEVkX+TdhL008DtXiUz767B+4YRuDDhCFhYoJTjQNDnEDCQCoyeQ
	V8HG3vjMaTHyvy78inPA9zjDWpDwo+/RFMnr+LDhk2di9h0qEQRC7aVmlSpTBu3elhMysNb33AV
	/FSSCJ3GVPqBoQAS10twlwY2eYMTcvF+mYmNg3rJ/t6ajnUH0PGGdKGTZRaeZo4fCI2026Hp73e
	y3b036J5ETHr/7uO5hhST/KGAP+wkMbMvpJDv68DSbdCDiuIs/DUdVbMx+d3yHIm/EkGCIO8i18
	wndhwcrxNsoEhhHZ14waertXLG1GM/d7QzbIgeQ2UfisUuGIrSqIuQjvf7vMLabfK1ctzPeNDUV
	ifRgto2BykrDXmJXKtyWbh+RmxyIfjoLFXUAtsL4m580P8nbDNVOfudmbuVUmTk92arSK3En3Jj
	VoTdadBRv4q1vgqggmjQgzbPihcOYVzMT1gdBdmVElZ/nt5U=
X-Received: by 2002:a17:903:2282:b0:2ea:41ad:e310 with SMTP id d9443c01a7336-2edd7ae7a40mr50230395ad.46.1794464703254;
        Wed, 11 Nov 2026 22:25:03 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.25.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:25:02 -0800 (PST)
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
Subject: [PATCH v30 03/17] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 12 Nov 2026 15:24:32 +0900
Message-ID: <20261112062446.159-4-mynameisjune111@gmail.com>
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
 
