Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099790;
	b=fB7P5emJ0fkkvpPsCDlVPONwNJmoef0RX7iGsnwhGhsPz+GOenIKjfnp4Ur9RJR66TkP
	 STwtR5l/qfZp0pD/d93uMWXPSLDRZuDHbLbzZT/S/FCSZ6AEgRkndq6p55U5+TQIL93PN
	 v6/OAxkV0qinTQRkkCh+Pq6BCCVe+B6Q5QY1cuXAACycQU+bqVE/6sPcWLXAdkJy16OZZ
	 xP5y3elLfeGqLEplc7Wv41vranRgZL3BQPl/4jlWvpW1DzG3xJKufPlbsA21d5IYMI4o2
	 2LFlmKczwSY7Shfn5spYKX+9oKH7rMvT/IKRcYu2DzFuAUbzCN7ngXHoSM7yFIlGd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
	b=Y8PhHXjXthcGkGz48Mb4k5Ccekou6OgU/UpOcV/o8K3rprRDpjmOxrx8xkMwD/eHffLt
	 WKNv4UFywl1yHmjcFm9sUsSCYFQrzGgYrHwBiW0cBH0oR/etlZX8bT1Oqtn9DhrhSFbzr
	 p0S+imHpAa3HEiQWmVu+A8Peb7ugDqfKNpbRjEAUonJ4qjSAxJ4Cd0esffY3c0QjuRw0G
	 9Llcs9Z/2n6a/DUgiB0fuYQhpwpF/ZwQJbg/dQz+w3pThZQxvc/DfkA2nyt164XwQ9Htf
	 QWm08vdwG8y3e/H2dmsZ1U38TOuIme1E82llcsPWPNB/rQDOhueDlqYa0EYo+akU79Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6fCl+45;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB23C606A800
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB23C606A800
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6fCl+45
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso22644275e9.3
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099788; x=1795704588; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
        b=x6fCl+45ixHaVzRWq9gW49enc7GiJtX3xFpujl8gDQW98Gc/4whXh7tQXkD5nnwgAh
         PUwZ8ot4cVOHw7iaFGA/QBQ1hJplVuPCTfBwXiRQbrLzHZFFFloL9vyORncckpR3V5AN
         ev3eGUTibtK2mhR3Q6eMuNKcLSxdsBdRbBbInSwnvAB6Ztlym9OvAaStZaFBl/7Bmsox
         YhMwdmnC8JMgPAgYgpbKdQ8rdlkQK80OVUHOG6oEljkXk5SBAACxbHrmwPar18yB4c6K
         9rIxtTKvWXGzfM9QRH+ro7UV1gZdFt0bR4sDIUj5emMKS6f714Qu9WCssEmm5uD55P3p
         xqEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099788; x=1795704588;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hgLxpH3LEm6Qly6PZhos0Gifa/hrNOwM+ajMDoFp79c=;
        b=gkcf9Fa+0P4lwRUfsixWTnrficZQ7jS4sDen4+s06D3j85W93E+9iPqKEjw7KZpfW5
         4M/RQ2JMDYPrdjMRoUGKrhPLJbPzvK82XXEDVctR8oEWB3rh3TuO85EFEsmQYmF1gmVT
         ucTqCTcFm0h6Qkm3X9TrPQr9ALlwYbYQvchPqOmAfcnhp4Kh3RoFNbh/B6S61Yi6CSFd
         Szo4Tz+mPqIcPon9JtO2QLPxRcLBsn5Kfo/pShqvxhi6NoXTiguiQiGXlhmn01hRSGX1
         CnJqyjBe/cG+MlfNWodFCoqZz3NBskoJFOzUH9IV+dAkNuEQ18QTM/LPj7A5HQ8dxIxS
         jeqg==
X-Forwarded-Encrypted: i=1; AL+hErHKEvWzY4pRM8fMcgWUMYGxzfJJc+GpvFt8xKi3U8PgjKvBKDQpphyePu9+v3tr1TlahHHbgFyebqQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8COydYRdKrD0nKy6nLbY3hAF6DatEyhTKsp0qqSsBArIu4oz1E
	X9pQUKcVA7V7xt7NI9DOP43UVRmZaxlAr9J0rwCM1sI9D2/K76w/Vd/F
X-Gm-Gg: AYBFou0ul0DJnBCxChOqL3cVDqR6ukEOkpff18GPF2VWM5JE8o19wRPbXOL7PBF5fOW
	8CFBbI0nCp+UC58M/3DFV67Kl52P1a1q7U36v96+J2jUCa+CxvlXCp/FTgDt8apEmijsVEPbory
	NVar8Zm5gW0DL+RJH+7JDLdO6tZqDd0fyaUv02lqgO7LGL6I03KfiSFesPRiZjpzu+uP8zQlc19
	mHltXLTcajfwvv47SZIXBIbNttVMnzw1Cn9eRm/ZK5xzxdU0309KWOm4a7mUucX9PF38WisWvBt
	yjVIYjuYbz/45qnaKq68vbzjJq3YBzko5u2LMvYf3w7wbwYLpPRQQa9R7Kx69WYOj8/trvC+IaK
	EAdGMtPtpweVL1w+gWTEu6kuxeKCIj6xg5RwfFT6KHmEUwbMuioVZT4g+IaVHkqKCD/51xcA+hg
	fohF/4qDrB+K+T70myhAzxIjmYaCeyfaLbBLNTBV5YTDHmCewTwNj0btr9WcBpfxHlQiW94xHxn
	QQSQjPodcvEtc0pFYHGtqfNrsjs+HOmQGWZ6DdO/DWV3PtSmXj2oSA5o1qWR5Utxc3NUw19h1JL
	s4Q2LMhbBy45U0/7nlhC9Z+umPG0BQ45Ezr8ubRYyA==
X-Received: by 2002:a05:600c:3b91:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4bb7da4647dmr143326545e9.32.1795099788158;
        Thu, 19 Nov 2026 06:49:48 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm38881785e9.3.2026.11.19.06.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:49:47 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 15:49:08 +0100
Subject: [PATCH v4 2/2] drm/vkms: queue the composer work under the output
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
Message-Id: <20261119-composer-v4-2-5973fc9296ee@gmail.com>
References: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
In-Reply-To: <20261119-composer-v4-0-5973fc9296ee@gmail.com>
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
queue can land on freed memory.  A legacy cursor update and a CRTC disable
both complete flip_done without waiting for a vblank, which is what makes
the window reachable.

Hold the lock across the frame accounting - including
drm_crtc_accurate_vblank_count() - and the queue, so the state that was
read is still the state that gets queued.

Fixes: 88ad7f3a5660 ("drm/vkms: Reduce critical section in vblank_simulate")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 5 ++---
 drivers/gpu/drm/vkms/vkms_drv.h  | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

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
 
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 4f9f1614281a..290eeb988498 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -213,8 +213,7 @@ struct vkms_crtc_state {
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
  * @composer_users: Number of users that currently hold a composer reference; the composer
- *		    is active only while it is non-zero. Updated under @lock and read with
- *		    READ_ONCE() from the vblank timeout.
+ *		    is active only while it is non-zero.  Updated and read under @lock.
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */

-- 
2.56.1

