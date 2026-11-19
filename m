Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095394;
	b=Yff9rJjToPnRPYrY5zqWKrDCRHUocmiI4GMw63hpYHIhixGW5lngdKw9+acSu5jJRqmn
	 XRc93PBQrwTIxghP7O1JYWVhJaKWvRz4gecdStQlzP+Ew/rTfvQqL3yDPPLwc/9neHBaK
	 U99Awh5QlU++1DUx8KA030qzJ2R13Zp3Wo+Llg6fcXncBZB9NvQDMl7nOJ6N0IQ5CDHwt
	 uwVdsCHnlvHcTW33XrXzXa0RrnT5nAvYgXHF5ItJuospLfpK007q1/+C8CnYqUs2M0rNh
	 k0YWgJS1zxTE7h+kvc5xlkRlCnQUQZe1YtpxRxU8+KrUImc29Vrm1ywPvkO39kN1tIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=4LNJl1KvBRoHPGDthD6nMoONkH1GEfbZ05kasQLsnCI=;
	b=vrCRHx3YzkjB0GMycr+ZnY/N9Wn0Q8VzUZmEPKTF4mo8/c/wpPlrjh7KNWPFD4fQtHcT
	 kpMz8fZxiEJpWwqtEHb5GCU+TH+EAF3wpHBYPjhoYjXPMtFnFoPVfMgpMYiQjvl+gkSIi
	 agg8kjyOYoHADPaWDonaSSNpdpn4gXBoRfBGwW92AqZ0HpCqcX9OEbSIBHUORh6wpO3kl
	 TF8oswMnyOlsAb6O/Ah6gTiR1xO1fBiaChM0fLvGx702hxiho+Tnjr8wtLrVRNE2u18OQ
	 zFY3gSS04k6A21CkYV9JVW/3seFr1ycHc79T9mHE8DKA3DKQyEf+qomyvyIvBisYOUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="lqj/8l+X";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A55606A324
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 13:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07A55606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lqj/8l+X
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso1437912f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 05:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095392; x=1795700192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LNJl1KvBRoHPGDthD6nMoONkH1GEfbZ05kasQLsnCI=;
        b=lqj/8l+XkyBjYtIZru+ljFagELi5Rb8X6ODw98JdYe+gv/xAyNiyMGnTo6Gg3NqufF
         E8/+DhU+hOAnOmCWK+/Me6uxkVlUOv9SjTh12CthfYcWxTsNipg+1LijvSUPHjksRQ0q
         /m6n80d1F10Uc96KPu1tuhDowo10GXp6boU9Yd/o2WzBW8Ak/22BbSSxVCNKV6lsFudo
         V8ZuZOYIp1LmohbHKGTN/uQe1Vmld/drXJvCYrfV1wDa/X5IJnftct3u6lVzcmq5rx3e
         HLzwEsrm+nSdh5fHCrC3oQOC65TNfgze+W3CO1/Ai8WxrhvYdrFQRNIqwRSy1U3+jwuK
         bfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095392; x=1795700192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LNJl1KvBRoHPGDthD6nMoONkH1GEfbZ05kasQLsnCI=;
        b=ONSqXWIAhA8NO0aNcbeEhtoYIoQY5qFI9iqiUqyimbG6DrMCmvA2SJryLegu3QcpAP
         vhNyQTKYSpGKB5uoD8/szJaPxDJrVVy2cpaqv2eYh7aoHltZjb0D9xHVzqUI5L15abML
         Ic/BnI9fO8zws/xnPY1inLnsoqsA/uWn//MNTZ5qyKnV/wyCJLyCHLkOA22/gP88wVe6
         ZI37HrLx2vANZTDmP/P7Qut0ssDFnHbIvrMU6dz6VpMXiitQDZYcqAf7z74hVypl1iAx
         V6Z0CukqKwbuE7tFWB4+BZNblvdCgVeJV50T5jhGBI3ggyhsL0j1rGiawjL9s2bVoWX/
         XxYg==
