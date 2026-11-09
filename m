Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201391;
	b=IP7yGV25o4rHxIFoTM1O+oCBQj8yGyEhc9uCC43Od2EqkLqV1Izy8AOT2IBs0PSZ5Uef
	 CDT773sS8Z+2tJerBf/SdV5GaXC9xkCGrX4RFb5yaX4UmEOPWE+56RXJGl7hQAxqUR8Lq
	 44aSSrt6fPWG6gMIwjv6F4HHveIjg8CM4pWq8tUYi994ZO7swlAI/2K+tEsXIgYUrANPL
	 ZiJSrCMw93AB24Iv7VD6GMoSfJSnl9w5mjQ/bQmIpVSbwVX1wxPZZF6Is7PuEr/Rqw9z4
	 orZaqhvPlvR+JVy9q5BnKCy7gXwTC2nlt5zM+pZ7qPWsce8q0psx7MKgHJSSYuoAzRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
	b=vm/qLR8vsyRfucsQB9HExmMRu2wj1F616fAZyyaWUb3hCjVXhgVx+LZyespN7OJD/nxw
	 zQ7NQsup++0OBen79LVsAOsd4v/zuytnO3uPpFSvqM8Z9SfV2pOaOC0pE6al3MAGZPtFW
	 8gnYVnF1HAndrsBgjFzop3vImMPMDaP1dcEsnlMI/WBe/N+2ywU4DGBmgepInboL+ObXO
	 UWlk0NtJuQgIo0Hb8im6ZD7EDIgqCkL+dGBXvYT3M/QoKv40ictHissAq9zNp0sxBKhL/
	 ecgk9n4unTO8ShpVpqLAXSnngFc4u6C4Zu7lanpDZggMge3gah+8hqFWMYczfMJdBAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="q6//wb7x";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA10606A32A
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA10606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q6//wb7x
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so665002c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201390; x=1794806190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=q6//wb7xNb9npoBwL7E/9igaV0A8UxA6JLgLNUuVkh5SM6Zx9G934sxRSzBmdh6pg+
         g+MFs3PyNEIMuYpehy9LDb+zQYW1EL5Df04xLDsSa8UPFJqnFiw7nZ8jlulXoOlxei33
         M2yEXVYm46+TTFlkqbq+N5fXclRvbO5n5P6xbzHRlGNoFsrr2TSKOWrcb5yjU9ZD77oS
         eB1Gi/jURNFou1LhprEkKOfqI7Vp5DF0CP8gEVunUuuRWob1WuCdDLJYi8WaxX1cJuYG
         pBPsgxATiWFVdAf4KJVotIcbSVWV7syeqnUP2Jpl5ndAPHWQ2YFsPPSI8kY8+K1/ddQl
         StMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201390; x=1794806190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RIRJFzJUwhXXYeLruwX5KfbkGWQEo4baZ96Hekp+nk0=;
        b=mrt/Ws16/S3MNfC5hMmJ8p7sSf8wSBTlHli5l5wYk31rPwvKsu3IZfAvNhgcJhVfh/
         PplWMPPxCwNyH4I14SrmUrDDvNOnUMqoAGRIxZyOZkwfqwNtEm//vZ+l9rofHQlNK66a
         m0hpnua6W6EIJXediQeIshbvqx/4k4mtbbOWz+hRDZvzScQvMMXj3SMpFg/lrRcIvSav
         bdELSHRuTo4+GYseb9J6lluUt/YRN6jn4cLDG9Oh4kFYsMe4KHxwil0HAlQiU6CB4Nms
         Wbn3ie5X2qAdI79hVcrpcwsTGh7omQ0LDbgmbf2EKryxN3unppR79QXFbGCxU9bZ49pD
         jhLg==
X-Forwarded-Encrypted: i=1; AL+hErGuqBZ5mInkE2YBlRRObciB5vFCI3+08xkUI7VLE2wkqoYdNfc5+8aOoMYDeTyUsvqIhij8HWEuvvY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mbgnYFUBiSHijADldqN9Bs+TKdgqmgEk6o6idO+PRzHT76YT4
	jtR2xZJIv8964NKG78xOCKa83yvXOEtD/cNLmN98Ao1fwUuQA3zpa48s
X-Gm-Gg: AYBFou3A0shcFG2CyubDCmaVVWpbJzTItZVUJ2WqMEAdrPRioPWl1SrWf7LC4azEIp0
	6+HUmtW0jzNC613sV9VQpReEpCBb4iXLRE60WzoTJrwZjnwhsj58EFDvdS/QF7fTGmkuJGNa4SZ
	wTnp68gatzNOEtbjBGi8Y6t1WjLEFhjz0/Pj2mGMOl10oPsn1/u8K0f2bUoitaqes9wwo/cMmnM
	h/x+38bYJhH/YZX5nhra+ux44KTnT/wzgdh+T0n8QBoWg+upVIVklJgoknZroYOxh1dxxqI+itz
	Ci2XOA5zXTGoblMk/6Vmh+1QJqWLzHt2iJn46Mm3/fPewD5PxELZ84aIGN5jV3EK3vNBmXGnjnC
	LyiOjAENULBL6qr0DXjX5i3WQnCcrHKPR98+00NOa6rxJDSuxR/PfKLaYFO7V1f7Wev+xdvN5rg
	2GN3cjwIDF2bpHHJo0qNMDYvGzgfqczchJKYldkV3S6KbrD6mM2ykZ4FRX2Uws1vBHjgDtK2X0l
	rdjXxlzhsWghWnOUg+pnObZf5ihX/4oNk3qa8occ6WAinYcWvVkjiwvG7SDa9O25St5EXyuWf3W
	jqiZNEmfOtnL5zxSyq/T1X834xCOyyUPrVuqve/93EXHu2gitu14TwSgbXBq+b7RK9P7r26FSpJ
	WM6/kdOjg0bUSCJ/RN6XSuIrnNu4h0XipP7POLoc/esAKGD0=
X-Received: by 2002:a05:701b:2902:b0:1b2:539b:496c with SMTP id a92af1059eb24-1b39ff1388fmr4548819c88.35.1794201390152;
        Sun, 08 Nov 2026 21:16:30 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:29 -0800 (PST)
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
Subject: [PATCH v22 02/13] ALSA: pcm: report partial progress under the stream lock
Date: Mon,  9 Nov 2026 14:16:07 +0900
Message-ID: <20261109051618.22506-3-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
