Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338031;
	b=TjoA4TXuktJ5ngyLRPLebKU5FHgEircvHVy1XTK5HCxkPvMSoVTDPDaIYQDofozF4W/4
	 F7saFW+bF0mz7cpSFNkc7VsDYCBNWptg4iFhcpi7PN9ZxhQsuRYAMECX229r9o4r5CTVQ
	 O2giG0DHspTMDprsC0BRCzEu3S7NX3k3Vi8QHIkpmOn+gMvZD6H4eaQtjFhf2RcXvKqxQ
	 xBiDbjwjwMAXxuxv3PHGes7Ur1AdRchy31V9Bzsg8bjOzlJNEEJZ41WTXrVSxl3C8+DWO
	 R7AktgEYYLMcprOBXKR2Qh6sEKGP19nC16cFjf7uH0EnunqAj40pbVH2fMdWSrFi9Sw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338031;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
	b=BdhfcWc2fJrTDVi6rk0/+/NtgrZLxr1xnWhdFbZH1ylzyJPo/PUsRVBRHsm/ODqbQ9oG
	 E3LH6ZX8FxULLYUJRzf+OBoNW29PWC1pg4KlQx3s0PQG1P87CMQ6PCg90w9CYQ9uik05/
	 9cvwfqJh3pZ8ti1M7Dbt5+KepqlGISRKsym6oFuGLbSj0j+dRbeoTuA7Lm7PnSUecjoXu
	 2bBHuxEyT4IgSp0FAfwzrfybA16UDobQOyJvUhO7MvSaOXexP2bZwnv2QVzQqRj/bFUuw
	 aiW5i6Q3HD0duosg2wezrM4oYa56VqPO1sySjRN9eWQAFRRp2v5rVype9JY6G90ISzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2781606A33C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 05:27:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2781606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QLvzlVs6
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so206539a91.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338029; x=1793942829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=QLvzlVs6hP0Up4p+b1uHdE/0OZ75yhCf3T3UuEsBrDPr095qMJQ0bX5rMO2IZt5ODL
         NEcMCJDKSNILAzntGoX7GInybOmFblYr9Vk0bWLxPLw8lwoAq/rmZxy0e5+4LYlTh3t/
         x24l9g4gadtmUiColcLZJErwDx4v21AWfc6KOewjcb4ZhI135rT8II8Ay+bcPv7sn5wI
         CyY0dOyWAlzcZoMJMRNV681+SDH50JfXwDgmUebcLg6gWuXT0sY+dUYt9ietWBw8NyB8
         1IvKL3BNJl8tyZNyNla4iu+lPGDqV/HgtE/8u7jHNAy5Q2FS491lCYRhkvVPVofBOayP
         /m2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338029; x=1793942829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cqhUqx0lysr6sCpQ4kFLl5TD33Z5oOALBO9Bt5uIT2U=;
        b=xizY6FbuKSDuUos2FJUfsIrgbcnlyONI3pm8YHwhKSFlJwFE8+rSGDXkym2T33AL3P
         V5m87dNDVTPn2+/o7lP/3AtGeykDCeVjakyt7LEOSERCM3ytkBuq9J3/Sh35Q3WcDn5W
         /gm7JaLoRE8GkgaG1FwNzi6S+5QpweLjJdwbbYUFexTr9qzebD3lcygJISd4OOp1knNM
         Jy/xVHYVrzhFHI2x/ZC3yASCRNUCaWP2VavOPriCXVX54/Sm6ZGGWy94yfHeFfJXR0Xm
         lsBXfaf/ACr5nydV3MbJmGpyXtJAmlzBebewsvls9O2gA9d17o4CfmRtnnZlPZO8ZGab
         vCVg==
X-Forwarded-Encrypted: i=1; AKwUvBzlgxKwQudENgrSn22A7k2lDLasX4LmXZP5gqS/+dYm5dmAZjC0J5GwvsVM2aHdrLGKekBOya6u8xY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUsQpji9/Uzk8OPMz3gVByGvypgZbO2XheaoG35dbNT1xyQGrk
	BwnwNCPZD85NQs/PplRoG8dbGDlTJTQTWY+66dH3tzroRNCSLPLJxF4y
X-Gm-Gg: AYBFou3BEFb5oLRs18z/m5gmxG7TqYhMhwI1Q5FStsFT7gK9vpliQCMI6lkQXI8Lnnm
	VrB91tVdI3qkaikulLPBk+8Xo4ijzgtSEn9Fi7QasIQZRgxh3BEx8s2wVMRA6w4mhHMyy8YQ8Iz
	3OHaRLnOE7v4XbOeF9RF4lPelhke8l/p28SoJpuWg2JJaG3W1KbBYPYDDHAwZW/xfwYoYhiijhD
	/li0Ibuu5QRyis+wbIbTx6uM+vZI5+RtR/W71swco9yEF1SljanqB9wOXrj5f4JGPI4jUIgN+Fd
	8+gINPunnia7q4gZmpbEtptBKNkpn4mKTUm30zDXqcH3UMn8/XzdTyvD4gLj4x8OhTylrkC9iJl
	BqJjyS+mxC1tu5zRy6YJP1fQ8igxsjpzxtxGemXWxheysCXLUpDbrkhLMHfA5g2gpFNzQdIZ3M6
	Z5syZaszY5DBgLviw3sYnU9BtCkId87qiMm8+e4TD+JBlOGFpxBVTPwEq1shNbkCr7cYQP2qSMl
	PWDbxtK759k0lSviKxJokBHSXcZZDvAlz3C0q2RtiuQ5Z7f4UR2G8RccAZfueaZUYk3vcYRMSek
	d/3FqejOXTGhaS633g/dHinaKnL+wyL6lN+ss2s73U3gV9JIZvQY/quOFJlsskDjJMqdXiUFWVE
	PqYUy1KAFKd4J5hnCE77tbYssOBx2vYuhScFuU16U3ISnYuc=
X-Received: by 2002:a17:90b:5827:b0:3ac:17c:6e74 with SMTP id 98e67ed59e1d1-3ae897c212emr943776a91.53.1793338029049;
        Thu, 29 Oct 2026 22:27:09 -0700 (PDT)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845429e6sm2421027a91.6.2026.10.29.22.27.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 22:27:08 -0700 (PDT)
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
Subject: [PATCH v10 10/14] ALSA: virtio: prioritize staged capture period work
Date: Fri, 30 Oct 2026 14:26:25 +0900
Message-ID: <20261030052629.27742-11-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030052629.27742-1-mynameisjune111@gmail.com>
References: <20261030052629.27742-1-mynameisjune111@gmail.com>
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
@@ -159,6 +159,10 @@
 static inline bool
 virtsnd_pcm_schedule_period_elapsed(struct virtio_pcm_substream *vss)
 {
+	if (vss->direction == SNDRV_PCM_STREAM_CAPTURE &&
+	    vss->capture_staging)
+		return queue_work(system_highpri_wq, &vss->elapsed_period);
+
 	return schedule_work(&vss->elapsed_period);
 }
 
