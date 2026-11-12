Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794466225;
	b=DXZ3JIcAgBJkL3TNufQ4jzMuO+AjBrBsPzG/RmHt8pEbva6IpBEQs1LCxrKdzl0jjdiR
	 VT12ChpZVaYZRwjsX9NvY4RAxveMbl1g0x11tbmPLjBqEFSOWmW71vlu1UAspRQ5tcksC
	 Gjv3d2PqJEhrD9rNAEQNm+rsr43102F5suPvoKrAKZlQ9KpeIIPpDAMmJgGCRE9paPOwJ
	 4LSPjaZbuHjnus3HnpVX5cNBnErXpA1JWZxowiNplfl4PRhnpq79DSfhwqMG3leCmFRfl
	 /Izabt+yJY93UpgRjH0rseIiRQaSxAv02cJPKt4eEZAJqokuohTBJO932qaNqU0jRWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=lsbeBkfL+zfOF8oKGklaUoqvqQHw5qVOIIyBy/NeIIUupb06vf9MRgnSOBMm/fdFGmg6
	 wSJHW/4yqKQu0AC+8DJ9PXLoMh2770+mtNfJFuFxjDPvaa2iGRRivHCubqR/an2NViKMa
	 04vkZSDOxMeU5Tvhiffv/4SxKVONWUIqlBDXPgRCQWKw3cQVdOvyv6wbj10kvEQPX2gS/
	 y5BSBY1j2MIIQ3zdaG63RIlWWbsnkMTMf/hjysbSi0nB3mndJaR8tv9KBqVtWmLeba/ga
	 E2yt8BHLv0wKDipgZ+GPzLaTQ3y857rPvo/4GtUoob/KeGwwY1p4Hobihv4OKykI6aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CE60A2607
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 06:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD1CE60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lFv78Z+k
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b5a6f2f27fso1562554b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794466224; x=1795071024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=lFv78Z+kgkepJBxfjk8Ae6P8qUJ+/yJr49VR3IOLefzWRcStJUMFXO2CcYYj7oKM/y
         NJtvkrSiIy76iiAt7g+ZCLRxgeFe6S/N35VAVoulLWIJ4vfAW8v4uNtyze2FLVlrSM+D
         1G0BRa6rICDOnQwhzRizWZri0/A0BklRRMUWddg1fpbE69sPjcC9gJaCamz8Lj0k+5zN
         5NZpV+B0Rhsd72ZS588Cqh4ylsH8EZGeO3bC8HoN12nwq4o9FSBgCP+xEOD2xe8bfzNC
         xHwIOZhchpU1vuQIRu70Q1oVSajxw3H86P/h8HDrF6169i+1kkOPt581WaXSyLpRjTPP
         pd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466224; x=1795071024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=KvPlCs6oRzZi69pfpJ5VIvs4L6IXkYYxPKBZty4hatWhu6YrgqDE84idTywyOB0tOk
         f4Ue+gUWEcIgrTIW4rktLTKrrf5+sltLiwUhtQlU5UXK3XW6BN+JIL2xTpefvA9m2/MY
         55OnCw9p7q+BzoA0XK1ivOSUeJk0tHLBYOIlIz4XcfRY7lqOWDx5IrCq5qIXkAePzS+x
         LwWgvVRl5PX3jzOurhbLGxuGl2cq6GqSZbTptN3T2HPHfPiWqW+2z83XCt5PjANKz+nU
         CD73xBM321+0+KWJll+h6pnIBQMkfM1PLz8UN+qzAPnwL8glhrCp5W3o5vMi0NPhOzrx
         zd1g==
X-Forwarded-Encrypted: i=1; AL+hErFytxeMAlh+yvWngtjiXeAYXiuJG4t9RIpp3rDtFamUVjSLLUCTIiur9XlddNRIjUFg4GmckdDQWwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hF5k4SrEt4S/UEzI4L6xepBZHIzyz4NGY/0OpfMZWgiLNwUhb
	cxdataTS3H6/Gb3LSg+EVKkDBfaiJ+lmWBtiZNr6MON0RKvY68VQn2WD
X-Gm-Gg: AYBFou1nU9wyTlSp4lPYR8knsQIcsgpTBMUulViuhtcyPMKR006SV14rOG9JVULAXUv
	/Mysy+nCHFWUaEBB/KiWYFe13s2z8LR/UfIoLsBfHyjjv3NtA5CjkuFF2SCD7OJ9DeSDlxED7Jc
	ejhH51V/b0cL4038FxWT7/mfTti4ZvrDRg2SJn6ELTNiu2Qz6i2NSr43L8zRQx7mTMblw8BpDSv
	sDsuUwVTmyyhMNUI8x3k0RGg6dca2cFd0XyZ8qomGdqxdnpD4HJ3W7XOgUTsYnGn+J4MzKP/lWu
	dMBYG93afbxQQvd5S+mxlj/Bi8STAGnO3EVHpc6Ir0L/K43AL/6SLoW32nmR5m9su56xGatwuub
	XYqdN3P3OKrvBqXYR8j2iySJLGeGm/E2YyyWIPhnhb6V0UxlIDmikRFdsuiQAhNoQC3aK5qhKKO
	MoUTkNmS8pL/LLlQ9I2nSJYDu5V3LprcAkB1KOvFVx/A9+QOLAKByQHw3b7uEhi4rfVUVzpYiih
	wnuDhC4bKN5MiaiBa/ZC6STcJSbbXZb87e+wP5NtiAyrt7JY25GiV7K+E4vOGcGBNcsH33e1ygp
	L9jUxhuldIJc7wu64G2goD+55K6sHGs86kcdOUkqzDKDElJAvuPAF6LitFrvBAviZ7HUbLTaWgi
	UcifY4hJoKyq1ScqZiJyNVZADOoj/AiumiqbG21xRUzAZSto=
X-Received: by 2002:a05:6a00:148f:b0:8b5:94e0:91a2 with SMTP id d2e1a72fcca58-8bc1b6ff204mr5007644b3a.10.1794466224163;
        Wed, 11 Nov 2026 22:50:24 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab1228e2sm3097511b3a.41.2026.11.11.22.50.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 11 Nov 2026 22:50:23 -0800 (PST)
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
Subject: [PATCH v31 13/17] ALSA: virtio: prioritize capture period work
Date: Thu, 12 Nov 2026 15:49:25 +0900
Message-ID: <20261112064929.11211-14-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112064929.11211-1-mynameisjune111@gmail.com>
References: <20261112064929.11211-1-mynameisjune111@gmail.com>
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

Use system_highpri_wq for capture progress notifications. Capture now
always uses request-owned storage. Playback keeps the ordinary
workqueue. This preserves the priority proposal separately from recovery
and accounting. It provides no hard real-time guarantee and cannot
prevent reader overruns.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
sound/virtio/virtio_pcm.h |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -173,6 +173,9 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
