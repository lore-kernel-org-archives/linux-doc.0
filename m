Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252688;
	b=yAraVqM9ireREMbL+1iavkMqDADoB/kLpprEhiipt7aMYN8UIpHLXlUA5kPGDFG5BoM1
	 eAaTj+K0Os9mZT99B8BFqxr1FVZddpHH2qOjCOy0E2sirjVT8wh6vQ3402TXbAmbzCsN/
	 Q0N3bZ023TQP8JFWAAW8Z86aNRgzdVjDbZ75yW4KmImHy2JSZrCXVNqejITVgxBGeZpha
	 al4KXTiuD+lvM53sBj5PikoOf7FleUHXgRjBgL2/M5O5KZbIJ4283uwPH5yQkPSGhiaWY
	 w+roR21CscWpr47ThnpbXMwOmXYad4YQW6EEl0Ffjdu96Xow9gxTlkbDafKVNekesUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252688;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
	b=NpyYZzXhamDw7jtZx/Tkt6NGaxJ5kGUsOyPCe7AQnT6jn1OP91Z3E/F7DeIxD8ISWXfF
	 FPj+liNuKoGV6Y6Zf1n2XU+d9nnhxnHGiEhMPZ6RaJgFmIFWf6s5M0YRAFw7GGhhuwoVK
	 88R3ulDyjZTPnjuRyo+NBQ/tqZMXEzn6OrkleVc2TDHcoVxD8TgJ6+oL7k080edgb0CbS
	 sIVRVdqhRTUlDsuSIg3pkBxbKUr1Omub8KRLU9gNFRbK8Ot2ykRNSa74QYfXo6ownn48/
	 qW/VqR4R821mL4Q/u1dwHzv8svFMG6DgDOJro4Pl+OVov7BZqCfQPOxlVDGRzM5TjpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoI562t6;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AEC606A326
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:44:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59AEC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JoI562t6
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso381022a12.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252688; x=1793857488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
        b=JoI562t6qTHpcNefDtoCQkeq8yYd3HXZ/PjSlw03tPVEU/WC1KQQjOXdDR6Cqh0aEp
         Pccb4gf58nJ2sDnqxhX2EYXRyFTociR6uMEO+ZlMVIeBp0C9m3FoTOG0WAtmNQk6s8W/
         ScREPQajTrZlM4m+/mojIMzEuDKbJtgvbcGYBlkIxbbfoLC+/3BN6iDxr6JJhmKFu0Wf
         mfoE2eg4UqIOzgK4g8BpQXoAdm7Q2/CXXusT425pNM7eJHTBoYsQ8APX55C3l6z7s11F
         V52PgnXU/SGfca27YBJ3N+zKlZxGr4st/Q3Kc6+pzA+m4DjRVovzwaKuRcWQ12h3neTQ
         017g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252688; x=1793857488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fs/ZgjrW0cZrAbuUtL5SEnJbOMz43SREcKUWySyyyzY=;
        b=avXSLG/cLKcbx2b04GKcSRNdfRVb/D8af/YzuIJPBXNylfVkJOaNe6i9TLljmkbVfe
         KXMEZ4i4wBjeW8xQp99v6x2cobg2ii6rIrd9quA//dDSIyJdjz/Z5TXHnSog/ww6gvxe
         ccjJcPzPVPxqT2fXO5R1uzbPJUwmmTEb0zkoOMHZLSgcIW78oqESrNdZl/dGYfD0dePp
         IIkl8fhw1Uzruk13AxwEesXSLnolXJkG5S8B5Z+9CwogA65nZl+8TmkHN18Tr9ZQTaph
         rR746ZQcIm9UjkfuqGhErYixIID119qiROFGL2/7WaXLVmVmt25uAI8r6L2JM6SBE0Qr
         JdqA==
X-Forwarded-Encrypted: i=1; AKwUvBy3g9UEPMnIMNwV+3sWVa6r8QfQQz13VsNDe7e337N/fCZo5F29UGX/Dla2k+Erfa2eQ84mv7Y0meY=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4aC08g7G3chiphE/OpvPbY0DepUQqtErVEB70GlXKJt4Pc6nu
	/XwWnUqtk4Rj6Qr8/MX/CuXxJbwAXJTQGDayQjujNZxU48z0RQh9gHmp
