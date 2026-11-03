Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793664287;
	b=fKaMvJfSXRnLOBZAMkSiq7+JxUoJqZ+rTuVO+G5ORTwBbF4x8p2D6EAcfYOn11/cHN3l
	 20T/gVscNxVkAoCV8dXs+cfPQ0YeXfqY2Ou5Z4hURLOO2hfJPLU3PhzGXk4aJFCGADFpz
	 oU8wqNz9uW8aRsCTobMO+yYH17mDswK8+5OuyQBp0iNjSxJ1yeziUcCfaeM+pU9FCz+zu
	 Etgt1RFp+qQvlqQGLmG13AgC9oN5K7Dws1g1Mog0ijICJEAn75ygZrTuzISKuMns8S6Th
	 ex9m4R9UsIlFW7vJB6ACsOH+LnLLgR6ZQDhE/I4gth6W3hC81OFW3+UioNsy0jveAMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
	b=idceXtScMtBocfbfFbKjxVogXINfeXFtI5cs/2fhbluF4jhA6RBJHrw2vxkGAmzlN0c1
	 SvQ+EJoWtgHjibTq4S97gAAalHR2tFUFSdADL8ixLUvuEKhI36IarVWdOZ0f2q/X3W9bG
	 e6+NMPQzpho488zY0FbchFpGEdJ0K9stdv+to+wl3R1yMvkwtLE4V39mSqoV6tLwe8ALM
	 VjS0zggil6El5iyqrAYeNaUy4iqpNse1RzWhaQqMlKD+ecTc9gkiuLziIUxoOLrIMTLKv
	 qHgh87NKnu8PUvO+41A3UXR+eT2U/bBWfU3+lifbI2Xp1nUmITI+hNnjSzlV6oysuKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF5E606A339
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 00:04:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AF5E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AAp2WmZq
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso97450a91.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 16:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793664287; x=1794269087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=AAp2WmZqH4lFkiQxMuPQDFOnleVHB5UP8Z0ExbOAQOUg2Ktwk9r0z5zhWiZ+vH1L8c
         O9gRQOAfoIPyyhtZ73n8FaRR5rwo+x1PzEf7SdnCorC9rr8/FKNaKI7kzH62MEqKLPIz
         HQMmt7+vq+yvJ4Per09QL5/T+YzTFOtT+iIByB6GEkMQPJJPYQQU8B3XP8jZuh/IDTlk
         pNcagp7Kb3nAHm10gAyDB/4VUsRUIOziIOqHVi/pO2VKRGOVkmMcHgNowQ3lNRi4MzM3
         VKv42ry2krMBnGPEOyPyCbCdnBnuI7XvOTutKa8pZk331GEjWJXnk6WSWkn255kWcoXq
         9s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793664287; x=1794269087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YeGo5xYJrpnxNAew8vJ5guu9FtuzQOdSkjYnhG+rvTc=;
        b=y1cCio50zdasf8ekRykmdSVVNCunELO8V2y0pkezGjUw+MRayNvoZUNtiDHuYDYQl9
         nnWNFUZv/2KfkvtZR8qC3cwSCTV8mUPOIcp/argLueXDjIo9fxhFCF0xmNa90kpxX8CC
         qGK0C1uRQd81puh+V5CJ+i+3ZpAtqq6IpDxJeN9OylOIn4wsMhTyAKozRNwQDGgjZl0a
         5XXUkNA4vjfAdT3dtJ3ZUX5dKVljIbLej+GjWSdLNgve+vR4k/D3NTG+SUEGI3nvl7Qo
         6pvcMAyTTi8m+b1MyG7bMJjJKYThK4sd/UQwqTvnqsL/wzC5RMZp8Y80PFhvvKRNiueS
         6F1w==
X-Forwarded-Encrypted: i=1; AKwUvBw7SUg/AfZiNuk39q3DgDHTZvMOIb22DL2vR02yceDJ9p/fEE78KOn4bu6eBNkL9NygmSnOxQQcVnc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9slams6aIU+0kpHYhZ78i0T8f2kiEepjZFvArdWTUQj+w3hwKW
	u7x1bGBvmyELIstCLmU/3aP4Ufg4UuqMcg6EeuzAjZzRyF74I46BbgBm
X-Gm-Gg: AYBFou0oBpiRj9raK3yNGuUCvc+gFdK1xD5RaJH7d8VYFvYgpFoN1IE8geiUrhRpLI8
	e0cT/KDlBoidsJZkRBa6YG+PQ0ACBDqel0fuQQHvCEfdWebhHenXfA4YkINoCuj/IeIWIn5OUde
	dwuoPKtRQOKpO6BZXiDA6MZtLnRc8OoUiSzOJ2/NUsXceUy3wOBhIbAtXuXWa5pjtXKKng/g2Pd
	AcnyrCtUUapQkZ2A3SLZ0YNOAvgveor1pqyOzJlgWGO4uSOR45PPPEwr2MbtZv4uQGg7gyLNDSL
	/rrSIeMY78rJ7YMkfzOJq/xlFgjS+uM2dNJUJtxPjpXepfotaAOzZlxC+XEqXMMdyjq5EIpBa1W
	oDtmEChrnqIP3S+qAo3tXq1ZeFUwRz4ZNT0XEdemqSsIXvdR1n3mKgxAK+yTZEYuFfVg2RXP65f
	XihCeGc7yGD4/aubiYsGbb4vAhiwj/0IEHBftmg3/Ze8vfSY1acIW3ukLOciz+0UPJ1GVr7ULhV
	nZsnA3h8GCGTSnFTrIGiubgDmkMf9CgnPR70BZjxybMkoHqm3evtr1C6Ex7eLBme8NZBPcRJuTl
	JAkXGqrsdQYGBM06boimPdCVFVVltLrmMiWnfLGRJ5XubFCV/IyJQ3Q8RpYAT2tKfl6mlkrEbfi
	mLuev19MIZ8UsQ8E6UM1tH4kVlZKBaFZdiXM5LcUcyCWlf4uvKtUqgp8kFJfrvJTHip7g
X-Received: by 2002:a17:90b:4a4d:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3ae89542f3dmr6388084a91.3.1793664286684;
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6b3493sm1339225a91.13.2026.11.02.16.04.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 16:04:46 -0800 (PST)
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
Subject: [PATCH v12 11/12] ALSA: virtio: prioritize staged capture period work
Date: Tue,  3 Nov 2026 09:04:02 +0900
Message-ID: <20261103000403.67106-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261103000403.67106-1-mynameisjune111@gmail.com>
References: <20261103000403.67106-1-mynameisjune111@gmail.com>
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
diff --git a/sound/virtio/virtio_pcm.h b/sound/virtio/virtio_pcm.h
--- a/sound/virtio/virtio_pcm.h
+++ b/sound/virtio/virtio_pcm.h
@@ -167,6 +167,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
