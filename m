Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458129;
	b=pp+m1UfNsMzvmAnIpEXISEBhZpVTsuGhtJT7oCyU2tm4y9f40cCdeakFGRylUK8h4LUG
	 Gp5avRyubA1bKReMAjJxEE39Qgf4hqQErA3O2L0s2MhdIlPEQlVdtVUxLvZNTiiVTlyoW
	 ncazdjaUiXTPwmK0qI7C5DShQhoklQSkMdYTPzz6joHkOxFhz3twSL3ggOuAFiEsAm/xL
	 3hY+avog/xrsrni3ZiP2iM370vazGaAZqz//SfpHO21q6fIcic3KRbPWkDbbH13nKtYfS
	 r58udM6tSbjz4KlV/Cpi0v8+/FO7lJx1AjUaBTZ0uuLO1q6YtCXClg5narUVUtPSccA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458129;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=PScAUZpQX1Hk4KoG6kU/Vh9e0YVG+d+MqSSYMj6+U27xrQOX1VEb6SbbGL/cLu3pZcYJ
	 45BVET0i0yT8sZQHbTgLdrGDm/rHIAbzBX5H3m6DORf6fGQkySgxaB6+2yJnLjxC3k1q9
	 3rU14bQab4+jy61alL10rZUTeZAvDA88fqiu4k4wDuQrGtwEzqYEeV6mZxe2b7FzH398O
	 hiACyItpEiOcHTzabDoY9sEw1d+ysw6+WI/YjqaXBhKk8WVwQOkyPb1e3rDcQtYbsCP6Q
	 CpqJgGvRLxTSFy75e+onC3qs4a9brsHvyzohmw4criv/vr7nTepePuebot4H7ypTpdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C06606A890
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C06606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EcCF1K6I
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so1610924a12.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458129; x=1795062929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=EcCF1K6Izk8f6rPi48OSrMcAcUtq69C6Kzv2CQNZ0IJYlg38DiZa47nP0T1LJxkJYp
         w6H+q9e1kU6u8fvgkHXD1PeSdHxEeB9VeqGe4q/7K5h84CN6WMOWTbPA2pxzZ4qdFeOB
         1UTYRyljJo1tyvkQ3Aw36IFYDGh1wsJV2q8UkVu9hVNzK8rBVEz1MSfEd1CvjuE7VR03
         SVdoXwL1ddr1UcCyBKXwgdGU5jlRyRTLJNrjwVO8548KI+HOfQnihLNFhn5bxyp6ui7X
         Es/IAJzxY28bDRomKXa5K9mWAXNkxtLNfwFqK2RLdzD22clRJTjLbUmymvvwHxczaWYb
         Ys7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458129; x=1795062929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=IwxF6q3gdQ/3xpH2LooGsCLoUjwud2pfGbwSuMi3CCC1q08cbTTSuxzyfZ3jOL5ThP
         JT04mxCszZXfY9qaoPv3k5W8MG/dxtep1LfbFfDofAdiSDbXNZMdal2PhIsSBUGFXkcv
         OnZbRoDyqCde9FbfDBJIdjJt4xcDbWT6d2/1vm1MCsrDuk/eCYlJSxSAOWr5Fdvt3C++
         mXUxBYJdzg9g2pMpzBb40dMWk/vlHImqPlo2DXjPlkWE40f+bUs4bGvlDr2k//bMSw7j
         s3KC4HughIM/5d0O834Kxz7XPUTOA51l6A0z0h2QLjezkkeZQav6SZiIGINBKmXCCGD4
         FqIw==
X-Forwarded-Encrypted: i=1; AL+hErEgKHnDV4wk4RkV45MMuagUaW3peisNdbHz7IjfIA+6wa40gwuTCpna6De9y8UQSHGciJK56kh6dF8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8OjBP4YzL2OHV0eUGDNresl7gk0uSXNll2l45UqyHdoAiwTor2
	sFfziMYS28IaOZ1BMCLxCcdlzYnlCwB8pe9UnWoSFQHtYkoAkSg1svqr
X-Gm-Gg: AYBFou3u/AtfKvmO7tjYGA+Frn9uQyJ+ehjVPsgqA3GK51H6YdKLcA4NhcIRDsvB8Kz
	QqLs57ocj6gSq3aGZWneWKRrfx+GmUCbhZpqQ7JZB5qkRfDAB9RhVscTdDDR9fG6NO0MrOz3+qb
	V6yDyUe2qmG3GK4NEot+PUWuIQvlIRcjY5Ml0pelB/bKUu7GlNEPnFo4AxA4l0WN3EU28xxcRch
	slbkJKqJYVM7MFw/CuFCKZvJPpiU8twRdIflJOXdl6lzgvURinrfsD0KMDWBsF94GjctwHYIwPt
	gD4kYaOTeiLlDmgO21yjEIVlrB6thEoSjKcgqJ6urUH/VAhxsHX1oD84qM50AASFvcXGNg2inqP
	k5YeMp3oRsl3ZIwawoETGdIQiMOy5qriJuACUhqIUd9k3AqTXuDIRVHnC9vix9fCAs1JPV7loVi
	OnxybSHiaILw32RpOLW8PPj4TScZ4x9m5WXrpjRs6BI3HpM4Dlo2R6gybm1UO5WM11+W6BQGTHo
	6EAdyPMcswTwgBmdOCWU8tk3T4SrC7uXB/XepaI0b/nqifArz3lm5LqRBomNrLT1L+AJFsAx+bS
	8UDzEeKCdKI+baViA9hvlR0fsGtD1Hsuw29Qf1Fx1XRaINqRrudgmNRHKT1ie1TPozG9YAqxcfx
	VLb80DEY8PW0gU0Pc5Mxuyv71liD+JB78pf7dlmsH7y9h0xeG
X-Received: by 2002:a17:90b:3901:b0:3ac:7874:639e with SMTP id 98e67ed59e1d1-3b182f6384bmr3693962a91.46.1794458128581;
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:28 -0800 (PST)
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
Subject: [PATCH v28 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 13:35:01 +0900
Message-ID: <20261112043516.37010-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
