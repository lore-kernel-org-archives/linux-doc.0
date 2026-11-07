Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062079;
	b=PNLDrawBPlTymtoLXOCIOv7e70MnErKnAJTZPp1vvBVxm7iSb+MS57nfcIr5EiBdmuEN
	 POfOB6zwXKIwc8/bHCEzXb3kCYo1ONVXv2ghUf6NXPkh98Ku5KIRRsj1BY4nT1N80R8WG
	 ClhLbeGdLc4Z08OKktXWsG/5cpT23zstLV6E0GivI2MgIeXAHgOlqxoCjLmiTJHCd7ucG
	 uWAPFs3aX+iFipSegjgwKwLAPhrN5T4VPxOkV1sUL0qaAVQfoXnuStzK/RhPU3j7ZSVKw
	 4ssV6NMVz2/n+4hp0LUv7v/n/wCipNTcXvjdoKBCR0q6J1B6XITH0gcnl9n88gCDAYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
	b=MytzZw5tq+M+zrodtZthQIFhINWLFVhfyaT3+xc9M5UbpLOVtURw24IS4oBlBKdnOAJD
	 kbYP4z0M5MdB6uz/FU4VJhnT2SKUbr1ArwNWCVO22eXsbOGBHMU7a9AUbufmC2Br2Oi6O
	 Md1uYXj16F+cHEtaERnrH9imqDKIwfnSS2eEJVhYau09LVqaHAXBgQXH16y4BaQt0F6cQ
	 RUDKahjJOYt2zlb4UwpQ3GLcUex0cV2BijQSTQf0eeK3wyYXqnsXQ81TwpRkPRv68N5gk
	 PdRgV6a7pdRBObUBjuigF2p5kQgTlMrMvyG+M9I1jC5NHRnlEvgnMO+A54bO9GKYxOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHBY+fiJ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A2606EE99
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 925A2606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FHBY+fiJ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37071c0f42aso2156040eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062078; x=1794666878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=FHBY+fiJjjheRNAJHDecGWNPoVlYm+Ke+Oget4jMLyHjZkT3A6weCKZG6yIRmNZIO8
         WWJa/LVtK+ah/OCgDEJt9pfQwamGA/BZVayGL2xfWF6dlCfXXdRl1H/9Kh27Hi+z9jR4
         d/C4hJ01cVg8jydcgewKNVusOH4Fpx0yncUxT63FmFcmWkzIix5C4jLfCQNhChnwywqD
         KhTcGRlradu41EPs7LRo7SybCA7eGjnWwdaEdFa4ts92jxNvABmoZZDZrOuP8k1y2t4H
         YblxBT4dxJperZE4eRzvSP776Bzyll3StYPeCP049M+Zp3NtTf2D6t3lK0vFak/s/oYI
         V8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062078; x=1794666878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9g1EmpJPl3VsiiyXPfTHGa4seP6cTbErFussR8Q6f4=;
        b=15znHgn0IEnlLjhwQfWy8CTo1k021HPg+fuPIFbAHEplUD7GY4YAGg0WkygjnEA2Jv
         ex0FGeya8FcLNweodw9gZi0H7A4tEURgmLPsNoOFT2fWxAIn4eYdiTyuS4IinBynkGWE
         RkfbRYAPUaxbXGcVvOsjUG9JG21s7dcpj4Ff2+PBUaYpfGZKKrbMgFnc/6bsh2dKxtUA
         aPXnEb/eT/o+T0FHe6W90hFWUjq1X2ej7ERV9kUajDt8BV7BrCF57FWlWz5NSY94Dv7o
         4p/vhePMzmbe8Jzc8sn9ORVxFeGQdTde4cQjiHltdhUOPQw8Qko/2bqIz9DLYjM2rqkv
         s+fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTnWj7fLoAJpjnxuInRqUPdGoQxI6xTcCyd2VeJZPN9vdcDuiZ2QvdecRLfvtMp4+y8AYeZ/Sia9A=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Uj3vzcde7ZtHfY4nf6PXGUw78vC0mSyLBRch2uPR//rspVvSB
	JLW1w5RCbxz6jTaBxXSj46fy+J8aNAszhQM7Obht/7fta6mgoXalj6Fp
X-Gm-Gg: AYBFou31pGcuRlFLCL+Opre9pixzgV5HZ1OmaNrsxE+MBdG6kUbFQhBctubpbNXEdRo
	8itW3xLQMO8CJYbMg0ohVEf8BkfWsk4bXSM+6Z36p/gK5VMXO2RCuB0qPNH8WWIXP4M0yjeeWgY
	1kXDUAnBOj/hCxwkiHC1vVlsWLjd93IW2RiuoxDrpJ0JTMhL6NsncpHBh7L9MeMqoRXIuNqgAf+
	wZ+eZ87y0/cyCkXKDuUJz5q/2NI9B+mDhGEI5Zx1+kvSD5mvIWO7bVsr8oa50AAhmHQXAJvqMTp
	gOVGogi3DglP02S19TyZwS6FQsyXrRTx2woCJ1iLFVVG/Q10V3yZAdYBaUuIR4p2I8zRGw5QR+7
	w4jPStUi3VM4fVraj9JhwVkW/HXc3VEgT1t0xMouIR8AJIN/AM5hW57ph2nLv8Fbfz3ZWUgDd4W
	z2CRZ073D/cArp20UY4NUK7WIsSC5Q78i782Y0aufoP8FHBlQb/RdYb2Orll4bFjxZfQG+EvWjX
	wPmOmwVv+c6RSmWa/0TCabX/O6sLAQZ94XzW704tWOmBueWpE0Lp7ofSXZvLZqvYWftXXdqtDhK
	00W+ODr9tdxlD49GtZjkHEIXvIBfKF+7qC45QH8/npimSzEphEc3xpAmGlzqcN1r4qu1gneY7yK
	Yud5vmI1MdaH9WtSI8S4Zbk9D9D3wBYUnOgZfTpXOn69xULCL7ocu4S1x/J/3wh36gnE=
X-Received: by 2002:a05:7300:7b27:b0:36f:2e77:93e2 with SMTP id 5a478bee46e88-36f75d205d8mr7653486eec.28.1794062077471;
        Sat, 07 Nov 2026 06:34:37 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.34.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:34:36 -0800 (PST)
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
Subject: [PATCH v20 03/12] ALSA: pcm: add an optional reset operation under the stream lock
Date: Sat,  7 Nov 2026 23:34:13 +0900
Message-ID: <20261107143422.29319-4-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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
 
