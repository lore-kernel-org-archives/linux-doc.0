Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267660;
	b=b26ewQmtigj3ba8E44wQO8DseH9VFblW2t8+DV2ZxUKShvI9ahnvItTssKDftAzOPsLV
	 sM4ZLm8irx9lp73TPXrEVcya8RxB6UMvpPlxwiw1n+ydGACnkWk00Dpr7vrYO1EHdPdEm
	 +zy5nXVP3gVRDVaPHjoYrqlDuDqt2NAatLMnG86Q94LXEoUy0a8wv3q7lKIIjX/W1Hq9O
	 1czUV0c7nDtj06/SNSmMcX47vtzjm+GPgWRoe2vF6szjYfl+B2qGDSBwu3BVc9tnHtmRl
	 b+5Gis0DDROGjNtm25rZm1rQomvTLI5gU6foJMJyBoAur9IjCesyBwHX6rpoWFKRkRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=p1FMn3V2qMguWj6WhySsOK7sCRQbVPYPBA07T1VFrSGYWAO7w7wsKgq09Md0V2XS01QN
	 IpEF8xiWllnXfBtHGfAwRNxwvbHXYGPGRMdiWXWvyk2ObHJfP50J8d863odc7SfPNfyOb
	 Ks/K/mtjzABqbdLac/RFl4b6nYC8OvSHYY0zLI2tQhY8QHbUb0scX1c8dyEZBhZsHuYRD
	 P+sUgV9KiVXLWd5CiPAi6W5yGT5VPl36YmvXqv3zhDXr2vd7XMSU6cJwF/o8wI3s7pXGk
	 InspPng2vqBjuVwUUswCeKUL4e1LPS7VHgeZiiCiU3xaJrLCM04r7bczznsIbYJs8oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF0606A333
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 23:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DF0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CMEblv5E
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15dd124bbe7so1499250c88.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 15:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794267659; x=1794872459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=CMEblv5E/ZYdTwKbuiQF2TJwj8bc+53lpi3+wCxvA8s8Loec99E7MJE/Ob/VbEfBs2
         j9ZeFwNWVDFp96V5UwVvuC6sr0NZDY9aHU6ucxO0/sO9ebK6DzWqK70Wqj5fN8PzfkGw
         ENUJ4nppKN98VxMR2JMJlL5wWJkjFCOoRaKIf2kYOuYpZ+h5u5FSbpwlUpcax2Bg+bku
         ZMAuJvqcMyVRXSxnvg8v3dVOrtM7xxzLTUiFrzZuuXbIDBBAZ3xj+Fz8zaZaZmrAKVAJ
         6U0HMSS0xOzCQr57co9bTZSl9q4eApC9TjKAcutp5siVaP7jGHnSRJKKjWWHinIhy/yB
         doyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267659; x=1794872459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=l3C0qh2daojWpAOM8lxQVncnuf5cYfIm75XrmcXVVkKv4cW3IKQ5Bf75GzJNFmPNig
         2p1Gijan0zfTcsQyRiGgSuu5tzJfvQisT3GCUJi87NpbPuC1O35+A9WZT7wurCvf65KI
         RNfw3GNQIpiIdhCEuC789R+L/yBgcBvcraEoRE28mg7Z5H0Q/YJqvXMYpbdGmDpYJpVw
         Miea9ODz2FS5KPSDNeK0vbHGvsvWxdsmt0u0ze9vOggQC897hOuKsp8XKePf0w+e3C88
         egukH6p8MLcbHsNAYIfHYahb8UZ2ZeI4Rd9gOkUI7eTI4haxFU62VjICanIhvK6+hctC
         +2aw==
X-Forwarded-Encrypted: i=1; AL+hErGCssam9AV9x8OI/BKMm89Op81/tBV9ErGNER/CODEMVut0bkhlgKvza+eNHd0V4X1DLzg4Jpl/XtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z87LYH2pywzIBJj/LjoKwSLPmTSXLdR4sbA44zszdU8uPbzt9uV
	Ku7hKFes0Wm4cH8xa/hRLN1EktkPHj8IcoKaXuFzY/kDUC8GoMbmNBjy
X-Gm-Gg: AYBFou2leEPJ+OEuTOru85xBzmsyM76KTTkjdjR6UO1chge59uZU1JdsbK5u1B3xLYl
	4KgDnBmslYCMn5pn+Xov0nCD+5g76pxwSeZpkx21bD1rcxCpMCjiUc1QEKvLt9DVowy3/e/TEfI
	HyJJjsMwXGsK70gOQicQ8CzDWdx7pTIigWHzWp80NTC/Xj1FzVC7V1jkX2QnaDUeH8VY75nIyJz
	hmQQ/zJdZ3sbbkgrDi9PN+pnn19Ij2Jnqd9m69yPJ5DleRA7N1P8HDvOJKzISu8kJ7OxUk2KhLu
	OyObvHwaQqu02SPJhovvqDa9+1BhXbFPQhxzSaQ3Hg7Q97ZaM5taAcGO8rGYVVKDoWU5JE1PXLe
	tbW/PaOiiSUpVpGdTo+906DzPtfz3mMNc422rBMQlG3WUYvEuvs7WqWR0J2bmGwhQgczVFh+1ag
	DgHxtPjjvEe/tZkmcjd66gtTxpfUq1OjMErBRD0vA5YZKmA17LAv0avG5YVAOKq2QjmYGKRt91U
	zlC0KAmew11cGwAaQd6HBIR9i1lHNypjS9FizklWKQkT0tbG6JRttVVH9Gg788DucbdYM9T9rcN
	bxQkZ4XtuOcxtO62WYYF2cIdyBWUdX/hXKrrFtHTcZYwq8s/vsEWgMqMZU9AtYk4en3gcowH7el
	YHWqxQTWkZdVsXYioha4xwCsKPQ1Tgk0BB3QXu0T+ibM+m+Y=
X-Received: by 2002:a05:7023:a4b:10b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b3b618cd61mr1286428c88.40.1794267658673;
        Mon, 09 Nov 2026 15:40:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm1739049eec.5.2026.11.09.15.40.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 15:40:57 -0800 (PST)
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
Subject: [PATCH v23 01/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue, 10 Nov 2026 08:40:36 +0900
Message-ID: <20261109234049.79534-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109234049.79534-1-mynameisjune111@gmail.com>
References: <20261109234049.79534-1-mynameisjune111@gmail.com>
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
