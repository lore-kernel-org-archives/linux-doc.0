Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793156036;
	b=a5p9UOI6DpVsE8NCIQ/u4pPw84hvgFvE2zOw4A+a2XaeoVAzjFnDlx5WkluXswLJOZLO
	 tdzUWWxK4UcseZvS8rDDZGNXclu1o0u6wlxxHKV03fZHguBeVkDfx1jBu/nltcVNZgm6p
	 4xihpO+3QmTT6kyPAPNLdROlibsjZeDJkD4YRFuMlV8L7nyLaiTQNGGBIoopf3oLazOhg
	 C1QisfLxM0FD06fup0Xu4jLNuOsmH0fRjMp6U5QF0I6CVF4saZQQQDK0P++8Qm0NXlQlX
	 pFqhvMW9OvgvHruT06eueFKGQ1AHidmlVEq8+Ds6pdrxM4mES7PfeCCJtwf4KEpsWIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=BrX25dB2oEJmz4cqpG4d5EHcY7sah3/Q/DN3gcJwfKySvgiMoCWruqiLSBXd3G/fsVv4
	 DKF/1JeZUN2AL9/FrxR9/5EE5gOA4PD+Q5RKSDJzqZIZsZXUtUdM2UqLwHqnqI5IX99+6
	 YeiIWclL0UT5ZAXCUg+Xy0OuqeSXeMuWcrz8HXBOWBeISnJGxDGTAEqEKoU4AhZA1eYNm
	 4G2B73zU+jwHF3gxLbGiiibJgQ/49lO5cdxakrNeghH/00Y+jxWsOKlZRoiRd5NkcjHQG
	 RuYeXt1cJejYTCmAiNyBy/zD0YEACS8WmgWCr6xWg33mKgcyY6mNhvdNN/kjlZrAngg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D591F60A3806
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:53:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D591F60A3806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DtlOS1HN
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36661f953e4so821868eec.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 19:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793156035; x=1793760835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=DtlOS1HN/lPRDERq/L4CWKWOWJTRrPcFCxqObl76LU7v3PRxxlWsCZwYTccQ0vLfkI
         VGzYHLsj9oDMkYO8RMbT3lRkeTZsfbifPU4IKZdHmfzD0+bjzyb/x7a4onw1MFc4rY12
         c7QfGHjSLX8rw1VMNLuFtckc7h2amQYjzghSuYkZ1OoOxgqFli0eDklrSKKz5RP+xv2y
         slMZ+0vFfz4KzSyKI873S5FI1Jkp3UxJeWySGX4jHbpZT3cvpDPWUWADukPOJ1iloYW/
         mitXvsrBhSJETdeECIFpEaf0txh4pir4cPB3L1BfZXYYvOGMo7uUOFoTzzw57obw6TEt
         uG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793156035; x=1793760835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=zoPyaLRmJpTAvdrswP/pFgmIJ3h5eY/bX7mFffboP0h6OMYmWb1Vpi0weVbu03FxgH
         kZTqlK/8nxFbkO9+zt9QxSoq/JwF5ArMRBfP+LIXbW+itA3VraRcWzIAswSEppCr53El
         pfJ/9jqL7xTtz6/LZz70iq42DmpaPGEyVQ8+m19ZumVBi18gdK/EthLBm00OaDNeG2o8
         fr3+com6SIy6+PIsgNMxdWTdOU8i6ay7X6M/PUqrp9mn2KsOXCTe7ULt95ujcGoPMKWD
         /78X6N4iMUIz0rzvKHUVwntppeA9WCrCu4iXoI94/DP0DVIXosKRjC2+Y6YAaQni7sh6
         bulw==
X-Forwarded-Encrypted: i=1; AKwUvBxWo0KbWxSB0poOPlzjwR7g0O4sHUBlWrYaOnnDP9oi3esxv8BD+jhLxUha/T9DOdWgKHGXnQagTRg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoskf5He8K70pHcGQhBJtgrYnhq2UJBgfNnV8+1l2x0Ga55WpY
	5QVzYITkfGOgAUZPs4uEcqrFhIMHSKWeGDJIQCPzsArmiG+tKhZsmOMT
X-Gm-Gg: AYBFou3UOaKsTtOm7xa3xUc/gr8ebphbLrF+624lXrB93tmeEOFEpkFJt+CVbcv53wr
	75HbMKdBD1Fe6Ks/60FkaqT/uH/BYP19cW5O86yMShE3aGdvNpsmIJNc2ggjqvvP/f8eJ5bMCsW
	jiiJ5sOxpUSl3C142BhoZ9+uv5YJxevHdoUZo2wN1r17y8DGm1wQ2uSAaG2KzGlhRSH20+ls8e7
	nioAerBomYR2LwK7m4GVgye156XupMoHhXtCJwB8zoTtsjl5YCSE99MMrbTsB1GF+syQP2RsjdJ
	gQMRfSvx66I/MprVI29ZxyGpi/23JosluwRzTg7JGZbNOKS4TDFrhE3okGBYxsFev5x66xaIaCp
	OEAYMiqUbff5UflhCeKgYjxIXtd5TRnG9WHTsJVVSzDSi+tPvzFy8LAun76c5DlY2L2Ca6wRd5p
	KRdVqOlU819OYLCSg9JfKGkBmVvFaXMoCZUEb/pGB78MZlQHmBDNAU9KeA6/hyDJq7oFsUcvVWG
	1llZcbY4r0I0GPb7ZTJwCtA/Qqvxw6wiRtix4YyXI1clTHab7f2Cp8cJTFDk2WJdPqxZUrUNXFK
	Tt8ulLYC60TWE5ZeEwwYu8Y135jkdWofAPtfmc/7M610bIGaGIcd6cWU3aQuJ8jGYuJDfCaT2Y7
	9uVcpGdIefYn3yj9wwgbISeZ32knsyeeGAisYF+wKaf8+Jljf9smRn07HomqfnbCUES6w
X-Received: by 2002:a05:7300:a8f:b0:368:c6b9:d3bb with SMTP id 5a478bee46e88-36a203f18f1mr1809613eec.14.1793156034971;
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm1711914eec.23.2026.10.27.19.53.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 19:53:54 -0700 (PDT)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
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
Subject: [PATCH v6 10/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 11:53:13 +0900
Message-ID: <20261028025317.92450-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028025317.92450-1-mynameisjune111@gmail.com>
References: <20261028025317.92450-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in the following patch.

These annotations do not provide a transaction for the entire sw_params
update. The driver serializes its cached policy and accounting with its
own substream lock.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
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
