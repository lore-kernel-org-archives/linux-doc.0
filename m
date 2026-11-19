Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099775;
	b=dHhy7OGbC8VbQ5OXXH4zR/PlrO9PkUSXWBYSyJujCG1nOCApOB0nhjiVF5tVeJlEefv6
	 t6x41esI+IRVxVkYbhN9qnKydyTZSJcxVDDBFwFOfD7f7hc/hs9itb2DCip2mKtFAWznQ
	 Js/yrQFavzaem0RTN0HqpvGApajT9uOrW21ODazOsyMekL9jHte0y/Jz8j83dqPFJ2XFe
	 8PnuBd+8Z1PBcGY9rJhkKX70Bbl/xHHQpwSIfoTmxPkemXLjlEbs6vmmprlHlBZ2AKafp
	 sobFKFFdi/Usk6StpoKipdQ6eIHY38GXT9vMUO23eG4hFnQe0/vKW6nc6Gfdv1vAOjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=javDYOlSKSnRUR+PAm7aIV/PGJO5/77xvTL/UwSzQ6g=;
	b=u73G/DQrCVqJLK1RF0lAxGxUomY2IxACyQ80LGpTJhNPZzEBM4zUEESrSCMNr6dy8oQW
	 PrIC16BKGHkhb7Sq3atxh5XXDkcB9LgdNallG1agUVmsI+dsXN4a2Hs2bwENSLETJDMzA
	 m+6JeflxZAYRjB4ggsn4gazWFS3jfe0LBYM1BOxB9SRLLunK10Z68f6/GyP9vP7dx6iGg
	 FaTKD1jCiEZFmPJ81Wh9KIUyRkbZx6vLuNcEynTQV6whSWlqlehuyYeS/vd+n4M6Zp0WK
	 PZrtAcDaFpND2d1Ru+ehOIWkVpIlPkCZLSfUmcNlO251rYUoHEx70DYMt46Y2GFalSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNVI7guS;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02C2606A82F
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 14:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02C2606A82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vNVI7guS
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so24808215e9.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 06:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099773; x=1795704573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=javDYOlSKSnRUR+PAm7aIV/PGJO5/77xvTL/UwSzQ6g=;
        b=vNVI7guSXR1YnLaTDwk95nDHh13Aq3HuidZGpaXJKnQubI6FslHX+L5c7vO+nxTig6
         BwdY+2NVqNuHTuiEo00+55UR8J6AHEYFnL9/SEXSmwVQOHPHoLCaKsmdr+uZ1wegtIUD
         HjYJnlkd2E/AU+cIV6NCgPeE6k8thmzGBFTQxTx1Ckje97zsrbDBurrf4Nb/LzQfOMQt
         Dn1cDjoacJa3ARGe70IEOmsaSem9Bp+o0pSCcHl+kBd1qEKIU76giGz7PoYXhSbesyWZ
         NYWmnbx6mMMCYoKoaNdMyx/m1gHBb9RfmajgyfRnUB5eFxnmmMKyfsIZWQuEfGAnvbGg
         Sxqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099773; x=1795704573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=javDYOlSKSnRUR+PAm7aIV/PGJO5/77xvTL/UwSzQ6g=;
        b=eRAHCme1i+NiQL2J5gCPiwMqFlL4X9G140uIOoGPj93SqFUCJUcikhF9y9iKve64nS
         3pKBK5lZerYBkpVZQ+zIhG7dYBDmruFCZSPDCNOBILv6rRulDbgN7ri/dz7JLRamJVdv
         uA3JUNo+387y1NJs2sK3wNBFlHLGR7ioVnvhBc9++dLhi9/37a1HUJ2hao9X/K9fmrtk
         v5FR4JYbqSVxv/2mIknpct6Tf6t0Yxgez6hVxG4zxiS8mBiXV5+V076ZcqWlhiddNagG
         b4FwGwBjT7EZqijQ05S7Ue8kWi03iy9Rsv+rBasqfWIOknlgDseVmCE4PNlXlwdMCDGR
         ipnw==
X-Forwarded-Encrypted: i=1; AL+hErEPOs834HstObmLygY/U+3KiggN6TyPvVx9MSYaFczfxZMCNEXsQ633YXB6lKe9BxiRXb39TRKmV4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x0IAynyeR69s04Qb4fwqzazJEUlWfyQ5G9l6tkJEYkMUzs4uK
	3c74F7uiBaIE0JXeAjJRijWmiZftUYHdPV/W4j/zsYuksvHlt6V5Ijo/
