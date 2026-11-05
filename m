Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862539;
	b=GkO+M9BItORF48D3xSpaaorwzSuDhSQBRcCOY1uKxAuUEE++Qj23KwqUg/DPGzQNFdwM
	 BXf4IfAb93y+C3vO1F7vdZdRC77MZ1F3C5aUtR6+CVmTi4cLJEAKQX7aRQWJujKkzhbO8
	 wW75ay46K5PV4QdIoSb+bKM9enY2/BpqV679M0waM2WeLdMkipV85Zq/6DX9yGSmpKQiq
	 4+9YE9aG80hJojVJ+lV4dca9lQyjPzEmOIbt4skOGJ0d5/yOxdJGnVxpkUB35u+GABCSI
	 ksYdFIylskCzfaXlxT7v9Mlt4RM1as/D8nAGM/Evp9YHnxugjD/zRw7VOG1V9JCfZFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
	b=HYe18g4xXDJVBxhZ9/Biq112ZIEB60EMWaKCrI/H1yRIIs6SJwpXuleXaZpa8Ez+15dG
	 dQuXmDxtUYNaOjrHctlKZY1qMAf3EG/AoQfTjlbrpg6EPF2j9uFmkFfXw/NPE8uwL5c8l
	 QzFcICMWRR1jk6YREddxwBdfvfjz1t1IGCunOGdKDybmdSN73QZ74l+m+Db0v/NcuFc4X
	 XzchYt6XOfjjn0kpBAcpjAOdHegjv1kI0Cf/nmXBsDre/ZZykufY4n1ljM5C4X4B8LFOW
	 sz1eWMe15/NRzXdljrFYligUKe2X/IDCQlxN945pGBaMenwXBFdx1ebDbAryjkDcplw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C21606A332
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73C21606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JRwVEz9S
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so2792758eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862539; x=1794467339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=JRwVEz9Spf6C1WlqEzlOYtqnrPDl/3FEVt70uoSP8uLaseHiniVppo4JLAbiCs20qR
         c6wQbZe/KPAw03GtZsrSsPxHac+nWAtewASVK0BLg0RSl9/RhGaHiDAYwwYHnAPpBzJq
         HMB/YlhZCLrnUZY6gJiMSZ8kP+/liHbofRzxSp7Wz+epLQXueI+GVmnwQGeBG1xHTQNP
         ZWOld9weCKequkid9nybE69agS2rWyJ+ThdpLYyHO/PK9Tp+ZKKx4caLn7A5THW9WL5i
         8R3QveyJewGZ+wXT4/zqer143B6ch6/BffENfaZdiulZeCuk8PHsHzhxWN3ut3ofmhim
         XWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862539; x=1794467339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V6dd8UEmYGL47gppjCwakrDSGeCZVV1ZnI+Je+e+Uck=;
        b=UrJdj2zHuSktJ+ejqCDwZBVe40n9uF8De+E8mCwPg9vmd0wt0aIuLXOvifMzLp+z9a
         AolKYsFTkdZ8a5cWj5zszhefCncuId0BJQwGBcLjAgEPJNq0g5ebh7gfa5vSFw70oD9I
         RerkG0OAqbk6QEmfUvRvL2uKEboHhfTAYDldmhRlKij6Fz2SAtYST5aD1IGI/PXeMApF
         gsORXXMmqJLmLuE0M80/KxLxMXkzFtMQ68LjQQ0CFrfofxocSTF+21BsooaW+jVnDhDq
         Mot9OhyTSUoFao5xT2E9hu41BGdLpZ9sCk0fgUEl6vQJ+Pb7eLK8vjFKhiTjxjrmzAmS
         DHRg==
X-Forwarded-Encrypted: i=1; AKwUvBz8G05FdOjkTgAv832Oc52p24fMavs396nPMnafwEvm+9hGnzp1q9lqW5qJdOtjr5cC+nue6C/YUOI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vaIHk/1O5awgGKCtc7UfUXXez3Hbf7z29c5o7ptb1nEgfXP3k
	JSXp2qDoqfNl0Hxk7D1aEe0882xxc7TcoujZozk0L5pn4w1F9nz13Pwj
X-Gm-Gg: AYBFou38mYMOIU5v2Im6jR1niC3GuQDg/UoFtkwyLXDY8FhNs9/ulRl4IGSsj9CEoZr
	0fZjI2kTjF2g3acPI9Rttn7yDndKB6awR2+Lfk1j1Uex0UQVEB2Bk+GwBeZuSykrvBy5dxnjZMu
	frlG/UiSE3mXPxNFaW6AW/P8N14HvgVVhJBybJ/WzDRGQOkZCF/Hf8LrV1IBXP4d5KGxMGDEw2O
	n5h7nkPGHgmJZu/NqGroLqrHj15CEPjY04gd3Uyq75upVCta3B8wMfrPAgmm5JgpZ9KuesFMdv9
	4kx8LqYYtjSdCDtDcHTVx6cY05q/fz/cY1XEStHQyEPDFFn4Y3qPcboIGedbPHY3R/TUAuY2Iij
	Uhz2J8KwAUyGMD88qdB2k3NvM2Ej2uLgn+9rf+ytiQQPird9VIR/9HySMOg6Q7od+83EODEciOa
	JwVulR9/KLFN4FfiizTU+pSZBvNXINHAXQ5hBnlJmvlChfVLe2RmqMVneaZz80WrzQ8bWhdmS9r
	ihP5SG7Xyx79gcnsFGuHHWt4MURoAfUumxRiMddkWfEqEag6MZwZiqqu0D1Oe9XCOTS4FVO7JTa
	Npak5c/kU20jfrGdYN+5ePgsRdhKL//vLhwpeG3sFxYJwMWXF1tJkyuamMDsFzaGTlhkI3Pjb0G
	/pCtLBZzFNCtDDgmcSSpIn5L6RJleZU9rz2flKFuoUOmftRKLQ1mhhDcMzL/dMZSn2TOz
X-Received: by 2002:a05:693c:6391:20b0:36a:21b8:b6c4 with SMTP id 5a478bee46e88-36a423408a1mr27277012eec.8.1793862538357;
        Wed, 04 Nov 2026 23:08:58 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.08.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:08:57 -0800 (PST)
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
Subject: [PATCH v17 01/12] ALSA: pcm: mark stop-threshold accesses for capture policy sampling
Date: Thu,  5 Nov 2026 16:08:34 +0900
Message-ID: <20261105070845.6449-2-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105070845.6449-1-mynameisjune111@gmail.com>
References: <20261105070845.6449-1-mynameisjune111@gmail.com>
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
