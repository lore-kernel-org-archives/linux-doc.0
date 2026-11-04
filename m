Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758677;
	b=uEw0+/XGc41uE3zzRzcjQ2qWkWepfNisvtPk6navUcqYUCIecH6SxhZJyzu/cB+fKi1G
	 /nxS5qQWYOZ6CWl74cyo+MQZybu9MKBq0ElTU10AqCRXaMDxUTqxZPSvXBKhbeUw8n2rd
	 UggaaFAnZ9m+zTNc5rbfDFCcm/+Lml4EpTAxRv8y7/pefnfqvoOanGo0evrTj0tCqU2o1
	 dtZQI34riArO0O9eGoBfPe+t5gx41Gg+nlOTnSsY/QuS7BcX6gJWCdlKTkgtOb9gzEI35
	 PHm9Znc/EgaoF+B1xCHP10p6YDvDTw+7NIZeXhv+YQtRtf+RUoIuT+b2Nbg3mN+cwLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
	b=LkiXYsUCHCG+xlj3+eB8/OBhuGGPhFrhj7T6OIGkk4uoKAB9Zo8gnRGeBvLFljE/7dWb
	 LIod5W7OdWkxvcFaxmZjTGczi04J1+/iO/tfyOsk1R90qAaQevU+9/Q1Vmo7fq8bxtall
	 KxcGowsO5Fs2ZfIEKm3E4ju23Slr732ml71BZ2VlGxOt1Ed5dc+ulmX7MQoOhAYm4WuoI
	 O/C9zYnHjZhSI4ymkee8ueDg6jQZ8mIYOVSp3IU0E+JCy8EFoKSwb4hqZAxspFypHNHRb
	 HMqlB2Tt4u568qUk2t5ZCq1mJfgaEGVeubeYX9VWa87hQmslD3VzLcoqxPKwunlh2QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A411606A330
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A411606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VXVJxd45
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso108386a12.3
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758676; x=1794363476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=VXVJxd45zz8QpVB5JFLOxvi7OiNrlNeel4et1ZZx/4I1QqBYe+XSER0oQowVoMs6+Q
         CfpH2MH/ONQQbQcOeu88iCjoW0gQ0hxwD+Y8oV3h/863ZXSTZ2jwjyZNqjCSGXWmYAHL
         kn9cU/6kB+MkIKImgHRourQpaauVeXOh2fVKr4d8R81i2yC6397IVv/1bWDKGBgeeMCS
         +XGY+c70W5mKXAHPlpLGA+n0sMhSTvYDLnkH2CbmFrOGISjEaoERAZvS6KimqkxjPdS/
         UA19cZswZyO8X0Pqubszxqfeo979s8FSV0Mhp1W1YKnaraBf9+37PRV0oDGEneWxmnZu
         TjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758676; x=1794363476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BWMu6D/YafB12/Y+mikOxNZXkHRbVUuoM1lrNSU8E/Y=;
        b=tLfFDMBpHlmQDWTJkvsYqMtTwiXXfKqVz61qsVGWVk5dFPzUWcp4PFmjELoKLLqCxN
         aAaJ9/UpqgpAs8Xsgj/chzwympk+k70IoHhxmc8UuQton1ElJYqvLCZsI+CsyPFkmN8Q
         iWhY7ExpKYKPWkMKHF6QzH9dO9JiyyAbVRr6B3QZ/jaWustbimr9KqvJQE3DIaBke4+U
         URm6rqm225g3vbiJo3aOopuz4oTVWlrPCGoklKRhj9HDpYTtRmbWSznZeDjuRuSfqkLh
         7r/AXakgHxH+Awk3A6P/Rk2Rl0sHEUwd26yI9T+PAGKS0nOUeZKjzg5DhgiDnJf12UHW
         aztA==
X-Forwarded-Encrypted: i=1; AKwUvBwWnmNGqKO+cSlrAjbCzHnJaVVx+6Bl2og67RjoirzgIJ/0H4YjsKYFzAjkH5RgzuLuFIELpsZm8wE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/jMHPH66CrswNeUb1FYJIr5ptSfi6O7IiJwjAAM04CRu7ixRT
	jdoBT7YpK/Jvi1REtFdV2ekxnE15jBW/U/QWJCPuAVEWuri1oBrSVatx
X-Gm-Gg: AYBFou2GyxdNKrbVe1hqBmvpLtm8AME5y4V/AyA88/tQcuXbpe5+D65UiAG6wGul+es
	y3yQcjtqhHSO2LcCNs21ZTtG0Kh9z28yxFTL+PiVCiLsLDVsUITbjn+8yHG+sMJVfobi5XU85dF
	oEukkubdWje+Y9WLmIRr+VJulmTiY8BQ7M9z5U/uQETfCqbpfu4z2wqb2IbaHT9dzKVzIV/Ly69
	K+qNYv0Pr6okn+cd//4NOk/lp3TASI3P6+KVilWc3YPGWfhravGjy4GXl0uffy5sMYwyWkh7Bc0
	zUq7l18tQ60vS22VsIYzYIiFyDVHTCApqIySM6Qh1Cjg4XAFijDdU3B9hbXjem8GExm1PFBqlCK
	BJSthJpeyzDpOJ4ISjbdd5S9Uyzcj52kzNEiuFDNJsbs8s2wyxPr03JOyggYMdNAGF+lM7vOnwS
	IUexFIfhejb1sAK8B6XUjQx00ykiqFLd3jwgQ2AluGPng7fPzN9Q5uk/S3c3VkW4nZrSrv7bSV4
	Zlo7PGhDyLU7eegBzBp6Nvz3oKJY0v8PiqCBYhTm6QijTUjk3iTbamtOXzZA8bvR0zWnHldqMD1
	Mo5d4hPQlOjNE5Fp/K2/Sq9zMdzLZqQ0OiqbbYmX+XXewTFNjtXyeZtA9mT8inxEWzshQ6ZeKx2
	115/ZZ3Z1jx+mI1uZC0f1Hn4jWh41I6ld4YFlOP3EanFe1a2sjqbZDTvQJr4BnrX2gRvb
X-Received: by 2002:a17:90b:3d4e:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3ae8981e41fmr11117473a91.37.1793758676321;
        Tue, 03 Nov 2026 18:17:56 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.17.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:17:55 -0800 (PST)
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
Subject: [PATCH v14 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed,  4 Nov 2026 11:17:34 +0900
Message-ID: <20261104021745.57733-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104021745.57733-1-mynameisjune111@gmail.com>
References: <20261104021745.57733-1-mynameisjune111@gmail.com>
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