X-Forwarded-Encrypted: i=1; AL+hErHnME+t1+lW6QgvZoy6tV6WY0FwhClod/JQ1Za3RhZdyEoxx4YlpkMB7JzgQ1afdGyICpxvnY+GYq4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/libIxH98j/4aVBwUKEcy6LuWtixhWo666+qAQkhrCSHQsf37s
	qiXD26aqZl2Qw+qM/bps4OP9r69lkCvY3bXak3vHUiSFxOijRFdKzoCI
X-Gm-Gg: AZFdTZf4Uxpwr17cwAWfkSqpRpCpOp5F+rKRMB+a/+QoEdaWgZcARjxXreDi1sHOh/p
	vhCE+v1Zq2JNccLPGZLEZTXYT4qX2bHncI6F84nkosRM3+y4LnYDlVXrS1SyQa/IyrFX75tcdVH
	V2m5Gdk0QAQ/tgWm3FFv6AbXx8/M5K1KUjQnyrJ2ar+dXGIFg1nj1vcKkrgZ9cnyRwcATuYAqL+
	KNAZS7QRiB15NTHO0WekZ5BCbHDHqpADFyWJ/Ob0VaTJZ+gTfP3aO3Gm7C2mI8ocXeyH46w0hPy
	JQGJP+smdYvhlVQswcZER7F4x6PHqiDz0e3qJUtADE6qiflsSpAFpkLOl1XzV9awwUzT29rJSPt
	BXYsUP+tiftA7e8c08Bz9r0aSWDZ0K9SGMC9cBh7mcUgNyb0OeAjv8wlqIlHJgVO74f++jHrY1u
	BuZ1gZjx1eM6Gf0M2IVmWmyYC9IHV7AG36MvmqicM3JLpJ205TnQauo0BOAi5MnSJ2y7W6yVcs9
	4CFjuEvGdvC/RYVaR9VjxCnEITtY9QGR/lIGq34S10No4V2iMKLiG61P604Rvq9R9jPcZXCEhJA
	XwuubvImV+YFrkP/ww/OLs/xuuxCa3f5UZild1+Ylg==
X-Received: by 2002:a5d:5d81:0:b0:48d:fd4d:7fbe with SMTP id ffacd0b85a97d-4a6346da919mr13526484f8f.2.1795095392379;
        Thu, 19 Nov 2026 05:36:32 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573ba95csm11547911f8f.56.2026.11.19.05.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:36:31 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 14:36:03 +0100
Subject: [PATCH v3 1/2] drm/vkms: count the composer users
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
Message-Id: <20261119-composer-v3-1-dd470a820303@gmail.com>
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

The composer has one on/off switch, shared by the CRC reader and the
writeback jobs, so either of them can turn it off for the other.  Replace
the switch with a count of users:

  - the CRC source takes and drops one reference per open()/release(),
    which the core always pairs;
  - a writeback job keeps the value returned by vkms_composer_get() and
    only drops a reference it actually took, because a job can be cleaned
    up after a commit that never reached the composer.

vkms_set_composer() becomes vkms_composer_get() and vkms_composer_put().

Fixes: dbd9d80c1b2e ("drm/vkms: Add support for writeback")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 33 +++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 29 +++++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 55 insertions(+), 21 deletions(-)

diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
index 1e79e62a6bc4..fe7dc8def44a 100644
--- a/Documentation/gpu/vkms.rst
+++ b/Documentation/gpu/vkms.rst
@@ -246,11 +246,6 @@ module through configfs. Use/Test-cases:
 Writeback support
 -----------------
 
-- The writeback and CRC capture operations share the use of composer_enabled
-  boolean to ensure vblanks. Probably, when these operations work together,
-  composer_enabled needs to refcounting the composer state to proper work.
-  [Good to get started]
-
 - Add support for cloned writeback outputs and related test cases using a
   cloned output in the IGT kms_writeback.
 
diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 0fc915a954ba..96c40eeeb61b 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -711,19 +711,33 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+bool vkms_composer_get(struct vkms_output *out)
 {
-	bool old_enabled;
+	unsigned int users;
 
-	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+	if (drm_crtc_vblank_get(&out->crtc))
+		return false;
+
+	spin_lock_irq(&out->lock);
+	users = out->composer_users++;
+	spin_unlock_irq(&out->lock);
+
+	/* All users share a single vblank reference. */
+	if (users)
+		drm_crtc_vblank_put(&out->crtc);
+
+	return true;
+}
+
+void vkms_composer_put(struct vkms_output *out)
+{
+	unsigned int users;
 
 	spin_lock_irq(&out->lock);
-	old_enabled = out->composer_enabled;
-	out->composer_enabled = enabled;
+	users = --out->composer_users;
 	spin_unlock_irq(&out->lock);
 
-	if (old_enabled)
+	if (!users)
 		drm_crtc_vblank_put(&out->crtc);
 }
 
