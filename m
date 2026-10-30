Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338041;
	b=T4rKOuZR67/6sBItmZdV/U/SzoTivdX6sgiCf7xdY4GiX5WrcMM1Wt9+tMCK5MNkReDI
	 yqDjFspMX6794R87bHlwmL0zvuFgpfC0exlS71NcCO7I/EXG6NrDdBnjZsMflzGDencqX
	 JbOfOtFgHRwSzzmf8Dc2xvEznt7/+//VxQ/Hleh3acilVqMihdpgjmHHRaf4J6G68XVrs
	 KeSma2mH/EuT1MjdpeH2JSexGsjSs8e+QOzgjv9smEmc+jdKUeDy06xWc5OHk652D/LQX
	 LPzk7cKAW+vPgWXjN4j+LnwrscC4Vbk8jYibhr1V6wGVgaw2iJoGL5OqgFo4Pyx/etw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
	b=Ufx0+/ssvK6V3Q1pE5iPpZuy+j4f3Z12lvVd47r1ijvR87/WyiOMebOEAwJcw1LnY6hc
	 spDriG6E/NFbF4Qh/0HPDB6mPGp6qO2qtQ3ocMa4HlIKtaxm64VLH7hlty0QU3oj/kGio
	 McSz/q4Y4G7krZI31m7MGehdqyORYegZE/ZD6sbfX6eJUr76Bk4XhoCh8H0tjJNU7BNbx
	 MAlSPsrDT7qV3sz0l/YP7OK5kJbtflzFwi6L+txd93WaBwOP0E1HAjhXc3/XMUC6vGFKN
	 tRe13Q52ymwnLs5uLLM1b6VrQVwA1/OtxMoVXXCSfkgQ9Ng60gGebkFEMQVCTnEtbCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE9160A2623
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EE9160A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WmMymrXa
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d1114320so2737435ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338040; x=1793942840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=WmMymrXaoVSM0Qu0SrIO9bd78PLxmKqrPcXkQDKlfPvj8QdyKNPYYuveZ5L7r9Fmz0
         OZXf/T7ttY9ZO+UpXcQqicMeVtMcW9ATXU4DnkdgAX7AQ1Lsaz71fCyLkPsACJDBXiWA
         3sgxG9z3gRAOFSAYyZALkzH4jh/PaNPBLIwRLc5im7nNVBBsPKMIJAK/sUeCBu+ur0yf
         GkrOaHuiJ8wNhoIBybT2+oA2UDCGzZdHAsIR28s3VEQX9+9QTZ/GONOCZRSGHJU2k0I1
         7J2OYNKDAJDgiCrgDDeOa5h+S8W7TptspR5pyPBYL0p0/aIfKzFTiJK5Th/bB+Cx84j+
         u2sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338040; x=1793942840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L+IYz8Es9Qy/f9V0V2aGa3c/aT6j+cONl3IYueQbDwE=;
        b=nvlK+z2EpIixR2B1j4AehB8l0EDmLI0SqaUaFCSi47O62bIsF9SHlP5R5ESLTuyIsB
         m0roEq4Z+/ZE3sXgu+s4+FXecUZg3zULJCoc9pZnY2jGihHve5L0VRl8Ndl7ZvtaS6J9
         y+PhXvjCqcLSBbobWdN4+yD2yAZCfmE7TwoTMrHFBs7GC97Mrj9oRo960oPp+KAScZMI
         FApfl2SdIjo2WEh9ePtkrld17Z9QXYV0Tl7y98qUzhQzMeORG8dKI4lQSpyAEooGtXE8
         fztuDYG4dbVucTQYkl1kl1i0Ue6uh7ENYAeqQ1iM2EixAvcnlMc3dDikI9OrA6CM+Lys
         v5IA==
