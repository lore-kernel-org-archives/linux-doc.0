Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794182165;
	b=OhFubfIxtQg9K0fwR7SaHlMSDImV2on+yiQqk/+EWCER/4kJ5IjNbyheGuTT7vMD5c4W
	 XtieyPfqscXF2UEfH7iyP3oEQC81916PHCVJzoecJmPR/nDHntXH52konl8NydThCQr8l
	 6L+iOjT/YpNpgTW9hk5d8nF55Con7uqF+IdDpssraUH175kL8zgO5T2KyvGuSIHwKYauh
	 RZJ8QVXgqQL/JKPq0maEwFd/X9Z7Xyn81a/94omXoXmwv4rSA0h+3GDwu0oufTzHLta95
	 M06Lcnm0vdIAsNgfPg4YmPhyL7dOtyZnKSeqLdPlj6HNR2q/eMhT28dCzq3AVwmAQlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794182165;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=y1BwDjG4SOInc4FCgjkaZBBDMhEemw+tu4IOcCsZiN5hX54tx7fgqurHfCxClMn+vfgi
	 x1SWmbxAUDqTIXk3YKOLKJRS9jYiBNw9BWzqmiOVEiYc5re5Klpgb/RJb7aX8lYp3xtSW
	 xBeCZhaseMSBl9ON2mnGzJ8LLY2D/HlxZT+uBdmOT4dAAVSvuo/w4Mn/TC5rcdCGe50uW
	 22+EmMBT7bwkalEhpyvhVc1b9QLU86y75ZxDOp+QVTIgTKvwskfdw7ke/q1CrzEQ9IsxE
	 vTRNTrQ8ov8qn1l+3aV6PBhYMqxkql/syG72bVX/SCK2JuBPIdPG2T/a982SNwuOagw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80084606A333
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 23:56:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80084606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FfAXwHEp
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e985106c0cso2346115ad.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 15:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794182165; x=1794786965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=FfAXwHEpWz+7F0rrHdash2jTSoSQ/VDYiaYZGkeI4+fqILu3imbBO7P75zDlqnvBj2
         nB5OawEZC6CclFl8E1FYRHx60lCtuHBpNgs1D8Ier9+o2xN5Bj8qhIc9MnETY8vhz33Z
         P1vZjCDnqH9L8nrptg59oxzD8NR8DZ4Grt2aVnEkywGOKVc+xNrLfF3wnji0fERUAr/m
         d4QwOctjZCnEy5vDtqyoD8h5TXlRkoAKsr3UfrhEtRlGvF0iOqg0v4MevbttXMAyJ7fY
         H+e+VVYmnj6fmFC4hZZc3YCswqzSP17AIB3BC77XmzIzOtQpcNWgkgdL6khvkR/wp8dG
         Oq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794182165; x=1794786965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=cTBhmunVK4H606v9IoU8nZ59S6A6yICPNgB4yD1m7PFKlUcAjE0e+rB/Pd7LRdpe1U
         m+bAHAZoBsu0Od5yOgtL2ZrAgiY9nDy6Y0Y0Dm+UXibEVOSS6uHe0qRPTBHzncYxGxAL
         zBPchRELdDQbKbp+VqZqlzfI8yCrrUFpWkBSnU3dhh1sk0sIJd+crnLB2f49JC4kZpI6
         cOqUG/eXCJPx9C8OThAhvMAQUF1fKG+GdTfpdDb7ojOtQMvBS/zW5QCYvNIY6bH1hA94
         pQ/6/4+zD2IuD+d2vLIs1gPbzhnZeJcQTDhaIMT0sa9EamxkXPRXNN04kc2+UmxQvotP
         k+jA==
X-Forwarded-Encrypted: i=1; AL+hErG2We9qvvyvDdhawWyBQA6Mf0tuhf39zplj+6Z3AzMMCFzHIAWTgH3Zp4mSZ4hW/XAvs4EKl1IaYA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/s52B/z8jfxhaNlc74cqHwZE775hLLM14pzL4dV0j05foZjTPx
	oCneMTtk5VYp8wq1hTBVSnxDztFTo2oluvQIR4xD1CNeig6+lzwLD3pZ
X-Gm-Gg: AYBFou3tzGKXGPBH9BsXJ7Dxs+ZGDyZehc/1xh/6d4M1wL7gPbuQfzGy7o18wLwgx2E
	VKDvi9bF8G9Edlaf2BT8Z47AHBWTV0SzU9yI4FJCpTtKmZNso4LaL0T7y6kMvj/ud3Z+XfEezC3
	2wFWEFfgb1QO+yq9aIbR5zQ4bw0tJeKvxR7GZNzi614G6KGIHH+6J1YECyN1XeRjwd9TBCgeZfJ
	G9r7VpyrquLd3eg/OmYZUFn+wGnZwSuiWX0Yf2rAcms8ZyQ5RLPEeNWrzBgJ/rReuOYuw3tKELs
	cQnsnPJJ39n5kJkimgoUjORJags7Y5SnanMgi1CzR7PZ5B/29PV5Na1aWXoF6ysJt9Seik9Dmb6
	EQAXsSPA8zf2qN4yywSuHez0dB00+QUtZA9tly4O/a0fcqcDv+qnaUt9w5NG2HNQwmZQvQw5WEl
	Pf+wuKOzNxxakieqm7MAatL6ffr68IgUgvmAVU79Gh9PtYrGoz/ghDwpH+FFGRzi5Mr0HuF3/Df
	yuUzbAwZ1BIzXitLCupwEOc11IhnLvorAixNToHGM/HwjHBCUrY6Klk5Itxu02KpXN8zpFBEnFI
	OZ4nrU6R0svJ0y5lXHqI/4c4S3+Fm8MTpBPSht51EH1PLHDC7roSyjptaWaANRkl6+eYAFZFcOc
	U2EZ1ML3jcP3dX9Kv40s+Ublo3K5nM0UnE3Y3BdnTwQJLcw0=
X-Received: by 2002:a17:902:ec85:b0:2eb:4a05:4b4b with SMTP id d9443c01a7336-2ed837a9da8mr24182705ad.49.1794182164926;
        Sun, 08 Nov 2026 15:56:04 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81722edesm6095215ad.55.2026.11.08.15.55.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 15:56:03 -0800 (PST)
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
Subject: [PATCH v21 11/12] ALSA: virtio: prioritize staged capture period work
Date: Mon,  9 Nov 2026 08:54:56 +0900
Message-ID: <20261108235457.12688-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261108235457.12688-1-mynameisjune111@gmail.com>
References: <20261108235457.12688-1-mynameisjune111@gmail.com>
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
 