@@ -735,7 +749,10 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
-	vkms_set_composer(out, enabled);
+	if (enabled)
+		vkms_composer_get(out);
+	else
+		vkms_composer_put(out);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index fe17f49305a9..4e15abfd92a0 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -29,7 +29,7 @@ static bool vkms_crtc_handle_vblank_timeout(struct drm_crtc *crtc)
 	state = output->composer_state;
 	spin_unlock(&output->lock);
 
-	if (state && output->composer_enabled) {
+	if (state && READ_ONCE(output->composer_users)) {
 		u64 frame = drm_crtc_accurate_vblank_count(crtc);
 
 		/* update frame_start only if a queued vkms_composer_worker()
diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index dea6cad3f1b9..f245b64f8726 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -89,6 +89,8 @@ struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
 	pixel_write_t pixel_write;
+	/* Whether this job holds a reference to the composer. */
+	bool composer_wb_holds;
 };
 
 /**
@@ -210,8 +212,9 @@ struct vkms_crtc_state {
  *	       vblank timestamps
  * @composer_workq: Ordered workqueue for @composer_state.composer_work.
  * @lock: Lock used to protect concurrent access to the composer
- * @composer_enabled: Protected by @lock, true when the VKMS composer is active (crc needed or
- *		      writeback)
+ * @composer_users: Number of users that currently hold a composer reference; the composer
+ *		    is active only while it is non-zero. Updated under @lock and read with
+ *		    READ_ONCE() from the vblank timeout.
  * @composer_state: Protected by @lock, current state of this VKMS output
  * @composer_lock: Lock used internally to protect @composer_state members
  */
@@ -222,7 +225,7 @@ struct vkms_output {
 	struct workqueue_struct *composer_workq;
 	spinlock_t lock;
 
-	bool composer_enabled;
+	unsigned int composer_users;
 	struct vkms_crtc_state *composer_state;
 
 	spinlock_t composer_lock;
@@ -317,7 +320,25 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
 /* Composer Support */
 void vkms_composer_worker(struct work_struct *work);
-void vkms_set_composer(struct vkms_output *out, bool enabled);
+
+/**
+ * vkms_composer_get() - Take a composer reference
+ * @out: VKMS output
+ *
+ * The composer stays active while at least one reference is held.  Users
+ * whose get() and put() calls are not guaranteed to pair have to keep the
+ * return value and only call vkms_composer_put() for a reference they took.
+ *
+ * Returns: false if no reference was taken.
+ */
+bool vkms_composer_get(struct vkms_output *out);
+
+/**
+ * vkms_composer_put() - Drop a composer reference
+ * @out: VKMS output
+ */
+void vkms_composer_put(struct vkms_output *out);
+
 void vkms_writeback_row(struct vkms_writeback_job *wb, const struct line_buffer *src_buffer, int y);
 
 /* Writeback */
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 858df1f89f66..8ebeb8ceeaaf 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -118,7 +118,8 @@ static void vkms_wb_cleanup_job(struct drm_writeback_connector *connector,
 
 	drm_framebuffer_put(vkmsjob->wb_frame_info.fb);
 
-	vkms_set_composer(vkms_output, false);
+	if (vkmsjob->composer_wb_holds)
+		vkms_composer_put(vkms_output);
 	kfree(vkmsjob);
 }
 
@@ -141,11 +142,11 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	if (!conn_state)
 		return;
 
-	vkms_set_composer(output, true);
-
 	active_wb = conn_state->writeback_job->priv;
 	wb_frame_info = &active_wb->wb_frame_info;
 
+	active_wb->composer_wb_holds = vkms_composer_get(output);
+
 	spin_lock_irq(&output->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;

-- 
2.56.1