X-Forwarded-Encrypted: i=1; AKwUvBwdyq5MEaD+xIdsenS8Gbbsgr8mv+yL9UWQqTXACehF0THFsH9vlvzBY2b/ZwHw6EfeL4bV8HcTLJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJy4V/mVJpSAqh4vf4oPEqO5+Q6uODhE9eLiqAe+SUiSABk8jHI
	+lM/GnswxME4hNnS1KizOX0c5A6i+GHrFUnDJolUt5kYNh89zgbBulDP
X-Gm-Gg: AYBFou3wA0cRw6S1r4qtNKls7xlbZ74Ic4/2+zsBR/tmEBlA3NSXs9lkCmlKpS1G4ci
	6GEJGSxcEi2Md4AzwLGy7MIs1Ghj1eZhuoXa+KT965wfLA+9hS4aW4jyA6h1xVCKm0bFErrLd5z
	PeT3+2Upxy6NpgUGCZqPGpx8KSh8Wemg8ukaUJ8oOMmmZq2EbgX6aSlrYbKtDk2bd8IsYnK/r5E
	U/AsoHWYkroFj2UOB1V7mrDCVstdJBOJii0l9Gd6lh6wKFMOuNTrLdaqg0W8GahgDM8GXEQZA13
	D+pIEaxPtO4Omt4cuLtw/rIuqyzzP48xMJpTQWIVmhmfErgf1MTTdS+VF8WVWyBzifrbhh4xdrk
	xjv69uBREHytkyoNC4fa43UC5AKWvbHbBzXE3tjKzoRSn3zHuq+NMSjvaIpYKdEW926B19VFABQ
	//GVyZOinoEIrvDxeobFKufxKrll7udiekVwzyLehOUbESEFlIO8MWDRwM6j35LQcH5F5khojAG
	n8jeK9VQqgxDFCTK2m8RWAG1mvF4B+6w9MBQgrg0g6W0PuFVIwEzXyUjEVd7PJUSpHnispAGwJc
	BTPhGGpI6QdNP7pM7AeSkx54GcHcXZm3IAK5LV9Ur4CZeXtHLInhZZ64ocZDLlidHjei+NxDkeC
	RWZY4AlTiVIcuZxOJIZ2IW8L7U1wvMtpbWA2VCcAnUwHFqkqN1VwElMXHHixI0mC2qO7I
X-Received: by 2002:a17:90b:5830:b0:3a4:a850:6982 with SMTP id 98e67ed59e1d1-3ae89749ccfmr988542a91.26.1793338039474;
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:19 -0700 (PDT)
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
Subject: [PATCH v10 13/14] ALSA: virtio: synchronize staged capture accounting during RESET
Date: Fri, 30 Oct 2026 14:26:28 +0900
Message-ID: <20261030052629.27742-14-mynameisjune111@gmail.com>
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

Use the locked PCM reset operation for staged capture. Reclaim RX space
at the same locked pointer observation used by the common reset and keep
completions arriving after that observation. Rebase the notified-period
counter there to avoid replaying old period notifications.

After common pointer mutation, finish the matching core rebase even if
refill fails. Latch XRUN and schedule notification. RESET can return zero
before the asynchronous error is visible; userspace still needs ordinary
XRUN recovery. A nonblocking read can initially return -EAGAIN and later
-EPIPE. This avoids leaving core and driver positions partly rebased.

A forced 90 ms RX interval reproduced -EPIPE with the earlier accounting.
The corrected sequence matched the next 48,000 deterministic frames and
passed reopen. Linked RESET and prepare partial-failure fixtures also
passed with atomic and nonatomic stream locking.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
diff --git a/sound/virtio/virtio_pcm_ops.c b/sound/virtio/virtio_pcm_ops.c
--- a/sound/virtio/virtio_pcm_ops.c
+++ b/sound/virtio/virtio_pcm_ops.c
@@ -9,6 +9,7 @@
 
 #include "virtio_card.h"
 
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops;
 
 bool virtsnd_capture_staging;
 module_param_named(capture_staging, virtsnd_capture_staging, bool, 0444);
