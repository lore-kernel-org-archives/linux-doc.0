Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095403;
	b=OZCiLwcpoxxOTaDyvN7v2IH7nM8XvVwaZezseE7L4fzh/PCDeB+mNmHXpqLqeMp5/VCy
	 1FknbLMN6qR14nTCwa5LgNbIyedNWImShpr24h5CUp6hDgmKEVNqw19gXiuPiP/U4PQjC
	 +/a/uunRTSsNs0nNfBsrlcEH+I9TmPdwygJ60kh0MzgKvImp/UOaWlfoF+mdUwS60Dsiv
	 uRhpD8Ft+P1sDY/rqeqRDJAFmd6haj96wXT44k4n/qCYwXXLpEz3OzrLzUGAtURRc2Pzv
	 ElxVZNk7P06b+kA5ytzTI/cSeiuaqY5jpkUnfrtEdCpEaeKL02cX9zVcr4tGDnIB37A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
	b=INUfaOYT3Noi4arIWwTBa3XSWsLDDrSqdAu0jAzBnRncZFPBe7g5nQOkywG4BVqieqLK
	 fXgEAg6NwmQOjTNHDz7gAXPAUDpgKtmm70nMLCB0rd8e4l2pE4yjeebyJHN73GiSDskVf
	 Q70a55vpWm/MlCPTmXrrBtGg6vctsO5e878SUxE0v1Zvcc3/NhBQ3oMUneAmsNFLbmrOC
	 FwLEpoaJFTwPhL/cgdvIU2ukGNEhHT/k4i962p+ZaKf+UNL2S/m+t1M1OColFoEXesaHX
	 N7QhrvaeSxDKbUQ/5lV8vShBXt14Ob5x6wwTZucqYroJF8PFxzv9ZUSPPjq4mEiZCxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4qQ+EJT;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83990606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:36:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83990606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H4qQ+EJT
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so2057883f8f.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095402; x=1795700202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=H4qQ+EJT+0hEzIoPgYTz1jepaPSpvUK/Zo2h0MM0Yc8ArjFbvw3txZCErZzEUEz20m
         Jxuaj7j+0GGFEgcSC9FleY2yDJJUrfnwJan1bCNbL++COhoLWFcy937uIX8McA5GUFoz
         K8yP7BwMS+6veUjWGL+rnb2z1tjHgCy85x7sGKq1TMSamnbPxG61FSeVMNKN8uJMBLp1
         yTYNnVRYDjkvB4OXlvDD3cmpJ6n0+zXDab6aNoBgUInA40BzSHcxG07KI+6V9yC3DLaN
         3P6TrQVbiKC/UjCTg9+kHIIYMQyOrmmpqrCYDZYCQVMFDsW7D4BxaeaZeXbtlrhM/rHK
         skdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095402; x=1795700202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=0q20Qkez7CD9ieRHbeKQE3v/gR6q7bt6WdvF0+E9oUQYXeB/GsXAtVD1KOmKtLVzEU
         /luSzW1oy2yoe6YpMxqJtCLb73zZL+I454e6FYwA4k7IeHUlCMtgtiOTI2IyPvsDd0VV
         YqNJVHxyF2f/qj/aXXyGAzrmetQMJ/zeot/FgEqm7eaKRmoA2w81ZQ/aE/aoLx3p2w7e
         9nM0dCrgYQBaN/fy3neUfs0+Gasw/JmMVQW/e5n+lyQlbnQI5D0IkAW/uaG+wuBBPRMR
         gXfGRyU9ltH5NMQst0BeS6I3t+BHGkfFAPOwKSVpMFm3fYGYSnJPVNPNuGive6o5myos
         jH5A==
X-Forwarded-Encrypted: i=1; AL+hErFNnaRGg30eYWuRN2NP+ULLMgJ9Oy5HepHI+dXmWWn5/FA6hvPa604TRLFbqumX/huWQXo35GZZyGY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RDVCXTyH/K37++wn6E0zfrUyTjm9VRnAOO30weeiVjRAHZbRd
	crBxMYIZW41/beWyv4t4VeO6d80UV0/ukmzILCbg6Gr24rOO3VDr+hCD
X-Gm-Gg: AZFdTZcD9sxI1oaO/GzsnsIONv0HQIhi8Odc3wSmUOdLDhGo1fXH/oFgw/IujLwCBUZ
	6LnVenJuR1bxtNXy3JXJZ3n938Wu9ZmlwBxok6JuGKGgWwNZ+86kBp+MiulaWOWxJ2IYhyZvM96
	eG5cSvNrUMiDKKtWrIffdtGDdA9IlN2z8hs1aRHrSGKFgdak2qPKbNShfoV2qDQ9wc8hUVRiOMa
	yzc2q/A94PVm+PSHE1irDKYCuEGk02KkFkmVY1+PoDiB1oGdp3GjCg0a0l/r/LmMkTMUvOEy40X
	oe1/Ix2hOh72al6I3KS9caYaet/MpwF0eAvGGOUfzlqxCMBdcOz5QXsANFNWJSKqVWLYF47iFLk
	Xr0TvMpO8Su/+piKYJFYwtUpcgywrQ3tGIVlzopqVlaZ0JQUVwKK/ZOpb4jZu1lyWVZIouQKak2
	IgLpTbbxf8LxzsQf2Go7alrpVhLBv2OxLWP4ewVU7b3OgQ7z5lnYxeSRUSd9OEBz7yfQshqiuU2
	2lCZdc9iWmurljjh0ydsBIZvxqi3RiWlGKKUFQZs5nMcQpbSHL8DmDDfPtkIlvfVsYYUO41VRZl
	b5rOiW8E6/gC7nuLjsXrTDZ4+R34cnhzhr7CXWR0uA==
X-Received: by 2002:a05:6000:299c:20b0:49c:9e8a:31ad with SMTP id ffacd0b85a97d-4a63ab743f8mr8922005f8f.42.1795095401941;
        Thu, 19 Nov 2026 05:36:41 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11547911f8f.56.2026.11.19.05.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:41 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 14:36:04 +0100
Subject: [PATCH v3 2/2] drm/vkms: queue the composer work under the output
 lock
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-composer-v3-2-dd470a820303@gmail.com>
References: <20261119-composer-v3-0-dd470a820303@gmail.com>
In-Reply-To: <20261119-composer-v3-0-dd470a820303@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

vkms_crtc_handle_vblank_timeout() reads output->composer_state under
output->lock, then drops the lock and queues a work item that lives inside
that state.  The commit that retires the state frees it after flush_work(),
which does not wait for a work item that has not been queued yet, so the
queue can land on freed memory.

Hold the lock across the bookkeeping and the queue, so the state that was
read is still the state that gets queued.

Fixes: 88ad7f3a5660 ("drm/vkms: Reduce critical section in vblank_simulate")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 4e15abfd92a0..d2c6ffbad07c 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -27,9 +27,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 		DRM_ERROR("vkms failure on handling vblank");
 
 	state = output->composer_state;
-	spin_unlock(&output->lock);
-
-	if (state && READ_ONCE(output->composer_users)) {
+	if (state && output->composer_users) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
@@ -49,6 +47,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 		if (!ret)
 			DRM_DEBUG_DRIVER("Composer worker already queued\n");
 	}
+	spin_unlock(&output->lock);
 
 	dma_fence_end_signalling(fence_cookie);
 

-- 
2.56.1

