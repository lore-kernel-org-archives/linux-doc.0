Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201388;
	b=wHPUu2kpJRzy4Mb5YyMIhEXKSgb3Tq406T8JUF1q8P9p4esgjuhKXmYg2CpRX9RMX5AD
	 w5SLGT17LRwD3v8L1dciDkHlBCkTmFwGir2MiRFyo8qU9NFp6szL3d0McrMJ1vYTxucLu
	 Pj0+jN5gJX6BZyvNPCGQXQiwf+zlI2nAPU4/mkVSTt/SC2yN57/KtiFQy4wNoDxkwiZlU
	 LbHn9oFU44Qcg+ITdLHnbwx7MO8ASGigrSBObln0EattInjPqRhBkwwPiVrO2Liae0Dzc
	 4DF7dQmhsdK3r1PJ8SGc56YXXmoTt+MUV1kIlAqNI9ykmtP5diPtjC3gRtXbAVIeFBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=iXMjeRdNBR1WTR6bxypbSx6W7o2rc5jTZApJpX5gRmtpYGQdRz6AAz28UeXBFe5RvU5d
	 CeAQVWOhf7kyVWvfIHdzD65ombIRNGQG3n3jF+Hg2OSsdpzxwX0VW5R621q5Klo+DwL9p
	 txRs4n1gsI6G+UkuwfJQClcTcIiLKksrNWIEn8eGYdV6jVRGwQnvqav3HpRhmGC9t2mIU
	 OqUk0h1k5nsry7aXpqbnynW6Z+pRfNJjcsYdRPBebdJZUBnVHglE3m7s8VfCPWCaC38an
	 F9e6jRC6eFkGq4H3zvt3gYxa6sWcsnReuGsiDfjRSOtCi1EQnVsI6vCIsxbSfm0kISg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D68606A336
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4D68606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=06MkglJ5
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so474206c88.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201387; x=1794806187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=06MkglJ5FY1s6DB2TSqzZ4qQ4hkx7EOIM9N1gGEu3eVg58tFqiQERaWJe5tHTFnm9m
         VI//0HTN7ThVuXiicuw9NQkwwvvTFEykv368+BvwVPr/a7lmqqdWZUiny6RBZ1NeRSgt
         LmXimky/C+1EHMOSANnZK1puI5Acyr6D4VxieZSaqxkzOW2dhNdDS0sBRcn+yRIOzFGk
         pZw0innVGsOmeffxdG+eYIz4/ew5mp40F8+6GAHmB6uK+OXqPtXVCqFWRn9p8+EQBSwL
         M1pXfjVrDjKcJeGarQLVX11BWAZoLCDVivdYV11c8F/pu4nE0VPnqL5r+AVOkZJw694i
         iTwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201387; x=1794806187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=XQR6kJH1/j5NQawrH4zzQLA7Cq8v5lBZCf7zamPRdefJwByrPn16irbXjDNLFa6Ro+
         o2OCt8P1bRkJqLGbkWXubY674Jw6ULtOHbcoN4e9fuUvaHCwWpASn3s6PAnkzAkXH+WL
         D+IcKhK+HY4UkZoAlcgZ+aMalaptraEcgogvEeXfcRT82swPeLYrsEvPvMWyB2r4t5k7
         wnhlo3E53d/aDKrQ88UTvSUPHRDkD7FzS2W/y+Munv3sEhofWb6uIpT5E/rOnv4mH2lV
         gZZBdk4/yM0dzmC4sIHN1xB/aO1vNqiRctj5u165zBMIa5e6OYUqKdiyryshmNsA4bEN
         56Gw==
X-Forwarded-Encrypted: i=1; AL+hErGHM6bW4dIRNkt4XoTxLRnvJA4AqXLK3i5gHBK6Dzrz+6NYE3pywJ2YmreEF1+3r2HDw+6codIh+I4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wWT1rApU+MZTZSwuYfKnzEjVYKL0LsjDX+1bBNCNsaRRxMhwu
	vS1HGYi9FxSz/8Gl62IpOmd3gwajwzjkccbF2cS6nT5UPmXtd24YWV9M
X-Gm-Gg: AYBFou0dhL9sybQclQRFmjD4kCyWBSbYYCszplpaf1/a+9VHdcWOJB5vV3U2nrpryYW
	1Es1pmvs6ijNUs4WBhXxlhqa79TQ3MZmzNngt7OdcrrzfWW37ppisba2JaFhKktW7WP7SSNTu0o
	B0TGnPM4IwJbLpJ5xgthKeW0AZVWdsIfw5Dcn/qfB2veM6uO4CQLxOEQ4oC9L3vDALZ8Lpnf1yT
	9swWzSss9WvINFkrajhpI+esuGC/XE9man+djYDah8m/I+VTG0Yd6lSyNhC72+s7wbhxc1sYdG6
	fW30xHqhEI7xADZT0sv0+/vXKqANTa6EwOuNYZpad5dnIF+rB6yt4Wc6nPcVqS6xyIcEAnjE39X
	VQ7fhr3+iiCY7+85f4KWhMbH1N0oFkbyI8nWC3jLwbWFr/hcrUu+2YuVwN6mryOvKFRIFF/VVy3
	tmxokzbGHCZduDYewycd0BURaar2qfup3w0JXcmE7qDnoOdvFPlKQ84Q8qNQxOJx5JJ3oBAYBSc
	SniEXqJ9WPHG5+8SbGXR6Tg6ZAJeJ2BsCKn4vtBkT7WktxB+MGuJuMg+Ow54o97gGQBDg9MUvW6
	evNeyVWGAuoj+n95FqM/tEmJhKVZFOtCOC7XXO7kcwdoNv6/BULeEe2+4C5LaTTF8lXziPYU4cC
	PsbgyuQLivVzBQEt0wp8sJyLMYErhAq8Ll4o4tkhfduSvW6E=
X-Received: by 2002:a05:701b:450c:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b39fe87361mr5510996c88.11.1794201386847;
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:16:26 -0800 (PST)
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
Subject: [PATCH v22 01/13] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 14:16:06 +0900
Message-ID: <20261109051618.22506-2-mynameisjune111@gmail.com>
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
