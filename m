Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981961;
	b=ZnyxhGPN7RZ/miGPmCZj4J72P7W58l4nCtAoDKRJAtPyPSMy27e/vY+rSEW+HhLySkej
	 k9df1+5Y38uT/D0tE/qE5sWPqaiTpjDJTkF/Nnoop+PA4oSeApb6wQJwOj5BiYfs6bKkY
	 MfL4/XjEY/PVYY+X/Vak4x34pJn13dW8QmIpZH/rsfWeGlyu/6OxXO+b3AzvokXFPNZUS
	 Kq09F1gNn2joT1Zz/mxOhVRWzlWWSbHxR33Z/5x4gv+IzJYeV7vTGULDS7E9UkyYLalM+
	 xhc3SAfX4w7c2xbt8vD5sXUi9Y3OgQWciRAFlelBdaK8jwY0tnZ0H9UwHjhDfLkdCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
	b=qadmfdX0TmSI7wVD/CXtua5aLM4mhq7PeeoDpDrBJznQvjgIMlUxtEHAo1KjWLklZbiw
	 yfn7/XQjXI9mjvoMghcTkDE7bZ+iiQbt5hapQIJKtOqLCFvNMWkDtMKFgknyOCtAYheUS
	 szE9VB1ud7leUHTGtuJWexC10OskmMgUi+xfy0KNXqnAgw36GyP5wBoOZXeCF7lQEcWbq
	 DT1Swb4buxJjHQHf/lQf6086SdBoU1i5OIdg4BmOiDT3famz+u2JocSB0yA/KJedaz+OH
	 8Kxquw38Sa7QgXq2I32nW2th58GUBCuu2agbWfWVjNYszwxGNaWS2LLtDz7A2a0kzBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CC7608361B
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:19:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49CC7608361B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lKBiL5kR
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so1493017c88.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793981961; x=1794586761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=lKBiL5kRm9gtUqJ1h+dHeCxWYpulv4/s2XsUQ2lNdJ7xrrd53veE3fraO6xmIx6SOB
         8Fbtf8ylUzysFcU0b4OY9xgKIdcWV/h3KNox8JSpZ/lLYOrMYYeiXN9wqdh66DK5rXrY
         6khmDRLKI3DAw+jgbwmkRJriI1oYK5AxVLhdA75BHHQpWbVl+Pz/aRXgS6JgAjB3EAgk
         PEMTklcvOXDkcX2Hm10J879LvhYmjhyWAhIyrRKKYoszFtcq7BNA1+SDwtvEmT7zixIS
         sPJibyUJlL1b5kwE1uQtjUqO1ur1JS5IAtRKYIa3kRIXCGAinSQiAa/hT8noUUV0PXVc
         IyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981961; x=1794586761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnXDhydnb2ccBc+HkqfRuBRFsa8PxXuzWixMqzpGlMU=;
        b=d3AXkRGvnSdc7sAsyUttplO3m7gOMUJyN0qh+8iuKAsnTrDnXJiw8ZnDim693j0YUY
         HDA8pU+pyDv7xZp9b3CJJI5QCyJgEtNjHoZXfabF5Vi82aQjXoMDduLShRZnxBcTzki1
         eY2qxoQJrf1XMFTuIScFCRqqqWA/VnLoqjQmRd2e7N1bbgC7n5zVsgpRvee7hvJUTeXk
         jMVniTqN0+PnmI1DrYTR26Y0zN7q7EVNuFBG7wCydDR6c2iYpHNlm785NLoWEY0c/Vrx
         BMUKA02PYxFTpMn5stMhxrzvcA7K08N5uGu3Rxg+4Bv5L/4DqYll+a1dUsBlscfv98Nw
         WXZQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4wveBAwHi5+U/MkvZ+r+g9AWiU23tns6XRGptsDquJCbwrGgR9Z0+g0dqB02tVJJY4V4t0qkhwak=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q36dOuqfWbE2k/7QCkKcLuccZ9w8XU8QaIqcPR3eJH0Ef9YJn
	8osUP/e2FGhndb1/I1zOBlyb8ZaVpYYY3R0B8xlpBIgsFnOWl30psS9m
X-Gm-Gg: AYBFou20cRCCCU8dI7vKKNSDmRHE55utNPudzjoo6I9FGStCL1SrAWK5IpvTpdabEIE
	m0iukAuKCf6Q5VuiKJzGacB85hP64CiDkgKe4pHsT9kBi1TjGyFaXKL6vqZ3tGV8g+w9I6O325k
	1HBxtvCz1cFNNMvv3Mnrm72QsPYUg/JrKoWrEY3DHBBDzbaL3KxXmr5yQdkQeI2eoVg3gsZ+LzO
	rLo69MsRbZztQYtBgpwJ59d5R87Auo93u7C77ogEUdW8XCZvNGkCf2jeUjzX5G84OJ7lVxMyXJm
	+iN3Ly1Dvv43amqLKXQ0H+EyLK46dwiD0bd+BtPYMv3xkQXsEvUjlSwjAn+mTWgZbpS9+Qfj5RJ
	V1ObXs7LRvu3IXzfSSGrYz7WiqFZQ8wJEt4SHkD68WA/Bosc5VJLLPWrSfVqNgP0X1ar/9MEx5h
	TfsSIe5IL5AZfa8v8C11Y4qcl+vhPMqDDOjo2rz5/hegULZq1mSt6iN3g5U802XcXfxmNCBdW3I
	EFNKN8o3MMP7atSSdUeEox/VglSy1mPWDqFF0/ofonEuy7blXQgNJQuDj7diHGGH0/+GlqBBIH0
	2qwNo2QIG0SUgLd21jAUm+iZY++JoWn05363g0Zll3hEdz2Crle26FMJa6J8iTqEV4rdivJqTvU
	F1+u4PXqqH1/o4PSutExfwg9qkzdaZ3aWd1XKQIt+XGqxpQ==
X-Received: by 2002:a05:701b:2719:b0:136:b50c:c0e9 with SMTP id a92af1059eb24-1b25d309c43mr3587753c88.21.1793981960370;
        Fri, 06 Nov 2026 08:19:20 -0800 (PST)
Received: from localhost.localdomain ([180.182.24.11])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm13139526c88.5.2026.11.06.08.19.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 08:19:19 -0800 (PST)
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
Subject: [PATCH v19 11/12] ALSA: virtio: prioritize staged capture period work
Date: Sat,  7 Nov 2026 01:18:37 +0900
Message-ID: <20261106161838.94308-12-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106161838.94308-1-mynameisjune111@gmail.com>
References: <20261106161838.94308-1-mynameisjune111@gmail.com>
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
 
