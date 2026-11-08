Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182110;
	b=lPvqW92OzSU6AIVKjENxhS3d01uxoecUYL67Hlv0XxW82UBEtnjTFewmPTZ2QuJE1+Uq
	 PsHpFgjZvWV/lzl0AouP2/78sMLhWFRImf+lMCz3FLXiiAmyWkLuNNA2qJOq5/Ml/W6G2
	 vD7R1jki3QmzPObNB+LY7kXYHUFgxgrgTl4NIC96E0succcwrOEfyMrS1XDv26x7H3Gm/
	 Rx789Vx27A6V71ifTtDDhykQtIN5k2PqZqvocdcjW7SRkqZwsdvspwC/NWU0zCnEZa0R6
	 CYuVsBKlg2o6Dx9jmGCptJUP5271mZKndXbUQYHS0I6HegueyqLXWR85dNtlnv9IhPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=xyxAevrJRBpEOEJZDQAqgU2od7qJYffFTTmLs9zKP9EtJx/qwx8t12RsA0MAy4KzhoEA
	 GC7JB+808sRKYOI64gNhr0+x8VLsiUR77AmyVquGAoE+SMf3+8DpJOz6DD9EqmmcFanon
	 BMKglyxXWuA7ZP3+8feEhabiBydM9TtnwDRhulLlxzpGPowTlnVJuhHhnDGuqZrygl0dA
	 t4TYpothWOewaNCg8UTLjNXYTEEuQelW/DhhKg/DUWYCeJSfFeHT/FEU6bZK9de7omZQ/
	 yc4CaUu1Aj4GMS37vJak2S7vGz1BpOkJg0Pt39gR8T0XHz3P4s17OLUB8q+kJgbfjXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1BF606A320
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:55:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E1BF606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kcUIo68R
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso1664345ad.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182109; x=1794786909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=kcUIo68RUScRY0ZqUggpTUfqo+8eYwH1EDLHD9KKqiPbN2cs8Vl0f8o9MgEKge2UQP
         k5NuTFWfBjUDq+qkDH1a30+Ct+MxtIV8trUWsPC1VvHuhfbuFEFmDaCPV0K2glNaIh9B
         2oFmhi0KqgIBTkWOCc6wcSHxn+ICs4yi4ZNJ8BM6089J/KlGzfo7d4dTekkUmL2IWmRz
         XFVlhbrFWn8XKL01NYr8Yg+w+4w8DE3XUG48+O749rwxK5zR7UPPjlTL+rDmJ/mboZZ9
         g5uHw0fgfFtvn/sebL9kb9WrTAd8eClTeZ0Cjwxzrk0PhGdAthj0h4QGlmHb0scgfs9G
         eatw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182109; x=1794786909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=2fG7bCykGzKXgncFlkGJ+CrFDs3bigbfWibrPvM9XnDoPnTWjgwce2zCT07/U8wM/U
         J1OT/AQKMytXTtotlpXwG8VlKKkNhe7n+FcBkGNIZSYNv/UpaUaphxPWAUnQzLt1JEBs
         ntKAMRe5urS+2429OvKlQDfi7QbrupnbRx0jy1KZ4ty3wEgi9TDJLmhEvOxgNr1YHMZi
         1R0fqOv/+dS2FcrI7LBjC+a3WxTKup7NTUrdsFiqgQZMUPZRaImL1ek67TbJ1VHYH2RL
         Mll2DJOxP436ExhQbGX9ZIeTDx4ifpcstedwvLeSdgXm03SbTCQYJtZBD1GEl4hvB1JK
         zg6g==
X-Forwarded-Encrypted: i=1; AL+hErGAtF7+QLlVKXtRFEIp7Guu7ML+U3vHT655ZpC1CDva6JIAsAWPrTLP+XYSnj+/hRKzuQJcLcjl3GE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bWMk6psPIKuJF6AXa1QZ4Ozs0RZaFWwdE7IqM/wWhAN9jfgyK
	XxauBVY55XtvPtG+XuL0AOy4hmUmvjnMFd0mkRp5aDv+i3TYiSAwt0fX
X-Gm-Gg: AYBFou3LePUt3Od1UxT9eNmGIQa4cpAXxehmgcoEUODcaFQRQE6YJfP2nvNRurbbjWU
	ADp9NVdEtuJN13spQ4E+YozEFVDGgPITVf//v/ThwhwcHWYltbKW7Znbxev3JzW8Eo1i1niCM+J
	vKugZvZBMUggPZ/mbhYuXwAzjOZobALNZMusq37KJ2VAuU1MzpRzmt/3BgjsfVDKz7d6LjKdvbq
	inPo/3zc/kQH40+9AlnxbGbP72xjJO5FXjCEsKDweII7CQbyJkPvuCHhQqbmOX9whtQKH++6j/7
	Yb2PaJC+7O7MsCqrEaeuBHLMfaKf+aoC133+cEDEoK/oh9FEnZKgesy3ulctTACrotTAqgTIn0b
	w25GAJM4Yeb26sojT1ImfYA3dYp7pUJBZ3kY+tsWBib7UwRL89wy7YPZfXNSM0xoA9qZPoo+n7+
	jQTNQJIasilf7xaMwenCtAzAUmdB9flY++T5Hyp+JDxF7mtnYG4QOlBML6YOuBlYqiQPf268sBr
	vaqXzM99D+nUtpXh4M+fkXycgVUTNu/zPxyooTKL0miwoHdxiSv7ovkV6haqKm4+uWZVewKTMaJ
	Kxr8+G36TPNvgLnncTuEJu3RXOCnJufHBA2rGeOHT+lwINlSRcPgxdr473IK0CLENMGvMexjTtX
	Qvq8o0CqDdRNPlp2pVFN9oZjAz8cKPKDNb3aqpWarLX/PZjOQQdzNnzH1gQogIU9E2Efw
X-Received: by 2002:a17:903:2289:b0:2dd:c100:4b76 with SMTP id d9443c01a7336-2ed8378477amr25176185ad.45.1794182109426;
        Sun, 08 Nov 2026 15:55:09 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:55:08 -0800 (PST)
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
Subject: [PATCH v21 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Mon,  9 Nov 2026 08:54:46 +0900
Message-ID: <20261108235457.12688-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
