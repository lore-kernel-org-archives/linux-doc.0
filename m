Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845912;
	b=35JzTatB9HIwNnsXnzgVW9gI8HvyQRAPB3JWpdKopydXj75SZmz/rawpZSuUtLwcKbxE
	 SnTWR6rpkKjIKj1QmD9zgDAaVn5sfuK+V3/AzlY2N1rR7wl98+i2zgBOpwotwUq6om+s5
	 ooRToBpVSbvhNTKDv/iffzWPclOBPxBSOmAMXnLQQDN2xKa4ef6KySVfToP0K8JYVrjNi
	 kRMq5E1bRl1+2HZfUyb1cmREhI2+i8AbQivqtovWgJc9XXnkt9Cn+rFk6lyL9DAGQzivH
	 yB7aSgKLFg9ylNLQu+XaF9cru1b/efJQL5ObbXG2Lh4o1V3L3kCm6gjbTmYH+miH/VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=qgj6x2RKDxMTevOJ80Kuy0yGr04u5+kn3P+S54IPVQPy91SPBsDUhRY6ZwsO07o/HehU
	 3ULK2jVcfmq0SB5r1dAik5/7PsE526N1xqrGkZZGEacQ4JE+mjyiY4GiAntJN7ab6vwks
	 UpRRvuL2w4Bt5aI67D7aE0HG58hP6PysrdHqOoreE/KLPNRO77zfSsjlqdH+pTqhueffZ
	 BeEV0UwiytJhJas/VTliksNJOFJniPz8lXffM6J/9sPbsXTOrAxyoaSMLLlx8bbvHA4wz
	 tclVkFrVWQkAKnYbjYEdhTEkZ8msbfVLmb2kB8E1UhVTX1wmB3CDixIjZoYQBULormA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ERWZzjP/";
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4A606A32E
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 02:31:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB4A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ERWZzjP/
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb45e96d2bso542115a12.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 18:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793845911; x=1794450711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=ERWZzjP/Jgq+vdv/PRd4mYf6G0EIVbYd65eH1Xsd5vkwNTW/SwBNjvM9nRTjZq5xGx
         pNMlhQO8KmtfdU6vuY3zT9PAmamJe4yREYs7MNabfqW3IHknPM/oeb/D/Pcy573qB+xV
         7+39y+aYqlCIAToZ9bjPxA/i3AoOZ6TzQ/aWdY0XH2f9NKv8qUwHYpJFqutcYAuJj7u/
         4S6+d/if2rnINHVd//HZexiH5bWOECeG6xh5fHzoFA42Xpdv19icKnVyllQMbyejOvbY
         SgQ2u96rwzE/FKBgMBsZwBj7SY+yA+hSL1chQ5wkC/+lu703bezXl0//LLyinjn1Vazi
         axZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793845911; x=1794450711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=nv7sJy4ATO+HLA2p9jUsy+HKnwH1WYYHDAgOiRih/hzKOss7JMZ9Cizg08lrR0hg7e
         uth7QTShNW7TwMQeCCGozSn5OgBeeFBNF3p6wB333iR6VCIRAx0vHhhqXDEJ6o260+1R
         8b5E0/XErpfugifhYiRmywiFTNcVUaTI1MFdXsUxAtx6V647sZwUTMvOdIJxnFBRfrQg
         X27vRWnmn5lCHjRXhtC6cVd/BNUibdZMzLbscsSOqOH70JGxZMk4edILlU0o6ah2T/54
         HhTObjv0hJk0Hl+8TUU8H9Of1O5bFtlXuoJoovrSBHc0ATp7aFSgXYNLyowP/BnaCpxt
         XJAA==
X-Forwarded-Encrypted: i=1; AKwUvBywUUyGG9H7COPJ4xaRA1enMjldQductRoAabMmb5G/ALfpY0SQofhuy7rU3YDdfXXKwvUhJCwTvks=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s/9Mg+ScusSqp8J6hb1js90xY33pSDyHqUPQtDLrQCQyI6Q9p
	ID4BOJ4bCayH9sGjnek6F/44KDhprEPLbpinxvT117r4/KQ2SDTiXpVL
X-Gm-Gg: AYBFou3+Qx0quk3amPNkYj3jPjLT/fkPwTqmIUNL+Kv4blPkl8F5hmAIaF+xHWChUU2
	JUsyrXfjWuFeiOJtioNrVlc766pT9PBT6DWXBwhFhO9xA92zqFkrUUfDZT0ul6k3SNePYful3Le
	q16OIBrJ9cpWzl/ytULbp1iNE70gAg8pdFSt2kJCaJcnHKCOHBDQvfUzXhdgnylmICMhlbY/NkJ
	9ileJFuzEB6dRHkwu/JoJdTMgNy5tLlV7YqvMrxdIB9rYz9ZLqDDbdoK7t2sL5FE+1ni+OGgr77
	zAp/gvzIbOWX+SI3LH4fd71tbmqjGBPH4VA8MEReYXiBMuhFPcr6cANu1fZBru2mfN2JVpocvAZ
	Td/EIfpT09HqrtrO3QSwaxRXrw9DwiWgPip8dKbgDbNdc77vYxdZ/68OzN0ubQUPz9zx7em8aqE
	JB4Rumwf8GYOWmQAo1Z7kHJ+BpVvjHR60eww+NjZtS0KpiFfw4mWVSAIhNq7bHbwNsHT8n61ZFs
	Gllb8f0hnjOWXtxMrp9cujQgCVZaFtEnzblhRhRUg192ycjbPKseSYAGVY0a1OUxsqTgqBmrT0n
	NzExyr/Br3BYUW/ULcioo7r3kH5d+giasMt2TCcQEwHg3LpMPp4a0qoySxINzSiPfvll6TppXBw
	lhwNlnS7Ot/9m3JtUK5jYEuW6VL1/owDcEPj8UO9uaPjfBBI=
X-Received: by 2002:a17:90b:3c08:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ae897a64b7mr15530386a91.52.1793845910857;
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd3csm1292775a91.3.2026.11.04.18.31.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 18:31:50 -0800 (PST)
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
Subject: [PATCH v16 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 11:31:29 +0900
Message-ID: <20261105023140.18373-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105023140.18373-1-mynameisjune111@gmail.com>
References: <20261105023140.18373-1-mynameisjune111@gmail.com>
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
