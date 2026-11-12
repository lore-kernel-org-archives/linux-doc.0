Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794464697;
	b=z7Kjo1OBwlVUocoklKY8uLA8oBP/9xC2MNdFMFYu8j6fLOv/45E9sTiccrtxftYjRLd7
	 zYp+8Md3RTIXFmc65AmcFAefKuFVrReYrLyca+XEcZRE7W7SjKaj1ZXr1Ub/GxcH9Rz0Q
	 S/gVvko/JG0W+eCoANtMqEkMs6KRVZjGqU6iIjlU7vf1chhfddPiBV1iPTD+MhdKThLEM
	 UCkVyIN3GJ+ZEfGqNbuT+X3Sr0Lwb/ZT61dlLTGnFK9Lp6w+TEW1fzhdqGGIMijSP50Fz
	 T3hrFvofLggc8FLpRlvalFJ8e9dbw48tW4+KFqy34yFiozwMGgwTTR02jahOM73/jjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794464697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=wx9eDVUde8nZkkDvGLewRaAIcpBH0gEhc70sXxu3sjVQu9QiC6lIja+0DpitM40PooJM
	 SkNDgKtADHo7MBIJJvrhF8RcewQWRdG2zt1jUSaNNG118o2uCm2IcNB0HPtWuX75KAT+A
	 sdiMJe8LYv/GWXwNXgfJOMkK8qtjcvVwLQMGy2x47o9ZIvmYIXFcmqaXMH9AdphHD/3Sg
	 tIuVGfJUXwYcpYatxTL3rAYG/kF2sj/WFXHyzH7YIxFn/tfns6K8Vnvgy+IATlSDw2YyH
	 s4YLg4kH3SbT2UT9d1wk7JL0hJffgwseL6zS2ne9oS5hbkq+P1pMJBC32K43VxVqCJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBF606A32E
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBCBF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TR8ckgRV
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ed1f1a7695so15418605ad.2
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794464696; x=1795069496; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=TR8ckgRVmKh2zAdNhJOq28GIP/TT+y0Qxh5sVo6OGEV8ZmX/hV5FazpxkoqGgfsUAa
         XbYx/75DCDTL6cFz4S9XLOM249xvT9a1PyJCYjnSmaPbfv5OG3zCRsftGeuVzoaEAzuW
         Mo37Z6xuk1P9gU6wEgZMb1hQ0H4tZ8QefmMcwyHc2Pfha8jfdJkYIdAd2eXpCca442be
         Hugv4wclFzUmD/Cs9elZQbdbMEuAK00dtXGMXuzTHjBjcJtZKXChYplYb34GxwKzzkGc
         x+mj6w1WcasJvvkDxL8/k65zpgGvCWsDB+C0ijyEO4N7Oly0m6k+T6n8YIXB/WDm2ccr
         rc+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794464696; x=1795069496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=FE114ZJ8Iz2eDY8RKqmtLnYLg0+xl1SqHjJ+vt1+jCnM9xGwIpQ+/VIsSDOO9b1ONB
         cMieAwdcY4DJtOxyDHOHoEAmWthgWfXXoGyZ3lF+cz7LmubzfOGenww2/I0QC4s0bxUK
         +q10o2xosVlI6Ke9jG9HlDbnaXQ32jEdG+pRdwPAjPYkK7adglshhWNpl22mgvS/7ynQ
         EDuu98oOyGDZOieF7jozNDR0a+6gYyGveba73w2wdgmiGHlqWQdBfTxTlVamKesOHxch
         pCyVd+wTnvs+i2f2Hkb+FvVwkAHGmAvqP/p4BdgG7vcV/IPtuh2FrR52XwsY39/vYHXs
         766w==
X-Forwarded-Encrypted: i=1; AL+hErF7igORrUBNOJv5HprWY//gJCkf37ZkDmANyfGtkp86y9i4D/Gr/0mrCfLGphM6z26+fwQTpgCtH1o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qg6ZHIUQSLWuxxb04VXlA5rLkhOicW0LxpGUIVnGJvKX47UE0
	+JG/eqmqJ+6fEssxtmIuIx01ipO8XgR03XKBJezCsuh8kzugm6hWo7qS
