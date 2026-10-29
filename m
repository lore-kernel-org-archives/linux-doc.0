Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263872;
	b=nQBaKcNcyHBYs2bMsQbEO3U+1RylC8oXkKthIv2uFuObXYLgU7aFuOAGVrHhW8gpI3hG
	 0VN4rNptfO6cxmwCOR14tfb+XKjOFFeCTdzLH108XWPyTcHbd0Bs+fxIONn5yv6baZV/r
	 hcbbzJD08pS5bSprF1k+/gQw1fjzs0g3XdPwWEHpgNYpyLIdgIwyk1VSCgDU6ESNFmLXc
	 DQOSbPKeY+9GCtzC3iRBsHMwzouV14Opl0b6Kq/7FtViAbzK3MruoLrtVZYgTANv69NMM
	 +W/7OZScAieHkXvpJR5v6n3lfn+ZFG5Ghu7i7oMpNKfsWdsCv3yEefz1VreGPfejgHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=OnTUL/dpq+NhLSpGfJLqTq45ZFHyFqChevSZ3Uo4pMA6uCJTs5wUeIZDzB/KwoejrEJx
	 lyYGqV9Uhc7dJoIAEBYDCLdUziMBacK3RPD7/UChWR+nvj2YKKIX2n0N2xiLfideklshM
	 rU5An986Ham4+1z8urPus1Tvv4LZnBRdJBOl1RQhGP95+/kE6tuTIjH35hvvJr/hzZBya
	 oAb9DTn0nPCB17vy7K/ckOHumRB2Wy6UI6ExwDlgUkblPgBFzojozADIS8jZ/oKOv9kpS
	 QHiG23a9g5+Rp+zznJ7RQJHK4UW4tXj8JULCNXaGJo0BlhxSLiNxfipl+H5VXbS7GpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BC9606A31C
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 08:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4BC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xcvVyl1U
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9ae391a05so3608755ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263871; x=1793868671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=xcvVyl1UK+hhO2fTI7lH5vns5F8yjWGhFUMSks+bbyK0vuanDc9OwXfxOuwnzJkzew
         rbQqQ966CBmd7i3OmFUq8Qwg3bHWKDstZnrIxjUILrNC+dD+7Zoy9M/ovJt3ITS+tvKl
         Hg6EUPhNm2eqf7hNzdBBs1HKFIlfLX0n5ragIz72/CX2aFItaGVdiRcBd3Qi2/JuqXCj
         u+geZUQpxGfj/gbbbTIKmlv/SC5GdxfMw7CaV+y6p+vQ91YHNUik7jymZ470grNl5d3O
         zvY9DlWIiaoaAH3Z2/jOEe6F/BvPeeGon4QSU9UePie1YMkMPzHbv2ZEBBCBTF0I0d1G
         btEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263871; x=1793868671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=TYhu22/nU56Dq6MEtxyAEDYcWMUu4Awe3j2LHEyznyoyPG9Vi0YFMEYRltx1dfo9YT
         8TrEPbF/5YZZW6uFm6aT6UQTeJCwBsjuXTHZqtblj/TvwVfU/GBRsRicEOznm7YAk/SG
         Wds5xHREs0coQ/Gkgbd+iN9RglQTVMEPQMk0qjU2uyx8wk7sqlYTNMjdKTOPDgrCVEmM
         3l88nqph8ERK6YfsbTuMyqedWRdOSsruHnywgZMjxAqfW+SWtB0fAr+sP4SF25KNHuOw
         pwyN0rOsC0dm8kuD2NAmgPnNpHnPUZKr5JL97W6xoMUsZcPByo1eekoPOjITAwJPwaOZ
         oL2A==
X-Forwarded-Encrypted: i=1; AKwUvBwGleRu9V8glMiwqaHltD5LfoSQ4C9EUxOWPSyO55BpSQpm5vrfEklPhG987hzzzeVlUDx0KQ71lmc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlPxWEwHaeN3aQVighBFnliHrxsF2kWnTPnMRRhJaELy+Py01y
	aHPxHgJCBXB7MkWx0O38zX6FPjsd5fkuBVTE8msVUtw3r5f98Ct6qmKW
X-Gm-Gg: AYBFou1z6grUF3Ye9cC3of5vT7fMrCTstssremT7xYrkZBxiQri+wjKSbAAhmps2hd3
	bTUGX0I9FrxO9dYg419tTjOv7ccV8LHEnPOuPy1xXUOUYpeE3OmtnOnh2Ewk1KgcBJCxbtHL5yF
	Cf3oPO+Uyjf13gdpOMkP5brmCGm0/EDrsS5FZ461PH4T0Mg6NIHkB1xN+vi4KE2PZQBtnO3AnyN
	M4wxJwGLZl49Ln8i6+kcfYGmCOGShH7avJsiz9nzL327l5j8oKsUwjc1l4x6vn2js3Zg/KyZXOd
	MJ/ZzpEOaaD8/w9F4hZKfzTNMTfH9oGcxCzpdwnRjpw8sIhIhVjapX18Kw7fu4SDmIcJ0ZAmgi+
	a1aiIH4oGIjE1pj9eAWFUzLZW22+WL5NM/JmVqaWcM2YexzwALgk2Qb6Nbcjer44Qfe3eOlsUiB
	vhL6vsN27nkuC+El3xafa+whF2qnE3HgnmYVCjD329h7v14DXjU3195814xmAAW3jsaS7Oj51fs
	QEJ4wIi/f8RTRyYfMyKSyN+PZP+MfRZb2UeYZ/+ni1OGv+tEqQAVIGMD0r4hs7fJ2miDBVx8eQU
	Op85iWZKhRP2b7JNzgxKR6ez4FyYV7XNYYuJrl2kQwOY+TBWThd8VVEQXakTjokmHXPKCdSNRtN
	58o9RhcEuS1KV3U25et3Xy9glZ62pV1z/dUIFyXD4xA==
X-Received: by 2002:a17:903:19e7:b0:2e9:64b9:a338 with SMTP id d9443c01a7336-2eb1aab220cmr12773445ad.7.1793263871292;
        Thu, 29 Oct 2026 01:51:11 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bddae0sm29991205ad.35.2026.10.29.01.51.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:51:10 -0700 (PDT)
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
Subject: [PATCH v9 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 29 Oct 2026 17:50:25 +0900
Message-ID: <20261029085032.70689-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029085032.70689-1-mynameisjune111@gmail.com>
References: <20261029085032.70689-1-mynameisjune111@gmail.com>
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
