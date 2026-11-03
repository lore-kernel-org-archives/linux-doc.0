Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693339;
	b=lGXq5ZA/cXW41afXkczTnZtT2iLCvMYMQ1XqssuRWJenGgRq9Z/R+nDUWZ4WMGiZiSSd
	 LynXtVTc51RsDTPyK2BwFzlc3S5tZOHN+b1enbdsxbG6ataVL3yyxJXoraSMiXj4Xj9To
	 qfr+TSYEyzOk14Gn+0GK45mX8QQEnnjZpHyu6aJhSWtpmZFaTxX2Ref+5BxZGf4ujC8qA
	 esF+I3FZWIPSkMR+iv/PFFWJML2/qQiYBOUaj4Ccqo67U68W7QuhaFHBTnoS+P1FpWgYs
	 X+tKeADd1+tSfN8u7KkvgWQjDPTh7oETb01M8FN65ri3RoOw/XKYtYcDK0i8xlA3wJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693339;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hucEkfetCBC1eNxJx4T/MsrsrXcFb1G1sPDreCwELqE=;
	b=BZ2DIeL3jmwIwLvUkJZ4FCKaZH9gQQ1QlR4EPb3fkesr5EjZpBo4FFaFd7WD7Td5GwhR
	 Ooj5/sga0YkJWNJaWaU0CNAd2R5gM+6QLuhJ/gsOZkjGNM6IgPsI/GuVtTmCIJmH6CIFI
	 vfmtKSNEXUmg26rwCuPJGAQ2/bVgtOH2KGOugaKIYk86e3QhrJugA1rQY9nkH+3a/u6pZ
	 l98+6l0nSmXSUvZKXmesHA+bldJ5VdWA9KPUmJOdeejLzz9Tj298a3gTD7gxoDiJGPyJV
	 XKPzsntZIYil1+Z4i8+9740rhujQjJABTlzUZZj5xwpF2Hb97eZWsKTCBiw3hpt3dhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fblgGPOI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9823606D835
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9823606D835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fblgGPOI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a0f27c9f4so7318318eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693338; x=1794298138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hucEkfetCBC1eNxJx4T/MsrsrXcFb1G1sPDreCwELqE=;
        b=fblgGPOIyRsWJM8ADsobdWBLGhNo/Ja7DwcWgbkGAB+LFeWj7+s5k/9XCp/gUhIcRz
         ggGofKTEjrzpPfpkfPE22dRBbU4QouY4NCXZkL2JWYfJPH6MyWxeSZQ2uv0BBJY6Z0o+
         g4U5/96PGSD2neuJMekSbgMsdg/zkirrlf9Sy4VcNo/IGbkaj4cmioGrHZspH0ifo8DT
         DfQ/pMU2KjXED19LWRflHoHpUJHQgPc+GKNRXcSFc9DxTY9eNpHbYXNQGMKs3kcvqjt9
         6ieNceIebN0VT9SAuor/+pfq1WqOGaR6oXSjSI/zpyyJvK9WoUJCc/dEDmXjwHbEFXqa
         8nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693338; x=1794298138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hucEkfetCBC1eNxJx4T/MsrsrXcFb1G1sPDreCwELqE=;
        b=woP1Ke/pzKsJeh8jR95xRSsS3nJqaDgtNsA81dusxw51e/5JrH5MJPpGmA1X5hnuFb
         8sE+fTkF14t4So2tRLUvmi34sFcextiEA/4Q109Q4P+NIioJESdTaq/9b9VVOGd3z9De
         gcf4LvC4Jp/dOmq9VOcjjXI+dtqmHwpXuYkg9eJts9x64/BedXV5Bg9XqybnrTdhTrC8
         t0BeJHhEiWFkcqibScQrjop5lSbcgIWKHOd9oaFZuCpJsnQeSOK7eWDGAWmAgygpuUSd
         3Em6oYCpvz3lv+QhOESVge71TZs89ofXIqje5XTDh60jCR7nhlloLEvOdcuky7dkuMGt
         cjxA==
X-Forwarded-Encrypted: i=1; AKwUvBycvCadWCCIfqQJjcm5VvTiWesfb7N6y3I90WdzzWJlkUTBYx+4NDDQRcX+MnkJXT1PNKWBb3sFSXg=@vger.kernel.org
X-Gm-Message-State: APuU4Z80MulQm61hDkXfoj8lRSatHsHiphbN6BY/ecE1G3COIyjXOBiX
	PocVuIz5h+u7kEFX5AuL70+7jNJTuf7FKBC1iGxzI1F+FAJgsB0im66f
X-Gm-Gg: AYBFou2JPdxNRUaKHcmLHb673E1x5Ga55ysyxzLM30tWvnrLS1DQvreo++A91aCAkAW
	6Lf8bYPtQnzTVJaoHQyG9J004Jq4/ALMJU4I5KChmxTKwIj8Yq9rNePdwHCjo0nuqX4+LTMrRmq
	EDPesFgvx3YbEDoPkQMMK7nSmaxWwuaY4e/bozyEnv7CDkwemGlToyAo75RSjU6YG1gtnMp7zfC
	Ocg4vmcHbxDgEhACj8w8HeoI+R1Jyly1q7qSPmiyx/8D/yaww0xUjg370EivvIaejx726Vwm5H5
	T6JGFBR+IfppOU+JtRxPozZLWVlK5KvL0cAlSF/jW93uC451Yt38fNTS3saOmBsvPPCj9sr9WBC
	LU6tuXwDpwkFYhD0OuTF8aJqVlxnbaT5eB0brWF50beQ/8WLGnV3nHlxjq1CZZIxaGP9fTIsoDk
	T2dDgHWdumkVeakwOJXNS6ReC31PLJTOEPpCVSpOtkQzlBdirK3XLaUCctjCPwqw0OnGJ4DOwp5
	JeZgSW5VV7mq46t4Y5TW+1DPjgi7mhK71vZOgZxuGLoMD6rWANTMHGHOwvQRRfMm7/u6/W6dOtz
	7XVaHT7XMqNWvIfeugaEXs+OHC2OqEC2voj+Q5A3jhDhqnu5JZvE5KoH1p70HbuqHKdqvQxlWRs
	MKIHQxgK0Ov1A2UaAVpt/ZVsLj2B+8dubmfZ3U1A/PLZfWbg=
X-Received: by 2002:a05:7300:ce97:b0:35d:8c3a:38a8 with SMTP id 5a478bee46e88-36a42437327mr17179370eec.39.1793693337840;
        Tue, 03 Nov 2026 00:08:57 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:57 -0800 (PST)
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
Subject: [PATCH v13 09/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Tue,  3 Nov 2026 17:08:18 +0900
Message-ID: <20261103080821.16983-10-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
 
