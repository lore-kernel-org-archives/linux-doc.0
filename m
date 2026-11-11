Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355557;
	b=hoa5kUDH6fQaMDq0w7TZWRpl3X2TZcAh8dVsMf0xjNYgfmIuI7ISJ9vuQqvlrdBEs659
	 gUIhAIjfKI8ijTr6QqyoL+YicBctDcsO4UjJKp10zGm+G48v74YSllP79wBDpknNeLwHz
	 Nv5L2XoYMdDB0YsrNe9OcUUdVbaWZduloQchsVRAuW3LBLT0+QqsvrX3eqiW2yUmGl1mS
	 VDyIhInAJ1U/Tm8q5XHAT2gjwLfnBKw+8GHnw3OnQDmUGzmW0GN2MSnZsC4/yH2mYrC8a
	 q3l32pHAPbyprSF38RBDnEubLkATmEOvoAFeeHV11lpEiFVY2O0ZYGBmRVNvIWNMrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
	b=pXtM07yUZCMQ8NtSdUUWvNULbnZpyHnigDC25oCxmOZSAlTMzIkY5yfpthx8G8o95TQ6
	 2cWlBmxp2pfvII/BfUT1+P2Pqke73NkdtVEtEQjtrN8ZvEzhYC2p68aGtlWPR2yoaX6Ip
	 wiCPt9T9dfafkX9f2uco9PNzdJTNTrkzdoEtd/Qu15O/KPYuyHjk1viBYZ0hEFUazsWQe
	 4NIYMGLpcW9eWZsaZov36LFadaVgCt0Lwd2fmWF04UUOxMI4Cm/OmOafAt9Q0EL+YYoKz
	 yOeAq5/+6MhZWok+EaG4/XznZRuRGJ2zu36Fqd5jbiCTAfEKP7ch6dNiAhpbPEXDIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099E860A2612
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 099E860A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TLCiXCou
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1764363a91.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355556; x=1794960356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=TLCiXCouxRQsySRLF4jYb4EARhU/XvlRWElzYhgGKvt634MXWfsCR5W2qWiQGNiB+S
         RByd8Ib5etlaMk4WuH639pCCns/bU188ErMFjtgMAqtVWTbqk3r48R/1646DasJSB5jw
         ALYPokjYhOsLTpUots+SFMfsXC3scwrf+P8VTj1BHaUchkpLryKjMlyEJr1jQaAUI+yy
         Xgv/2uW2w285W7hzy7xRdw/hkkNtQtGNoW/kTd2pa50+5JBOcd9RGfFW/60wNXxRoHE9
         WGOOyLg4/YMrGs3aCiNp1Er+nfhQYFPOTY3BxhR7SOT6cCAU1ARPK/BgqxRjRzV9TfmI
         /XCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355556; x=1794960356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QL7qMQJCM15dowTzRdUWpkJm+YzN+M4BPLeeodrjsps=;
        b=qrACHE0sYLkoK3fsJF6kGKUifcfykd5OZsz7dCPZRLOBNXed36A97rU5FqPATpJtlF
         0aMm0gTX2W+ph9wNf2Jm2LOxJ4Y/vrqumk5rLrX7nvnn4qX9pRnp7Av2n7Q2DsJQTBKS
         9wSKfByJWcxWqFvo8gcOC0Eem/TkhFqJaTycXJeZlfGv/2Jjy8WYKHfL6/jywkJHfMnF
         rNUGp4mJmZEfoQk1KrpqLJDDz1A/w9B9pJKDk14RoSaunGJfEqp3gNe+SHDGow9Z4o/d
         IsqnrpGXYTAUKZ1+FzPxcShMNq/cU7kWEM18+qZa46/1Cp6O4gv6nIaQ5Ncti7kDntAj
         bIWQ==
X-Forwarded-Encrypted: i=1; AL+hErHbq7vHTlTw6YW1SvzSflNMmOvSaS3oDPz3ZDr5d6L/m5O7xLEjreikVMCU6OhthjE86PmMMT7lKfE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6a6oksloUzsKNJJ/3N6aa6yIov8gRKeLPvvcemf67xQPcCikC
	rg/B2OY2FZUP8rUINFCZHYBMPs/b3uV4T69Ehxz81ZptOaxlP8TbkRvU
X-Gm-Gg: AYBFou3Z5Yec3/oxsnD1NrhbsXNtLSimVwu8If/MRXT5jh42FKUKcp/f4IE5TU5Xdu1
	JwAxcj38mOQokz4qbTI0BPb8RdAc0MMi9n2QYlnEkZUHLp5sC6iRgjaXFW+FALB0FBFgLJCzPDM
	dxF9e74+II0qf3ZV0gkgeHWBNq1E5wWHxfWAdGPbr10ydozRVRVnysYelGmwbkV9ppiWsrxqIu9
	Xqwo+vnyFroBw8lcY0iSTBBMnPKJSArbu0afMi+rRb51sXMiICosKcxQ1IJDCqtbrPG5v5U8z01
	K10m9VIGzzvT+CePVZ4fuWpNGO0ETkHmdGOJXBUnva0N4EmAYfFPKpfOpMwSlCukEOGto91CIiW
	M2peNfnFU6lbjdeXjVtTPmQjJKmgjIZZaVJ2tPKI0NGlqNDARGIGe0MYWj7VBZkQ/lwqX56G39V
	RY0qpcDHVjWYSMyK4f5pHECthq63IiuXo/nKTzZEHFnoQPFueNgbP+2d0G1pjj84mLCi7UTSezM
	x0Dhzc6mGTxdfqZ9vP9LGBhz8/RwoRh/gOMdr8bKhgLtHxBN5GGQSXqBWzWne0F69gGwkrOKmu2
	lxmbCA9tBV0R4nX7+dGvcAnDGQJfNGHz2xAwsAmm/6oc9kq0eioOvmGYESQq5LP5GF3jm4WhO35
	8T975t9xxrTdipZVfbCMZgu5ID1LDaVj2fiXDOHCB1lYbPKg=
X-Received: by 2002:a17:90b:4c:b0:3ac:c024:b275 with SMTP id 98e67ed59e1d1-3b182df3c21mr660693a91.9.1794355556265;
        Tue, 10 Nov 2026 16:05:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:55 -0800 (PST)
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
Subject: [PATCH v24 02/16] ALSA: pcm: report partial progress under the stream lock
Date: Wed, 11 Nov 2026 09:05:29 +0900
Message-ID: <20261111000543.28550-3-mynameisjune111@gmail.com>
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

Allow a driver to publish subperiod progress under the PCM stream lock
without generating a period timer notification. Use the ordinary pointer
update, XRUN and wakeup path. Capture DRAINING can publish its final
tail while playback and other inactive states retain their existing
behavior.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
include/sound/pcm.h  |    1 +
 sound/core/pcm_lib.c |   24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

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
@@ -1919,6 +1919,30 @@
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
