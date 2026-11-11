Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355554;
	b=k8vIcpYODXzAhk/KtdCnRqIn7CjJpsMNbzEwoLJSfQtNGpzG2UMrGffyyXQSgvhMJ4x4
	 VvfdtpNH5Gzt9lqro7YnqBiF8Ls+9XPlK6xvET8XzoOvAPDyb5abspP8SP2QSFmlr0jpF
	 R0hlr9Sv521rtUN4d2BR8RuJnLiV0dVm01RPL8aI02P7s0xcvf7V38QR5I4anBl6zDvhf
	 j6vr1yW2OXbx8V4U3asIU55OltWBQuxXtDQ8H9Y3qF2O1NVBBjKfu+BfIHZq+IhkIwpYu
	 edJXUc/9qNi+eyTpqhOS3nqEkiLKHl/k/Vz9Ty9S3AnvuvOH4aGTnL9iQMUXsf0SQFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
	b=Go3UqqD9g+LyF8VYUlnyyMemIxea7pOT4IWIV7zlNnmY1KbfHx6P0a0UNWGOf53EDHvm
	 +j1HTwjjVX+01cpnGiGD/y5bDPb4mnn65bmVxZdc8+uo5Bash9zq6egPAXG2cpTWQz8RX
	 +UvMsBzNq8mXQUjiK+H+YY+h6DMqsHL3DVmfL0J5kyD8iNxETlJ9MXF3BgRZF2IgBiI9v
	 hMLgUdFR+6tveJu395wlhf6FvohRpCpzrg+w7xRVkdCaB14Yjs3gK1ieEzZ/4e6YhhUl+
	 uSTalJLhB8/3dbqS0y1q74brE6ctbnC2WMianx4fKQXIw14tNMRd3B+DvKBg72hiOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871B9606A321
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MpV1k9cV
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06e79e152so1466378b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355553; x=1794960353; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=MpV1k9cVRo42tR/lASLz7dwsoXaP6lc/cQKqmFLqaK3MhIAZ19v0VVf//zYTsvvzL0
         BXi59ypQMnyJftH9KWQwqfo22HKxPeMDDq74sEaKaPmBGoQAr47xWzFXWBy0CEtg8zc1
         rviZj/Mz1vOfCySzRf3KPc0JdvB5gVGC61GyGbDfB9ahxNfsoEvSdlglAedX+AtqUVoc
         02iaKuxfPAlMAByITTTB5l84rsQYJZ0G5SiK4hWarjTSjMQovDKh6Tw1OwUt7DyxGlwF
         aCkF1xsFszmsA9wJo6uD2XM5T9BESfES8jNSvbS5HE1hffyoaThQMt4OTQF3rDEGvXAr
         eVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355553; x=1794960353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bu79jnLYOYZ0lwXrvvCFZpjbtsmUaJ7g+2H7bpOxRio=;
        b=eFkIPDxGw8pDqrUcbcOmSENWaaFUf5kPn6TqKgpAwI2aRnZMyMWB9pP3pu9/lt/O+6
         Bj6mWVIqX6dk4qbBW9RhQ+NzvI5c5g3YEbaKd6jJRpL7plzjDP41Mmxu2BRbRPUaFDXj
         XxyPYsUTtMfmPQPJPQQznZOUAibFA3koxUI9ri0jy/lwFCYNkRLot1FTKpXH7RJ53iDx
         TZRyvkZO/cN3SFbHuoLOTEo0ifsRMYe0q2GYZTj9xdhgdj3qOLs16E93/y4zEb82n6Uk
         o+MdI0vER61SwTrXUmXRPcpN7zxp+0vGpoWwIN1xbJBdj41/yNEu+NAO0WKzqymxm4Et
         e7LA==
X-Forwarded-Encrypted: i=1; AL+hErGY0jUFR/TUhi+G7JaDrguIZiKNvOZbSIZIuy4isv20VzypCftFz+wRpCabqWvxtH9Sko9nL6OUAUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SRuH8cBUo/XXm2JnMk//JSqF+0AQsZDt8ORvRVlsqSWQix7Fy
	wIopv/d9WtmsQGVHajOmMG+Gjkbgq8Ys+qbGi7pgfpBCCorlKJgOrswe
X-Gm-Gg: AYBFou2Gwgz5nr7aCMAxKC0IvIIrILyjppNipNI5Eu94qhRmUmadYBbGllZqjN3acZf
	R5XK2xU7tgJiyVQmcHHjFI9mwzS4mgqtEXl2z0bwQ5g8TACB20P/vISbRIyPYHCQA0901RZbmrf
	5yAHnhmUCk+n+Sl0s2JPx2YhiWTUYet9JzmDxI68IpvP0fDII0J/ekIU3C0VzzOpU7Zm0TDcEON
	/WVYpfxZwo8LPR2zSUc3P/Bs/Gq68S2W6ur4QoEnn5ggy61gNcptxvDLAY3qE6+2YbzNtgiU39n
	XL1bbkWcB8gTguSFUSZ/LnKnEgEW38NYsP5eFTmGI1OO+OpQbCDV5mzgvoD6/4IeM1XWYpT6q8W
	3wvSgfO/pfVpn3As4VF5ziHJuFSUlnx3ZDzqCurtTycU7PkGcoKnNAbLvi4l4eHNy35iP434/Gy
	/N0qOUiiANY+hzt0Vc+QB9bgBmRxQARHHe5ZdnyQ1oteflqdpL4rEcUMYC6y6ZTdAPQPunlfr5+
	GT+gtR9e1KHXo1VN4CSvlwTtO1BdmbxLjx6QBoeOTzIwmX39y+v9F6cRBq1mP2QLwdpsVBR+8hR
	VfzQrgRfAh/Dnd1IZUtTMzxkQ2WxzC61WhVlvnElN6IHKmXDbFS4gKQkti/tIte/j2ShSy+GQb/
	TIl4agiXBMWKVqjpPpircvX7sNS9HVoPdY9+NFETof3Z1aRo=
X-Received: by 2002:a17:90b:224b:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3b182f45135mr614942a91.43.1794355552868;
        Tue, 10 Nov 2026 16:05:52 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.05.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:05:51 -0800 (PST)
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
Subject: [PATCH v24 01/16] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Wed, 11 Nov 2026 09:05:28 +0900
Message-ID: <20261111000543.28550-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
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
