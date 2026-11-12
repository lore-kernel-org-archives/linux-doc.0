Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794444438;
	b=ZZ0EahNSfjXqTlhTBFcgqKunEWWyywq1bBUvAoa/jFzCozUD7Is0e+HW5ZBerI4+jQGx
	 rTLmNDigQVviwaHXXZ0TuVnWPaw2aU3lofVWEMES/k6vD01VOZidHQ/NBZ9WsADcsO4Iy
	 3ZHrZsVqnzE2VvNSLsA4t9IXhBldvnmlftcyhqgvx5zhyPO5farmO/nOQn82NYbCdvfCI
	 ZZsi5DHQOCauxboA7SdIAjxGC/8qmb8nl1zCw0eBjaA7TnbWPZ+6SrTl3XiReTmkpAM0C
	 9yE/CItkBSDPulVEah6hBnI9OC8AD+a6T4WIXhAbaFQL1S2GNLArLr0LZTRaH1HyUxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794444438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=D35BCrLco+QZ2NOgz5b6nVMKauDoESVs/Aei2y1fg3Fl+iOYMVO0yL9YkGlZZaD15eF6
	 IJwCHTNW91OvIUjyx59iWBVC3RcxU7rhkoK3z/veOACRZlfGiGiAps7IR+qYMrZIwNJ78
	 YH+XrOw0OM8nFXFSBsHzgO4T3ahehqzHk+TvUmnfHQuGuaphXrLOi/ZJ6vmYTOlrVP4AV
	 psHXCzItn9wg2jNc3sR1n6LQQJ85C5oIv8a969Ixmhwo60Hbk05zckFna3TR+wsSa4emS
	 s5Y/bqkoanxvEl7yS/5rDNaO8E9yTk+R7S7JYd5Z8/f0r1GColfGSbst7q3pPAB4Nwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB1apxmH;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD9960A2624
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 00:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BD9960A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lB1apxmH
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso305382c88.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794444438; x=1795049238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=lB1apxmHrCwZhrXRpvyCFFprBuPkJUYIjF3kQrWodGCRO0GGAFRlbAayxtEOAgq9LM
         jQof953RhrkIlj3IwETil55etre8bbHSUYLnoa+Cbh2smMifUW+S/qYGo7Tm5XsqThfm
         VGQSvDFo29ymda0ZF8Qjm/YvZJbu9ixf6guktXT0VzPtc1oANMvxfC86q6HCnE/H8swo
         vvyZGc8ApzdrSmYNfgPNld1+08xozxqjeM5S9HlJM0sihYmeaPAbc/uzQnsbF2Genadj
         o1UryQY3saJaAeyVGyRQcWPJoi7UZsUMypEchMt3wQ9cRK1B0zaL7aKIaRCRtpqfQohs
         Os1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794444438; x=1795049238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=WnLliFZN6Kj9gWe0s7+Rc9Wj5abVQVCS+kdb1gYc6+ZLkcnPsRwGBscaub027k+JLg
         aHkpTVJTFRmLM7j/imCgQkQWcSdXzxm+O4AWKDKewJ4GzFlP0vp83a9Pf3mB8Wx5ogQ0
         28FA8URsDpifD8dWTuq8zmuyN5SCBDv6MY/QO1d2kxCzudKc9d3AU54BUlN2h8kOQo4T
         MYNd547UVwEjia3NAjX5yZEtu9gnsOIEVR+lZwvRaOiZXsE4GaL2ll/Etci4L0aJsD/A
         nzmlTJDGtT/q27DPF/P4v+fXiTR0tibwJwdYY1DcrQ8Z3/S0ME3FV6Q1T0xiyETIlw1z
         T+UQ==
X-Forwarded-Encrypted: i=1; AL+hErFHAxuSzmekVQHTmChyAkiMkxxGJB7ZNWWIkmgsrv56MtXtiO8+YW4vQN3zVUWq68S/BjX3jveXYXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ywg/rtYzRC+N+aF2EPwbx8vkzpW/2VdfXvg/wIFOg83Mt+GZW
	T9mjSCHV74PlLpOlRV+g+6tVV/njvweJObXEfwJ+N9VV2LgttESmxtA/
X-Gm-Gg: AYBFou0jFjhKvLRPkTe2XRhhWfsLJynHI0A8A2IKVROqGf7lIVDA88WXE+12KbKeebM
	wykEPVOMSGrHtlpNX3253JZjzQJEEKWCf6i+Pq4GN7zmMTqZZuWgX4Di4m8QW4ZkhRcg4nS1Isq
	T26N4WC3IloulByZehnDKHGXpeorC7dlxqMYzAz1hAp3ezluB+RhYdgzs0MxK5LiqGQf4I24ZeZ
	kiy/SvtcDxa964BcgrgCBeKWFXZU61sxGVooiIWxCoG5EK0H4nqeVEChHxhNGdP52r+nG6RwJS1
	RglAnk3GsuGguSeC9T3GmOpZ1cgo4M4oSQMvdL9U2eokBHm62DJCArHj6DrDaWd1T65WnkpzbBV
	IL+asBvXahXz3mHv2cIAnKXmM7fmzbhkj/yMBPdWHdxotDZH6exGfWg8XZ/CN3kBAW/f6TzCG85
	q3BDJ2om5hU7OCeCh1F8oUhFiDaTw3CEmxUvENjjkoc+YNDbBs/m6MZ0i+QNx2AO2uUgjk5lEkd
	Yz5EYhQ68KjKw+wOaC6SapP7H1UJlSkygnC1Pk6la2YC97YTOrUMzYdxPwdOHjCcnyg58+40RVL
	PGZAx9UvKkXr8xnXxNjPKa7g3Xp5GrNtOs1TH97wZuVSLrDCgsu7bMOXG51demLWs5mYZ4viN//
	VTdaaWqguzD1PvPdyD97b7vyUN/Drdtp4go2guKSfEcbaoejGkIpp46SZbnR8Y0FLQzEf
X-Received: by 2002:a05:701b:42c5:10b0:14e:61bb:ec3d with SMTP id a92af1059eb24-1b4f5eb2338mr989131c88.16.1794444437591;
        Wed, 11 Nov 2026 16:47:17 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm20672163c88.9.2026.11.11.16.47.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 16:47:17 -0800 (PST)
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
Subject: [PATCH v27 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 09:46:49 +0900
Message-ID: <20261112004704.49758-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112004704.49758-1-mynameisjune111@gmail.com>
References: <20261112004704.49758-1-mynameisjune111@gmail.com>
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
