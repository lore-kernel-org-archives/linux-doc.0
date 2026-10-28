Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180537;
	b=4HZ68KASiPflxYBSwdeozlEWPVv/MBPHCA4gxmru2TqlacbNktuhELP6PadmvY3KnpFz
	 h/hnWeJwdjbZ6TgrF3SmNolnRZv/WYpcKfqipbarekP6YmHI+8C1GSoBe2B4CN0bY7UKU
	 zdUXLQaeC1XNOYEiDL2qpqiffUEuaaoyFDMlC1wEfJWoS8QFdkeF4SR0BBmDyp94QCQEe
	 kMoNf39mTi1EgauuUu4RrA/dJfZqr/mo34qm82WnxO1FuNOY6kczS1bFMZltGFHxpOG8G
	 gT8bzMV618UbSHBVuVXbf3kAfC7kUSjIczQEL6VLWsxKWxoVqFEiMVDghe7a0fR28Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
	b=Q2tm9kmq9josbqj1zfvpbJ86hdAXguqFadzXR8JzmqU2KKR6Q/qFkqaTGpgVrEJxEp59
	 3Vj341h9kbQ0XfcMu1QNInyNcUy1rJ7xYlWtILtcHFXn9zAULfOfUhAxvCALs3ZSmcsX2
	 q0NQQjH+ABaeDqp4kE0AzSGwrgpMiUEkk0zKZs1O8LZNww52XEkMMnRT7BljugQsn3XSp
	 g2R26L3xM8MX8Vq5VLZoxn2S1825jkuYXZZowBjdlFZzKVyn4q1GrhUxeuhNbvTCaoMAN
	 pWYBnrMtcZnUf5VWU0k/oXBrS6GzHQtcJXzewIp5LeK9sJO/bJri6Xv/JWfOd1XdfGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B174606A32C
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B174606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rZbh0t2d
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae0852df46so621832a91.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180536; x=1793785336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=rZbh0t2dmtNId58W/OtED9F3sw76uxXRb0O+OwMvyUJJaVsbHftF8j1pg2EwLWaz7I
         90beBK4z7uYVZsfIyBSF4G+ep2N/6aDaekU1oTnnOXCbGpTMegO4qFxbpmRQh366PwG2
         s4mHTUV2Ctp4Nk81hls3/aIq3Js2N2+i4G/zkSizwvtJCRPAMNnu/yf6RUNjkdhKXILR
         8G4a80frNDlki8clJWblQcIA62hTaIkIc6xBUyB7u6pGTiVZc4zL9YNEl8CTJYFoiP6p
         NAQOLrZrsKCpn2H09k1enpC0rfGeP9BeombpyAWwg6yMDX3X2lqejfrbBcdEcIbM1uCj
         JaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180536; x=1793785336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CeA2XEPxOKnOzt895+30F+e+QxZmzFzIqeYcgTjPdbI=;
        b=MzM5/t63Y7UmGxYQiDPj0oSOAZLYdxifwIgXy0xoT9+eQoXfXOz9uhpq14zXeSAmaR
         Z2bo2vrXbz12nIUrpszXKOx+/BasxJOAguy0qLJEeVnFvWzu/YTFKeay9gYD9IEiG/Ad
         AHyHWDVYk+v8OeSiH0ZCXCk3DHhCm3vo7+WU6FgwpU+jdCoptarWRHTk5D8lBIJgNyNY
         tI/6ZmRQ2m/fjN8YTT/cNMtf33WUIzGBJtDc4ujRxTx1+9cBj7aHqMTD+w/Sue8mgSi5
         qz+xC/qaT5nUiC8DA+heQ37SltptDQLaJ0n9MiS/Y+hMIxTjPu2SOiX9p1OE35VavCP2
         cOkg==
X-Forwarded-Encrypted: i=1; AKwUvBysl37MfgNORW/bq/QrjjaA8AqMfV/8zRXc6kAZIVbajsg9KDeNGtiwGJRogotZgfzaEDEuHtQ3ZK8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy2Ze1huH42KELLufyoB0PPBq3y+fUi6l2dj3+SgcCMVsGGP1U
	D9ijtZhuV/PaxKF4dgnpyS7WWl6VmJsg/OY767uMYXGEcgW6tEvSjGDm
X-Gm-Gg: AYBFou1WgyzM41+g15PAPCBGk60Y/kZwQiBSTsJ0S0sGwK1cD8pzYJykW2P1q8wWROh
	sUwFKYydfzxeTch5pnOVF8sZqZgq158ZC95kYPBD3pPqQ1meEI/3symfHLYPaIWicVtqM2thDdV
	Ql2jcZiwSaRGWVitnZvzs/xhml+utoWVFstfFH+JMHBY45H4u0NwNa9E9sFf4A4rL78OkTDVOOO
	nhg+CKgiTDoWr4sQ2gZONurgljAbviR8/nVHl456hm7L0a2v7tvJoqrQzY4ls/c3FM9ZPNqyrHS
	sSuKy31tJwWGwLDBAb2n7RXsT4rQBofklrYlT4FNGyzLevkCyt73WDQouXHyTejm/S+6stT1Z2u
	RMBJxyTzOKy0P1tENiWeikezt1rRzCZq7tA/J3hcwpXPcbez/JlmE6mpZ2GXOFBHXInJVeDAYvk
	rtHrDjgYJG9WpYwpfOMxiah/IInGKNFn+oXphgnXs7PFHxJWJYEMDQba/F9H0ixB84QBeHBT7om
	5GkaJCU/mWQtthcqKPd7qihEHclS9ZQR+ls+yM8utHhlEEe9DbIIU/OdsBL9fg0Cdne7fR6SG1I
	HZtY3g9Nk9VrLjcUtSt2FqAp72vRqd8k7fDjuTRHT2FT9ENosVY6oeIN0IUn11V+Ip6AIGVJVPU
	GhtLh8Tyh5o0U6dtMKolCoDtkRHrny4u0L8eESvO0F7vy7HJW06/RaUw0DysIuu3t7ykS
X-Received: by 2002:a17:90b:4b01:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3ae5c6c4316mr584601a91.1.1793180536606;
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a93b3f5sm2242377a91.5.2026.10.28.02.42.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 02:42:16 -0700 (PDT)
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
Subject: [PATCH v7 10/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 28 Oct 2026 18:41:26 +0900
Message-ID: <20261028094132.20364-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261028094132.20364-1-mynameisjune111@gmail.com>
References: <20261028094132.20364-1-mynameisjune111@gmail.com>
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
READ_ONCE policy sampling in the following patch.

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
