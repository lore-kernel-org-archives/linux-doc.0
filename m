Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466184;
	b=O2ZyxnLQHSUxLP6xEcIFtyEr0B+b8llz2ZOaQi+bdfSFqbkAzns9zr3qZ9dfvpZ6Xkfn
	 GbNjkvHWC8615L7XUdrnDivuppwNUIwODA8dVvxZkWaSUpbfE5KV1S1QrxGH8hV+Cz1DS
	 PSiaWLDE7GrHvwbw6aTgvG55asEbVjGSVZY3oWe+KKRUGnmeu2hgxrGSnTIp9FKJOUmCf
	 AOCdPURUqHC7NeW4QDGTfBv5OcOU0qckK4wOT2I7Ef+76ceAML3//9FF0us2vDBWh1pIs
	 Wr8oX8jn5UR6JFJF2BCld2OptRyy1PjEOFFuNNYc537tCgf+lLdlYouKYS5IXgZrEQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
	b=dmgBqKHkAtIISl0+gH7Jn7gK/ueT+EDCgbCK3I0hb3TXTSTzKeYg5LarZgsd5feY0m8V
	 VtHDVWPPe+GmxJ12gPTG7iG7nm9Aoz7PxwJK4QYaeikNWFiqkihHA5gBV188v09eMpvvb
	 n9y6NNq+Si63jaFtj6geGVcPLOUdGROQbnyxBDHEiU+JbGw9hm6aSGXwYFZ2lhC87hBr7
	 mBY7H4PloTK7sHUf9HZyuE3pOCewFtkrs46VDZ4CA0QS/vv6z3Lh8mUSGTJAcpBPbts1m
	 UsZ2kDcnw7j+SJ+l7zwKIg9QjYJNjEb6ef1xMyxtRAa8ZxxBZ3ADiWjTLTTLqZ3NVJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB93606A895
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB93606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPeEKIzC
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a058315c79so2056849b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466183; x=1795070983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=TPeEKIzC3PqINmM3ycLE9YPGZ/5qU0qGFTA0j/y9SwD2F+rZah/IHdWmVCykhyknwK
         J9Ym1q3wC6e8eevWqRUhB0qThnnahm//hb7R4TtfkfxLryPOI6EYKZnL6+6Ls9LLtxqJ
         2+gtN21rat6NTXLyyiZdRPP8CObKWuwo8RftamEqewpjhBBBkbzhDL/JD3GLBGqLpcHZ
         MzduxdSJ16OugBxfH30xhEyS5CAcZTYYqKz9+U9k/t5etalS9IwsBcR9Gk8vIvJ3qn4w
         zbKNJC2C68+EBfCDXCtuHWyDSA9dQ5ncS311VU96nilMOd3NqcRC9TUggfw67oa9xOB8
         t7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466183; x=1795070983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sSQ6q1+hzrUJLXDFxgCVobdqtJne/nbtoWxCk+WJcL0=;
        b=bSpiLiTe/XoV16sSUWuVgdwzLkHki6Ehu2vCcLsbzvOz/ZSF+Xn3nGHPyty7nC13sw
         j5VNJMOR/YL/ZRaXxn5Hu2BvtTUu8mvugie7w94ZMtHcuzhqIiKNRUTbJkZz9Ku/Xe+V
         8MYMwwlJQNwI1v4BE2JsHJDMD9bb1Lymphlmn+H9xylpnHtASKGHqItr+p+tg1Gf7TBD
         q1s32W4eSPNQyzNQ0G3frQtwTR1bpGFqE3JTaPq3vxIE4NGN4OYaPm10NckuHtJ51EJ4
         JrCcMZrBkA4Udi9J11qTesfHCf1AIXXck0Sng3R6U/mPK9UW1G2qCqvSaPJepCsRmcXO
         rcMw==
X-Forwarded-Encrypted: i=1; AL+hErF4Dk27IipNwM26n0yW14lDPHLwy48GGmZbhLSHOR2tJWRCHOvkgY0asBLcxYM3Puf+FxXwfcsHssM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6gjUAUGjdfZjC5rJcMTLuAl3O93CVMsLaIupfTbgyNBqjvMEL
	PIiDFylBmOg/FN7AAMQG5nxmDBrvZmkM1771U1ccaQNk63dGGsgYvZpy
X-Gm-Gg: AYBFou2jh5rIXw5alL5IlH1LVWSWlMPhNSLmG8g0vFA5/DC3dRfY6FpgnR0zaIpV1jE
	VeJRgOxDPCSYmIlEs4874IKXGIlgMNQ4UMOnKyXGs/z9l6PMnOOKWy6McZQJOQAohQUXKjZmzWq
	VTiQBdscz+1vKOGzTTttFfEDhBQFY3LUA+ZGrbtx2GLjF1W3Jk+HGc3okM4/uLCQ4zvG9KSijVP
	dJQyE0LpHQKT4fJrDI16VTOy2W1nKtyIulxd5EJqQdk5YxGATnsNQOwCgGRq2E/a3H1XuQLxSdT
	1RipNu76p6K5iVAg++IQdix/+qz1Xx2DwwsHDI+62dEiOmbO7fdB8GSGgSEDrXlK2yhFyIPOZgM
	N0W0DHa+2uKXw4mz226w1eBjGF4YhyoiZEIa4g1X1kW8vlJibKJGU25VWK68gRjlpvqB+HEwXjG
	MioHAjfaaMylq/rypYHMv1bKD+8ziatB/SbsJ5Db+fQqMeN56hecm1nXSO1K0pCC4PJKfqmwQj6
	N9MjOseDVMLLV079zPFQ02abn0XV5iBxxAHL3n0NUMh/tE2N7NZXmwpE5zgiUO2m6WpRMihM7rP
	if57S705uqMwcsIXwWC78S0fs118/FX4n8KwThESjtSIbJIknA/bIUAx8iCquFWJSb/WgwKw7tH
	K2bMPXSaqJpGytRH6LRmYHFyQdP4JNQJ5iVnPHtvEQCLd674=
X-Received: by 2002:a05:6a00:170b:b0:8b6:59a:2ae with SMTP id d2e1a72fcca58-8bc1d819c34mr4549542b3a.52.1794466182900;
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.49.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:49:42 -0800 (PST)
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
Subject: [PATCH v31 02/17] ALSA: pcm: report partial progress under the stream lock
Date: Thu, 12 Nov 2026 15:49:14 +0900
Message-ID: <20261112064929.11211-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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
