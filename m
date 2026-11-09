Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794201424;
	b=emOcS8AUYrGNe3m10lfez/H6KdIHO0U4JfqpRK6vVIzIjrjk6grpTGp223gbvIgFtftl
	 H6LP7L7gLSL7xugOFX0h2dYdXc4936UE/dItsI3K729rwPzUfyePCY55kzYHYYbSrERnA
	 U3EUBIZvWsio86uDnStgTlHOmHNQWh7afPAXxbNa5pw6HgnajBRnXNPuPM8ngOtjo0Fqg
	 UZXbwYCGolREFWwAYwPYdy3u+bnbAtFMSBSSHotEp4HFZVklJVhetzxgIqvBrnry1mzp1
	 lG4nwRYBnXx5OXgjENkyFTvTbJl1uo1GDC/IQ04cXyg4JQ5Gka421wz0Njhcvqfwj3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794201424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
	b=SocxRF1s+kk6rTz1SyXwq12TwnVEJJpW46hcQa1IjHUzy5witQE9mM6uATaDOTDvbrOI
	 7bwRXRALGdRSW+Rz4/uSZEPpUgM5JEpZS74MWIHaZEMe58lChRSCipoL34MkP2gqMhlEw
	 Ax2+4g3wBc005vYTAX8dwZKYYOr0oYcEEH0ZrhHmDvgTWH76XwTK/Fue+skt0M90kkUgI
	 jUrrwrbNcdIaHenZUntJOuXynwzI5wN0P4SyWGUA5RD3MDLeOX4/q0x1kCqYfnBCnZGn+
	 Xk8JSh7yGzzkQb61lpZo1Eozak7IFaymI4umrJl9dJOMjBjCbQyPmwOM/o1rKcZxA6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D96606A335
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 05:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0D96606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vun2rtUx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37198ed3727so712218eec.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 21:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794201423; x=1794806223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=Vun2rtUx+CEwInyc92H3Nuh5Z1WVo5bDXABFoh/Dwa4onkkyKBoI4LCH+6wc4J5FtG
         djwFvQaHM/I6+yCYaeIr2f+8Be1i81Ztl5UcvsMnH95QbN5DWW+iSyzwWXx558Hepmhi
         GGlP65PB3FNP82P55DkSjrr51hiWFtaD0JsWWZC1vU7PkLcs3hzwfaEhXYpfFCbxpEaF
         ogPVk7YBpjQ032nA3wOp+ggfkATSKLhsWhDUf7Lp5GMnmmumAZKmWapGn54f+lm9Nbrk
         A4av9NDSr/PsMytwuyxwAOVCYYyAtEPIOAZO1iLnayPm/xYOtJC/qbsfXVSlk12JYQ5O
         iiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794201423; x=1794806223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUS+Ir6AKhedZvMknBQeS5+2Kmx5A0on8+pAmR4lTW8=;
        b=0C13+XNBjp9yeR1OluDdzMqS60BnSqqgpBRrn23RU9cS8EIB0wz+4VFz4REVa2M7iv
         wzwPusCnRG7iG5QhpedmLMVbfnI8LoD2k8KK3A1VlN924FQ6VDSDTiTbBXiHxr0rtyac
         pMMSSYVKL/7XvdeZAJVwlcqlptlZAitT8hKckgls5JENk7AKznqu3CVCqsFbG7aLoJAX
         GypiZeJypWA4w10zoR4e7lvH1Rfg2kIun3U2yomc0LKnYNfyJht7bqWnbbJCuKr4uJ+k
         8yI/2X/7fRuiLpFPm8EKCXASsvspLsnNaisbt/zluVtxRnRK1fZvtopANnWISEzSs2qv
         7ExA==
X-Forwarded-Encrypted: i=1; AL+hErH/a+1xKEWATyJFr6PRsk1zzoPluF8DSePCCIT411slAskCZUIiPSIjgBmZiw8nb1GZyNSCE3xWSAQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TiySLIiKrq4cr1sBbqk0A52tv+VrtgnsuMMnyyB+EWxbCwn1b
	F21qEAzQTXGger0QhIWts3qXB5NvHU/N+ZOHxAhHnjgpaDWMFMbcI3WL
X-Gm-Gg: AYBFou3p855/UPSaYTgZqNThgEhbWQFksKRsajsK/y4dhMxKCIcgvWNHkcS16nhWzAk
	OHxabbhX/P9N6u1AVxq3b1Y7P/PPE/Xg91gJmgB5eFbcpgq0IXSprMVaD7DvAccgP4iwHKjP0Tr
	3jyCpLPdzULzEr6OOyZ7eX5ujVrbPUGaHHEJpzGkEzpf6pM9HARal3LAUbRar4rH2WFHQWB7RS+
	ajuFVxp9zVAwWwHSEVLRJoEGtuvw07HJO9nZbSljT2WZUP5unGd3betUCcKSKhx52iQ744FNIqS
	LxfI9BEH08PLkJDSxlFxo1CkP4KFpHhgnR9IgyrG8mZ6X51qdYTj1KlzSjdSWpf7o7rsCPndr3P
	1CwKdhuUhVN7UJaH+wu7nYvJXJ5/0lWu2ykoUBbpO3upGOgDCzsYyeWEChAdyEXmmQpR0TLMfgR
	Xx+xFD+brsdIY/vr3rxBnx3Djj4MBY3xMIdUAf5J3LNTiHeQaUtIdGWZReGlx7/2NfzgCJApW92
	FkpSGn8PSpReSLKlu3xI9F0X/pBQV+OKIhDQWBxRZHKfrIDxGMF7XaGkt1F9L3+lAUk8rI3yhxX
	Mr4Lbp+lrCVcMpMe82FAUrFlRsUi2NJJIG3GCil+IKTCDBxrdYbhjfiSWG6WzkdBrRveKmpRS2Q
	gkL08BunaOIqqoxDjXrHJE/U66b1K0GJTusEUNOt95rAbWgo=
X-Received: by 2002:a05:701b:4244:20b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1b39fece05cmr4832119c88.19.1794201422928;
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314826asm11395635c88.3.2026.11.08.21.16.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 21:17:02 -0800 (PST)
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
Subject: [PATCH v22 12/13] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 14:16:17 +0900
Message-ID: <20261109051618.22506-13-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109051618.22506-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
 <20261109051618.22506-1-mynameisjune111@gmail.com>
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
 