X-Gm-Gg: AYBFou218YZeuKPTCdNR00NSslbZJyOGuoZc4JYPcv4VqFG8wkN187IMQ8I+I3scBbv
	JImu6yR+tB9AxMGTcU0qmawPziq5DrgDBHWb6x35VF+gXOrlGD+m+tE1LjFz4AGoIl0PIZYtWPJ
	T9HOX01RlJ0QZ/3dw+yEDs2Q+g0Mc4bZcqXDGKXnxtqLijV2OsmbJY6cYGoce1cnGtQ25ZuBEvf
	GlBztb0JUz51RkYSnVl060Fg1mG5UiHd+c5lti17d/VqJIZuseWT/CJTnKkjs3sdtW/9UVkz/eK
	bWt7qVldQTRLvTivUEts/90bmdk6DrJEVR241kd7LwsrAHqBD8oyvAe9Pb+EnsXxcNMiDTUY5fc
	fqE93r2Qe/Ez8T99qTED1D66HYe5wmbHypz8zpoYRo4vU94TEmU6wnjWGAsRswRZYwZVBDhtccp
	TzyaPe0qxLsPu5UHPEYQc//QATPe3sedXhwuRWlRyq/A0+2WZF9pE/ovZ7/vlkqSaCyBrpZEtK1
	c4kDWnMqDWnQY48EZDVFnWZkfvWUC8eR3mUlQZeun310OrV3+DppYy9mY39/+rl5/St7AwnDqvm
	r2LJXCgr+U6csOrueVhMqMP9SRMuwnUaOT8tcfR5Orhg4sy0kYfqH6pNyMJDP+jkKfh/AMlycon
	aTxYmadpHTlN0qkkwEIhCSrOabQDCkQdrgmLJUAFhR50Ahww=
X-Received: by 2002:a17:903:1a8c:b0:2ed:a8bc:6d48 with SMTP id d9443c01a7336-2edd7a86c7amr46594825ad.43.1794464696003;
        Wed, 11 Nov 2026 22:24:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3e61bsm26979965ad.11.2026.11.11.22.24.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:24:55 -0800 (PST)
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
Subject: [PATCH v30 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 15:24:30 +0900
Message-ID: <20261112062446.159-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112062446.159-1-mynameisjune111@gmail.com>
References: <20261112062446.159-1-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
staged-capture policy sampling.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/core/oss/pcm_oss.c |    2 +-
 sound/core/pcm.c         |    3 ++-
 sound/core/pcm_native.c  |    5 +++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -2958,7 +2958,7 @@
 	       runtime->oss.mmap_bytes);
 #endif
 	/* In mmap mode we never stop */
-	runtime->stop_threshold = runtime->boundary;
+	WRITE_ONCE(runtime->stop_threshold, runtime->boundary);
 
 	return 0;
 }
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -422,7 +422,8 @@
 	snd_iprintf(buffer, "period_step: %u\n", runtime->period_step);
 	snd_iprintf(buffer, "avail_min: %lu\n", runtime->control->avail_min);
 	snd_iprintf(buffer, "start_threshold: %lu\n", runtime->start_threshold);
-	snd_iprintf(buffer, "stop_threshold: %lu\n", runtime->stop_threshold);
+	snd_iprintf(buffer, "stop_threshold: %lu\n",
+		    READ_ONCE(runtime->stop_threshold));
 	snd_iprintf(buffer, "silence_threshold: %lu\n", runtime->silence_threshold);
 	snd_iprintf(buffer, "silence_size: %lu\n", runtime->silence_size);
 	snd_iprintf(buffer, "boundary: %lu\n", runtime->boundary);
diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -871,7 +871,7 @@
 	runtime->period_step = 1;
 	runtime->control->avail_min = runtime->period_size;
 	runtime->start_threshold = 1;
-	runtime->stop_threshold = runtime->buffer_size;
+	WRITE_ONCE(runtime->stop_threshold, runtime->buffer_size);
 	runtime->silence_threshold = 0;
 	runtime->silence_size = 0;
 	runtime->boundary = runtime->buffer_size;
@@ -1062,7 +1062,8 @@
 		runtime->period_step = params->period_step;
 		runtime->control->avail_min = params->avail_min;
 		runtime->start_threshold = params->start_threshold;
-		runtime->stop_threshold = params->stop_threshold;
+		/* Drivers may sample the stop policy from completion context. */
+		WRITE_ONCE(runtime->stop_threshold, params->stop_threshold);
 		runtime->silence_threshold = params->silence_threshold;
 		runtime->silence_size = params->silence_size;
 		params->boundary = runtime->boundary;
