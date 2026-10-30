Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338020;
	b=PG3Ny21dDakSVle2JiBhvKcS02NMsrcimapN407VaYa3x230GggRMcqkTl9LRHXPSZL/
	 tP8BuG6slfIMzEorwyNWz5yeB4hWWdwn+wWgqb7P97xKJHZ8ttiXpImC/gleN+mwTNdAG
	 Zmj7yBOq/58s3d3ePeGYqkzBymu9KlAQKje+qJZFSk7zyHwX0DoY4ipZEojLoXPaVTUXj
	 JpI8gBw6sP0bDf52qNaOiaPB6cyGsvLQHtLxKoh1lGMisLBzOJUwwoqdVpm9kkDDdqNmA
	 LuINWOQRc4ps1fKO1/tOFpE/1sAozw/hTflUqCL6GR5EdzSp+BxkPAdVdTz4e5q2wSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
	b=4XYD9uM4u7nM5Gh3iBtMeRT23/bRNiSiMkOaz+YgYfOr1q1tpeXilvWaqDzFQHfxWawp
	 Qz/I1m4SGbDyQ/rmnpLlhXB+XtfPsier2srC0EmlW4O3L/haX7SoK9BCRjaTxQLEu2sNP
	 JqzTZjKcNitvSwOZf9bfDEspM5O+31JGFGWH62NaDVhrVXzUux+OyIOezCUDPm1k7I5kg
	 d7reUZtSapNRqQ8iKqfHwpF2GPZW8PKKlFcm7AoC1jMaEYxheu8naVMNwdi7H/42Lxelk
	 oY9POJ/lpMWnNEGIKJwhPNte1r36y4vDqv4w1TFlJ+KL+/Hmh1yrtSmybxvGQ3uWaug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF4606A31D
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:26:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76EF4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k3iPL2qk
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cdab9e9761cso169842a12.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338019; x=1793942819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=k3iPL2qkrn5ii0cv0MZSTew3qcDwMegLK9e5Ssy7BJdyMTKpFKVgjYzaFCd7UPfFEo
         sF1GioGfBNgjXHN+Sz3IW2k05yHzp4LHwBdMiw8lCG7yZTlRfGGDhajnaaJSUxAp1Uhb
         Xj0k+/PoVpDpHq4KNlHhVOP315NCVmGWH8zESQNxGJK197CR4vDDuD+qCwm0lLycO2KI
         Sxi3WNbNxaThUI4z7zIpZnjt0CjEdEVi1HmojNSYt99oA9L+AlcxWzISdt4aofJ0utP/
         Kyz1wrOubpzrwcxH8+zMONt49wuIe3aVrCaXW95JZF4r+Fsl6BCrl5m14P2PEG5vIJ7/
         WHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338019; x=1793942819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTf7x6rvt6K8mT1295GgXCNKMEZiEblGXzNlO5X+Nyg=;
        b=X8gfoH8MEwPZLDAufwhkKoHafxnou0qfCfG76c6byD09TPh+dHWlCv5y7NXMMprDva
         FlKeblcwAFUXAiicePcVWtNZeWKgCMpra4GVhvz/opDugyf/JRhYv5ZuIyobJce9aO/M
         jKzsiqnE8bfbuFtTSn76FZn+wSDA8f+z9DOKAIc+Cw+1bP6HFckbrm2hwc5D93p3wgv1
         lAGSrrr5hf9L0W62jMNoA5+oDkFvoiHc28A9MJd+SH0V8Clf26da5bBpzBolqnq4gg4W
         qVS5JvD+JSp19zXh8ZE9sttTB/TLZp/AhCsSYHa5oQnOhNEpDV991dM0hVl36gvISy3F
         M0vQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgATOzB3MEy5VTK1USjW+xULZO0yHVWuOPoAF2xZ6AwfmaJ1+s91bswnJGLwyKGTa+CZdtBGE1uys=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmrscRsq/ehP1AJacUueq40RGMZPb9x4r5IxVAsnFmbcBGYK6K
	a0jxk9pUR8WWKh0a5sDJA6gbFlYyowE7Wehbuu4NilsJzrmaZlenHFAZOxTwTA==
X-Gm-Gg: AYBFou0pNa1KZKx6Zqmfv9dvNXwlvqdCpMsblZXw0pNS1rfu56a8XqBcLHGA4/o9QbX
	Kxl97ZQAZ87CTOd+IOyw6bXsLdClBFqFL59QfWzK/1Bq1T8QXsrigrjkbMDUnpYg2OxQDBL5KXY
	e8SIY1/hv0gaCadKOAzxbxtPjnqvq77jZhBXoe8oSjZi3AXz5CUmIUTDafMBf8Pmzqyb7UWw8c2
	6H7YOwYAw6UmEGDVP/UXTT4DAMhk2o/Ynd6hTT4eSLfq/2TJ2DbmAJmRBmkmsBC+0Xys6McOETI
	tjzGWdbzuEqrA78jIrMpibHAfpCT5MzD/fcVblepaAcFUatlE/21QUJ2SzyiH/dlMmACSPHzO5a
	Ar4WAxeNGQRPOIbt3ixQG2JKhwWh5GwkopMHRT8oxk7W2ueXGRyjskyb2XU9mU9le+Jjf3981JG
	k1yX893KC9ikFFEkiYIkXqPr8Cu+nULOuzsIis2pO5jtj4ae0VdD7M3yOzbamIQu6KLXMtk4X09
	ZwQ/2+m4ZlB/P1nH7TvT27ICoeUfNM1xTdjJbg1bsaDPyE2wQXTUBjSNfhoT+LR8MEqxdGDDZ3M
	8+R5DxjThLvNSphIFCBWZnEIrGlaIMGiI/htHl+bsU6IVDbDCaRtTJUfEVSlorZzmIMU9nooQHC
	7+oXnV7nv4OyxmnluGr1guPtNSFhtRgyJD+FbQGZJqHpIe/I=
X-Received: by 2002:a17:90a:e7cd:b0:3a7:9413:cfae with SMTP id 98e67ed59e1d1-3ae89839170mr906333a91.42.1793338018851;
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.26.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:26:58 -0700 (PDT)
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
Subject: [PATCH v10 07/14] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Fri, 30 Oct 2026 14:26:22 +0900
Message-ID: <20261030052629.27742-8-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
