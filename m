Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793923647;
	b=Z2UQCNsJg6qoqgvRvhJ9YdE5msmWyP48FaY2aacg6S8zvlXTJATScNenvr3kmKk14J8W
	 hKK9G/TCEp6zCs+ZN4JgcBklhOmTO3QniBfjlIU6fvgDn/NCwptVqvNJLRdo7s5Kvu1o3
	 p8fqCUDCih1GkZoJQXPo/mjWlGbqWBgYvFwr5dJv1YBqBRrstkTBvlzFcQ4P8p3LeTTSd
	 jEpgDTsnBEtY+1Rb1YbT3VVBdYPrsW3FzbRwafgQ1adhjWFg8eTywguHA+xC61dgqAOl5
	 mvHzkTCTZICeJ2QCE2IWBp4Bg53kXtv87ZFOM6a1L7GCwSqJIvJ7O33xPS6y+yOJdhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793923647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=0fbOb1gs0hTxjl1YA+CdckoAGIdWAp8muRLXt+5W4OfvlIn5Ojsbe8V14co777eMnE1y
	 utY6ECVfLpcgijDj4WWrQd8/iFn97u6eOXDqp2Cg7vatRDoa/G098m63IIfg8pHCMIY5y
	 JnkjojUrtfbYh5m1oI6wJ7k3vgU4E8/NxfkjKhZGbuXFbU5qolq3RRMQTURHHayKsXu59
	 80SD7VVZyOY2+Iqmt/0E3C9xE6bP3K/foyAlNQQA2oEMxNB1gZ7O4wjYnaZ2G4zGDzi94
	 2X+zpSMYOw/ZqRzuthA/6W2pB4/3ygt7PE3+reu9D1hV7MqdPhPxqqmKQ9W7RcJP01w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD324606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 00:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD324606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pBXSSoGE
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2af4c8d00so282237c88.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 16:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793923646; x=1794528446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=pBXSSoGEuH10m5jyp9FLU+NCx56gkVdN+jrBMziY+7rd2x0asHaOZzSc9l3xI2bLdF
         jKYLvPIeyJdX+fJSFopglZIGBX7rCx2njc0QMSE/uS8mRuc5XoM7rhZmq0ViPYZLJo7B
         9x8Jutl80kkWUslYi8OosZcXBpJlf92d18DkgE3DSkevFFkoG83VBrscgIUaFxxkl/QG
         0b70TBCwt43KsSavEuw6LzndMGuC0OzsWX36ownllGLePT1Yp9OmIY6juL82K6BrqOcP
         /g+9OLdSi9Ex5x+BBmKS/SERZb7Lh3rWEar4fVpCRLtZ4CXP+YUTWwSUhtRQo7RHlQqG
         1zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793923646; x=1794528446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=nLLWNZYd0X/klGCH4LYQlOdMVQxZUziM2F4xRlDac+kFyXAakaukff/C4swvNfZSaO
         RVian1YG+/9NdIgPK5j83nhr1seTbFothQwBLy+XdUCKlnc8v341TOr9hnqoCLkMjBF5
         kXufsSoS6vpxtYRMzzM0W7tTNMSO/cSxK1ef61e2+5olpJNYvM37my7VLledldPBn69Z
         kUKyUam/7KO9ezxMLSwJufiAIsvlpRJbxK5mWyB9yDxSgjvmTVMgc1wpltaJkkjqSZq4
         CQnLEHvB3O/KMWbL5defJZJ8g+8mxCGmHxQ/2wfn8NdaEE4cn816qzbVbEGfWUSzlo1O
         CcSw==
X-Forwarded-Encrypted: i=1; AKwUvBzCoozls6FbfKs5hW7na+FnO+n3ryuzHONy6WKsdOFhqUVILAyVP/R89o0mrvgx21sygtnenPAG64A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q26p0ab5sK9w0DZ9UP0o5gmUKcHoc6rUNQceH4+b/TLsETBvO
	KsxGN7pFMdaN8yoZBG5bkMup1X/ZJMZkLuA6ap3BIGrQOghVCS1lVEPz
X-Gm-Gg: AYBFou2FlNC+HJJz46E9Kxo9fvfF12qSel7Vry/9SA72N8+DryiOaTTVQmMon7cxttu
	0pQIB5Pe4RosfA5CeEZodoTLbWxbLFUdjEnC7jpdJGXrHOHhQgmPR2Xf1d9Qka+6imMnwcgWT7B
	zeUnHts0sFtZV9GIfTyQc+jkLIQD/vZcIZnsDXvFLHoNVhfWEHh9GthUM9IyqQpUVT2eA3bjD+W
	UooE4jGSKDGGA6cwBFuYomVIXwIrxFTmsvCQvHWR6hDqopUrsgPUEIuLdw59nD61d7Bsd4V+zbK
	lfNfVnUDQg2S3gRTdvlLVtLa9F9DrqltcY58FcPxXNW6ugztNKuKjL21X1flZHB9RFUee01zenn
	NJbXR80zRKy8Kit++Cc7MzZeJUEU7fYf4mtu8X5AU835sLLchHOz6YG+784jH3g7BbZmnIOQg+y
	URuAJpP6Z97+ybqzBzb5QXUBOpjrYcSZExGoA43NfFWfY3ETIkMLsWj4WQkoOD5R8t5eqt+IGIS
	laVlq/a/nbMZIj5dra6UoYieaMc4Ym1v8ZaPg62AJnQpFUluf7XBCcxmYV8r9x3krbw+EiCAC4y
	8e8QAWoHrvtU/tO9OyViMpCGCIM5SrGtEiaJtm1K/Ld9lo/BgzHH2dE9zTs0mD1KoyTgs2QaqmH
	3Yqy4lGwUbxJ/nrb1ofveD/Xo+59L+BoLhqiaLKitUiwIHNYywF6e/eA0QTzfVmiwdzGh
X-Received: by 2002:a05:701b:2618:b0:1b1:4c25:b64e with SMTP id a92af1059eb24-1b25d334f8bmr734634c88.25.1793923645841;
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4e079esm371165c88.19.2026.11.05.16.07.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 16:07:25 -0800 (PST)
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
Subject: [PATCH v18 11/12] ALSA: virtio: prioritize staged capture period work
Date: Fri,  6 Nov 2026 09:06:43 +0900
Message-ID: <20261106000644.20460-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106000644.20460-1-mynameisjune111@gmail.com>
References: <20261106000644.20460-1-mynameisjune111@gmail.com>
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
 