X-Gm-Gg: AYBFou27lpLRotbmES3fSEMvo4lBElTNny5ZfrYSYzqQznPHoQ4TBRZMMYt1mXpIxO3
	hsJf65I9adDysCgobAhKKK67heTL1j9d/FSpEK9DKwPgCSlHwqzBtq98lV6QG/tu1bvnFp2Z8XU
	C8rRg22OLtmkPEZVXjNsb57DJEJWkibcJtK+oygqBKhKlDr/OJvW3yvFOj9VUQpxlahLXOJGEjm
	gp+Q1Tf0Q6BCfPFQHvXQj/kKpPCHuw8lFvQk3VMXv+DXcxaJJ80kDODR2Brg2Ec131MXiaY56Xd
	dgxAcrzFFqtAZJwPQ8x6pROdbUCxef0jOvi/6ky92Og1ZmTfB3yF5iBMkBYurK1FPMYuCFzqnx+
	/PiHFj8lhEs+o5Z1mRi2I1KRD6xhG+Xx0LedVjj93uhve7EAmrRT+UU7rhlHUbiuvKOWDoY1BDn
	KjQgEYoig1qVnNuxQ0MnJVBUE1hKaHtKQv8rqcbAJZbHx3cSQtknVgVVZbdurmTArd9+Nv4Rz24
	INbTGqMcCmG0cEz8BUWFGtM+3oX8BR7IrKP7rRz/Sf5oN7+F/0j8qrVNV3xW0Pmt+sHloUr32qq
	UFHtflIidrJE5tJ3gqQarGRr9ZDYEfwOJAZgOH6e4g==
X-Received: by 2002:a05:600c:3e14:b0:4bb:68c4:2044 with SMTP id 5b1f17b1804b1-4bb7da1390bmr116866125e9.11.1795099773163;
        Thu, 19 Nov 2026 06:49:33 -0800 (PST)
Received: from [10.111.176.198] ([2001:19f0:6c01:2c43:5400:5ff:fef6:1b30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm38881785e9.3.2026.11.19.06.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:49:32 -0800 (PST)
From: Oarora Etimis <oaroraetimis@gmail.com>
Date: Thu, 19 Nov 2026 15:49:07 +0100
Subject: [PATCH v4 1/2] drm/vkms: count the composer users
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
Message-Id: <20261119-composer-v4-1-5973fc9296ee@gmail.com>
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

The composer has one on/off switch, shared by the CRC reader and the
writeback jobs, so either of them can turn it off for the other.  Replace
the switch with a count of users:

  - the CRC source takes and drops one reference per open()/release(), and
    returns the error of a failed take, so that the open fails instead of
    leaving a release without a matching get();
  - a writeback job keeps whether the take succeeded and only drops a
    reference it actually took, because a job can be cleaned up after a
    commit that never reached the composer.

vkms_set_composer() becomes vkms_composer_get() and vkms_composer_put().

Fixes: dbd9d80c1b2e ("drm/vkms: Add support for writeback")
Signed-off-by: Oarora Etimis <oaroraetimis@gmail.com>
---
 Documentation/gpu/vkms.rst            |  5 -----
 drivers/gpu/drm/vkms/vkms_composer.c  | 39 +++++++++++++++++++++++++++--------
 drivers/gpu/drm/vkms/vkms_crtc.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.h       | 30 +++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_writeback.c |  7 ++++---
 5 files changed, 61 insertions(+), 22 deletions(-)

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
index 0fc915a954ba..9ff9e030ad13 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -711,19 +711,35 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 	return 0;
 }
 
-void vkms_set_composer(struct vkms_output *out, bool enabled)
+int vkms_composer_get(struct vkms_output *out)
 {
-	bool old_enabled;
+	unsigned int users;
+	int ret;
 
-	if (enabled)
-		drm_crtc_vblank_get(&out->crtc);
+	ret = drm_crtc_vblank_get(&out->crtc);
+	if (ret)
+		return ret;
+
+	spin_lock_irq(&out->lock);
+	users = out->composer_users++;
+	spin_unlock_irq(&out->lock);
+
+	/* All users share a single vblank reference. */
+	if (users)
+		drm_crtc_vblank_put(&out->crtc);
+
+	return 0;
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
 
@@ -734,8 +750,13 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 	int ret = 0;
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
+	if (ret)
+		return ret;
 
-	vkms_set_composer(out, enabled);
+	if (enabled)
+		return vkms_composer_get(out);
 
-	return ret;
+	vkms_composer_put(out);
+
+	return 0;
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
index dea6cad3f1b9..4f9f1614281a 100644
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
@@ -317,7 +320,26 @@ int vkms_verify_crc_source(struct drm_crtc *crtc, const char *source_name,
 
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
+ * Returns: 0 on success, or the error from drm_crtc_vblank_get() if no
+ * reference was taken.
+ */
+int vkms_composer_get(struct vkms_output *out);
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
index 858df1f89f66..8891e928930e 100644
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
 
+	active_wb->composer_wb_holds = !vkms_composer_get(output);
+
 	spin_lock_irq(&output->composer_lock);
 	crtc_state->active_writeback = active_wb;
 	crtc_state->wb_pending = true;

-- 
2.56.1

