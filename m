Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461701;
	b=N9WsGkIWAyYgt7JjX/CfehkjcO+ZvuNbIthGzLlxwbAMHIB4Yh2o8G4Wi29dj+6R/y9A
	 WUu7JNRm6Nj2tNc3hloylouGTR4tQokewogRCdkvrmQZopx+j57vCFbx8CaIbO0lSAcN4
	 Qghv2Inj0z2iDU6/kS8l3Rp/UD+Z8bHlUDL9uZIcUZVP/x+CROeqJpSEEmkrUHQQbfjct
	 Gs5sgNGUxqgcZQ3aDXXD7j4NuahMYtmIkDHHtOy0K5SvY9albYQyVNpz6LCZgZt2eF4mh
	 CN5L0dlE+uLEmahK+OsmSZmtq8+AtdZO3JJuMOf7FK8+9GPSVxbVyD50JIuM6JF0IAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461701;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=BiKpRfTexpn0JsPS8/J1vWyP4RQih02NfWps9WvYKV0Na5U1HMhhzkq++G7VbykmYCfE
	 GSu4qL86o5RArCiy2lTwCiCTXhPgkVwev0UTfzrgUjqy5kSpog4Sw1AGULSBQo0vbKrAd
	 DsiiW1Inam/InN0BVBjqvATiRhJJarDuUQeCjS+wSj4/gA1XGewR+xYzpwegLdqOlbRrX
	 sz3rneiEgxroAKxJa8TvpKOaX8m4IIpknyPRg0MJ9vBUkAv5kzKSA0/HRr09MsI1U8M5F
	 KC65hCGi98L76G0lbuYkYgZai1CMQlhtINTakVgNVux/IvdWA/vKHaS4bgkDl1m3/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAA6606A893
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:35:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DAA6606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Qa3kF2US
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so5790418c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461699; x=1795066499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=Qa3kF2USmKyC/5Q3KK94fMaTXqGaTb3o04XoFeLwdpLzRw04MN3/VxM9g7nzqJApa3
         CwwK0ypdlI4ebXM2B2Jx6JnOSw+viS6jGFZMSimiCrcmauAZkBGQvsmXhRgeaAdxVyAi
         e4wtz5kLsy1bzqHFAoVlAOzDzqSVemP+cH0dLYJAoFWLzB86s7U9F3v+QhdYB8rJ+yFB
         mlTtuANbDb5Yi0OWqJxGGLFfXiVTqMv4lrGQwt3VeKqvO+dfoUn7yXJrsuUkqEfPopgQ
         pabKv613uDAat5NHEAHPbZe1sMJUXpBaRQtonnDD92HX4NcgwFn5GaGwi0FrB7rygki/
         RDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461699; x=1795066499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=QTrAVTIaneqqeL/pYBMWaFkN1BzhWS22+/GfRF1DjRlHjy8YibJaZYLDA7h13rgPRx
         bOVCPeo3WGr/WFiLJ5EEiwfNEBT8G8ZCJ9ogPkXpsIIwmApWAq8vr97CAdj6VD2phHgo
         sM8pytNz7Tnww0Nuop3WU3MsqgV87mdJJB/BLkOcACXHZuIBPDmE89pNjXbzdbLP5rfA
         33IHORoMwluK2BgoUfCGytigL34T8BLK2jtoZzHQgvsChKvWv/usNOH4OZBbQWr6MUZq
         zN9jpALXPWBpx4yVZhg00shgjJ4o7s0ItkN+ZKOcspzV8cEcKf0BIxQduLnQLTMNreXt
         Y4Eg==
X-Forwarded-Encrypted: i=1; AL+hErEyWQa7nu611rMFqCf+/AvNRuj/PIPNhQGtkO/M5XfhMW5OG4dW2mp9NO5D5L3PV+RmobkIa07jTz0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AHukyocvflYkYDIAd4eIr51kBmUzgVL0OTeojyAdnvhvmnSat
	sPc5Le2UAWecufGkB9gGDKWSFjIVGBCTHBcCC7FO10oKZSztTE1kf3Ci
X-Gm-Gg: AYBFou1eJYvNj5stvyrEf0jf6DptNl8/nK9XcGGdKbMesSh7288W8q5qdmHVz3gzsd7
	qa4pe2gZEN2SVIgGrSQjjB6sntQ5ykaabVELuAboeH6ulXy4nyyuwgmnb3r7UrlGLbQ5ELs3OEh
	fcm1jtHlDO6X5QrONRMx2VPY0z4pbuZknIvj7IOHj99ybEGZvU2yRJnwehj2fRiWe4UjJ28A1/2
	XMrcVTFpP8kfxCZdgylHgVgVmdj0G1gMUfGjME0NnzTU1BpQWni7NXZ8XGQxKvg7uh+WvqF8un3
	+3D8WB0YyWOK7dN60rvJuY8Q4qwr1SkFEsOc3fxT+eTKSM5qqi77MxcV2/+tuVkb0Nu8oOTS0Jf
	8bPe5iLwj1XTGD56GKLqRCvCS0oy8Ec/+84P7m4rFIMU/exIj+Ja819yKMWL1Fl/ZzWtQAJINhy
	a/EvvQQjUwOr2mghE76WZXKQVbTFEiSBDj0+7aNKsA91b8HbJxxCNge+DioBUfyqXKn95xeBidr
	gFVz/B8hvxTemoF+hXZngZgSYis77hOqciNo8gdqr2fvH3+8V02386Kh8T1/AS9LZMkQXaHJ1ua
	M8Iw0jyH43uQt4UbkVg3jtJAqWjI/MCrdBNm7cNGBbBhPcyZoqFg6stJO+d1JQ+/Cw3E+rhJ4WO
	6ujrJoRqP2ILlT/GHFKa6O5HKtQSxyJnSKuxOuJsLZcYjAHz4
X-Received: by 2002:a05:7022:e804:b0:1b3:755a:ec49 with SMTP id a92af1059eb24-1b3c03527f7mr4578437c88.40.1794461699106;
        Wed, 11 Nov 2026 21:34:59 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:58 -0800 (PST)
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
Subject: [PATCH v29 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 14:34:31 +0900
Message-ID: <20261112053446.73504-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112053446.73504-1-mynameisjune111@gmail.com>
References: <20261112053446.73504-1-mynameisjune111@gmail.com>
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
