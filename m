Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794062107;
	b=3RZK3UDN3HEBoCsrbsnj2Ftqg7J4Qyy5lbfhEdZdcwOPAq10xPdEpdVmygV8U0+n+4zN
	 yNlZvWZ5LZAooOZgl5HsOodTd0hYmOkHzczVSyFXd9HmO+m94qmOK13m12PaMYrPdYDfJ
	 NgJCh+8KrAGf2XzJ1PrvfLN4JN404XIva8YcihQbf6AQBf+1a/GZf4hAVn966gaNmazig
	 4AE7EA1WNqwTBpiJCfEu52On3Qo8vZMUkwfoeqSUdQI40dv/Jh/5agZL5ViQEYpYaqf5X
	 GTBcRWSoYNPKx2mz2RPeE5kNiQo77g3mX7F3+cfrJvUTZ/SpkCwvNZOGgZk6xCQkMWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794062107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=M+ePaXnNdz8dnodLXAUQjtCA3EM2MWeRYgPQ8BhjuWgAlpJ4jGvLlF4UCtUrZf5b/LgK
	 SiV6bL8TDtFENoxyYWwAwrDD/N5229E+Daq3HQeFQFbOzteBNvRMdoFXLF1qaS+b/sY1I
	 NaIgSe0licumtQAhnP2raAEDtpDRoMpqIzLu8xZhs15DEKaWF7y2rpl54ZhakU3eZhpNS
	 ItXXLO+9NrsxbXkE/qB+PH0C1fabNvcwLg4OhhlzrUoO0EogM+jpZplx7wvgGtlJOiBv5
	 IzNfynRPAK9uN9PJb0NgWMsIRyephRu4mR/2dD6gCfHfUBfFQLIwkWjCBfe82cm8Iog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F2860A263F
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 14:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03F2860A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=It0tjF7X
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so2584046eec.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 06:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794062106; x=1794666906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=It0tjF7XWj++NO97QlIi+MzWsqv7dS+rLoAjkHiEBDKsdOwkLwXkcxT7Ik7ap4Urjn
         YI8UTGIEzQo7stz5MHOmV30obduE2A44pHBsRy89yax5YgZPFcZP/I/ZjPM0PbTZ8anh
         kE3UVi//VVoYYPYw+MD/c0+acOFFpYGqmnRZzHyK+1Ynu5aRuW1Ktirfj5RGHoDSMXcY
         yx0+sXtBo1Z7Gd6IJoueeJi2Kr8NvRjuMQxx5CfOdnBxdeZ3sDK0qigZEnY94G09p2H2
         6wG33TspzAHEgFIYLN3nhjmMxdOD9tpWr7Vldo5sroGRSsGU+5fCbivBb7dTslLwANGj
         GzRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794062106; x=1794666906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=uE+GVNyiBBW7z4VQqasAxvIr2yXVljT9UP4Od9OG6h8mDgiVsxgf5EMZ4CptCa/Tq4
         iVUg5gsg0eh72p7Tr/hwkeGr18V+/wqFz26B1gbKRB+ozWNZUp7c2oHd1Xx8A6zLYmsp
         unaNS7hU/sbzlFNm2mOLFcKGKC7LOSQRhrms+5LxaIgdul1e5S0fe2EnEMca4w6V3Nxv
         3K2oT3vhJr9GBGaD7t1PwVwTAAWWIx8DimueAkwUCWUHNYB0jXTLXmAI4bIJMZMkAL0k
         1wfdBkeOZPA8XbH/G7p2lhTjolOl26tEUcNsLz3AJKFamhWKWUyJ5bNwYW8+Q2eJ4JNR
         /jSQ==
X-Forwarded-Encrypted: i=1; AL+hErGpU3NP6EDur4cj7KqASAQM5Njd60wPYwdU31Ubgc2ZZ58oQ47Cuuhh6MSv1jiZY0DYsiRGecjAITk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Jc7TiSWdmb58TB+iAi9RO4mFNUAf2jb6uRanC4k9JOpXO+uFr
	+0h6GiS4B+F+06se79M3kakfBcSJ38uxCyaQ7Pj6EyOz+mPGEBfuX+4+
X-Gm-Gg: AYBFou2Q078Kbq6QEMcO9zzMxpov/+H46C+N7g0AdV5gx+G0gNCLRDiLR/Nh1SnM96k
	r1D37RYyEqDoI7BAZFVMpYL6FwvRc41bT5JkmYbnBDu9orRwTK28HGcGmq0myNPO08uwBqDzoa5
	L5krUeWR6qMwpIhJPbEKHRq5zPa9FhVRS4QhOBWGAv3TgGQ4D4riw86uEMU+Q4L9AwZf81Qgc9N
	uSmfsSANo+5GH5W+8T37Tzqq0jIa0bbteDhRofslWlYw64FpLCCBbdEqCuAKxXbGyODBpQC8g3I
	oFqvKuMg3CR4qAvU0GB9DzXAmK8c4TQ8bwoVm+medIV4IN8Zwp3kFWMfO+d/4IZB3KTwpg5OmCS
	QwLNAXAQmOYsnZyZEwOdNslOhEgsebVahYpxBcwp9Mfp2HfN2Vl4qOgB4XY9VF949zOXUjsWSgu
	8gUfnSijFUFyygSHTjnn22QejZPhdsckr0a7lMvgNAWnV+8M0k3YZpGJ0tXpAoi3oWAIhwIiA72
	hWAw+UGy+NQpqLxbaeZHXW+xriaPpKnf6zETTWFJ0Tb9/zY5BLJLyF8NlaKwxYxcVnWoQT2m1jJ
	dxWAk93ezCWADKxKqzJoFiUGH/A+sFi1QwxZwz6fIx6aOCJk+H3Qz0PSfpV6uo8d+eH1gQVUD/B
	V6ubve4IOyJiCCqKYk8StoLSP1/WaJyhwbshu5Yz4PmvKDg==
X-Received: by 2002:a05:7301:d805:b0:36b:f09f:924a with SMTP id 5a478bee46e88-36f7592e4d4mr7639013eec.14.1794062106044;
        Sat, 07 Nov 2026 06:35:06 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9aea75fsm27881873eec.15.2026.11.07.06.35.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 06:35:05 -0800 (PST)
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
Subject: [PATCH v20 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 23:34:21 +0900
Message-ID: <20261107143422.29319-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261107143422.29319-1-mynameisjune111@gmail.com>
References: <20261107143422.29319-1-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -168,6 +168,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
