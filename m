Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793862572;
	b=lVVzY7qWY8MzPb6zzs/Fx1WCebFM7XNkxLpUQEIDnHD0JfFkYv1E/5gSGdItCBZeUwJZ
	 fhnDKGRF8ggtASXOZtfIFuDQT4vR/aNLW/dodPlhJCyD9/p3vPXosjJ0IIUBiUdVvkUxD
	 Sfj6uER7yOc05B0dt0zFtkl0HVKte1fElWUSm6s3ZCzL6nseFEa3WRHxLdUtU5/CEYfp6
	 bzQ/GQAMp99T5C6AO+Hy+84f+b/a8AdQeUyV89qxkafKhYkSHIEhehZTaYs9eCfMoyIM4
	 NSbu7LYIp8dC5O8LEr1IBnYki1OuGSKs4WQ+tCzrv4oPVfWDsirFRjy71Tm3dWE24NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793862572;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=juAvSBT1CIFgDcG5Niu5uqEDI25QYfO4m3z/F5KZEu6WIDJMlFG/9C7tdzQAgn9adt2R
	 lgJaGGFSLZg3xqLwqg1NV1UgLJQ6ksLDye4Cf2sfjgeJZ7fsrit6BhTaYPhgwSeepYacz
	 2N24hpQGTqn9yXV61RYl5qWnIznBzwrSNeKXcHa03/4Q26DPmzdCKwx+9veW25jGVmwgO
	 CAvqIN5jCsN1BL7HeXvntBkNIE5YeRIGHnJljv2wd2udGReclLVYgujA5nzAQSfCchva5
	 caE2fRq3pQ2dfBKuRGjIiP1fcIk1g2A+sAiJb0Jw2xXM14q4k8OUgE/4H9JGfEwY0PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC3606EE81
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 07:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDC3606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=at88dH5q
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36cad25b8b0so2329528eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 23:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793862572; x=1794467372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=at88dH5qI7lHb9egqH+hUXOqX1WqfuRrXRQhay6SFrOiPFxFgiUwzovkfbs4PicPyV
         bLecinhQ5isLl0hAyRu0eiS3k2TEdwbVFUMaiHMP9/y/J0QUE695ZsUxgPVkque0K8lX
         5EH9d6KKjqkf7v9AlvKfE6m4usmHE9ip48S+ImcAx4Tg9pXrVLLxH4EWHksb4cVs3ksB
         QSzIF2XUxWI809ND2saGZHmJvIKyojHtjvtBuhw+2OYJuWi/+LCwpqcQtWDPhTVCT97s
         sUObAbIKRPhLkWSEQltrt3l3wMTROjfgNlhmjxGyZKSKqb1wcdnWHWRmaFLrgkbutGJd
         sSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793862572; x=1794467372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=SCbflnjfEnkT+oS1E3h5KP11r21i2MioUOfyEr4HbckZsRJY3ZVBrzjopayegES9sC
         izmSEIOeOYuBIUUeR2Q9g7dfbf6g7zd8NdfAM4RsnVd+JC/jAwv1owQiiVIEtJ9a1X2O
         /w5yWfDrChZQeNITEVBs5F7WFeoEpFBXOexxFEPGltDhINANtFOay+0BES2TwECkZQ5V
         iWNAeIfEqYyhvtvHNd0PywQ7SD+FyJOQkTHgG4Cz8MPKBkAFIq/GsthC8oLgvDek5Zun
         6MgJ8g11tbWd7o+rZBG9AiCE1C6BA14d1s9R0mHwsMmd33la8aK47/9onZrXwjzQDiCb
         GlvA==
X-Forwarded-Encrypted: i=1; AKwUvBx9yYQab2QZEd7SfJYNfHwtsnmRJgaKljpVlUxUrNhIWV2kVfeiA+epr32vKr05KTb245Ogq4Bp+7g=@vger.kernel.org
X-Gm-Message-State: APuU4Z91p9SN7/6uiLQe/DInGWj5GW8QqGOptqPI1XZ40o5JiN9nycfu
	B7b4b7hVK07EAAeSkWaXnkKGGkvEEud1GTIgKowIDz+pm4FsANnoiQQN
X-Gm-Gg: AYBFou3WAFrlKYUPf24U6GdjSYklKRhAUKApJ8a8mMzfHaFfqA6J/nH++ZlDMsLKZu9
	FoOgWX6v/nZcbL2WDPnTymeJm1OeJ+axD7RgmDI1e5NEqomPYl9QOUOb2kBbYYIgmThPIr1FnQE
	jtRwsJKeybEcA6+4g+t80PKrQPYE9JBrW0j2DDC3i4sXRzQsimDQNutA08odLXKJLaa4raEsFW4
	hyQgKano8kQLrfG00WSpYEKueB2HB6Mmyk3+L41R9BYWEv9sPHYFW0luzFOKXnNDGljKJWxBaTc
	FvQ7PgrXUhJ90JLzbXd3J4Be5oj6zvUlDzd6/u+z3siQVS9u4A8pkrqDVwUpe6GJJvCvezlcN+e
	BompBZfOegwNxtELAbMSCEiQ+EQoyOinexrvgrT6mDAVOJSoZa2xSEkTVXtMhMRjrm4Zm3l1UUA
	+rlcDd1ZP5X3tCOcV3ns2OS+Rvq8LJjPmADE8DLWRPdWXfr/BqW0FW3qYiiVNa39ln1oyenqE9E
	b5uAM0kbyFO4XYymLSPBFFXmGKYT9X9kIglsIMu8K4SjlT4tPWf74+D19grunXmZJYsrTFHNbDh
	S9cDUPgAEptkSYWr0mQwsp3/lVba1+Y3QJyGKCuLpSfQNpB8COeY7mARLSwkdnQ7Bs4pWtW/xHt
	rsxHZ/Q5Xdkk14cE3N25MrRTJVOnNTCAGVfC+fHstfDd57sM=
X-Received: by 2002:a05:7301:618b:20b0:35f:2858:aa4b with SMTP id 5a478bee46e88-36a4241b070mr25031192eec.30.1793862571510;
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3981ff0sm16812286eec.24.2026.11.04.23.09.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:09:31 -0800 (PST)
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
Subject: [PATCH v17 11/12] ALSA: virtio: prioritize staged capture period work
Date: Thu,  5 Nov 2026 16:08:44 +0900
Message-ID: <20261105070845.6449-12-mynameisjune111@gmail.com>
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
 
