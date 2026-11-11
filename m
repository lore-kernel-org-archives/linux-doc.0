Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355600;
	b=eXyVFDupWtFyrhKttOVBfkk7MMCQkgWgv+1roKqXriO6yM2OoXHRUYizjpgzwZUxQRG+
	 G+TPp7cclhQQ9f8Y9brvL5Eb+0hnKGzdivwCiZyDmY5GhSe/kQ6y+Uqz39fKvJgYUSLLf
	 TgS0eobIXaQQWv0weP5yDDg2D4TnD2/7Gx5On/0QIVLLDzsKE74zQ1zbXvKFa41rJnreZ
	 oNxd6DGN/Fk2hAyWj0MnMOuPAApEtVXTPhmbHVDkUCEbFR68tykajDbCN3XXdI5YEk+p7
	 LRUHOQ9+zNzCfWFNz9Huc2V/oaWjwBBy8NhtWvBBAzwCTZjZy7CLPMAer3j3ZRc2dGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
	b=gr371L7Jf6b6fPuP2QnFttheyAR60QWSjsbzLUcMI6fhIZenbEdO6dehZjOt7eVK5rMN
	 a9o1fLui84tGt9Sdu20Loaox0xbWWAnIx7s8LpykaDm6qamUm/Zn2SiwV2oBMx+GyswkM
	 adsQ9wISVV0vWscrKavDpWeJHa1nxDh6ZF6PTodyDi1Rll+iOuFC57fROkECteplRueic
	 AoenhT93c0p1TtXYdmuIlx0gGUnuX1cTH0jp7pXJJRrNL4r879V0g5BDnxu5ZnlKKneCq
	 0hw/I/APdXK7HzoVX96VeqJxFK6MK2drfqhIkpw6ARwak3aqEF2WqaZgbMNDxE1Zqvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="sdWHdi/B";
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995360A6F50
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3995360A6F50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sdWHdi/B
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1250234a12.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355599; x=1794960399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=sdWHdi/BDb320Xf9zcow7XYiM8pDXzFkLV3hBsrBsEfCQjIB/xcMQoUpdHDQWUdzlm
         dS81UlFA8iTZQdDTzxGwvpfdWlx3aAuLSVucGyPrEN+2bskQTyRUUHpaub1O97OojkOb
         U4LMM8Yl+ZWjWg7jD/3zb/z5PWWhZI2tXKWiY+nGA/pUTDWPyR6ydWYrdOOcBqOL3obv
         uT6GJzuh8sYhAjcmr4cNxGx9KQ7iXYrZJFNbiBbbAGK9pyo8kZKsj1SD3WSAr/jnBfMs
         II47eqJdNLExAQS9wNzsgOtT3zW2bEu/0YhSyEc78gpWUjVXE3M9JO9hw9sac0iCNY0R
         q0OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355599; x=1794960399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7hT/gC85F3aW3pcczI8WvAe9AkJI8Qa3b05R3EsTbPk=;
        b=Er2KBn6DjR0B83UEB79sRWiOFSi98+xfoGcQaDhrJcj0O9t48SfbTBB3VSiwwqP+28
         vxjQg7vgkOeVp8q5npO3WFii9PloK41hH8dmpfz+r5f+606gZ+Y09VTreoUK5ENcn3xa
         0PhuAl+y1oyPIrGTJi+6WuSF2F7ESgWOIu+X4jLwHRxAx1IWdD3HsifAkj0uBzvDeGJg
         Jr9OsFexGUk7noRdmCUdBN4oFfIfiowJgP2QjwVLcU1aXjWqNWagVsPCN/WZ/EKZtjaC
         DbZX75rOfXLKXklRvzc0yTZoOk4g48909/aH+DK6oErS4cZ+tPIHmvvvwl9qlvf1UDAG
         rXqQ==
X-Forwarded-Encrypted: i=1; AL+hErGzgDs3qjyVjIwjb9Drg8/RzjQ01GyhaZpAwvJbE7iBf842c0dF1I8JqjNdrwYHy1J8g4GpzDEOcYQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MbiRNZbPNF5KfIE553o2QloPwzXIaCgfBiEvZZ7oMz2VPZhhn
	tJpUoFnyOwLdFKqI2s2X8kX1QUaLRtRHC8AceYoB4nOcZkC0g30vCVTI
X-Gm-Gg: AYBFou3c3kHTQ2AqE4n528AjCdqFfWk+8jWihVyf/6NaHWIIRLYOq8RBMfVavTjMvxt
	RTjFZ+C4bxetU7vlddvbkymAoYjfGxRmzAf7fzaaKLaUbUsDwCLdxjrjbMw8Q2BP+YOUml6JgH8
	odZPZgi8L2hKnhObxp2o+M3dZ0Ci36f/GYmyscwtivQUPDRlKiIDcrzcRJdoP9Bsg/oi23IrwBu
	goo67V9uWOnBLnDoHoAKSVuRGHlPQTaeFvXxCQYHtKRxFmr4HIElD2f8jVkN+XwxtEPOVYk3v2T
	muxksp08Eh4wg3kHMckcbPWyCwMVkzs2ljKC9L/q03C7BaKx1o32lrootHgx92a+78luFEUEwym
	Gvk3gwOtPQUA2EtRFo2L08Cg8Qe2Y5EuoHsFqHUQPBX82qIj4dn9QmMX0DUGFY/kZ0/p0lk2MKr
	wV0Zm53wGRUme0v37xAJtewYdYcjp+Cxn+QxFl2xM0hHuzC1b7iqTtvJeb2toHDLcHq2mG+ynQr
	8rzktvvh2yH3+u/zr2u96D4XyRdpbjcf0st7UVlMMreJF+J+ATouhlCYcEjv1GOT75tP8Mkq8HA
	gMVrKw+1mjwKkLmaUMDeyq15VJVrmYw0LPkqPVwh+81Zcc0Cyn7vwBa5I1EyKMnbuQIPzjXs5KH
	4CANubAj9FqG89wSGikHJHis0RvYPYJI85nITOn1egW+audIVrB3ZdY+587LnOkbhL6ER
X-Received: by 2002:a17:90b:2e41:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b182f9e1ebmr573001a91.52.1794355599623;
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:39 -0800 (PST)
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
Subject: [PATCH v24 13/16] ALSA: virtio: prioritize capture period work
Date: Wed, 11 Nov 2026 09:05:40 +0900
Message-ID: <20261111000543.28550-14-mynameisjune111@gmail.com>
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
 
