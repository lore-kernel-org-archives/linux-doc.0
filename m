Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837371;
	b=ZoocDL4DYhqEmi6A4vcb9kUDO21VrAltOkAeWf8bkG/nS+CCp9nXNSzb8/eI8BS4QKzr
	 7ZvtXnk2ab+QkRmgoLAjR9XMEfLIoa0OgQMCEYfDNF4JQVJtQIohEuh9qtFqktr8NLJ/A
	 xoY0R5h2umfJMdwGFIlWTznCRgcr+LymKaxto9gn8RUWawoVEBqsDPtqV5xWTPx8jOlFb
	 cZQj036QHuHtrgdZlSxGaC2W+VFHkcHHX/WeKBqpUCqr6VUWx/hpuJMj0GZWxcPYtuGUF
	 FS3bvy7V1k/T3WSLBr8tEMC3P0kK5I+rk1A7mb5gXz7tlih0uwA933grXFNmxwYUbaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
	b=zYcQOckiY45j3IDel2BLdT0iySTznaN4ZyimZFXWJgPNHpjUtcB26DJKmMDmrgrz37uV
	 MHjHe5pS2opoMK98Af3eETBi14oxHwh22yyjB6oQVnNP+kwI2tJHpVm/wL6vN0WdV+XVs
	 nnkU2ZeKhKzq7dBdwp+Iz2sSgFBqOry9qUtUqKJ6TGsS5imBef+YUiXMHKaISyboh50+A
	 tW24DZTdEWCLGadtCFOyWKLWuKokQDTiTU7pOoZM1nw6ETr6hdzcsCZ+orlSmVmavvMn2
	 v87EL3Paa1PyeKw8NG6HeQU6dkfP6KzwaVnOBGqQ89RPFBkyjCVJWqMCGvvP9f6rUCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772C606D830
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A772C606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jl6OFb5z
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso536886a12.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837370; x=1794442170; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=jl6OFb5zBydNsD/tNT6jBv/GBZ8ZMQye/xJcvyH0okOw+yu4OewG++lPVsQbbNLf+u
         iEogngGvmBSPwP6LOTrM7lwcICdBjt9aFHG1vQ9UZk7ST5SO6mG8uV4rTLqJx2wEQ2Jl
         DVvTBWL2S9SX9IY51lDkUD5bRYNSdVlYpiGvkNSoFAa7uvrmS37L8ayDIKVGwKG6Fiis
         xamH3kbyG01qqnPmyCubvJ+9B4pnknpnd2aajEFigos/0KPc3fPEncS0/xkrAzQHZ7m5
         X6TkBDaLvMDtpvSajhL2y4jq64tLDj5MDlhs2UPMg/GpYIumQTVTIS2F5CAY56VBaPjb
         zPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837370; x=1794442170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vq33bnlu/OQ1LhE9PZ9KLC/HSs9IVBdbU21ySq3r478=;
        b=IFDfnB1KTo8x0VhBAnsWpbeqKFWuYpbfp0s9rBdIbFwqONXtclr6Pqm6IU7tJT4GzJ
         pay7X9EGD78V0QkhlRS6AgZzuLcJ3EpqaV7r77ST/Ws7Dmili89jm0YaejPWqkYkMFzX
         sYTq0z8oBEpxKVzFs9PnNj8BHQUfxhXhKWZMycm4PBMBm8Ba/RegNN39lRyyg14MZJzd
         qp9ZyH2jH3eARurDNXupQTYTv0dOcyqZdvFrBg1NpfHpeyWGiEdGkhWWg/fvEbuDh6xX
         fcpXA0/B0vo7UIXyxBXvH7Wekso7hLPDlEkN8S0iYIqyOpbLHLhr7CNWjHzjQsz6KbUn
         z4sQ==
X-Forwarded-Encrypted: i=1; AKwUvByC6C/XPJfs+RrUD6L87MdlpuPe6X5binBQyQ+Ocxz1JtNKQoekET1S379YLeSVspg5Qh+3oukUZsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9suX5t/wfHjQZ64wjRyzpJxpTSgV11Gx5oBeY+Z4hnx/3M46Pa
	8W6G2tzXyA2kvmcs4CwOb4YTALyB9NWQFiKAJfHPPIXzOv5EhQVyKiXk