X-Gm-Gg: AYBFou0pRomzMoDFEZah3maBw4G/F0eVKW80sDj7RmBYIjGubP0lXemJ/cT0w8Lz8tW
	DTo+RQ1jkKSi0I21WuAtaIJMGE/bAMFVfYLEVxMi+PkxYDKN6D2+8LN+sdHkpOObI2COFKUG1Wx
	vZXxUTKdhcX2Sfh6TRgUPQX1kR2Dlw3z8r2FCI0MHdbv6mET/7Fij0lEZchqNGNBIk7frpx1NUG
	SdSY5BffD/97yN/xeKztncsPSvNztRTlvZnQQVkBGOeoWSvGfDnIzQwHB2O0TAwLtcz3HqBClp/
	icpsehofYff235vQopE3ZQ9zPHNjcE9k1wzZlUNExu+Ni48W7wO2qbTl1k763Bjm1F8ffGBD5Xb
	3W5vMZQTR0Q3Pl6OZ3unLfoNfV40Roi9zWoaLMZ9X9P4zhI7T9ABtXd7apHmtrHeuyY8FY03o46
	jSHgVFPl91DnyrdnIDl2wklqV1VWBv/TbVzc7/oyq8A3W4f58I9PPUwC6XHgAVpCOYu3z8dfzvI
	TWVrgwr1G/tImehkjZLVBYHWJywpKlhXrVrTdL4J2Xk7kfiw/OQKIVKd/POJVSvOQt2nu9VaSDJ
	9v3jVjwofY4QDm+Rco4PrTSm+32lQV2bQA9osw12e3hIyttJmiQLIaHHV/u7btuZGJfim0wPcsf
	InMGadeDeLxvDOQBzbCdFCZH2w58mXCrQncOERteSK9q+F5U=
X-Received: by 2002:a17:90b:54c5:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3ae58195369mr3420391a91.66.1793252687719;
        Wed, 28 Oct 2026 22:44:47 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e83127csm2433520a91.10.2026.10.28.22.44.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 22:44:47 -0700 (PDT)
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
Subject: [PATCH v8 12/14] ALSA: pcm: add an optional reset operation under the stream lock
Date: Thu, 29 Oct 2026 14:43:52 +0900
Message-ID: <20261029054354.2931-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029054354.2931-1-mynameisjune111@gmail.com>
References: <20261029054354.2931-1-mynameisjune111@gmail.com>
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

A driver which keeps private capture counters needs to reset those
counters together with the PCM application's position. The ioctl RESET
path releases the stream lock before core completes the position rebase,
and appl_ptr is updated in a separate post_action. Period processing can
observe the intermediate state.

Add an optional reset operation whose stream lock remains held through
the core position and appl_ptr updates. Export the common pointer reset
as snd_pcm_lib_reset(), so drivers can reuse pointer validation, time
accounting and XRUN handling without reacquiring the stream lock.
Drivers without the new operation keep their existing ioctl path.

A successful callback member completes its reset immediately. If a later
linked member fails, the first error is returned and completed members
are not rolled back. Legacy members retain the existing post_action
behavior, including in mixed groups. An error can leave partial changes
in the failing member as well. Callers must recover the group before
relying on its capture positions again.

The operation also runs after a successful driver prepare. A later
prepare failure can leave an earlier member reset without the group's
post_prepare state transition. Document this together with the atomic
and nonatomic locking requirements.

Linked synthetic capture tests cover both locking modes, four callback
combinations, later-member errors and recovery. The lock-window concern
was found by inspection; the existing delayed v7 test did not reproduce
a user-visible failure. The new-candidate tests validate the
synchronization contract and recovery paths.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -77,6 +77,20 @@
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
+	 * Return zero on success or a negative error. Linked RESET/prepare
+	 * stops at the first error without rollback. Earlier callback members
+	 * retain their completed reset; legacy members retain the existing
+	 * post_action policy. An error does not guarantee unchanged state.
+	 */
+	int (*reset)(struct snd_pcm_substream *substream);
 };
 
 /*
@@ -1179,6 +1193,7 @@
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
@@ -1989,7 +1989,31 @@
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
@@ -2005,6 +2029,9 @@
 			       snd_pcm_state_t state)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if (substream->ops->reset)
+		return;
 	guard(pcm_stream_lock_irq)(substream);
 	runtime->control->appl_ptr = runtime->status->hw_ptr;
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
