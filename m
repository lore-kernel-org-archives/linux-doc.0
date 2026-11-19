Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092963;
	b=s2ZZjfSzOnnacDoEQLBUAlftbkyiw3iwwQyKGHDU5y8fHd3mcZ/kbDXC7MwQe3I0WqOr
	 NZ+xBYdPtZvuOBp66KDJxAngzqxKu+eREnSaxWmMEaIfTTu60tXmnL0bAY7+gIPUjMHvw
	 EipZvtn4IwjTnbexBcPLXWjMBRchwKlANLMA8wTwPgGI5hyLrB2eNa1OVS9Eg0Xt8C3Ac
	 hDgyOdZDqam217UeNGdeXviHYVhwJ5OQCDLTaJVWMDDYQeTfpeYoOwq7KJBBCGRZx6y6E
	 tmhA04iLW5Jq+6oy3irEMQS3O6RtxF7ebU1kiF9G275INIHSq8kIkMEiIdjgc/pDXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
	b=MPWr5XlmxWxkG+BfJUc2bjGVuEc4N2WA8M4dfTagdcCZbj2ntlRTekzDxFquEN7OqWiY
	 E/JYZoLGF+xP4TJEOSgO2fQA04t/3vbfcHthZu6LJKmboQj5Xnjabj+pEgTvNcJNgOfZ6
	 ewv6RqvHkvhB72TVfTzSL4KowfYWQv20hmziHkXqutZcw1RGNOR4dtnQghSeccTU5OGn5
	 Bq6rwAttsBersNZ0OXSpFBAk1ZR0qtrWdeFpMuVOEhe0zshCX99URQ3ZwR1AiPDTfTuo/
	 vvUkaxSBvm9cfEVqyApyFbOZLEl3l1ra0a1CaYIWNPI+hFoTNkjvGaDc3bNH0TSlByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgNLHSTY;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29990606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 12:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29990606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rgNLHSTY
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so18496715e9.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795092961; x=1795697761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=rgNLHSTYoJPGGseqZV+abEz/haJpQ1vp8BB0CJza5o/ZkXPspUE47GaZA8RSxgL0bD
         oP5xacrwDEc4gYCLswBC16lkj+dLLCf5I1Q3YaevBCv17/9hzl0MmvM5jf6dlNwUzPsn
         PX2BsIGlq+CdQneMVx6fheOR3hN9q3amHE+EFJbdXI81igi4xwQ+zQh1jURoWuP5YkLg
         soaOdbp/Uo+Hhjfu73OPdPS90B8pklNWPhBBr8WaoaQrl8wlnz83XMHexXd6llITkCtx
         lkK0o0TsF4XIaUxs2f8qHr83ELZcV/YcIWJuldrcVRnib9PUGIrMJkftInIdC9u1kuyD
         RzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092961; x=1795697761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DBKtZ8f4rQ06PM27Ke8dD/8/HlYVMBZ4lK4BrID9KOk=;
        b=kCl3w5gF9I0JK95Jn7QSUcuy4+TfkWmiGq5X3oeU6375jsz6zL8IHST+KxnRkEKDq6
         xAeqTNfzpgBQno8569XGtAFfkmhafDhhpEj5t0kEKHBiX8QmpeAEsb5UZBoYn1mIVqmG
         4414Bmaa7YZmqS98whxQt/8mU0gmuYvN3Bz7DQukjkApRbj+OlFMn4l2BV8FzyDJzE7U
         BJcRyzX2w+8PW3CVZaQL27JqC9ZWxWLKpssvonnMR1ZWjqYqnqL1StpbcZgpo2Dtqu+J
         XTH1RwtAQ9z5HAsjIYkEmU3awPxM6ho0Da+ICkx6HghSIUwy/vsOPUwEcMgeP4gcIjAA
         zCGA==
X-Forwarded-Encrypted: i=1; AL+hErEpvl3fMxLCoORXpXBlHuxhxdjE7Gk4L1C0LsDUoKKmuf5Wl0KWxZoQrXa00bLBHG/MOC8WUaNdKPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bkeC2xNMqoSavG9z4GJV+9PEhMgWORCdCIWgE3tpFPztusyGl
	Zht2AkVekCaD/d35B3dktFR4/MotdydI47hFJ5sJ1Ug7JCOTaHXqCLVo
X-Gm-Gg: AZFdTZfVpD7QhyefSiU2OmcM2BQPspCxdZdgQxzbq2bcxgCj/2SLo+Scxl7YdaGuu8C
	gmuINvL1zT03s3nocSKqRcZQBeKDUjJsyNyj5CnmgJaR9DaeWJNI5iQWvE7ikXjVXlKN0P0+2xl
	/dosNxbnNOrLiYBsY2/pkb8k16bCG/zJN7RbDQwMvHRGukqJhBF/MH5Q8L/0c4BGvScetTqzdA4
	2LWQlgs50m4YSIxzF/bz7DT6TOuIA08utTWYMoOgum3nf/fInkZDQM4Q8mulsH9LcOxY8kahE3K
	F1Gbn7EB4sISqyCQlE2dpNPa0PuOJ5a6sWm7iorqjICWM4N9id0YJl+4DYIzme8WFxE/FOVIe1/
	QV5V7Uud2Ab/TnHB9+2kTZ8w2AlU0zuEQ+yW2P0eYjzKe55rZpq0Rl488M30/M/NSFuWWVUgfmh
	m+vtAEvKOuUAWGBLsGtN+1RYJ+OulttZG1+qd5OftYpCE2bjpIG8En38LoipApgwv3oJozL6YiA
	7gUNraBh8xISW5reTm0Y7y9kVpOZns56buno3udCALLPujyvJyfURrs3RfXLkEqwecOfbXQIy4d
	qkCy+0nj5b7bNr5023qJL5Jf/vTSXCN+Fmi73M4NZiE51x5uP+OIuy61bzURcPc=
X-Received: by 2002:a05:6000:200c:b0:490:411a:1eed with SMTP id ffacd0b85a97d-4a63d2cf93emr12483342f8f.39.1795092961524;
        Thu, 19 Nov 2026 04:56:01 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a650d2e26csm10198193f8f.4.2026.11.19.04.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:56:01 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 13:55:27 +0100
Subject: [PATCH v2 2/2] drm/vkms: queue the composer work under the output
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
Message-Id: <20261119-composer-v2-2-a935e9bae6be@gmail.com>
References: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
In-Reply-To: <20261119-composer-v2-0-a935e9bae6be@gmail.com>
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

