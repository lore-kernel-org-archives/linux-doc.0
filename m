Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267664;
	b=HegMlvICqY6x2FepZmnoODClWtOkS9iIS9sJDk0h1UVx3iFUFds+zgz9abat9H5V9I/T
	 ZXEEimsww3WhdSJFFHIpQJIDaRdblHx9kATNjTpTQKqOx7vgEABgvU/xdYKqIXSVoY9QD
	 OiqidYU77JounYweF5laodeGYNXE0g9A4nd3KyISGhliARMap9bA9oRDrFoiPN+Wgij+R
	 yLc98VSMepFSEir1ITky+qBI1DZ1golEOSFOVpmk3+GwyZddf7t4ibYfajen6e6NzOiFn
	 9V3QalRHpdmj7JtYVi28iqVK09CaVk8E3bnNc2e36ezlv0pm2MOPKtclm0xzFdgVNsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=iDTyHG/uWycCfhDN3r6blfM8NOHZOtdt7OvbP4NpQWag6GXdTi7Qdb6Db57yrMhc3SKy
	 AsIvNi9qgYDgVIVXggfuQhu+1d0t70tYbLYwT3vqQIwGZ73ar6dj2cHoMklQPRt3Kxy+G
	 VPH/iHK2igen+1fUBNLUL3fsJZRNAzQdKZed2z5mUduR0+P/u+15P7zxVu2uwgjK8Hu8H
	 X+3EewCdoS4frEpMweDPdZKGGXqmbW/h6XNi/mMucy3+kmhdlwE6Epv3EO9EDneQG+TVg
	 ijACCXZTCFh6aQInz4j9faXYErDqRfb/FHPDkZFMSzdYaWiuqwcybhNMJLgMOX78RSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15793606A32A
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15793606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vQlG78H2
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36dbde64409so2746497eec.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267662; x=1794872462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=vQlG78H2my4XhG4ZqYO+LiSmKyKJxSB+VDFJjB8p3fCcjaVKLBbdZWXpFzRHwfQGNw
         GiC2PeRe2HQnrPpXPnQHPtMGWQxl1D84rRMBzVJqwIb2/5Wk0FvVBW52adlOFRsXg9dY
         kOSLD6HGzZbbb+cFyUK5FpurUxUoSwuoCCB1+apvr1Xc1AOFZ1L7g71jTKpTwVm6MfEw
         pifQpdCRyxisOYZ687883L4RBYOgd4yFasYYCiIVo6KdzEIsdkunQCw4iI7YL16Xp1S9
         Y/fHfvG8OuSOxmf1Csx2KxHXH/AaUcTsoFLnKFMXL8EBsf4fgLGkmj9eN0GyGjTts4DB
         VU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267662; x=1794872462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=ttuieLg4+HQXTEij/YDkGVDat2Bip3dyV26EjotVrWN84FA8znh5HdX0Qcht8mVgJu
         XgE3uoGzw6D1WdnzQXj4KJAnqSuI2+luSCnQ5Fr+3rZxBuYlxMY+tVNaZxoePwW3kTeH
         BMZ4aWE62flIiVdgoaqS4iA40DM8EOEN/+TLbuoh5gCVF+OVpxlXLo2G/5/8YxOxPP8/
         1r5vx9OCb+dg4OtPHrS7YpJMr66Px816qCS/lKc6sBymeqpnsIuysat7e2h3IAdIQ/Gx
         V+TveciSOJR4KuFksYaLd0JskeRXZCWfcTBmGFa0HU0JHqZkEgX2mEjOfm5I6f9+3ztc
         JrWw==
X-Forwarded-Encrypted: i=1; AL+hErHxnM3xU35r4iiYokqH5zsxTLriRunYieNKxtHQWbaQ95gCmaO5JNrhjGv6qn6QGHUsa4GxTquSQAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uboKt6UWOJb+zz8vs85KUXA6ehpO9Yq8171N5YOSDuN8fhr3n
	mdIqK9UsovLa+mB0ZaDHuwD6LG/N7Ef/meZe/VHf/PUBklH9cy9DmppC
X-Gm-Gg: AYBFou2nDK7G/bGT7SgWU5CNPFJWeBveqZF61bkMpEM41cXGXaihgCz86blmQ5wJRIC
	uMU53DGWqlWBx8eqwVykxBSPDfTUiSHxLMjqIWMIb3YElUurV9wduIdWk0FD2R4N6qIN/OYmaMM
	Fo0BKbQML3QHcm2b/1eau8ylROdhqW7CY1U0NxK3aZFerD5Go+xSgmnqnxrDghejhfsF8/jn86o
	YGIHFuiTPzES32vtxtNBTjEx+ezXbUG43OqerwEcb3B6nMbq4YH9mNiX9qbT4S6tj4pxJSTEt5S
	EUusM4G7rk/NUwMg24mU4ZmoRZEzApiZ/xGtb+LqgOJidz+bZGvUeb2S1gU/4EUX+ZjJchr+6eO
	m1cnx25NchH2Hv8khqTk+fCLO8mS9tKoKlssLrMLyFmT1dSnXLp33Dg602yX86Y4XIkMRfh/Z29
	ANSeytCIMPnMNLXrenc0cAb5Ii353KZ1aufnqhOnOU+UDjog6iKupb+FSbeVXp2MgeG4j+fqfQW
	qjIqvM3UXgP3lo2BPlu+m6gF09Nt0HLZk77PicdtcfDal+ICQIFFlBpfR+HRJkLjTSP/zwpcOGu
	sRy9hGgqu9Ks+Bsol0zp0wmTjWU8WIwAKpiwjiwlR/JY8+s/ikr79+23+8wVLEetM03hEdNEM0E
	kvUSdNfio0Ks4hvwb3s41FC+62GDf5tVUQi11kQYzXr9Ab7U=
X-Received: by 2002:a05:693c:2a12:b0:358:8f02:e0ca with SMTP id 5a478bee46e88-3751fb32251mr859755eec.9.1794267661936;
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:41:01 -0800 (PST)
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
Subject: [PATCH v23 02/14] ALSA: pcm: report partial progress under the stream lock
Date: Tue, 10 Nov 2026 08:40:37 +0900
Message-ID: <20261109234049.79534-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
using the period-interrupt path for this event can infer a false ring
wrap when the notification is delayed.

Add snd_pcm_progress_under_stream_lock() to update the hardware pointer
through the non-interrupt path and notify readers and fasync listeners.
It runs under the caller's PCM stream lock and does not tick the PCM
timer. The driver must release its pointer and trigger locks before
calling it. Existing period notification callers keep their current
behavior.

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
