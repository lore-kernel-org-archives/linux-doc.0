Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365830;
	b=uygNKtdhzarpM1MxE4qIoDfEZ1CtzDnZrbWsRemFKhwDpp7dHUEaZ/BJmUJKufSkU4Kk
	 /M7xV0eNnTptE5RzSv2ZAhEPfeUt5JMDx/3J1OUfxLJJZe0p/U8IBELxzRwn0Nc7zpGDy
	 c5j+/ywD6US/wQs4JmIGgyKgYarIMjBFEPaVvgLhWbSRlc+pKMyjkdCnXGJVliYeY1716
	 cVODzCa/Gc4z5AUBWqETS3zisO1ap8wRTBGns3vOr4LWReT97ZyVfRaIq9r5TggquToip
	 tN6SMn0wHzFocJjlPcUQ+z+rH11s2OaOI42fU/Brld8zOSs29inqv7iOq5nimGMZoEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365830;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=N+/rMzJ4wRi7kajs5X2uAveWngAVk4F+QwE/CCVykSey5+tF5Q5YQZ8k12CboF7XWIkU
	 CT86dHPLpNpU88xeXQw7LoR4njf/21tFLgcAXtZDot7u3NoGN5BojgKHrbPyhFmGW/UKt
	 E2QJ/tf6/AfdmY0LuCVxBHVI/b8k4N/07/+acEGw57xau5lryjQs/v9zeLwUQCRRuliIY
	 8uQgR5uX3MsvGh8xkA5983JkhuNOddI8fxtMgXJyAtRue8ws8zReG33j4iV8THe8IIiPV
	 kxTPeQU4GIxwxrTkUGPiRzxyDsalHA3uVAtWyB9/T6xMh02f9AqlhhXiLfNFATE7x3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="i/O1hdCM";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F98606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 02:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31F98606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i/O1hdCM
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso4190379eec.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 18:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794365829; x=1794970629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=i/O1hdCM1OP0BIqeRklHLj0jJ1JvJ1PdPXkaCIcKxB2++2hRYTfZbkmvQtELZQZB8n
         WLVltsVnPhPOg4/NRGu441B/+qD75ulcPz9OQDYiLqnjzfSpy8Cv9t+bcB8fNo8L7hUL
         gaSwZ3MfGAW3Mc1fk9EtXe+Ev5+2BK65Es7wsE8YrJn4hM7s88AMHA1qb8/roGN3gyEC
         5nSdNKEWs4cGSEtrtbNadxtctg/OixaDAvUtp1knhHIBBHs6wvYyXxIwveiR9uQ9kHMy
         I89e186LG47Wm4BdAQ5GOqasFVZNUayDMsmE+2vKt9y8ZPdtQwtokrsHCjNRg368/L+m
         uwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794365829; x=1794970629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=IhX5SvFPrCV6yk/SUAQ8e9P7p/g+8zohASuZGnKADdDtRy1rbCfBoXZ2EGW5yU9CUz
         +gjfg6MZUrCQW5pnDDV94CBtg+LpqAGQJzCVzwlp+KeSNBBgZZbQcQgeZYwddb9JR3ga
         eKgPLsC5nZizcfcm+A+hi3shKfSjAczWZZZmT+jx0cVegwQhwEAxSt5NXJzfRUqxvwMq
         IgsyVNN6+lu8xDdAviazynFJCHsRwC8WE39w804ha9KCrf8ZhAYhBpVqY/rUdkNTn1aK
         2AcgZjFPw03bmDsLxGgSjXIUPcJNMcZbLkrb3rxkx8uYuSsKcM96WdDqZIRyT8XsQnfy
         8d8g==
X-Forwarded-Encrypted: i=1; AL+hErFyGbyJ6/EJfR1ONE9DxbmmrVyfks0+8bUDJMeSxndksxQoZ7XvSaI59GLdLr17m8EcVfHdoGA2g+E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mZO1yu4qxcPoeY+3RMrX/GB/pxMYmfhyNgqm1ecAyqD+4F7fR
	YA6IMVTQE4+dcBA95c7gwc54/U2sRgUJyWfyB7XF1/OWi43GziLgBCZA
