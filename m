Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461696;
	b=cDEI9beN/fI1Uxb8VCPGOi1iPuNO0QYG9kvXwcfneYktXRNCij+PfTJU/OE2+RyMnDo0
	 b9O3xzwgOt74DTv0YNELKSuQeTDO4Df1myTu4+RatXG9fzo+W6ECK6xHAqjawYuUZniHQ
	 kXbpvvhSUWAXkZqmasCzCxFmY84mTednLW2EFXEXSy6/hE1ovTWHuPpa92MGc2HbAuoEg
	 04F8CSmt1vZ+7gZF8SD3LqDPmefcI0EyEYSDnr9xxn1mliHsVth/kyMIEQvmGC2CSNudc
	 g3ug8nb9+5RVjp5BkpUw/gBAUwet/NvpAj3q0xTU+2vwlJ+LSRb8mciFcoLVzHDF+Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=tma+eLpb7ZkrlSV6vr8anashFcaaYpx6ryFuLj1FRmKDJrcNP6bCOeiUCjjaHTyjO+sy
	 h+WIAJWoWSiQ2nDIoD+SetVNv3lbsNp6u6FenIrnkNT96kvlbjuZVYA6MUn3la7HjwHQt
	 3uxgo3r8qFB6U8klsaAW/DHWipplDttKEsZl43i9FJdLPc90DU6SParoMRnSEiZHURwQq
	 GGSSxWHCL35FbAiv2R5r5TReja+5QiyaP1hhI7Tvfkp1RCaxmEkyitx/isJiafisbaBxm
	 lpYrh3OIKbH+8Dy3f7QsRPQbeKOR7xESXX61LsVM9KUZ9dJrhXkSzrljqXxoGJ04Umg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D44606A881
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 05:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63D44606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQ+iAVGr
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1438d9363fbso318883c88.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 21:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461695; x=1795066495; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=dQ+iAVGrs40P3mvOnsMx386F8x4T7hbt6QJVwaw4bN3WscCPOFlAT769rRBBC2dE7m
         6CtlmkSISj8zLFXvkwVDmd2CxyC2uvv1EYh/lasvpNnmiUXyjoqzG+Fi7u60tyz9br4J
         KwIz8yLlNpgIj885KK9b5Vb02B1EJOL6C+yvJvLLKrvf71di9USNV7R+u2nW1L2ilNG2
         3BB0EKujATiVzo0W5IMWOgiqLRKmi/+0wvWoNdLdFGF3Za0UVxOl6EhgStNKz6ltq5ex
         O12e0xKNHDW6j+k7Njl5mg/6h8B3rgp5kwlOsp3Pjr0baIAdD8Wqr8LN2CK734UfLr6L
         O/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461695; x=1795066495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=wzk/mH5x8Y4w+RKCFG2/sw5QCUzCoh2XPR8GQoPAg3BjJdldQE+5LwiVnDAZzGtl5x
         H7jrP2qAs3c36l2Z4QCRoiFR/tsHZQLq6KY7FGLS883q7g2VloDl0LN9L4zlxz579eYX
         qxP+cn3DdCZ64N2bM3aY5K/sqw0ZZz5FN20SCJIGLkNBkKkkN70jYLwhGdbY1ImbKZE2
         mFqXkIATFYuD1/3tyBE2htmWtVGFC+Byn6U9cIa5c3FEJrFPGo5WUTkquolt0bGGIv1p
         Y71MlW6qEA4lf8yCsSIgLYMjLYX5xdjo6rPYnesCZwH2VxpxgWNtGWzI6Nw6A5bYuLT4
         Gokw==
X-Forwarded-Encrypted: i=1; AL+hErGG6fEfVVTT3cU5h7UhKb2aF8V6VgAYlWAFfFhfNZpYBJt4FCL29mPHNj1lH3C5mdDdneoGyqd/9Sg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+i1yhQRVYFthMneUCbikMPRiRE+IwYFN+OX8uIDTk3TTnNBrJw
	RjcOqZazLKZLToq2leN2FfcpzlvolyQ+WOiBsXCJhIpf61udDZ6X6eWr
X-Gm-Gg: AYBFou397pWoj6VVofhPfENXL7nNzWJAxdF3R2cTTnb0DG05FrHL0XEkTQ1fW42F823
	C269JD9Dt3U0cMuYMeiZl4DKLJ5adnUwJVgcHA+kWn782VmkBIQ0Twhi3cmzzmOmQUGx9vIOGK0
	hI2zyO46XU3dHj5DuULZgCYSAPBRf2oB+ZK/CS3ZyV6gOnvQmjsq/15S3gn+4wXL96I1/joLaim
	fTZ5X1iC+pif+6lfGF/t8D3tdCHtN40nZZm79k/ufNGGHI1+gkiqZNWHqt/7MZc6scyLKqgDOIP
	BhftESoYG8itnR9UaT0HYMCZqu77QdEDSw+NQQiZMP5m3oQ4YxD4nn2nPrNA0qjjufQT9Hkib01
	19tqDZkOXzeohpnDQTlsd5Vir1qVBH0RPQaJSttQ4NqdsdA/sYx6buWisSPCF7H+WlB8rz/3Tn0
	9qqJz+Wqm6X/YVkeKtj+FhBTzi9dx5wI0lwPkIXG29nsqj27qsnUQSgMWfH+dJlXgnpd2HF6RgA
	TMz88mFO+ihSezz+3P0RqZ1D5ssmB54Iq9zo+XxHyrBue14YKUTHEWjzDqgeOVbaEsm99NLWCbv
	PQ+o4U7knjBysehjLGyz0oaWg7REqb0BipGuZsQArtxDSTyVWoqLPfIR4wA1iamAgoF0peVMuSd
	atLDbfQ+ly90e2bAS9X/cfBxpnllBEkw1ee5RRuO2xBtEc0S6JWdCozMBnTZj9Ta36D5w
X-Received: by 2002:a05:701b:420f:20b0:1b3:a87e:8040 with SMTP id a92af1059eb24-1b4f5eba049mr1425278c88.20.1794461695410;
        Wed, 11 Nov 2026 21:34:55 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890c0esm21953240c88.1.2026.11.11.21.34.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 21:34:54 -0800 (PST)
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
Subject: [PATCH v29 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 14:34:30 +0900
Message-ID: <20261112053446.73504-2-mynameisjune111@gmail.com>
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
