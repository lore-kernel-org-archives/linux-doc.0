Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758712;
	b=O78FoJdcKp4yIX9E0/eaI3bb8GYLu+eA0xgAPQwqjuzm+bzOuAgmK/KLTo1iqfbT2RqW
	 ebUDPMzTLxzO5V/MFsjyfZzSWVRD+HZOvsehVFepPGqhve0Xuey+cQAtOYYV4Q7sCDB9K
	 omyi3FWI7Qh2FKEy7yIbZf4n0YoL8Wk/wMls6w62gIivKnItPElRttjphEDI4uWQ4IR7U
	 cXghHQrT9sPvKnSPhOW6ZyngR2deeq/R9dw+Od1h4woUwp743xczwbkWbPy2546A59Swz
	 ZuX4lJDNf9TYDb5YKFBcSXVKlT4P9QQw7ajKEzJL8wVPb9pkY5Bh9XDOWfdMBC/og4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758712;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
	b=2gN8swJ0YbX9GrG2lk8Dpj5J+6UgGUb7jFX0lkd6zT0oWJWO6aVN3HX4vGrXXNTYidu0
	 jzSHDsO+wQuQBt2tn3B8+6+t02lGrzj6SuvoNBPBTdh6TQDhq6p28FP7420SjPuoZ4iDo
	 ukuzt3F2ntMebaVniRPwBp8o/T56VsAmnYnKW/MwDdSJIZdlOPYYEGSKMQH0CsJknS+bQ
	 Kbx5BeFf25rqq9tRnDDXq4EXmzy484xAvFQNqn05cuf7htqY1oqHO45xczpDaK8uSEvbi
	 q9PvJm2gKiDbss55dziJLEDjVLYJlI78SC8VhUFDooeIQE4ghr9ZP8nwXgEXPzOcZZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442FE606D802
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 02:18:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 442FE606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fPfguUdM
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso71556a12.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793758711; x=1794363511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=fPfguUdMhbE579afw7yvV4+5C0l4YkdVCezy50lqJ0iQ/c10n0crJQydMDdQ93YdzH
         Iv7TgDYD2qXMxVRm/6uCQT87M9RwTy3+4rPplgTAXu95H3uW3PUbcS70zfto+9fYZUst
         x8eeJ87DA4sH60YA8TxfT6VHk13q22eTmqeIzrHgzUi/yTo+qAfVkqG/r+WoW/81j/6/
         X3/NY8ARdg6ierQwH7LCjtTKMg5tk/NI9Aj1asEALgqePbUk2rGy3nmKA2VaLdgKa0y5
         /So8iMX7tR7xqhtBawjU92z/S81f4Xl+KR3TaSqnwjUreR89mmXNmV4olGRd21FeUJn0
         qAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793758711; x=1794363511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ND/K4UdIV95I9PJFcgncTwO/Ff+v0DFt7H1UGo6AynY=;
        b=jAhqGdrcoNfdbPUUfFI7/QOXa06vmyeWVIm5iv2H9iqaI/BGKcoPaZ4hHcNXTN88HM
         kjTriNy676XAmbhVWG0dp4E0r1zxAUFvc9rYZix42p3TMjn7rutXu3g11K15AdAExSzF
         Xkhw6Wcc3VTCBfUyF3zdiALamITLh5nvu20XEkVOwkz/3didWkfT6Pv5O9T1FD1g7C5M
         DQh5oYgD0uA5qv8BW0q2lAPBAJAZSZwAp+yOh9hT6/M4qk4rY0tu4mIkoDG7BNR1rZc4
         v6xLFdrdpDvz33lYXy1IultMrxTVnRgO0yq/3QQfTYwMrXk4omneeI0bDLYdnOXml3Mw
         rXsg==
X-Forwarded-Encrypted: i=1; AKwUvByqVrDYmPYNcoHimc0gpkAIk7+rcd9Kn41rHV0SAq07sm8s2+lhMJC1IgZBWHJCs9z1kzbp6CtVSsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Zk4nMeqFy1L7XvhOgoOio0VcsgPsPmUd8DfRYvmA8UR1R2GmO
	ZQ9QoQHkja/PvEPDeCSQWRckUd7wtW9qFEkv3UXRGDA0HaKwieqUSTxA
X-Gm-Gg: AYBFou04duluIRC3M6CE17ejZrvvbH+LoqFT459AOlPTetaUVkxhR8Uo9qf2Mt609/o
	zE3Tm0VTXGMmejM7lNvAunUD1pQQZMIfGMwBsSknB3/Q2ZUoNT+oS5gyVNmM1Th2mB8cE4BzyIN
	H1ZUIxa46hjpczieB0ea0kZ6Kt9MUxUqHgTDSKEnfS2cPlsGPjGXl9o2t5ipyflIuSzU7M3Q5Gp
	YUKspHLSgeUzH13t3Gik9A9fw+MRIpLpCmQreomN/o6xbPSKYFkuHyEEGwFE3SOGItxryhYuWIp
	eCfXj8fdIchDxkUd0QOy5nPdZPp+1eXQkU2w5gdCMw7/allLY3LksvAdglrTTHjEbC2mnXHbFH0
	P7Y3g6AVuONiLMyRDglQkHiYQ0spMs8qlqn9eh/OXDnqiM9doXCLZGtdkJLBjWvo/+3nysu5C7X
	SMcb7YBjv3QZJbRuy6Ue8cia7YdATfvGJN028nqfbZ6lMRokN0kfMuJbkrd58V9U4scpoLZ/Jpc
	0HEaJypgDFNPyYcMpQPJLMoszwPooxlGKCgtqeeeCOVOTxkF1Sa5kzc5TtyeUJBI4P4MZ9SMJYK
	/kfXxa+tdtR2bGhJf74J4igrjSmBjDu9a1RLOmFCWn0huNMR7xoFCaDm3MZqa6W7VJ5aeZdSGj/
	9MUNRQAf9PLNNmQWiHq9k5aYvXxawy1VYe4J4IPq/thL7XrM=
X-Received: by 2002:a17:90b:2692:b0:3ac:92bb:cabf with SMTP id 98e67ed59e1d1-3ae6efb54ecmr11165443a91.18.1793758711475;
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb46326f8bsm346131a12.0.2026.11.03.18.18.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 18:18:31 -0800 (PST)
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
Subject: [PATCH v14 11/12] ALSA: virtio: prioritize staged capture period work
Date: Wed,  4 Nov 2026 11:17:44 +0900
Message-ID: <20261104021745.57733-12-mynameisjune111@gmail.com>
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

Queue staged capture period notifications on system_highpri_wq through
the common scheduling helper. This allows capture notifications to make
progress when ordinary workqueue workers are delayed by CPU contention.
Playback and ordinary capture keep schedule_work().

This preserves the existing priority proposal without mixing RESET or
lifecycle changes into it. It provides no hard real-time deadline and
cannot prevent a userspace reader from overrunning its buffer.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -169,6 +169,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