X-Gm-Gg: AYBFou3T5Zb3w9TsddpBpTjMvh158aMXJRm5aKvpz1hoXMje+tKoFkWn4h+1Mq9qOZf
	yH5AQTJxz+xgNhwD+m/XOS8pndJgnh+lgyD2B66bmhOtLciQM9OPN0NIzBGllusKxxXjEpxawJp
	RsaSvf1w/ZIVgFQYVdbJNdxvdZYcHQkIcnVPHTWDoHcpm/SD5VA/r+wVV0EvG4AfrfvR9rqZtLU
	XBbwSQtUiSkF9wdleksYgWEv6O5d5NMVVhPBS0i8tXF7Gcz5WySjZA4rfk6Hj2Uk0Qmjyw674vs
	NpW12BqJGh2InOz1jADcxnNB+/HbAbOHg/vwnCTwocg365SZgvu5I7ftLcHtBoYh3oeowZvo9t6
	Nggqjb+vHu0GXB+g8z4LsDL/rMetSRJ6Xf0ZyY/Hr2ko6idwBsrmNKPENluXqvB+knQppDvWMP4
	7/t3Zf5AgQs0JEStJKflgK1WiXYg67nT3JHyIet0pGk0H+LG31GeQ9WRB+elwNBu5s9enwJYWdU
	D69+zQGL1xMprjojDD3S+3n+Z0J74HZG8dkUzVHBAL2+vPKnDeeVCEoMP6b8/DM3iahggQ39FON
	Kg0ZgYhfyDsM9xpe2MTtDyVamQ+GeMUyH1VVWQ9nsCnY3K5pNT/oNs4Kl+x0hAks4FdOH4m3Hnh
	XVfDgQNrHsqoDaB3iRZY1aTmufLpIHoLr7cjXFdYrvcHUF1w=
X-Received: by 2002:a05:7301:df4c:b0:36a:270:ce76 with SMTP id 5a478bee46e88-37686c3b606mr1546950eec.33.1794365828493;
        Tue, 10 Nov 2026 18:57:08 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm12390018eec.17.2026.11.10.18.57.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 18:57:08 -0800 (PST)
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
Subject: [PATCH v25 02/16] ALSA: pcm: report partial progress under the stream lock
Date: Wed, 11 Nov 2026 11:56:41 +0900
Message-ID: <20261111025655.63951-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111025655.63951-1-mynameisjune111@gmail.com>
References: <20261111025655.63951-1-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Handle capture DRAINING separately in the state update: a full buffer is
still readable capture data, while progress beyond the buffer capacity
is an overrun. Playback continues to finish draining when its buffer is
empty.

Refresh capture availability after the unlocked copy and application
pointer commit while DRAINING. A final tail can arrive during the copy;
subtracting only the copied frames from the earlier snapshot can
otherwise finish draining with unread samples left in the ring.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   40 +++++++++++++++++++++++++++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

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
@@ -215,8 +215,14 @@
 	if (avail > runtime->avail_max)
 		runtime->avail_max = avail;
 	if (runtime->state == SNDRV_PCM_STATE_DRAINING) {
-		if (avail >= runtime->buffer_size) {
-			snd_pcm_drain_done(substream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (avail >= runtime->buffer_size) {
+				snd_pcm_drain_done(substream);
+				return -EPIPE;
+			}
+		} else if (avail > runtime->buffer_size) {
+			/* A full capture buffer remains readable while draining. */
+			__snd_pcm_xrun(substream);
 			return -EPIPE;
 		}
 	} else {
@@ -1919,6 +1925,30 @@
 EXPORT_SYMBOL(snd_pcm_period_elapsed_under_stream_lock);
 
 /**
+ * snd_pcm_progress_under_stream_lock - Report progress without a period IRQ
+ * @substream: PCM substream
+ *
+ * Context: PCM stream lock held, with no driver pointer or trigger locks held.
+ * Updates the pointer and wakes readers for partial-period transfers. Capture
+ * streams may report their final tail while DRAINING. Unlike a period
+ * notification, this does not imply an elapsed period or tick the PCM timer.
+ * The same pointer, trigger and timestamp callbacks may be invoked.
+ */
+void snd_pcm_progress_under_stream_lock(struct snd_pcm_substream *substream)
+{
+	if (PCM_RUNTIME_CHECK(substream))
+		return;
+	if (!snd_pcm_running(substream) &&
+	    !(substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	      substream->runtime->state == SNDRV_PCM_STATE_DRAINING))
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
@@ -2405,7 +2435,11 @@
 		offset += frames;
 		size -= frames;
 		xfer += frames;
-		avail -= frames;
+		if (!is_playback &&
+		    runtime->state == SNDRV_PCM_STATE_DRAINING)
+			avail = snd_pcm_avail(substream);
+		else
+			avail -= frames;
 		if (is_playback &&
 		    runtime->state == SNDRV_PCM_STATE_PREPARED &&
 		    snd_pcm_playback_hw_avail(runtime) >= (snd_pcm_sframes_t)runtime->start_threshold) {
