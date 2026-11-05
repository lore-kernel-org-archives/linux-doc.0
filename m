Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793837366;
	b=LnskSBO41Ud9JbZrSGuoLxsLHRYoOaIoKEta503nEH/saK9RINZVzXdUojVMXSjwKZVD
	 cJ1Znp67IiOVBndloghtSqe8jGiQL/qwLW083MeSstMnKnJHVslu5n8BQqxNaQCR2Svcn
	 zBj0sQDWH+u2nQX+XFyTsiEh4NkMwM6ME+axb01cGeZ8jFs+aud4XamxJ+yobRiKih22j
	 8S/38fix2gTjeq+8K6vi0KFu8VRbWYib8bDkXUSdfkQvapNoN5JYeKkoI0MX9Wo+PR3Wa
	 +DNUcapJADWeO8Hj+yP9H3AjWUBYT3EI1xWpUuu0u72KFUjX/gqBiNiOffrM92I0OoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793837366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=4gKlhmkJ2TctsPcW8qJYaOzRq+MvP2g/WPnxJs1vUOWH5f1AgrleNSpYoNsOipMckMOb
	 77jU7IpjXmL4pNexfzEIlDmONPP6ahc09Dc6Dk2ozn/4F2BrXirqta6YZmZ4e8YQa42m1
	 2iv51pPq33WmkInMf7xkbnLMvWF8odfPaQuAftqPVCFtkrpdtE8o/vDvYQ69hERVMzW4d
	 JJRCUPkGFLoLJ3/oKQQ2nyezJePn3AXHVCYQnqgmcPfNr3OhHdEWl9UQ0mX5pCHfsdnTE
	 7R7AqyHCVsx8fMtHM07YKjkhVXNHla4CrJtUN2l718ulZ/skNxS0JD8dN9rRTG3GFaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1F606A33E
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 00:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AA1F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KzYiptT3
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso699549a91.2
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 16:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793837366; x=1794442166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=KzYiptT3HMTpwcUEgKTEdOZ1adOzA45MiGDH3xRGwEqKAkU0HIBEyOg9QgZ5eDNwIt
         WoJ09SFTFlA6x8W4uHWRI7Dr2kKyk5pkPrcz8swIRzka6lHPhIqFij1L+pJKyRmcPeaJ
         AhyIR2aVfOVRTG1waXp7x7jMI3m0u7UtabMGCq2TSnkXlY3Z981jZwJ15eut/bcCBRYk
         4r08iNX7HUJltHCiTqqmfyHX1+GOoL1v/6/egB1yH2aLEXKDQ6MjDQET677xtfeY820X
         0U3ZYSgKUV19epd+rkM6xY8M3GFLZyR2ySllE/iK1pE/o6mXHl/6tmCQkmiQxred/Cqm
         wkFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793837366; x=1794442166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=RSJSKA/f5y7agx+0DDpyndR4bd+Qxe7WAONSn1K25WslnnmkBL5aGLRV2oSMIDb91w
         8feliqM7j+tqvmJQE07z2BagcNBEciYLf89sr/0B17f42Mf+RZrW9MHvod+bJ0Pj6IZb
         9T3S5PkF17lPmR8sCx2eSE0WlEWWsM6Xn7CgMOnqWKlpfaehbHb7FOwC0y2zP1w2eaCw
         9gH1ioC65YSdlT8LeVuve35t65ouRMt1CMvS80swfUdJO8sm48YeBDZzcdfLrn6qzwFm
         FY5AmsF3woty+0MGtIWvlryKDZC7ZXRYeXLcOPxj4P35ZjVw5t7pm/MMsQ2dJpLy5XdQ
         pCNw==
X-Forwarded-Encrypted: i=1; AKwUvByAIlwD501oVjoyv8ufAq3urMH/XWcN4T2i1btgwBs5S7dgs3caquX4wRys62GdtszyokBmyz4o0Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z88IIeb7UYxX2ZjOHIeNhNpS2dhaoBtsUCN7Q43Xfmzr0CnHh4/
	NWJgsgprvyevoNALA/CP7Lna11DHVwNzPKoT1LZyuPjt2zWVY6x9ehn4
X-Gm-Gg: AYBFou3w49VerrNjuJuo3OST9ACzVzlwE6xXMz6tAG2zaKJF6Uh7K9SAgVa28yjcwiw
	++EC7HNqboGVHfy98IgkuBWJ+od08+rPuqrfGcry/E9uNnxFPJbSUZxg9qwv8SuDF1JjiSS6dhZ
	quUCpW3u9vrReaySkaEhskHoFKKsvMBIVPYGaKgUAXgBNC4Dqgq7DPglWIHansPpjkrq1Wmzb9j
	nbKwlrIIGBnhvpsxVNglQO/o3qVwb1GmUXVtReD5wx076etbU9M03cF/AfSN4FC6KRa1q/prr3e
	1uwl1CZZOOGnQyGjkkNgDVA9X4rvdHm4B2pFF85m6XRf7grlSP/+BM3Qkq5zcjoyxU7s5Ji9phC
	M2yNCGNXXyEcPlqwn88FMVNHYO/PUBC6WhZu50CHsfmwOxFX92ldwjF9bkZivD8TUIjvXeMbNwz
	1zY9H66ryML456l14VYYzczMs4iMT1I147vpkebEUcll8FexGylmsOX38Qx9yM5ia4yTeI1LORw
	vENc0Lo+4KHVXJtZOXyhr0kz7z8m3bNk0Pw+9K0mM//roqisO4Jw7bDv4tETtGPHLzbOwN50bXu
	D1fTJ6Vb5u0MyF4dgsehzA+T8zLHeFYEncn6Z1n83quffH1n109qlC6l+4VO4qkccnl+oy7FKza
	k14+cxhJ8pMXq4csfN8SLeSvu5tfIykkaz9aVsLMVQ/ET9oM=
X-Received: by 2002:a17:90b:1d46:b0:3b0:a37a:230a with SMTP id 98e67ed59e1d1-3b0a37a37e4mr2097706a91.25.1793837365788;
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323c18fsm897208a91.4.2026.11.04.16.09.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 16:09:25 -0800 (PST)
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
Subject: [PATCH v15 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 09:09:04 +0900
Message-ID: <20261105000915.15177-2-mynameisjune111@gmail.com>
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

The staged virtio-snd capture path needs to sample stop_threshold from
completion context to distinguish free-running capture from bounded
capture. Software parameters can update this field while capture runs.

Mark the runtime stop-threshold assignments with WRITE_ONCE and the proc
status read with READ_ONCE. This pairs the assignments with the driver's
READ_ONCE policy sampling in patch 9.

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