@@ -392,6 +393,10 @@
 		}
 	}
 
+	/* Keep RESET operation selection fixed for the opened runtime. */
+	substream->ops = vss->capture_staging ?
+		&virtsnd_pcm_capture_staged_ops :
+		&virtsnd_pcm_ops[substream->stream];
 
 	snd_pcm_hw_constraint_integer(substream->runtime,
 				      SNDRV_PCM_HW_PARAM_PERIODS);
@@ -1731,6 +1736,61 @@
 			return 0;
 	}
 	return virtsnd_pcm_sync_stop_locked(substream);
+}
+
+/* The core holds the stream lock through the matching appl_ptr reset. */
+static int virtsnd_pcm_reset(struct snd_pcm_substream *substream)
+{
+	struct virtio_pcm_substream *vss = snd_pcm_substream_chip(substream);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct virtio_snd_queue *queue = virtsnd_pcm_queue(vss);
+	size_t position;
+	size_t period;
+	int rc;
+
+	/* Reclaim RX space atomically with the pointer observation. */
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = true;
+	rc = snd_pcm_lib_reset(substream);
+	scoped_guard(spinlock_irqsave, &vss->lock)
+		vss->capture_reset_observing = false;
+	if (rc || !vss->capture_staging)
+		return rc;
+
+	guard(spinlock_irqsave)(&queue->lock);
+	guard(spinlock)(&vss->lock);
+	if (vss->resetting)
+		return 0;
+	/* The common reset has already handled a pointer-reported XRUN. */
+	if (vss->xfer_xrun)
+		return 0;
+	if (snd_pcm_running(substream)) {
+		/* Keep completions arriving after the core's pointer observation. */
+		vss->capture_acked_total = vss->capture_pointer_seen_total;
+		vss->capture_ready = vss->capture_free_running ? 0 :
+			vss->capture_copied_total - vss->capture_acked_total;
+	} else {
+		position = frames_to_bytes(runtime, runtime->status->hw_ptr);
+		vss->hw_ptr = position;
+		period = snd_pcm_lib_period_bytes(substream);
+		vss->capture_copied_total = position;
+		vss->capture_acked_total = position;
+		vss->capture_pointer_seen_total = position;
+		vss->capture_ready = 0;
+		vss->capture_notified_periods = period ? position / period : 0;
+	}
+	vss->capture_callback_snapshot = 0;
+	vss->capture_callback_snapshot_active = false;
+	vss->pcm_indirect.appl_ptr = runtime->status->hw_ptr;
+	if (snd_pcm_running(substream) && vss->xfer_enabled && vss->prepared) {
+		rc = virtsnd_pcm_capture_send(vss);
+		if (rc) {
+			vss->xfer_xrun = true;
+			virtsnd_pcm_schedule_period_elapsed(vss);
+		}
+	}
+	/* Complete the matching core pointer rebase before reporting XRUN. */
+	return 0;
 }
 
 /* PCM substream operators map. */
@@ -1760,3 +1820,18 @@
 		.ack = virtsnd_pcm_cp_ack,
 	},
 };
+
+/* Selected at open; the staging policy remains fixed for that runtime. */
+static const struct snd_pcm_ops virtsnd_pcm_capture_staged_ops = {
+	.open = virtsnd_pcm_open,
+	.close = virtsnd_pcm_close,
+	.ioctl = snd_pcm_lib_ioctl,
+	.reset = virtsnd_pcm_reset,
+	.hw_params = virtsnd_pcm_hw_params,
+	.hw_free = virtsnd_pcm_hw_free,
+	.prepare = virtsnd_pcm_prepare,
+	.trigger = virtsnd_pcm_trigger,
+	.sync_stop = virtsnd_pcm_sync_stop,
+	.pointer = virtsnd_pcm_cp_pointer,
+	.ack = virtsnd_pcm_cp_ack,
+};