X-Gm-Gg: AYBFou2+EIlbT+IDJmicgWpZfwftpepu2YQ1rEnoNpigxPm8sC4UGYMTBY2rnqF8Q0t
	f8+RnIVkEFj4egoykBQSxCRxta6Rs1rnwJKm3d8CIBgr3HXCoRoQOFpUc8S/jlU81xaDUJW0I+j
	9t2xa5beKd+EQxHqHCdR7z7srVJx8LIaseU6YO43tyFkWVrOiYU0qih3Ogg7PPngDL3FZ6BvkwZ
	UWNl0u96q6T/6LOtucz+v/n+IYfygOJqzfpNec/CoJ+2keTT0u4VQj4q28LG6GtzQUb4Ty73ZbN
	1EvKzbQ8GzrwQ53GC8CwRmeEPb6byRP267dYi5KKXnPAw9HFbZEQiWEtvnNaIf9jNaZea49uG0t
	/w9dSGcSPQEC8Op0nFkRpL2PrDUu/o/KBPZPNQbJcKFkUgaBVT/HrZiLXiSQ9POvsXlDsgHI4VL
	o4FLciGtmWQHY47wEJZquj2OKTrOByQUYVJoIOIdfuAWNvMtGdNBCwRKCS6f1fHgtorIqf33oA9
	D/Jq8vi7lt+i1SuD92KURvS3Eyi6fdAqnJwA4I+c+uNsJNLP0wqJIUyVLCHUWdOHAVwWJB08pEP
	MPkK4Py6gNEpaJbDoXtG/GBbW8CyOnWY9JUw0my1A7cTM1covfekfljAFYHBdk9SXbm6S41Vbv7
	GYNze94IP4Kk/ELCHjkJhhvBPMJ3LQtjn6uIQnyeKzJTUcL0=
X-Received: by 2002:a17:90a:e187:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3ae896f862emr13929601a91.15.1793837369930;
        Wed, 04 Nov 2026 16:09:29 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:28 -0800 (PST)
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
Subject: [PATCH v15 02/12] ALSA: pcm: report partial progress under the stream lock
Date: Thu,  5 Nov 2026 09:09:05 +0900
Message-ID: <20261105000915.15177-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105000915.15177-1-mynameisjune111@gmail.com>
References: <20261105000915.15177-1-mynameisjune111@gmail.com>
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

Staged capture can make readable data available before a complete period
has elapsed. Skipping notification leaves a blocked reader asleep, while
using the period-interrupt path for this event can infer a false ring wrap
when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM timer.
The driver must release its pointer and trigger locks before calling it.
Existing period notification callers keep their current behavior.

Atomic and nonatomic synthetic PCM tests reproduced the missing wakeup
and false-wrap alternatives. The new helper delivered 64 final frames and
reported four available frames after delayed partial progress without XRUN.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1182,6 +1182,7 @@
 int snd_pcm_lib_ioctl(struct snd_pcm_substream *substream,
 		      unsigned int cmd, void *arg);                      
 void snd_pcm_period_elapsed_under_stream_lock(struct snd_pcm_substream *substream);
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream);
 void snd_pcm_period_elapsed(struct snd_pcm_substream *substream);
 snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm_substream *substream,
 				     void *buf, bool interleaved,
diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -1919,6 +1919,25 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Unlike
+ * a period notification, this does not imply an elapsed period or tick the PCM
+ * timer. The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream) || !snd_pcm_running(substream))
+		return;
+	snd_pcm_update_hw_ptr(substream);
+	snd_kill_fasync(substream->runtime->fasync, SIGIO, POLL_IN);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_progress_under_stream_lock);
+
+
+/**
  * snd_pcm_period_elapsed() - update the status of runtime for the next period by acquiring lock of
  *			      PCM substream.
  * @substream: the instance of PCM substream.
