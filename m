Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458126;
	b=TykaSN/bul04wZEotCFBZ5vkjrS9nJs6jaqNIxxjvbTZJy08ZK5FU/dQfrR/jFD8F/Cg
	 JpZj5ejbRrcyg8UOy/hcfXHTlX6drrsmcqMl+gKKqGxpeFbLPkGa9r9aNvRgg+H+gRg2C
	 /W8y+IKC33Ek4haDiAiXbUGGbTasCMUsc5JfBsoiiIKX0yasWdM08k86U8TSndyxANmRG
	 ev6MffY9kbV+meMsbjyVOxutysGsyVzR8A6CgG4jbXt2wOJU7bZK1RDMHpvrKE5Pr31Gd
	 ikDDO8ul+5JqZ2N7cQw/L5lUewTQ7rD0xmMEGjbdIJIrq7ZyXN5vak3o4RgKQgh3CUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=0r9sZjaiUHo6D3lHJ40vxZCm4ZxyPxdXht5D4pT4fFJ3Ino04NiAHdwL2TNTMewqjKT6
	 65fctmfr6RBGCBmQiGFOv1ZSf4x0GiejhOos3rDS9zCd1pnQx/xa7cU5+KNGtVJjVw5KL
	 UQ8DnaikGHEX27VV87CnEa+ifhNjD3sXSKxZghev5XpgdRhTrx2bsWeA59A02BikJEUln
	 oermHYQzM2KhG6kENmu4wbf6i0uylnRAYddldcYFFzf+8CYMErWfOVTqwpXY0bntr/Dk9
	 GbFAllxJFcx9Njpys5LOF2nHmXuOQDNXZl6mTyF3e2dOjYP9poHVUFvhBSe+MUksNTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EE2606A33F
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 04:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EE2606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yTvywWgH
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b09a65c76dso2856589a91.1
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 20:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794458125; x=1795062925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=yTvywWgHaB992/+07jJ8uPgYTmnXdgn6Z8/+qEQyE+82utOKU56zTXNXGPaeE95+aj
         lZAZYLzRF8bw4BE1idhj02EZBEVmoPHxfeyCoyqDI9Egq9qgm8EbZyrUXAsDfuptHLyj
         3zX2KSAPP/wTp0BT0wVYjhLidnoODgAlfK0H6+fea9DZtGF+J734WV+Oy0ue3NMorXIz
         ddVyVfZ65PEXS5YNiy+UpwZ8RQcd42nZoMJlO3k8Ia2NEr03mqdsWrisod8M5QLzhopI
         qrH6i41uE4VOSkm3oPWTD4eCnq1EYni3Wlg2npbtpf09c/0PQGb9lGyuymwRruqn/Xu3
         pQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458125; x=1795062925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=soFCo6StY84TIN0JUyosD77wg/uxC4TgZEtFl6wuI++7r1ZblZYPERq3/2YbpeqD14
         dYUaIuDXf4SyHb3aageTPlASrUxvcUY8VxYjuJDsbh2+jEG0tZ88r9EHeO/V82VIg4oZ
         PhpVpyoKW43xssV60OikHrdpiEbIxYF4dDh25bLT0ka5Mg5IJnDfbxtu51wp1kykYQB4
         4MquWqsvM2cL3cd7I5zpbCYmJYci6vQTGudj12ASWb90keqNTD9ABQ6NWM55qvxF7Nva
         DWTUkeZ6OkVQBWD85GbR8agEIj4oHiXc8J4Lwnc1r5LPkEaRyuvqMiGka+PRbwDzZtXZ
         YPMw==
X-Forwarded-Encrypted: i=1; AL+hErHOTNS3wYNQ87vE7zGwtkZUCEPLd9u6OL4qznTuGbWc9jHgc9yl6T9dnKHROo+Aq5NPgFnomk69nAA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SI8zXnikxZDeHT8jfbTbnOuoQ2WkwQ7hKWpQXIp3BcXDYjsID
	D2YF8tSs1lQD32Tm/YU+8pSLwsFxYu20rYwHtD+vRBxbPMiH9MgMmc2F
X-Gm-Gg: AYBFou2JQiVG7kqeDRxiLk8K/Uf4ICM7id7lURJlyTwpFhQDk45j+r8hn855zFm3uuU
	1/L9pFI4Mf1l5Qi7rJyjOdLGQmdGl2QWbRZNWt+YxQfjUc2q3q9h10rKtVmflezXpnq3R7Rd4TS
	HBHm7poWEdlJJWCqPuqWH2n+aDA8J3Vro39ibcSo307nLPyH8puOOMYQDuFWuijE6AWGLWFUYkt
	6jxm1gq/iF40JPGqh/O1NHlW+qTxwr0dtyH4qgchCChdfBThUOjxOO8nkbOgQ9K30Tis1/TY5Z3
	r4eNIAerB/gXLqDcLVopb+yNaLFA5Qe7wv6ZaZpK0T8QLvbZ3Ns6mh+J1jpXRDPalcuvVHf/Sks
	0205ewW7RzDBWFKATc3DuPZ4zSZdYVoE0pTssSUdZ75962ous4mlXbO1RPre+EpW+/Iwh8jTq8s
	m07iLxGOL/ZxUrnxiBiMYJAETB45lfagQaS08DWboZd49lYPzyso71NqTsuqP+vhbXiDS3UjDid
	usfswJv68EuBPiz3WTxmhVxDxiL3086GS+0nxP8HIxAdrV+neGgHAFwTQhLZ6ZRR3kSkZs8Oeg6
	gYzij6C1lQJwAH/ftxv9+B89NDj5dOzK8e/PzzMvxApFq5EaaXrKN8Nuvw80ZJNyphdhaNFS3k3
	Pto+t/ETz5EMr5JgxutSy/bBUF4FM7uIz3uw49hcXsQtliKc=
X-Received: by 2002:a17:90a:ec83:b0:3b0:a38a:6715 with SMTP id 98e67ed59e1d1-3b182f61eb7mr4107773a91.59.1794458125200;
        Wed, 11 Nov 2026 20:35:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c8b287sm2470466a91.15.2026.11.11.20.35.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 20:35:24 -0800 (PST)
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
Subject: [PATCH v28 01/17] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu, 12 Nov 2026 13:35:00 +0900
Message-ID: <20261112043516.37010-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112043516.37010-1-mynameisjune111@gmail.com>
References: <20261112043516.37010-1-mynameisjune111@gmail.com>
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
