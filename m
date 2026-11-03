Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693332;
	b=rI0x3eRdOKw5FDVTS/+oIbRciE5wPgfds+zibaq0MzcJIugI2q4s5gg7wJ6I+g5K/5sj
	 f9Bqaw7ElNvndNk5leLoI1hZXduXW9rhJaepr4rMF8x1FXhTJL13cI2UYYhGlY+V2+W18
	 gAQF7vlpdMsmZR9BGUoKbqlI2cIUDYVsxVfytTTmOlsCqxOc9HO01wB1dufnvENbaQBYp
	 0ma3qO+CWLMvpAu01jIRKfgZPr4r+w0Ks+wWNrNdQg/MHcFnxMhOS8JioNRtc+u/jklH8
	 YSlL4S1XoYrAIrj9yv533MfL/g3IatoVqsYCQfPkXzpVVUrrT+EBu3+CC6wCE1dy6ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693332;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
	b=vx+8XzOVNuEWVw/UEQa7/ZJ/PXxnYWO6wW/h9wTdqxPIDL+I75qhrJtqu+YMktOXQRwa
	 A4Fs6K1q17a0PQEe8QqzFGr/lq+yWE7Z1njFizQ+Bh95+MtQosEtHDAu7T2aIANoebfP9
	 iTJEOaWN3C8eO0pOPQS3Li3fsSU6M/KdTubI32Eaw1j8MdPoExSB19ffhBHOA1SINRnPl
	 HtvCvZ0K4BSNwOLHKLk3KT2IMwU8ccTVK4B8Y/rrlaApZ08wQYJcfRERDQpOnW0PAkbG+
	 TIP91fZKryXFtL2Rb/t/0a4g+60TRsz5Z+fK3WQHlS/qttG7oSsP2VxppFgIsMBd2qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B9606A335
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 08:08:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 942B9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fEZPp85k
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36661f953e4so5955137eec.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 00:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693331; x=1794298131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=fEZPp85kJlvBbh0IJ2NzN+HSKzk2HejEAGocdGhx/Od5ZxC8dP0Dvp5hXSD4y6R6ku
         Hi/DQPgs/7xYUIaXnJ/e5yUoDSnFou+M1zWVqGdLxCVdCwQuUa6QjcZtW18zjpynz4rU
         Fv3/+3s4BYDx0bzbGROcu5syr00OBdnrX7Bjy6YbCRx7RxlkTkwwOm9pRO2r/aDPtB7y
         5+vGUWRF8DKKj+4TbY+c5BexZNKNY2w+j2qkQKF8Iw0vgWWC1UMeSgilJN0DH5RQRdIz
         l/sRsRUKElhxyAx3P49AIvN8/MRhmCsshNL++5p1h6drg851LOgerUalNLnyEfRUIfVI
         SB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693331; x=1794298131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cywAFZhsAgp/KuYWOYg1vGaGoupxAXpCdkIyUc+cjWw=;
        b=xKDkWMSK3rYATL6ngjdf/Io2srowQ7dyOlqKNiLbpBFHnA9ogncWB0nSjo9PHMHS9x
         y2g5eD9Y20ckrF1goJv/r4V++bftkhPgcDuGx4yjunjHG8jiUrUGt/avg8xA0Tvld9nB
         VpOZNqd/emsgJ+BqkZPbccX5jJxXI7Es0+VAw1r7BHQo+6SqHzx8LFkO7dAHuSoEKt4T
         0WeatpaelRzNDZM7WNGTb5/jfEPIS6yTVS3HzgHFszin0kvP9q3OsJUh48a3mPsW+KnJ
         w2304aZhtnWsxQo0o/78aJ0Ut/0/Uf52Cz6m/vZTxDFfuO3Tf0KnAEiPE7ogpMO7STHz
         D9PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCDHzkz028f3z+kCXWI+tZ4RJ1VY3IsQWkOorhY/xEvRievFWNyXvnOrm/FPxA7SOn+jcGpuqqXFg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nov25m0xTjdOXQk2VwjoXO41fRrkTdgrSzXNxHGg1n5H7BetY
	XvmajYJY6r4jkFEXzsYDa64XgZrW0Q0XKuoEc51aMiLXv71iFY8q/rAp
X-Gm-Gg: AYBFou01u4wfkbD4jY77Hg1itFV2lhc8cYfq0T3Kc7DLz/PV3IhV+8aEA5LrzjEJCf1
	yMsVdP1ZvexLUiL89uSQ8r/mLc0BnQG/45blg6tFFy8yImjP2qV760Wme0j0+NfW3F55uNymRrx
	ZGvcBRWiQT9netLrlsvQ5A00lIgcgwd07IDHHO2fGX/8wfBTk+t7obPl78Pmo9Y/QhiCe3xUCKz
	pJ7Za5MAbYHlcVUlksM4iBzT9RS18zJzUw6fMDigwVFQeYkwZR4u8/r3jTGd4rv0nLsrcu7Hw/R
	nOMAXreSspsa8kU2naNR3D6KzEnMcIjzks83S9KScGSGcR5E41tfKKuLy3BB+x2owObv71g3OAz
	p8HdOtvLThGtbNjTNeUuWN2VaKBPmT3SSzYZ+I53RvmVktY3G54pH0PqZks0FiJ/IKaK8yLSAme
	07hK5P7pktIgL29rY8Uy8af6pyMjhi/mBg8rkbQYxQJ5nScurLVygCnEzcaA+NY45rLOHJuH5rU
	JqGhpeHgSorByq+RgJYIwUQ/bs8/U0rnditdUAZJ1cf9/8UiKxgY+uMGBEiDKTw/GhpSKDORvdV
	C4flMRIktpNaGVWpWOf//SqgMff2C5rE6hmn8TuA3MrhX06h6d1N2j9Nh8sgkJb/Ic+n4JpfduU
	b2nYr40eY0neZASwDvjLwWoezA3TbEqVPYxsvD5ty4FQ7D8zlrf07539c9OwwUGgGrHxw
X-Received: by 2002:a05:7301:6189:20b0:358:ec5c:bef1 with SMTP id 5a478bee46e88-36a42425486mr17468985eec.39.1793693330692;
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428fa380sm41468466eec.12.2026.11.03.00.08.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 00:08:50 -0800 (PST)
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
Subject: [PATCH v13 07/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Tue,  3 Nov 2026 17:08:16 +0900
Message-ID: <20261103080821.16983-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103080821.16983-1-mynameisjune111@gmail.com>
References: <20261103080821.16983-1-mynameisjune111@gmail.com>
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
