Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355563;
	b=xi9O1Fi0UYKgUiZpnRhggkX0ZRsnJ0eMMHxdOxGHkvTOMjtyUTWxLLXnEfKqZblnHzjV
	 xlaf5IlFhckS1eS2j7v9PJJMrl9khnp/fF7hSQJr0Jw+k34nrcjZm9XUTShNMq2qgAwrP
	 LFZmQdXqSY/EX81GG/fy1gBq//BSJ0oHASJTktxc2WMWB5ekYi4pA0bmxAL8fEElVFarp
	 1DIUA6F7piDYfUcOdXG/a9HkH2mRkkX+NV3W2fUEdhoizJ/U9PflRZHYYQn1nIR21o6ka
	 dBDfYhE2h70+rNQb/TO/LtyFPVFWC8mXexsc3w39XI5xAx0b+NlirqmAamCxfBZg8EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
	b=pojqW88HBgnHt6iCO5DoVRPH/LXwjpGI//8E4+Q+Ba4+RIaYlqsPNgvO/fBue77gBvUy
	 qhGpqFMHb2eY50STiDgnfCE4KKb5m70NMvbeywM0QlV7sPHDwqkAFirPYWXiYHQUjnPXS
	 KU3oQUtnbFl3/Lm+eDgDlLrgcv26+SWHFY+NfpgN0X2lcexIgILNXrrxThqm7NcblmnTo
	 bRQ3w9KRreIg21u9WJW1pc0xiKJx/6gGrBHBRbO52NmKctzNJzA3pAO5iMt+PFWJ9sk2H
	 J33vOtj9Af87dmp65uPSYNM+epO/DNQPvsryhveLjyRpV/NY7iTZ9JzDAOiu1YT1lCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Y7BhEPU/";
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCB606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDCB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y7BhEPU/
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1559151a91.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355562; x=1794960362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=Y7BhEPU/OA7Bz6dRJNWlw4rXx4TQ1ky3CwhKzSnDB3BNUP2/OP0Cexmm/tgPyn1I0n
         IHZQPU0aYYG22YUIMuFnD4UzeFKhmrpkQz+O/zgMscPmojhmw9qKSVTkcNspswG4Pmfp
         iPKVLCxE5j1N6vkyYCzwQfQCo+GMbCi87ZU13pXnJmwT76OseQIQg+5+c4PRxbpSXl/L
         uoYiHpktyBb25wJdbQq/p2iFMdVlEtySkdxjBgCLX0NvCO/3ZeMjarOqSyxqj0/JTNPv
         eq2CwHRrrgevroM7AgNj9zb4ociYziUis/9wrJu6Ofq7NlBETUZHl1UhWtpasreEs+AV
         kGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355562; x=1794960362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg2vIzMEdybNIlex02QZ7Vn3MXaakx+B0gxwqcZG4aE=;
        b=C8RNiTbcjM40gRoG2rEL/b8RrzVVc5xEC2hdEBcwjT0kpiffKoMgiWi6HdpAK1LOng
         LWghQwunCKm1cZJuCSDTiWNOCAKurVj8x+i2bs8P4UsAZon7oLLKW9TgtcoT4tHThpci
         03+0uLBldTcyjsxnsC20194ernahKZx8SqoO4beRgd0tf7/AmR23KU5P4v/nX8PeW7o2
         +UY5pV2d0GpUO64a5+7Zky7pc4+cm4gsfud3Ra7vwKxqJEbaCzKGsgdJSWQfsx2DAcuP
         ifmvnhpH68RyG0LvscFOdOOjdlnZCECUzJJw/FTjqmC7iNnoSCR/qhokrRrIrDUBo9bZ
         asuA==
X-Forwarded-Encrypted: i=1; AL+hErFtsza2JxY61D0I6tlZyG8lN5TOAfgjfmTfZUe9+7xjzB9RHSKyq7HRtRiEsuTq47+jxXfdHwDaLRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MhWrhoydFf80yY7FPzwjFUbpy6GZpmsqNT84COJrjlLMV2zcJ
	YP7ze8Jc7tCHVO3X8wkJiGuKIosuumICsbDhP6M8JDLsw+3uUC5JrnHE
X-Gm-Gg: AYBFou1pZTgtdSYAbWLuqfD7qolO8jqev0GWnIOC+f1EdYgT6eMBmp3Do9c7eb7Yg1A
	mNXaIk6T0LkEzB818QCcG8AfHi2Nt7j2O8dIEQnJSo1RSQd2h4lzbkW8ED5BXl5XYDMiOrlWDXs
	kZwxlF7hdQ4Y7wFB8SsFfVPQRKW/BVJ4T6afmjUVc2NPqxQ5VtI/IgDZHuG080r0b4uwUQ5O72w
	JRFkvIOHQyV9dp9TqaIjWRxlhLVmGlEdS8Y1i59/JYsesQT/Oq0Lb8EIEiWkhxUMK5v44ijWBaf
	zY8sfXGr87HkXdqD39DabY5c54epe0WC5dcOpLoHUuuF6uxzogM0gc9hBRMhwfJQbvaMNG1UWjJ
	RE1mkGgf8aePF0hQxJ/pRKUzXODEO9mtU1RcMR769wnbGW4XMNSnKVc8Gq/0GXksRyBwUgayl0N
	Sjw8oESNtts2Nw9Tkk+5K16jJiGlObaT8y9KE0kkjn0kOgxIZX7Yc4NuQ+ej0EXQeunFVFXYAtm
	qC7Muf5DDxEmqrbLNwdAearSzu16ObCBlFmnl03vaYSDjp3YDEcyVLIyfXjciS+seiInHFWq1zd
	7LwffEA1lHv7NW1ODJM4XQnITZWt1hXrbDA0xPP1O90k+J7xZ1Azaz8Ws8O/KguHp0ht1hKapWH
	RuHDrenUPYf3gsAXYBRAWyqRTGPMeGORLpiejQabJ1emEvL8=
X-Received: by 2002:a17:90a:e185:b0:3b0:9e2f:cfc7 with SMTP id 98e67ed59e1d1-3b182f6a71cmr602868a91.44.1794355561646;
        Tue, 10 Nov 2026 16:06:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:00 -0800 (PST)
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
Subject: [PATCH v24 03/16] ALSA: pcm: add an optional reset operation under the stream lock
Date: Wed, 11 Nov 2026 09:05:30 +0900
Message-ID: <20261111000543.28550-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
 
