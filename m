Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923614;
	b=WlC1VL8lFGE2A7YKe1a7vm2yy72b2v8soPRCVz/kv43pNQ0Po7PVCuA4iddluub5swk3
	 jaYDemNui19AzRwvG0vXylkp+aErgYxc5nFQsOBVSwvAHx83UyiKjA0xPDvcRg3I/Ai5d
	 HHMx16T+bTcGtQWt5KTPseBQSQXFdsufrZJtV8hdfoYxFmUBaFbvrHKZ6TM9KkN29PXpR
	 W+voYRAj4NANnvsXgVgwMtNLtpOtPg/lQST80a2yTemsRck9GpIGcSV+cEiGBpgapLK0S
	 b/mPPvlIC5wqBg+Jjxqba4hmmCE33lVulK/Bh8jsIi2pILQXI6IXUvqbC67SS5YQ9mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923614;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=mkNtHC+abbHYxKZ3Zqbtia9LKb7G5P935Pt8nLLN/NbX5Yw9zD0JaAstI8T51BX9Jsfm
	 gdfuI6uiQMJYTyhI3fMKahMkkTYElJLiyD3K7vrcfDGEJEXitxZiwOms+P1z6Z8hIsCIJ
	 BVmbr8lJJgelo5Fk/9dPVQ3lmEUTZpglIpuxFCn/iG9Rpf0zHVu4pv9fTvHKqRtUTIT7D
	 sjBKNym8LQxRrMAKvkV/fth5W3HCrX9rkpG9lGMuvSdK3m4T6SSqby5+5mY7KKE2DvAtj
	 Sj+BuV9NDSmb+0DKF2y/G70borCGrlbCawsDUyff7VgIbCFqA8wSOzjumlfBTxnZp/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB24F606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB24F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtC9qfoL
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36fb88ea38cso40367eec.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923613; x=1794528413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=qtC9qfoLIOl8SwNDiqEg0PQFJpaoyL3MUnBvLMIb1ym/hUftiSXJXdt9XbIMw3B2Uk
         SVEBWgj+UVnCSlxt/jPUl3PODiiD2ELoS+/xGxgu7gk1I5/txZhCVJXWnP4Gj2PA6kJD
         ANoKqR65OYSsI3Uw53iGHgZkOS5CmK3B/UuXQWVjnNzo2JSSjGLX6S46ObSV8+isHyBK
         cDMWITKqP7ndTDTepn1KgStLqOiup1byymyjUR3pKQgZud7aW+pDqi8BEuwUstHJpbjx
         UheLtxOnS3lPLZrcCZMAsdxNz3yGyrCzWOw1rIqQBGHKO4QMk/GSsk3ANqTcGt5qfLA8
         CX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923613; x=1794528413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=r7nIELZtlMc638T6CHRAPB67dPFHL5YQAH6tCuGwQ3F+9kdUBYd1YHeY6sqH5yiu5t
         W6jYNFFKQKDHGTjP/yCS4DpC+SC4Im7elIGqM5dAdxi8Ly1/BwD7kqD180B8xB1H0ODx
         gzkxOohnvFTlj6UL/koLi9EAD4BZC7YUSSx/lBUTtMv8B1qhFfeV2Iul0PZw9WA+MaJQ
         s7c15N75oMnLey6p/kL5nQK5nW6ZXHiopV8NWrDVAMiSeyEYLyxg+5oYILBKtnmlVZp3
         ZAPtejG3lpX6loU2UL7LDmpTx2YSQJhpk7nYOevlRFc0YaaELApCoINEb/UCzbj4Qv31
         YROw==
X-Forwarded-Encrypted: i=1; AKwUvBxGDSDZ620AfvZCxR+H40EWM+ew+5J+rfRLFTQY3WgpGQPE1EwaIXGhxqEhfbsMAoiRT0R7evM3DbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/798FoaoQxX++F8BroWjKmRD1lpMdjUjjcWYF56PkU1oWCpc4Y
	J0wY3JnVqt5GT2QC6HFBEo9TKKcKByRMdYk3YoidJ+XqEQd3mIBGN6bH
X-Gm-Gg: AYBFou2inNRJl5plEcdDK01qF4aDRuTyrPRHmtaAkyQBFFDLtXqC3aW9SMyKx1hCahP
	mlgci8nAJxfNkVOpNmVAJfCH+y1FJvfxb+8ibZorsnAh6IZvVxtjmGsZpPKYUHVgGQaK3AtSCZy
	bnuzhT0jc8P5gIkLAD8cUtVVwx1slkcLADy76UFeyijPprCbJIvdho+1m84sz4u3hDWzr5V+q5h
	4BWAICJ6gKgcRG+Nc2SijxkHaBM83iof7F9G6QamSsgBYPUUUooFgv+TDQnDqfyAa5RUmjfzF7j
	4lFDkQ9diDqIAPvfOSSQ/gtIyGHB+pVx6ysIEVn3swU+9amkUiX8To+TscimUOGFjkka4/anKKp
	W5spFAROa8bGZU/rZ8IsaI+wucHKoCkbNwBSiN6JwPi2+E7whX3ucDdRcJSZ5kcOkHNQwqJkEU2
	OYO1KYtu54dj7YvGrFwkYJKWiuRBsn+9j0SJnEKsamXmGKWSwkBLA+oJiatL0hpLF0HKGiAv/01
	JRao9ahVLFergx4QMBecCcrxUvYt3ulV/1QrhiSiZP57ARYCc0n5xytf/bbGlWetKWeT+8UZfer
	BW4h3wGIkp/Y3xzKNsj6D5VPO0sEN72YF12cTsZNfpBpS7JQhJEBReow/dOAxG38wGxbmvSjY1R
	a5je1587e9Cy4BfUZ8gbwpVx/i9aN8e0KS+n1ulLlLRH6U6U=
X-Received: by 2002:a05:701b:260d:b0:1b2:459d:331f with SMTP id a92af1059eb24-1b24f4d01b2mr4820315c88.16.1793923612880;
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.06.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:06:52 -0800 (PST)
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
Subject: [PATCH v18 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri,  6 Nov 2026 09:06:33 +0900
Message-ID: <20261106000644.20460-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
